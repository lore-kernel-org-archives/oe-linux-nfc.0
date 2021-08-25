Content-Type: multipart/mixed; boundary="===============1963251000302040391=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 1/6] nfc: microread: remove unused header includes
Date: Wed, 25 Aug 2021 16:24:54 +0200
Message-ID: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1963251000302040391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Do not include unnecessary headers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/microread/mei.c       | 1 -
 drivers/nfc/microread/microread.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/nfc/microread/mei.c b/drivers/nfc/microread/mei.c
index 8fa7771085eb..8edf761a6b2a 100644
--- a/drivers/nfc/microread/mei.c
+++ b/drivers/nfc/microread/mei.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/nfc.h>
-#include <net/nfc/hci.h>
 #include <net/nfc/llc.h>
 =

 #include "../mei_phy.h"
diff --git a/drivers/nfc/microread/microread.c b/drivers/nfc/microread/micr=
oread.c
index 9d83ccebd434..bb4d029bb888 100644
--- a/drivers/nfc/microread/microread.c
+++ b/drivers/nfc/microread/microread.c
@@ -15,7 +15,6 @@
 #include <linux/nfc.h>
 #include <net/nfc/nfc.h>
 #include <net/nfc/hci.h>
-#include <net/nfc/llc.h>
 =

 #include "microread.h"
 =

-- =

2.30.2

--===============1963251000302040391==--

