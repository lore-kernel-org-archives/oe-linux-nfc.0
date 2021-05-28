Content-Type: multipart/mixed; boundary="===============1334622283532502988=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 07/12] nfc: pn533: mark OF device ID tables as maybe unused
Date: Fri, 28 May 2021 08:41:55 -0400
Message-ID: <20210528124200.79655-7-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1334622283532502988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The driver can match either via OF or I2C ID tables.  If OF is disabled,
the table will be unused:

    drivers/nfc/pn533/i2c.c:252:34: warning:
        =E2=80=98of_pn533_i2c_match=E2=80=99 defined but not used [-Wunused=
-const-variable=3D]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn533/i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
index 795da9b85d56..bfc617acabae 100644
--- a/drivers/nfc/pn533/i2c.c
+++ b/drivers/nfc/pn533/i2c.c
@@ -249,7 +249,7 @@ static int pn533_i2c_remove(struct i2c_client *client)
 	return 0;
 }
 =

-static const struct of_device_id of_pn533_i2c_match[] =3D {
+static const struct of_device_id of_pn533_i2c_match[] __maybe_unused =3D {
 	{ .compatible =3D "nxp,pn532", },
 	/*
 	 * NOTE: The use of the compatibles with the trailing "...-i2c" is
-- =

2.27.0

--===============1334622283532502988==--

