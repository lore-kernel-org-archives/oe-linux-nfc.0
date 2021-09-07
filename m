Content-Type: multipart/mixed; boundary="===============0844673297312220366=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 15/15] nfc: mrvl: drop unneeded memory allocation fail messages
Date: Tue, 07 Sep 2021 14:18:16 +0200
Message-ID: <20210907121816.37750-16-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0844673297312220366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

nci_skb_alloc() already prints an error message on memory allocation
failure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/fw_dnld.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/fw_dnld.c b/drivers/nfc/nfcmrvl/fw_dnld.c
index edac56b01fd1..e83f65596a88 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.c
+++ b/drivers/nfc/nfcmrvl/fw_dnld.c
@@ -76,10 +76,8 @@ static struct sk_buff *alloc_lc_skb(struct nfcmrvl_priva=
te *priv, uint8_t plen)
 	struct nci_data_hdr *hdr;
 =

 	skb =3D nci_skb_alloc(priv->ndev, (NCI_DATA_HDR_SIZE + plen), GFP_KERNEL);
-	if (!skb) {
-		pr_err("no memory for data\n");
+	if (!skb)
 		return NULL;
-	}
 =

 	hdr =3D skb_put(skb, NCI_DATA_HDR_SIZE);
 	hdr->conn_id =3D NCI_CORE_LC_CONNID_PROP_FW_DL;
-- =

2.30.2

--===============0844673297312220366==--

