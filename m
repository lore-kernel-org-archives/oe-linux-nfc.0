Content-Type: multipart/mixed; boundary="===============2209772071685253780=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 1/2] nfc: mrvl: remove useless "continue" at end of loop
Date: Wed, 02 Jun 2021 13:20:10 +0200
Message-ID: <20210602112011.44473-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2209772071685253780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The "continue" statement at the end of a for loop does not have an
effect.  Entire loop contents can be slightly simplified to increase
code readability.  No functional change.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. Make it if-else-if as Joe suggested.
---
 drivers/nfc/nfcmrvl/usb.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index bcd563cb556c..6fec20abfd1e 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -319,13 +319,9 @@ static int nfcmrvl_probe(struct usb_interface *intf,
 		if (!drv_data->bulk_tx_ep &&
 		    usb_endpoint_is_bulk_out(ep_desc)) {
 			drv_data->bulk_tx_ep =3D ep_desc;
-			continue;
-		}
-
-		if (!drv_data->bulk_rx_ep &&
-		    usb_endpoint_is_bulk_in(ep_desc)) {
+		} else if (!drv_data->bulk_rx_ep &&
+			   usb_endpoint_is_bulk_in(ep_desc)) {
 			drv_data->bulk_rx_ep =3D ep_desc;
-			continue;
 		}
 	}
 =

-- =

2.27.0

--===============2209772071685253780==--

