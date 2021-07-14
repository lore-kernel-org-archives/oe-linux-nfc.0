Content-Type: multipart/mixed; boundary="===============6651496905758018852=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 15/16] unit: do not open-code freeing ndef message
Date: Wed, 14 Jul 2021 13:05:17 +0200
Message-ID: <20210714110518.104655-16-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6651496905758018852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use near_ndef_msg_free() instead of open-coding it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-snep-read.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 414b801a5e71..0a2010a677e1 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -896,8 +896,7 @@ static void test_snep_response_put_get_ndef(gpointer co=
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

--===============6651496905758018852==--

