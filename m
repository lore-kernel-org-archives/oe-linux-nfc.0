Content-Type: multipart/mixed; boundary="===============3875777160583138749=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] NFC: nci: Remove redundant assignment to len
Date: Tue, 01 Jun 2021 12:11:18 +0200
Message-ID: <bbe532a0-95d4-bdc8-2caf-dba8ecf4ecda@canonical.com>
In-Reply-To: <1622540990-102660-1-git-send-email-yang.lee@linux.alibaba.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3875777160583138749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/06/2021 11:49, Yang Li wrote:
> Variable 'len' is set to conn_info->max_pkt_payload_len but this
> value is never read as it is overwritten with a new value later on,
> hence it is a redundant assignment and can be removed.
> =

> Clean up the following clang-analyzer warning:
> =

> net/nfc/nci/hci.c:164:3: warning: Value stored to 'len' is never read
> [clang-analyzer-deadcode.DeadStores]
> =

> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  net/nfc/nci/hci.c | 2 --
>  1 file changed, 2 deletions(-)
> =

> diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
> index 9686514..d6732e5 100644
> --- a/net/nfc/nci/hci.c
> +++ b/net/nfc/nci/hci.c
> @@ -161,8 +161,6 @@ static int nci_hci_send_data(struct nci_dev *ndev, u8=
 pipe,
>  	*(u8 *)skb_push(skb, 1) =3D data_type;
>  =

>  	do {
> -		len =3D conn_info->max_pkt_payload_len;
> -
>  		/* If last packet add NCI_HFP_NO_CHAINING */
>  		if (i + conn_info->max_pkt_payload_len -
>  		    (skb->len + 1) >=3D data_len) {
> =


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
--===============3875777160583138749==--

