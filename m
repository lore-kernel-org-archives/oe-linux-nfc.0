Content-Type: multipart/mixed; boundary="===============8244938944627789126=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2 net-next 1/2] nfc: s3fwrn5: Remove the delay for NFC sleep
Date: Tue, 15 Dec 2020 10:12:49 +0100
Message-ID: <20201215091249.GA29321@kozik-lap>
In-Reply-To: <20201215065401.3220-2-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8244938944627789126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 03:54:00PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> =

> Remove the delay for NFC sleep because the delay is only needed to
> guarantee that the NFC is awake.
> =

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/phy_common.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =


Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
--===============8244938944627789126==--

