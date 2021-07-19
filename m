Content-Type: multipart/mixed; boundary="===============4181278256481433351=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 44/73] snep: fix fragmented response memory leaks
Date: Mon, 19 Jul 2021 13:07:50 +0200
Message-ID: <20210719110819.27340-45-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4181278256481433351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sending long response might cause frame fragmentation and
near_snep_core_response_with_info() does not free such 'struct
p2p_snep_put_req_data'.  It looks like freeing the fragmented response
is task for snep_core_process_request as it already frees the fragments.
Add also freeing the response itself to fix Valgrind (and ASAN) reported
memory leaks:

  $ valgrind  --leak-check=3Dfull unit/test-snep-read

  80 bytes in 2 blocks are definitely lost in loss record 55 of 60
    at 0x483ED99: calloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_m=
emcheck-amd64-linux.so)
    by 0x122496: near_snep_core_response_with_info (snep.c:762)
    by 0x122E21: test_snep_dummy_req_get (test-snep-read.c:179)
    by 0x121FF3: snep_core_process_request (snep.c:411)
    by 0x121FF3: near_snep_core_read (snep.c:616)
    by 0x122CC4: test_snep_read_req_common (test-snep-read.c:355)
    by 0x124792: test_snep_read_get_req_frags_client_resp (test-snep-read.c=
:760)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.=
0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0=
.6600.1)
    by 0x10F982: main (test-snep-read.c:976)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/snep.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/snep.c b/src/snep.c
index bac93c115cb3..d4692c522df3 100644
--- a/src/snep.c
+++ b/src/snep.c
@@ -436,6 +436,8 @@ static bool snep_core_process_request(int client_fd,
 =

 		g_slist_free_full(snep_data->req->fragments,
 						free_snep_core_fragment);
+		g_free(snep_data->req);
+		snep_data->req =3D NULL;
 =

 		g_hash_table_remove(snep_client_hash,
 						GINT_TO_POINTER(client_fd));
@@ -475,6 +477,8 @@ leave_cont:
 		/* No more fragment to send, clean memory */
 		g_slist_free_full(snep_data->req->fragments,
 						free_snep_core_fragment);
+		g_free(snep_data->req);
+		snep_data->req =3D NULL;
 =

 		g_hash_table_remove(snep_client_hash,
 						GINT_TO_POINTER(client_fd));
-- =

2.27.0

--===============4181278256481433351==--

