Content-Type: multipart/mixed; boundary="===============5821609964797406365=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 06/12] nfc: mrvl: skip impossible NCI_MAX_PAYLOAD_SIZE check
Date: Fri, 28 May 2021 08:41:54 -0400
Message-ID: <20210528124200.79655-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5821609964797406365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The nci_ctrl_hdr.plen field us u8, so checkign if it is bigger than
NCI_MAX_PAYLOAD_SIZE does not make any sense.  Fix warning reported by
Smatch:

    drivers/nfc/nfcmrvl/i2c.c:52 nfcmrvl_i2c_read() warn:
        impossible condition '(nci_hdr.plen > 255) =3D> (0-255 > 255)'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/i2c.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
index bafd9b500b2c..3c9bbee98237 100644
--- a/drivers/nfc/nfcmrvl/i2c.c
+++ b/drivers/nfc/nfcmrvl/i2c.c
@@ -49,11 +49,6 @@ static int nfcmrvl_i2c_read(struct nfcmrvl_i2c_drv_data =
*drv_data,
 		return -EBADMSG;
 	}
 =

-	if (nci_hdr.plen > NCI_MAX_PAYLOAD_SIZE) {
-		nfc_err(&drv_data->i2c->dev, "invalid packet payload size\n");
-		return -EBADMSG;
-	}
-
 	*skb =3D nci_skb_alloc(drv_data->priv->ndev,
 			     nci_hdr.plen + NCI_CTRL_HDR_SIZE, GFP_KERNEL);
 	if (!*skb)
-- =

2.27.0

--===============5821609964797406365==--

