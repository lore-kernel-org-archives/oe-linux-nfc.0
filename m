Content-Type: multipart/mixed; boundary="===============2294988825090447205=="
MIME-Version: 1.0
From: Oliver Neukum <oneukum@suse.com>
To: linux-nfc@lists.01.org
Subject: [PATCH] nxp-nci: add NXP1002 id
Date: Wed, 12 May 2021 15:54:51 +0200
Message-ID: <20210512135451.32375-1-oneukum@suse.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2294988825090447205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The driver also works with those new devices.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/nfc/nxp-nci/i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
index 7e451c10985d..94f7f6d9cbad 100644
--- a/drivers/nfc/nxp-nci/i2c.c
+++ b/drivers/nfc/nxp-nci/i2c.c
@@ -332,6 +332,7 @@ MODULE_DEVICE_TABLE(of, of_nxp_nci_i2c_match);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id acpi_id[] =3D {
 	{ "NXP1001" },
+	{ "NXP1002" },
 	{ "NXP7471" },
 	{ }
 };
-- =

2.26.2

--===============2294988825090447205==--

