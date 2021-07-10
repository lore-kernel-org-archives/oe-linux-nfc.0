Content-Type: multipart/mixed; boundary="===============1456767342727745289=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 11/16] unit: pass real UTF-8 for testing text NDEF
Date: Sat, 10 Jul 2021 05:38:54 +0200
Message-ID: <20210710033859.3989-12-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1456767342727745289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Let's polish this UTF-8. :)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-parse.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index 8cfdc8f2cb9d..d26f4c595d9a 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -145,9 +145,10 @@ struct near_ndef_ac_payload {
 static uint8_t uri[] =3D {0xd1, 0x1, 0xa, 0x55, 0x1, 0x69, 0x6e, 0x74,
 			0x65, 0x6c, 0x2e, 0x63, 0x6f, 0x6d};
 =

-/* 'hello' - UTF-8 - en-US Text NDEF */
-static uint8_t text[] =3D {0xd1, 0x1, 0xb, 0x54, 0x5,  0x65, 0x6e, 0x2d,
-			 0x55, 0x53, 0x68, 0x65, 0x6c, 0x6c, 0x6f};
+/* 'hello =C5=BC=C3=B3=C5=82w' - UTF-8 - en-US Text NDEF */
+static uint8_t text[] =3D {0xd1, 0x1, 0x13, 0x54, 0x5, 0x65, 0x6e, 0x2d,
+			 0x55, 0x53, 0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0xc5,
+			 0xbc, 0xc3, 0xb3, 0xc5, 0x82, 0x77};
 =

 /* Smart poster with a http://intel.com URI record */
 static uint8_t single_sp[] =3D {0xd1, 0x2, 0xe, 0x53, 0x70, 0xd1, 0x1, 0xa,
@@ -234,7 +235,7 @@ static void test_ndef_text(void)
 	g_assert(record->header->me =3D=3D 1);
 =

 	g_assert(record->text);
-	g_assert(strcmp(record->text->data, "hello") =3D=3D 0);
+	g_assert(strcmp(record->text->data, "hello =C5=BC=C3=B3=C5=82w") =3D=3D 0=
);
 	g_assert(strcmp(record->text->encoding, "UTF-8") =3D=3D 0);
 	g_assert(strcmp(record->text->language_code, "en-US") =3D=3D 0);
 =

-- =

2.27.0

--===============1456767342727745289==--

