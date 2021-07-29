Content-Type: multipart/mixed; boundary="===============5487559545088770078=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 04/12] nfc: trf7970a: constify several pointers
Date: Thu, 29 Jul 2021 12:40:14 +0200
Message-ID: <20210729104022.47761-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5487559545088770078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Several functions do not modify pointed data so arguments and local
variables can be const for correctness and safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/trf7970a.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 1aed44629aaa..8890fcd59c39 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -643,7 +643,7 @@ static void trf7970a_send_err_upstream(struct trf7970a =
*trf, int errno)
 }
 =

 static int trf7970a_transmit(struct trf7970a *trf, struct sk_buff *skb,
-			     unsigned int len, u8 *prefix,
+			     unsigned int len, const u8 *prefix,
 			     unsigned int prefix_len)
 {
 	struct spi_transfer t[2];
@@ -1387,9 +1387,10 @@ static int trf7970a_is_iso15693_write_or_lock(u8 cmd)
 	}
 }
 =

-static int trf7970a_per_cmd_config(struct trf7970a *trf, struct sk_buff *s=
kb)
+static int trf7970a_per_cmd_config(struct trf7970a *trf,
+				   const struct sk_buff *skb)
 {
-	u8 *req =3D skb->data;
+	const u8 *req =3D skb->data;
 	u8 special_fcn_reg1, iso_ctrl;
 	int ret;
 =

@@ -1791,7 +1792,7 @@ static int _trf7970a_tg_listen(struct nfc_digital_dev=
 *ddev, u16 timeout,
 static int trf7970a_tg_listen(struct nfc_digital_dev *ddev, u16 timeout,
 			      nfc_digital_cmd_complete_t cb, void *arg)
 {
-	struct trf7970a *trf =3D nfc_digital_get_drvdata(ddev);
+	const struct trf7970a *trf =3D nfc_digital_get_drvdata(ddev);
 =

 	dev_dbg(trf->dev, "Listen - state: %d, timeout: %d ms\n",
 		trf->state, timeout);
@@ -1803,7 +1804,7 @@ static int trf7970a_tg_listen_md(struct nfc_digital_d=
ev *ddev,
 				 u16 timeout, nfc_digital_cmd_complete_t cb,
 				 void *arg)
 {
-	struct trf7970a *trf =3D nfc_digital_get_drvdata(ddev);
+	const struct trf7970a *trf =3D nfc_digital_get_drvdata(ddev);
 	int ret;
 =

 	dev_dbg(trf->dev, "Listen MD - state: %d, timeout: %d ms\n",
@@ -1824,7 +1825,7 @@ static int trf7970a_tg_listen_md(struct nfc_digital_d=
ev *ddev,
 =

 static int trf7970a_tg_get_rf_tech(struct nfc_digital_dev *ddev, u8 *rf_te=
ch)
 {
-	struct trf7970a *trf =3D nfc_digital_get_drvdata(ddev);
+	const struct trf7970a *trf =3D nfc_digital_get_drvdata(ddev);
 =

 	dev_dbg(trf->dev, "Get RF Tech - state: %d, rf_tech: %d\n",
 		trf->state, trf->md_rf_tech);
@@ -1974,7 +1975,7 @@ static void trf7970a_shutdown(struct trf7970a *trf)
 	trf7970a_power_down(trf);
 }
 =

-static int trf7970a_get_autosuspend_delay(struct device_node *np)
+static int trf7970a_get_autosuspend_delay(const struct device_node *np)
 {
 	int autosuspend_delay, ret;
 =

@@ -1987,7 +1988,7 @@ static int trf7970a_get_autosuspend_delay(struct devi=
ce_node *np)
 =

 static int trf7970a_probe(struct spi_device *spi)
 {
-	struct device_node *np =3D spi->dev.of_node;
+	const struct device_node *np =3D spi->dev.of_node;
 	struct trf7970a *trf;
 	int uvolts, autosuspend_delay, ret;
 	u32 clk_freq =3D TRF7970A_13MHZ_CLOCK_FREQUENCY;
-- =

2.27.0

--===============5487559545088770078==--

