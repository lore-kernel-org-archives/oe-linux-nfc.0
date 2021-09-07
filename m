Content-Type: multipart/mixed; boundary="===============0552067835164519423=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 05/15] nfc: pn533: drop unneeded debug prints
Date: Tue, 07 Sep 2021 18:05:25 +0200
Message-ID: <35626061-ff2e-cb01-21ff-87a6f776dc28@canonical.com>
In-Reply-To: <20210907121816.37750-6-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0552067835164519423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/09/2021 14:18, Krzysztof Kozlowski wrote:
> ftrace is a preferred and standard way to debug entering and exiting
> functions so drop useless debug prints.
> =

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/nfc/pn533/i2c.c   | 1 -
>  drivers/nfc/pn533/pn533.c | 2 --
>  2 files changed, 3 deletions(-)
> =

> diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
> index e6bf8cfe3aa7..91d4a035eb63 100644
> --- a/drivers/nfc/pn533/i2c.c
> +++ b/drivers/nfc/pn533/i2c.c
> @@ -138,7 +138,6 @@ static irqreturn_t pn533_i2c_irq_thread_fn(int irq, v=
oid *data)
>  	}
>  =

>  	client =3D phy->i2c_dev;

This line should also be removed (reported by kbuild robot).

I will send a v2.


Best regards,
Krzysztof
--===============0552067835164519423==--

