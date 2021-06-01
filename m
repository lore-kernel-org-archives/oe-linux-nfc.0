Content-Type: multipart/mixed; boundary="===============1794350763166919303=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH] nfc: mrvl: remove useless "continue" at end of loop
Date: Tue, 01 Jun 2021 18:07:13 +0200
Message-ID: <20210601160713.312622-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1794350763166919303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The "continue" statement at the end of a for loop does not have an
effect.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/usb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index bcd563cb556c..433bdc37ba91 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -325,7 +325,6 @@ static int nfcmrvl_probe(struct usb_interface *intf,
 		if (!drv_data->bulk_rx_ep &&
 		    usb_endpoint_is_bulk_in(ep_desc)) {
 			drv_data->bulk_rx_ep =3D ep_desc;
-			continue;
 		}
 	}
 =

-- =

2.27.0

--===============1794350763166919303==--

