Content-Type: multipart/mixed; boundary="===============6627016644593480066=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 52/73] unit: do not shadow global 'uri' variable (-Wshadow)
Date: Mon, 19 Jul 2021 13:07:58 +0200
Message-ID: <20210719110819.27340-53-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6627016644593480066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix -Wshadow warnings like:

    unit/test-ndef-parse.c: In function =E2=80=98test_ndef_single_sp=E2=80=
=99:
    unit/test-ndef-parse.c:291:32: error: declaration of =E2=80=98uri=E2=80=
=99 shadows a global declaration [-Werror=3Dshadow]
      291 |  struct near_ndef_uri_payload *uri;
          |                                ^~~
    unit/test-ndef-parse.c:145:16: note: shadowed declaration is here
      145 | static uint8_t uri[] =3D {0xd1, 0x1, 0xa, 0x55, 0x1, 0x69, 0x6e=
, 0x74,
          |                ^~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-parse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index 67de3f2e77bd..f8b3b7be3a4c 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -142,7 +142,7 @@ struct near_ndef_ac_payload {
 };
 =

 /* http://www.intel.com URI NDEF */
-static uint8_t uri[] =3D {0xd1, 0x1, 0xa, 0x55, 0x1, 0x69, 0x6e, 0x74,
+static uint8_t test_uri[] =3D {0xd1, 0x1, 0xa, 0x55, 0x1, 0x69, 0x6e, 0x74,
 			0x65, 0x6c, 0x2e, 0x63, 0x6f, 0x6d};
 =

 /* 'hello =C5=BC=C3=B3=C5=82w' - UTF-8 - en-US Text NDEF */
@@ -203,7 +203,7 @@ static void test_ndef_uri(void)
 	GList *records;
 	struct near_ndef_record *record;
 =

-	records =3D near_ndef_parse_msg(uri, sizeof(uri), NULL);
+	records =3D near_ndef_parse_msg(test_uri, sizeof(test_uri), NULL);
 =

 	g_assert(records);
 	g_assert_cmpuint(g_list_length(records), =3D=3D, 1);
-- =

2.27.0

--===============6627016644593480066==--

