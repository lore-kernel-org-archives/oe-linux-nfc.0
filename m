Content-Type: multipart/mixed; boundary="===============2583036134312493348=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 08/11] nfc: pn544: drop ftrace-like debugging messages
Date: Fri, 28 May 2021 10:55:31 -0400
Message-ID: <20210528145534.125460-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528145534.125460-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2583036134312493348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Now that the kernel has ftrace, any debugging calls that just do "made
it to this function!" and "leaving this function!" can be removed.
Better to use standard debugging tools.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn544/i2c.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index aac778c5ddd2..de59e439c369 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -241,8 +241,6 @@ static int pn544_hci_i2c_enable(void *phy_id)
 {
 	struct pn544_i2c_phy *phy =3D phy_id;
 =

-	pr_info("%s\n", __func__);
-
 	pn544_hci_i2c_enable_mode(phy, PN544_HCI_MODE);
 =

 	phy->powered =3D 1;
@@ -875,9 +873,6 @@ static int pn544_hci_i2c_probe(struct i2c_client *clien=
t,
 	struct pn544_i2c_phy *phy;
 	int r =3D 0;
 =

-	dev_dbg(&client->dev, "%s\n", __func__);
-	dev_dbg(&client->dev, "IRQ: %d\n", client->irq);
-
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		nfc_err(&client->dev, "Need I2C_FUNC_I2C\n");
 		return -ENODEV;
@@ -937,8 +932,6 @@ static int pn544_hci_i2c_remove(struct i2c_client *clie=
nt)
 {
 	struct pn544_i2c_phy *phy =3D i2c_get_clientdata(client);
 =

-	dev_dbg(&client->dev, "%s\n", __func__);
-
 	cancel_work_sync(&phy->fw_work);
 	if (phy->fw_work_state !=3D FW_WORK_STATE_IDLE)
 		pn544_hci_i2c_fw_work_complete(phy, -ENODEV);
-- =

2.27.0

--===============2583036134312493348==--

