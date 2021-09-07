Content-Type: multipart/mixed; boundary="===============4333094142397510886=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 07/15] nfc: pn544: drop unneeded debug prints
Date: Tue, 07 Sep 2021 14:18:08 +0200
Message-ID: <20210907121816.37750-8-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4333094142397510886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ftrace is a preferred and standard way to debug entering and exiting
functions so drop useless debug prints.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn544/mei.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/nfc/pn544/mei.c b/drivers/nfc/pn544/mei.c
index 5c10aac085a4..a519fa0a53e2 100644
--- a/drivers/nfc/pn544/mei.c
+++ b/drivers/nfc/pn544/mei.c
@@ -22,8 +22,6 @@ static int pn544_mei_probe(struct mei_cl_device *cldev,
 	struct nfc_mei_phy *phy;
 	int r;
 =

-	pr_info("Probing NFC pn544\n");
-
 	phy =3D nfc_mei_phy_alloc(cldev);
 	if (!phy) {
 		pr_err("Cannot allocate memory for pn544 mei phy.\n");
@@ -46,8 +44,6 @@ static void pn544_mei_remove(struct mei_cl_device *cldev)
 {
 	struct nfc_mei_phy *phy =3D mei_cldev_get_drvdata(cldev);
 =

-	pr_info("Removing pn544\n");
-
 	pn544_hci_remove(phy->hdev);
 =

 	nfc_mei_phy_free(phy);
-- =

2.30.2

--===============4333094142397510886==--

