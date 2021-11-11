Content-Type: multipart/mixed; boundary="===============0898941731125442157=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [neard][PATCH 1/4] include: include endian.h to fix missing __BYTE_ORDER definition on Debian Stretch
Date: Thu, 11 Nov 2021 11:46:39 +0100
Message-ID: <5026dab0-fc8b-06a1-dcd8-8f2af9cecdc9@canonical.com>
In-Reply-To: <20211107172619.13560-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0898941731125442157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/11/2021 18:26, Krzysztof Kozlowski wrote:
> Code should pull explicitly headers for necessary symbols instead of
> relying on dependencies.  Lack of endian.h caused build failures on
> Debian Stretch:
> =

>     In file included from tools/nfctool/ndef-decode.c:28:0:
>     include/near/types.h:43:5: error: "__BYTE_ORDER" is not defined [-Wer=
ror=3Dundef]
>      #if __BYTE_ORDER =3D=3D __LITTLE_ENDIAN
> =

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  include/types.h | 1 +
>  1 file changed, 1 insertion(+)
> =


Applied.


Best regards,
Krzysztof
--===============0898941731125442157==--

