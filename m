Content-Type: multipart/mixed; boundary="===============8881762480410056866=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] NFC: cooperation with runtime PM
Date: Wed, 12 May 2021 09:54:55 -0400
Message-ID: <0a8ca4c7-ce55-3c92-cc29-b383e546d563@canonical.com>
In-Reply-To: <20210512134413.31808-1-oneukum@suse.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8881762480410056866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the patch. Few notes:

On 12/05/2021 09:44, Oliver Neukum wrote:
> We cannot rely on the underlying hardware to do correct
> runtime PM. NFC core needs to get PM reference while
> a device is operational, lest it be suspended when
> it is supposed to be waiting for a target to come
> into range.


Your word wrapping is unusually early - please wrap the commit msg as in
coding style (so around 75-character).
https://elixir.bootlin.com/linux/latest/source/Documentation/process/submit=
ting-patches.rst#L578

> =

> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  net/nfc/core.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> =

> diff --git a/net/nfc/core.c b/net/nfc/core.c
> index 573c80c6ff7a..5ca4597c39c7 100644
> --- a/net/nfc/core.c
> +++ b/net/nfc/core.c
> @@ -15,6 +15,7 @@
>  #include <linux/slab.h>
>  #include <linux/rfkill.h>
>  #include <linux/nfc.h>
> +#include <linux/pm_runtime.h>
>  =

>  #include <net/genetlink.h>
>  =

> @@ -37,6 +38,7 @@ int nfc_fw_download(struct nfc_dev *dev, const char *fi=
rmware_name)
>  	pr_debug("%s do firmware %s\n", dev_name(&dev->dev), firmware_name);
>  =

>  	device_lock(&dev->dev);
> +	pm_runtime_get_sync(&dev->dev);

This can fail. Probably you wanted pm_runtime_resume_and_get() here.

>  =

>  	if (!device_is_registered(&dev->dev)) {
>  		rc =3D -ENODEV;
> @@ -58,7 +60,10 @@ int nfc_fw_download(struct nfc_dev *dev, const char *f=
irmware_name)
>  	if (rc)
>  		dev->fw_download_in_progress =3D false;

goto error

>  =

> +	device_unlock(&dev->dev);
> +	return rc;

Since last rc cannot be !=3D 0, return 0

Blank line

>  error:
> +	pm_runtime_put(&dev->dev);
>  	device_unlock(&dev->dev);
>  	return rc;
>  }
> @@ -73,9 +78,13 @@ int nfc_fw_download(struct nfc_dev *dev, const char *f=
irmware_name)
>  int nfc_fw_download_done(struct nfc_dev *dev, const char *firmware_name,
>  			 u32 result)
>  {
> +	int rv;

"int rc"

> +
>  	dev->fw_download_in_progress =3D false;
>  =

> -	return nfc_genl_fw_download_done(dev, firmware_name, result);
> +	rv =3D nfc_genl_fw_download_done(dev, firmware_name, result);
> +	pm_runtime_put(&dev->dev);
> +	return rv;
>  }
>  EXPORT_SYMBOL(nfc_fw_download_done);
>  =

> @@ -93,6 +102,7 @@ int nfc_dev_up(struct nfc_dev *dev)
>  	pr_debug("dev_name=3D%s\n", dev_name(&dev->dev));
>  =

>  	device_lock(&dev->dev);
> +	pm_runtime_get_sync(&dev->dev);

Same comments as before.

>  =

>  	if (dev->rfkill && rfkill_blocked(dev->rfkill)) {
>  		rc =3D -ERFKILL;
> @@ -124,7 +134,11 @@ int nfc_dev_up(struct nfc_dev *dev)
>  	if (dev->ops->discover_se && dev->ops->discover_se(dev))
>  		pr_err("SE discovery failed\n");
>  =

> +	device_unlock(&dev->dev);
> +	return rc;

Probably same comments as before apply.

> +
>  error:
> +	pm_runtime_put(&dev->dev);
>  	device_unlock(&dev->dev);
>  	return rc;
>  }
> @@ -161,6 +175,9 @@ int nfc_dev_down(struct nfc_dev *dev)
>  		dev->ops->dev_down(dev);
>  =

>  	dev->dev_up =3D false;
> +	pm_runtime_put(&dev->dev);
> +	device_unlock(&dev->dev);
> +	return rc;

return 0

>  =

>  error:
>  	device_unlock(&dev->dev);
> =



Best regards,
Krzysztof
--===============8881762480410056866==--

