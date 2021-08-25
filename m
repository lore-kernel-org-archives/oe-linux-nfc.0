Content-Type: multipart/mixed; boundary="===============4176945233933206283=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 4/6] nfc: st-nci: remove unused header includes
Date: Wed, 25 Aug 2021 16:24:57 +0200
Message-ID: <20210825142459.226168-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4176945233933206283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Do not include unnecessary headers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/st-nci/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/nfc/st-nci/core.c b/drivers/nfc/st-nci/core.c
index 72bb51efdf9c..a367136d4330 100644
--- a/drivers/nfc/st-nci/core.c
+++ b/drivers/nfc/st-nci/core.c
@@ -9,8 +9,6 @@
 #include <linux/nfc.h>
 #include <net/nfc/nci.h>
 #include <net/nfc/nci_core.h>
-#include <linux/gpio.h>
-#include <linux/delay.h>
 =

 #include "st-nci.h"
 =

-- =

2.30.2

--===============4176945233933206283==--

