Content-Type: multipart/mixed; boundary="===============5624055710902486452=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 11/12] nfc: mrvl: constify several pointers
Date: Thu, 29 Jul 2021 12:40:21 +0200
Message-ID: <20210729104022.47761-12-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5624055710902486452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Several functions do not modify pointed data so arguments and local
variables can be const for correctness and safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/fw_dnld.c | 16 +++++++++-------
 drivers/nfc/nfcmrvl/i2c.c     |  2 +-
 drivers/nfc/nfcmrvl/main.c    |  2 +-
 drivers/nfc/nfcmrvl/nfcmrvl.h |  2 +-
 drivers/nfc/nfcmrvl/spi.c     |  4 ++--
 drivers/nfc/nfcmrvl/uart.c    |  2 +-
 6 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/fw_dnld.c b/drivers/nfc/nfcmrvl/fw_dnld.c
index aaccb8b76b3e..edac56b01fd1 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.c
+++ b/drivers/nfc/nfcmrvl/fw_dnld.c
@@ -129,7 +129,7 @@ static void fw_dnld_timeout(struct timer_list *t)
 }
 =

 static int process_state_reset(struct nfcmrvl_private *priv,
-			       struct sk_buff *skb)
+			       const struct sk_buff *skb)
 {
 	if (sizeof(nci_pattern_core_reset_ntf) !=3D skb->len ||
 	    memcmp(skb->data, nci_pattern_core_reset_ntf,
@@ -145,7 +145,8 @@ static int process_state_reset(struct nfcmrvl_private *=
priv,
 	return 0;
 }
 =

-static int process_state_init(struct nfcmrvl_private *priv, struct sk_buff=
 *skb)
+static int process_state_init(struct nfcmrvl_private *priv,
+			      const struct sk_buff *skb)
 {
 	struct nci_core_set_config_cmd cmd;
 =

@@ -175,7 +176,7 @@ static void create_lc(struct nfcmrvl_private *priv)
 }
 =

 static int process_state_set_ref_clock(struct nfcmrvl_private *priv,
-				       struct sk_buff *skb)
+				       const struct sk_buff *skb)
 {
 	struct nci_core_set_config_cmd cmd;
 =

@@ -221,7 +222,7 @@ static int process_state_set_ref_clock(struct nfcmrvl_p=
rivate *priv,
 }
 =

 static int process_state_set_hi_config(struct nfcmrvl_private *priv,
-				       struct sk_buff *skb)
+				       const struct sk_buff *skb)
 {
 	if (sizeof(nci_pattern_core_set_config_rsp) !=3D skb->len ||
 	    memcmp(skb->data, nci_pattern_core_set_config_rsp, skb->len))
@@ -232,7 +233,7 @@ static int process_state_set_hi_config(struct nfcmrvl_p=
rivate *priv,
 }
 =

 static int process_state_open_lc(struct nfcmrvl_private *priv,
-				 struct sk_buff *skb)
+				 const struct sk_buff *skb)
 {
 	if (sizeof(nci_pattern_core_conn_create_rsp) >=3D skb->len ||
 	    memcmp(skb->data, nci_pattern_core_conn_create_rsp,
@@ -347,7 +348,7 @@ static int process_state_fw_dnld(struct nfcmrvl_private=
 *priv,
 }
 =

 static int process_state_close_lc(struct nfcmrvl_private *priv,
-				  struct sk_buff *skb)
+				  const struct sk_buff *skb)
 {
 	if (sizeof(nci_pattern_core_conn_close_rsp) !=3D skb->len ||
 	    memcmp(skb->data, nci_pattern_core_conn_close_rsp, skb->len))
@@ -358,7 +359,8 @@ static int process_state_close_lc(struct nfcmrvl_privat=
e *priv,
 	return 0;
 }
 =

-static int process_state_boot(struct nfcmrvl_private *priv, struct sk_buff=
 *skb)
+static int process_state_boot(struct nfcmrvl_private *priv,
+			      const struct sk_buff *skb)
 {
 	if (sizeof(nci_pattern_proprietary_boot_rsp) !=3D skb->len ||
 	    memcmp(skb->data, nci_pattern_proprietary_boot_rsp, skb->len))
diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
index 59a529e72d96..6e659e77c8a2 100644
--- a/drivers/nfc/nfcmrvl/i2c.c
+++ b/drivers/nfc/nfcmrvl/i2c.c
@@ -182,8 +182,8 @@ static int nfcmrvl_i2c_parse_dt(struct device_node *nod=
e,
 static int nfcmrvl_i2c_probe(struct i2c_client *client,
 			     const struct i2c_device_id *id)
 {
+	const struct nfcmrvl_platform_data *pdata;
 	struct nfcmrvl_i2c_drv_data *drv_data;
-	struct nfcmrvl_platform_data *pdata;
 	struct nfcmrvl_platform_data config;
 	int ret;
 =

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 6e9e7ce8792c..d8e48bdaf652 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -93,7 +93,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfc=
mrvl_phy phy,
 				void *drv_data,
 				struct nfcmrvl_if_ops *ops,
 				struct device *dev,
-				struct nfcmrvl_platform_data *pdata)
+				const struct nfcmrvl_platform_data *pdata)
 {
 	struct nfcmrvl_private *priv;
 	int rc;
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index a715543bc9bf..84fafa95965e 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -94,7 +94,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfc=
mrvl_phy phy,
 				void *drv_data,
 				struct nfcmrvl_if_ops *ops,
 				struct device *dev,
-				struct nfcmrvl_platform_data *pdata);
+				const struct nfcmrvl_platform_data *pdata);
 =

 =

 void nfcmrvl_chip_reset(struct nfcmrvl_private *priv);
diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index 66696321c645..7b015bb33fc9 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -106,7 +106,7 @@ static struct nfcmrvl_if_ops spi_ops =3D {
 	.nci_update_config =3D nfcmrvl_spi_nci_update_config,
 };
 =

-static int nfcmrvl_spi_parse_dt(struct device_node *node,
+static int nfcmrvl_spi_parse_dt(const struct device_node *node,
 				struct nfcmrvl_platform_data *pdata)
 {
 	int ret;
@@ -129,7 +129,7 @@ static int nfcmrvl_spi_parse_dt(struct device_node *nod=
e,
 =

 static int nfcmrvl_spi_probe(struct spi_device *spi)
 {
-	struct nfcmrvl_platform_data *pdata;
+	const struct nfcmrvl_platform_data *pdata;
 	struct nfcmrvl_platform_data config;
 	struct nfcmrvl_spi_drv_data *drv_data;
 	int ret =3D 0;
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 50d86c90b9dd..63ac434675c8 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -98,8 +98,8 @@ static int nfcmrvl_uart_parse_dt(struct device_node *node,
 static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
 {
 	struct nfcmrvl_private *priv;
-	struct nfcmrvl_platform_data *pdata =3D NULL;
 	struct nfcmrvl_platform_data config;
+	const struct nfcmrvl_platform_data *pdata =3D NULL;
 	struct device *dev =3D nu->tty->dev;
 =

 	/*
-- =

2.27.0

--===============5624055710902486452==--

