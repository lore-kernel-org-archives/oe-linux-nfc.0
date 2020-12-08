Content-Type: multipart/mixed; boundary="===============6386948264144755242=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next 2/2] nfc: s3fwrn5: Remove hard coded interrupt trigger type from the i2c module
Date: Tue, 08 Dec 2020 23:10:12 +0900
Message-ID: <20201208141012.6033-3-bongsu.jeon@samsung.com>
In-Reply-To: <20201208141012.6033-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6386948264144755242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

For the flexible control of interrupt trigger type, remove the hard coded
interrupt trigger type in the i2c module. The trigger type will be loaded
 from a dts.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/i2c.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index e1bdde105f24..42f1f610ac2c 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -179,6 +179,8 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
 				  const struct i2c_device_id *id)
 {
 	struct s3fwrn5_i2c_phy *phy;
+	struct irq_data *irq_data;
+	unsigned long irqflags;
 	int ret;
 =

 	phy =3D devm_kzalloc(&client->dev, sizeof(*phy), GFP_KERNEL);
@@ -212,8 +214,11 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 =

+	irq_data =3D irq_get_irq_data(client->irq);
+	irqflags =3D irqd_get_trigger_type(irq_data) | IRQF_ONESHOT;
+
 	ret =3D devm_request_threaded_irq(&client->dev, phy->i2c_dev->irq, NULL,
-		s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+		s3fwrn5_i2c_irq_thread_fn, irqflags,
 		S3FWRN5_I2C_DRIVER_NAME, phy);
 	if (ret)
 		s3fwrn5_remove(phy->common.ndev);
-- =

2.17.1

--===============6386948264144755242==--

