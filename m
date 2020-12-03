Content-Type: multipart/mixed; boundary="===============3128490432941030308=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next] nfc: s3fwrn5: skip the NFC bootloader mode
Date: Thu, 03 Dec 2020 18:19:04 +0200
Message-ID: <20201203161904.GA16186@kozik-lap>
In-Reply-To: <20201203153950.13772-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3128490432941030308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 12:39:50AM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> =

> If there isn't proper NFC firmware image,
> Bootloader mode will be skipped.

Wrap your commit msg as described in submitting patches (so at 75
character).

> =

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/core.c     | 44 ++++++++++++++++++++++++----------
>  drivers/nfc/s3fwrn5/firmware.c | 11 +--------
>  drivers/nfc/s3fwrn5/firmware.h |  1 +
>  3 files changed, 33 insertions(+), 23 deletions(-)
> =

> diff --git a/drivers/nfc/s3fwrn5/core.c b/drivers/nfc/s3fwrn5/core.c
> index f8e5d78d9078..df89bc5d7338 100644
> --- a/drivers/nfc/s3fwrn5/core.c
> +++ b/drivers/nfc/s3fwrn5/core.c
> @@ -20,13 +20,26 @@
>  				NFC_PROTO_ISO14443_B_MASK | \
>  				NFC_PROTO_ISO15693_MASK)
>  =

> +static int s3fwrn5_firmware_init(struct s3fwrn5_info *info)
> +{
> +	struct s3fwrn5_fw_info *fw_info =3D &info->fw_info;
> +	int ret;
> +
> +	s3fwrn5_fw_init(fw_info, "sec_s3fwrn5_firmware.bin");
> +
> +	/* Get firmware data */
> +	ret =3D s3fwrn5_fw_request_firmware(fw_info);
> +	if (ret < 0)
> +		dev_err(&fw_info->ndev->nfc_dev->dev,
> +			"Failed to get fw file, ret=3D%02x\n", ret);
> +	return ret;
> +}
> +
>  static int s3fwrn5_firmware_update(struct s3fwrn5_info *info)
>  {
>  	bool need_update;
>  	int ret;
>  =

> -	s3fwrn5_fw_init(&info->fw_info, "sec_s3fwrn5_firmware.bin");
> -
>  	/* Update firmware */
>  =

>  	s3fwrn5_set_wake(info, false);
> @@ -109,21 +122,26 @@ static int s3fwrn5_nci_post_setup(struct nci_dev *n=
dev)
>  	struct s3fwrn5_info *info =3D nci_get_drvdata(ndev);
>  	int ret;
>  =

> -	ret =3D s3fwrn5_firmware_update(info);
> -	if (ret < 0)
> -		goto out;
> +	if (s3fwrn5_firmware_init(info) =3D=3D 0) {

if (s3fwrn5_firmware_init(info)) {
	// skip bootloader mode
	ret =3D 0;
	goto out;
}

so entire next block won't have to be indented.  This follows usual
pattern of error handling.

Best regards,
Krzysztof


> +		ret =3D s3fwrn5_firmware_update(info);
> +		if (ret < 0)
> +			goto out;
>  =

> -	/* NCI core reset */
> -
> -	s3fwrn5_set_mode(info, S3FWRN5_MODE_NCI);
> -	s3fwrn5_set_wake(info, true);
> +		/* NCI core reset */
>  =

> -	ret =3D nci_core_reset(info->ndev);
> -	if (ret < 0)
> -		goto out;
> +		s3fwrn5_set_mode(info, S3FWRN5_MODE_NCI);
> +		s3fwrn5_set_wake(info, true);
>  =

> -	ret =3D nci_core_init(info->ndev);
> +		ret =3D nci_core_reset(info->ndev);
> +		if (ret < 0)
> +			goto out;
>  =

> +		ret =3D nci_core_init(info->ndev);
> +	} else {
> +		dev_info(&info->ndev->nfc_dev->dev,
> +			 "skip bootloader mode\n");
> +		ret =3D 0;
> +	}
>  out:
>  	return ret;
>  }
--===============3128490432941030308==--

