Content-Type: multipart/mixed; boundary="===============7641293873308521375=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 32/34] unit: use proper format for integers (-Wformat)
Date: Sun, 11 Jul 2021 22:23:49 +0200
Message-ID: <20210711202351.18363-20-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7641293873308521375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    unit/test-ndef-parse.c: In function =E2=80=98test_ndef_single_sp=E2=80=
=99:
    unit/test-ndef-parse.c:318:33: error: field precision specifier =E2=80=
=98.*=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument=
 2 has type =E2=80=98uint32_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99}=
 [-Werror=3Dformat=3D]
      318 |   g_print("NDEF SP URI field: %.*s\n", uri->field_length,
          |                               ~~^~     ~~~~~~~~~~~~~~~~~
          |                                 |         |
          |                                 int       uint32_t {aka unsigne=
d int}

    unit/test-snep-read.c: In function =E2=80=98test_snep_dummy_req_put=E2=
=80=99:
    unit/test-snep-read.c:42:12: error: format =E2=80=98%d=E2=80=99 expects=
 argument of type =E2=80=98int=E2=80=99, but argument 3 has type =E2=80=98u=
int32_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
       42 |   g_printf("[SNEP unit] " fmt, ##__VA_ARGS__); \
          |            ^~~~~~~~~~~~~~
    ......
      118 |     frag_cnt, fragment->nfc_data_length,
          |               ~~~~~~~~~~~~~~~~~~~~~~~~~
          |                       |
          |                       uint32_t {aka unsigned int}

    unit/test-snep-read.c: In function =E2=80=98test_snep_read_verify_resp=
=E2=80=99:
    unit/test-snep-read.c:42:12: error: format =E2=80=98%X=E2=80=99 expects=
 argument of type =E2=80=98unsigned int=E2=80=99, but argument 3 has type =
=E2=80=98int=E2=80=99 [-Werror=3Dformat=3D]
       42 |   g_printf("[SNEP unit] " fmt, ##__VA_ARGS__); \
          |            ^~~~~~~~~~~~~~
    ......
      454 |    resp->response, exp_resp_code);
          |                    ~~~~~~~~~~~~~
          |                    |
          |                    int

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-parse.c | 8 ++++----
 unit/test-snep-read.c  | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index cdeb1a1a24df..0bc53eeac125 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -315,8 +315,8 @@ static void test_ndef_single_sp(void)
 					uri->field_length) =3D=3D 0);
 =

 	if (g_test_verbose())
-		g_print("NDEF SP URI field: %.*s\n", uri->field_length,
-							(char *) uri->field);
+		g_print("NDEF SP URI field: %.*s\n", (int)uri->field_length,
+			(char *) uri->field);
 =

 	g_free(uri->field);
 	g_free(uri);
@@ -359,8 +359,8 @@ static void test_ndef_title_sp(void)
 					uri->field_length) =3D=3D 0);
 =

 	if (g_test_verbose())
-		g_print("NDEF SP URI field: %.*s\n", uri->field_length,
-							(char *) uri->field);
+		g_print("NDEF SP URI field: %.*s\n", (int)uri->field_length,
+			(char *) uri->field);
 =

 	g_assert_cmpstr(text->data, =3D=3D, "Intel");
 	g_assert_cmpstr(text->encoding, =3D=3D, "UTF-8");
diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 78db58ba859f..414b801a5e71 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -114,7 +114,7 @@ static bool test_snep_dummy_req_put(int fd, void *data)
 		static int frag_cnt;
 		struct p2p_snep_data *fragment =3D test_fragments->data;
 =

-		TEST_SNEP_LOG("\tdummy_req_put frag=3D%d, len=3D%d, current=3D%d\n",
+		TEST_SNEP_LOG("\tdummy_req_put frag=3D%d, len=3D%u, current=3D%u\n",
 				frag_cnt, fragment->nfc_data_length,
 				fragment->nfc_data_current_length);
 		test_fragments =3D g_slist_remove(test_fragments, fragment);
@@ -437,7 +437,7 @@ static void test_snep_read_no_response(void)
  * @param[in] exp_resp_info_len  Expected response info length
  * @param[in] exp_resp_info      Expected response info
  */
-static void test_snep_read_verify_resp(int exp_resp_code,
+static void test_snep_read_verify_resp(uint8_t exp_resp_code,
 		uint32_t exp_resp_info_len, uint8_t *exp_resp_info)
 {
 	struct p2p_snep_resp_frame *resp;
@@ -467,7 +467,7 @@ static void test_snep_read_verify_resp(int exp_resp_cod=
e,
  *
  * @param[in] exp_resp_code  Expected response code
  */
-static void test_snep_read_verify_resp_code(int exp_resp_code)
+static void test_snep_read_verify_resp_code(uint8_t exp_resp_code)
 {
 	test_snep_read_verify_resp(exp_resp_code, 0, NULL);
 }
-- =

2.27.0

--===============7641293873308521375==--

