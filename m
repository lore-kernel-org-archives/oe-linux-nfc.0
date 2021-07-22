Content-Type: multipart/mixed; boundary="===============3105753477235918812=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: About NFC Tag emulation on Linux
Date: Thu, 22 Jul 2021 13:53:33 +0200
Message-ID: <c3e98408-8d27-fe0e-4d99-6c1ae1d961ab@canonical.com>
In-Reply-To: <CAPNCXk0qkc-5myby0TdzD=6kBXSd_o_iNGy6jjjO5YXeyZqceg@mail.gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3105753477235918812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 22/07/2021 12:59, Vincas Dargis wrote:
> Hi list,
> =

> I see there's "test-device", "test-tag" helpers in neard-tools package
> in Debian, but it looks like it needs actual devices/tags to test
> with..?
> =

> Is there a way to emulate NFC tag, to "emit" NFC tag discovery events
> and NDEF mesages on Linux? Qt supports NFC on Linux via neard daemon,
> so I thought it would be very useful to emulate NFC tags (with various
> payloads) for development and (automated even?) testing.

I think nfcsim kernel module could help you but I am not sure how much
you can emulate.

Best regards,
Krzysztof
--===============3105753477235918812==--

