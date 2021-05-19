Content-Type: multipart/mixed; boundary="===============1296912089785681520=="
MIME-Version: 1.0
From: Stephan Gerhold <stephan@gerhold.net>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 2/2] nfc: s3fwrn5: i2c: Enable optional clock from device tree
Date: Wed, 19 May 2021 11:16:13 +0200
Message-ID: <20210519091613.7343-2-stephan@gerhold.net>
In-Reply-To: <20210519091613.7343-1-stephan@gerhold.net>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1296912089785681520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

S3FWRN5 depends on a clock input ("XI" pin) to function properly.
Depending on the hardware configuration this could be an always-on
oscillator or some external clock that must be explicitly enabled.

So far we assumed that the clock is always-on.
Make the driver request an (optional) clock from the device tree
and make sure the clock is running before starting S3FWRN5.

Note: S3FWRN5 asserts "GPIO2" whenever it needs the clock input to
function correctly. On some hardware configurations, GPIO2 is
connected directly to an input pin of the external clock provider
(e.g. the main PMIC of the SoC). In that case, it can automatically
AND the clock enable bit and clock request from S3FWRN5 so that
the clock is actually only enabled when needed.

It is also conceivable that on some other hardware configuration
S3FWRN5's GPIO2 might be connected as a regular GPIO input
of the SoC. In that case, follow-up patches could extend the
driver to request the GPIO, set up an interrupt and only enable
the clock when requested by S3FWRN5.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
This allows NFC to work properly on the Samsung Galaxy A3/A5 (2015).

Changes in v2: Rewrite commit message and comment based on discussion

  Note: I tried to explain the setup a bit better but dropped most of
        the explanations about the exact configuration on the Samsung
        Galaxy A5. I think the HW-specific details were more confusing
        than helping. :)

v1: https://lore.kernel.org/netdev/20210518133935.571298-2-stephan(a)gerhol=
d.net/
---
 drivers/nfc/s3fwrn5/i2c.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index 897394167522..38b8d6cab593 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -6,6 +6,7 @@
  * Robert Baldyga <r.baldyga@samsung.com>
  */
 =

+#include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/gpio.h>
 #include <linux/delay.h>
@@ -22,6 +23,7 @@
 struct s3fwrn5_i2c_phy {
 	struct phy_common common;
 	struct i2c_client *i2c_dev;
+	struct clk *clk;
 =

 	unsigned int irq_skip:1;
 };
@@ -207,17 +209,40 @@ static int s3fwrn5_i2c_probe(struct i2c_client *clien=
t,
 	if (ret < 0)
 		return ret;
 =

+	phy->clk =3D devm_clk_get_optional(&client->dev, NULL);
+	if (IS_ERR(phy->clk))
+		return dev_err_probe(&client->dev, PTR_ERR(phy->clk),
+				     "failed to get clock\n");
+
+	/*
+	 * S3FWRN5 depends on a clock input ("XI" pin) to function properly.
+	 * Depending on the hardware configuration this could be an always-on
+	 * oscillator or some external clock that must be explicitly enabled.
+	 * Make sure the clock is running before starting S3FWRN5.
+	 */
+	ret =3D clk_prepare_enable(phy->clk);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to enable clock: %d\n", ret);
+		return ret;
+	}
+
 	ret =3D s3fwrn5_probe(&phy->common.ndev, phy, &phy->i2c_dev->dev,
 			    &i2c_phy_ops);
 	if (ret < 0)
-		return ret;
+		goto disable_clk;
 =

 	ret =3D devm_request_threaded_irq(&client->dev, phy->i2c_dev->irq, NULL,
 		s3fwrn5_i2c_irq_thread_fn, IRQF_ONESHOT,
 		S3FWRN5_I2C_DRIVER_NAME, phy);
 	if (ret)
-		s3fwrn5_remove(phy->common.ndev);
+		goto s3fwrn5_remove;
 =

+	return 0;
+
+s3fwrn5_remove:
+	s3fwrn5_remove(phy->common.ndev);
+disable_clk:
+	clk_disable_unprepare(phy->clk);
 	return ret;
 }
 =

@@ -226,6 +251,7 @@ static int s3fwrn5_i2c_remove(struct i2c_client *client)
 	struct s3fwrn5_i2c_phy *phy =3D i2c_get_clientdata(client);
 =

 	s3fwrn5_remove(phy->common.ndev);
+	clk_disable_unprepare(phy->clk);
 =

 	return 0;
 }
-- =

2.31.1

--===============1296912089785681520==--

