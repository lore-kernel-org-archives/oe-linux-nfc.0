Content-Type: multipart/mixed; boundary="===============6647724815627774512=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next] nfc: s3fwrn5: Change irqflags
Date: Mon, 07 Dec 2020 15:13:11 +0100
Message-ID: <20201207141311.GB34599@kozik-lap>
In-Reply-To: <CACwDmQDHXwqzmUE_jEmPcJnCcPrzn=7qT=4rp1MF3s30OM7uTQ@mail.gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6647724815627774512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 07, 2020 at 10:39:01PM +0900, Bongsu Jeon wrote:
> On Mon, Dec 7, 2020 at 8:51 PM Krzysztof Kozlowski <krzk@kernel.org> wr=
ote:
> >
> > On Mon, Dec 07, 2020 at 08:38:27PM +0900, Bongsu Jeon wrote:
> > > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> > >
> > > change irqflags from IRQF_TRIGGER_HIGH to IRQF_TRIGGER_RISING for sta=
ble
> > > Samsung's nfc interrupt handling.
> >
> > 1. Describe in commit title/subject the change. Just a word "change irq=
flags" is
> >    not enough.
> >
> Ok. I'll update it.
> =

> > 2. Describe in commit message what you are trying to fix. Before was not
> >    stable? The "for stable interrupt handling" is a little bit vauge.
> >
> Usually, Samsung's NFC Firmware sends an i2c frame as below.
> =

> 1. NFC Firmware sets the gpio(interrupt pin) high when there is an i2c
> frame to send.
> 2. If the CPU's I2C master has received the i2c frame, NFC F/W sets
> the gpio low.
> =

> NFC driver's i2c interrupt handler would be called in the abnormal case
> as the NFC F/W task of number 2 is delayed because of other high
> priority tasks.
> In that case, NFC driver will try to receive the i2c frame but there
> isn't any i2c frame
> to send in NFC. It would cause an I2C communication problem.
> This case would hardly happen.
> But, I changed the interrupt as a defense code.
> If Driver uses the TRIGGER_RISING not LEVEL trigger, there would be no pr=
oblem
> even if the NFC F/W task is delayed.

All this should be explained in commit message, not in the email.

> =

> > 3. This is contradictory to the bindings and current DTS. I think the
> >    driver should not force the specific trigger type because I could
> >    imagine some configuration that the actual interrupt to the CPU is
> >    routed differently.
> >
> >    Instead, how about removing the trigger flags here and fixing the DTS
> >    and bindings example?
> >
> =

> As I mentioned before,
> I changed this code because of Samsung NFC's I2C Communication way.
> So, I think that it is okay for the nfc driver to force the specific
> trigger type( EDGE_RISING).
> =

> What do you think about it?

Some different chip or some different hardware implementation could have
the signal inverted, e.g. edge falling, not rising. This is rather
a theoretical scenario but still such change makes the code more
generic, configurable with DTS. Therefore trigger mode should be
configured via DTS, not enforced by the driver.

Best regards,
Krzysztof
--===============6647724815627774512==--

