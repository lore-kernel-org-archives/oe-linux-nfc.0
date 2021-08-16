Content-Type: multipart/mixed; boundary="===============4457833854760562862=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next 1/3] nfc: Change the virtual NCI device driver to use Wait Queue
Date: Mon, 16 Aug 2021 10:39:53 +0200
Message-ID: <47a9321b-c79e-a06e-6575-9321a758dc36@canonical.com>
In-Reply-To: <20210816040600.175813-2-bongsu.jeon2@gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4457833854760562862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 16/08/2021 06:05, bongsu.jeon2(a)gmail.com wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> =

> In previous version, the user level virtual device application that used
> this driver should have the polling scheme to read a NCI frame.
> To remove this polling scheme, changed the driver code to use Wait Queue.
> =


Subject - please prefix it with:
"nfc: virtual_ncidev: "

Also make it simpler (skipping unnecessary words like "change", "device
driver"), so:
"nfc: virtual_ncidev: use wait queue instead of polling"

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/virtual_ncidev.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/nfc/virtual_ncidev.c b/drivers/nfc/virtual_ncidev.c
> index 2ee0ec4bb739..1953904176a2 100644
> --- a/drivers/nfc/virtual_ncidev.c
> +++ b/drivers/nfc/virtual_ncidev.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/miscdevice.h>
>  #include <linux/mutex.h>
> +#include <linux/wait.h>
>  #include <net/nfc/nci_core.h>
>  =

>  enum virtual_ncidev_mode {
> @@ -27,6 +28,7 @@ enum virtual_ncidev_mode {
>  				 NFC_PROTO_ISO15693_MASK)
>  =

>  static enum virtual_ncidev_mode state;
> +static DECLARE_WAIT_QUEUE_HEAD(wq);
>  static struct miscdevice miscdev;
>  static struct sk_buff *send_buff;
>  static struct nci_dev *ndev;
> @@ -61,6 +63,7 @@ static int virtual_nci_send(struct nci_dev *ndev, struc=
t sk_buff *skb)
>  	}
>  	send_buff =3D skb_copy(skb, GFP_KERNEL);
>  	mutex_unlock(&nci_mutex);
> +	wake_up_interruptible(&wq);
>  =

>  	return 0;
>  }
> @@ -76,12 +79,11 @@ static ssize_t virtual_ncidev_read(struct file *file,=
 char __user *buf,
>  {
>  	size_t actual_len;
>  =

> -	mutex_lock(&nci_mutex);
> -	if (!send_buff) {
> -		mutex_unlock(&nci_mutex);
> +	wait_event_interruptible(wq, send_buff);
> +	if (!send_buff)

I think access to send_buff should still be protected by mutex. What
happens if you have to readers?

>  		return 0;
> -	}
>  =

> +	mutex_lock(&nci_mutex);
>  	actual_len =3D min_t(size_t, count, send_buff->len);
>  =

>  	if (copy_to_user(buf, send_buff->data, actual_len)) {
> =



Best regards,
Krzysztof
--===============4457833854760562862==--

