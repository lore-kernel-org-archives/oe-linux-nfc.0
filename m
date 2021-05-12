Content-Type: multipart/mixed; boundary="===============3658095830583102905=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: how to test a driver for a new device
Date: Wed, 12 May 2021 08:19:59 -0700
Message-ID: <20210512151959.GD215713@animalcreek.com>
In-Reply-To: <46d0d6a709d42a344db86b8646293c077f0b8521.camel@suse.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3658095830583102905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 06:30:42PM +0200, Oliver Neukum wrote:
> Hi,

Hi Oliver.

> I have a system with an NXP1002 as opposed to NXP1001
> device. I've added it to the nxp-nci driver and I can detect
> tags. Is there a test suite for NFC I should run before
> submitting?

There isn't a specified test suite but there are some python scripts in
the neard repository that you can run to ensure that things work.  Those
require neard to be running, of course.

Mark
--
--===============3658095830583102905==--

