Content-Type: multipart/mixed; boundary="===============7844940198941339756=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-nfc@lists.01.org
Subject: Re: ST ST95HF DRIVER security bug
Date: Wed, 24 Aug 2022 19:21:44 +0300
Message-ID: <cb9ee490-744d-bc5d-715d-7a23d2b682c8@linaro.org>
In-Reply-To: <CAAMXCF=15tSmz7=nzVRgw166wDmMGiBuLx6Of-NLvboMN3nAuQ@mail.gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7844940198941339756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 24/08/2022 18:12, =D7=9E=D7=99=D7=9B=D7=90=D7=9C =D7=A9=D7=98=D7=A8=D7=
=90=D7=95=D7=A1 wrote:
>>
>> Please use scripts/get_maintainers.pl to Cc relevant people. You got the
>> same comment last time as well...
>>
> Sorry my bad, i forgot we already contacted.
> I actually ran it and your name came up for some reason.
> =

>> ./scripts/get_maintainer.pl drivers/nfc/st95hf/spi.c
> =

> Bad divisor in main::vcs_assign: 0
> =

> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (maintainer:NFC
>> SUBSYSTEM)
> =

> netdev(a)vger.kernel.org (open list:NFC SUB

and other addresses... why removing them?

> =

> =

> =

> =

>>  What does it mean "current source"? Please be specific which exactly
> =

> kernel version is affected, which commit introduced it.
> =

> *Effected version: *
> - v6.0-rc2 <https://github.com/torvalds/linux/releases/tag/v6.0-rc2>  ...
> - *v4.5-rc1* <https://github.com/torvalds/linux/releases/tag/v4.5-rc1>
> *Introducing commit:  *
> https://github.com/torvalds/linux/commit/cab47333f0f75b685bce1facecb73bf3=
632e1360
> =

> Then the risk is quite low, right? SPI busses are not user hot-pluggable
>> except some development boards (so again a real niche). Basically it's
>> impact is negligible
>>
> Agreed.
> =

> What does it mean "remote device"? NFC? NFC tag does not talk over SPI...
>>
> I was wondering maybe the tag is the source for the content that actually
> overflows the kernel buffer,
> In which case it changes the picture a bit.

The buffer is used for SPI transfer, so the NFC tag - except that it
works with that device - is rather long shot.


Best regards,
Krzysztof
--===============7844940198941339756==--

