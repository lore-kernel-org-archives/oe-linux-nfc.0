Content-Type: multipart/mixed; boundary="===============0437469684999383054=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2 2/2] nfc: s3fwrn5: i2c: Enable optional clock from device tree
Date: Wed, 19 May 2021 12:13:05 -0400
Message-ID: <86461091-617b-62ec-a9e5-2aec337d69ce@canonical.com>
In-Reply-To: <20210519091613.7343-2-stephan@gerhold.net>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0437469684999383054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 19/05/2021 05:16, Stephan Gerhold wrote:
> S3FWRN5 depends on a clock input ("XI" pin) to function properly.
> Depending on the hardware configuration this could be an always-on
> oscillator or some external clock that must be explicitly enabled.
> =

> So far we assumed that the clock is always-on.
> Make the driver request an (optional) clock from the device tree
> and make sure the clock is running before starting S3FWRN5.
> =

> Note: S3FWRN5 asserts "GPIO2" whenever it needs the clock input to
> function correctly. On some hardware configurations, GPIO2 is
> connected directly to an input pin of the external clock provider
> (e.g. the main PMIC of the SoC). In that case, it can automatically
> AND the clock enable bit and clock request from S3FWRN5 so that
> the clock is actually only enabled when needed.
> =

> It is also conceivable that on some other hardware configuration
> S3FWRN5's GPIO2 might be connected as a regular GPIO input
> of the SoC. In that case, follow-up patches could extend the
> driver to request the GPIO, set up an interrupt and only enable
> the clock when requested by S3FWRN5.
> =

> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> This allows NFC to work properly on the Samsung Galaxy A3/A5 (2015).
> =

> Changes in v2: Rewrite commit message and comment based on discussion
> =

>   Note: I tried to explain the setup a bit better but dropped most of
>         the explanations about the exact configuration on the Samsung
>         Galaxy A5. I think the HW-specific details were more confusing
>         than helping. :)
> =

> v1: https://lore.kernel.org/netdev/20210518133935.571298-2-stephan(a)gerh=
old.net/
> ---
>  drivers/nfc/s3fwrn5/i2c.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> =


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
--===============0437469684999383054==--

