Content-Type: multipart/mixed; boundary="===============0244438476526744281=="
MIME-Version: 1.0
From: Vincas Dargis <vindrg@gmail.com>
To: linux-nfc@lists.01.org
Subject: About NFC Tag emulation on Linux
Date: Thu, 22 Jul 2021 13:59:17 +0300
Message-ID: <CAPNCXk0qkc-5myby0TdzD=6kBXSd_o_iNGy6jjjO5YXeyZqceg@mail.gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0244438476526744281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi list,

I see there's "test-device", "test-tag" helpers in neard-tools package
in Debian, but it looks like it needs actual devices/tags to test
with..?

Is there a way to emulate NFC tag, to "emit" NFC tag discovery events
and NDEF mesages on Linux? Qt supports NFC on Linux via neard daemon,
so I thought it would be very useful to emulate NFC tags (with various
payloads) for development and (automated even?) testing.

Thanks!
--===============0244438476526744281==--

