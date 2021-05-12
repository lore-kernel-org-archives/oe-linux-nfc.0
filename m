Content-Type: multipart/mixed; boundary="===============4769076483747744444=="
MIME-Version: 1.0
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
Date: Wed, 12 May 2021 17:32:35 +0200
Message-ID: <14e78a9a-ed1a-9d7d-b854-db6d811f4622@kontron.de>
In-Reply-To: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4769076483747744444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12.05.21 16:43, Krzysztof Kozlowski wrote:
> The NFC subsystem is orphaned.  I am happy to spend some cycles to
> review the patches, send pull requests and in general keep the NFC
> subsystem running.

That's great, thanks!

Maybe you also want to have a look at the userspace side and talk to Mark G=
reer (on cc). He recently said, that he is supposed to be taking over maint=
enance for the neard daemon (see this thread: [1]) which currently looks li=
ke it's close to being dead (no release for several years, etc.).

I don't know much about the NFC stack and if/how people use it, but without=
 reliable and maintained userspace tooling, the whole thing seems of little=
 use in the long run. Qt has already dropped their neard support for Qt 6 [=
2], which basically means the mainline NFC stack won't be supported anymore=
 in one of the most common application frameworks for IoT/embedded.

[1] https://lists.01.org/hyperkitty/list/linux-nfc(a)lists.01.org/thread/OH=
D5IQHYPFUPUFYWDMNSVCBNO24M45VK/
[2] https://bugreports.qt.io/browse/QTBUG-81824

> =

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> =

> ---
> =

> I admit I don't have big experience in NFC part but this will be nice
> opportunity to learn something new.  I am already maintainer of few
> other parts: memory controller drivers, Samsung ARM/ARM64 SoC and some
> drviers.  I have a kernel.org account and my GPG key is:
> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
ernel.org%2Fpub%2Fscm%2Fdocs%2Fkernel%2Fpgpkeys.git%2Ftree%2Fkeys%2F1B93437=
D3B41629B.asc&amp;data=3D04%7C01%7Cfrieder.schrempf%40kontron.de%7Cb7a843cd=
d3a9421a4fa908d9155456fe%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C63756=
4274699221204%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DdJy3BljqfnZfwekCSGDdUy2kNc=
r7XxoDUUXJJwydq9c%3D&amp;reserved=3D0
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
>=20
--===============4769076483747744444==--

