Content-Type: multipart/mixed; boundary="===============2700666010926414751=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 03/16] mifare: use unsigned int to suppress compiler -Wstrict-overflow
Date: Wed, 14 Jul 2021 13:05:05 +0200
Message-ID: <20210714110518.104655-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2700666010926414751==
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

--===============2700666010926414751==--

