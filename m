Content-Type: multipart/mixed; boundary="===============1684174521470673189=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: About NFC Tag emulation on Linux
Date: Thu, 22 Jul 2021 23:03:28 -0700
Message-ID: <20210723060328.GA1042603@animalcreek.com>
In-Reply-To: <CAPNCXk0qkc-5myby0TdzD=6kBXSd_o_iNGy6jjjO5YXeyZqceg@mail.gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1684174521470673189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 01:59:17PM +0300, Vincas Dargis wrote:
> Hi list,

Hi Vincas.

> I see there's "test-device", "test-tag" helpers in neard-tools package
> in Debian, but it looks like it needs actual devices/tags to test
> with..?
> =

> Is there a way to emulate NFC tag, to "emit" NFC tag discovery events
> and NDEF mesages on Linux? Qt supports NFC on Linux via neard daemon,
> so I thought it would be very useful to emulate NFC tags (with various
> payloads) for development and (automated even?) testing.

I won't repeat [much of] what others have said but I can add this:


A: Try nfcsim

Already mentioned in this thread.

B: Use real hardware

B.1: Reader/Writers

PN533 dongles are fairly inexpensive (e.g.,
https://www.mikroe.com/nfc-usb-dongle) but most other are > $50 USD
so they are a little expensive.

B.2: Tags

B.2.i: Use a dynamic tag

That is a fancy term for a programmable device that looks like a "dumb"
NFC tag from the reader/writer side but you can control it (including
the data that is read by the reader) from the other side.  NXP, ST,
and TI all have (or did have) versions.  There may be others.  These
will almost certainly require a programming effort on your part.  If
you chose the TI rf430cl33x, I may be able to help
(e.g., https://www.ti.com/tool/DLP-RF430BP).

B.2.ii: Buy some "dumb" tags

They're cheap so buy a few (e.g., https://store.gototags.com/nfc-tags).
Try different tags types.  Types 2, 3, 4A, 4B, and 5 all work.
In theory type 1 tags work too but I have no way to test them so I
cannot say for sure.

Mark
--
--===============1684174521470673189==--

