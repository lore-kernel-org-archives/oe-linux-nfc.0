Content-Type: multipart/mixed; boundary="===============5255242517494099130=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next] nfc: s3fwrn5: skip the NFC bootloader mode
Date: Fri, 04 Dec 2020 07:52:57 +0900
Message-ID: <20201203225257.2446-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5255242517494099130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

If there isn't a proper NFC firmware image, Bootloader mode will be
skipped.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---

 ChangeLog:
  v2:
   - change the commit message.
   - change the skip handling code.

 drivers/nfc/s3fwrn5/core.c     | 23 +++++++++++++++++++++--
 drivers/nfc/s3fwrn5/firmware.c | 11 +----------
 drivers/nfc/s3fwrn5/firmware.h |  1 +
 3 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/core.c b/drivers/nfc/s3fwrn5/core.c
index f8e5d78d9078..c00b7a07c3ee 100644
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
@@ -109,6 +122,12 @@ static int s3fwrn5_nci_post_setup(struct nci_dev *ndev)
 	struct s3fwrn5_info *info =3D nci_get_drvdata(ndev);
 	int ret;
 =

+	if (s3fwrn5_firmware_init(info)) {
+		//skip bootloader mode
+		ret =3D 0;
+		goto out;
+	}
+
 	ret =3D s3fwrn5_firmware_update(info);
 	if (ret < 0)
 		goto out;
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

--===============5255242517494099130==--

