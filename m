Content-Type: multipart/mixed; boundary="===============5687228244932546045=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v4 net-next 4/4] nfc: s3fwrn5: Support a UART interface
Date: Tue, 01 Dec 2020 22:50:28 +0900
Message-ID: <1606830628-10236-5-git-send-email-bongsu.jeon@samsung.com>
In-Reply-To: <1606830628-10236-1-git-send-email-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5687228244932546045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Since S3FWRN82 NFC Chip, The UART interface can be used.
S3FWRN82 uses NCI protocol and supports I2C and UART interface.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/Kconfig      |  12 +++
 drivers/nfc/s3fwrn5/Makefile     |   2 +
 drivers/nfc/s3fwrn5/phy_common.c |  12 +++
 drivers/nfc/s3fwrn5/phy_common.h |   1 +
 drivers/nfc/s3fwrn5/uart.c       | 196 +++++++++++++++++++++++++++++++++++=
++++
 5 files changed, 223 insertions(+)
 create mode 100644 drivers/nfc/s3fwrn5/uart.c

diff --git a/drivers/nfc/s3fwrn5/Kconfig b/drivers/nfc/s3fwrn5/Kconfig
index 3f8b6da..8a6b1a7 100644
--- a/drivers/nfc/s3fwrn5/Kconfig
+++ b/drivers/nfc/s3fwrn5/Kconfig
@@ -20,3 +20,15 @@ config NFC_S3FWRN5_I2C
 	  To compile this driver as a module, choose m here. The module will
 	  be called s3fwrn5_i2c.ko.
 	  Say N if unsure.
+
+config NFC_S3FWRN82_UART
+        tristate "Samsung S3FWRN82 UART support"
+        depends on NFC_NCI && SERIAL_DEV_BUS
+        select NFC_S3FWRN5
+        help
+          This module adds support for a UART interface to the S3FWRN82 ch=
ip.
+          Select this if your platform is using the UART bus.
+
+          To compile this driver as a module, choose m here. The module wi=
ll
+          be called s3fwrn82_uart.ko.
+          Say N if unsure.
diff --git a/drivers/nfc/s3fwrn5/Makefile b/drivers/nfc/s3fwrn5/Makefile
index 6b6f52d..7da827a 100644
--- a/drivers/nfc/s3fwrn5/Makefile
+++ b/drivers/nfc/s3fwrn5/Makefile
@@ -5,6 +5,8 @@
 =

 s3fwrn5-objs =3D core.o firmware.o nci.o phy_common.o
 s3fwrn5_i2c-objs =3D i2c.o
+s3fwrn82_uart-objs =3D uart.o
 =

 obj-$(CONFIG_NFC_S3FWRN5) +=3D s3fwrn5.o
 obj-$(CONFIG_NFC_S3FWRN5_I2C) +=3D s3fwrn5_i2c.o
+obj-$(CONFIG_NFC_S3FWRN82_UART) +=3D s3fwrn82_uart.o
diff --git a/drivers/nfc/s3fwrn5/phy_common.c b/drivers/nfc/s3fwrn5/phy_com=
mon.c
index 5cad1f4..497b02b 100644
--- a/drivers/nfc/s3fwrn5/phy_common.c
+++ b/drivers/nfc/s3fwrn5/phy_common.c
@@ -47,6 +47,18 @@ bool s3fwrn5_phy_power_ctrl(struct phy_common *phy, enum=
 s3fwrn5_mode mode)
 }
 EXPORT_SYMBOL(s3fwrn5_phy_power_ctrl);
 =

+void s3fwrn5_phy_set_mode(void *phy_id, enum s3fwrn5_mode mode)
+{
+	struct phy_common *phy =3D phy_id;
+
+	mutex_lock(&phy->mutex);
+
+	s3fwrn5_phy_power_ctrl(phy, mode);
+
+	mutex_unlock(&phy->mutex);
+}
+EXPORT_SYMBOL(s3fwrn5_phy_set_mode);
+
 enum s3fwrn5_mode s3fwrn5_phy_get_mode(void *phy_id)
 {
 	struct phy_common *phy =3D phy_id;
diff --git a/drivers/nfc/s3fwrn5/phy_common.h b/drivers/nfc/s3fwrn5/phy_com=
mon.h
index b98531d..99749c9 100644
--- a/drivers/nfc/s3fwrn5/phy_common.h
+++ b/drivers/nfc/s3fwrn5/phy_common.h
@@ -31,6 +31,7 @@ struct phy_common {
 =

 void s3fwrn5_phy_set_wake(void *phy_id, bool wake);
 bool s3fwrn5_phy_power_ctrl(struct phy_common *phy, enum s3fwrn5_mode mode=
);
+void s3fwrn5_phy_set_mode(void *phy_id, enum s3fwrn5_mode mode);
 enum s3fwrn5_mode s3fwrn5_phy_get_mode(void *phy_id);
 =

 #endif /* __NFC_S3FWRN5_PHY_COMMON_H */
diff --git a/drivers/nfc/s3fwrn5/uart.c b/drivers/nfc/s3fwrn5/uart.c
new file mode 100644
index 0000000..82ea35d
--- /dev/null
+++ b/drivers/nfc/s3fwrn5/uart.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * UART Link Layer for S3FWRN82 NCI based Driver
+ *
+ * Copyright (C) 2015 Samsung Electronics
+ * Robert Baldyga <r.baldyga@samsung.com>
+ * Copyright (C) 2020 Samsung Electronics
+ * Bongsu Jeon <bongsu.jeon@samsung.com>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/nfc.h>
+#include <linux/netdevice.h>
+#include <linux/of.h>
+#include <linux/serdev.h>
+#include <linux/gpio.h>
+#include <linux/of_gpio.h>
+
+#include "phy_common.h"
+
+#define S3FWRN82_NCI_HEADER 3
+#define S3FWRN82_NCI_IDX 2
+#define NCI_SKB_BUFF_LEN 258
+
+struct s3fwrn82_uart_phy {
+	struct phy_common common;
+	struct serdev_device *ser_dev;
+	struct sk_buff *recv_skb;
+};
+
+static int s3fwrn82_uart_write(void *phy_id, struct sk_buff *out)
+{
+	struct s3fwrn82_uart_phy *phy =3D phy_id;
+	int err;
+
+	err =3D serdev_device_write(phy->ser_dev,
+				  out->data, out->len,
+				  MAX_SCHEDULE_TIMEOUT);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static const struct s3fwrn5_phy_ops uart_phy_ops =3D {
+	.set_wake =3D s3fwrn5_phy_set_wake,
+	.set_mode =3D s3fwrn5_phy_set_mode,
+	.get_mode =3D s3fwrn5_phy_get_mode,
+	.write =3D s3fwrn82_uart_write,
+};
+
+static int s3fwrn82_uart_read(struct serdev_device *serdev,
+			      const unsigned char *data,
+			      size_t count)
+{
+	struct s3fwrn82_uart_phy *phy =3D serdev_device_get_drvdata(serdev);
+	size_t i;
+
+	for (i =3D 0; i < count; i++) {
+		skb_put_u8(phy->recv_skb, *data++);
+
+		if (phy->recv_skb->len < S3FWRN82_NCI_HEADER)
+			continue;
+
+		if ((phy->recv_skb->len - S3FWRN82_NCI_HEADER)
+				< phy->recv_skb->data[S3FWRN82_NCI_IDX])
+			continue;
+
+		s3fwrn5_recv_frame(phy->common.ndev, phy->recv_skb,
+				   phy->common.mode);
+		phy->recv_skb =3D alloc_skb(NCI_SKB_BUFF_LEN, GFP_KERNEL);
+		if (!phy->recv_skb)
+			return 0;
+	}
+
+	return i;
+}
+
+static const struct serdev_device_ops s3fwrn82_serdev_ops =3D {
+	.receive_buf =3D s3fwrn82_uart_read,
+	.write_wakeup =3D serdev_device_write_wakeup,
+};
+
+static const struct of_device_id s3fwrn82_uart_of_match[] =3D {
+	{ .compatible =3D "samsung,s3fwrn82", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, s3fwrn82_uart_of_match);
+
+static int s3fwrn82_uart_parse_dt(struct serdev_device *serdev)
+{
+	struct s3fwrn82_uart_phy *phy =3D serdev_device_get_drvdata(serdev);
+	struct device_node *np =3D serdev->dev.of_node;
+
+	if (!np)
+		return -ENODEV;
+
+	phy->common.gpio_en =3D of_get_named_gpio(np, "en-gpios", 0);
+	if (!gpio_is_valid(phy->common.gpio_en))
+		return -ENODEV;
+
+	phy->common.gpio_fw_wake =3D of_get_named_gpio(np, "wake-gpios", 0);
+	if (!gpio_is_valid(phy->common.gpio_fw_wake))
+		return -ENODEV;
+
+	return 0;
+}
+
+static int s3fwrn82_uart_probe(struct serdev_device *serdev)
+{
+	struct s3fwrn82_uart_phy *phy;
+	int ret =3D -ENOMEM;
+
+	phy =3D devm_kzalloc(&serdev->dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		goto err_exit;
+
+	phy->recv_skb =3D alloc_skb(NCI_SKB_BUFF_LEN, GFP_KERNEL);
+	if (!phy->recv_skb)
+		goto err_exit;
+
+	mutex_init(&phy->common.mutex);
+	phy->common.mode =3D S3FWRN5_MODE_COLD;
+
+	phy->ser_dev =3D serdev;
+	serdev_device_set_drvdata(serdev, phy);
+	serdev_device_set_client_ops(serdev, &s3fwrn82_serdev_ops);
+	ret =3D serdev_device_open(serdev);
+	if (ret) {
+		dev_err(&serdev->dev, "Unable to open device\n");
+		goto err_skb;
+	}
+
+	ret =3D serdev_device_set_baudrate(serdev, 115200);
+	if (ret !=3D 115200) {
+		ret =3D -EINVAL;
+		goto err_serdev;
+	}
+
+	serdev_device_set_flow_control(serdev, false);
+
+	ret =3D s3fwrn82_uart_parse_dt(serdev);
+	if (ret < 0)
+		goto err_serdev;
+
+	ret =3D devm_gpio_request_one(&phy->ser_dev->dev, phy->common.gpio_en,
+				    GPIOF_OUT_INIT_HIGH, "s3fwrn82_en");
+	if (ret < 0)
+		goto err_serdev;
+
+	ret =3D devm_gpio_request_one(&phy->ser_dev->dev,
+				    phy->common.gpio_fw_wake,
+				    GPIOF_OUT_INIT_LOW, "s3fwrn82_fw_wake");
+	if (ret < 0)
+		goto err_serdev;
+
+	ret =3D s3fwrn5_probe(&phy->common.ndev, phy, &phy->ser_dev->dev,
+			    &uart_phy_ops);
+	if (ret < 0)
+		goto err_serdev;
+
+	return ret;
+
+err_serdev:
+	serdev_device_close(serdev);
+err_skb:
+	kfree_skb(phy->recv_skb);
+err_exit:
+	return ret;
+}
+
+static void s3fwrn82_uart_remove(struct serdev_device *serdev)
+{
+	struct s3fwrn82_uart_phy *phy =3D serdev_device_get_drvdata(serdev);
+
+	s3fwrn5_remove(phy->common.ndev);
+	serdev_device_close(serdev);
+	kfree_skb(phy->recv_skb);
+}
+
+static struct serdev_device_driver s3fwrn82_uart_driver =3D {
+	.probe =3D s3fwrn82_uart_probe,
+	.remove =3D s3fwrn82_uart_remove,
+	.driver =3D {
+		.name =3D "s3fwrn82_uart",
+		.of_match_table =3D s3fwrn82_uart_of_match,
+	},
+};
+
+module_serdev_device_driver(s3fwrn82_uart_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("UART driver for Samsung NFC");
+MODULE_AUTHOR("Bongsu Jeon <bongsu.jeon@samsung.com>");
-- =

1.9.1

--===============5687228244932546045==--

