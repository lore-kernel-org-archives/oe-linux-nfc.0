Content-Type: multipart/mixed; boundary="===============7588611824201745643=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
Date: Wed, 12 May 2021 09:49:52 -0700
Message-ID: <20210512164952.GA222094@animalcreek.com>
In-Reply-To: <d498c949-3b1e-edaa-81ed-60573cfb6ee9@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7588611824201745643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 11:43:13AM -0400, Krzysztof Kozlowski wrote:
> On 12/05/2021 11:11, Daniel Lezcano wrote:
> > On 12/05/2021 16:43, Krzysztof Kozlowski wrote:
> >> The NFC subsystem is orphaned.  I am happy to spend some cycles to
> >> review the patches, send pull requests and in general keep the NFC
> >> subsystem running.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.co=
m>
> >>
> >> ---
> >>
> >> I admit I don't have big experience in NFC part but this will be nice
> >> opportunity to learn something new. =

> > =

> > NFC has been lost in the limbos since a while. Good to see someone
> > volunteering to take care of it.
> > =

> > May I suggest to create a simple nfc reading program in the 'tools'
> > directory (could be a training exercise ;)
> > =

> =

> Noted, thanks. I also need to get a simple hardware dongle for this....

Krzysztof, the NFC portion of the kernel has a counterpart in userspace
called neard.  I'm supposed to be maintaining it but I have next to no
time to do so.  If you have spare cycles, any help would be appreciated.

Anyway, in neard, there are some simple test scripts (python2 - I/we need
to update to python3).  The current home of neard is:

git://git.kernel.org/pub/scm/network/nfc/neard.git

Mark
--
--===============7588611824201745643==--

