Content-Type: multipart/mixed; boundary="===============4479042140381223228=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 51/73] unit: do not shadow global 'text' variable (-Wshadow)
Date: Mon, 19 Jul 2021 13:07:57 +0200
Message-ID: <20210719110819.27340-52-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4479042140381223228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix -Wshadow warning:

unit/test-ndef-parse.c: In function =E2=80=98test_ndef_title_sp=E2=80=99:
unit/test-ndef-parse.c:194:33: error: declaration of =E2=80=98text=E2=80=99=
 shadows a global declaration [-Werror=3Dshadow]
  194 |  struct near_ndef_text_payload *text;
      |                                 ^~~~
unit/test-ndef-parse.c:42:16: note: shadowed declaration is here
   42 | static uint8_t text[] =3D {0xd1, 0x1, 0x13, 0x54, 0x5, 0x65, 0x6e, =
0x2d,
      |                ^~~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-parse.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index 96288f29f44d..67de3f2e77bd 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -146,9 +146,9 @@ static uint8_t uri[] =3D {0xd1, 0x1, 0xa, 0x55, 0x1, 0x=
69, 0x6e, 0x74,
 			0x65, 0x6c, 0x2e, 0x63, 0x6f, 0x6d};
 =

 /* 'hello =C5=BC=C3=B3=C5=82w' - UTF-8 - en-US Text NDEF */
-static uint8_t text[] =3D {0xd1, 0x1, 0x13, 0x54, 0x5, 0x65, 0x6e, 0x2d,
-			 0x55, 0x53, 0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0xc5,
-			 0xbc, 0xc3, 0xb3, 0xc5, 0x82, 0x77};
+static uint8_t text_utf8[] =3D {0xd1, 0x1, 0x13, 0x54, 0x5, 0x65, 0x6e, 0x=
2d,
+			0x55, 0x53, 0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0xc5,
+			0xbc, 0xc3, 0xb3, 0xc5, 0x82, 0x77};
 =

 /* 'hello =C5=BC=C3=B3=C5=82w' - UTF-16 - en-US Text NDEF UTF-16 malformed=
*/
 static uint8_t text_utf16_invalid[] =3D {0xd1, 0x1, 0x19, 0x54, 0x85,
@@ -232,7 +232,7 @@ static void test_ndef_text(void)
 	GList *records;
 	struct near_ndef_record *record;
 =

-	records =3D near_ndef_parse_msg(text, sizeof(text), NULL);
+	records =3D near_ndef_parse_msg(text_utf8, sizeof(text_utf8), NULL);
 =

 	g_assert(records);
 	g_assert_cmpuint(g_list_length(records), =3D=3D, 1);
-- =

2.27.0

--===============4479042140381223228==--

