Content-Type: multipart/mixed; boundary="===============7037065655711837151=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 10/12] nfc: st-nci: mark ACPI and OF device ID tables as maybe unused
Date: Fri, 28 May 2021 08:41:58 -0400
Message-ID: <20210528124200.79655-10-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7037065655711837151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The driver can match either via OF or ACPI ID tables.  If one
configuration is disabled, the table will be unused:

    drivers/nfc/st-nci/spi.c:296:34: warning:
        =E2=80=98of_st_nci_spi_match=E2=80=99 defined but not used [-Wunuse=
d-const-variable=3D]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/st-nci/i2c.c | 4 ++--
 drivers/nfc/st-nci/spi.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 55d600cd3861..663d1cc19b81 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -274,14 +274,14 @@ static const struct i2c_device_id st_nci_i2c_id_table=
[] =3D {
 };
 MODULE_DEVICE_TABLE(i2c, st_nci_i2c_id_table);
 =

-static const struct acpi_device_id st_nci_i2c_acpi_match[] =3D {
+static const struct acpi_device_id st_nci_i2c_acpi_match[] __maybe_unused =
=3D {
 	{"SMO2101"},
 	{"SMO2102"},
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, st_nci_i2c_acpi_match);
 =

-static const struct of_device_id of_st_nci_i2c_match[] =3D {
+static const struct of_device_id of_st_nci_i2c_match[] __maybe_unused =3D {
 	{ .compatible =3D "st,st21nfcb-i2c", },
 	{ .compatible =3D "st,st21nfcb_i2c", },
 	{ .compatible =3D "st,st21nfcc-i2c", },
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index 09df6ea65840..5f1a2173b2e7 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -287,13 +287,13 @@ static struct spi_device_id st_nci_spi_id_table[] =3D=
 {
 };
 MODULE_DEVICE_TABLE(spi, st_nci_spi_id_table);
 =

-static const struct acpi_device_id st_nci_spi_acpi_match[] =3D {
+static const struct acpi_device_id st_nci_spi_acpi_match[] __maybe_unused =
=3D {
 	{"SMO2101", 0},
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, st_nci_spi_acpi_match);
 =

-static const struct of_device_id of_st_nci_spi_match[] =3D {
+static const struct of_device_id of_st_nci_spi_match[] __maybe_unused =3D {
 	{ .compatible =3D "st,st21nfcb-spi", },
 	{}
 };
-- =

2.27.0

--===============7037065655711837151==--

