Content-Type: multipart/mixed; boundary="===============4630395067690559573=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] NFC: microread: Pass err variable to async_cb()
Date: Tue, 01 Jun 2021 15:07:46 +0200
Message-ID: <3e2f804b-107a-9f44-2ed2-95e4c2a2e426@canonical.com>
In-Reply-To: <YLYvcbjuPg1JFr7/@fedora>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4630395067690559573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/06/2021 15:00, Nigel Christian wrote:
> In the case MICROREAD_CB_TYPE_READER_ALL clang reports a dead
> code warning. The error code is being directly passed to =

> async_cb(). Fix this by passing the err variable, which is also
> done in another path.
> =

> Addresses-Coverity: ("Unused value") =

> Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> ---
>  drivers/nfc/microread/microread.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/nfc/microread/microread.c b/drivers/nfc/microread/mi=
croread.c
> index 8d3988457c58..130b0f554016 100644
> --- a/drivers/nfc/microread/microread.c
> +++ b/drivers/nfc/microread/microread.c
> @@ -367,7 +367,7 @@ static void microread_im_transceive_cb(void *context,=
 struct sk_buff *skb,
>  				err =3D -EPROTO;

Remove this line instead, please. The err is argument passed by value so
assigning it within a function is ugly.

>  				kfree_skb(skb);
>  				info->async_cb(info->async_cb_context, NULL,
> -					       -EPROTO);
> +					       err);
>  				return;
>  			}
>  =

> =



Best regards,
Krzysztof
--===============4630395067690559573==--

