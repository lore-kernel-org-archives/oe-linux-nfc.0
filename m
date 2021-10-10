Content-Type: multipart/mixed; boundary="===============1954662631803314187=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 1/7] dt-bindings: nfc: nxp, nci: convert to dtschema
Date: Sun, 10 Oct 2021 22:52:56 +0200
Message-ID: <0e26d0e6-9468-63b5-a357-af4c4e7ec677@canonical.com>
In-Reply-To: <1633894316.441793.3158669.nullmailer@robh.at.kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1954662631803314187==
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

> nfc(a)28: compatible:0: 'nxp,nxp-nci-i2c' was expected
> 	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
> =

> nfc(a)28: compatible: Additional items are not allowed ('nxp,nxp-nci-i2c'=
 was unexpected)
> 	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
> =

> nfc(a)28: compatible: ['nxp,pn547', 'nxp,nxp-nci-i2c'] is too long
> 	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
> =

> nfc(a)30: 'clock-frequency' is a required property
> 	arch/arm/boot/dts/ste-ux500-samsung-janice.dt.yaml
> =

> nfc(a)30: compatible:0: 'nxp,nxp-nci-i2c' was expected
> 	arch/arm/boot/dts/ste-ux500-samsung-janice.dt.yaml
> =

> nfc(a)30: compatible: Additional items are not allowed ('nxp,nxp-nci-i2c'=
 was unexpected)
> 	arch/arm/boot/dts/ste-ux500-samsung-janice.dt.yaml
> =

> nfc(a)30: compatible: ['nxp,pn547', 'nxp,nxp-nci-i2c'] is too long
> 	arch/arm/boot/dts/ste-ux500-samsung-janice.dt.yaml
> =


I missed that new compatible. I'll send a patch adding nxp,nxp-nci-i2c
and try to fix the DTS (missing clock-frequency).

Best regards,
Krzysztof
--===============1954662631803314187==--

