Content-Type: multipart/mixed; boundary="===============7713294866792653118=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 12/15] nfc: trf7970a: drop unneeded debug prints
Date: Tue, 07 Sep 2021 14:18:13 +0200
Message-ID: <20210907121816.37750-13-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7713294866792653118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ftrace is a preferred and standard way to debug entering and exiting
functions so drop useless debug prints.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/trf7970a.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 8890fcd59c39..29ca9c328df2 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -2170,8 +2170,6 @@ static int trf7970a_suspend(struct device *dev)
 	struct spi_device *spi =3D to_spi_device(dev);
 	struct trf7970a *trf =3D spi_get_drvdata(spi);
 =

-	dev_dbg(dev, "Suspend\n");
-
 	mutex_lock(&trf->lock);
 =

 	trf7970a_shutdown(trf);
@@ -2187,8 +2185,6 @@ static int trf7970a_resume(struct device *dev)
 	struct trf7970a *trf =3D spi_get_drvdata(spi);
 	int ret;
 =

-	dev_dbg(dev, "Resume\n");
-
 	mutex_lock(&trf->lock);
 =

 	ret =3D trf7970a_startup(trf);
@@ -2206,8 +2202,6 @@ static int trf7970a_pm_runtime_suspend(struct device =
*dev)
 	struct trf7970a *trf =3D spi_get_drvdata(spi);
 	int ret;
 =

-	dev_dbg(dev, "Runtime suspend\n");
-
 	mutex_lock(&trf->lock);
 =

 	ret =3D trf7970a_power_down(trf);
@@ -2223,8 +2217,6 @@ static int trf7970a_pm_runtime_resume(struct device *=
dev)
 	struct trf7970a *trf =3D spi_get_drvdata(spi);
 	int ret;
 =

-	dev_dbg(dev, "Runtime resume\n");
-
 	ret =3D trf7970a_power_up(trf);
 	if (!ret)
 		pm_runtime_mark_last_busy(dev);
-- =

2.30.2

--===============7713294866792653118==--

