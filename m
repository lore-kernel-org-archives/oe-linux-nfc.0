Content-Type: multipart/mixed; boundary="===============1160403270958747615=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH net-next] nfc: s3fwrn5: Remove the delay for nfc sleep
Date: Sun, 13 Dec 2020 19:12:38 +0900
Message-ID: <20201213101238.28373-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1160403270958747615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

remove the delay for nfc sleep because nfc doesn't need the sleep delay.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/phy_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/s3fwrn5/phy_common.c b/drivers/nfc/s3fwrn5/phy_com=
mon.c
index 497b02b30ae7..81318478d5fd 100644
--- a/drivers/nfc/s3fwrn5/phy_common.c
+++ b/drivers/nfc/s3fwrn5/phy_common.c
@@ -20,7 +20,8 @@ void s3fwrn5_phy_set_wake(void *phy_id, bool wake)
 =

 	mutex_lock(&phy->mutex);
 	gpio_set_value(phy->gpio_fw_wake, wake);
-	msleep(S3FWRN5_EN_WAIT_TIME);
+	if (wake)
+		msleep(S3FWRN5_EN_WAIT_TIME);
 	mutex_unlock(&phy->mutex);
 }
 EXPORT_SYMBOL(s3fwrn5_phy_set_wake);
-- =

2.17.1

--===============1160403270958747615==--

