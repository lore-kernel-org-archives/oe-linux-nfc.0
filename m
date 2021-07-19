Content-Type: multipart/mixed; boundary="===============4685620532937620252=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 46/73] unit: use g_assert_cmpint() and g_assert_cmpuint()
Date: Mon, 19 Jul 2021 13:07:52 +0200
Message-ID: <20210719110819.27340-47-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4685620532937620252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Comparisons of simple values should use test macros instead of checking
standard library call return value.  This prints more information on
failure - the actual values used for comparisons.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-build.c |  6 ++---
 unit/test-ndef-parse.c | 60 +++++++++++++++++++++---------------------
 unit/test-snep-read.c  | 45 +++++++++++++++----------------
 3 files changed, 56 insertions(+), 55 deletions(-)

diff --git a/unit/test-ndef-build.c b/unit/test-ndef-build.c
index 7ff2222c7855..e83f7a8075df 100644
--- a/unit/test-ndef-build.c
+++ b/unit/test-ndef-build.c
@@ -63,7 +63,7 @@ static void test_ndef_text_build(void)
 	ndef =3D near_ndef_prepare_text_record("UTF-8", "en-US", "hello");
 =

 	g_assert(ndef);
-	g_assert(ndef->length =3D=3D ARRAY_SIZE(text));
+	g_assert_cmpuint(ndef->length, =3D=3D, ARRAY_SIZE(text));
 	g_assert(!memcmp(ndef->data, text, ARRAY_SIZE(text)));
 }
 =

@@ -74,7 +74,7 @@ static void test_ndef_wsc_with_passphrase_build(void)
 	ndef =3D near_ndef_prepare_wsc_record("TestSSID", "Testpass");
 =

 	g_assert(ndef);
-	g_assert(ndef->length =3D=3D ARRAY_SIZE(wsc));
+	g_assert_cmpuint(ndef->length, =3D=3D, ARRAY_SIZE(wsc));
 	g_assert(!memcmp(ndef->data, wsc, ARRAY_SIZE(wsc)));
 }
 =

@@ -85,7 +85,7 @@ static void test_ndef_wsc_with_out_passphrase_build(void)
 	ndef =3D near_ndef_prepare_wsc_record("TestSSID", NULL);
 =

 	g_assert(ndef);
-	g_assert(ndef->length =3D=3D ARRAY_SIZE(wsc_wo));
+	g_assert_cmpuint(ndef->length, =3D=3D, ARRAY_SIZE(wsc_wo));
 	g_assert(!memcmp(ndef->data, wsc_wo, ARRAY_SIZE(wsc_wo)));
 }
 =

diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index 91dc1f7c185e..9d68a6a77c64 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -206,16 +206,16 @@ static void test_ndef_uri(void)
 	records =3D near_ndef_parse_msg(uri, sizeof(uri), NULL);
 =

 	g_assert(records);
-	g_assert(g_list_length(records) =3D=3D 1);
+	g_assert_cmpuint(g_list_length(records), =3D=3D, 1);
 =

 	record =3D (struct near_ndef_record *)(records->data);
 =

-	g_assert(record->header->rec_type =3D=3D RECORD_TYPE_WKT_URI);
-	g_assert(record->header->mb =3D=3D 1);
-	g_assert(record->header->me =3D=3D 1);
+	g_assert_cmpuint(record->header->rec_type, =3D=3D, RECORD_TYPE_WKT_URI);
+	g_assert_cmpuint(record->header->mb, =3D=3D, 1);
+	g_assert_cmpuint(record->header->me, =3D=3D, 1);
 =

 	g_assert(record->uri);
-	g_assert(record->uri->field_length =3D=3D strlen("intel.com"));
+	g_assert_cmpuint(record->uri->field_length, =3D=3D, strlen("intel.com"));
 	g_assert(strncmp((char *) record->uri->field, "intel.com",
 					record->uri->field_length) =3D=3D 0);
 =

@@ -235,13 +235,13 @@ static void test_ndef_text(void)
 	records =3D near_ndef_parse_msg(text, sizeof(text), NULL);
 =

 	g_assert(records);
-	g_assert(g_list_length(records) =3D=3D 1);
+	g_assert_cmpuint(g_list_length(records), =3D=3D, 1);
 =

 	record =3D (struct near_ndef_record *)(records->data);
 =

-	g_assert(record->header->rec_type =3D=3D RECORD_TYPE_WKT_TEXT);
-	g_assert(record->header->mb =3D=3D 1);
-	g_assert(record->header->me =3D=3D 1);
+	g_assert_cmpuint(record->header->rec_type, =3D=3D, RECORD_TYPE_WKT_TEXT);
+	g_assert_cmpuint(record->header->mb, =3D=3D, 1);
+	g_assert_cmpuint(record->header->me, =3D=3D, 1);
 =

 	g_assert(record->text);
 	g_assert_cmpstr(record->text->data, =3D=3D, "hello =C5=BC=C3=B3=C5=82w");
@@ -280,24 +280,24 @@ static void test_ndef_single_sp(void)
 	records =3D near_ndef_parse_msg(single_sp, sizeof(single_sp), NULL);
 =

 	g_assert(records);
-	g_assert(g_list_length(records) =3D=3D 1);
+	g_assert_cmpuint(g_list_length(records), =3D=3D, 1);
 =

 	record =3D (struct near_ndef_record *) records->data;
 =

-	g_assert(record->header->rec_type =3D=3D RECORD_TYPE_WKT_SMART_POSTER);
-	g_assert(record->header->mb =3D=3D 1);
-	g_assert(record->header->me =3D=3D 1);
+	g_assert_cmpuint(record->header->rec_type, =3D=3D, RECORD_TYPE_WKT_SMART_=
POSTER);
+	g_assert_cmpuint(record->header->mb, =3D=3D, 1);
+	g_assert_cmpuint(record->header->me, =3D=3D, 1);
 =

 	g_assert(record->sp);
-	g_assert(record->sp->number_of_title_records =3D=3D 0);
+	g_assert_cmpuint(record->sp->number_of_title_records, =3D=3D, 0);
 	g_assert(!record->sp->type);
 	g_assert(!record->sp->action);
-	g_assert(record->sp->size =3D=3D 0);
+	g_assert_cmpuint(record->sp->size, =3D=3D, 0);
 	g_assert(record->sp->uri);
 =

 	uri =3D (struct near_ndef_uri_payload *) record->sp->uri;
 =

-	g_assert(uri->field_length =3D=3D strlen("intel.com"));
+	g_assert_cmpuint(uri->field_length, =3D=3D, strlen("intel.com"));
 	g_assert(strncmp((char *) uri->field, "intel.com",
 					uri->field_length) =3D=3D 0);
 =

@@ -322,26 +322,26 @@ static void test_ndef_title_sp(void)
 	records =3D near_ndef_parse_msg(title_sp, sizeof(title_sp), NULL);
 =

 	g_assert(records);
-	g_assert(g_list_length(records) =3D=3D 1);
+	g_assert_cmpuint(g_list_length(records), =3D=3D, 1);
 =

 	record =3D (struct near_ndef_record *) records->data;
 =

-	g_assert(record->header->rec_type =3D=3D RECORD_TYPE_WKT_SMART_POSTER);
-	g_assert(record->header->mb =3D=3D 1);
-	g_assert(record->header->me =3D=3D 1);
+	g_assert_cmpuint(record->header->rec_type, =3D=3D, RECORD_TYPE_WKT_SMART_=
POSTER);
+	g_assert_cmpuint(record->header->mb, =3D=3D, 1);
+	g_assert_cmpuint(record->header->me, =3D=3D, 1);
 =

 	g_assert(record->sp);
-	g_assert(record->sp->number_of_title_records =3D=3D 1);
+	g_assert_cmpuint(record->sp->number_of_title_records, =3D=3D, 1);
 	g_assert(!record->sp->type);
 	g_assert(!record->sp->action);
-	g_assert(record->sp->size =3D=3D 0);
+	g_assert_cmpuint(record->sp->size, =3D=3D, 0);
 	g_assert(record->sp->uri);
 	g_assert(record->sp->title_records[0]);
 =

 	uri =3D (struct near_ndef_uri_payload *) record->sp->uri;
 	text =3D (struct near_ndef_text_payload *) record->sp->title_records[0];
 =

-	g_assert(uri->field_length =3D=3D strlen("intel.com"));
+	g_assert_cmpuint(uri->field_length, =3D=3D, strlen("intel.com"));
 	g_assert(strncmp((char *) uri->field, "intel.com",
 					uri->field_length) =3D=3D 0);
 =

@@ -379,13 +379,13 @@ static void test_ndef_aar(void)
 	records =3D near_ndef_parse_msg(aar, sizeof(aar), NULL);
 =

 	g_assert(records);
-	g_assert(g_list_length(records) =3D=3D 1);
+	g_assert_cmpuint(g_list_length(records), =3D=3D, 1);
 =

 	record =3D (struct near_ndef_record *)(records->data);
 =

-	g_assert(record->header->rec_type =3D=3D RECORD_TYPE_EXT_AAR);
-	g_assert(record->header->mb =3D=3D 1);
-	g_assert(record->header->me =3D=3D 1);
+	g_assert_cmpuint(record->header->rec_type, =3D=3D, RECORD_TYPE_EXT_AAR);
+	g_assert_cmpuint(record->header->mb, =3D=3D, 1);
+	g_assert_cmpuint(record->header->me, =3D=3D, 1);
 =

 	g_assert(record->aar);
 	g_assert(record->aar->package);
@@ -417,16 +417,16 @@ static void test_ndef_ho_hs_bt(void)
 	records =3D near_ndef_parse_msg(ho_hs_bt, sizeof(ho_hs_bt), NULL);
 =

 	g_assert(records);
-	g_assert(g_list_length(records) =3D=3D 2);
+	g_assert_cmpuint(g_list_length(records), =3D=3D, 2);
 =

 	record =3D records->data;
 	ho =3D record->ho;
 =

-	g_assert(ho->number_of_ac_payloads =3D=3D 1);
+	g_assert_cmpuint(ho->number_of_ac_payloads, =3D=3D, 1);
 =

 	ac =3D ho->ac_payloads[0];
 =

-	g_assert(ac->cdr_len =3D=3D 1);
+	g_assert_cmpuint(ac->cdr_len, =3D=3D, 1);
 	g_assert(memcmp(ac->cdr, "0", ac->cdr_len) =3D=3D 0);
 =

 	records =3D g_list_next(records);
diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 03c916a55699..802451e8ee18 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -367,7 +367,7 @@ static bool test_snep_read_send_fragment(size_t frag_le=
n,
 	size_t nbytes;
 =

 	nbytes =3D send(sockfd[client], data, frag_len, 0);
-	g_assert(nbytes =3D=3D frag_len);
+	g_assert_cmpuint(nbytes, =3D=3D, frag_len);
 =

 	near_snep_core_read(sockfd[server], 0, 0, NULL,
 			test_snep_dummy_req_get, test_snep_dummy_req_put,
@@ -400,7 +400,7 @@ static void test_snep_read_recv_fragments(uint32_t frag=
_len,
 =

 		/* receive remaining fragments */
 		nbytes =3D recv(sockfd[client], resp, frag_len, 0);
-		g_assert(nbytes > 0); /* TODO use explicit value? */
+		g_assert_cmpint(nbytes, >, 0); /* TODO use explicit value? */
 =

 		/* store received data (no header this time) */
 		memcpy(data_recvd + offset, resp, nbytes);
@@ -422,8 +422,8 @@ static void test_snep_read_no_response(void)
 	g_assert(resp);
 =

 	nbytes =3D recv(sockfd[client], resp, sizeof(*resp), MSG_DONTWAIT);
-	g_assert(nbytes < 0);
-	g_assert(errno =3D=3D EAGAIN);
+	g_assert_cmpint(nbytes, <, 0);
+	g_assert_cmpint(errno, =3D=3D, EAGAIN);
 =

 	g_free(resp);
 }
@@ -446,14 +446,14 @@ static void test_snep_read_verify_resp(int exp_resp_c=
ode,
 	g_assert(resp);
 =

 	nbytes =3D recv(sockfd[client], resp, frame_len, 0);
-	g_assert(nbytes =3D=3D frame_len);
+	g_assert_cmpint(nbytes, =3D=3D, frame_len);
 =

 	TEST_SNEP_LOG("received response =3D 0x%02X, exp =3D 0x%02X\n",
 			resp->response, exp_resp_code);
 =

-	g_assert(resp->version =3D=3D NEAR_SNEP_VERSION);
-	g_assert(resp->response =3D=3D exp_resp_code);
-	g_assert(resp->length =3D=3D GUINT_TO_BE(exp_resp_info_len));
+	g_assert_cmpuint(resp->version, =3D=3D, NEAR_SNEP_VERSION);
+	g_assert_cmpuint(resp->response, =3D=3D, exp_resp_code);
+	g_assert_cmpuint(resp->length, =3D=3D, GUINT_TO_BE(exp_resp_info_len));
 	g_assert(!memcmp(resp->info, exp_resp_info, exp_resp_info_len));
 =

 	g_free(resp);
@@ -750,8 +750,8 @@ static void test_snep_read_get_req_frags_client_resp(gp=
ointer context,
 =

 	/* start receiving fragments */
 	nbytes =3D recv(sockfd[client], resp, frame_len, 0);
-	g_assert(nbytes =3D=3D frag_len);
-	g_assert(resp->length =3D=3D GUINT_TO_BE(ctx->req_info_len));
+	g_assert_cmpuint(nbytes, =3D=3D, frag_len);
+	g_assert_cmpuint(resp->length, =3D=3D, GUINT_TO_BE(ctx->req_info_len));
 	g_assert(resp->info);
 =

 	data_recvd =3D g_try_malloc0(ctx->req_info_len);
@@ -817,10 +817,10 @@ static void test_snep_response_noinfo(gpointer contex=
t, gconstpointer gp)
 	near_snep_core_response_noinfo(sockfd[client], NEAR_SNEP_RESP_SUCCESS);
 =

 	bytes_recv =3D recv(sockfd[server], &resp, sizeof(resp), 0);
-	g_assert(bytes_recv =3D=3D NEAR_SNEP_RESP_HEADER_LENGTH);
-	g_assert(resp.version =3D=3D NEAR_SNEP_VERSION);
-	g_assert(resp.response =3D=3D NEAR_SNEP_RESP_SUCCESS);
-	g_assert(resp.length =3D=3D 0);
+	g_assert_cmpint(bytes_recv, =3D=3D, NEAR_SNEP_RESP_HEADER_LENGTH);
+	g_assert_cmpint(resp.version, =3D=3D, NEAR_SNEP_VERSION);
+	g_assert_cmpint(resp.response, =3D=3D, NEAR_SNEP_RESP_SUCCESS);
+	g_assert_cmpint(resp.length, =3D=3D, 0);
 }
 =

 /*
@@ -841,7 +841,7 @@ static void test_snep_response_put_get_ndef(gpointer co=
ntext,
 	ndef =3D near_ndef_prepare_text_record("UTF-8", "en-US", "neard");
 	g_assert(ndef);
 	g_assert(ndef->data);
-	g_assert(ndef->length > 0);
+	g_assert_cmpuint(ndef->length, >, 0);
 =

 	frame_len =3D NEAR_SNEP_RESP_HEADER_LENGTH + ndef->length;
 =

@@ -855,7 +855,7 @@ static void test_snep_response_put_get_ndef(gpointer co=
ntext,
 =

 	/* Send PUT request with text record */
 	nbytes =3D send(sockfd[server], req, frame_len, 0);
-	g_assert(nbytes =3D=3D frame_len);
+	g_assert_cmpuint(nbytes, =3D=3D, frame_len);
 =

 	/* UUT */
 	ret =3D near_snep_core_read(sockfd[client], 0, 0, NULL,
@@ -867,14 +867,14 @@ static void test_snep_response_put_get_ndef(gpointer =
context,
 =

 	/* Get response from server */
 	nbytes =3D recv(sockfd[server], resp, frame_len, 0);
-	g_assert(nbytes > 0);
-	g_assert(resp->response =3D=3D NEAR_SNEP_RESP_SUCCESS);
+	g_assert_cmpint(nbytes, >, 0);
+	g_assert_cmpuint(resp->response, =3D=3D, NEAR_SNEP_RESP_SUCCESS);
 =

 	/* Send GET request to retrieve a record */
 	req->request =3D NEAR_SNEP_REQ_GET;
 	req->length =3D 0;
 	nbytes =3D send(sockfd[server], req, NEAR_SNEP_RESP_HEADER_LENGTH, 0);
-	g_assert(nbytes > 0);
+	g_assert_cmpint(nbytes, >, 0);
 =

 	/* UUT */
 	ret =3D near_snep_core_read(sockfd[client], 0, 0, NULL,
@@ -883,9 +883,10 @@ static void test_snep_response_put_get_ndef(gpointer c=
ontext,
 =

 	/* Get response and verify */
 	nbytes =3D recv(sockfd[server], resp, frame_len, 0);
-	g_assert(nbytes > 0);
-	g_assert(resp->response =3D=3D NEAR_SNEP_RESP_SUCCESS);
-	g_assert(resp->length =3D=3D GUINT_TO_BE(ndef->length));
+	g_assert_cmpint(nbytes, >, 0);
+	g_assert_cmpuint(resp->response, =3D=3D, NEAR_SNEP_RESP_SUCCESS);
+	g_assert_cmpint(resp->length, =3D=3D, GUINT_TO_BE(ndef->length));
+	g_assert_cmpuint(resp->length, =3D=3D, GUINT_TO_BE(ndef->length));
 	g_assert(!memcmp(resp->info, text, ndef->length));
 =

 	g_free(req);
-- =

2.27.0

--===============4685620532937620252==--

