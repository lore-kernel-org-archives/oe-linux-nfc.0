Content-Type: multipart/mixed; boundary="===============2881725536297099814=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 2/2] nfc: s3fwrn5: i2c: Enable optional clock from device tree
Date: Tue, 18 May 2021 10:30:43 -0400
Message-ID: <ac04821e-359d-aaaa-7e07-280156f64036@canonical.com>
In-Reply-To: <20210518133935.571298-2-stephan@gerhold.net>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2881725536297099814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,

Thanks for the patch.

On 18/05/2021 09:39, Stephan Gerhold wrote:
> s3fwrn5 has a NFC_CLK_REQ output GPIO, which is asserted whenever
> the clock is needed for the current operation. This GPIO can be either
> connected directly to the clock provider, or must be monitored by
> this driver.
> =

> As an example for the first case, on many Qualcomm devices the
> NFC clock is provided by the main PMIC. The clock can be either
> permanently enabled (clocks =3D <&rpmcc RPM_SMD_BB_CLK2>) or enabled
> only when requested through a special input pin on the PMIC
> (clocks =3D <&rpmcc RPM_SMD_BB_CLK2_PIN>).
> =

> On the Samsung Galaxy A3/A5 (2015, Qualcomm MSM8916) this mechanism
> is used with S3FWRN5's NFC_CLK_REQ output GPIO to enable the clock
> only when necessary. However, to make that work the s3fwrn5 driver
> must keep the RPM_SMD_BB_CLK2_PIN clock enabled.

This contradicts the code. You wrote that pin should be kept enabled
(somehow... by driver? by it's firmware?) but your code requests the
clock from provider.

> =

> This commit adds support for this by requesting an optional clock

Don't write "This commit".
https://elixir.bootlin.com/linux/latest/source/Documentation/process/submit=
ting-patches.rst#L89

> and keeping it permanently enabled. Note that the actual (physical)
> clock won't be permanently enabled since this will depend on the
> output of NFC_CLK_REQ from S3FWRN5.

What pin is that "NFC_CLK_REQ"? I cannot find such name. Is it GPIO2?
What clock are you talking here? The one going to the modem part?

I also don't see here how this clock is going to be automatically
on-off... driver does not perform such. Unless you speak about your
particular HW configuration where the GPIO is somehow connected with AND
(but then it is not relevant to the code).

> =

> In the future (when needed by some other device) this could be
> extended to work for the second case (monitoring the NFC_CLK_REQ
> GPIO and enabling the clock from the kernel when needed).
> =

> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/nfc/s3fwrn5/i2c.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> =



Best regards,
Krzysztof
--===============2881725536297099814==--

