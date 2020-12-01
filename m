Content-Type: multipart/mixed; boundary="===============3472894547515874666=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v4 net-next 1/4] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
Date: Tue, 01 Dec 2020 22:07:25 +0200
Message-ID: <20201201200725.GB2435@kozik-lap>
In-Reply-To: <1606830628-10236-2-git-send-email-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3472894547515874666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 10:50:25PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> =

> Since S3FWRN82 NFC Chip, The UART interface can be used.
> S3FWRN82 supports I2C and UART interface.
> =

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  .../bindings/net/nfc/samsung,s3fwrn5.yaml          | 32 ++++++++++++++++=
++++--
>  1 file changed, 29 insertions(+), 3 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.ya=
ml b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
> index cb0b8a5..cc5f9a1 100644
> --- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
> +++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
> @@ -12,7 +12,10 @@ maintainers:
>  =

>  properties:
>    compatible:
> -    const: samsung,s3fwrn5-i2c
> +    items:

This still has items but it should be a simple enum.

> +      - enum:
> +          - samsung,s3fwrn5-i2c
> +          - samsung,s3fwrn82
>  =

>    en-gpios:
>      maxItems: 1
> @@ -47,10 +50,19 @@ additionalProperties: false
>  required:
>    - compatible
>    - en-gpios
> -  - interrupts
> -  - reg
>    - wake-gpios
>  =

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,s3fwrn5-i2c
> +    then:
> +      required:
> +        - interrupts
> +        - reg
> +
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> @@ -71,3 +83,17 @@ examples:
>              wake-gpios =3D <&gpj0 2 GPIO_ACTIVE_HIGH>;
>          };
>      };
> +  # UART example on Raspberry Pi
> +  - |
> +    uart0 {
> +        status =3D "okay";
> +
> +        nfc {
> +            compatible =3D "samsung,s3fwrn82";
> +
> +            en-gpios =3D <&gpio 20 0>;
> +            wake-gpios =3D <&gpio 16 0>;

Use GPIO flags like in example above.

Best regards,
Krzysztof
--===============3472894547515874666==--

