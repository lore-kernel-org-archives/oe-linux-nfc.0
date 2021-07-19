Content-Type: multipart/mixed; boundary="===============2207100218379886689=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 48/73] unit: use g_assert_null()
Date: Mon, 19 Jul 2021 13:07:54 +0200
Message-ID: <20210719110819.27340-49-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2207100218379886689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It's more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-build.c | 2 +-
 unit/test-ndef-parse.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/unit/test-ndef-build.c b/unit/test-ndef-build.c
index e83f7a8075df..bf77fdd42165 100644
--- a/unit/test-ndef-build.c
+++ b/unit/test-ndef-build.c
@@ -95,7 +95,7 @@ static void test_ndef_wsc_with_out_ssid_build(void)
 =

 	ndef =3D near_ndef_prepare_wsc_record(NULL, NULL);
 =

-	g_assert(!ndef);
+	g_assert_null(ndef);
 }
 =

 int main(int argc, char **argv)
diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index 9d68a6a77c64..a4f1ab3d0df4 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -290,8 +290,8 @@ static void test_ndef_single_sp(void)
 =

 	g_assert(record->sp);
 	g_assert_cmpuint(record->sp->number_of_title_records, =3D=3D, 0);
-	g_assert(!record->sp->type);
-	g_assert(!record->sp->action);
+	g_assert_null(record->sp->type);
+	g_assert_null(record->sp->action);
 	g_assert_cmpuint(record->sp->size, =3D=3D, 0);
 	g_assert(record->sp->uri);
 =

@@ -332,8 +332,8 @@ static void test_ndef_title_sp(void)
 =

 	g_assert(record->sp);
 	g_assert_cmpuint(record->sp->number_of_title_records, =3D=3D, 1);
-	g_assert(!record->sp->type);
-	g_assert(!record->sp->action);
+	g_assert_null(record->sp->type);
+	g_assert_null(record->sp->action);
 	g_assert_cmpuint(record->sp->size, =3D=3D, 0);
 	g_assert(record->sp->uri);
 	g_assert(record->sp->title_records[0]);
-- =

2.27.0

--===============2207100218379886689==--

