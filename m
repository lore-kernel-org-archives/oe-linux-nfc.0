Content-Type: multipart/mixed; boundary="===============5079941818499950547=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 04/12] nfc: trf7970a: constify several pointers
Date: Thu, 29 Jul 2021 08:58:02 -0700
Message-ID: <20210729155802.GA242073@animalcreek.com>
In-Reply-To: <20210729104022.47761-5-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5079941818499950547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 29, 2021 at 12:40:14PM +0200, Krzysztof Kozlowski wrote:
> Several functions do not modify pointed data so arguments and local
> variables can be const for correctness and safety.
> =

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/nfc/trf7970a.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

Acked-by: Mark Greer <mgreer@animalcreek.com>
--===============5079941818499950547==--

