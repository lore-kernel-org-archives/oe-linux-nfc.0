Content-Type: multipart/mixed; boundary="===============7942825875498230471=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next 1/2] nfc: s3fwrn5: Remove the delay for NFC sleep
Date: Tue, 15 Dec 2020 15:54:00 +0900
Message-ID: <20201215065401.3220-2-bongsu.jeon@samsung.com>
In-Reply-To: <20201215065401.3220-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7942825875498230471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Remove the delay for NFC sleep because the delay is only needed to
guarantee that the NFC is awake.

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

--===============7942825875498230471==--

