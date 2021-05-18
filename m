Content-Type: multipart/mixed; boundary="===============2333319968779259268=="
MIME-Version: 1.0
From: Stephan Gerhold <stephan@gerhold.net>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 2/2] nfc: s3fwrn5: i2c: Enable optional clock from device tree
Date: Tue, 18 May 2021 17:00:17 +0200
Message-ID: <YKPWgSnz7STV4u+c@gerhold.net>
In-Reply-To: <ac04821e-359d-aaaa-7e07-280156f64036@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2333319968779259268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 18, 2021 at 10:30:43AM -0400, Krzysztof Kozlowski wrote:
> On 18/05/2021 09:39, Stephan Gerhold wrote:
> > s3fwrn5 has a NFC_CLK_REQ output GPIO, which is asserted whenever
> > the clock is needed for the current operation. This GPIO can be either
> > connected directly to the clock provider, or must be monitored by
> > this driver.
> > =

> > As an example for the first case, on many Qualcomm devices the
> > NFC clock is provided by the main PMIC. The clock can be either
> > permanently enabled (clocks =3D <&rpmcc RPM_SMD_BB_CLK2>) or enabled
> > only when requested through a special input pin on the PMIC
> > (clocks =3D <&rpmcc RPM_SMD_BB_CLK2_PIN>).
> > =

> > On the Samsung Galaxy A3/A5 (2015, Qualcomm MSM8916) this mechanism
> > is used with S3FWRN5's NFC_CLK_REQ output GPIO to enable the clock
> > only when necessary. However, to make that work the s3fwrn5 driver
> > must keep the RPM_SMD_BB_CLK2_PIN clock enabled.
> =

> This contradicts the code. You wrote that pin should be kept enabled
> (somehow... by driver? by it's firmware?) but your code requests the
> clock from provider.
> =


Yeah, I see how that's a bit confusing. Let me try to explain it a bit
better. So the Samsung Galaxy A5 (2015) has a "S3FWRN5XS1-YF30", some
variant of S3FWRN5 I guess. That S3FWRN5 has a "XI" and "XO" pin in the
schematics. "XO" seems to be floating, but "XI" goes to "BB_CLK2"
on PM8916 (the main PMIC).

Then, there is "GPIO2/NFC_CLK_REQ" on the S3FWRN5. This goes to
GPIO_2_NFC_CLK_REQ on PM8916. (Note: I'm talking about two different
GPIO2 here, one on S3FWRN5 and one on PM8916, they just happen to have
the same number...)

So in other words, S3FWRN5 gets some clock from BB_CLK2 on PM8916,
and can tell PM8916 that it needs the clock via GPIO2/NFC_CLK_REQ.

Now the confusing part is that the rpmcc/clk-smd-rpm driver has two
clocks that represent BB_CLK2 (see include/dt-bindings/clock/qcom,rpmcc.h):

  - RPM_SMD_BB_CLK2
  - RPM_SMD_BB_CLK2_PIN

(There are also *_CLK2_A variants but they are even more confusing
 and not needed here...)

Those end up in different register settings in PM8916. There is one bit
to permanently enable BB_CLK2 (=3D RPM_SMD_BB_CLK2), and one bit to enable
BB_CLK2 based on the status of GPIO_2_NFC_CLK_REQ on PM8916
(=3D RPM_SMD_BB_CLK2_PIN).

So there is indeed some kind of "AND" inside PM8916 (the register bit
and "NFC_CLK_REQ" input pin). To make that "AND" work I need to make
some driver (here: the s3fwrn5 driver) enable the clock so the register
bit in PM8916 gets set.

> > =

> > This commit adds support for this by requesting an optional clock
> =

> Don't write "This commit".
> https://elixir.bootlin.com/linux/latest/source/Documentation/process/subm=
itting-patches.rst#L89
> =


OK, will fix this in v2 (I guess there will be a v2 to clarify things
at least...)

> > and keeping it permanently enabled. Note that the actual (physical)
> > clock won't be permanently enabled since this will depend on the
> > output of NFC_CLK_REQ from S3FWRN5.
> =

> What pin is that "NFC_CLK_REQ"? I cannot find such name. Is it GPIO2?
> What clock are you talking here? The one going to the modem part?
> =


It's indeed GPIO2 on S3FWRN5, but that's pretty much all I can say since
I can't seem to find any datasheet for S3FWRN5. :( I don't know what it
is used for. As I mentioned above, BB_CLK2 goes to "XI" on S3FWRN5.

> I also don't see here how this clock is going to be automatically
> on-off... driver does not perform such. Unless you speak about your
> particular HW configuration where the GPIO is somehow connected with AND
> (but then it is not relevant to the code).
> =


I hope I covered this above already and it's a bit clearer now.
Sorry for the confusion!

Thanks!
Stephan
--===============2333319968779259268==--

