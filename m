Content-Type: multipart/mixed; boundary="===============4179585501307047159=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next] nfc: s3fwrn5: Change irqflags
Date: Mon, 07 Dec 2020 12:51:47 +0100
Message-ID: <20201207115147.GA26206@kozik-lap>
In-Reply-To: <20201207113827.2902-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4179585501307047159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 07, 2020 at 08:38:27PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> =

> change irqflags from IRQF_TRIGGER_HIGH to IRQF_TRIGGER_RISING for stable
> Samsung's nfc interrupt handling.

1. Describe in commit title/subject the change. Just a word "change irqflag=
s" is
   not enough.

2. Describe in commit message what you are trying to fix. Before was not
   stable? The "for stable interrupt handling" is a little bit vauge.

3. This is contradictory to the bindings and current DTS. I think the
   driver should not force the specific trigger type because I could
   imagine some configuration that the actual interrupt to the CPU is
   routed differently.

   Instead, how about removing the trigger flags here and fixing the DTS
   and bindings example?

Best regards,
Krzysztof

> =

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
> index e1bdde105f24..016f6b6df849 100644
> --- a/drivers/nfc/s3fwrn5/i2c.c
> +++ b/drivers/nfc/s3fwrn5/i2c.c
> @@ -213,7 +213,7 @@ static int s3fwrn5_i2c_probe(struct i2c_client *clien=
t,
>  		return ret;
>  =

>  	ret =3D devm_request_threaded_irq(&client->dev, phy->i2c_dev->irq, NULL,
> -		s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +		s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>  		S3FWRN5_I2C_DRIVER_NAME, phy);
>  	if (ret)
>  		s3fwrn5_remove(phy->common.ndev);
> -- =

> 2.17.1
>=20
--===============4179585501307047159==--

