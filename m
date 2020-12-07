Content-Type: multipart/mixed; boundary="===============8737948114073439988=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH net-next] nfc: s3fwrn5: Change irqflags
Date: Mon, 07 Dec 2020 20:38:27 +0900
Message-ID: <20201207113827.2902-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8737948114073439988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

change irqflags from IRQF_TRIGGER_HIGH to IRQF_TRIGGER_RISING for stable
Samsung's nfc interrupt handling.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index e1bdde105f24..016f6b6df849 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -213,7 +213,7 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
 		return ret;
 =

 	ret =3D devm_request_threaded_irq(&client->dev, phy->i2c_dev->irq, NULL,
-		s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+		s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 		S3FWRN5_I2C_DRIVER_NAME, phy);
 	if (ret)
 		s3fwrn5_remove(phy->common.ndev);
-- =

2.17.1

--===============8737948114073439988==--

