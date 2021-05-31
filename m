Content-Type: multipart/mixed; boundary="===============6656515245117102097=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [RESEND PATCH 06/11] nfc: pn533: drop ftrace-like debugging messages
Date: Mon, 31 May 2021 09:38:57 +0200
Message-ID: <20210531073902.7111-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6656515245117102097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Now that the kernel has ftrace, any debugging calls that just do "made
it to this function!" and "leaving this function!" can be removed.
Better to use standard debugging tools.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn533/i2c.c   |  5 -----
 drivers/nfc/pn533/pn533.c | 46 ---------------------------------------
 drivers/nfc/pn533/usb.c   |  4 ----
 3 files changed, 55 deletions(-)

diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
index bfc617acabae..bb04fddb0504 100644
--- a/drivers/nfc/pn533/i2c.c
+++ b/drivers/nfc/pn533/i2c.c
@@ -174,9 +174,6 @@ static int pn533_i2c_probe(struct i2c_client *client,
 	struct pn533 *priv;
 	int r =3D 0;
 =

-	dev_dbg(&client->dev, "%s\n", __func__);
-	dev_dbg(&client->dev, "IRQ: %d\n", client->irq);
-
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		nfc_err(&client->dev, "Need I2C_FUNC_I2C\n");
 		return -ENODEV;
@@ -239,8 +236,6 @@ static int pn533_i2c_remove(struct i2c_client *client)
 {
 	struct pn533_i2c_phy *phy =3D i2c_get_clientdata(client);
 =

-	dev_dbg(&client->dev, "%s\n", __func__);
-
 	free_irq(client->irq, phy);
 =

 	pn53x_unregister_nfc(phy->priv);
diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index 2c7f9916f206..cd64bfe20402 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1075,8 +1075,6 @@ static int pn533_tm_get_data_complete(struct pn533 *d=
ev, void *arg,
 	u8 status, ret, mi;
 	int rc;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (IS_ERR(resp)) {
 		skb_queue_purge(&dev->resp_q);
 		return PTR_ERR(resp);
@@ -1124,8 +1122,6 @@ static void pn533_wq_tm_mi_recv(struct work_struct *w=
ork)
 	struct sk_buff *skb;
 	int rc;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	skb =3D pn533_alloc_skb(dev, 0);
 	if (!skb)
 		return;
@@ -1148,8 +1144,6 @@ static void pn533_wq_tm_mi_send(struct work_struct *w=
ork)
 	struct sk_buff *skb;
 	int rc;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	/* Grab the first skb in the queue */
 	skb =3D skb_dequeue(&dev->fragment_skb);
 	if (skb =3D=3D NULL) {	/* No more data */
@@ -1186,8 +1180,6 @@ static void pn533_wq_tg_get_data(struct work_struct *=
work)
 	struct sk_buff *skb;
 	int rc;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	skb =3D pn533_alloc_skb(dev, 0);
 	if (!skb)
 		return;
@@ -1206,8 +1198,6 @@ static int pn533_init_target_complete(struct pn533 *d=
ev, struct sk_buff *resp)
 	size_t gb_len;
 	int rc;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (resp->len < ATR_REQ_GB_OFFSET + 1)
 		return -EINVAL;
 =

@@ -1260,8 +1250,6 @@ static int pn533_rf_complete(struct pn533 *dev, void =
*arg,
 {
 	int rc =3D 0;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (IS_ERR(resp)) {
 		rc =3D PTR_ERR(resp);
 =

@@ -1283,8 +1271,6 @@ static void pn533_wq_rf(struct work_struct *work)
 	struct sk_buff *skb;
 	int rc;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	skb =3D pn533_alloc_skb(dev, 2);
 	if (!skb)
 		return;
@@ -1360,8 +1346,6 @@ static int pn533_poll_dep(struct nfc_dev *nfc_dev)
 	u8 *next, nfcid3[NFC_NFCID3_MAXSIZE];
 	u8 passive_data[PASSIVE_DATA_LEN] =3D {0x00, 0xff, 0xff, 0x00, 0x3};
 =

-	dev_dbg(dev->dev, "%s", __func__);
-
 	if (!dev->gb) {
 		dev->gb =3D nfc_get_local_general_bytes(nfc_dev, &dev->gb_len);
 =

@@ -1511,8 +1495,6 @@ static int pn533_poll_complete(struct pn533 *dev, voi=
d *arg,
 	struct pn533_poll_modulations *cur_mod;
 	int rc;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (IS_ERR(resp)) {
 		rc =3D PTR_ERR(resp);
 =

@@ -1783,8 +1765,6 @@ static int pn533_activate_target_nfcdep(struct pn533 =
*dev)
 	struct sk_buff *skb;
 	struct sk_buff *resp;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	skb =3D pn533_alloc_skb(dev, sizeof(u8) * 2); /*TG + Next*/
 	if (!skb)
 		return -ENOMEM;
@@ -1866,8 +1846,6 @@ static int pn533_deactivate_target_complete(struct pn=
533 *dev, void *arg,
 {
 	int rc =3D 0;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (IS_ERR(resp)) {
 		rc =3D PTR_ERR(resp);
 =

@@ -1892,8 +1870,6 @@ static void pn533_deactivate_target(struct nfc_dev *n=
fc_dev,
 	struct sk_buff *skb;
 	int rc;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (!dev->tgt_active_prot) {
 		nfc_err(dev->dev, "There is no active target\n");
 		return;
@@ -1988,8 +1964,6 @@ static int pn533_dep_link_up(struct nfc_dev *nfc_dev,=
 struct nfc_target *target,
 	u8 *next, *arg, nfcid3[NFC_NFCID3_MAXSIZE];
 	u8 passive_data[PASSIVE_DATA_LEN] =3D {0x00, 0xff, 0xff, 0x00, 0x3};
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (dev->poll_mod_count) {
 		nfc_err(dev->dev,
 			"Cannot bring the DEP link up while polling\n");
@@ -2067,8 +2041,6 @@ static int pn533_dep_link_down(struct nfc_dev *nfc_de=
v)
 {
 	struct pn533 *dev =3D nfc_get_drvdata(nfc_dev);
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	pn533_poll_reset_mod_list(dev);
 =

 	if (dev->tgt_mode || dev->tgt_active_prot)
@@ -2092,8 +2064,6 @@ static struct sk_buff *pn533_build_response(struct pn=
533 *dev)
 	struct sk_buff *skb, *tmp, *t;
 	unsigned int skb_len =3D 0, tmp_len =3D 0;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (skb_queue_empty(&dev->resp_q))
 		return NULL;
 =

@@ -2133,8 +2103,6 @@ static int pn533_data_exchange_complete(struct pn533 =
*dev, void *_arg,
 	int rc =3D 0;
 	u8 status, ret, mi;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (IS_ERR(resp)) {
 		rc =3D PTR_ERR(resp);
 		goto _error;
@@ -2288,8 +2256,6 @@ static int pn533_transceive(struct nfc_dev *nfc_dev,
 	struct pn533_data_exchange_arg *arg =3D NULL;
 	int rc;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (!dev->tgt_active_prot) {
 		nfc_err(dev->dev,
 			"Can't exchange data if there is no active target\n");
@@ -2356,8 +2322,6 @@ static int pn533_tm_send_complete(struct pn533 *dev, =
void *arg,
 {
 	u8 status;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (IS_ERR(resp))
 		return PTR_ERR(resp);
 =

@@ -2388,8 +2352,6 @@ static int pn533_tm_send(struct nfc_dev *nfc_dev, str=
uct sk_buff *skb)
 	struct pn533 *dev =3D nfc_get_drvdata(nfc_dev);
 	int rc;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	/* let's split in multiple chunks if size's too big */
 	if (skb->len > PN533_CMD_DATAEXCH_DATA_MAXLEN) {
 		rc =3D pn533_fill_fragment_skbs(dev, skb);
@@ -2426,8 +2388,6 @@ static void pn533_wq_mi_recv(struct work_struct *work)
 	struct sk_buff *skb;
 	int rc;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	skb =3D pn533_alloc_skb(dev, PN533_CMD_DATAEXCH_HEAD_LEN);
 	if (!skb)
 		goto error;
@@ -2476,8 +2436,6 @@ static void pn533_wq_mi_send(struct work_struct *work)
 	struct sk_buff *skb;
 	int rc;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	/* Grab the first skb in the queue */
 	skb =3D skb_dequeue(&dev->fragment_skb);
 =

@@ -2533,8 +2491,6 @@ static int pn533_set_configuration(struct pn533 *dev,=
 u8 cfgitem, u8 *cfgdata,
 	struct sk_buff *resp;
 	int skb_len;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	skb_len =3D sizeof(cfgitem) + cfgdata_len; /* cfgitem + cfgdata */
 =

 	skb =3D pn533_alloc_skb(dev, skb_len);
@@ -2580,8 +2536,6 @@ static int pn533_pasori_fw_reset(struct pn533 *dev)
 	struct sk_buff *skb;
 	struct sk_buff *resp;
 =

-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	skb =3D pn533_alloc_skb(dev, sizeof(u8));
 	if (!skb)
 		return -ENOMEM;
diff --git a/drivers/nfc/pn533/usb.c b/drivers/nfc/pn533/usb.c
index 84d2bfabf42b..bd7f7478d189 100644
--- a/drivers/nfc/pn533/usb.c
+++ b/drivers/nfc/pn533/usb.c
@@ -354,8 +354,6 @@ static void pn533_acr122_poweron_rdr_resp(struct urb *u=
rb)
 {
 	struct pn533_acr122_poweron_rdr_arg *arg =3D urb->context;
 =

-	dev_dbg(&urb->dev->dev, "%s\n", __func__);
-
 	print_hex_dump_debug("ACR122 RX: ", DUMP_PREFIX_NONE, 16, 1,
 		       urb->transfer_buffer, urb->transfer_buffer_length,
 		       false);
@@ -375,8 +373,6 @@ static int pn533_acr122_poweron_rdr(struct pn533_usb_ph=
y *phy)
 	void *cntx;
 	struct pn533_acr122_poweron_rdr_arg arg;
 =

-	dev_dbg(&phy->udev->dev, "%s\n", __func__);
-
 	buffer =3D kmemdup(cmd, sizeof(cmd), GFP_KERNEL);
 	if (!buffer)
 		return -ENOMEM;
-- =

2.27.0

--===============6656515245117102097==--

