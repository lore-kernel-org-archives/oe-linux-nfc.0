Content-Type: multipart/mixed; boundary="===============5145460931752776008=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 12/16] ndef: check UTF-16 text payload length
Date: Sat, 10 Jul 2021 05:38:55 +0200
Message-ID: <20210710033859.3989-13-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5145460931752776008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

UTF-16 is supposed to be consisting of 16-bit codes (16-bit or 2x16-bit
per character) and parsing anything else is not safe because of cast to
gunichar2.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/ndef.c             |  5 +++++
 unit/test-ndef-parse.c | 19 +++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/src/ndef.c b/src/ndef.c
index 3d8815634d46..fdd44b467027 100644
--- a/src/ndef.c
+++ b/src/ndef.c
@@ -1189,6 +1189,11 @@ parse_text_payload(uint8_t *payload, uint32_t length)
 =

 	len =3D length - lang_length - 1;
 =

+	if (status && (len % 2)) {
+		DBG("Payload not valid UTF-16 (length %d does not match)", len);
+		goto fail;
+	}
+
 	if (len > 0) {
 		txt =3D (char *)(payload + offset);
 =

diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index d26f4c595d9a..6c62c7a928c7 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -150,6 +150,15 @@ static uint8_t text[] =3D {0xd1, 0x1, 0x13, 0x54, 0x5,=
 0x65, 0x6e, 0x2d,
 			 0x55, 0x53, 0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0xc5,
 			 0xbc, 0xc3, 0xb3, 0xc5, 0x82, 0x77};
 =

+/* 'hello =C5=BC=C3=B3=C5=82w' - UTF-16 - en-US Text NDEF UTF-16 malformed=
*/
+static uint8_t text_utf16_invalid[] =3D {0xd1, 0x1, 0x19, 0x54, 0x85,
+			/* en-US */
+			0x65, 0x6e, 0x2d, 0x55, 0x53,
+			/* hello =C5=BC=C3=B3=C5=82w */
+			0x68, 0x00, 0x65, 0x00, 0x6c, 0x00, 0x6c, 0x00, 0x6f, 0x00,
+			/* Missing last byte */
+			0x20, 0x00, 0x7c, 0x01, 0xf3, 0x00, 0x42, 0x01, 0x77};
+
 /* Smart poster with a http://intel.com URI record */
 static uint8_t single_sp[] =3D {0xd1, 0x2, 0xe, 0x53, 0x70, 0xd1, 0x1, 0xa,
 			      0x55, 0x3, 0x69, 0x6e, 0x74, 0x65, 0x6c, 0x2e,
@@ -253,6 +262,15 @@ static void test_ndef_text(void)
 	test_ndef_free_record(record);
 }
 =

+static void test_ndef_text_invalid_utf16(void)
+{
+	GList *records;
+
+	records =3D near_ndef_parse_msg(text_utf16_invalid, sizeof(text_utf16_inv=
alid), NULL);
+
+	g_assert_null(records);
+}
+
 static void test_ndef_single_sp(void)
 {
 	GList *records;
@@ -422,6 +440,7 @@ int main(int argc, char **argv)
 =

 	g_test_add_func("/testNDEF-parse/Test URI NDEF", test_ndef_uri);
 	g_test_add_func("/testNDEF-parse/Test Text NDEF", test_ndef_text);
+	g_test_add_func("/testNDEF-parse/Test Text NDEF UTF-16 malformed", test_n=
def_text_invalid_utf16);
 	g_test_add_func("/testNDEF-parse/Test Single record SmartPoster NDEF",
 							test_ndef_single_sp);
 	g_test_add_func("/testNDEF-parse/Test Title record SmartPoster NDEF",
-- =

2.27.0

--===============5145460931752776008==--

