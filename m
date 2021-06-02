Content-Type: multipart/mixed; boundary="===============7447202562954459184=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 2/2] nfc: mrvl: reduce the scope of local variables
Date: Wed, 02 Jun 2021 13:20:11 +0200
Message-ID: <20210602112011.44473-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210602112011.44473-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7447202562954459184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In two places the 'ep_desc' and 'skb' local variables are used only
within if() or for() block, so they scope can be reduced which makes the
entire code slightly easier to follow.  No functional change.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. New patch
---
 drivers/nfc/nfcmrvl/usb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index 6fec20abfd1e..ec6fd7a3f31f 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -68,7 +68,6 @@ static int nfcmrvl_inc_tx(struct nfcmrvl_usb_drv_data *dr=
v_data)
 static void nfcmrvl_bulk_complete(struct urb *urb)
 {
 	struct nfcmrvl_usb_drv_data *drv_data =3D urb->context;
-	struct sk_buff *skb;
 	int err;
 =

 	dev_dbg(&drv_data->udev->dev, "urb %p status %d count %d\n",
@@ -78,6 +77,8 @@ static void nfcmrvl_bulk_complete(struct urb *urb)
 		return;
 =

 	if (!urb->status) {
+		struct sk_buff *skb;
+
 		skb =3D nci_skb_alloc(drv_data->priv->ndev, urb->actual_length,
 				    GFP_ATOMIC);
 		if (!skb) {
@@ -296,7 +297,6 @@ static void nfcmrvl_waker(struct work_struct *work)
 static int nfcmrvl_probe(struct usb_interface *intf,
 			 const struct usb_device_id *id)
 {
-	struct usb_endpoint_descriptor *ep_desc;
 	struct nfcmrvl_usb_drv_data *drv_data;
 	struct nfcmrvl_private *priv;
 	int i;
@@ -314,6 +314,8 @@ static int nfcmrvl_probe(struct usb_interface *intf,
 		return -ENOMEM;
 =

 	for (i =3D 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {
+		struct usb_endpoint_descriptor *ep_desc;
+
 		ep_desc =3D &intf->cur_altsetting->endpoint[i].desc;
 =

 		if (!drv_data->bulk_tx_ep &&
-- =

2.27.0

--===============7447202562954459184==--

