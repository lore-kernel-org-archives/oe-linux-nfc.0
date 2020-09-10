Content-Type: multipart/mixed; boundary="===============0313150232923671531=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: [PATCH v3 4/8] nfc: s3fwrn5: Remove unneeded 'ret' variable
Date: Thu, 10 Sep 2020 18:12:15 +0200
Message-ID: <20200910161219.6237-5-krzk@kernel.org>
In-Reply-To: <20200910161219.6237-1-krzk@kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0313150232923671531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The local variable 'ret' can be removed:

  drivers/nfc/s3fwrn5/i2c.c:167:6: warning: variable 'ret' set but not used=
 [-Wunused-but-set-variable]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/nfc/s3fwrn5/i2c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index 557279492503..dc995286be84 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -164,7 +164,6 @@ static int s3fwrn5_i2c_read(struct s3fwrn5_i2c_phy *phy)
 static irqreturn_t s3fwrn5_i2c_irq_thread_fn(int irq, void *phy_id)
 {
 	struct s3fwrn5_i2c_phy *phy =3D phy_id;
-	int ret =3D 0;
 =

 	if (!phy || !phy->ndev) {
 		WARN_ON_ONCE(1);
@@ -179,10 +178,9 @@ static irqreturn_t s3fwrn5_i2c_irq_thread_fn(int irq, =
void *phy_id)
 	switch (phy->mode) {
 	case S3FWRN5_MODE_NCI:
 	case S3FWRN5_MODE_FW:
-		ret =3D s3fwrn5_i2c_read(phy);
+		s3fwrn5_i2c_read(phy);
 		break;
 	case S3FWRN5_MODE_COLD:
-		ret =3D -EREMOTEIO;
 		break;
 	}
 =

-- =

2.17.1

--===============0313150232923671531==--

