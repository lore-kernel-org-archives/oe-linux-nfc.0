Content-Type: multipart/mixed; boundary="===============7529851411530861170=="
MIME-Version: 1.0
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: linux-nfc@lists.01.org
Subject: Re: About NFC Tag emulation on Linux
Date: Thu, 22 Jul 2021 14:34:40 +0200
Message-ID: <e35ac631-3b84-f6c5-3f34-b6859f3b709f@kontron.de>
In-Reply-To: <CAPNCXk0qkc-5myby0TdzD=6kBXSd_o_iNGy6jjjO5YXeyZqceg@mail.gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7529851411530861170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 22.07.21 12:59, Vincas Dargis wrote:
> Hi list,
> =

> I see there's "test-device", "test-tag" helpers in neard-tools package
> in Debian, but it looks like it needs actual devices/tags to test
> with..?
> =

> Is there a way to emulate NFC tag, to "emit" NFC tag discovery events
> and NDEF mesages on Linux? Qt supports NFC on Linux via neard daemon,

By the way, this is only true for Qt up to version 5.15. They dropped neard=
 support for Qt 6 (see https://bugreports.qt.io/browse/QTBUG-81824).

> so I thought it would be very useful to emulate NFC tags (with various
> payloads) for development and (automated even?) testing.
> =

> Thanks!
> _______________________________________________
> Linux-nfc mailing list -- linux-nfc(a)lists.01.org
> To unsubscribe send an email to linux-nfc-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>=20
--===============7529851411530861170==--

