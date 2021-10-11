Content-Type: multipart/mixed; boundary="===============6298475137033003010=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v3 7/7] nfc: microread: drop unneeded debug prints
Date: Mon, 11 Oct 2021 15:38:35 +0200
Message-ID: <20211011133835.236347-8-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6298475137033003010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ftrace is a preferred and standard way to debug entering and exiting
functions so drop useless debug prints.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/microread/i2c.c | 4 ----
 drivers/nfc/microread/mei.c | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/nfc/microread/i2c.c b/drivers/nfc/microread/i2c.c
index 86f593c73ed6..067295124eb9 100644
--- a/drivers/nfc/microread/i2c.c
+++ b/drivers/nfc/microread/i2c.c
@@ -237,8 +237,6 @@ static int microread_i2c_probe(struct i2c_client *clien=
t,
 	struct microread_i2c_phy *phy;
 	int r;
 =

-	dev_dbg(&client->dev, "client %p\n", client);
-
 	phy =3D devm_kzalloc(&client->dev, sizeof(struct microread_i2c_phy),
 			   GFP_KERNEL);
 	if (!phy)
@@ -262,8 +260,6 @@ static int microread_i2c_probe(struct i2c_client *clien=
t,
 	if (r < 0)
 		goto err_irq;
 =

-	nfc_info(&client->dev, "Probed\n");
-
 	return 0;
 =

 err_irq:
diff --git a/drivers/nfc/microread/mei.c b/drivers/nfc/microread/mei.c
index 00689e18dc46..e2a77a5fc887 100644
--- a/drivers/nfc/microread/mei.c
+++ b/drivers/nfc/microread/mei.c
@@ -23,8 +23,6 @@ static int microread_mei_probe(struct mei_cl_device *clde=
v,
 	struct nfc_mei_phy *phy;
 	int r;
 =

-	pr_info("Probing NFC microread\n");
-
 	phy =3D nfc_mei_phy_alloc(cldev);
 	if (!phy)
 		return -ENOMEM;
-- =

2.30.2

--===============6298475137033003010==--

