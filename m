Content-Type: multipart/mixed; boundary="===============6066601310652507734=="
MIME-Version: 1.0
From: krzk@kernel.org
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next 3/3] nfc: s3fwrn5: Change the error code
Date: Mon, 16 Nov 2020 10:08:45 +0100
Message-ID: <20201116090845.GC5937@kozik-lap>
In-Reply-To: <20201116011950epcms2p68117cc4a7228db2baecb7d4a4840b955@epcms2p6>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6066601310652507734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 10:19:50AM +0900, Bongsu Jeon wrote:
> ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP.
> =

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/s3fwrn5.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> =


Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
--===============6066601310652507734==--

