Content-Type: multipart/mixed; boundary="===============7667372833402010449=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 57/73] unit: fix memory leaks in test-snep-read error paths
Date: Mon, 19 Jul 2021 13:08:03 +0200
Message-ID: <20210719110819.27340-58-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7667372833402010449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Cleanup and free memory in error paths in test-snep-read.c.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-snep-read.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 213b3e5b3d74..a463c1df30b8 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -131,12 +131,12 @@ static bool test_snep_dummy_req_put(int fd, void *dat=
a)
 	records =3D near_ndef_parse_msg(nfc_data, nfc_data_length, NULL);
 	if (!records) {
 		TEST_SNEP_LOG("\tdummy_req_put parsing ndef failed\n");
-		goto error;
+		goto error_free_nfc_data;
 	}
 =

 	if (g_list_length(records) !=3D 1) {
 		TEST_SNEP_LOG("\tdummy_req_put records number mismatch");
-		goto error;
+		goto error_free_records;
 	}
 =

 	g_free(nfc_data);
@@ -149,6 +149,10 @@ static bool test_snep_dummy_req_put(int fd, void *data)
 	near_snep_core_response_noinfo(fd, NEAR_SNEP_RESP_SUCCESS);
 	return true;
 =

+error_free_records:
+	near_ndef_records_free(records);
+error_free_nfc_data:
+	g_free(nfc_data);
 error:
 	TEST_SNEP_LOG("\tdummy_req_put error!!!\n");
 	return false;
-- =

2.27.0

--===============7667372833402010449==--

