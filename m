Content-Type: multipart/mixed; boundary="===============0076500162825458254=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 28/73] nfctype5: use proper format for integers (-Wformat)
Date: Mon, 19 Jul 2021 13:07:34 +0200
Message-ID: <20210719110819.27340-29-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0076500162825458254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    In file included from plugins/nfctype5.c:29:
    plugins/nfctype5.c: In function =E2=80=98t5_read=E2=80=99:
    ./include/near/log.h:45:14: error: format =E2=80=98%zd=E2=80=99 expects=
 argument of type =E2=80=98signed size_t=E2=80=99, but argument 4 has type =
=E2=80=98size_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} [-Werror=
=3Dformat=3D]
       45 |   near_debug("%s:%s() " fmt, \
          |              ^~~~~~~~~~
    plugins/nfctype5.c:437:2: note: in expansion of macro =E2=80=98DBG=E2=
=80=99
      437 |  DBG("Reading %zd bytes starting at offset %d\n", len, offset);
          |  ^~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 plugins/nfctype5.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/plugins/nfctype5.c b/plugins/nfctype5.c
index 3d2cdf030d4f..0f90e55ab268 100644
--- a/plugins/nfctype5.c
+++ b/plugins/nfctype5.c
@@ -434,7 +434,7 @@ static int t5_read(struct near_tag *tag, uint8_t offset=
, uint8_t *buf,
 	uint8_t blk_size =3D near_tag_get_blk_size(tag);
 	int err;
 =

-	DBG("Reading %zd bytes starting at offset %d\n", len, offset);
+	DBG("Reading %zu bytes starting at offset %u\n", len, offset);
 =

 	err =3D t5_cmd_hdr_init(tag, &t5_cmd.hdr, CMD_READ_SINGLE_BLOCK);
 	if (err)
@@ -532,10 +532,10 @@ static int t5_write(struct near_tag *tag, uint8_t off=
set, uint8_t *buf,
 	uint8_t blk_size =3D near_tag_get_blk_size(tag);
 	int err;
 =

-	DBG("Writing %zd bytes starting at offset %d\n", len, offset);
+	DBG("Writing %zu bytes starting at offset %u\n", len, offset);
 =

 	if (offset % blk_size) {
-		near_error("Write - Invalid offset - offset: %d, blk_size: %d",
+		near_error("Write - Invalid offset - offset: %u, blk_size: %u",
 			   offset, blk_size);
 		return -EINVAL;
 	}
-- =

2.27.0

--===============0076500162825458254==--

