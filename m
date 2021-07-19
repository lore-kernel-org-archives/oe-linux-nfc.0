Content-Type: multipart/mixed; boundary="===============3567202619030199709=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 47/73] unit: fix recv() and send() return types
Date: Mon, 19 Jul 2021 13:07:53 +0200
Message-ID: <20210719110819.27340-48-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3567202619030199709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The recv() and send() return negative number on errors, the return value
should be stored in integer or ssize_t.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-snep-read.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 802451e8ee18..1871bac5038a 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -337,10 +337,11 @@ static bool test_snep_read_req_common(
 			near_server_io req_get, near_server_io req_put)
 {
 	bool ret;
-	size_t nbytes;
+	ssize_t nbytes;
 =

 	nbytes =3D send(sockfd[client], req, frame_len, 0);
-	g_assert(nbytes =3D=3D frame_len);
+	g_assert_cmpint(nbytes, >, 0);
+	g_assert_cmpuint(nbytes, =3D=3D, frame_len);
 =

 	TEST_SNEP_LOG("sent 0x%02X request\n", req->request);
 =

@@ -364,9 +365,10 @@ static bool test_snep_read_req_common(
 static bool test_snep_read_send_fragment(size_t frag_len,
 						uint8_t *data)
 {
-	size_t nbytes;
+	ssize_t nbytes;
 =

 	nbytes =3D send(sockfd[client], data, frag_len, 0);
+	g_assert_cmpint(nbytes, >, 0);
 	g_assert_cmpuint(nbytes, =3D=3D, frag_len);
 =

 	near_snep_core_read(sockfd[server], 0, 0, NULL,
@@ -439,7 +441,7 @@ static void test_snep_read_verify_resp(int exp_resp_cod=
e,
 		uint32_t exp_resp_info_len, uint8_t *exp_resp_info)
 {
 	struct p2p_snep_resp_frame *resp;
-	size_t nbytes, frame_len;
+	ssize_t nbytes, frame_len;
 =

 	frame_len =3D NEAR_SNEP_RESP_HEADER_LENGTH + exp_resp_info_len;
 	resp =3D test_snep_build_resp_frame(frame_len, 0, 0, 0, NULL);
@@ -713,7 +715,7 @@ static void test_snep_read_get_req_frags_client_resp(gp=
ointer context,
 	struct p2p_snep_resp_frame *resp;
 	uint32_t frame_len, payload_len;
 	bool ret;
-	size_t nbytes;
+	ssize_t nbytes;
 	uint8_t *data_recvd;
 	uint32_t offset;
 	uint32_t frag_len, info_len;
@@ -750,6 +752,7 @@ static void test_snep_read_get_req_frags_client_resp(gp=
ointer context,
 =

 	/* start receiving fragments */
 	nbytes =3D recv(sockfd[client], resp, frame_len, 0);
+	g_assert_cmpint(nbytes, >=3D, 0);
 	g_assert_cmpuint(nbytes, =3D=3D, frag_len);
 	g_assert_cmpuint(resp->length, =3D=3D, GUINT_TO_BE(ctx->req_info_len));
 	g_assert(resp->info);
@@ -829,7 +832,7 @@ static void test_snep_response_noinfo(gpointer context,=
 gconstpointer gp)
 static void test_snep_response_put_get_ndef(gpointer context,
 						gconstpointer gp)
 {
-	size_t nbytes;
+	ssize_t nbytes;
 =

 	struct p2p_snep_req_frame *req;
 	struct p2p_snep_resp_frame *resp;
@@ -855,6 +858,7 @@ static void test_snep_response_put_get_ndef(gpointer co=
ntext,
 =

 	/* Send PUT request with text record */
 	nbytes =3D send(sockfd[server], req, frame_len, 0);
+	g_assert_cmpint(nbytes, >=3D, 0);
 	g_assert_cmpuint(nbytes, =3D=3D, frame_len);
 =

 	/* UUT */
-- =

2.27.0

--===============3567202619030199709==--

