Content-Type: multipart/mixed; boundary="===============0586221850480779551=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 31/73] mifare: use unsigned int to suppress compiler -Wstrict-overflow
Date: Mon, 19 Jul 2021 13:07:37 +0200
Message-ID: <20210719110819.27340-32-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0586221850480779551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

GCC v7.5 (Ubuntu Bionic) with optimizations has trouble spotting lack of
possible overflow of a signed integer.  There is no overflow possible
so this is a false positive which can be suppressed by simply using
unsigned integer.  Unsigned also has more sense in that context.

This fixes GCC 7.5 warning:

    plugins/mifare.c: In function 'mifare_process_MADs':
    plugins/mifare.c:626:5: error: assuming signed overflow does not occur =
when simplifying conditional to constant [-Werror=3Dstrict-overflow]
      if (global_tag_size =3D=3D 0) {
         ^

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 plugins/mifare.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/plugins/mifare.c b/plugins/mifare.c
index a4e4ba443995..f42007d5dfd7 100644
--- a/plugins/mifare.c
+++ b/plugins/mifare.c
@@ -560,7 +560,7 @@ static int mifare_process_MADs(void *data)
 	struct mifare_cookie *mf_ck =3D data;
 	int err;
 	int i;
-	int global_tag_size =3D 0;
+	unsigned int global_tag_size =3D 0;
 	int ioffset;
 	uint8_t *tag_data;
 	size_t data_size;
@@ -626,13 +626,13 @@ done_mad:
 	if (global_tag_size =3D=3D 0) {
 =

 		/* no NFC sectors - mark tag as blank */
-		near_error("TAG Global size: [%d], not valid NFC tag.",
+		near_error("TAG Global size: [%u], not valid NFC tag.",
 				global_tag_size);
 		return -ENODEV;
 	}
 =

 	/* n sectors, each sector is 3 blocks, each block is 16 bytes */
-	DBG("TAG Global size: [%d]", global_tag_size);
+	DBG("TAG Global size: [%u]", global_tag_size);
 =

 	mf_ck->tag =3D near_tag_get_tag(mf_ck->adapter_idx, mf_ck->target_idx);
 	if (!mf_ck->tag) {
-- =

2.27.0

--===============0586221850480779551==--

