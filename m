Content-Type: multipart/mixed; boundary="===============8138396436097439195=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 45/73] unit: use g_assert_cmpstr()
Date: Mon, 19 Jul 2021 13:07:51 +0200
Message-ID: <20210719110819.27340-46-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8138396436097439195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Comparisons of simple values should use test macros instead of checking
standard library call return value.  This prints more information:

g_assert():
    ERROR:unit/test-ndef-parse.c:256:test_ndef_text_encoding: assertion fai=
led: (strcmp(record->text->language_code, "en-US1") =3D=3D 0)

g_assert_cmpstr():
    ERROR:unit/test-ndef-parse.c:256:test_ndef_text_encoding: assertion fai=
led (record->text->language_code =3D=3D "en-US1"): ("en-US" =3D=3D "en-US1")

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-parse.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index 6c62c7a928c7..91dc1f7c185e 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -244,9 +244,9 @@ static void test_ndef_text(void)
 	g_assert(record->header->me =3D=3D 1);
 =

 	g_assert(record->text);
-	g_assert(strcmp(record->text->data, "hello =C5=BC=C3=B3=C5=82w") =3D=3D 0=
);
-	g_assert(strcmp(record->text->encoding, "UTF-8") =3D=3D 0);
-	g_assert(strcmp(record->text->language_code, "en-US") =3D=3D 0);
+	g_assert_cmpstr(record->text->data, =3D=3D, "hello =C5=BC=C3=B3=C5=82w");
+	g_assert_cmpstr(record->text->encoding,=3D=3D,  "UTF-8");
+	g_assert_cmpstr(record->text->language_code, =3D=3D, "en-US");
 =

 	if (g_test_verbose()) {
 		g_print("NDEF Text data: %s\n", record->text->data);
@@ -349,9 +349,9 @@ static void test_ndef_title_sp(void)
 		g_print("NDEF SP URI field: %.*s\n", uri->field_length,
 							(char *) uri->field);
 =

-	g_assert(strcmp(text->data, "Intel") =3D=3D 0);
-	g_assert(strcmp(text->encoding, "UTF-8") =3D=3D 0);
-	g_assert(strcmp(text->language_code, "en") =3D=3D 0);
+	g_assert_cmpstr(text->data, =3D=3D, "Intel");
+	g_assert_cmpstr(text->encoding, =3D=3D, "UTF-8");
+	g_assert_cmpstr(text->language_code, =3D=3D, "en");
 =

 	if (g_test_verbose()) {
 		g_print("NDEF SP Title data: %s\n", text->data);
@@ -389,7 +389,7 @@ static void test_ndef_aar(void)
 =

 	g_assert(record->aar);
 	g_assert(record->aar->package);
-	g_assert(strcmp((char *) record->aar->package, "com.example.aar") =3D=3D =
0);
+	g_assert_cmpstr((char *) record->aar->package, =3D=3D, "com.example.aar");
 =

 =

 	if (g_test_verbose())
@@ -431,7 +431,7 @@ static void test_ndef_ho_hs_bt(void)
 =

 	records =3D g_list_next(records);
 	record =3D records->data;
-	g_assert(strcmp(record->type, BT_MIME_STRING_2_1) =3D=3D 0);
+	g_assert_cmpstr(record->type, =3D=3D, BT_MIME_STRING_2_1);
 }
 =

 int main(int argc, char **argv)
-- =

2.27.0

--===============8138396436097439195==--

