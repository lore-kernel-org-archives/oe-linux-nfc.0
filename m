Content-Type: multipart/mixed; boundary="===============7251034615206404564=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
Date: Wed, 12 May 2021 10:01:35 -0700
Message-ID: <20210512170135.GB222094@animalcreek.com>
In-Reply-To: <14e78a9a-ed1a-9d7d-b854-db6d811f4622@kontron.de>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7251034615206404564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 05:32:35PM +0200, Frieder Schrempf wrote:
> On 12.05.21 16:43, Krzysztof Kozlowski wrote:
> > The NFC subsystem is orphaned.  I am happy to spend some cycles to
> > review the patches, send pull requests and in general keep the NFC
> > subsystem running.
> =

> That's great, thanks!
> =

> Maybe you also want to have a look at the userspace side and talk to Mark=
 Greer (on cc). He recently said, that he is supposed to be taking over mai=
ntenance for the neard daemon (see this thread: [1]) which currently looks =
like it's close to being dead (no release for several years, etc.).
> =

> I don't know much about the NFC stack and if/how people use it, but witho=
ut reliable and maintained userspace tooling, the whole thing seems of litt=
le use in the long run. Qt has already dropped their neard support for Qt 6=
 [2], which basically means the mainline NFC stack won't be supported anymo=
re in one of the most common application frameworks for IoT/embedded.
> =

> [1] https://lists.01.org/hyperkitty/list/linux-nfc(a)lists.01.org/thread/=
OHD5IQHYPFUPUFYWDMNSVCBNO24M45VK/
> [2] https://bugreports.qt.io/browse/QTBUG-81824

Re: QT - I've already talked to Alex Blasche from QT (CC'd).  With some
work we can get Linux NFC/neard back into their good graces.  I/we need
to find time to put in the work, though.

An example of the issues they have seen is:

	https://bugreports.qt.io/browse/QTBUG-43802

Another issue I have--and I suspect you, Krzysztof, have as well--is
lack of hardware.  If anyone reading this wants to volunteer to be a
tester, please speak up.

To help get everyone on the same page, this is a response I made to
Krzysztof in another email:

    "Krzysztof, the NFC portion of the kernel has a counterpart in userspace
     called neard.  I'm supposed to be maintaining it but I have next to no
     time to do so.  If you have spare cycles, any help would be appreciate=
d.

     Anyway, in neard, there are some simple test scripts (python2 - I/we n=
eed
     to update to python3).  The current home of neard is:

     git://git.kernel.org/pub/scm/network/nfc/neard.git"

Thanks,

Mark
--
--===============7251034615206404564==--

