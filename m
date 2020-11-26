Content-Type: multipart/mixed; boundary="===============2260995997039173273=="
MIME-Version: 1.0
From: bongsu.jeon2@gmail.com
To: linux-nfc@lists.01.org
Subject: [PATCH net-next 2/3] nfc: s3fwrn5: reduce the EN_WAIT_TIME
Date: Fri, 27 Nov 2020 00:33:38 +0900
Message-ID: <1606404819-30647-2-git-send-email-bongsu.jeon@samsung.com>
In-Reply-To: <1606404819-30647-1-git-send-email-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2260995997039173273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

The delay of 20ms is enough to enable and
wake up the Samsung's nfc chip.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index ae26594..9a64eea 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -19,7 +19,7 @@
 =

 #define S3FWRN5_I2C_DRIVER_NAME "s3fwrn5_i2c"
 =

-#define S3FWRN5_EN_WAIT_TIME 150
+#define S3FWRN5_EN_WAIT_TIME 20
 =

 struct s3fwrn5_i2c_phy {
 	struct i2c_client *i2c_dev;
@@ -40,7 +40,7 @@ static void s3fwrn5_i2c_set_wake(void *phy_id, bool wake)
 =

 	mutex_lock(&phy->mutex);
 	gpio_set_value(phy->gpio_fw_wake, wake);
-	msleep(S3FWRN5_EN_WAIT_TIME/2);
+	msleep(S3FWRN5_EN_WAIT_TIME);
 	mutex_unlock(&phy->mutex);
 }
 =

@@ -63,7 +63,7 @@ static void s3fwrn5_i2c_set_mode(void *phy_id, enum s3fwr=
n5_mode mode)
 	if (mode !=3D S3FWRN5_MODE_COLD) {
 		msleep(S3FWRN5_EN_WAIT_TIME);
 		gpio_set_value(phy->gpio_en, 0);
-		msleep(S3FWRN5_EN_WAIT_TIME/2);
+		msleep(S3FWRN5_EN_WAIT_TIME);
 	}
 =

 	phy->irq_skip =3D true;
-- =

1.9.1

--===============2260995997039173273==--

