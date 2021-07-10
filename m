Content-Type: multipart/mixed; boundary="===============8672167474351524986=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 14/16] ndef: fix parsing of UTF-16 text payload
Date: Sat, 10 Jul 2021 05:38:57 +0200
Message-ID: <20210710033859.3989-15-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8672167474351524986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The string

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/ndef.c             | 22 ++++++++++++++--------
 unit/test-ndef-parse.c | 27 ++++++++++++++++++++-------
 2 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/src/ndef.c b/src/ndef.c
index 13e3356c2c4c..093eba910027 100644
--- a/src/ndef.c
+++ b/src/ndef.c
@@ -1150,7 +1150,8 @@ parse_text_payload(uint8_t *payload, uint32_t length)
 {
 	struct near_ndef_text_payload *text_payload =3D NULL;
 	uint8_t status, lang_length, len;
-	char *g_str, *txt;
+	char *g_str =3D NULL;
+	char *txt;
 	uint32_t offset;
 	gboolean valid;
 =

@@ -1189,9 +1190,12 @@ parse_text_payload(uint8_t *payload, uint32_t length)
 =

 	len =3D length - lang_length - 1;
 =

-	if (status && (len % 2)) {
-		DBG("Payload not valid UTF-16 (length %d does not match)", len);
-		goto fail;
+	if (status) {
+		if (len % 2) {
+			DBG("Payload not valid UTF-16 (length %d does not match)", len);
+			goto fail;
+		}
+		len /=3D 2;
 	}
 =

 	if (len > 0) {
@@ -1206,13 +1210,13 @@ parse_text_payload(uint8_t *payload, uint32_t lengt=
h)
 =

 		valid =3D g_utf8_validate(g_str, len, NULL);
 =

-		if (status)
-			g_free(g_str);
-
 		if (!valid)
 			goto fail;
 =

-		text_payload->data =3D g_strndup(txt, len);
+		/* FIXME: this won't parse properly UTF-8 */
+		text_payload->data =3D g_strndup(g_str, len);
+		if (status)
+			g_free(g_str);
 	} else {
 		text_payload->data =3D NULL;
 	}
@@ -1227,6 +1231,8 @@ parse_text_payload(uint8_t *payload, uint32_t length)
 	return text_payload;
 =

 fail:
+	if (status)
+		g_free(g_str);
 	near_error("text payload parsing failed");
 	free_text_payload(text_payload);
 =

diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index 6c62c7a928c7..073b36ac48ff 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -146,9 +146,16 @@ static uint8_t uri[] =3D {0xd1, 0x1, 0xa, 0x55, 0x1, 0=
x69, 0x6e, 0x74,
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
+
+/* 'hello' - UTF-16 - en-US Text NDEF */
+static uint8_t text_utf16[] =3D {0xd1, 0x1, 0x10, 0x54, 0x85,
+			/* en-US */
+			0x65, 0x6e, 0x2d, 0x55, 0x53,
+			/* hello =C5=BC=C3=B3=C5=82w */
+			0x68, 0x00, 0x65, 0x00, 0x6c, 0x00, 0x6c, 0x00, 0x6f, 0x00};
 =

 /* 'hello =C5=BC=C3=B3=C5=82w' - UTF-16 - en-US Text NDEF UTF-16 malformed=
*/
 static uint8_t text_utf16_invalid[] =3D {0xd1, 0x1, 0x19, 0x54, 0x85,
@@ -227,12 +234,12 @@ static void test_ndef_uri(void)
 	test_ndef_free_record(record);
 }
 =

-static void test_ndef_text(void)
+static void test_ndef_text_encoding(uint8_t *text, size_t len, const char =
*encoding, const char *expected)
 {
 	GList *records;
 	struct near_ndef_record *record;
 =

-	records =3D near_ndef_parse_msg(text, sizeof(text), NULL);
+	records =3D near_ndef_parse_msg(text, len, NULL);
 =

 	g_assert(records);
 	g_assert(g_list_length(records) =3D=3D 1);
@@ -244,8 +251,8 @@ static void test_ndef_text(void)
 	g_assert(record->header->me =3D=3D 1);
 =

 	g_assert(record->text);
-	g_assert(strcmp(record->text->data, "hello =C5=BC=C3=B3=C5=82w") =3D=3D 0=
);
-	g_assert(strcmp(record->text->encoding, "UTF-8") =3D=3D 0);
+	g_assert(strcmp(record->text->data, expected) =3D=3D 0);
+	g_assert(strcmp(record->text->encoding, encoding) =3D=3D 0);
 	g_assert(strcmp(record->text->language_code, "en-US") =3D=3D 0);
 =

 	if (g_test_verbose()) {
@@ -262,6 +269,12 @@ static void test_ndef_text(void)
 	test_ndef_free_record(record);
 }
 =

+static void test_ndef_text(void)
+{
+	test_ndef_text_encoding(text_utf8, sizeof(text_utf8), "UTF-8", "hello =C5=
=BC=C3=B3=C5=82w");
+	test_ndef_text_encoding(text_utf16, sizeof(text_utf16), "UTF-16", "hello"=
);
+}
+
 static void test_ndef_text_invalid_utf16(void)
 {
 	GList *records;
-- =

2.27.0

--===============8672167474351524986==--

