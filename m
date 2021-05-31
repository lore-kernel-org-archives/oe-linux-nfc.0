Content-Type: multipart/mixed; boundary="===============2364541683611608771=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [RESEND PATCH 10/11] nfc: st-nci: drop ftrace-like debugging messages
Date: Mon, 31 May 2021 09:39:01 +0200
Message-ID: <20210531073902.7111-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2364541683611608771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Now that the kernel has ftrace, any debugging calls that just do "made
it to this function!" and "leaving this function!" can be removed.
Better to use standard debugging tools.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/st-nci/i2c.c | 5 -----
 drivers/nfc/st-nci/se.c  | 6 ------
 drivers/nfc/st-nci/spi.c | 5 -----
 3 files changed, 16 deletions(-)

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 663d1cc19b81..46981405e8b1 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -206,9 +206,6 @@ static int st_nci_i2c_probe(struct i2c_client *client,
 	struct st_nci_i2c_phy *phy;
 	int r;
 =

-	dev_dbg(&client->dev, "%s\n", __func__);
-	dev_dbg(&client->dev, "IRQ: %d\n", client->irq);
-
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		nfc_err(&client->dev, "Need I2C_FUNC_I2C\n");
 		return -ENODEV;
@@ -261,8 +258,6 @@ static int st_nci_i2c_remove(struct i2c_client *client)
 {
 	struct st_nci_i2c_phy *phy =3D i2c_get_clientdata(client);
 =

-	dev_dbg(&client->dev, "%s\n", __func__);
-
 	ndlc_remove(phy->ndlc);
 =

 	return 0;
diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index 8657e025166f..5fd89f72969d 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -470,8 +470,6 @@ int st_nci_disable_se(struct nci_dev *ndev, u32 se_idx)
 {
 	int r;
 =

-	pr_debug("st_nci_disable_se\n");
-
 	/*
 	 * According to upper layer, se_idx =3D=3D NFC_SE_UICC when
 	 * info->se_info.se_status->is_uicc_enable is true should never happen
@@ -496,8 +494,6 @@ int st_nci_enable_se(struct nci_dev *ndev, u32 se_idx)
 {
 	int r;
 =

-	pr_debug("st_nci_enable_se\n");
-
 	/*
 	 * According to upper layer, se_idx =3D=3D NFC_SE_UICC when
 	 * info->se_info.se_status->is_uicc_enable is true should never happen.
@@ -602,8 +598,6 @@ int st_nci_discover_se(struct nci_dev *ndev)
 	int se_count =3D 0;
 	struct st_nci_info *info =3D nci_get_drvdata(ndev);
 =

-	pr_debug("st_nci_discover_se\n");
-
 	r =3D st_nci_hci_network_init(ndev);
 	if (r !=3D 0)
 		return r;
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index 5f1a2173b2e7..250d56f204c3 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -216,9 +216,6 @@ static int st_nci_spi_probe(struct spi_device *dev)
 	struct st_nci_spi_phy *phy;
 	int r;
 =

-	dev_dbg(&dev->dev, "%s\n", __func__);
-	dev_dbg(&dev->dev, "IRQ: %d\n", dev->irq);
-
 	/* Check SPI platform functionnalities */
 	if (!dev) {
 		pr_debug("%s: dev is NULL. Device is not accessible.\n",
@@ -274,8 +271,6 @@ static int st_nci_spi_remove(struct spi_device *dev)
 {
 	struct st_nci_spi_phy *phy =3D spi_get_drvdata(dev);
 =

-	dev_dbg(&dev->dev, "%s\n", __func__);
-
 	ndlc_remove(phy->ndlc);
 =

 	return 0;
-- =

2.27.0

--===============2364541683611608771==--

