Content-Type: multipart/mixed; boundary="===============4640523445153814564=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 13/16] ndef: silence clang -Wcast-align warning
Date: Sat, 10 Jul 2021 05:38:56 +0200
Message-ID: <20210710033859.3989-14-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4640523445153814564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix clang warning:

    src/ndef.c:1196:28: error: cast from 'char *' to 'gunichar2 *' (aka 'un=
signed short *') increases required alignment from 1 to 2 [-Werror,-Wcast-a=
lign]
                            g_str =3D g_utf16_to_utf8((gunichar2 *)txt, len=
, NULL,
                                                    ^~~~~~~~~~~~~~~~

The case is safe as length of string is an even number.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/ndef.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/ndef.c b/src/ndef.c
index fdd44b467027..13e3356c2c4c 100644
--- a/src/ndef.c
+++ b/src/ndef.c
@@ -1198,7 +1198,8 @@ parse_text_payload(uint8_t *payload, uint32_t length)
 		txt =3D (char *)(payload + offset);
 =

 		if (status)
-			g_str =3D g_utf16_to_utf8((gunichar2 *)txt, len, NULL,
+			/* Cast to void to silence the 1-to-2 alignment warning */
+			g_str =3D g_utf16_to_utf8((gunichar2 *)(void *)txt, len, NULL,
 						NULL, NULL);
 		else
 			g_str =3D txt;
-- =

2.27.0

--===============4640523445153814564==--

