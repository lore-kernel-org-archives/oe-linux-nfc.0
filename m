Content-Type: multipart/mixed; boundary="===============0284751067454479872=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 6/7] unit: fix record memory leak in test-snep-read
Date: Fri, 16 Jul 2021 12:08:43 +0200
Message-ID: <20210716100844.51360-7-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0284751067454479872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Instead of open-coding __near_ndef_record_free() with mistakes, use it
directly to fix memory leaks like:

  2 bytes in 1 blocks are definitely lost in loss record 2 of 36
    at 0x483C7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_m=
emcheck-amd64-linux.so)
    by 0x48CA698: g_malloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6=
600.1)
    by 0x48E4B3D: g_strndup (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.=
6600.1)
    by 0x11CB66: parse_record_header (ndef.c:1122)
    by 0x11CB66: parse_record_header (ndef.c:1029)
    by 0x11E549: near_ndef_parse_msg (ndef.c:2846)
    by 0x122A23: test_snep_dummy_req_put (test-snep-read.c:131)
    by 0x122005: snep_core_process_request (snep.c:397)
    by 0x122005: near_snep_core_read (snep.c:617)
    by 0x123042: test_snep_read_req_common.constprop.0 (test-snep-read.c:35=
2)
    by 0x1234E0: test_snep_read_put_req_ok (test-snep-read.c:500)
    by 0x1234E0: test_snep_read_get_req_ok (test-snep-read.c:644)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.=
0.so.0.6600.1)

  15 bytes in 1 blocks are definitely lost in loss record 13 of 36
    at 0x483ED99: calloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_m=
emcheck-amd64-linux.so)
    by 0x11E65F: near_ndef_parse_msg (ndef.c:2958)
    by 0x122A23: test_snep_dummy_req_put (test-snep-read.c:131)
    by 0x122005: snep_core_process_request (snep.c:397)
    by 0x122005: near_snep_core_read (snep.c:617)
    by 0x123042: test_snep_read_req_common.constprop.0 (test-snep-read.c:35=
2)
    by 0x1234E0: test_snep_read_put_req_ok (test-snep-read.c:500)
    by 0x1234E0: test_snep_read_get_req_ok (test-snep-read.c:644)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.=
0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0=
.6600.1)
    by 0x10F784: main (test-snep-read.c:967)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-snep-read.c | 2 +-
 unit/test-utils.c     | 8 --------
 unit/test-utils.h     | 2 --
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 3bc1a9fad7df..a4df6ec95f8f 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -224,7 +224,7 @@ static void test_snep_cleanup(gpointer context, gconstp=
ointer data)
 	__near_snep_core_cleanup();
 =

 	if (stored_recd)
-		test_ndef_free_record(stored_recd);
+		__near_ndef_record_free(stored_recd);
 =

 	if (ctx->test_recd_msg) {
 		g_free(ctx->test_recd_msg->data);
diff --git a/unit/test-utils.c b/unit/test-utils.c
index fe256561821f..369437421971 100644
--- a/unit/test-utils.c
+++ b/unit/test-utils.c
@@ -20,14 +20,6 @@
 =

 #include "test-utils.h"
 =

-void test_ndef_free_record(struct near_ndef_record *record)
-{
-	g_free(record->header);
-	g_free(record->type);
-	g_free(record->data);
-	g_free(record);
-}
-
 struct near_ndef_message *test_ndef_create_test_record(const char *str)
 {
 	struct near_ndef_message *ndef;
diff --git a/unit/test-utils.h b/unit/test-utils.h
index c371d566a573..108f2a1fb139 100644
--- a/unit/test-utils.h
+++ b/unit/test-utils.h
@@ -143,8 +143,6 @@ struct near_ndef_record {
 	size_t data_len;
 };
 =

-void test_ndef_free_record(struct near_ndef_record *record);
-
 struct near_ndef_message *test_ndef_create_test_record(const char *str);
 =

 #endif
-- =

2.27.0

--===============0284751067454479872==--

