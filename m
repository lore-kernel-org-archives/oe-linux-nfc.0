Content-Type: multipart/mixed; boundary="===============1241317848443412686=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 6/7] dt-bindings: nfc: ti, trf7970a: convert to dtschema
Date: Sun, 10 Oct 2021 22:51:28 +0200
Message-ID: <a16d9765-a5d1-c8bc-729d-1c807b24e393@canonical.com>
In-Reply-To: <1633894316.452946.3158671.nullmailer@robh.at.kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1241317848443412686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/10/2021 21:31, Rob Herring wrote:
> On Sun, 10 Oct 2021 16:23:16 +0200, Krzysztof Kozlowski wrote:
>> Convert the TI TRF7970A NFC to DT schema format.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../bindings/net/nfc/ti,trf7970a.yaml         | 98 +++++++++++++++++++
>>  .../devicetree/bindings/net/nfc/trf7970a.txt  | 43 --------
>>  MAINTAINERS                                   |  2 +-
>>  3 files changed, 99 insertions(+), 44 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/net/nfc/ti,trf7970=
a.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/net/nfc/trf7970a.t=
xt
>>
> =

> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> =

> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> =

> Full log is available here: https://patchwork.ozlabs.org/patch/1539014
> =

> =

> nfc(a)0: 't5t-rmb-extra-byte-quirk', 'vin-voltage-override' do not match =
any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/imx6dl-prtrvt.dt.yaml

I already sent a patch for this one.


Best regards,
Krzysztof
--===============1241317848443412686==--

