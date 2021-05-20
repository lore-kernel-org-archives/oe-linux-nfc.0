Content-Type: multipart/mixed; boundary="===============6092321943819422213=="
MIME-Version: 1.0
From: Stephan Gerhold <stephan@gerhold.net>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 2/2] nfc: s3fwrn5: i2c: Enable optional clock from device tree
Date: Thu, 20 May 2021 09:41:31 +0200
Message-ID: <YKYSq5WTeZyMIZYn@gerhold.net>
In-Reply-To: <10b3a50e-877c-d5b1-3e35-e5dff4ef53d8@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6092321943819422213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 11:58:38AM -0400, Krzysztof Kozlowski wrote:
> > =

> > Personally, I just skip all firmware/RF configuration (which works than=
ks
> > to commit 4fb7b98c7be3 ("nfc: s3fwrn5: skip the NFC bootloader mode")).
> > That way, S3FWRN5 just continues using the proper configuration
> > that was loaded by the vendor drivers at some point. :)
> =

> But isn't that configuration lost after power off?
> =


I don't know exactly but I don't think it's lost. At least the firmware
and rfreg configuration seem to be preserved since I've never provided
the driver with the necessary firmware. It just works without :)

Stephan
--===============6092321943819422213==--

