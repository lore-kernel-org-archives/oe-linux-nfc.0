Content-Type: multipart/mixed; boundary="===============8998180382107254894=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [RESEND PATCH 03/11] nfc: mrvl: use SPDX-License-Identifier
Date: Mon, 31 May 2021 09:35:14 +0200
Message-ID: <20210531073522.6720-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8998180382107254894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use SPDX-License-Identifier: GPL-2.0-only, instead of hand writing it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/fw_dnld.c | 13 +------------
 drivers/nfc/nfcmrvl/fw_dnld.h | 15 ++-------------
 drivers/nfc/nfcmrvl/i2c.c     | 15 ++-------------
 drivers/nfc/nfcmrvl/main.c    | 13 +------------
 drivers/nfc/nfcmrvl/nfcmrvl.h | 15 ++-------------
 drivers/nfc/nfcmrvl/spi.c     | 15 ++-------------
 drivers/nfc/nfcmrvl/uart.c    | 13 +------------
 drivers/nfc/nfcmrvl/usb.c     | 15 ++-------------
 8 files changed, 13 insertions(+), 101 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/fw_dnld.c b/drivers/nfc/nfcmrvl/fw_dnld.c
index 52c8ae504e32..05df7ad224d5 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.c
+++ b/drivers/nfc/nfcmrvl/fw_dnld.c
@@ -1,19 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Marvell NFC driver: Firmware downloader
  *
  * Copyright (C) 2015, Marvell International Ltd.
- *
- * This software file (the "File") is distributed by Marvell International
- * Ltd. under the terms of the GNU General Public License Version 2, June =
1991
- * (the "License").  You may use, redistribute and/or modify this File in
- * accordance with the terms and conditions of the License, a copy of which
- * is available on the worldwide web at
- * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
- *
- * THE FILE IS DISTRIBUTED AS-IS, WITHOUT WARRANTY OF ANY KIND, AND THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPO=
SE
- * ARE EXPRESSLY DISCLAIMED.  The License provides additional details about
- * this warranty disclaimer.
  */
 =

 #include <linux/module.h>
diff --git a/drivers/nfc/nfcmrvl/fw_dnld.h b/drivers/nfc/nfcmrvl/fw_dnld.h
index 058ce77b3cbc..7c4d91b01910 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.h
+++ b/drivers/nfc/nfcmrvl/fw_dnld.h
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Marvell NFC driver: Firmware downloader
  *
  * Copyright (C) 2015, Marvell International Ltd.
- *
- * This software file (the "File") is distributed by Marvell International
- * Ltd. under the terms of the GNU General Public License Version 2, June =
1991
- * (the "License").  You may use, redistribute and/or modify this File in
- * accordance with the terms and conditions of the License, a copy of which
- * is available on the worldwide web at
- * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
- *
- * THE FILE IS DISTRIBUTED AS-IS, WITHOUT WARRANTY OF ANY KIND, AND THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPO=
SE
- * ARE EXPRESSLY DISCLAIMED.  The License provides additional details about
- * this warranty disclaimer.
- **/
+ */
 =

 #ifndef __NFCMRVL_FW_DNLD_H__
 #define __NFCMRVL_FW_DNLD_H__
diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
index 3c9bbee98237..59a529e72d96 100644
--- a/drivers/nfc/nfcmrvl/i2c.c
+++ b/drivers/nfc/nfcmrvl/i2c.c
@@ -1,20 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Marvell NFC-over-I2C driver: I2C interface related functions
  *
  * Copyright (C) 2015, Marvell International Ltd.
- *
- * This software file (the "File") is distributed by Marvell International
- * Ltd. under the terms of the GNU General Public License Version 2, June =
1991
- * (the "License").  You may use, redistribute and/or modify this File in
- * accordance with the terms and conditions of the License, a copy of which
- * is available on the worldwide web at
- * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
- *
- * THE FILE IS DISTRIBUTED AS-IS, WITHOUT WARRANTY OF ANY KIND, AND THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPO=
SE
- * ARE EXPRESSLY DISCLAIMED.  The License provides additional details about
- * this warranty disclaimer.
- **/
+ */
 =

 #include <linux/module.h>
 #include <linux/interrupt.h>
diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 529be35ac178..a4620b480c4f 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -1,19 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Marvell NFC driver: major functions
  *
  * Copyright (C) 2014-2015 Marvell International Ltd.
- *
- * This software file (the "File") is distributed by Marvell International
- * Ltd. under the terms of the GNU General Public License Version 2, June =
1991
- * (the "License").  You may use, redistribute and/or modify this File in
- * accordance with the terms and conditions of the License, a copy of which
- * is available on the worldwide web at
- * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
- *
- * THE FILE IS DISTRIBUTED AS-IS, WITHOUT WARRANTY OF ANY KIND, AND THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPO=
SE
- * ARE EXPRESSLY DISCLAIMED.  The License provides additional details about
- * this warranty disclaimer.
  */
 =

 #include <linux/module.h>
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index e84ee18c73ae..0b4220bb91bc 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -1,20 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Marvell NFC driver
  *
  * Copyright (C) 2014-2015, Marvell International Ltd.
- *
- * This software file (the "File") is distributed by Marvell International
- * Ltd. under the terms of the GNU General Public License Version 2, June =
1991
- * (the "License").  You may use, redistribute and/or modify this File in
- * accordance with the terms and conditions of the License, a copy of which
- * is available on the worldwide web at
- * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
- *
- * THE FILE IS DISTRIBUTED AS-IS, WITHOUT WARRANTY OF ANY KIND, AND THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPO=
SE
- * ARE EXPRESSLY DISCLAIMED.  The License provides additional details about
- * this warranty disclaimer.
- **/
+ */
 =

 #ifndef _NFCMRVL_H_
 #define _NFCMRVL_H_
diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index 0647b85930a6..66696321c645 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -1,20 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Marvell NFC-over-SPI driver: SPI interface related functions
  *
  * Copyright (C) 2015, Marvell International Ltd.
- *
- * This software file (the "File") is distributed by Marvell International
- * Ltd. under the terms of the GNU General Public License Version 2, June =
1991
- * (the "License").  You may use, redistribute and/or modify this File in
- * accordance with the terms and conditions of the License, a copy of which
- * is available on the worldwide web at
- * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
- *
- * THE FILE IS DISTRIBUTED AS-IS, WITHOUT WARRANTY OF ANY KIND, AND THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPO=
SE
- * ARE EXPRESSLY DISCLAIMED.  The License provides additional details about
- * this warranty disclaimer.
- **/
+ */
 =

 #include <linux/module.h>
 #include <linux/interrupt.h>
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 7194dd7ef0f1..d7ba5b5c653c 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -1,19 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Marvell NFC-over-UART driver
  *
  * Copyright (C) 2015, Marvell International Ltd.
- *
- * This software file (the "File") is distributed by Marvell International
- * Ltd. under the terms of the GNU General Public License Version 2, June =
1991
- * (the "License").  You may use, redistribute and/or modify this File in
- * accordance with the terms and conditions of the License, a copy of which
- * is available on the worldwide web at
- * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
- *
- * THE FILE IS DISTRIBUTED AS-IS, WITHOUT WARRANTY OF ANY KIND, AND THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPO=
SE
- * ARE EXPRESSLY DISCLAIMED.  The License provides additional details about
- * this warranty disclaimer.
  */
 =

 #include <linux/module.h>
diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index bcd563cb556c..50f06dd1ba25 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -1,20 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Marvell NFC-over-USB driver: USB interface related functions
  *
  * Copyright (C) 2014, Marvell International Ltd.
- *
- * This software file (the "File") is distributed by Marvell International
- * Ltd. under the terms of the GNU General Public License Version 2, June =
1991
- * (the "License").  You may use, redistribute and/or modify this File in
- * accordance with the terms and conditions of the License, a copy of which
- * is available on the worldwide web at
- * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
- *
- * THE FILE IS DISTRIBUTED AS-IS, WITHOUT WARRANTY OF ANY KIND, AND THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPO=
SE
- * ARE EXPRESSLY DISCLAIMED.  The License provides additional details about
- * this warranty disclaimer.
- **/
+ */
 =

 #include <linux/module.h>
 #include <linux/usb.h>
-- =

2.27.0

--===============8998180382107254894==--

