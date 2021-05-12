Content-Type: multipart/mixed; boundary="===============7684874399261414782=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] nxp-nci: add NXP1002 id
Date: Wed, 12 May 2021 09:56:08 -0400
Message-ID: <154ad073-f5c8-0d76-7dcd-220623cca865@canonical.com>
In-Reply-To: <20210512135451.32375-1-oneukum@suse.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7684874399261414782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/05/2021 09:54, Oliver Neukum wrote:
> The driver also works with those new devices.
> =

> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/nfc/nxp-nci/i2c.c | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
> index 7e451c10985d..94f7f6d9cbad 100644
> --- a/drivers/nfc/nxp-nci/i2c.c
> +++ b/drivers/nfc/nxp-nci/i2c.c
> @@ -332,6 +332,7 @@ MODULE_DEVICE_TABLE(of, of_nxp_nci_i2c_match);
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id acpi_id[] =3D {
>  	{ "NXP1001" },
> +	{ "NXP1002" },
>  	{ "NXP7471" },
>  	{ }
>  };
> =


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
--===============7684874399261414782==--

