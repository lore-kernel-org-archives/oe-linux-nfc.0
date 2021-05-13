Content-Type: multipart/mixed; boundary="===============2268168779192007002=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: Testing wanted for Linux NFC subsystem
Date: Thu, 13 May 2021 07:48:55 -0700
Message-ID: <20210513144855.GA266838@animalcreek.com>
In-Reply-To: <YJ0SYWJjq3ZmXMy3@gerhold.net>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2268168779192007002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 01:49:53PM +0200, Stephan Gerhold wrote:
> Hi!

Hi Stephan and thanks for stepping up.

> I have a couple of "recycled" smartphones running mainline Linux
> and some of them do have NFC chips. I have two with NXP PN547
> (supported by nxp,nxp-nci-i2c), one with Samsung S3FWRN5
> (samsung,s3fwrn5-i2c) and even one with Broadcom BCM2079x I think
> (this one does not have a driver for the Linux NFC subsystem sadly).
> =

> +Cc phone-devel(a)vger.kernel.org, in case other people there are
> interested in NFC :)
> =

> The NXP/Samsung ones seems to work just fine. However, since there are
> barely any userspace tools making use of Linux NFC all my testing so far
> was limited to polling for devices with "nfctool" and being happy enough
> when it realizes that I hold some NFC tag close to the device. :S

There is a user-level daemon that is the counterpart for the in-kernel
NFC subsystem.  It is called neard and is available here:

	git://git.kernel.org/pub/scm/network/nfc/neard.git

There are a few test script in it that will let you read and write NFC
tags, and do some other things.  We can add some more tests to that set
as we go.

> I would be happy to do some more testing if someone has something useful
> that can be tested. However, I guess ideally we would have someone who
> actually uses Linux NFC actively for some real application. :)

Ideally, you should have some NFC tags of various types.  Types 2, 3,
4A, 4B, and 5 tags are supported.  Peer-to-peer mode is supported too
so you should be able to transfer data from one of your phones to the
other over NFC (and do a BT hand-over, if you're interested).

Note that the specified range for NFC is only 4 cm and poor antenna
design, etc. means that the actual range is usually much less (e.g.,
they amost have to touch).  Also note that there are timing constraints
so you may need to make the scheduling priority of the interrupt thread
of your NFC driver real-time.

Mark
--
--===============2268168779192007002==--

