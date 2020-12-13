Content-Type: multipart/mixed; boundary="===============1901966476656320058=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH net-next] nfc: s3fwrn5: Release the nfc firmware
Date: Sun, 13 Dec 2020 18:58:50 +0900
Message-ID: <20201213095850.28169-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1901966476656320058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

add the code to release the nfc firmware when the firmware image size is
wrong.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/firmware.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index 4b5352e2b915..b70737b3070e 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -293,8 +293,10 @@ int s3fwrn5_fw_request_firmware(struct s3fwrn5_fw_info=
 *fw_info)
 	if (ret < 0)
 		return ret;
 =

-	if (fw->fw->size < S3FWRN5_FW_IMAGE_HEADER_SIZE)
+	if (fw->fw->size < S3FWRN5_FW_IMAGE_HEADER_SIZE) {
+		release_firmware(fw->fw);
 		return -EINVAL;
+	}
 =

 	memcpy(fw->date, fw->fw->data + 0x00, 12);
 	fw->date[12] =3D '\0';
-- =

2.17.1

--===============1901966476656320058==--

