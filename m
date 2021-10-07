Content-Type: multipart/mixed; boundary="===============5819022050195641930=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [RESEND PATCH v2 3/7] nfc: s3fwrn5: simplify dereferencing pointer to struct device
Date: Thu, 07 Oct 2021 15:30:17 +0200
Message-ID: <20211007133021.32704-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5819022050195641930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Simplify the code dereferencing several pointers to reach the struct
device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/s3fwrn5/firmware.c | 29 +++++++++++------------------
 drivers/nfc/s3fwrn5/nci.c      | 18 +++++++-----------
 2 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index 1af7a1e632cf..c20fdbac51c5 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -357,6 +357,7 @@ s3fwrn5_fw_is_custom(const struct s3fwrn5_fw_cmd_get_bo=
otinfo_rsp *bootinfo)
 =

 int s3fwrn5_fw_setup(struct s3fwrn5_fw_info *fw_info)
 {
+	struct device *dev =3D &fw_info->ndev->nfc_dev->dev;
 	struct s3fwrn5_fw_cmd_get_bootinfo_rsp bootinfo;
 	int ret;
 =

@@ -364,8 +365,7 @@ int s3fwrn5_fw_setup(struct s3fwrn5_fw_info *fw_info)
 =

 	ret =3D s3fwrn5_fw_get_bootinfo(fw_info, &bootinfo);
 	if (ret < 0) {
-		dev_err(&fw_info->ndev->nfc_dev->dev,
-			"Failed to get bootinfo, ret=3D%02x\n", ret);
+		dev_err(dev, "Failed to get bootinfo, ret=3D%02x\n", ret);
 		goto err;
 	}
 =

@@ -373,8 +373,7 @@ int s3fwrn5_fw_setup(struct s3fwrn5_fw_info *fw_info)
 =

 	ret =3D s3fwrn5_fw_get_base_addr(&bootinfo, &fw_info->base_addr);
 	if (ret < 0) {
-		dev_err(&fw_info->ndev->nfc_dev->dev,
-			"Unknown hardware version\n");
+		dev_err(dev, "Unknown hardware version\n");
 		goto err;
 	}
 =

@@ -409,6 +408,7 @@ bool s3fwrn5_fw_check_version(const struct s3fwrn5_fw_i=
nfo *fw_info, u32 version
 =

 int s3fwrn5_fw_download(struct s3fwrn5_fw_info *fw_info)
 {
+	struct device *dev =3D &fw_info->ndev->nfc_dev->dev;
 	struct s3fwrn5_fw_image *fw =3D &fw_info->fw;
 	u8 hash_data[SHA1_DIGEST_SIZE];
 	struct crypto_shash *tfm;
@@ -421,8 +421,7 @@ int s3fwrn5_fw_download(struct s3fwrn5_fw_info *fw_info)
 =

 	tfm =3D crypto_alloc_shash("sha1", 0, 0);
 	if (IS_ERR(tfm)) {
-		dev_err(&fw_info->ndev->nfc_dev->dev,
-			"Cannot allocate shash (code=3D%pe)\n", tfm);
+		dev_err(dev, "Cannot allocate shash (code=3D%pe)\n", tfm);
 		return PTR_ERR(tfm);
 	}
 =

@@ -430,21 +429,18 @@ int s3fwrn5_fw_download(struct s3fwrn5_fw_info *fw_in=
fo)
 =

 	crypto_free_shash(tfm);
 	if (ret) {
-		dev_err(&fw_info->ndev->nfc_dev->dev,
-			"Cannot compute hash (code=3D%d)\n", ret);
+		dev_err(dev, "Cannot compute hash (code=3D%d)\n", ret);
 		return ret;
 	}
 =

 	/* Firmware update process */
 =

-	dev_info(&fw_info->ndev->nfc_dev->dev,
-		"Firmware update: %s\n", fw_info->fw_name);
+	dev_info(dev, "Firmware update: %s\n", fw_info->fw_name);
 =

 	ret =3D s3fwrn5_fw_enter_update_mode(fw_info, hash_data,
 		SHA1_DIGEST_SIZE, fw_info->sig, fw_info->sig_size);
 	if (ret < 0) {
-		dev_err(&fw_info->ndev->nfc_dev->dev,
-			"Unable to enter update mode\n");
+		dev_err(dev, "Unable to enter update mode\n");
 		return ret;
 	}
 =

@@ -452,21 +448,18 @@ int s3fwrn5_fw_download(struct s3fwrn5_fw_info *fw_in=
fo)
 		ret =3D s3fwrn5_fw_update_sector(fw_info,
 			fw_info->base_addr + off, fw->image + off);
 		if (ret < 0) {
-			dev_err(&fw_info->ndev->nfc_dev->dev,
-				"Firmware update error (code=3D%d)\n", ret);
+			dev_err(dev, "Firmware update error (code=3D%d)\n", ret);
 			return ret;
 		}
 	}
 =

 	ret =3D s3fwrn5_fw_complete_update_mode(fw_info);
 	if (ret < 0) {
-		dev_err(&fw_info->ndev->nfc_dev->dev,
-			"Unable to complete update mode\n");
+		dev_err(dev, "Unable to complete update mode\n");
 		return ret;
 	}
 =

-	dev_info(&fw_info->ndev->nfc_dev->dev,
-		"Firmware update: success\n");
+	dev_info(dev, "Firmware update: success\n");
 =

 	return ret;
 }
diff --git a/drivers/nfc/s3fwrn5/nci.c b/drivers/nfc/s3fwrn5/nci.c
index e374e670b36b..ca6828f55ba0 100644
--- a/drivers/nfc/s3fwrn5/nci.c
+++ b/drivers/nfc/s3fwrn5/nci.c
@@ -47,6 +47,7 @@ const struct nci_driver_ops s3fwrn5_nci_prop_ops[4] =3D {
 =

 int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *info, const char *fw_nam=
e)
 {
+	struct device *dev =3D &info->ndev->nfc_dev->dev;
 	const struct firmware *fw;
 	struct nci_prop_fw_cfg_cmd fw_cfg;
 	struct nci_prop_set_rfreg_cmd set_rfreg;
@@ -55,7 +56,7 @@ int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *info, c=
onst char *fw_name)
 	int i, len;
 	int ret;
 =

-	ret =3D request_firmware(&fw, fw_name, &info->ndev->nfc_dev->dev);
+	ret =3D request_firmware(&fw, fw_name, dev);
 	if (ret < 0)
 		return ret;
 =

@@ -77,13 +78,11 @@ int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *info,=
 const char *fw_name)
 =

 	/* Start rfreg configuration */
 =

-	dev_info(&info->ndev->nfc_dev->dev,
-		"rfreg configuration update: %s\n", fw_name);
+	dev_info(dev, "rfreg configuration update: %s\n", fw_name);
 =

 	ret =3D nci_prop_cmd(info->ndev, NCI_PROP_START_RFREG, 0, NULL);
 	if (ret < 0) {
-		dev_err(&info->ndev->nfc_dev->dev,
-			"Unable to start rfreg update\n");
+		dev_err(dev, "Unable to start rfreg update\n");
 		goto out;
 	}
 =

@@ -97,8 +96,7 @@ int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *info, c=
onst char *fw_name)
 		ret =3D nci_prop_cmd(info->ndev, NCI_PROP_SET_RFREG,
 			len+1, (__u8 *)&set_rfreg);
 		if (ret < 0) {
-			dev_err(&info->ndev->nfc_dev->dev,
-				"rfreg update error (code=3D%d)\n", ret);
+			dev_err(dev, "rfreg update error (code=3D%d)\n", ret);
 			goto out;
 		}
 		set_rfreg.index++;
@@ -110,13 +108,11 @@ int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *inf=
o, const char *fw_name)
 	ret =3D nci_prop_cmd(info->ndev, NCI_PROP_STOP_RFREG,
 		sizeof(stop_rfreg), (__u8 *)&stop_rfreg);
 	if (ret < 0) {
-		dev_err(&info->ndev->nfc_dev->dev,
-			"Unable to stop rfreg update\n");
+		dev_err(dev, "Unable to stop rfreg update\n");
 		goto out;
 	}
 =

-	dev_info(&info->ndev->nfc_dev->dev,
-		"rfreg configuration update: success\n");
+	dev_info(dev, "rfreg configuration update: success\n");
 out:
 	release_firmware(fw);
 	return ret;
-- =

2.30.2

--===============5819022050195641930==--

