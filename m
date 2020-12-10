Content-Type: multipart/mixed; boundary="===============7989053883663503312=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: [PATCH] nfc: s3fwrn5: let core configure the interrupt trigger
Date: Thu, 10 Dec 2020 22:18:24 +0100
Message-ID: <20201210211824.214949-1-krzk@kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7989053883663503312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If interrupt trigger is not set when requesting the interrupt, the core
will take care of reading trigger type from Devicetree.  There is no
point to do it in the driver.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/nfc/s3fwrn5/i2c.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index 42f1f610ac2c..897394167522 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -179,8 +179,6 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
 				  const struct i2c_device_id *id)
 {
 	struct s3fwrn5_i2c_phy *phy;
-	struct irq_data *irq_data;
-	unsigned long irqflags;
 	int ret;
 =

 	phy =3D devm_kzalloc(&client->dev, sizeof(*phy), GFP_KERNEL);
@@ -214,11 +212,8 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 =

-	irq_data =3D irq_get_irq_data(client->irq);
-	irqflags =3D irqd_get_trigger_type(irq_data) | IRQF_ONESHOT;
-
 	ret =3D devm_request_threaded_irq(&client->dev, phy->i2c_dev->irq, NULL,
-		s3fwrn5_i2c_irq_thread_fn, irqflags,
+		s3fwrn5_i2c_irq_thread_fn, IRQF_ONESHOT,
 		S3FWRN5_I2C_DRIVER_NAME, phy);
 	if (ret)
 		s3fwrn5_remove(phy->common.ndev);
-- =

2.25.1

--===============7989053883663503312==--

