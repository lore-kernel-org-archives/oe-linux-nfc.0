Content-Type: multipart/mixed; boundary="===============5186102482423549175=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 14/15] nfc: microread: drop unneeded memory allocation fail messages
Date: Mon, 13 Sep 2021 15:20:34 +0200
Message-ID: <20210913132035.242870-15-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5186102482423549175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

nfc_mei_phy_alloc() already prints an error message on memory allocation
failure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/microread/mei.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nfc/microread/mei.c b/drivers/nfc/microread/mei.c
index 686be3381727..e2a77a5fc887 100644
--- a/drivers/nfc/microread/mei.c
+++ b/drivers/nfc/microread/mei.c
@@ -24,10 +24,8 @@ static int microread_mei_probe(struct mei_cl_device *cld=
ev,
 	int r;
 =

 	phy =3D nfc_mei_phy_alloc(cldev);
-	if (!phy) {
-		pr_err("Cannot allocate memory for microread mei phy.\n");
+	if (!phy)
 		return -ENOMEM;
-	}
 =

 	r =3D microread_probe(phy, &mei_phy_ops, LLC_NOP_NAME,
 			    MEI_NFC_HEADER_SIZE, 0, MEI_NFC_MAX_HCI_PAYLOAD,
-- =

2.30.2

--===============5186102482423549175==--

