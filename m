Content-Type: multipart/mixed; boundary="===============7867975988100699967=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 64/73] unit: add few asserts in test-snep-read
Date: Mon, 19 Jul 2021 13:08:10 +0200
Message-ID: <20210719110819.27340-65-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7867975988100699967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For consistency, check for returned values of
test_snep_build_req_frame()-like functions and __near_snep_core_init().
No functional change expected as all these are already tests.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-snep-read.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 21be58785eda..6d144b22f4e9 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -205,7 +205,7 @@ static void test_snep_init(gpointer context, gconstpoin=
ter data)
 	if (ret !=3D 0)
 		TEST_SNEP_LOG("set sock SO_RCVTIMEO failed");
 =

-	__near_snep_core_init();
+	g_assert_cmpint(__near_snep_core_init(), =3D=3D, 0);
 =

 	stored_recd =3D NULL;
 =

@@ -499,6 +499,7 @@ static void test_snep_read_put_req_ok(gpointer context,=
 gconstpointer gp)
 	req =3D test_snep_build_req_frame(frame_len, NEAR_SNEP_VERSION,
 					NEAR_SNEP_REQ_PUT, ctx->req_info_len,
 					ctx->req_info, payload_len);
+	g_assert(req);
 =

 	ret =3D test_snep_read_req_common(req, frame_len, test_snep_dummy_req_get,
 					test_snep_dummy_req_put);
@@ -529,6 +530,7 @@ static void test_snep_read_put_req_unsupp_ver(gpointer =
context,
 =

 	req =3D test_snep_build_req_frame(frame_len, 0xF8, NEAR_SNEP_REQ_PUT,
 				ctx->req_info_len, ctx->req_info, payload_len);
+	g_assert(req);
 =

 	ret =3D test_snep_read_req_common(req, frame_len, test_snep_dummy_req_get,
 					test_snep_dummy_req_put);
@@ -562,6 +564,7 @@ static void test_snep_read_put_req_not_impl(gpointer co=
ntext,
 	req =3D test_snep_build_req_frame(frame_len, NEAR_SNEP_VERSION,
 					NEAR_SNEP_REQ_PUT, ctx->req_info_len,
 					ctx->req_info, payload_len);
+	g_assert(req);
 =

 	ret =3D test_snep_read_req_common(req, frame_len, test_snep_dummy_req_get,
 					NULL);
@@ -597,6 +600,7 @@ static void test_snep_read_put_req_fragmented(gpointer =
context,
 	req =3D test_snep_build_req_frame(frame_len, NEAR_SNEP_VERSION,
 					NEAR_SNEP_REQ_PUT, ctx->req_info_len,
 					ctx->req_info, payload_len);
+	g_assert(req);
 =

 	/* send 1st fragment within PUT request */
 	ret =3D test_snep_read_req_common(req, frame_len, test_snep_dummy_req_get,
@@ -654,6 +658,7 @@ static void test_snep_read_get_req_ok(gpointer context,=
 gconstpointer gp)
 	req =3D test_snep_build_req_get_frame(frame_len, NEAR_SNEP_VERSION,
 				NEAR_SNEP_REQ_GET, info_len,
 				ctx->acc_len, ctx->req_info, payload_len);
+	g_assert(req);
 =

 	ret =3D test_snep_read_req_common(req, frame_len, test_snep_dummy_req_get,
 					test_snep_dummy_req_put);
@@ -693,6 +698,7 @@ static void test_snep_read_get_req_not_impl(gpointer co=
ntext,
 	req =3D test_snep_build_req_get_frame(frame_len, NEAR_SNEP_VERSION,
 			NEAR_SNEP_REQ_GET, ctx->req_info_len, ctx->acc_len,
 			ctx->req_info, payload_len);
+	g_assert(req);
 =

 	/* call snep_core_read with NULL req_get handler */
 	ret =3D test_snep_read_req_common(req, frame_len, NULL,
@@ -748,6 +754,7 @@ static void test_snep_read_get_req_frags_client_resp(gp=
ointer context,
 	req =3D test_snep_build_req_get_frame(frame_len, NEAR_SNEP_VERSION,
 				NEAR_SNEP_REQ_GET, info_len,
 				ctx->acc_len, ctx->req_info, payload_len);
+	g_assert(req);
 =

 	/* send GET request */
 	ret =3D test_snep_read_req_common(req, frame_len, test_snep_dummy_req_get,
@@ -757,6 +764,7 @@ static void test_snep_read_get_req_frags_client_resp(gp=
ointer context,
 =

 	frame_len =3D NEAR_SNEP_RESP_HEADER_LENGTH + payload_len;
 	resp =3D test_snep_build_resp_frame(frame_len, 0, 0, 0, NULL);
+	g_assert(resp);
 =

 	/* start receiving fragments */
 	nbytes =3D recv(sockfd[client], resp, frame_len, 0);
@@ -778,6 +786,7 @@ static void test_snep_read_get_req_frags_client_resp(gp=
ointer context,
 	frame_len =3D NEAR_SNEP_REQ_PUT_HEADER_LENGTH;
 	req =3D test_snep_build_req_frame(frame_len, NEAR_SNEP_VERSION,
 					client_resp, 0, NULL, 0);
+	g_assert(req);
 =

 	ret =3D test_snep_read_req_common(req, frame_len, NULL, NULL);
 	g_free(req);
-- =

2.27.0

--===============7867975988100699967==--

