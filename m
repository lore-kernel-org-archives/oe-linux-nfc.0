Content-Type: multipart/mixed; boundary="===============1070646915926020278=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] nfc: fix typo
Date: Sun, 24 Jan 2021 10:38:42 -0700
Message-ID: <20210124173842.GC31737@animalcreek.com>
In-Reply-To: <20210123052618.2448-1-samirweng1979@163.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1070646915926020278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 23, 2021 at 01:26:18PM +0800, samirweng1979 wrote:
> From: wengjianfeng <wengjianfeng@yulong.com>
> =

> change 'regster' to 'register'
> =

> Signed-off-by: wengjianfeng <wengjianfeng@yulong.com>
> ---
>  drivers/nfc/trf7970a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
> index c70f62fe..3397802 100644
> --- a/drivers/nfc/trf7970a.c
> +++ b/drivers/nfc/trf7970a.c
> @@ -169,7 +169,7 @@
>  =

>  /* Bits determining whether its a direct command or register R/W,
>   * whether to use a continuous SPI transaction or not, and the actual
> - * direct cmd opcode or regster address.
> + * direct cmd opcode or register address.
>   */
>  #define TRF7970A_CMD_BIT_CTRL			BIT(7)
>  #define TRF7970A_CMD_BIT_RW			BIT(6)

Acked-by: Mark Greer <mgreer@animalcreek.com>
--===============1070646915926020278==--

