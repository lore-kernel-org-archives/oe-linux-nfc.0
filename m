Content-Type: multipart/mixed; boundary="===============7644608455600659232=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 08/15] nfc: pn544: drop unneeded memory allocation fail messages
Date: Tue, 07 Sep 2021 14:18:09 +0200
Message-ID: <20210907121816.37750-9-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7644608455600659232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

nfc_mei_phy_alloc() already prints an error message on memory allocation
failure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn544/mei.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nfc/pn544/mei.c b/drivers/nfc/pn544/mei.c
index a519fa0a53e2..c493f2dbd0e2 100644
--- a/drivers/nfc/pn544/mei.c
+++ b/drivers/nfc/pn544/mei.c
@@ -23,10 +23,8 @@ static int pn544_mei_probe(struct mei_cl_device *cldev,
 	int r;
 =

 	phy =3D nfc_mei_phy_alloc(cldev);
-	if (!phy) {
-		pr_err("Cannot allocate memory for pn544 mei phy.\n");
+	if (!phy)
 		return -ENOMEM;
-	}
 =

 	r =3D pn544_hci_probe(phy, &mei_phy_ops, LLC_NOP_NAME,
 			    MEI_NFC_HEADER_SIZE, 0, MEI_NFC_MAX_HCI_PAYLOAD,
-- =

2.30.2

--===============7644608455600659232==--

