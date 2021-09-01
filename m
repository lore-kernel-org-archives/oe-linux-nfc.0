Content-Type: multipart/mixed; boundary="===============4609329342267573584=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: set dev->rfkill to NULL in device cleanup routine
Date: Wed, 01 Sep 2021 10:27:20 +0200
Message-ID: <2a052383-6c82-d3a4-fc61-5ecd7b7c49d9@canonical.com>
In-Reply-To: <5b6649e2.af5bf.17ba04c8d62.Coremail.linma@zju.edu.cn>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4609329342267573584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/09/2021 09:39, LinMa wrote:
> In nfc_unregister_device() function, the dev->rfkill is forgotten to set =
to NULL after the rfkill_destroy(). This may lead to possible cocurrency UA=
F in other functions like nfc_dev_up().

Commit msg should be wrapper at 75 char.
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitt=
ing-patches.rst#L124


Use also scripts/get_maintainers.pl to get list of people and lists
you need to CC. You skipped Networking maintainers and two mailing lists.

> =

> The FREE chain is like
> =


Please trim multiple blank lines and organize the commit msg to be readable.
No need to paste existing code into the commit msg.

> =

> void nfc_unregister_device(struct nfc_dev *dev)
> {
>   int rc;
>   pr_debug("dev_name=3D%s\n", dev_name(&dev->dev));
>   if (dev->rfkill) {
>     rfkill_unregister(dev->rfkill);
>     rfkill_destroy(dev->rfkill);
>   // ......
> }
> =

> =

> =

> The USE chain is like
> =

> =

> static int nfc_genl_dev_up(struct sk_buff *skb, struct genl_info *info)
> {
>   struct nfc_dev *dev;
>   int rc;
>   u32 idx;
>   if (!info->attrs[NFC_ATTR_DEVICE_INDEX])
>     return -EINVAL;
>   idx =3D nla_get_u32(info->attrs[NFC_ATTR_DEVICE_INDEX]);
>   dev =3D nfc_get_device(idx);
>   if (!dev)
>     return -ENODEV;
>   rc =3D nfc_dev_up(dev);
> =

>   // ......
> }
> =

> =

> int nfc_dev_up(struct nfc_dev *dev)
> {
>   int rc =3D 0;
>   pr_debug("dev_name=3D%s\n", dev_name(&dev->dev));
>   device_lock(&dev->dev);
>   if (dev->rfkill && rfkill_blocked(dev->rfkill)) { // dev->rfkill is not=
 NULL here
>     rc =3D -ERFKILL;
>     goto error;
>   }
>   // ......
> }
> =

> =

> The FREE chain and USE chain can be like below (as there is no locking pr=
otection).

Something is missing.

> =

> =

> Therefore, the below patch can be added.

Use imperative form:
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitt=
ing-patches.rst#L89

> =

> =

> Signed-off-by: Lin Ma <linma@zju.edu.cn>
> ---
>  net/nfc/core.c | 1 +
>  1 file changed, 1 insertion(+)
> diff --git a/net/nfc/core.c b/net/nfc/core.c
> index 573c80c6ff7a..d0b3224e65d7 100644
> --- a/net/nfc/core.c
> +++ b/net/nfc/core.c
> @@ -1157,6 +1157,7 @@ void nfc_unregister_device(struct nfc_dev *dev)
>   if (dev->rfkill) {
>   rfkill_unregister(dev->rfkill);
>   rfkill_destroy(dev->rfkill);
> + dev->rfkill =3D NULL;

This is not a valid patch. Does not match the code.
For example, use git format-patch and git send-email.

About the topic:
Your code does not prevent a race condition, since you say there is no
locking. Even if you move dev->rfkill=3DNULL before rfkill_unregister(),
still nfc_dev_up() could happen between.

The questions are:
1. Whether nfc_unregister_device() can happen after nfc_get_device()?
2. Whether netlink nfc_genl_dev_up() can happen after nfc_unregister_device=
()
started.



>   }
>   if (dev->ops->check_presence) {
> --
> 2.32.0
> _______________________________________________
> Linux-nfc mailing list -- linux-nfc(a)lists.01.org
> To unsubscribe send an email to linux-nfc-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =



Best regards,
Krzysztof
--===============4609329342267573584==--

