Content-Type: multipart/mixed; boundary="===============0830322563391852909=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 3/9] nfc: s3fwrn5: Remove wrong vendor prefix from GPIOs
Date: Sun, 06 Sep 2020 17:36:48 +0200
Message-ID: <20200906153654.2925-4-krzk@kernel.org>
In-Reply-To: <20200906153654.2925-1-krzk@kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0830322563391852909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The device tree property prefix describes the vendor, which in case of
S3FWRN5 chip is Samsung.  Therefore the "s3fwrn5" prefix for "en-gpios"
and "fw-gpios" is not correct and should be deprecated.  Introduce
properly named properties for these GPIOs but still support deprecated
ones.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/nfc/s3fwrn5/i2c.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index b4eb926d220a..557279492503 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -200,13 +200,21 @@ static int s3fwrn5_i2c_parse_dt(struct i2c_client *cl=
ient)
 	if (!np)
 		return -ENODEV;
 =

-	phy->gpio_en =3D of_get_named_gpio(np, "s3fwrn5,en-gpios", 0);
-	if (!gpio_is_valid(phy->gpio_en))
-		return -ENODEV;
+	phy->gpio_en =3D of_get_named_gpio(np, "en-gpios", 0);
+	if (!gpio_is_valid(phy->gpio_en)) {
+		/* Support also deprecated property */
+		phy->gpio_en =3D of_get_named_gpio(np, "s3fwrn5,en-gpios", 0);
+		if (!gpio_is_valid(phy->gpio_en))
+			return -ENODEV;
+	}
 =

-	phy->gpio_fw_wake =3D of_get_named_gpio(np, "s3fwrn5,fw-gpios", 0);
-	if (!gpio_is_valid(phy->gpio_fw_wake))
-		return -ENODEV;
+	phy->gpio_fw_wake =3D of_get_named_gpio(np, "wake-gpios", 0);
+	if (!gpio_is_valid(phy->gpio_fw_wake)) {
+		/* Support also deprecated property */
+		phy->gpio_fw_wake =3D of_get_named_gpio(np, "s3fwrn5,fw-gpios", 0);
+		if (!gpio_is_valid(phy->gpio_fw_wake))
+			return -ENODEV;
+	}
 =

 	return 0;
 }
-- =

2.17.1

--===============0830322563391852909==--

