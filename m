Content-Type: multipart/mixed; boundary="===============1908400541185489537=="
MIME-Version: 1.0
From: Oliver Neukum <oneukum@suse.com>
To: linux-nfc@lists.01.org
Subject: [PATCH] NFC: NCI: make parent aware in PM terms
Date: Thu, 19 Aug 2021 16:02:28 +0200
Message-ID: <20210819140228.15591-1-oneukum@suse.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1908400541185489537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The NCI device is a child of an i2c device.
If the i2c layer uses runtime PM the power to
the NFC device can be cut whenever the i2c
layer is done transmitting data to the NFC
device.
Under these conditions NFC can not work, as
it needs power to wait for reception of packets.

The necessary extension of runtime PM
to the NFC device requires that it
be activated as a child of the i2c device.
It is not necessary to do any runtime PM
operations. This will disable runtime PM
for this branch of the tree, but otherwise
the NFC device is inoperable.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/nfc/nxp-nci/i2c.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
index 94f7f6d9cbad..dba78a5d217a 100644
--- a/drivers/nfc/nxp-nci/i2c.c
+++ b/drivers/nfc/nxp-nci/i2c.c
@@ -18,6 +18,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/nfc.h>
+#include <linux/pm_runtime.h>
 #include <linux/gpio/consumer.h>
 #include <asm/unaligned.h>
 =

@@ -261,6 +262,7 @@ static int nxp_nci_i2c_probe(struct i2c_client *client,
 {
 	struct device *dev =3D &client->dev;
 	struct nxp_nci_i2c_phy *phy;
+	struct nfc_dev *ndev;
 	int r;
 =

 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
@@ -297,6 +299,11 @@ static int nxp_nci_i2c_probe(struct i2c_client *client,
 	if (r < 0)
 		return r;
 =

+	ndev =3D phy->ndev->nfc_dev;
+	pm_runtime_set_active(&ndev->dev);
+	pm_runtime_enable(&ndev->dev);
+	pm_runtime_mark_last_busy(&ndev->dev);
+
 	r =3D request_threaded_irq(client->irq, NULL,
 				 nxp_nci_i2c_irq_thread_fn,
 				 IRQF_TRIGGER_RISING | IRQF_ONESHOT,
@@ -310,9 +317,12 @@ static int nxp_nci_i2c_probe(struct i2c_client *client,
 static int nxp_nci_i2c_remove(struct i2c_client *client)
 {
 	struct nxp_nci_i2c_phy *phy =3D i2c_get_clientdata(client);
+	struct nfc_dev *ndev =3D phy->ndev->nfc_dev;
 =

 	nxp_nci_remove(phy->ndev);
 	free_irq(client->irq, phy);
+	pm_runtime_disable(&ndev->dev);
+	pm_runtime_set_suspended(&ndev->dev);
 =

 	return 0;
 }
-- =

2.26.2

--===============1908400541185489537==--

