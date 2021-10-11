Content-Type: multipart/mixed; boundary="===============0970425664247709827=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v3 2/7] nfc: nci: replace GPLv2 boilerplate with SPDX
Date: Mon, 11 Oct 2021 15:38:30 +0200
Message-ID: <20211011133835.236347-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0970425664247709827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Replace standard GPLv2 license text with SPDX tag.  Although the comment
mentions GPLv2-only, it refers to the full license file which allows
later GPL versions.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/nci/uart.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/net/nfc/nci/uart.c b/net/nfc/nci/uart.c
index 9bdd9a7d187e..c027c76d493c 100644
--- a/net/nfc/nci/uart.c
+++ b/net/nfc/nci/uart.c
@@ -1,20 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (C) 2015, Marvell International Ltd.
  *
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
- */
-
-/* Inspired (hugely) by HCI LDISC implementation in Bluetooth.
+ * Inspired (hugely) by HCI LDISC implementation in Bluetooth.
  *
  *  Copyright (C) 2000-2001  Qualcomm Incorporated
  *  Copyright (C) 2002-2003  Maxim Krasnyansky <maxk@qualcomm.com>
-- =

2.30.2

--===============0970425664247709827==--

