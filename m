Content-Type: multipart/mixed; boundary="===============8011064679059618589=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH net-next v4 1/2] nfc: Add a virtual nci device driver
Date: Wed, 27 Jan 2021 22:08:28 +0900
Message-ID: <20210127130829.4026-2-bongsu.jeon@samsung.com>
In-Reply-To: <20210127130829.4026-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8011064679059618589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

NCI virtual device simulates a NCI device to the user. It can be used to
validate the NCI module and applications. This driver supports
communication between the virtual NCI device and NCI module.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/Kconfig          |  11 ++
 drivers/nfc/Makefile         |   1 +
 drivers/nfc/virtual_ncidev.c | 215 +++++++++++++++++++++++++++++++++++
 3 files changed, 227 insertions(+)
 create mode 100644 drivers/nfc/virtual_ncidev.c

diff --git a/drivers/nfc/Kconfig b/drivers/nfc/Kconfig
index 75c65d339018..288c6f1c6979 100644
--- a/drivers/nfc/Kconfig
+++ b/drivers/nfc/Kconfig
@@ -49,6 +49,17 @@ config NFC_PORT100
 =

 	  If unsure, say N.
 =

+config NFC_VIRTUAL_NCI
+	tristate "NCI device simulator driver"
+	depends on NFC_NCI
+	help
+	  NCI virtual device simulates a NCI device to the user.
+	  It can be used to validate the NCI module and applications.
+	  This driver supports communication between the virtual NCI device and
+	  module.
+
+	  If unsure, say N.
+
 source "drivers/nfc/fdp/Kconfig"
 source "drivers/nfc/pn544/Kconfig"
 source "drivers/nfc/pn533/Kconfig"
diff --git a/drivers/nfc/Makefile b/drivers/nfc/Makefile
index 5393ba59b17d..7b1bfde1d971 100644
--- a/drivers/nfc/Makefile
+++ b/drivers/nfc/Makefile
@@ -17,3 +17,4 @@ obj-$(CONFIG_NFC_ST_NCI)	+=3D st-nci/
 obj-$(CONFIG_NFC_NXP_NCI)	+=3D nxp-nci/
 obj-$(CONFIG_NFC_S3FWRN5)	+=3D s3fwrn5/
 obj-$(CONFIG_NFC_ST95HF)	+=3D st95hf/
+obj-$(CONFIG_NFC_VIRTUAL_NCI)	+=3D virtual_ncidev.o
diff --git a/drivers/nfc/virtual_ncidev.c b/drivers/nfc/virtual_ncidev.c
new file mode 100644
index 000000000000..f73ee0bf3593
--- /dev/null
+++ b/drivers/nfc/virtual_ncidev.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Virtual NCI device simulation driver
+ *
+ * Copyright (C) 2020 Samsung Electrnoics
+ * Bongsu Jeon <bongsu.jeon@samsung.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/miscdevice.h>
+#include <linux/mutex.h>
+#include <net/nfc/nci_core.h>
+
+enum virtual_ncidev_mode {
+	virtual_ncidev_enabled,
+	virtual_ncidev_disabled,
+	virtual_ncidev_disabling,
+};
+
+#define IOCTL_GET_NCIDEV_IDX    0
+#define VIRTUAL_NFC_PROTOCOLS	(NFC_PROTO_JEWEL_MASK | \
+				 NFC_PROTO_MIFARE_MASK | \
+				 NFC_PROTO_FELICA_MASK | \
+				 NFC_PROTO_ISO14443_MASK | \
+				 NFC_PROTO_ISO14443_B_MASK | \
+				 NFC_PROTO_ISO15693_MASK)
+
+static enum virtual_ncidev_mode state;
+static struct miscdevice miscdev;
+static struct sk_buff *send_buff;
+static struct nci_dev *ndev;
+static DEFINE_MUTEX(nci_mutex);
+
+static int virtual_nci_open(struct nci_dev *ndev)
+{
+	return 0;
+}
+
+static int virtual_nci_close(struct nci_dev *ndev)
+{
+	mutex_lock(&nci_mutex);
+	kfree_skb(send_buff);
+	send_buff =3D NULL;
+	mutex_unlock(&nci_mutex);
+
+	return 0;
+}
+
+static int virtual_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
+{
+	mutex_lock(&nci_mutex);
+	if (state !=3D virtual_ncidev_enabled) {
+		mutex_unlock(&nci_mutex);
+		return 0;
+	}
+
+	if (send_buff) {
+		mutex_unlock(&nci_mutex);
+		return -1;
+	}
+	send_buff =3D skb_copy(skb, GFP_KERNEL);
+	mutex_unlock(&nci_mutex);
+
+	return 0;
+}
+
+static struct nci_ops virtual_nci_ops =3D {
+	.open =3D virtual_nci_open,
+	.close =3D virtual_nci_close,
+	.send =3D virtual_nci_send
+};
+
+static ssize_t virtual_ncidev_read(struct file *file, char __user *buf,
+				   size_t count, loff_t *ppos)
+{
+	size_t actual_len;
+
+	mutex_lock(&nci_mutex);
+	if (!send_buff) {
+		mutex_unlock(&nci_mutex);
+		return 0;
+	}
+
+	actual_len =3D min_t(size_t, count, send_buff->len);
+
+	if (copy_to_user(buf, send_buff->data, actual_len)) {
+		mutex_unlock(&nci_mutex);
+		return -EFAULT;
+	}
+
+	skb_pull(send_buff, actual_len);
+	if (send_buff->len =3D=3D 0) {
+		consume_skb(send_buff);
+		send_buff =3D NULL;
+	}
+	mutex_unlock(&nci_mutex);
+
+	return actual_len;
+}
+
+static ssize_t virtual_ncidev_write(struct file *file,
+				    const char __user *buf,
+				    size_t count, loff_t *ppos)
+{
+	struct sk_buff *skb;
+
+	skb =3D alloc_skb(count, GFP_KERNEL);
+	if (!skb)
+		return -ENOMEM;
+
+	if (copy_from_user(skb_put(skb, count), buf, count)) {
+		kfree_skb(skb);
+		return -EFAULT;
+	}
+
+	nci_recv_frame(ndev, skb);
+	return count;
+}
+
+static int virtual_ncidev_open(struct inode *inode, struct file *file)
+{
+	int ret =3D 0;
+
+	mutex_lock(&nci_mutex);
+	if (state !=3D virtual_ncidev_disabled) {
+		mutex_unlock(&nci_mutex);
+		return -EBUSY;
+	}
+
+	ndev =3D nci_allocate_device(&virtual_nci_ops, VIRTUAL_NFC_PROTOCOLS,
+				   0, 0);
+	if (!ndev) {
+		mutex_unlock(&nci_mutex);
+		return -ENOMEM;
+	}
+
+	ret =3D nci_register_device(ndev);
+	if (ret < 0) {
+		nci_free_device(ndev);
+		mutex_unlock(&nci_mutex);
+		return ret;
+	}
+	state =3D virtual_ncidev_enabled;
+	mutex_unlock(&nci_mutex);
+
+	return 0;
+}
+
+static int virtual_ncidev_close(struct inode *inode, struct file *file)
+{
+	mutex_lock(&nci_mutex);
+
+	if (state =3D=3D virtual_ncidev_enabled) {
+		state =3D virtual_ncidev_disabling;
+		mutex_unlock(&nci_mutex);
+
+		nci_unregister_device(ndev);
+		nci_free_device(ndev);
+
+		mutex_lock(&nci_mutex);
+	}
+
+	state =3D virtual_ncidev_disabled;
+	mutex_unlock(&nci_mutex);
+
+	return 0;
+}
+
+static long virtual_ncidev_ioctl(struct file *flip, unsigned int cmd,
+				 unsigned long arg)
+{
+	struct nfc_dev *nfc_dev =3D ndev->nfc_dev;
+	void __user *p =3D (void __user *)arg;
+
+	if (cmd !=3D IOCTL_GET_NCIDEV_IDX)
+		return -ENOTTY;
+
+	if (copy_to_user(p, &nfc_dev->idx, sizeof(nfc_dev->idx)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static const struct file_operations virtual_ncidev_fops =3D {
+	.owner =3D THIS_MODULE,
+	.read =3D virtual_ncidev_read,
+	.write =3D virtual_ncidev_write,
+	.open =3D virtual_ncidev_open,
+	.release =3D virtual_ncidev_close,
+	.unlocked_ioctl =3D virtual_ncidev_ioctl
+};
+
+static int __init virtual_ncidev_init(void)
+{
+	state =3D virtual_ncidev_disabled;
+	miscdev.minor =3D MISC_DYNAMIC_MINOR;
+	miscdev.name =3D "virtual_nci";
+	miscdev.fops =3D &virtual_ncidev_fops;
+	miscdev.mode =3D S_IALLUGO;
+
+	return misc_register(&miscdev);
+}
+
+static void __exit virtual_ncidev_exit(void)
+{
+	misc_deregister(&miscdev);
+}
+
+module_init(virtual_ncidev_init);
+module_exit(virtual_ncidev_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Virtual NCI device simulation driver");
+MODULE_AUTHOR("Bongsu Jeon <bongsu.jeon@samsung.com>");
-- =

2.25.1

--===============8011064679059618589==--

