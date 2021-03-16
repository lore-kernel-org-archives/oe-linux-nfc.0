Content-Type: multipart/mixed; boundary="===============0520724075017823208=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] tag: Implement readout of tag UID via DBus interface
Date: Tue, 16 Mar 2021 11:02:05 -0700
Message-ID: <20210316180205.GA501044@animalcreek.com>
In-Reply-To: <baa083e3-0f3c-6038-7b0b-f1c576d8f200@kontron.de>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0520724075017823208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 09:53:21AM +0100, Frieder Schrempf wrote:
> Hi Mark,

Hi Frieder.

> On 12.03.21 02:21, Mark Greer wrote:
> > On Thu, Mar 11, 2021 at 09:50:20AM +0100, Schrempf Frieder wrote:
> > > From: Frieder Schrempf <frieder.schrempf@kontron.de>
> > =

> > Hi Frieder.
> > =

> > I am supposed to be taking over neard maintenance but I have been
> > completely derelict in my duties.  I need to refresh my brain's
> > cache and look at your patch in more detail.  In the meantime,
> > I have a few minor comments below.
> =

> Good to hear that you are planning to take over maintainership. I was a b=
it
> worried to see neard being abandoned.

Just a warning that I have precious little time to dedicate to this so
please set expectations accordingly.

> I also recently found out that Qt has abandoned their support for neard in
> Qt 6 [1], which means that Qt 5.15 is the last version to offer integrati=
on
> with neard.
> =

> I think that's very unfortunate as this provided a nice and mainline-ish
> stack for NFC devices from the kernel up to the application layer. I don't
> know the reasons for this decision, but neard looking like it is not
> maintained anymore is maybe one of them.
> =

> [1] https://bugreports.qt.io/browse/QTBUG-81824

Thank you for the heads up and link.  This is disappointing.  I'll reach
out to them and see what their current thoughts are and whether they'll
reconsider.

Mark
--
--===============0520724075017823208==--

