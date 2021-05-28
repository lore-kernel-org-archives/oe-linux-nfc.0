Content-Type: multipart/mixed; boundary="===============1927028650192410208=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 09/12] nfc: pn544: mark ACPI and OF device ID tables as maybe unused
Date: Fri, 28 May 2021 08:41:57 -0400
Message-ID: <20210528124200.79655-9-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1927028650192410208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The driver can match either via OF or ACPI ID tables.  If one
configuration is disabled, the table will be unused:

    drivers/nfc/pn544/i2c.c:53:36: warning:
        =E2=80=98pn544_hci_i2c_acpi_match=E2=80=99 defined but not used [-W=
unused-const-variable=3D]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn544/i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index 4ac8cb262559..aac778c5ddd2 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -50,7 +50,7 @@ static const struct i2c_device_id pn544_hci_i2c_id_table[=
] =3D {
 =

 MODULE_DEVICE_TABLE(i2c, pn544_hci_i2c_id_table);
 =

-static const struct acpi_device_id pn544_hci_i2c_acpi_match[] =3D {
+static const struct acpi_device_id pn544_hci_i2c_acpi_match[] __maybe_unus=
ed =3D {
 	{"NXP5440", 0},
 	{}
 };
@@ -951,7 +951,7 @@ static int pn544_hci_i2c_remove(struct i2c_client *clie=
nt)
 	return 0;
 }
 =

-static const struct of_device_id of_pn544_i2c_match[] =3D {
+static const struct of_device_id of_pn544_i2c_match[] __maybe_unused =3D {
 	{ .compatible =3D "nxp,pn544-i2c", },
 	{},
 };
-- =

2.27.0

--===============1927028650192410208==--

