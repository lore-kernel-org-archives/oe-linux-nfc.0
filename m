Content-Type: multipart/mixed; boundary="===============1974987224161881884=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
Date: Wed, 12 May 2021 18:35:38 -0700
Message-ID: <20210513013538.GA239989@animalcreek.com>
In-Reply-To: <cd7a0110-702a-6e14-527e-fb4b53705870@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1974987224161881884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 04:21:25PM -0400, Krzysztof Kozlowski wrote:
> On 12/05/2021 13:01, Mark Greer wrote:

> > Re: QT - I've already talked to Alex Blasche from QT (CC'd).  With some
> > work we can get Linux NFC/neard back into their good graces.  I/we need
> > to find time to put in the work, though.
> > =

> > An example of the issues they have seen is:
> > =

> > 	https://bugreports.qt.io/browse/QTBUG-43802
> > =

> > Another issue I have--and I suspect you, Krzysztof, have as well--is
> > lack of hardware.  If anyone reading this wants to volunteer to be a
> > tester, please speak up.
> =

> Yes, testing would be very appreciated. I don't know how many unit tests
> neard has, but maybe some mockups with unit testing would solve some of
> problems?

I'm not sure what you mean by this.  Do you mean creating some tests that
sit directly on top of the kernel and test the kernel parts (e.g., use
netlink)?  If so, that would be useful but you may end up implementing
some of the NFC stack.  If you mean more/better tests that use neard to
exercise the whole stack then that would be really good too.

Speaking of NFC stack, the NFC forum has their specs paywalled which is
a real bummer/pain.  I can try reaching out to them to see if they will
help us help their mission but I'm not hopeful.

FYI, most of the issues that I ran into and know still exist are
timing/race issues in neard.  I'm sure if we tested more, we could find
some in the kernel though.

Mark
--
--===============1974987224161881884==--

