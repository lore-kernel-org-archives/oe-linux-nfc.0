Content-Type: multipart/mixed; boundary="===============1507153669127065681=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
Date: Wed, 25 Nov 2020 08:37:19 +0100
Message-ID: <CAJKOXPc1sBvuZACRM_4fjiSJECg7eRqWB+c2aQPDE1iPWHbdmA@mail.gmail.com>
In-Reply-To: <CACwDmQDWtfa8tXkG8W+EQxjdYJ6rkVgN9PjOVQdK8CwUXAURMg@mail.gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1507153669127065681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Nov 2020 at 04:08, Bongsu Jeon <bongsu.jeon2@gmail.com> wrote:
>
> On 11/24/20, krzk(a)kernel.org <krzk@kernel.org> wrote:
> > On Tue, Nov 24, 2020 at 08:39:40PM +0900, Bongsu Jeon wrote:
> >> On Mon, Nov 23, 2020 at 5:02 PM krzk(a)kernel.org <krzk@kernel.org> =
wrote:
> >> >
> >> > On Mon, Nov 23, 2020 at 04:55:26PM +0900, Bongsu Jeon wrote:
> >  > >  examples:
> >> > >    - |
> >> > >      #include <dt-bindings/gpio/gpio.h>
> >> > > @@ -71,3 +81,17 @@ examples:
> >> > >              wake-gpios =3D <&gpj0 2 GPIO_ACTIVE_HIGH>;
> >> > >          };
> >> > >      };
> >> > > +  # UART example on Raspberry Pi
> >> > > +  - |
> >> > > +    &uart0 {
> >> > > +        status =3D "okay";
> >> > > +
> >> > > +        s3fwrn82_uart {
> >> >
> >> > Just "bluetooth" to follow Devicetree specification.
> >> Sorry. I don't understand this comment.
> >> Could you explain it?
> >> Does it mean i need to refer to the net/broadcom-bluetooth.txt?
> >
> > The node name should be "bluetooth", not "s3fwrn82_uart", because of
> > Devicetree naming convention - node names should represent generic class
> > of a device.
> >
> Actually, RN82 is the nfc device.
> So, is it okay to use the name as nfc instead of Bluetooth?

Oops, of course, nfc, I don't know why the Bluetooth stuck in my mind.

Best regards,
Krzysztof
--===============1507153669127065681==--

