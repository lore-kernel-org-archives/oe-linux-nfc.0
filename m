Content-Type: multipart/mixed; boundary="===============1680177329252825994=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 02/12] nfc: fdp: drop ACPI_PTR from device ID table
Date: Fri, 28 May 2021 08:41:50 -0400
Message-ID: <20210528124200.79655-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1680177329252825994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The driver can match only via the ACPI ID table so the table should be
always used and the ACPI_PTR does not have any sense.  This fixes fixes
compile warning (!CONFIG_ACPI):

    drivers/nfc/fdp/i2c.c:362:36: warning:
        =E2=80=98fdp_nci_i2c_acpi_match=E2=80=99 defined but not used [-Wun=
used-const-variable=3D]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/fdp/i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
index adaa1a7147f9..997e0806821a 100644
--- a/drivers/nfc/fdp/i2c.c
+++ b/drivers/nfc/fdp/i2c.c
@@ -368,7 +368,7 @@ MODULE_DEVICE_TABLE(acpi, fdp_nci_i2c_acpi_match);
 static struct i2c_driver fdp_nci_i2c_driver =3D {
 	.driver =3D {
 		   .name =3D FDP_I2C_DRIVER_NAME,
-		   .acpi_match_table =3D ACPI_PTR(fdp_nci_i2c_acpi_match),
+		   .acpi_match_table =3D fdp_nci_i2c_acpi_match,
 		  },
 	.probe_new =3D fdp_nci_i2c_probe,
 	.remove =3D fdp_nci_i2c_remove,
-- =

2.27.0

--===============1680177329252825994==--

