Content-Type: multipart/mixed; boundary="===============7600286989831511608=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 18/73] se: silence clang -Wcast-align warning
Date: Mon, 19 Jul 2021 13:07:24 +0200
Message-ID: <20210719110819.27340-19-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7600286989831511608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix clang warnings:

    se/ace.c:147:15: error: cast from 'uint8_t *' (aka 'unsigned char *') t=
o 'struct seel_ace_apdu_rule *' increases required alignment from 1 to 4 [-=
Werror,-Wcast-align]
                    apdu_rule =3D (struct seel_ace_apdu_rule *)rule->apdu_r=
ules;
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
    se/ace.c:790:18: error: cast from 'uint8_t *' (aka 'unsigned char *') t=
o 'uint32_t *' (aka 'unsigned int *') increases required alignment from 1 t=
o 4 [-Werror,-Wcast-align]
            apdu_header =3D *((uint32_t *) apdu);
                            ^~~~~~~~~~~~~~~~~
    se/ace.c:791:14: error: cast from 'uint8_t *' (aka 'unsigned char *') t=
o 'struct seel_ace_apdu_rule *' increases required alignment from 1 to 4 [-=
Werror,-Wcast-align]
            apdu_rule =3D (struct seel_ace_apdu_rule *)rule->apdu_rules;
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Increasing alignment should be fine for most of the platforms (maybe
except some performance penalty), although there are such which might
not handle it and raise CPU exception.  I am not sure whether the code
is actually safe, but proper fixing would require bigger changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 se/ace.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/se/ace.c b/se/ace.c
index c1561abae8c1..ef0e7e15fbf7 100644
--- a/se/ace.c
+++ b/se/ace.c
@@ -144,7 +144,18 @@ static void dump_rule(gpointer data, gpointer user_dat=
a)
 		uint8_t *header, *mask;
 		size_t n_rules;
 =

-		apdu_rule =3D (struct seel_ace_apdu_rule *)rule->apdu_rules;
+		/*
+		 * (void *) to silence -Wcast-align. Code should be safe
+		 * (assuming platform handles unaliagned access) as iterations
+		 * go up to n_rules.
+		 *
+		 * TODO: Fix the problem instead of silencing with cast, so
+		 * the code would be porable.
+		 */
+		if (rule->apdu_rules_len % sizeof(struct seel_ace_apdu_rule *)) {
+			DBG("  APDU: wrong alignment (Bug, code needs fixing)");
+		}
+		apdu_rule =3D (struct seel_ace_apdu_rule *)(void *)rule->apdu_rules;
 		n_rules =3D rule->apdu_rules_len /
 				sizeof(struct seel_ace_apdu_rule);
 =

@@ -787,8 +798,21 @@ static bool apdu_allowed(struct seel_ace_rule *rule,
 =

 	n_rules =3D rule->apdu_rules_len /
 				sizeof(struct seel_ace_apdu_rule);
-	apdu_header =3D *((uint32_t *) apdu);
-	apdu_rule =3D (struct seel_ace_apdu_rule *)rule->apdu_rules;
+	/*
+	 * FIXME: apdu comes from message and where is checking for apdu_len?
+	 * The (void *) is to fix -Wcast-align but the actual problem is
+	 * whether the apdu contains enough of data.
+	 */
+	apdu_header =3D *((uint32_t *)(void *) apdu);
+	/*
+	 * (void *) to silence -Wcast-align. Code should be safe
+	 * (assuming platform handles unaliagned access) as iterations
+	 * go up to n_rules.
+	 *
+	 * TODO: Fix the problem instead of silencing with cast, so
+	 * the code would be porable.
+	 */
+	apdu_rule =3D (struct seel_ace_apdu_rule *)(void *)rule->apdu_rules;
 =

 	for (i =3D 0; i < n_rules; i++) {
 		if ((apdu_header & apdu_rule->mask) =3D=3D apdu_rule->header)
-- =

2.27.0

--===============7600286989831511608==--

