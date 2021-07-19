Content-Type: multipart/mixed; boundary="===============4952350161918041778=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 54/73] unit: fix memory leaks in test-ndef-parse
Date: Mon, 19 Jul 2021 13:08:00 +0200
Message-ID: <20210719110819.27340-55-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4952350161918041778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

test-ndef-parse.c was not freeing fully the ndef records it got.
Replace the open-coded freeing with usage of near_ndef_records_free() to
solve libasan errors like:

    Direct leak of 8 byte(s) in 1 object(s) allocated from:
        #0 0x7f678a64b518 in calloc (/usr/lib/x86_64-linux-gnu/libasan.so.5=
+0xe9518)
        #1 0x557597045e89 in parse_sp_payload src/ndef.c:1468
        #2 0x557597045e89 in near_ndef_parse_msg src/ndef.c:2921

and valgring errors like:

    2 bytes in 1 blocks are definitely lost in loss record 2 of 52
    at 0x483C7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_m=
emcheck-amd64-linux.so)
    by 0x48CA698: g_malloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6=
600.1)
    by 0x48E4B3D: g_strndup (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.=
6600.1)
    by 0x11C9F6: parse_record_header (ndef.c:1131)
    by 0x11C9F6: parse_record_header (ndef.c:1038)
    by 0x11E3D9: near_ndef_parse_msg (ndef.c:2855)
    by 0x121E6B: test_ndef_uri (test-ndef-parse.c:213)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.=
0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0=
.6600.1)
    by 0x10F61A: main (test-ndef-parse.c:467)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-parse.c | 39 +++++----------------------------------
 1 file changed, 5 insertions(+), 34 deletions(-)

diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index 24f7d2f2c3ac..ace0f9038ad9 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -189,15 +189,6 @@ static uint8_t ho_hs_bt[] =3D {0x91, 0x02, 0x0A, 0x48,=
 0x73, 0x12, 0xD1, 0x02,
 			      0x09, 0x44, 0x65, 0x79, 0x69, 0x63, 0x65, 0x4e,
 			      0x61, 0x6d, 0x65};
 =

-static void test_ndef_free_record(struct near_ndef_record *record)
-{
-	g_free(record->header);
-	g_free(record->type);
-	g_free(record->data);
-	g_free(record);
-
-}
-
 static void test_ndef_uri(void)
 {
 	GList *records;
@@ -222,9 +213,7 @@ static void test_ndef_uri(void)
 	if (g_test_verbose())
 		g_print("NDEF URI field: %s\n", record->uri->field);
 =

-	g_free(record->uri->field);
-	g_free(record->uri);
-	test_ndef_free_record(record);
+	near_ndef_records_free(records);
 }
 =

 static void test_ndef_text(void)
@@ -255,11 +244,7 @@ static void test_ndef_text(void)
 						record->text->language_code);
 	}
 =

-	g_free(record->text->data);
-	g_free(record->text->encoding);
-	g_free(record->text->language_code);
-	g_free(record->text);
-	test_ndef_free_record(record);
+	near_ndef_records_free(records);
 }
 =

 static void test_ndef_text_invalid_utf16(void)
@@ -305,10 +290,7 @@ static void test_ndef_single_sp(void)
 		g_print("NDEF SP URI field: %.*s\n", (int)uri->field_length,
 			(char *) uri->field);
 =

-	g_free(uri->field);
-	g_free(uri);
-	g_free(record->sp);
-	test_ndef_free_record(record);
+	near_ndef_records_free(records);
 }
 =

 static void test_ndef_title_sp(void)
@@ -359,16 +341,7 @@ static void test_ndef_title_sp(void)
 		g_print("NDEF SP Title Language: %s\n", text->language_code);
 	}
 =

-	g_free(uri->field);
-	g_free(uri);
-
-	g_free(text->data);
-	g_free(text->encoding);
-	g_free(text->language_code);
-	g_free(text);
-
-	g_free(record->sp);
-	test_ndef_free_record(record);
+	near_ndef_records_free(records);
 }
 =

 static void test_ndef_aar(void)
@@ -395,9 +368,7 @@ static void test_ndef_aar(void)
 	if (g_test_verbose())
 		g_print("NDEF AAR package: %s\n", record->aar->package);
 =

-	g_free(record->aar->package);
-	g_free(record->aar);
-	test_ndef_free_record(record);
+	near_ndef_records_free(records);
 }
 =

 static void test_ndef_ho_hs_bt(void)
-- =

2.27.0

--===============4952350161918041778==--

