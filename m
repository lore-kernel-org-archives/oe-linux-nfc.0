Content-Type: multipart/mixed; boundary="===============1738324774421858189=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 08/12] nfc: s3fwrn5: mark OF device ID tables as maybe unused
Date: Fri, 28 May 2021 08:41:56 -0400
Message-ID: <20210528124200.79655-8-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1738324774421858189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The driver can match either via OF or I2C ID tables.  If OF is disabled,
the table will be unused:

    drivers/nfc/s3fwrn5/i2c.c:265:34: warning:
        =E2=80=98of_s3fwrn5_i2c_match=E2=80=99 defined but not used [-Wunus=
ed-const-variable=3D]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/s3fwrn5/i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index 38b8d6cab593..4d1cf1bb55b0 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -262,7 +262,7 @@ static const struct i2c_device_id s3fwrn5_i2c_id_table[=
] =3D {
 };
 MODULE_DEVICE_TABLE(i2c, s3fwrn5_i2c_id_table);
 =

-static const struct of_device_id of_s3fwrn5_i2c_match[] =3D {
+static const struct of_device_id of_s3fwrn5_i2c_match[] __maybe_unused =3D=
 {
 	{ .compatible =3D "samsung,s3fwrn5-i2c", },
 	{}
 };
-- =

2.27.0

--===============1738324774421858189==--

