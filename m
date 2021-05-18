Content-Type: multipart/mixed; boundary="===============0125511044164029525=="
MIME-Version: 1.0
From: Stephan Gerhold <stephan@gerhold.net>
To: linux-nfc@lists.01.org
Subject: [PATCH 2/2] nfc: s3fwrn5: i2c: Enable optional clock from device tree
Date: Tue, 18 May 2021 15:39:35 +0200
Message-ID: <20210518133935.571298-2-stephan@gerhold.net>
In-Reply-To: <20210518133935.571298-1-stephan@gerhold.net>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0125511044164029525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

s3fwrn5 has a NFC_CLK_REQ output GPIO, which is asserted whenever
the clock is needed for the current operation. This GPIO can be either
connected directly to the clock provider, or must be monitored by
this driver.

As an example for the first case, on many Qualcomm devices the
NFC clock is provided by the main PMIC. The clock can be either
permanently enabled (clocks =3D <&rpmcc RPM_SMD_BB_CLK2>) or enabled
only when requested through a special input pin on the PMIC
(clocks =3D <&rpmcc RPM_SMD_BB_CLK2_PIN>).

On the Samsung Galaxy A3/A5 (2015, Qualcomm MSM8916) this mechanism
is used with S3FWRN5's NFC_CLK_REQ output GPIO to enable the clock
only when necessary. However, to make that work the s3fwrn5 driver
must keep the RPM_SMD_BB_CLK2_PIN clock enabled.

This commit adds support for this by requesting an optional clock
and keeping it permanently enabled. Note that the actual (physical)
clock won't be permanently enabled since this will depend on the
output of NFC_CLK_REQ from S3FWRN5.

In the future (when needed by some other device) this could be
extended to work for the second case (monitoring the NFC_CLK_REQ
GPIO and enabling the clock from the kernel when needed).

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/nfc/s3fwrn5/i2c.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index 897394167522..d8910f97ee4a 100644
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
@@ -207,17 +209,42 @@ static int s3fwrn5_i2c_probe(struct i2c_client *clien=
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
+	 * s3fwrn5 has a NFC_CLK_REQ output GPIO, which is asserted whenever
+	 * the clock is needed for the current operation. This GPIO can be either
+	 * connected directly to the clock provider, or must be monitored by
+	 * this driver. For now only the first case is handled here.
+	 * We keep the clock "on" permanently so the clock provider will begin
+	 * looking at NFC_CLK_REQ and enables the clock when necessary.
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

@@ -226,6 +253,7 @@ static int s3fwrn5_i2c_remove(struct i2c_client *client)
 	struct s3fwrn5_i2c_phy *phy =3D i2c_get_clientdata(client);
 =

 	s3fwrn5_remove(phy->common.ndev);
+	clk_disable_unprepare(phy->clk);
 =

 	return 0;
 }
-- =

2.31.1

--===============0125511044164029525==--

