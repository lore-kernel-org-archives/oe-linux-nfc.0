Content-Type: multipart/mixed; boundary="===============5114313436668357725=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] nfc: port100: fix using -ERRNO as command type mask
Date: Mon, 25 Oct 2021 16:48:21 +0200
Message-ID: <42e958ae-7786-4d80-7491-6955e37a4f25@canonical.com>
In-Reply-To: <20211025144751.555551-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5114313436668357725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 25/10/2021 16:47, Krzysztof Kozlowski wrote:
> During probing, the driver tries to get a list (mask) of supported
> command types in port100_get_command_type_mask() function.  The value
> is u64 and 0 is treated as invalid mask (no commands supported).  The
> function however returns also -ERRNO as u64 which will be interpret as
> valid command mask.
> =

> Return 0 on every error case of port100_get_command_type_mask(), so the
> probing will stop.
> =

> Cc: <stable@vger.kernel.org>
> Fixes: 0347a6ab300a ("NFC: port100: Commands mechanism implementation")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/nfc/port100.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
> index 1296148b4566..ec1630bfedf4 100644
> --- a/drivers/nfc/port100.c
> +++ b/drivers/nfc/port100.c
> @@ -1109,15 +1109,11 @@ static u64 port100_get_command_type_mask(struct p=
ort100 *dev)
>  =

>  	skb =3D port100_alloc_skb(dev, 0);
>  	if (!skb)
> -		return -ENOMEM;
> +		return 0;
>  =

> -	nfc_err(&dev->interface->dev, "%s:%d\n", __func__, __LINE__);

Mistake, please ignore.

Best regards,
Krzysztof
--===============5114313436668357725==--

