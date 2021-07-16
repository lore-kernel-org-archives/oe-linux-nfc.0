Content-Type: multipart/mixed; boundary="===============4364957035183803122=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 4/7] snep: fix double free of GSList
Date: Fri, 16 Jul 2021 12:08:41 +0200
Message-ID: <20210716100844.51360-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4364957035183803122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

g_slist_free_full() already frees entire GSList so calling it with
g_slist_free causes a double free and memory corruption.

This can be seen with Valgrind:

  Invalid read of size 8
    at 0x48E3980: g_slice_free_chain_with_offset (in /usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0.6600.1)
    by 0x122075: snep_core_process_request (snep.c:481)
    by 0x122075: near_snep_core_read (snep.c:620)
    by 0x122CE4: test_snep_read_req_common (test-snep-read.c:348)
    by 0x12457A: test_snep_read_get_req_frags_client_resp (test-snep-read.c=
:775)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.=
0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0=
.6600.1)
    by 0x10F982: main (test-snep-read.c:960)
   Address 0x501e198 is 8 bytes inside a block of size 16 free'd
    at 0x483DA3F: free (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_mem=
check-amd64-linux.so)
    by 0x48E3971: g_slice_free_chain_with_offset (in /usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0.6600.1)
    by 0x122068: snep_core_process_request (snep.c:479)
    by 0x122068: near_snep_core_read (snep.c:620)
    by 0x122CE4: test_snep_read_req_common (test-snep-read.c:348)
    by 0x12457A: test_snep_read_get_req_frags_client_resp (test-snep-read.c=
:775)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.=
0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0=
.6600.1)
    by 0x10F982: main (test-snep-read.c:960)
   Block was alloc'd at
    at 0x483C7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_m=
emcheck-amd64-linux.so)
    by 0x48CA698: g_malloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6=
600.1)
    by 0x48E2CF1: g_slice_alloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.s=
o.0.6600.1)
    by 0x48E4407: g_slist_append (in /usr/lib/x86_64-linux-gnu/libglib-2.0.=
so.0.6600.1)
    by 0x121AC7: snep_core_push_prepare_fragments (snep.c:377)
    by 0x121AC7: near_snep_core_response (snep.c:695)
    by 0x1224DB: near_snep_core_response_with_info (snep.c:779)
    by 0x122E41: test_snep_dummy_req_get (test-snep-read.c:172)
    by 0x121FF3: snep_core_process_request (snep.c:413)
    by 0x121FF3: near_snep_core_read (snep.c:620)
    by 0x122CE4: test_snep_read_req_common (test-snep-read.c:348)
    by 0x124449: test_snep_read_get_req_frags_client_resp (test-snep-read.c=
:746)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)

  Invalid free() / delete / delete[] / realloc()
    at 0x483DA3F: free (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_mem=
check-amd64-linux.so)
    by 0x48E3971: g_slice_free_chain_with_offset (in /usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0.6600.1)
    by 0x122075: snep_core_process_request (snep.c:481)
    by 0x122075: near_snep_core_read (snep.c:620)
    by 0x122CE4: test_snep_read_req_common (test-snep-read.c:348)
    by 0x12457A: test_snep_read_get_req_frags_client_resp (test-snep-read.c=
:775)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.=
0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0=
.6600.1)
    by 0x10F982: main (test-snep-read.c:960)
   Address 0x501e190 is 0 bytes inside a block of size 16 free'd
    at 0x483DA3F: free (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_mem=
check-amd64-linux.so)
    by 0x48E3971: g_slice_free_chain_with_offset (in /usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0.6600.1)
    by 0x122068: snep_core_process_request (snep.c:479)
    by 0x122068: near_snep_core_read (snep.c:620)
    by 0x122CE4: test_snep_read_req_common (test-snep-read.c:348)
    by 0x12457A: test_snep_read_get_req_frags_client_resp (test-snep-read.c=
:775)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.=
0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0=
.6600.1)
    by 0x10F982: main (test-snep-read.c:960)
   Block was alloc'd at
    at 0x483C7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_m=
emcheck-amd64-linux.so)
    by 0x48CA698: g_malloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6=
600.1)
    by 0x48E2CF1: g_slice_alloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.s=
o.0.6600.1)
    by 0x48E4407: g_slist_append (in /usr/lib/x86_64-linux-gnu/libglib-2.0.=
so.0.6600.1)
    by 0x121AC7: snep_core_push_prepare_fragments (snep.c:377)
    by 0x121AC7: near_snep_core_response (snep.c:695)
    by 0x1224DB: near_snep_core_response_with_info (snep.c:779)
    by 0x122E41: test_snep_dummy_req_get (test-snep-read.c:172)
    by 0x121FF3: snep_core_process_request (snep.c:413)
    by 0x121FF3: near_snep_core_read (snep.c:620)
    by 0x122CE4: test_snep_read_req_common (test-snep-read.c:348)
    by 0x124449: test_snep_read_get_req_frags_client_resp (test-snep-read.c=
:746)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/snep.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/src/snep.c b/src/snep.c
index 737060139b07..bac93c115cb3 100644
--- a/src/snep.c
+++ b/src/snep.c
@@ -436,7 +436,6 @@ static bool snep_core_process_request(int client_fd,
 =

 		g_slist_free_full(snep_data->req->fragments,
 						free_snep_core_fragment);
-		g_slist_free(snep_data->req->fragments);
 =

 		g_hash_table_remove(snep_client_hash,
 						GINT_TO_POINTER(client_fd));
@@ -476,7 +475,6 @@ leave_cont:
 		/* No more fragment to send, clean memory */
 		g_slist_free_full(snep_data->req->fragments,
 						free_snep_core_fragment);
-		g_slist_free(snep_data->req->fragments);
 =

 		g_hash_table_remove(snep_client_hash,
 						GINT_TO_POINTER(client_fd));
-- =

2.27.0

--===============4364957035183803122==--

