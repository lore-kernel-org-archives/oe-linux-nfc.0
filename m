Content-Type: multipart/mixed; boundary="===============2685070544685430130=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 5/6] nfc: st21nfca: remove unused header includes
Date: Wed, 25 Aug 2021 16:24:58 +0200
Message-ID: <20210825142459.226168-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2685070544685430130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Do not include unnecessary headers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/st21nfca/core.c | 1 -
 drivers/nfc/st21nfca/i2c.c  | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index 5e6c99fcfd27..161caf2675cf 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -8,7 +8,6 @@
 #include <linux/module.h>
 #include <linux/nfc.h>
 #include <net/nfc/hci.h>
-#include <net/nfc/llc.h>
 =

 #include "st21nfca.h"
 =

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index 1b44a37a71aa..279d88128b2e 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -18,8 +18,6 @@
 #include <linux/nfc.h>
 #include <linux/firmware.h>
 =

-#include <asm/unaligned.h>
-
 #include <net/nfc/hci.h>
 #include <net/nfc/llc.h>
 #include <net/nfc/nfc.h>
-- =

2.30.2

--===============2685070544685430130==--

