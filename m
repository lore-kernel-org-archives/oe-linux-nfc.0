Content-Type: multipart/mixed; boundary="===============7403349876217116996=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2 net-next] nfc: s3fwrn5: skip the NFC bootloader mode
Date: Fri, 04 Dec 2020 10:37:53 +0200
Message-ID: <20201204083753.GB5418@kozik-lap>
In-Reply-To: <20201203225257.2446-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7403349876217116996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 07:52:57AM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> =

> If there isn't a proper NFC firmware image, Bootloader mode will be
> skipped.
> =

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
> =

>  ChangeLog:
>   v2:
>    - change the commit message.
>    - change the skip handling code.

Patch is now much cleaner and smaller. Thanks.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

> =

>  drivers/nfc/s3fwrn5/core.c     | 23 +++++++++++++++++++++--
>  drivers/nfc/s3fwrn5/firmware.c | 11 +----------
>  drivers/nfc/s3fwrn5/firmware.h |  1 +
>  3 files changed, 23 insertions(+), 12 deletions(-)
--===============7403349876217116996==--

