Content-Type: multipart/mixed; boundary="===============2877333503061293454=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v3 net-next 3/4] nfc: s3fwrn5: extract the common phy blocks
Date: Mon, 30 Nov 2020 20:42:30 +0200
Message-ID: <20201130184230.GC28735@kozik-lap>
In-Reply-To: <1606737829-29586-1-git-send-email-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2877333503061293454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 30, 2020 at 09:03:49PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> =

> Extract the common phy blocks to reuse it.
> The UART module will use the common blocks.
> =

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  Changes in v3:
>    - move the phy_common object to s3fwrn.ko to avoid duplication.
>    - include the header files to include everything which is used inside.
>    - wrap the lines.
> =

>  Changes in v2:
>    - remove the common function's definition in common header file.
>    - make the common phy_common.c file to define the common function.
>    - wrap the lines.
>    - change the Header guard.
>    - remove the unused common function.
> =

>  drivers/nfc/s3fwrn5/Makefile     |   2 +-
>  drivers/nfc/s3fwrn5/i2c.c        | 117 +++++++++++++--------------------=
------
>  drivers/nfc/s3fwrn5/phy_common.c |  63 +++++++++++++++++++++
>  drivers/nfc/s3fwrn5/phy_common.h |  36 ++++++++++++
>  4 files changed, 139 insertions(+), 79 deletions(-)
>  create mode 100644 drivers/nfc/s3fwrn5/phy_common.c
>  create mode 100644 drivers/nfc/s3fwrn5/phy_common.h

I am sorry, but I am not going to review this. Please send properly a
next version - v4 of entire patchset - while fixing issues pointed out
in my other email (so use proper workflow).

Best regards,
Krzysztof
--===============2877333503061293454==--

