Content-Type: multipart/mixed; boundary="===============3361723366683550172=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next 2/3] nfc: s3fwrn5: reduce the EN_WAIT_TIME
Date: Thu, 26 Nov 2020 18:03:30 +0100
Message-ID: <20201126170330.GB4978@kozik-lap>
In-Reply-To: <1606404819-30647-2-git-send-email-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3361723366683550172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 12:33:38AM +0900, bongsu.jeon2(a)gmail.com wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> =

> The delay of 20ms is enough to enable and
> wake up the Samsung's nfc chip.
> =

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/i2c.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
> index ae26594..9a64eea 100644
> --- a/drivers/nfc/s3fwrn5/i2c.c
> +++ b/drivers/nfc/s3fwrn5/i2c.c
> @@ -19,7 +19,7 @@
>  =


Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
--===============3361723366683550172==--

