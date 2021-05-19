Content-Type: multipart/mixed; boundary="===============7317752496046174054=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2 1/2] dt-bindings: net: nfc: s3fwrn5: Add optional clock
Date: Wed, 19 May 2021 11:59:06 -0400
Message-ID: <c1f02515-a86a-7293-b884-52c388ea70e3@canonical.com>
In-Reply-To: <20210519091613.7343-1-stephan@gerhold.net>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7317752496046174054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 19/05/2021 05:16, Stephan Gerhold wrote:
> On some systems, S3FWRN5 depends on having an external clock enabled
> to function correctly. Allow declaring that clock in the device tree.
> =

> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> Changes in v2: Minor change in commit message only
> v1: https://lore.kernel.org/netdev/20210518133935.571298-1-stephan(a)gerh=
old.net/
> ---
>  .../devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
> =



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
--===============7317752496046174054==--

