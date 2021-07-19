Content-Type: multipart/mixed; boundary="===============4211214794766127355=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 49/73] unit: use g_assert_cmpmem()
Date: Mon, 19 Jul 2021 13:07:55 +0200
Message-ID: <20210719110819.27340-50-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4211214794766127355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Comparisons of simple values should use test macros instead of checking
standard library call return value.  This prints more information on
failure - the actual values used for comparisons.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-build.c | 6 +++---
 unit/test-ndef-parse.c | 2 +-
 unit/test-snep-read.c  | 9 +++++----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/unit/test-ndef-build.c b/unit/test-ndef-build.c
index bf77fdd42165..44dce4bf9aef 100644
--- a/unit/test-ndef-build.c
+++ b/unit/test-ndef-build.c
@@ -64,7 +64,7 @@ static void test_ndef_text_build(void)
 =

 	g_assert(ndef);
 	g_assert_cmpuint(ndef->length, =3D=3D, ARRAY_SIZE(text));
-	g_assert(!memcmp(ndef->data, text, ARRAY_SIZE(text)));
+	g_assert_cmpmem(ndef->data, ARRAY_SIZE(text), text, ARRAY_SIZE(text));
 }
 =

 static void test_ndef_wsc_with_passphrase_build(void)
@@ -75,7 +75,7 @@ static void test_ndef_wsc_with_passphrase_build(void)
 =

 	g_assert(ndef);
 	g_assert_cmpuint(ndef->length, =3D=3D, ARRAY_SIZE(wsc));
-	g_assert(!memcmp(ndef->data, wsc, ARRAY_SIZE(wsc)));
+	g_assert_cmpmem(ndef->data, ARRAY_SIZE(wsc), wsc, ARRAY_SIZE(wsc));
 }
 =

 static void test_ndef_wsc_with_out_passphrase_build(void)
@@ -86,7 +86,7 @@ static void test_ndef_wsc_with_out_passphrase_build(void)
 =

 	g_assert(ndef);
 	g_assert_cmpuint(ndef->length, =3D=3D, ARRAY_SIZE(wsc_wo));
-	g_assert(!memcmp(ndef->data, wsc_wo, ARRAY_SIZE(wsc_wo)));
+	g_assert_cmpmem(ndef->data, ARRAY_SIZE(wsc_wo), wsc_wo, ARRAY_SIZE(wsc_wo=
));
 }
 =

 static void test_ndef_wsc_with_out_ssid_build(void)
diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index a4f1ab3d0df4..96288f29f44d 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -427,7 +427,7 @@ static void test_ndef_ho_hs_bt(void)
 	ac =3D ho->ac_payloads[0];
 =

 	g_assert_cmpuint(ac->cdr_len, =3D=3D, 1);
-	g_assert(memcmp(ac->cdr, "0", ac->cdr_len) =3D=3D 0);
+	g_assert_cmpmem(ac->cdr, ac->cdr_len, "0", sizeof("0"));
 =

 	records =3D g_list_next(records);
 	record =3D records->data;
diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 1871bac5038a..5511fecf5c17 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -456,7 +456,8 @@ static void test_snep_read_verify_resp(int exp_resp_cod=
e,
 	g_assert_cmpuint(resp->version, =3D=3D, NEAR_SNEP_VERSION);
 	g_assert_cmpuint(resp->response, =3D=3D, exp_resp_code);
 	g_assert_cmpuint(resp->length, =3D=3D, GUINT_TO_BE(exp_resp_info_len));
-	g_assert(!memcmp(resp->info, exp_resp_info, exp_resp_info_len));
+	g_assert_cmpmem(resp->info, GUINT_FROM_BE(resp->length),
+			exp_resp_info, exp_resp_info_len);
 =

 	g_free(resp);
 }
@@ -786,8 +787,8 @@ static void test_snep_read_get_req_frags_client_resp(gp=
ointer context,
 					data_recvd + offset);
 =

 		/* verify data */
-		g_assert(!memcmp(data_recvd, ctx->req_info,
-				ctx->req_info_len));
+		g_assert_cmpmem(data_recvd, ctx->req_info_len, ctx->req_info,
+				ctx->req_info_len);
 	}
 =

 	g_free(data_recvd);
@@ -891,7 +892,7 @@ static void test_snep_response_put_get_ndef(gpointer co=
ntext,
 	g_assert_cmpuint(resp->response, =3D=3D, NEAR_SNEP_RESP_SUCCESS);
 	g_assert_cmpint(resp->length, =3D=3D, GUINT_TO_BE(ndef->length));
 	g_assert_cmpuint(resp->length, =3D=3D, GUINT_TO_BE(ndef->length));
-	g_assert(!memcmp(resp->info, text, ndef->length));
+	g_assert_cmpmem(resp->info, GUINT_FROM_BE(resp->length), text, ndef->leng=
th);
 =

 	g_free(req);
 	g_free(resp);
-- =

2.27.0

--===============4211214794766127355==--

