Content-Type: multipart/mixed; boundary="===============7527547531784967398=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 00/12] nfc: constify, continued (part 2)
Date: Thu, 29 Jul 2021 13:35:44 +0200
Message-ID: <7b0ae615-dcdc-251e-4067-959b31c28159@canonical.com>
In-Reply-To: <162755820704.26856.6157999905884570707.git-patchwork-notify@kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7527547531784967398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 29/07/2021 13:30, patchwork-bot+netdevbpf(a)kernel.org wrote:
> Hello:
> =

> This series was applied to netdev/net-next.git (refs/heads/master):
> =

> On Thu, 29 Jul 2021 12:40:10 +0200 you wrote:
>> Hi,
>>
>> On top of:
>> nfc: constify pointed data
>> https://lore.kernel.org/lkml/20210726145224.146006-1-krzysztof.kozlowski=
(a)canonical.com/
>>
>> Best regards,
>> Krzysztof
>>
>> [...]
> =

> Here is the summary with links:
>   - [01/12] nfc: constify passed nfc_dev
>     https://git.kernel.org/netdev/net-next/c/dd8987a394c0
>   - [02/12] nfc: mei_phy: constify buffer passed to mei_nfc_send()
>     https://git.kernel.org/netdev/net-next/c/894a6e158633
>   - [03/12] nfc: port100: constify several pointers
>     https://git.kernel.org/netdev/net-next/c/9a4af01c35a5
>   - [04/12] nfc: trf7970a: constify several pointers
>     https://git.kernel.org/netdev/net-next/c/ea050c5ee74a
>   - [05/12] nfc: virtual_ncidev: constify pointer to nfc_dev
>     https://git.kernel.org/netdev/net-next/c/83428dbbac51
>   - [06/12] nfc: nfcsim: constify drvdata (struct nfcsim)
>     https://git.kernel.org/netdev/net-next/c/582fdc98adc8
>   - [07/12] nfc: fdp: drop unneeded cast for printing firmware size in de=
v_dbg()
>     https://git.kernel.org/netdev/net-next/c/6c755b1d2511
>   - [08/12] nfc: fdp: use unsigned int as loop iterator
>     https://git.kernel.org/netdev/net-next/c/c3e26b6dc1b4
>   - [09/12] nfc: fdp: constify several pointers
>     https://git.kernel.org/netdev/net-next/c/3d463dd5023b
>   - [10/12] nfc: microread: constify several pointers
>     https://git.kernel.org/netdev/net-next/c/a751449f8b47
>   - [11/12] nfc: mrvl: constify several pointers
>     https://git.kernel.org/netdev/net-next/c/fe53159fe3e0

Oh, folks, too fast :)

Sorry for the mess, but the patch 11/12 has one const which is wrong
(I sent an email for it) and this should be on top of my
previous set:
https://lore.kernel.org/lkml/20210726145224.146006-1-krzysztof.kozlowski(a)=
canonical.com/
which I think you did not take in.

I am not sure if it compiles cleanly without the one above.

Best regards,
Krzysztof
--===============7527547531784967398==--

