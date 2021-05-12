Content-Type: multipart/mixed; boundary="===============0986497426487723435=="
MIME-Version: 1.0
From: Oliver Neukum <oneukum@suse.com>
To: linux-nfc@lists.01.org
Subject: [PATCH] NFC: cooperation with runtime PM
Date: Wed, 12 May 2021 15:44:13 +0200
Message-ID: <20210512134413.31808-1-oneukum@suse.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0986497426487723435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We cannot rely on the underlying hardware to do correct
runtime PM. NFC core needs to get PM reference while
a device is operational, lest it be suspended when
it is supposed to be waiting for a target to come
into range.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 net/nfc/core.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/net/nfc/core.c b/net/nfc/core.c
index 573c80c6ff7a..5ca4597c39c7 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/rfkill.h>
 #include <linux/nfc.h>
+#include <linux/pm_runtime.h>
 =

 #include <net/genetlink.h>
 =

@@ -37,6 +38,7 @@ int nfc_fw_download(struct nfc_dev *dev, const char *firm=
ware_name)
 	pr_debug("%s do firmware %s\n", dev_name(&dev->dev), firmware_name);
 =

 	device_lock(&dev->dev);
+	pm_runtime_get_sync(&dev->dev);
 =

 	if (!device_is_registered(&dev->dev)) {
 		rc =3D -ENODEV;
@@ -58,7 +60,10 @@ int nfc_fw_download(struct nfc_dev *dev, const char *fir=
mware_name)
 	if (rc)
 		dev->fw_download_in_progress =3D false;
 =

+	device_unlock(&dev->dev);
+	return rc;
 error:
+	pm_runtime_put(&dev->dev);
 	device_unlock(&dev->dev);
 	return rc;
 }
@@ -73,9 +78,13 @@ int nfc_fw_download(struct nfc_dev *dev, const char *fir=
mware_name)
 int nfc_fw_download_done(struct nfc_dev *dev, const char *firmware_name,
 			 u32 result)
 {
+	int rv;
+
 	dev->fw_download_in_progress =3D false;
 =

-	return nfc_genl_fw_download_done(dev, firmware_name, result);
+	rv =3D nfc_genl_fw_download_done(dev, firmware_name, result);
+	pm_runtime_put(&dev->dev);
+	return rv;
 }
 EXPORT_SYMBOL(nfc_fw_download_done);
 =

@@ -93,6 +102,7 @@ int nfc_dev_up(struct nfc_dev *dev)
 	pr_debug("dev_name=3D%s\n", dev_name(&dev->dev));
 =

 	device_lock(&dev->dev);
+	pm_runtime_get_sync(&dev->dev);
 =

 	if (dev->rfkill && rfkill_blocked(dev->rfkill)) {
 		rc =3D -ERFKILL;
@@ -124,7 +134,11 @@ int nfc_dev_up(struct nfc_dev *dev)
 	if (dev->ops->discover_se && dev->ops->discover_se(dev))
 		pr_err("SE discovery failed\n");
 =

+	device_unlock(&dev->dev);
+	return rc;
+
 error:
+	pm_runtime_put(&dev->dev);
 	device_unlock(&dev->dev);
 	return rc;
 }
@@ -161,6 +175,9 @@ int nfc_dev_down(struct nfc_dev *dev)
 		dev->ops->dev_down(dev);
 =

 	dev->dev_up =3D false;
+	pm_runtime_put(&dev->dev);
+	device_unlock(&dev->dev);
+	return rc;
 =

 error:
 	device_unlock(&dev->dev);
-- =

2.26.2

--===============0986497426487723435==--

