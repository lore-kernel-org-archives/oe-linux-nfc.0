Content-Type: multipart/mixed; boundary="===============8738905066441703592=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 04/11] nfc: mrvl: correct minor coding style violations
Date: Fri, 28 May 2021 10:55:27 -0400
Message-ID: <20210528145534.125460-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528145330.125055-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8738905066441703592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Correct block comments and usage of tab in function definition.  No
functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/fw_dnld.c | 10 +++++-----
 drivers/nfc/nfcmrvl/nfcmrvl.h | 12 ++++++------
 drivers/nfc/nfcmrvl/uart.c    | 16 ++++++++--------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/fw_dnld.c b/drivers/nfc/nfcmrvl/fw_dnld.c
index 05df7ad224d5..c84658448415 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.c
+++ b/drivers/nfc/nfcmrvl/fw_dnld.c
@@ -39,8 +39,8 @@ enum {
 };
 =

 /*
-** Patterns for responses
-*/
+ * Patterns for responses
+ */
 =

 static const uint8_t nci_pattern_core_reset_ntf[] =3D {
 	0x60, 0x00, 0x02, 0xA0, 0x01
@@ -440,7 +440,7 @@ static void fw_dnld_rx_work(struct work_struct *work)
 	}
 }
 =

-int	nfcmrvl_fw_dnld_init(struct nfcmrvl_private *priv)
+int nfcmrvl_fw_dnld_init(struct nfcmrvl_private *priv)
 {
 	char name[32];
 =

@@ -454,12 +454,12 @@ int	nfcmrvl_fw_dnld_init(struct nfcmrvl_private *priv)
 	return 0;
 }
 =

-void	nfcmrvl_fw_dnld_deinit(struct nfcmrvl_private *priv)
+void nfcmrvl_fw_dnld_deinit(struct nfcmrvl_private *priv)
 {
 	destroy_workqueue(priv->fw_dnld.rx_wq);
 }
 =

-void	nfcmrvl_fw_dnld_recv_frame(struct nfcmrvl_private *priv,
+void nfcmrvl_fw_dnld_recv_frame(struct nfcmrvl_private *priv,
 				   struct sk_buff *skb)
 {
 	/* Discard command timer */
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index 0b4220bb91bc..a715543bc9bf 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -25,16 +25,16 @@
 #define NFCMRVL_NCI_MAX_EVENT_SIZE		260
 =

 /*
-** NCI FW Parmaters
-*/
+ * NCI FW Parameters
+ */
 =

 #define NFCMRVL_PB_BAIL_OUT			0x11
 #define NFCMRVL_PROP_REF_CLOCK			0xF0
 #define NFCMRVL_PROP_SET_HI_CONFIG		0xF1
 =

 /*
-** HCI defines
-*/
+ * HCI defines
+ */
 =

 #define NFCMRVL_HCI_EVENT_HEADER_SIZE		0x04
 #define NFCMRVL_HCI_EVENT_CODE			0x04
@@ -67,8 +67,8 @@ struct nfcmrvl_private {
 	bool support_fw_dnld;
 =

 	/*
-	** PHY related information
-	*/
+	 * PHY related information
+	 */
 =

 	/* PHY driver context */
 	void *drv_data;
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index d7ba5b5c653c..ed85645eb885 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -18,8 +18,8 @@ static unsigned int break_control;
 static int reset_n_io =3D -EINVAL;
 =

 /*
-** NFCMRVL NCI OPS
-*/
+ * NFCMRVL NCI OPS
+ */
 =

 static int nfcmrvl_uart_nci_open(struct nfcmrvl_private *priv)
 {
@@ -92,8 +92,8 @@ static int nfcmrvl_uart_parse_dt(struct device_node *node,
 }
 =

 /*
-** NCI UART OPS
-*/
+ * NCI UART OPS
+ */
 =

 static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
 {
@@ -167,10 +167,10 @@ static void nfcmrvl_nci_uart_tx_done(struct nci_uart =
*nu)
 		return;
 =

 	/*
-	** To ensure that if the NFCC goes in DEEP SLEEP sate we can wake him
-	** up. we set BREAK. Once we will be ready to send again we will remove
-	** it.
-	*/
+	 * To ensure that if the NFCC goes in DEEP SLEEP sate we can wake him
+	 * up. we set BREAK. Once we will be ready to send again we will remove
+	 * it.
+	 */
 	if (priv->config.break_control && nu->tty->ops->break_ctl) {
 		nu->tty->ops->break_ctl(nu->tty, -1);
 		usleep_range(1000, 3000);
-- =

2.27.0

--===============8738905066441703592==--

