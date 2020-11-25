Content-Type: multipart/mixed; boundary="===============6113962135811051865=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
Date: Wed, 25 Nov 2020 12:08:38 +0900
Message-ID: <CACwDmQDWtfa8tXkG8W+EQxjdYJ6rkVgN9PjOVQdK8CwUXAURMg@mail.gmail.com>
In-Reply-To: <20201124114151.GA32873@kozik-lap>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6113962135811051865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/24/20, krzk(a)kernel.org <krzk@kernel.org> wrote:
> On Tue, Nov 24, 2020 at 08:39:40PM +0900, Bongsu Jeon wrote:
>> On Mon, Nov 23, 2020 at 5:02 PM krzk(a)kernel.org <krzk@kernel.org> wr=
ote:
>> >
>> > On Mon, Nov 23, 2020 at 04:55:26PM +0900, Bongsu Jeon wrote:
>  > >  examples:
>> > >    - |
>> > >      #include <dt-bindings/gpio/gpio.h>
>> > > @@ -71,3 +81,17 @@ examples:
>> > >              wake-gpios =3D <&gpj0 2 GPIO_ACTIVE_HIGH>;
>> > >          };
>> > >      };
>> > > +  # UART example on Raspberry Pi
>> > > +  - |
>> > > +    &uart0 {
>> > > +        status =3D "okay";
>> > > +
>> > > +        s3fwrn82_uart {
>> >
>> > Just "bluetooth" to follow Devicetree specification.
>> Sorry. I don't understand this comment.
>> Could you explain it?
>> Does it mean i need to refer to the net/broadcom-bluetooth.txt?
>
> The node name should be "bluetooth", not "s3fwrn82_uart", because of
> Devicetree naming convention - node names should represent generic class
> of a device.
>
Actually, RN82 is the nfc device.
So, is it okay to use the name as nfc instead of Bluetooth?

> Best regards,
> Krzysztof
>
>
--===============6113962135811051865==--

