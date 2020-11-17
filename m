Content-Type: multipart/mixed; boundary="===============1249677036367103170=="
MIME-Version: 1.0
From: krzk@kernel.org
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next v2 3/3] nfc: s3fwrn5: Change the error code
Date: Tue, 17 Nov 2020 08:42:59 +0100
Message-ID: <20201117074259.GE3436@kozik-lap>
In-Reply-To: <20201117011850epcms2p568af074144630cd0f02b3a7f7eff8d1a@epcms2p5>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1249677036367103170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 10:18:50AM +0900, Bongsu Jeon wrote:
> ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP.
> =

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/s3fwrn5.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

I already reviewed it.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
--===============1249677036367103170==--

