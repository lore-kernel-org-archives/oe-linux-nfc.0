Content-Type: multipart/mixed; boundary="===============1966276488139572788=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
Date: Thu, 15 Jul 2021 11:34:13 -0700
Message-ID: <20210715183413.GB525255@animalcreek.com>
In-Reply-To: <df2ec154-79fa-af7b-d337-913ed4a0692e@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1966276488139572788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 09, 2021 at 11:24:41AM +0200, Krzysztof Kozlowski wrote:
> On 12/05/2021 18:49, Mark Greer wrote:
> > On Wed, May 12, 2021 at 11:43:13AM -0400, Krzysztof Kozlowski wrote:
> >> On 12/05/2021 11:11, Daniel Lezcano wrote:
> >>> On 12/05/2021 16:43, Krzysztof Kozlowski wrote:
> >>>> The NFC subsystem is orphaned.  I am happy to spend some cycles to
> >>>> review the patches, send pull requests and in general keep the NFC
> >>>> subsystem running.
> >>>>
> >>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.=
com>
> >>>>
> >>>> ---
> >>>>
> >>>> I admit I don't have big experience in NFC part but this will be nice
> >>>> opportunity to learn something new. =

> >>>
> >>> NFC has been lost in the limbos since a while. Good to see someone
> >>> volunteering to take care of it.
> >>>
> >>> May I suggest to create a simple nfc reading program in the 'tools'
> >>> directory (could be a training exercise ;)
> >>>
> >>
> >> Noted, thanks. I also need to get a simple hardware dongle for this....
> > =

> > Krzysztof, the NFC portion of the kernel has a counterpart in userspace
> > called neard.  I'm supposed to be maintaining it but I have next to no
> > time to do so.  If you have spare cycles, any help would be appreciated.
> > =

> > Anyway, in neard, there are some simple test scripts (python2 - I/we ne=
ed
> > to update to python3).  The current home of neard is:
> > =

> > git://git.kernel.org/pub/scm/network/nfc/neard.git
> =

> I guess none of us have problem of too much spare time :), so it took me
> a while before I looked at neard.
> =

> With newer Gcc, neard did not even compile (which I am fixing now). I
> set up a fork:
> https://github.com/krzk/neard
> However I can give early disclaimer - playing with GLib userspace code
> is not something I am in long term interested. If this was written in
> Rust, would be different story. :)
> =

> I also configured basic CI (or rather continuous building):
> https://github.com/krzk/neard/actions/runs/1014641944
> =

> However I still do not have proper testing setup. No hardware. Would be
> nice if Samsung. ST, NXP or Intel could spare some development board
> with the NFC chip supported by kernel. Till then, I will try the NFC
> simulator and virtual NCI drivers.
> =

> My next plan for neard is to extend the CI. There is no way I (or anyone
> else I believe) can keep good quality of releases without automated
> checks. I'll add some more distros, clang and later many some linters or
> cppcheck.

Hi Krzysztof, I see you've been busy.  Thanks for that.

FYI, I made a repo on github some time back but never announced it.  The
only reason I mention it is because the name/link looks more official:

	https://github.com/linux-nfc/neard

Let see what happens with permssion on kernel.org and go from there.

Re: hardware - I don't have much reader hardware either.  I almost
exclusively use BeagleBone[Black] + RF Cape + trf7970atb.  I also have
a USB dongle with a pn533, FWIW. I do have a decent collection of NFC tags,
though.  I'll contact you privately to arrange to send some to you.

For peer-to-peer testing, your smartphone probably has an NFC reader but
you'll have to play around to find the sweet spot where they put the
antenna (older phones were notoriously bad for NFC antenna design; newer
ones are generally better).

I will review your patch sets but the earliest I will get to them will
be Sunday.

Mark
--
--===============1966276488139572788==--

