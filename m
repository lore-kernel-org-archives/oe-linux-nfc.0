Content-Type: multipart/mixed; boundary="===============8909188771174118462=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
Date: Wed, 12 May 2021 16:21:25 -0400
Message-ID: <cd7a0110-702a-6e14-527e-fb4b53705870@canonical.com>
In-Reply-To: <20210512170135.GB222094@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8909188771174118462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/05/2021 13:01, Mark Greer wrote:
> On Wed, May 12, 2021 at 05:32:35PM +0200, Frieder Schrempf wrote:
>> On 12.05.21 16:43, Krzysztof Kozlowski wrote:
>>> The NFC subsystem is orphaned.  I am happy to spend some cycles to
>>> review the patches, send pull requests and in general keep the NFC
>>> subsystem running.
>>
>> That's great, thanks!
>>
>> Maybe you also want to have a look at the userspace side and talk to Mar=
k Greer (on cc). He recently said, that he is supposed to be taking over ma=
intenance for the neard daemon (see this thread: [1]) which currently looks=
 like it's close to being dead (no release for several years, etc.).
>>
>> I don't know much about the NFC stack and if/how people use it, but with=
out reliable and maintained userspace tooling, the whole thing seems of lit=
tle use in the long run. Qt has already dropped their neard support for Qt =
6 [2], which basically means the mainline NFC stack won't be supported anym=
ore in one of the most common application frameworks for IoT/embedded.
>>
>> [1] https://lists.01.org/hyperkitty/list/linux-nfc(a)lists.01.org/thread=
/OHD5IQHYPFUPUFYWDMNSVCBNO24M45VK/
>> [2] https://bugreports.qt.io/browse/QTBUG-81824
> =

> Re: QT - I've already talked to Alex Blasche from QT (CC'd).  With some
> work we can get Linux NFC/neard back into their good graces.  I/we need
> to find time to put in the work, though.
> =

> An example of the issues they have seen is:
> =

> 	https://bugreports.qt.io/browse/QTBUG-43802
> =

> Another issue I have--and I suspect you, Krzysztof, have as well--is
> lack of hardware.  If anyone reading this wants to volunteer to be a
> tester, please speak up.

Yes, testing would be very appreciated. I don't know how many unit tests
neard has, but maybe some mockups with unit testing would solve some of
problems?



Best regards,
Krzysztof
--===============8909188771174118462==--

