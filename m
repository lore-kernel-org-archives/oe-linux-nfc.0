Content-Type: multipart/mixed; boundary="===============0926919030808585309=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 07/11] nfc: pn533: drop unneeded braces {} in if
Date: Fri, 28 May 2021 10:55:30 -0400
Message-ID: <20210528145534.125460-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528145534.125460-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0926919030808585309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

{} braces are not needed over single if-statement.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn533/i2c.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
index bb04fddb0504..e6bf8cfe3aa7 100644
--- a/drivers/nfc/pn533/i2c.c
+++ b/drivers/nfc/pn533/i2c.c
@@ -192,9 +192,8 @@ static int pn533_i2c_probe(struct i2c_client *client,
 				phy, &i2c_phy_ops, NULL,
 				&phy->i2c_dev->dev);
 =

-	if (IS_ERR(priv)) {
+	if (IS_ERR(priv))
 		return PTR_ERR(priv);
-	}
 =

 	phy->priv =3D priv;
 	r =3D pn532_i2c_nfc_alloc(priv, PN533_NO_TYPE_B_PROTOCOLS, &client->dev);
-- =

2.27.0

--===============0926919030808585309==--

