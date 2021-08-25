Content-Type: multipart/mixed; boundary="===============8816504871214377915=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 2/6] nfc: mrvl: remove unused header includes
Date: Wed, 25 Aug 2021 16:24:55 +0200
Message-ID: <20210825142459.226168-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8816504871214377915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Do not include unnecessary headers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/i2c.c | 3 ---
 drivers/nfc/nfcmrvl/spi.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
index c38b228006fd..ceef81d93ac9 100644
--- a/drivers/nfc/nfcmrvl/i2c.c
+++ b/drivers/nfc/nfcmrvl/i2c.c
@@ -8,12 +8,9 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
-#include <linux/pm_runtime.h>
 #include <linux/nfc.h>
-#include <linux/gpio.h>
 #include <linux/delay.h>
 #include <linux/of_irq.h>
-#include <linux/of_gpio.h>
 #include <net/nfc/nci.h>
 #include <net/nfc/nci_core.h>
 #include "nfcmrvl.h"
diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index b182ab2e03c0..5b833a9a83f8 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -7,11 +7,8 @@
 =

 #include <linux/module.h>
 #include <linux/interrupt.h>
-#include <linux/pm_runtime.h>
 #include <linux/nfc.h>
-#include <linux/gpio.h>
 #include <linux/of_irq.h>
-#include <linux/of_gpio.h>
 #include <net/nfc/nci.h>
 #include <net/nfc/nci_core.h>
 #include <linux/spi/spi.h>
-- =

2.30.2

--===============8816504871214377915==--

