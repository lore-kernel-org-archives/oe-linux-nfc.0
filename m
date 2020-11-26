Content-Type: multipart/mixed; boundary="===============1810608847917901184=="
MIME-Version: 1.0
From: bongsu.jeon2@gmail.com
To: linux-nfc@lists.01.org
Subject: [PATCH net-next 3/3] nfc: s3fwrn5: extract the common phy blocks
Date: Fri, 27 Nov 2020 00:33:39 +0900
Message-ID: <1606404819-30647-3-git-send-email-bongsu.jeon@samsung.com>
In-Reply-To: <1606404819-30647-1-git-send-email-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1810608847917901184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Extract the common phy blocks to reuse it.
The UART module will use the common blocks.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/i2c.c        | 111 ++++++++++++-----------------------=
----
 drivers/nfc/s3fwrn5/phy_common.h |  86 ++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+), 78 deletions(-)
 create mode 100644 drivers/nfc/s3fwrn5/phy_common.h

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index 9a64eea..cd1b2a7 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -15,75 +15,30 @@
 =

 #include <net/nfc/nfc.h>
 =

-#include "s3fwrn5.h"
+#include "phy_common.h"
 =

 #define S3FWRN5_I2C_DRIVER_NAME "s3fwrn5_i2c"
 =

-#define S3FWRN5_EN_WAIT_TIME 20
-
 struct s3fwrn5_i2c_phy {
+	struct phy_common common;
 	struct i2c_client *i2c_dev;
-	struct nci_dev *ndev;
-
-	int gpio_en;
-	int gpio_fw_wake;
-
-	struct mutex mutex;
 =

-	enum s3fwrn5_mode mode;
 	unsigned int irq_skip:1;
 };
 =

-static void s3fwrn5_i2c_set_wake(void *phy_id, bool wake)
-{
-	struct s3fwrn5_i2c_phy *phy =3D phy_id;
-
-	mutex_lock(&phy->mutex);
-	gpio_set_value(phy->gpio_fw_wake, wake);
-	msleep(S3FWRN5_EN_WAIT_TIME);
-	mutex_unlock(&phy->mutex);
-}
-
 static void s3fwrn5_i2c_set_mode(void *phy_id, enum s3fwrn5_mode mode)
 {
 	struct s3fwrn5_i2c_phy *phy =3D phy_id;
 =

-	mutex_lock(&phy->mutex);
+	mutex_lock(&phy->common.mutex);
 =

-	if (phy->mode =3D=3D mode)
+	if (s3fwrn5_phy_power_ctrl(&phy->common, mode) =3D=3D false)
 		goto out;
 =

-	phy->mode =3D mode;
-
-	gpio_set_value(phy->gpio_en, 1);
-	gpio_set_value(phy->gpio_fw_wake, 0);
-	if (mode =3D=3D S3FWRN5_MODE_FW)
-		gpio_set_value(phy->gpio_fw_wake, 1);
-
-	if (mode !=3D S3FWRN5_MODE_COLD) {
-		msleep(S3FWRN5_EN_WAIT_TIME);
-		gpio_set_value(phy->gpio_en, 0);
-		msleep(S3FWRN5_EN_WAIT_TIME);
-	}
-
 	phy->irq_skip =3D true;
 =

 out:
-	mutex_unlock(&phy->mutex);
-}
-
-static enum s3fwrn5_mode s3fwrn5_i2c_get_mode(void *phy_id)
-{
-	struct s3fwrn5_i2c_phy *phy =3D phy_id;
-	enum s3fwrn5_mode mode;
-
-	mutex_lock(&phy->mutex);
-
-	mode =3D phy->mode;
-
-	mutex_unlock(&phy->mutex);
-
-	return mode;
+	mutex_unlock(&phy->common.mutex);
 }
 =

 static int s3fwrn5_i2c_write(void *phy_id, struct sk_buff *skb)
@@ -91,7 +46,7 @@ static int s3fwrn5_i2c_write(void *phy_id, struct sk_buff=
 *skb)
 	struct s3fwrn5_i2c_phy *phy =3D phy_id;
 	int ret;
 =

-	mutex_lock(&phy->mutex);
+	mutex_lock(&phy->common.mutex);
 =

 	phy->irq_skip =3D false;
 =

@@ -102,7 +57,7 @@ static int s3fwrn5_i2c_write(void *phy_id, struct sk_buf=
f *skb)
 		ret  =3D i2c_master_send(phy->i2c_dev, skb->data, skb->len);
 	}
 =

-	mutex_unlock(&phy->mutex);
+	mutex_unlock(&phy->common.mutex);
 =

 	if (ret < 0)
 		return ret;
@@ -114,9 +69,9 @@ static int s3fwrn5_i2c_write(void *phy_id, struct sk_buf=
f *skb)
 }
 =

 static const struct s3fwrn5_phy_ops i2c_phy_ops =3D {
-	.set_wake =3D s3fwrn5_i2c_set_wake,
+	.set_wake =3D s3fwrn5_phy_set_wake,
 	.set_mode =3D s3fwrn5_i2c_set_mode,
-	.get_mode =3D s3fwrn5_i2c_get_mode,
+	.get_mode =3D s3fwrn5_phy_get_mode,
 	.write =3D s3fwrn5_i2c_write,
 };
 =

@@ -128,7 +83,7 @@ static int s3fwrn5_i2c_read(struct s3fwrn5_i2c_phy *phy)
 	char hdr[4];
 	int ret;
 =

-	hdr_size =3D (phy->mode =3D=3D S3FWRN5_MODE_NCI) ?
+	hdr_size =3D (phy->common.mode =3D=3D S3FWRN5_MODE_NCI) ?
 		NCI_CTRL_HDR_SIZE : S3FWRN5_FW_HDR_SIZE;
 	ret =3D i2c_master_recv(phy->i2c_dev, hdr, hdr_size);
 	if (ret < 0)
@@ -137,7 +92,7 @@ static int s3fwrn5_i2c_read(struct s3fwrn5_i2c_phy *phy)
 	if (ret < hdr_size)
 		return -EBADMSG;
 =

-	data_len =3D (phy->mode =3D=3D S3FWRN5_MODE_NCI) ?
+	data_len =3D (phy->common.mode =3D=3D S3FWRN5_MODE_NCI) ?
 		((struct nci_ctrl_hdr *)hdr)->plen :
 		((struct s3fwrn5_fw_header *)hdr)->len;
 =

@@ -157,24 +112,24 @@ static int s3fwrn5_i2c_read(struct s3fwrn5_i2c_phy *p=
hy)
 	}
 =

 out:
-	return s3fwrn5_recv_frame(phy->ndev, skb, phy->mode);
+	return s3fwrn5_recv_frame(phy->common.ndev, skb, phy->common.mode);
 }
 =

 static irqreturn_t s3fwrn5_i2c_irq_thread_fn(int irq, void *phy_id)
 {
 	struct s3fwrn5_i2c_phy *phy =3D phy_id;
 =

-	if (!phy || !phy->ndev) {
+	if (!phy || !phy->common.ndev) {
 		WARN_ON_ONCE(1);
 		return IRQ_NONE;
 	}
 =

-	mutex_lock(&phy->mutex);
+	mutex_lock(&phy->common.mutex);
 =

 	if (phy->irq_skip)
 		goto out;
 =

-	switch (phy->mode) {
+	switch (phy->common.mode) {
 	case S3FWRN5_MODE_NCI:
 	case S3FWRN5_MODE_FW:
 		s3fwrn5_i2c_read(phy);
@@ -184,7 +139,7 @@ static irqreturn_t s3fwrn5_i2c_irq_thread_fn(int irq, v=
oid *phy_id)
 	}
 =

 out:
-	mutex_unlock(&phy->mutex);
+	mutex_unlock(&phy->common.mutex);
 =

 	return IRQ_HANDLED;
 }
@@ -197,19 +152,19 @@ static int s3fwrn5_i2c_parse_dt(struct i2c_client *cl=
ient)
 	if (!np)
 		return -ENODEV;
 =

-	phy->gpio_en =3D of_get_named_gpio(np, "en-gpios", 0);
-	if (!gpio_is_valid(phy->gpio_en)) {
+	phy->common.gpio_en =3D of_get_named_gpio(np, "en-gpios", 0);
+	if (!gpio_is_valid(phy->common.gpio_en)) {
 		/* Support also deprecated property */
-		phy->gpio_en =3D of_get_named_gpio(np, "s3fwrn5,en-gpios", 0);
-		if (!gpio_is_valid(phy->gpio_en))
+		phy->common.gpio_en =3D of_get_named_gpio(np, "s3fwrn5,en-gpios", 0);
+		if (!gpio_is_valid(phy->common.gpio_en))
 			return -ENODEV;
 	}
 =

-	phy->gpio_fw_wake =3D of_get_named_gpio(np, "wake-gpios", 0);
-	if (!gpio_is_valid(phy->gpio_fw_wake)) {
+	phy->common.gpio_fw_wake =3D of_get_named_gpio(np, "wake-gpios", 0);
+	if (!gpio_is_valid(phy->common.gpio_fw_wake)) {
 		/* Support also deprecated property */
-		phy->gpio_fw_wake =3D of_get_named_gpio(np, "s3fwrn5,fw-gpios", 0);
-		if (!gpio_is_valid(phy->gpio_fw_wake))
+		phy->common.gpio_fw_wake =3D of_get_named_gpio(np, "s3fwrn5,fw-gpios", 0=
);
+		if (!gpio_is_valid(phy->common.gpio_fw_wake))
 			return -ENODEV;
 	}
 =

@@ -226,8 +181,8 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
 	if (!phy)
 		return -ENOMEM;
 =

-	mutex_init(&phy->mutex);
-	phy->mode =3D S3FWRN5_MODE_COLD;
+	mutex_init(&phy->common.mutex);
+	phy->common.mode =3D S3FWRN5_MODE_COLD;
 	phy->irq_skip =3D true;
 =

 	phy->i2c_dev =3D client;
@@ -237,17 +192,17 @@ static int s3fwrn5_i2c_probe(struct i2c_client *clien=
t,
 	if (ret < 0)
 		return ret;
 =

-	ret =3D devm_gpio_request_one(&phy->i2c_dev->dev, phy->gpio_en,
-		GPIOF_OUT_INIT_HIGH, "s3fwrn5_en");
+	ret =3D devm_gpio_request_one(&phy->i2c_dev->dev, phy->common.gpio_en,
+				    GPIOF_OUT_INIT_HIGH, "s3fwrn5_en");
 	if (ret < 0)
 		return ret;
 =

-	ret =3D devm_gpio_request_one(&phy->i2c_dev->dev, phy->gpio_fw_wake,
-		GPIOF_OUT_INIT_LOW, "s3fwrn5_fw_wake");
+	ret =3D devm_gpio_request_one(&phy->i2c_dev->dev, phy->common.gpio_fw_wak=
e,
+				    GPIOF_OUT_INIT_LOW, "s3fwrn5_fw_wake");
 	if (ret < 0)
 		return ret;
 =

-	ret =3D s3fwrn5_probe(&phy->ndev, phy, &phy->i2c_dev->dev, &i2c_phy_ops);
+	ret =3D s3fwrn5_probe(&phy->common.ndev, phy, &phy->i2c_dev->dev, &i2c_ph=
y_ops);
 	if (ret < 0)
 		return ret;
 =

@@ -255,7 +210,7 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
 		s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 		S3FWRN5_I2C_DRIVER_NAME, phy);
 	if (ret)
-		s3fwrn5_remove(phy->ndev);
+		s3fwrn5_remove(phy->common.ndev);
 =

 	return ret;
 }
@@ -264,7 +219,7 @@ static int s3fwrn5_i2c_remove(struct i2c_client *client)
 {
 	struct s3fwrn5_i2c_phy *phy =3D i2c_get_clientdata(client);
 =

-	s3fwrn5_remove(phy->ndev);
+	s3fwrn5_remove(phy->common.ndev);
 =

 	return 0;
 }
diff --git a/drivers/nfc/s3fwrn5/phy_common.h b/drivers/nfc/s3fwrn5/phy_com=
mon.h
new file mode 100644
index 0000000..14f7690
--- /dev/null
+++ b/drivers/nfc/s3fwrn5/phy_common.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Link Layer for Samsung S3FWRN5 NCI based Driver
+ *
+ * Copyright (C) 2015 Samsung Electrnoics
+ * Robert Baldyga <r.baldyga@samsung.com>
+ * Copyright (C) 2020 Samsung Electrnoics
+ * Bongsu Jeon <bongsu.jeon@samsung.com>
+ */
+
+#ifndef __LOCAL_PHY_COMMON_H
+#define __LOCAL_PHY_COMMON_H
+
+#include "s3fwrn5.h"
+
+#define S3FWRN5_EN_WAIT_TIME 20
+
+struct phy_common {
+	struct nci_dev *ndev;
+
+	int gpio_en;
+	int gpio_fw_wake;
+
+	struct mutex mutex;
+
+	enum s3fwrn5_mode mode;
+};
+
+static inline void s3fwrn5_phy_set_wake(void *phy_id, bool wake)
+{
+	struct phy_common *phy =3D phy_id;
+
+	mutex_lock(&phy->mutex);
+	gpio_set_value(phy->gpio_fw_wake, wake);
+	msleep(S3FWRN5_EN_WAIT_TIME);
+	mutex_unlock(&phy->mutex);
+}
+
+static inline bool s3fwrn5_phy_power_ctrl(struct phy_common *phy,
+					  enum s3fwrn5_mode mode)
+{
+	if (phy->mode =3D=3D mode)
+		return false;
+
+	phy->mode =3D mode;
+
+	gpio_set_value(phy->gpio_en, 1);
+	gpio_set_value(phy->gpio_fw_wake, 0);
+	if (mode =3D=3D S3FWRN5_MODE_FW)
+		gpio_set_value(phy->gpio_fw_wake, 1);
+
+	if (mode !=3D S3FWRN5_MODE_COLD) {
+		msleep(S3FWRN5_EN_WAIT_TIME);
+		gpio_set_value(phy->gpio_en, 0);
+		msleep(S3FWRN5_EN_WAIT_TIME);
+	}
+
+	return true;
+}
+
+static inline void s3fwrn5_phy_set_mode(void *phy_id, enum s3fwrn5_mode mo=
de)
+{
+	struct phy_common *phy =3D phy_id;
+
+	mutex_lock(&phy->mutex);
+
+	s3fwrn5_phy_power_ctrl(phy, mode);
+
+	mutex_unlock(&phy->mutex);
+}
+
+static inline enum s3fwrn5_mode s3fwrn5_phy_get_mode(void *phy_id)
+{
+	struct phy_common *phy =3D phy_id;
+	enum s3fwrn5_mode mode;
+
+	mutex_lock(&phy->mutex);
+
+	mode =3D phy->mode;
+
+	mutex_unlock(&phy->mutex);
+
+	return mode;
+}
+
+#endif /* __LOCAL_PHY_COMMON_H_ */
-- =

1.9.1

--===============1810608847917901184==--

