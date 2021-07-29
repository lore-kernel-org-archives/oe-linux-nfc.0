Content-Type: multipart/mixed; boundary="===============4412745477713015576=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 09/12] nfc: fdp: constify several pointers
Date: Thu, 29 Jul 2021 12:40:19 +0200
Message-ID: <20210729104022.47761-10-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4412745477713015576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Several functions do not modify pointed data so arguments and local
variables can be const for correctness and safety.  This allows also
making file-scope nci_core_get_config_otp_ram_version array const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/fdp/fdp.c | 18 +++++++++---------
 drivers/nfc/fdp/fdp.h |  2 +-
 drivers/nfc/fdp/i2c.c |  6 +++---
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/nfc/fdp/fdp.c b/drivers/nfc/fdp/fdp.c
index 3f5fba922c4d..c6b3334f24c9 100644
--- a/drivers/nfc/fdp/fdp.c
+++ b/drivers/nfc/fdp/fdp.c
@@ -52,7 +52,7 @@ struct fdp_nci_info {
 	u32 limited_otp_version;
 	u8 key_index;
 =

-	u8 *fw_vsc_cfg;
+	const u8 *fw_vsc_cfg;
 	u8 clock_type;
 	u32 clock_freq;
 =

@@ -65,7 +65,7 @@ struct fdp_nci_info {
 	wait_queue_head_t setup_wq;
 };
 =

-static u8 nci_core_get_config_otp_ram_version[5] =3D {
+static const u8 nci_core_get_config_otp_ram_version[5] =3D {
 	0x04,
 	NCI_PARAM_ID_FW_RAM_VERSION,
 	NCI_PARAM_ID_FW_OTP_VERSION,
@@ -111,7 +111,7 @@ static inline int fdp_nci_patch_cmd(struct nci_dev *nde=
v, u8 type)
 }
 =

 static inline int fdp_nci_set_production_data(struct nci_dev *ndev, u8 len,
-					      char *data)
+					      const char *data)
 {
 	return nci_prop_cmd(ndev, NCI_OP_PROP_SET_PDATA_OID, len, data);
 }
@@ -236,7 +236,7 @@ static int fdp_nci_send_patch(struct nci_dev *ndev, u8 =
conn_id, u8 type)
 =

 static int fdp_nci_open(struct nci_dev *ndev)
 {
-	struct fdp_nci_info *info =3D nci_get_drvdata(ndev);
+	const struct fdp_nci_info *info =3D nci_get_drvdata(ndev);
 =

 	return info->phy_ops->enable(info->phy);
 }
@@ -260,7 +260,7 @@ static int fdp_nci_request_firmware(struct nci_dev *nde=
v)
 {
 	struct fdp_nci_info *info =3D nci_get_drvdata(ndev);
 	struct device *dev =3D &info->phy->i2c_dev->dev;
-	u8 *data;
+	const u8 *data;
 	int r;
 =

 	r =3D request_firmware(&info->ram_patch, FDP_RAM_PATCH_NAME, dev);
@@ -269,7 +269,7 @@ static int fdp_nci_request_firmware(struct nci_dev *nde=
v)
 		return r;
 	}
 =

-	data =3D (u8 *) info->ram_patch->data;
+	data =3D info->ram_patch->data;
 	info->ram_patch_version =3D
 		data[FDP_FW_HEADER_SIZE] |
 		(data[FDP_FW_HEADER_SIZE + 1] << 8) |
@@ -610,9 +610,9 @@ static int fdp_nci_core_get_config_rsp_packet(struct nc=
i_dev *ndev,
 {
 	struct fdp_nci_info *info =3D nci_get_drvdata(ndev);
 	struct device *dev =3D &info->phy->i2c_dev->dev;
-	struct nci_core_get_config_rsp *rsp =3D (void *) skb->data;
+	const struct nci_core_get_config_rsp *rsp =3D (void *) skb->data;
 	unsigned int i;
-	u8 *p;
+	const u8 *p;
 =

 	if (rsp->status =3D=3D NCI_STATUS_OK) {
 =

@@ -691,7 +691,7 @@ static const struct nci_ops nci_ops =3D {
 int fdp_nci_probe(struct fdp_i2c_phy *phy, const struct nfc_phy_ops *phy_o=
ps,
 			struct nci_dev **ndevp, int tx_headroom,
 			int tx_tailroom, u8 clock_type, u32 clock_freq,
-			u8 *fw_vsc_cfg)
+			const u8 *fw_vsc_cfg)
 {
 	struct device *dev =3D &phy->i2c_dev->dev;
 	struct fdp_nci_info *info;
diff --git a/drivers/nfc/fdp/fdp.h b/drivers/nfc/fdp/fdp.h
index dc048d4b977e..2e9161a4d7bf 100644
--- a/drivers/nfc/fdp/fdp.h
+++ b/drivers/nfc/fdp/fdp.h
@@ -23,7 +23,7 @@ struct fdp_i2c_phy {
 =

 int fdp_nci_probe(struct fdp_i2c_phy *phy, const struct nfc_phy_ops *phy_o=
ps,
 		  struct nci_dev **ndev, int tx_headroom, int tx_tailroom,
-		  u8 clock_type, u32 clock_freq, u8 *fw_vsc_cfg);
+		  u8 clock_type, u32 clock_freq, const u8 *fw_vsc_cfg);
 void fdp_nci_remove(struct nci_dev *ndev);
 =

 #endif /* __LOCAL_FDP_H_ */
diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
index 98e1876c9468..051c43a2a52f 100644
--- a/drivers/nfc/fdp/i2c.c
+++ b/drivers/nfc/fdp/i2c.c
@@ -36,7 +36,7 @@
 	print_hex_dump(KERN_DEBUG, prefix": ", DUMP_PREFIX_OFFSET,	\
 		       16, 1, (skb)->data, (skb)->len, 0)
 =

-static void fdp_nci_i2c_reset(struct fdp_i2c_phy *phy)
+static void fdp_nci_i2c_reset(const struct fdp_i2c_phy *phy)
 {
 	/* Reset RST/WakeUP for at least 100 micro-second */
 	gpiod_set_value_cansleep(phy->power_gpio, FDP_POWER_OFF);
@@ -47,7 +47,7 @@ static void fdp_nci_i2c_reset(struct fdp_i2c_phy *phy)
 =

 static int fdp_nci_i2c_enable(void *phy_id)
 {
-	struct fdp_i2c_phy *phy =3D phy_id;
+	const struct fdp_i2c_phy *phy =3D phy_id;
 =

 	fdp_nci_i2c_reset(phy);
 =

@@ -56,7 +56,7 @@ static int fdp_nci_i2c_enable(void *phy_id)
 =

 static void fdp_nci_i2c_disable(void *phy_id)
 {
-	struct fdp_i2c_phy *phy =3D phy_id;
+	const struct fdp_i2c_phy *phy =3D phy_id;
 =

 	fdp_nci_i2c_reset(phy);
 }
-- =

2.27.0

--===============4412745477713015576==--

