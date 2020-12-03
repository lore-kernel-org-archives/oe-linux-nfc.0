Content-Type: multipart/mixed; boundary="===============5369703198757331078=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH net-next] nfc: s3fwrn5: skip the NFC bootloader mode
Date: Fri, 04 Dec 2020 00:39:50 +0900
Message-ID: <20201203153950.13772-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5369703198757331078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

If there isn't proper NFC firmware image,
Bootloader mode will be skipped.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/core.c     | 44 ++++++++++++++++++++++++----------
 drivers/nfc/s3fwrn5/firmware.c | 11 +--------
 drivers/nfc/s3fwrn5/firmware.h |  1 +
 3 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/core.c b/drivers/nfc/s3fwrn5/core.c
index f8e5d78d9078..df89bc5d7338 100644
--- a/drivers/nfc/s3fwrn5/core.c
+++ b/drivers/nfc/s3fwrn5/core.c
@@ -20,13 +20,26 @@
 				NFC_PROTO_ISO14443_B_MASK | \
 				NFC_PROTO_ISO15693_MASK)
 =

+static int s3fwrn5_firmware_init(struct s3fwrn5_info *info)
+{
+	struct s3fwrn5_fw_info *fw_info =3D &info->fw_info;
+	int ret;
+
+	s3fwrn5_fw_init(fw_info, "sec_s3fwrn5_firmware.bin");
+
+	/* Get firmware data */
+	ret =3D s3fwrn5_fw_request_firmware(fw_info);
+	if (ret < 0)
+		dev_err(&fw_info->ndev->nfc_dev->dev,
+			"Failed to get fw file, ret=3D%02x\n", ret);
+	return ret;
+}
+
 static int s3fwrn5_firmware_update(struct s3fwrn5_info *info)
 {
 	bool need_update;
 	int ret;
 =

-	s3fwrn5_fw_init(&info->fw_info, "sec_s3fwrn5_firmware.bin");
-
 	/* Update firmware */
 =

 	s3fwrn5_set_wake(info, false);
@@ -109,21 +122,26 @@ static int s3fwrn5_nci_post_setup(struct nci_dev *nde=
v)
 	struct s3fwrn5_info *info =3D nci_get_drvdata(ndev);
 	int ret;
 =

-	ret =3D s3fwrn5_firmware_update(info);
-	if (ret < 0)
-		goto out;
+	if (s3fwrn5_firmware_init(info) =3D=3D 0) {
+		ret =3D s3fwrn5_firmware_update(info);
+		if (ret < 0)
+			goto out;
 =

-	/* NCI core reset */
-
-	s3fwrn5_set_mode(info, S3FWRN5_MODE_NCI);
-	s3fwrn5_set_wake(info, true);
+		/* NCI core reset */
 =

-	ret =3D nci_core_reset(info->ndev);
-	if (ret < 0)
-		goto out;
+		s3fwrn5_set_mode(info, S3FWRN5_MODE_NCI);
+		s3fwrn5_set_wake(info, true);
 =

-	ret =3D nci_core_init(info->ndev);
+		ret =3D nci_core_reset(info->ndev);
+		if (ret < 0)
+			goto out;
 =

+		ret =3D nci_core_init(info->ndev);
+	} else {
+		dev_info(&info->ndev->nfc_dev->dev,
+			 "skip bootloader mode\n");
+		ret =3D 0;
+	}
 out:
 	return ret;
 }
diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index 4cde6dd5c019..4b5352e2b915 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -280,7 +280,7 @@ static int s3fwrn5_fw_complete_update_mode(struct s3fwr=
n5_fw_info *fw_info)
 =

 #define S3FWRN5_FW_IMAGE_HEADER_SIZE 44
 =

-static int s3fwrn5_fw_request_firmware(struct s3fwrn5_fw_info *fw_info)
+int s3fwrn5_fw_request_firmware(struct s3fwrn5_fw_info *fw_info)
 {
 	struct s3fwrn5_fw_image *fw =3D &fw_info->fw;
 	u32 sig_off;
@@ -358,15 +358,6 @@ int s3fwrn5_fw_setup(struct s3fwrn5_fw_info *fw_info)
 	struct s3fwrn5_fw_cmd_get_bootinfo_rsp bootinfo;
 	int ret;
 =

-	/* Get firmware data */
-
-	ret =3D s3fwrn5_fw_request_firmware(fw_info);
-	if (ret < 0) {
-		dev_err(&fw_info->ndev->nfc_dev->dev,
-			"Failed to get fw file, ret=3D%02x\n", ret);
-		return ret;
-	}
-
 	/* Get bootloader info */
 =

 	ret =3D s3fwrn5_fw_get_bootinfo(fw_info, &bootinfo);
diff --git a/drivers/nfc/s3fwrn5/firmware.h b/drivers/nfc/s3fwrn5/firmware.h
index 3c83e6730d30..3a82ce5837fb 100644
--- a/drivers/nfc/s3fwrn5/firmware.h
+++ b/drivers/nfc/s3fwrn5/firmware.h
@@ -89,6 +89,7 @@ struct s3fwrn5_fw_info {
 	char parity;
 };
 =

+int s3fwrn5_fw_request_firmware(struct s3fwrn5_fw_info *fw_info);
 void s3fwrn5_fw_init(struct s3fwrn5_fw_info *fw_info, const char *fw_name);
 int s3fwrn5_fw_setup(struct s3fwrn5_fw_info *fw_info);
 bool s3fwrn5_fw_check_version(const struct s3fwrn5_fw_info *fw_info, u32 v=
ersion);
-- =

2.17.1

--===============5369703198757331078==--

