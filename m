Content-Type: multipart/mixed; boundary="===============2613128923279269087=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
Date: Tue, 24 Nov 2020 20:39:40 +0900
Message-ID: <CACwDmQBh77pqivk=bBv3SJ14HLucY42jZyEaKAX+n=yS3TSqFw@mail.gmail.com>
In-Reply-To: <20201123080123.GA5656@kozik-lap>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2613128923279269087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2020 at 5:02 PM krzk(a)kernel.org <krzk@kernel.org> wrote:
>
> On Mon, Nov 23, 2020 at 04:55:26PM +0900, Bongsu Jeon wrote:
> > Since S3FWRN82 NFC Chip, The UART interface can be used.
> > S3FWRN82 supports I2C and UART interface.
> >
> > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> > ---
> >  .../bindings/net/nfc/samsung,s3fwrn5.yaml     | 28 +++++++++++++++++--
> >  1 file changed, 26 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.=
yaml b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
> > index cb0b8a560282..37b3e5ae5681 100644
> > --- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
> > +++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
> > @@ -13,6 +13,7 @@ maintainers:
> >  properties:
> >    compatible:
> >      const: samsung,s3fwrn5-i2c
> > +    const: samsung,s3fwrn82-uart
>
> This does not work, you need to use enum. Did you run at least
> dt_bindings_check?
>
Sorry. I didn't. I fixed it as below and ran dt_bindings_check.
    compatible:
       oneOf:
           - enum:
               - samsung,s3fwrn5-i2c
               - samsung,s3fwrn82


> The compatible should be just "samsung,s3fwrn82". I think it was a
> mistake in the first s3fwrn5 submission to add a interface to
> compatible.
>
Ok. I will change the name.

> >
> >    en-gpios:
> >      maxItems: 1
> > @@ -47,10 +48,19 @@ additionalProperties: false
> >  required:
> >    - compatible
> >    - en-gpios
> > -  - interrupts
> > -  - reg
> >    - wake-gpios
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,s3fwrn5-i2c
> > +    then:
> > +      required:
> > +        - interrupts
> > +        - reg
> > +
> >  examples:
> >    - |
> >      #include <dt-bindings/gpio/gpio.h>
> > @@ -71,3 +81,17 @@ examples:
> >              wake-gpios =3D <&gpj0 2 GPIO_ACTIVE_HIGH>;
> >          };
> >      };
> > +  # UART example on Raspberry Pi
> > +  - |
> > +    &uart0 {
> > +        status =3D "okay";
> > +
> > +        s3fwrn82_uart {
>
> Just "bluetooth" to follow Devicetree specification.
Sorry. I don't understand this comment.
Could you explain it?
Does it mean i need to refer to the net/broadcom-bluetooth.txt?

>
> Best regards,
> Krzysztof
--===============2613128923279269087==--

