Content-Type: multipart/mixed; boundary="===============2949405418418992988=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-nfc@lists.01.org
Subject: Re: ST ST95HF DRIVER security bug
Date: Wed, 24 Aug 2022 15:08:44 +0300
Message-ID: <d499ec9a-a1e3-83e0-b66f-346a9186b4a6@linaro.org>
In-Reply-To: <CAAMXCFnzLX-yWKSJ5JoBxcE8E0=cSQeDExGoFBxhkusUNeYncg@mail.gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2949405418418992988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 24/08/2022 12:10, =D7=9E=D7=99=D7=9B=D7=90=D7=9C =D7=A9=D7=98=D7=A8=D7=
=90=D7=95=D7=A1 wrote:
> Hi,
> I found a small security bug in the ST95HF driver in Linux kernel .
> Thought it is responsible to report it to you guys so you we can patch it
> up.

Please use scripts/get_maintainers.pl to Cc relevant people. You got the
same comment last time as well...

> CVE ID was requested,  when it is reserved I will update.
> =

> ST ST95HF DRIVER
> ST95HF is an integrated transceiver for NFC made by ST,
> Buffer overflow can be triggered by the attacker by providing malicious
> size in one of the SPI receive registers.
> =

> *Details:*
> ```jsx
> unsigned char st95hf_response_arr[2];
> ret =3D st95hf_spi_recv_response(&st95context->spicontext,
>       st95hf_response_arr);
> ...
> =

> /* Support of long frame */
> if (receivebuff[0] & 0x60)
> len +=3D (((receivebuff[0] & 0x60) >> 5) << 8) | receivebuff[1];
> else
> len +=3D receivebuff[1];
> =

> /* Now make a transfer to read only relevant bytes */
> tx_takedata.rx_buf =3D &receivebuff[2];
> tx_takedata.len =3D len - 2;
> =

> spi_message_init(&m);
> spi_message_add_tail(&tx_takedata, &m);
> ```
> Driver sets a buffer of 2 bytes for the input bytes but actually allows t=
he
> driver to overflow it with any valid SPI message (short or long frame) in
> the tx_takedata stage.
> It seems like a mistake, but i may be missing something and i am totally
> wrong.
> =

> *Effected commits:* Current source includes issue.

What does it mean "current source"? Please be specific which exactly
kernel version is affected, which commit introduced it.

> *Exploitable:* I actually think vulnerability can be exploitable by any
> device on the SPI bus.

Then the risk is quite low, right? SPI busses are not user hot-pluggable
except some development boards (so again a real niche). Basically it's
impact is negligible, considering that system would need to have such
device reported and configured (which for DT systems is static) and at
the same time malfunctioning or behaving incorrectly?

You already sent me a message about it in May and this does not bring
anything particularly new since then. You did not respond to my reply
that time, although maybe that's continuation.

Anyway proper analyzing of this issue and a patch would be nice.

> *Code:*
> <https://github.com/torvalds/linux/blame/master/drivers/nfc/st95hf/core.c=
#L284>
> https://github.com/torvalds/linux/blame/master/drivers/nfc/st95hf/core.c#=
L284
> ,
> https://github.com/torvalds/linux/blob/master/drivers/nfc/st95hf/spi.c#L1=
07
> =

> I was not able to understand if the remote device has ability to trigger
> the issue or only the SPI connected device?


What does it mean "remote device"? NFC? NFC tag does not talk over SPI...

Best regards,
Krzysztof
--===============2949405418418992988==--

