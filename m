Content-Type: multipart/mixed; boundary="===============2104597044349168033=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 59/73] unit: fix records GList memory leak in test-snep-read
Date: Mon, 19 Jul 2021 13:08:05 +0200
Message-ID: <20210719110819.27340-60-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2104597044349168033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The test_snep_dummy_req_put() stores one record in global stored_recd
pointer, so the GList itself should be freed.  This fixes Valgrind
warning:

  24 bytes in 1 blocks are definitely lost in loss record 21 of 30
    at 0x483C7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_m=
emcheck-amd64-linux.so)
    by 0x48CA698: g_malloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6=
600.1)
    by 0x48E2CF1: g_slice_alloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.s=
o.0.6600.1)
    by 0x48BFF07: g_list_append (in /usr/lib/x86_64-linux-gnu/libglib-2.0.s=
o.0.6600.1)
    by 0x11E68A: near_ndef_parse_msg (ndef.c:2964)
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-snep-read.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index f64ef0c6fce2..128937ed910f 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -142,6 +142,7 @@ static bool test_snep_dummy_req_put(int fd, void *data)
 	g_free(nfc_data);
 =

 	stored_recd =3D records->data;
+	g_list_free(records);
 =

 	TEST_SNEP_LOG("\t\tdummy_req_put STORED REC data=3D%p length=3D%zu\n",
 			stored_recd->data, stored_recd->data_len);
-- =

2.27.0

--===============2104597044349168033==--

