Content-Type: multipart/mixed; boundary="===============4836153185116417638=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 1/7] dt-bindings: nfc: nxp, nci: convert to dtschema
Date: Sun, 10 Oct 2021 22:58:59 +0200
Message-ID: <f955726a-eb2d-7b3e-9c5f-978358710eb6@canonical.com>
In-Reply-To: <1633894316.441793.3158669.nullmailer@robh.at.kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4836153185116417638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/10/2021 21:31, Rob Herring wrote:
> On Sun, 10 Oct 2021 16:23:11 +0200, Krzysztof Kozlowski wrote:
>> Convert the NXP NCI NFC controller to DT schema format.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../devicetree/bindings/net/nfc/nxp,nci.yaml  | 61 +++++++++++++++++++
>>  .../devicetree/bindings/net/nfc/nxp-nci.txt   | 33 ----------
>>  MAINTAINERS                                   |  1 +
>>  3 files changed, 62 insertions(+), 33 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/net/nfc/nxp,nci.ya=
ml
>>  delete mode 100644 Documentation/devicetree/bindings/net/nfc/nxp-nci.txt
>>
> =

> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> =

> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> =

> Full log is available here: https://patchwork.ozlabs.org/patch/1539010
> =

> =

> nfc(a)28: 'clock-frequency' is a required property
> 	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
> =


Hmm, this actually looks as mistake in bindings. First, clock-frequency
is a property of a I2C bus, not I2C child device. Second, it should not
be a required property anyway, as I2C will choose a default one matching
driver (e.g. standard speed of 100 kHz).

Except the trf7970a NFC driver, none of other NFC drivers parse the
clock-frequency.

Best regards,
Krzysztof
--===============4836153185116417638==--

