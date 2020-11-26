Content-Type: multipart/mixed; boundary="===============3657029547260522546=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next 1/3] nfc: s3fwrn5: use signed integer for parsing GPIO numbers
Date: Thu, 26 Nov 2020 18:01:54 +0100
Message-ID: <20201126170154.GA4978@kozik-lap>
In-Reply-To: <1606404819-30647-1-git-send-email-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3657029547260522546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 12:33:37AM +0900, bongsu.jeon2(a)gmail.com wrote:
> From: Krzysztof Kozlowski <krzk@kernel.org>
> =

> GPIOs - as returned by of_get_named_gpio() and used by the gpiolib - are
> signed integers, where negative number indicates error.  The return
> value of of_get_named_gpio() should not be assigned to an unsigned int
> because in case of !CONFIG_GPIOLIB such number would be a valid GPIO.
> =

> Fixes: c04c674fadeb ("nfc: s3fwrn5: Add driver for Samsung S3FWRN5 NFC Ch=
ip")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Why do you send my patch?

Best regards,
Krzysztof
--===============3657029547260522546==--

