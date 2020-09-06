Content-Type: multipart/mixed; boundary="===============5296241818495432814=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 1/4] dt-bindings: net: nfc: s3fwrn5: Convert to dtschema
Date: Sun, 06 Sep 2020 16:38:53 +0200
Message-ID: <CAJKOXPeTRNvnMijzXrpJNHKr_DLCfAWhqHmBvXsKr-Cp3XuzcQ@mail.gmail.com>
In-Reply-To: <20200903163255.GA2903619@bogus>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5296241818495432814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 3 Sep 2020 at 18:33, Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Aug 29, 2020 at 04:29:45PM +0200, Krzysztof Kozlowski wrote:
> > Convert the Samsung S3FWRN5 NCI NFC controller bindings to dtschema.
> > This is conversion only so it includes properties with invalid prefixes
> > (s3fwrn5,en-gpios) which should be addressed later.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  .../devicetree/bindings/net/nfc/s3fwrn5.txt   | 25 --------
> >  .../devicetree/bindings/net/nfc/s3fwrn5.yaml  | 59 +++++++++++++++++++
>
> Please rename to samsung,s3fwrn5-i2c.yaml.
>
> >  MAINTAINERS                                   |  1 +
> >  3 files changed, 60 insertions(+), 25 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/net/nfc/s3fwrn5.t=
xt
> >  create mode 100644 Documentation/devicetree/bindings/net/nfc/s3fwrn5.y=
aml
> >
> > diff --git a/Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt b/Do=
cumentation/devicetree/bindings/net/nfc/s3fwrn5.txt
> > deleted file mode 100644
> > index f02f6fb7f81c..000000000000
> > --- a/Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -* Samsung S3FWRN5 NCI NFC Controller
> > -
> > -Required properties:
> > -- compatible: Should be "samsung,s3fwrn5-i2c".
> > -- reg: address on the bus
> > -- interrupts: GPIO interrupt to which the chip is connected
> > -- s3fwrn5,en-gpios: Output GPIO pin used for enabling/disabling the ch=
ip
> > -- s3fwrn5,fw-gpios: Output GPIO pin used to enter firmware mode and
> > -  sleep/wakeup control
> > -
> > -Example:
> > -
> > -&hsi2c_4 {
> > -     s3fwrn5(a)27 {
> > -             compatible =3D "samsung,s3fwrn5-i2c";
> > -
> > -             reg =3D <0x27>;
> > -
> > -             interrupt-parent =3D <&gpa1>;
> > -             interrupts =3D <3 0 0>;
> > -
> > -             s3fwrn5,en-gpios =3D <&gpf1 4 0>;
> > -             s3fwrn5,fw-gpios =3D <&gpj0 2 0>;
> > -     };
> > -};
> > diff --git a/Documentation/devicetree/bindings/net/nfc/s3fwrn5.yaml b/D=
ocumentation/devicetree/bindings/net/nfc/s3fwrn5.yaml
> > new file mode 100644
> > index 000000000000..c22451dea350
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/nfc/s3fwrn5.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/nfc/s3fwrn5.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung S3FWRN5 NCI NFC Controller
> > +
> > +maintainers:
> > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > +  - Krzysztof Opasiak <k.opasiak@samsung.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: samsung,s3fwrn5-i2c
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  s3fwrn5,en-gpios:
> > +    maxItems: 1
> > +    description:
> > +      Output GPIO pin used for enabling/disabling the chip
> > +
> > +  s3fwrn5,fw-gpios:
> > +    maxItems: 1
> > +    description:
> > +      Output GPIO pin used to enter firmware mode and sleep/wakeup con=
trol
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +  - reg
> > +  - s3fwrn5,en-gpios
> > +  - s3fwrn5,fw-gpios
>
> additionalProperties: false

Sure, I'll fix both issues.

Best regards,
Krzysztof
--===============5296241818495432814==--

