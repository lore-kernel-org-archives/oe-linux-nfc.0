Content-Type: multipart/mixed; boundary="===============2991762966802816033=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [RESEND PATCH 01/11] nfc: fdp: drop ftrace-like debugging messages
Date: Mon, 31 May 2021 09:35:12 +0200
Message-ID: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2991762966802816033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Now that the kernel has ftrace, any debugging calls that just do "made
it to this function!" and "leaving this function!" can be removed.
Better to use standard debugging tools.

This allows also to remove several local variables and entire
fdp_nci_recv_frame() function (whose purpose was only to log).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/fdp/fdp.c | 31 -------------------------------
 drivers/nfc/fdp/fdp.h |  1 -
 drivers/nfc/fdp/i2c.c | 12 +-----------
 3 files changed, 1 insertion(+), 43 deletions(-)

diff --git a/drivers/nfc/fdp/fdp.c b/drivers/nfc/fdp/fdp.c
index 125d71c27b8b..7863b2536999 100644
--- a/drivers/nfc/fdp/fdp.c
+++ b/drivers/nfc/fdp/fdp.c
@@ -237,28 +237,18 @@ static int fdp_nci_send_patch(struct nci_dev *ndev, u=
8 conn_id, u8 type)
 static int fdp_nci_open(struct nci_dev *ndev)
 {
 	struct fdp_nci_info *info =3D nci_get_drvdata(ndev);
-	struct device *dev =3D &info->phy->i2c_dev->dev;
-
-	dev_dbg(dev, "%s\n", __func__);
 =

 	return info->phy_ops->enable(info->phy);
 }
 =

 static int fdp_nci_close(struct nci_dev *ndev)
 {
-	struct fdp_nci_info *info =3D nci_get_drvdata(ndev);
-	struct device *dev =3D &info->phy->i2c_dev->dev;
-
-	dev_dbg(dev, "%s\n", __func__);
 	return 0;
 }
 =

 static int fdp_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
 {
 	struct fdp_nci_info *info =3D nci_get_drvdata(ndev);
-	struct device *dev =3D &info->phy->i2c_dev->dev;
-
-	dev_dbg(dev, "%s\n", __func__);
 =

 	if (atomic_dec_and_test(&info->data_pkt_counter))
 		info->data_pkt_counter_cb(ndev);
@@ -266,16 +256,6 @@ static int fdp_nci_send(struct nci_dev *ndev, struct s=
k_buff *skb)
 	return info->phy_ops->write(info->phy, skb);
 }
 =

-int fdp_nci_recv_frame(struct nci_dev *ndev, struct sk_buff *skb)
-{
-	struct fdp_nci_info *info =3D nci_get_drvdata(ndev);
-	struct device *dev =3D &info->phy->i2c_dev->dev;
-
-	dev_dbg(dev, "%s\n", __func__);
-	return nci_recv_frame(ndev, skb);
-}
-EXPORT_SYMBOL(fdp_nci_recv_frame);
-
 static int fdp_nci_request_firmware(struct nci_dev *ndev)
 {
 	struct fdp_nci_info *info =3D nci_get_drvdata(ndev);
@@ -476,8 +456,6 @@ static int fdp_nci_setup(struct nci_dev *ndev)
 	int r;
 	u8 patched =3D 0;
 =

-	dev_dbg(dev, "%s\n", __func__);
-
 	r =3D nci_core_init(ndev);
 	if (r)
 		goto error;
@@ -585,9 +563,7 @@ static int fdp_nci_core_reset_ntf_packet(struct nci_dev=
 *ndev,
 					  struct sk_buff *skb)
 {
 	struct fdp_nci_info *info =3D nci_get_drvdata(ndev);
-	struct device *dev =3D &info->phy->i2c_dev->dev;
 =

-	dev_dbg(dev, "%s\n", __func__);
 	info->setup_reset_ntf =3D 1;
 	wake_up(&info->setup_wq);
 =

@@ -598,9 +574,7 @@ static int fdp_nci_prop_patch_ntf_packet(struct nci_dev=
 *ndev,
 					  struct sk_buff *skb)
 {
 	struct fdp_nci_info *info =3D nci_get_drvdata(ndev);
-	struct device *dev =3D &info->phy->i2c_dev->dev;
 =

-	dev_dbg(dev, "%s\n", __func__);
 	info->setup_patch_ntf =3D 1;
 	info->setup_patch_status =3D skb->data[0];
 	wake_up(&info->setup_wq);
@@ -773,11 +747,6 @@ EXPORT_SYMBOL(fdp_nci_probe);
 =

 void fdp_nci_remove(struct nci_dev *ndev)
 {
-	struct fdp_nci_info *info =3D nci_get_drvdata(ndev);
-	struct device *dev =3D &info->phy->i2c_dev->dev;
-
-	dev_dbg(dev, "%s\n", __func__);
-
 	nci_unregister_device(ndev);
 	nci_free_device(ndev);
 }
diff --git a/drivers/nfc/fdp/fdp.h b/drivers/nfc/fdp/fdp.h
index 9bd1f3f23e2d..ead3b21ccae6 100644
--- a/drivers/nfc/fdp/fdp.h
+++ b/drivers/nfc/fdp/fdp.h
@@ -25,6 +25,5 @@ int fdp_nci_probe(struct fdp_i2c_phy *phy, struct nfc_phy=
_ops *phy_ops,
 		  struct nci_dev **ndev, int tx_headroom, int tx_tailroom,
 		  u8 clock_type, u32 clock_freq, u8 *fw_vsc_cfg);
 void fdp_nci_remove(struct nci_dev *ndev);
-int fdp_nci_recv_frame(struct nci_dev *ndev, struct sk_buff *skb);
 =

 #endif /* __LOCAL_FDP_H_ */
diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
index 997e0806821a..c5596e514648 100644
--- a/drivers/nfc/fdp/i2c.c
+++ b/drivers/nfc/fdp/i2c.c
@@ -49,7 +49,6 @@ static int fdp_nci_i2c_enable(void *phy_id)
 {
 	struct fdp_i2c_phy *phy =3D phy_id;
 =

-	dev_dbg(&phy->i2c_dev->dev, "%s\n", __func__);
 	fdp_nci_i2c_reset(phy);
 =

 	return 0;
@@ -59,7 +58,6 @@ static void fdp_nci_i2c_disable(void *phy_id)
 {
 	struct fdp_i2c_phy *phy =3D phy_id;
 =

-	dev_dbg(&phy->i2c_dev->dev, "%s\n", __func__);
 	fdp_nci_i2c_reset(phy);
 }
 =

@@ -197,7 +195,6 @@ static int fdp_nci_i2c_read(struct fdp_i2c_phy *phy, st=
ruct sk_buff **skb)
 static irqreturn_t fdp_nci_i2c_irq_thread_fn(int irq, void *phy_id)
 {
 	struct fdp_i2c_phy *phy =3D phy_id;
-	struct i2c_client *client;
 	struct sk_buff *skb;
 	int r;
 =

@@ -206,9 +203,6 @@ static irqreturn_t fdp_nci_i2c_irq_thread_fn(int irq, v=
oid *phy_id)
 		return IRQ_NONE;
 	}
 =

-	client =3D phy->i2c_dev;
-	dev_dbg(&client->dev, "%s\n", __func__);
-
 	r =3D fdp_nci_i2c_read(phy, &skb);
 =

 	if (r =3D=3D -EREMOTEIO)
@@ -217,7 +211,7 @@ static irqreturn_t fdp_nci_i2c_irq_thread_fn(int irq, v=
oid *phy_id)
 		return IRQ_HANDLED;
 =

 	if (skb !=3D NULL)
-		fdp_nci_recv_frame(phy->ndev, skb);
+		nci_recv_frame(phy->ndev, skb);
 =

 	return IRQ_HANDLED;
 }
@@ -288,8 +282,6 @@ static int fdp_nci_i2c_probe(struct i2c_client *client)
 	u32 clock_freq;
 	int r =3D 0;
 =

-	dev_dbg(dev, "%s\n", __func__);
-
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		nfc_err(dev, "No I2C_FUNC_I2C support\n");
 		return -ENODEV;
@@ -351,8 +343,6 @@ static int fdp_nci_i2c_remove(struct i2c_client *client)
 {
 	struct fdp_i2c_phy *phy =3D i2c_get_clientdata(client);
 =

-	dev_dbg(&client->dev, "%s\n", __func__);
-
 	fdp_nci_remove(phy->ndev);
 	fdp_nci_i2c_disable(phy);
 =

-- =

2.27.0

--===============2991762966802816033==--

