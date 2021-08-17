Content-Type: multipart/mixed; boundary="===============1302647272767124798=="
MIME-Version: 1.0
From: bongsu.jeon2@gmail.com
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next 1/8] nfc: virtual_ncidev: Use wait queue instead of polling
Date: Tue, 17 Aug 2021 06:28:11 -0700
Message-ID: <20210817132818.8275-2-bongsu.jeon2@gmail.com>
In-Reply-To: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1302647272767124798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

In previous version, the user level virtual device application that used
this driver should have the polling scheme to read a NCI frame.
To remove this polling scheme, use Wait Queue.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/virtual_ncidev.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/virtual_ncidev.c b/drivers/nfc/virtual_ncidev.c
index 2ee0ec4bb739..221fa3bb8705 100644
--- a/drivers/nfc/virtual_ncidev.c
+++ b/drivers/nfc/virtual_ncidev.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
+#include <linux/wait.h>
 #include <net/nfc/nci_core.h>
 =

 enum virtual_ncidev_mode {
@@ -27,6 +28,7 @@ enum virtual_ncidev_mode {
 				 NFC_PROTO_ISO15693_MASK)
 =

 static enum virtual_ncidev_mode state;
+static DECLARE_WAIT_QUEUE_HEAD(wq);
 static struct miscdevice miscdev;
 static struct sk_buff *send_buff;
 static struct nci_dev *ndev;
@@ -61,6 +63,7 @@ static int virtual_nci_send(struct nci_dev *ndev, struct =
sk_buff *skb)
 	}
 	send_buff =3D skb_copy(skb, GFP_KERNEL);
 	mutex_unlock(&nci_mutex);
+	wake_up_interruptible(&wq);
 =

 	return 0;
 }
@@ -77,9 +80,11 @@ static ssize_t virtual_ncidev_read(struct file *file, ch=
ar __user *buf,
 	size_t actual_len;
 =

 	mutex_lock(&nci_mutex);
-	if (!send_buff) {
+	while (!send_buff) {
 		mutex_unlock(&nci_mutex);
-		return 0;
+		if (wait_event_interruptible(wq, send_buff))
+			return -EFAULT;
+		mutex_lock(&nci_mutex);
 	}
 =

 	actual_len =3D min_t(size_t, count, send_buff->len);
-- =

2.32.0

--===============1302647272767124798==--

