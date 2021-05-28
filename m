Content-Type: multipart/mixed; boundary="===============7869799285050274233=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 11/12] nfc: st21nfca: mark ACPI and OF device ID tables as maybe unused
Date: Fri, 28 May 2021 08:41:59 -0400
Message-ID: <20210528124200.79655-11-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7869799285050274233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The driver can match either via OF or ACPI ID tables.  If one
configuration is disabled, the table will be unused:

    drivers/nfc/st21nfca/i2c.c:593:34: warning:
        =E2=80=98of_st21nfca_i2c_match=E2=80=99 defined but not used [-Wunu=
sed-const-variable=3D]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/st21nfca/i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index 23ed11f91213..cebc6c06a1b6 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -584,13 +584,13 @@ static const struct i2c_device_id st21nfca_hci_i2c_id=
_table[] =3D {
 };
 MODULE_DEVICE_TABLE(i2c, st21nfca_hci_i2c_id_table);
 =

-static const struct acpi_device_id st21nfca_hci_i2c_acpi_match[] =3D {
+static const struct acpi_device_id st21nfca_hci_i2c_acpi_match[] __maybe_u=
nused =3D {
 	{"SMO2100", 0},
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, st21nfca_hci_i2c_acpi_match);
 =

-static const struct of_device_id of_st21nfca_i2c_match[] =3D {
+static const struct of_device_id of_st21nfca_i2c_match[] __maybe_unused =
=3D {
 	{ .compatible =3D "st,st21nfca-i2c", },
 	{ .compatible =3D "st,st21nfca_i2c", },
 	{}
-- =

2.27.0

--===============7869799285050274233==--

