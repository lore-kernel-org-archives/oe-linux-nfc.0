Content-Type: multipart/mixed; boundary="===============4540203150096534830=="
MIME-Version: 1.0
From: bongsu.jeon2@gmail.com
To: linux-nfc@lists.01.org
Subject: [PATCH net-next 1/3] nfc: Change the virtual NCI device driver to use Wait Queue
Date: Sun, 15 Aug 2021 21:05:58 -0700
Message-ID: <20210816040600.175813-2-bongsu.jeon2@gmail.com>
In-Reply-To: <20210816040600.175813-1-bongsu.jeon2@gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4540203150096534830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

In previous version, the user level virtual device application that used
this driver should have the polling scheme to read a NCI frame.
To remove this polling scheme, changed the driver code to use Wait Queue.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/virtual_ncidev.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/virtual_ncidev.c b/drivers/nfc/virtual_ncidev.c
index 2ee0ec4bb739..1953904176a2 100644
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
@@ -76,12 +79,11 @@ static ssize_t virtual_ncidev_read(struct file *file, c=
har __user *buf,
 {
 	size_t actual_len;
 =

-	mutex_lock(&nci_mutex);
-	if (!send_buff) {
-		mutex_unlock(&nci_mutex);
+	wait_event_interruptible(wq, send_buff);
+	if (!send_buff)
 		return 0;
-	}
 =

+	mutex_lock(&nci_mutex);
 	actual_len =3D min_t(size_t, count, send_buff->len);
 =

 	if (copy_to_user(buf, send_buff->data, actual_len)) {
-- =

2.32.0

--===============4540203150096534830==--

