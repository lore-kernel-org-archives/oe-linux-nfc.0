Content-Type: multipart/mixed; boundary="===============8493567827749246639=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 55/73] unit: do not open-code freeing ndef message
Date: Mon, 19 Jul 2021 13:08:01 +0200
Message-ID: <20210719110819.27340-56-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8493567827749246639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use near_ndef_msg_free() instead of open-coding it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. Change also test_snep_cleanup()
---
 unit/test-snep-read.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 414b801a5e71..213b3e5b3d74 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -222,10 +222,8 @@ static void test_snep_cleanup(gpointer context, gconst=
pointer data)
 	if (stored_recd)
 		test_ndef_free_record(stored_recd);
 =

-	if (ctx->test_recd_msg) {
-		g_free(ctx->test_recd_msg->data);
-		g_free(ctx->test_recd_msg);
-	}
+	if (ctx->test_recd_msg)
+		near_ndef_msg_free(ctx->test_recd_msg);
 =

 	g_slist_free(test_fragments);
 =

@@ -896,8 +894,7 @@ static void test_snep_response_put_get_ndef(gpointer co=
ntext,
 =

 	g_free(req);
 	g_free(resp);
-	g_free(ndef->data);
-	g_free(ndef);
+	near_ndef_msg_free(ndef);
 }
 =

 int main(int argc, char **argv)
-- =

2.27.0

--===============8493567827749246639==--

