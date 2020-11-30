Content-Type: multipart/mixed; boundary="===============4516026120784181359=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2 net-next 3/3] nfc: s3fwrn5: extract the common phy blocks
Date: Mon, 30 Nov 2020 09:18:20 +0100
Message-ID: <20201130081820.GA4790@kozik-lap>
In-Reply-To: <CACwDmQC_QrWz=vJN0u0eQAX0fGV__W8cLBF5q7goCxB7Wc2y7A@mail.gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4516026120784181359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 29, 2020 at 06:55:10PM +0900, Bongsu Jeon wrote:
> On Sat, Nov 28, 2020 at 9:49 PM Krzysztof Kozlowski <krzk@kernel.org> w=
rote:
> > This is not a proper wrapping. Wrapping happens on function arguments.
> >
> > > +             if (!gpio_is_valid(phy->common.gpio_en))
> > >                       return -ENODEV;
> > >       }
> > >
> > > -     phy->gpio_fw_wake =3D of_get_named_gpio(np, "wake-gpios", 0);
> > > -     if (!gpio_is_valid(phy->gpio_fw_wake)) {
> > > +     phy->common.gpio_fw_wake =3D of_get_named_gpio(np, "wake-gpios"=
, 0);
> > > +     if (!gpio_is_valid(phy->common.gpio_fw_wake)) {
> > >               /* Support also deprecated property */
> > > -             phy->gpio_fw_wake =3D of_get_named_gpio(np, "s3fwrn5,fw=
-gpios", 0);
> > > -             if (!gpio_is_valid(phy->gpio_fw_wake))
> > > +             phy->common.gpio_fw_wake =3D
> > > +                             of_get_named_gpio(np, "s3fwrn5,fw-gpios=
", 0);
> > > +             if (!gpio_is_valid(phy->common.gpio_fw_wake))
> >
> > The same.
> >
> =

> Even though I wrapped this as below, Second line("s3fwrn5,fw-gpios" )
> was over 80 columns.
> Is it okay as below?
> phy->gpio_fw_wake =3Dof_get_named_gpio(np,
> =

> "s3fwrn5,fw-gpios",
>                                                                      0);

Your email client breaks indentation so I cannot answer. The wrapping - as
explained in CodingStyle - would look like:

		phy->common.gpio_fw_wake =3D of_get_named_gpio(np,
							     "s3fwrn5,fw-gpios",
							     0);

It's not a problem if single argument exceeds 80 character.

> =

> =

> > >                       return -ENODEV;
> > >       }
> > >
> > > @@ -226,8 +184,8 @@ static int s3fwrn5_i2c_probe(struct i2c_client *c=
lient,
> > >       if (!phy)
> > >               return -ENOMEM;
> > >
> > > -     mutex_init(&phy->mutex);
> > > -     phy->mode =3D S3FWRN5_MODE_COLD;
> > > +     mutex_init(&phy->common.mutex);
> > > +     phy->common.mode =3D S3FWRN5_MODE_COLD;
> > >       phy->irq_skip =3D true;
> > >
> > >       phy->i2c_dev =3D client;
> > > @@ -237,17 +195,19 @@ static int s3fwrn5_i2c_probe(struct i2c_client =
*client,
> > >       if (ret < 0)
> > >               return ret;
> > >
> > > -     ret =3D devm_gpio_request_one(&phy->i2c_dev->dev, phy->gpio_en,
> > > -             GPIOF_OUT_INIT_HIGH, "s3fwrn5_en");
> > > +     ret =3D devm_gpio_request_one(&phy->i2c_dev->dev, phy->common.g=
pio_en,
> > > +                                 GPIOF_OUT_INIT_HIGH, "s3fwrn5_en");
> > >       if (ret < 0)
> > >               return ret;
> > >
> > > -     ret =3D devm_gpio_request_one(&phy->i2c_dev->dev, phy->gpio_fw_=
wake,
> > > -             GPIOF_OUT_INIT_LOW, "s3fwrn5_fw_wake");
> > > +     ret =3D devm_gpio_request_one(&phy->i2c_dev->dev,
> > > +                                 phy->common.gpio_fw_wake,
> > > +                                 GPIOF_OUT_INIT_LOW, "s3fwrn5_fw_wak=
e");
> > >       if (ret < 0)
> > >               return ret;
> > >
> > > -     ret =3D s3fwrn5_probe(&phy->ndev, phy, &phy->i2c_dev->dev, &i2c=
_phy_ops);
> > > +     ret =3D s3fwrn5_probe(&phy->common.ndev, phy, &phy->i2c_dev->de=
v,
> > > +                         &i2c_phy_ops);
> > >       if (ret < 0)
> > >               return ret;
> > >
> > > @@ -255,7 +215,7 @@ static int s3fwrn5_i2c_probe(struct i2c_client *c=
lient,
> > >               s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_HIGH | IRQF_ONE=
SHOT,
> > >               S3FWRN5_I2C_DRIVER_NAME, phy);
> > >       if (ret)
> > > -             s3fwrn5_remove(phy->ndev);
> > > +             s3fwrn5_remove(phy->common.ndev);
> > >
> > >       return ret;
> > >  }
> > > @@ -264,7 +224,7 @@ static int s3fwrn5_i2c_remove(struct i2c_client *=
client)
> > >  {
> > >       struct s3fwrn5_i2c_phy *phy =3D i2c_get_clientdata(client);
> > >
> > > -     s3fwrn5_remove(phy->ndev);
> > > +     s3fwrn5_remove(phy->common.ndev);
> > >
> > >       return 0;
> > >  }
> > > diff --git a/drivers/nfc/s3fwrn5/phy_common.c b/drivers/nfc/s3fwrn5/p=
hy_common.c
> > > new file mode 100644
> > > index 0000000..e333764
> > > --- /dev/null
> > > +++ b/drivers/nfc/s3fwrn5/phy_common.c
> > > @@ -0,0 +1,60 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Link Layer for Samsung S3FWRN5 NCI based Driver
> > > + *
> > > + * Copyright (C) 2015 Samsung Electrnoics
> > > + * Robert Baldyga <r.baldyga@samsung.com>
> > > + * Copyright (C) 2020 Samsung Electrnoics
> > > + * Bongsu Jeon <bongsu.jeon@samsung.com>
> > > + */
> > > +
> > > +#include <linux/gpio.h>
> > > +#include <linux/delay.h>
> >
> > You need also mutex.h (it seems original code did not have it but since
> > you move things around it's a new code basically).
> >
> > > +
> > > +#include "s3fwrn5.h"
> > > +#include "phy_common.h"
> > > +
> > > +void s3fwrn5_phy_set_wake(void *phy_id, bool wake)
> > > +{
> > > +     struct phy_common *phy =3D phy_id;
> > > +
> > > +     mutex_lock(&phy->mutex);
> > > +     gpio_set_value(phy->gpio_fw_wake, wake);
> > > +     msleep(S3FWRN5_EN_WAIT_TIME);
> > > +     mutex_unlock(&phy->mutex);
> > > +}
> > > +
> > > +bool s3fwrn5_phy_power_ctrl(struct phy_common *phy, enum s3fwrn5_mod=
e mode)
> > > +{
> > > +     if (phy->mode =3D=3D mode)
> > > +             return false;
> > > +
> > > +     phy->mode =3D mode;
> > > +
> > > +     gpio_set_value(phy->gpio_en, 1);
> > > +     gpio_set_value(phy->gpio_fw_wake, 0);
> > > +     if (mode =3D=3D S3FWRN5_MODE_FW)
> > > +             gpio_set_value(phy->gpio_fw_wake, 1);
> > > +
> > > +     if (mode !=3D S3FWRN5_MODE_COLD) {
> > > +             msleep(S3FWRN5_EN_WAIT_TIME);
> > > +             gpio_set_value(phy->gpio_en, 0);
> > > +             msleep(S3FWRN5_EN_WAIT_TIME);
> > > +     }
> > > +
> > > +     return true;
> > > +}
> > > +
> > > +enum s3fwrn5_mode s3fwrn5_phy_get_mode(void *phy_id)
> > > +{
> > > +     struct phy_common *phy =3D phy_id;
> > > +     enum s3fwrn5_mode mode;
> > > +
> > > +     mutex_lock(&phy->mutex);
> > > +
> > > +     mode =3D phy->mode;
> > > +
> > > +     mutex_unlock(&phy->mutex);
> > > +
> > > +     return mode;
> > > +}
> > > diff --git a/drivers/nfc/s3fwrn5/phy_common.h b/drivers/nfc/s3fwrn5/p=
hy_common.h
> > > new file mode 100644
> > > index 0000000..b920f7f
> > > --- /dev/null
> > > +++ b/drivers/nfc/s3fwrn5/phy_common.h
> > > @@ -0,0 +1,31 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-or-later
> > > + *
> > > + * Link Layer for Samsung S3FWRN5 NCI based Driver
> > > + *
> > > + * Copyright (C) 2015 Samsung Electrnoics
> > > + * Robert Baldyga <r.baldyga@samsung.com>
> > > + * Copyright (C) 2020 Samsung Electrnoics
> > > + * Bongsu Jeon <bongsu.jeon@samsung.com>
> > > + */
> > > +
> > > +#ifndef __NFC_S3FWRN5_PHY_COMMON_H
> > > +#define __NFC_S3FWRN5_PHY_COMMON_H
> > > +
> > > +#define S3FWRN5_EN_WAIT_TIME 20
> > > +
> > > +struct phy_common {
> > > +     struct nci_dev *ndev;
> >
> > You need a header for nci_dev type.
> >
> > > +
> > > +     int gpio_en;
> > > +     int gpio_fw_wake;
> > > +
> > > +     struct mutex mutex;
> >
> > You need a header include for mutex.
> >
> > > +
> > > +     enum s3fwrn5_mode mode;
> >
> > Indeed now it won't work - you use an enum without its declaration. The
> > s3fwrn5_mode enum looks more like a property of the phy and after this
> > patch would be used only once in i2c.c and once in core.c.
> >
> =

> Yes.  phy_common.h doesn't include nci_dev and mutex and s3fwrn5_mode
> declaration.
> So,  i2c.c and phy_common.c include "s3fwrn5.h" first and then "
> ( mutex and nci_dev would be included from nci_core.h and 3fwrn5_mode
> would be included  from s3fwrn5.h).

The header usually should include everything which is used inside, so
mutex.

> =

> > How is it going to be used in your new driver - I cannot check because
> > you did not post it. You should post this refactoring with new users of
> > the API, so we could see bigger picture.
> >
> =

> Okay. Then, I will add the UART driver.
> So, I will resend the patches as below.
> 1. [PATCH net-next 1/4] dt-bindings: net: nfc: s3fwrn5: Support a UART in=
terface
> 2. [PATCH net-next 2/4] nfc: s3fwrn5: reduce the EN_WAIT_TIME (*
> because of Jakub's request )
> 3. [PATCH net-next 3/4] nfc: s3fwrn5: extract the common phy blocks
> 4. [PATCH net-next 4/4] net: nfc: s3fwrn5: Support a UART interface
> =

> > Your original idea - with the s3fwrn5.h include here - looks more
> > logical than moving the enum s3fwrn5_mode here.
> >
> =

> Do you mean that it would be better to include the s3fwrn5.h in phy_commo=
n.h?

Yes.

Best regards,
Krzysztof
--===============4516026120784181359==--

