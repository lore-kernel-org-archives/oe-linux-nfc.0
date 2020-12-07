Content-Type: multipart/mixed; boundary="===============4778297724591896291=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next] nfc: s3fwrn5: Change irqflags
Date: Mon, 07 Dec 2020 22:39:01 +0900
Message-ID: <CACwDmQDHXwqzmUE_jEmPcJnCcPrzn=7qT=4rp1MF3s30OM7uTQ@mail.gmail.com>
In-Reply-To: <20201207115147.GA26206@kozik-lap>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4778297724591896291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 7, 2020 at 8:51 PM Krzysztof Kozlowski <krzk@kernel.org> wrot=
e:
>
> On Mon, Dec 07, 2020 at 08:38:27PM +0900, Bongsu Jeon wrote:
> > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
> > change irqflags from IRQF_TRIGGER_HIGH to IRQF_TRIGGER_RISING for stable
> > Samsung's nfc interrupt handling.
>
> 1. Describe in commit title/subject the change. Just a word "change irqfl=
ags" is
>    not enough.
>
Ok. I'll update it.

> 2. Describe in commit message what you are trying to fix. Before was not
>    stable? The "for stable interrupt handling" is a little bit vauge.
>
Usually, Samsung's NFC Firmware sends an i2c frame as below.

1. NFC Firmware sets the gpio(interrupt pin) high when there is an i2c
frame to send.
2. If the CPU's I2C master has received the i2c frame, NFC F/W sets
the gpio low.

NFC driver's i2c interrupt handler would be called in the abnormal case
as the NFC F/W task of number 2 is delayed because of other high
priority tasks.
In that case, NFC driver will try to receive the i2c frame but there
isn't any i2c frame
to send in NFC. It would cause an I2C communication problem.
This case would hardly happen.
But, I changed the interrupt as a defense code.
If Driver uses the TRIGGER_RISING not LEVEL trigger, there would be no prob=
lem
even if the NFC F/W task is delayed.

> 3. This is contradictory to the bindings and current DTS. I think the
>    driver should not force the specific trigger type because I could
>    imagine some configuration that the actual interrupt to the CPU is
>    routed differently.
>
>    Instead, how about removing the trigger flags here and fixing the DTS
>    and bindings example?
>

As I mentioned before,
I changed this code because of Samsung NFC's I2C Communication way.
So, I think that it is okay for the nfc driver to force the specific
trigger type( EDGE_RISING).

What do you think about it?

> Best regards,
> Krzysztof
>
> >
> > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> > ---
> >  drivers/nfc/s3fwrn5/i2c.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
> > index e1bdde105f24..016f6b6df849 100644
> > --- a/drivers/nfc/s3fwrn5/i2c.c
> > +++ b/drivers/nfc/s3fwrn5/i2c.c
> > @@ -213,7 +213,7 @@ static int s3fwrn5_i2c_probe(struct i2c_client *cli=
ent,
> >               return ret;
> >
> >       ret =3D devm_request_threaded_irq(&client->dev, phy->i2c_dev->irq=
, NULL,
> > -             s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_HIGH | IRQF_ONESH=
OT,
> > +             s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_RISING | IRQF_ONE=
SHOT,
> >               S3FWRN5_I2C_DRIVER_NAME, phy);
> >       if (ret)
> >               s3fwrn5_remove(phy->common.ndev);
> > --
> > 2.17.1
> >
--===============4778297724591896291==--

