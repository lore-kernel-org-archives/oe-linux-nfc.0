Content-Type: multipart/mixed; boundary="===============2215108236071815143=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 05/12] nfc: mrvl: mark OF device ID tables as maybe unused
Date: Fri, 28 May 2021 08:41:53 -0400
Message-ID: <20210528124200.79655-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2215108236071815143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The driver can match either via OF or I2C ID tables.  If OF is disabled,
the table will be unused:

    drivers/nfc/nfcmrvl/spi.c:199:34: warning:
        =E2=80=98of_nfcmrvl_spi_match=E2=80=99 defined but not used [-Wunus=
ed-const-variable=3D]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/i2c.c | 2 +-
 drivers/nfc/nfcmrvl/spi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
index c5420616b7bc..bafd9b500b2c 100644
--- a/drivers/nfc/nfcmrvl/i2c.c
+++ b/drivers/nfc/nfcmrvl/i2c.c
@@ -260,7 +260,7 @@ static int nfcmrvl_i2c_remove(struct i2c_client *client)
 }
 =

 =

-static const struct of_device_id of_nfcmrvl_i2c_match[] =3D {
+static const struct of_device_id of_nfcmrvl_i2c_match[] __maybe_unused =3D=
 {
 	{ .compatible =3D "marvell,nfc-i2c", },
 	{},
 };
diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index dec0d3eb3648..0647b85930a6 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -196,7 +196,7 @@ static int nfcmrvl_spi_remove(struct spi_device *spi)
 	return 0;
 }
 =

-static const struct of_device_id of_nfcmrvl_spi_match[] =3D {
+static const struct of_device_id of_nfcmrvl_spi_match[] __maybe_unused =3D=
 {
 	{ .compatible =3D "marvell,nfc-spi", },
 	{},
 };
-- =

2.27.0

--===============2215108236071815143==--

