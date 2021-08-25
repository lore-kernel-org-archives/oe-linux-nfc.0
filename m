Content-Type: multipart/mixed; boundary="===============7631410815472805823=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 6/6] nfc: st95hf: remove unused header includes
Date: Wed, 25 Aug 2021 16:24:59 +0200
Message-ID: <20210825142459.226168-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7631410815472805823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Do not include unnecessary headers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/st95hf/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 993818742570..d16cf3ff644e 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -16,7 +16,6 @@
 #include <linux/nfc.h>
 #include <linux/of_gpio.h>
 #include <linux/of.h>
-#include <linux/of_irq.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/wait.h>
-- =

2.30.2

--===============7631410815472805823==--

