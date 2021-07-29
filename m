Content-Type: multipart/mixed; boundary="===============7763976717274527165=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 12/12] nfc: mrvl: constify static nfcmrvl_if_ops
Date: Thu, 29 Jul 2021 12:42:41 +0200
Message-ID: <20210729104241.48086-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7763976717274527165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

File-scope struct nfcmrvl_if_ops is not modified so can be made const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/i2c.c     | 2 +-
 drivers/nfc/nfcmrvl/main.c    | 2 +-
 drivers/nfc/nfcmrvl/nfcmrvl.h | 4 ++--
 drivers/nfc/nfcmrvl/spi.c     | 2 +-
 drivers/nfc/nfcmrvl/uart.c    | 2 +-
 drivers/nfc/nfcmrvl/usb.c     | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
index 6e659e77c8a2..c38b228006fd 100644
--- a/drivers/nfc/nfcmrvl/i2c.c
+++ b/drivers/nfc/nfcmrvl/i2c.c
@@ -146,7 +146,7 @@ static void nfcmrvl_i2c_nci_update_config(struct nfcmrv=
l_private *priv,
 {
 }
 =

-static struct nfcmrvl_if_ops i2c_ops =3D {
+static const struct nfcmrvl_if_ops i2c_ops =3D {
 	.nci_open =3D nfcmrvl_i2c_nci_open,
 	.nci_close =3D nfcmrvl_i2c_nci_close,
 	.nci_send =3D nfcmrvl_i2c_nci_send,
diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index d8e48bdaf652..2fcf545012b1 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -91,7 +91,7 @@ static const struct nci_ops nfcmrvl_nci_ops =3D {
 =

 struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 				void *drv_data,
-				struct nfcmrvl_if_ops *ops,
+				const struct nfcmrvl_if_ops *ops,
 				struct device *dev,
 				const struct nfcmrvl_platform_data *pdata)
 {
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index 84fafa95965e..165bd0a95190 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -77,7 +77,7 @@ struct nfcmrvl_private {
 	/* PHY type */
 	enum nfcmrvl_phy phy;
 	/* Low level driver ops */
-	struct nfcmrvl_if_ops *if_ops;
+	const struct nfcmrvl_if_ops *if_ops;
 };
 =

 struct nfcmrvl_if_ops {
@@ -92,7 +92,7 @@ void nfcmrvl_nci_unregister_dev(struct nfcmrvl_private *p=
riv);
 int nfcmrvl_nci_recv_frame(struct nfcmrvl_private *priv, struct sk_buff *s=
kb);
 struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 				void *drv_data,
-				struct nfcmrvl_if_ops *ops,
+				const struct nfcmrvl_if_ops *ops,
 				struct device *dev,
 				const struct nfcmrvl_platform_data *pdata);
 =

diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index 7b015bb33fc9..d64abd0c4df3 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -99,7 +99,7 @@ static void nfcmrvl_spi_nci_update_config(struct nfcmrvl_=
private *priv,
 	drv_data->nci_spi->xfer_speed_hz =3D config->clk;
 }
 =

-static struct nfcmrvl_if_ops spi_ops =3D {
+static const struct nfcmrvl_if_ops spi_ops =3D {
 	.nci_open =3D nfcmrvl_spi_nci_open,
 	.nci_close =3D nfcmrvl_spi_nci_close,
 	.nci_send =3D nfcmrvl_spi_nci_send,
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 63ac434675c8..9c92cbdc42f0 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -49,7 +49,7 @@ static void nfcmrvl_uart_nci_update_config(struct nfcmrvl=
_private *priv,
 			    config->flow_control);
 }
 =

-static struct nfcmrvl_if_ops uart_ops =3D {
+static const struct nfcmrvl_if_ops uart_ops =3D {
 	.nci_open =3D nfcmrvl_uart_nci_open,
 	.nci_close =3D nfcmrvl_uart_nci_close,
 	.nci_send =3D nfcmrvl_uart_nci_send,
diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index 9d649b45300b..a99aedff795d 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -264,7 +264,7 @@ static int nfcmrvl_usb_nci_send(struct nfcmrvl_private =
*priv,
 	return err;
 }
 =

-static struct nfcmrvl_if_ops usb_ops =3D {
+static const struct nfcmrvl_if_ops usb_ops =3D {
 	.nci_open =3D nfcmrvl_usb_nci_open,
 	.nci_close =3D nfcmrvl_usb_nci_close,
 	.nci_send =3D nfcmrvl_usb_nci_send,
-- =

2.27.0

--===============7763976717274527165==--

