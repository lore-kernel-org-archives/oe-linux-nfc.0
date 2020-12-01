Content-Type: multipart/mixed; boundary="===============4613538724256399796=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v4 net-next 4/4] nfc: s3fwrn5: Support a UART interface
Date: Tue, 01 Dec 2020 22:24:43 +0200
Message-ID: <20201201202443.GD2435@kozik-lap>
In-Reply-To: <1606830628-10236-5-git-send-email-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4613538724256399796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 10:50:28PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> =

> Since S3FWRN82 NFC Chip, The UART interface can be used.
> S3FWRN82 uses NCI protocol and supports I2C and UART interface.
> =

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/Kconfig      |  12 +++
>  drivers/nfc/s3fwrn5/Makefile     |   2 +
>  drivers/nfc/s3fwrn5/phy_common.c |  12 +++
>  drivers/nfc/s3fwrn5/phy_common.h |   1 +
>  drivers/nfc/s3fwrn5/uart.c       | 196 +++++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 223 insertions(+)
>  create mode 100644 drivers/nfc/s3fwrn5/uart.c
> =


Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
--===============4613538724256399796==--

