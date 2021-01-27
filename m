Content-Type: multipart/mixed; boundary="===============7100593354650120325=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next v3 1/2] nfc: Add a virtual nci device driver
Date: Wed, 27 Jan 2021 22:03:25 +0900
Message-ID: <CACwDmQDPeEWPrbLh_k3s_tLwBKfmBSB4cvZooonG-qhGGd-50A@mail.gmail.com>
In-Reply-To: <20210126174238.16d9691a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7100593354650120325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2021 at 10:42 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Sat, 23 Jan 2021 18:24:24 +0900 Bongsu Jeon wrote:
> > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
> > NCI virtual device simulates a NCI device to the user. It can be used to
> > validate the NCI module and applications. This driver supports
> > communication between the virtual NCI device and NCI module.
> >
> > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
>
> > +static bool virtual_ncidev_check_enabled(void)
> > +{
> > +     bool ret =3D true;
> > +
> > +     mutex_lock(&nci_mutex);
> > +     if (state !=3D virtual_ncidev_enabled)
> > +             ret =3D false;
> > +     mutex_unlock(&nci_mutex);
> > +
> > +     return ret;
>
>
> This can be simplified like:
>
>         bool ret;
>
>         mutex_lock()
>         ret =3D state =3D=3D virtual_ncidev_enabled;
>         mutex_unlock()
>
>         return ret;
>
>
> > +}
> > +
> > +static int virtual_nci_open(struct nci_dev *ndev)
> > +{
> > +     return 0;
> > +}
> > +
> > +static int virtual_nci_close(struct nci_dev *ndev)
> > +{
> > +     mutex_lock(&nci_mutex);
> > +     if (send_buff)
> > +             kfree_skb(send_buff);
>
> kfree_skb() handles NULL, no need for the if, you can always call
> kfree_skb() here
>

I see, I will remove this.

> > +     send_buff =3D NULL;
> > +     mutex_unlock(&nci_mutex);
> > +
> > +     return 0;
> > +}
> > +
> > +static int virtual_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
> > +{
> > +     if (virtual_ncidev_check_enabled() =3D=3D false)
> > +             return 0;
>
> Shouldn't you check this _under_ the lock below?
>
> Otherwise there is a small window between check and use of send_buff
>

In virtual_ncidev_check_enabled function, mutex is used.
I think that virtual_ncidev_check_enabled function isn't necessary
after refactoring.
So I'll remove it.

> > +     mutex_lock(&nci_mutex);
> > +     if (send_buff) {
> > +             mutex_unlock(&nci_mutex);
> > +             return -1;
> > +     }
> > +     send_buff =3D skb_copy(skb, GFP_KERNEL);
> > +     mutex_unlock(&nci_mutex);
> > +
> > +     return 0;
> > +}
> > +
> > +static struct nci_ops virtual_nci_ops =3D {
> > +     .open =3D virtual_nci_open,
> > +     .close =3D virtual_nci_close,
> > +     .send =3D virtual_nci_send
> > +};
> > +
> > +static ssize_t virtual_ncidev_read(struct file *file, char __user *buf,
> > +                                size_t count, loff_t *ppos)
> > +{
> > +     size_t actual_len;
> > +
> > +     mutex_lock(&nci_mutex);
> > +     if (!send_buff) {
> > +             mutex_unlock(&nci_mutex);
> > +             return 0;
> > +     }
> > +
> > +     actual_len =3D min_t(size_t, count, send_buff->len);
> > +
> > +     if (copy_to_user(buf, send_buff->data, actual_len)) {
> > +             mutex_unlock(&nci_mutex);
> > +             return -EFAULT;
> > +     }
> > +
> > +     skb_pull(send_buff, actual_len);
> > +     if (send_buff->len =3D=3D 0) {
> > +             consume_skb(send_buff);
> > +             send_buff =3D NULL;
> > +     }
> > +     mutex_unlock(&nci_mutex);
> > +
> > +     return actual_len;
> > +}
> > +
> > +static ssize_t virtual_ncidev_write(struct file *file,
> > +                                 const char __user *buf,
> > +                                 size_t count, loff_t *ppos)
> > +{
> > +     struct sk_buff *skb;
> > +
> > +     skb =3D alloc_skb(count, GFP_KERNEL);
> > +     if (!skb)
> > +             return -ENOMEM;
> > +
> > +     if (copy_from_user(skb_put(skb, count), buf, count)) {
> > +             kfree_skb(skb);
> > +             return -EFAULT;
> > +     }
> > +
> > +     nci_recv_frame(ndev, skb);
> > +     return count;
> > +}
> > +
> > +static int virtual_ncidev_open(struct inode *inode, struct file *file)
> > +{
> > +     int ret =3D 0;
> > +
> > +     mutex_lock(&nci_mutex);
> > +     if (state !=3D virtual_ncidev_disabled) {
> > +             mutex_unlock(&nci_mutex);
> > +             return -EBUSY;
> > +     }
> > +
> > +     ndev =3D nci_allocate_device(&virtual_nci_ops, VIRTUAL_NFC_PROTOC=
OLS,
> > +                                0, 0);
> > +     if (!ndev) {
> > +             mutex_unlock(&nci_mutex);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     ret =3D nci_register_device(ndev);
> > +     if (ret < 0) {
> > +             nci_free_device(ndev);
> > +             mutex_unlock(&nci_mutex);
> > +             return ret;
> > +     }
> > +     state =3D virtual_ncidev_enabled;
> > +     mutex_unlock(&nci_mutex);
> > +
> > +     return 0;
> > +}
> > +
> > +static int virtual_ncidev_close(struct inode *inode, struct file *file)
> > +{
> > +     mutex_lock(&nci_mutex);
> > +
> > +     if (state =3D=3D virtual_ncidev_enabled) {
> > +             state =3D virtual_ncidev_disabling;
> > +             mutex_unlock(&nci_mutex);
> > +
> > +             nci_unregister_device(ndev);
> > +             nci_free_device(ndev);
> > +
> > +             mutex_lock(&nci_mutex);
> > +     }
> > +
> > +     state =3D virtual_ncidev_disabled;
> > +     mutex_unlock(&nci_mutex);
> > +
> > +     return 0;
> > +}
> > +
> > +static long virtual_ncidev_ioctl(struct file *flip, unsigned int cmd,
> > +                              unsigned long arg)
> > +{
> > +     if (cmd =3D=3D IOCTL_GET_NCIDEV_IDX) {
> > +             struct nfc_dev *nfc_dev =3D ndev->nfc_dev;
> > +             void __user *p =3D (void __user *)arg;
> > +
> > +             if (copy_to_user(p, &nfc_dev->idx, sizeof(nfc_dev->idx)))
> > +                     return -EFAULT;
> > +     } else {
> > +             return -ENOTTY;
> > +     }
> > +
> > +     return 0;
>
> Please flip the condition and return early. I think I suggested this
> already:

Sorry, I didn't misunderstand it.
I will change it.

>
> {
>         struct nfc_dev *nfc_dev =3D ndev->nfc_dev;
>         void __user *p =3D (void __user *)arg;
>
>         if (cmd !=3D IOCTL_GET_NCIDEV_IDX)
>                 return -ENOTTY;
>
>         if (copy_to_user(p, &nfc_dev->idx, sizeof(nfc_dev->idx)))
>                 return -EFAULT;
>
>         return 0;

Thank you for your review.
--===============7100593354650120325==--

