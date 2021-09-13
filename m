Content-Type: multipart/mixed; boundary="===============1924794384079988177=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2 12/15] nfc: trf7970a: drop unneeded debug prints
Date: Mon, 13 Sep 2021 09:57:57 -0700
Message-ID: <20210913165757.GA1309751@animalcreek.com>
In-Reply-To: <20210913132035.242870-13-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1924794384079988177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 03:20:32PM +0200, Krzysztof Kozlowski wrote:
> ftrace is a preferred and standard way to debug entering and exiting
> functions so drop useless debug prints.
> =

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/nfc/trf7970a.c | 8 --------
>  1 file changed, 8 deletions(-)
> =

> diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
> index 8890fcd59c39..29ca9c328df2 100644
> --- a/drivers/nfc/trf7970a.c
> +++ b/drivers/nfc/trf7970a.c
> @@ -2170,8 +2170,6 @@ static int trf7970a_suspend(struct device *dev)
>  	struct spi_device *spi =3D to_spi_device(dev);
>  	struct trf7970a *trf =3D spi_get_drvdata(spi);
>  =

> -	dev_dbg(dev, "Suspend\n");
> -
>  	mutex_lock(&trf->lock);
>  =

>  	trf7970a_shutdown(trf);
> @@ -2187,8 +2185,6 @@ static int trf7970a_resume(struct device *dev)
>  	struct trf7970a *trf =3D spi_get_drvdata(spi);
>  	int ret;
>  =

> -	dev_dbg(dev, "Resume\n");
> -
>  	mutex_lock(&trf->lock);
>  =

>  	ret =3D trf7970a_startup(trf);
> @@ -2206,8 +2202,6 @@ static int trf7970a_pm_runtime_suspend(struct devic=
e *dev)
>  	struct trf7970a *trf =3D spi_get_drvdata(spi);
>  	int ret;
>  =

> -	dev_dbg(dev, "Runtime suspend\n");
> -
>  	mutex_lock(&trf->lock);
>  =

>  	ret =3D trf7970a_power_down(trf);
> @@ -2223,8 +2217,6 @@ static int trf7970a_pm_runtime_resume(struct device=
 *dev)
>  	struct trf7970a *trf =3D spi_get_drvdata(spi);
>  	int ret;
>  =

> -	dev_dbg(dev, "Runtime resume\n");
> -
>  	ret =3D trf7970a_power_up(trf);
>  	if (!ret)
>  		pm_runtime_mark_last_busy(dev);
> -- =

> 2.30.2

Acked-by: Mark Greer <mgreer@animalcreek.com>
--===============1924794384079988177==--

