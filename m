Content-Type: multipart/mixed; boundary="===============2276004187642749765=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v3 6/7] nfc: trf7970a: drop unneeded debug prints
Date: Mon, 11 Oct 2021 15:38:34 +0200
Message-ID: <20211011133835.236347-7-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2276004187642749765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ftrace is a preferred and standard way to debug entering and exiting
functions so drop useless debug prints.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Mark Greer <mgreer@animalcreek.com>
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

--===============2276004187642749765==--

