Content-Type: multipart/mixed; boundary="===============1870264103010237015=="
MIME-Version: 1.0
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
Date: Wed, 12 May 2021 17:11:07 +0200
Message-ID: <961dc9c5-0eb0-586c-5e70-b21ca2f8e6f3@linaro.org>
In-Reply-To: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1870264103010237015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/05/2021 16:43, Krzysztof Kozlowski wrote:
> The NFC subsystem is orphaned.  I am happy to spend some cycles to
> review the patches, send pull requests and in general keep the NFC
> subsystem running.
> =

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> =

> ---
> =

> I admit I don't have big experience in NFC part but this will be nice
> opportunity to learn something new. =


NFC has been lost in the limbos since a while. Good to see someone
volunteering to take care of it.

May I suggest to create a simple nfc reading program in the 'tools'
directory (could be a training exercise ;)


> I am already maintainer of few
> other parts: memory controller drivers, Samsung ARM/ARM64 SoC and some
> drviers.  I have a kernel.org account and my GPG key is:
> https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/tree/keys/1B93437D=
3B41629B.asc
> =

> Best regards,
> Krzysztof
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =

> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc81667e8bab..adc6cbe29f78 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12899,8 +12899,9 @@ F:	include/uapi/linux/nexthop.h
>  F:	net/ipv4/nexthop.c
>  =

>  NFC SUBSYSTEM
> +M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>  L:	netdev(a)vger.kernel.org
> -S:	Orphan
> +S:	Maintained
>  F:	Documentation/devicetree/bindings/net/nfc/
>  F:	drivers/nfc/
>  F:	include/linux/platform_data/nfcmrvl.h




-- =

<http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM =
SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
--===============1870264103010237015==--

