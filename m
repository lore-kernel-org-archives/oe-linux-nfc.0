Content-Type: multipart/mixed; boundary="===============1301330862970891412=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
Date: Fri, 16 Jul 2021 12:17:43 +0200
Message-ID: <d996605f-020c-95c9-6ab4-cfb101cb3802@canonical.com>
In-Reply-To: <20210715183413.GB525255@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1301330862970891412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 15/07/2021 20:34, Mark Greer wrote:
> On Fri, Jul 09, 2021 at 11:24:41AM +0200, Krzysztof Kozlowski wrote:
>> On 12/05/2021 18:49, Mark Greer wrote:
>>> On Wed, May 12, 2021 at 11:43:13AM -0400, Krzysztof Kozlowski wrote:
>>>> On 12/05/2021 11:11, Daniel Lezcano wrote:
>>>>> On 12/05/2021 16:43, Krzysztof Kozlowski wrote:
>>>>>> The NFC subsystem is orphaned.  I am happy to spend some cycles to
>>>>>> review the patches, send pull requests and in general keep the NFC
>>>>>> subsystem running.
>>>>>>
>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.=
com>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> I admit I don't have big experience in NFC part but this will be nice
>>>>>> opportunity to learn something new. =

>>>>>
>>>>> NFC has been lost in the limbos since a while. Good to see someone
>>>>> volunteering to take care of it.
>>>>>
>>>>> May I suggest to create a simple nfc reading program in the 'tools'
>>>>> directory (could be a training exercise ;)
>>>>>
>>>>
>>>> Noted, thanks. I also need to get a simple hardware dongle for this....
>>>
>>> Krzysztof, the NFC portion of the kernel has a counterpart in userspace
>>> called neard.  I'm supposed to be maintaining it but I have next to no
>>> time to do so.  If you have spare cycles, any help would be appreciated.
>>>
>>> Anyway, in neard, there are some simple test scripts (python2 - I/we ne=
ed
>>> to update to python3).  The current home of neard is:
>>>
>>> git://git.kernel.org/pub/scm/network/nfc/neard.git
>>
>> I guess none of us have problem of too much spare time :), so it took me
>> a while before I looked at neard.
>>
>> With newer Gcc, neard did not even compile (which I am fixing now). I
>> set up a fork:
>> https://github.com/krzk/neard
>> However I can give early disclaimer - playing with GLib userspace code
>> is not something I am in long term interested. If this was written in
>> Rust, would be different story. :)
>>
>> I also configured basic CI (or rather continuous building):
>> https://github.com/krzk/neard/actions/runs/1014641944
>>
>> However I still do not have proper testing setup. No hardware. Would be
>> nice if Samsung. ST, NXP or Intel could spare some development board
>> with the NFC chip supported by kernel. Till then, I will try the NFC
>> simulator and virtual NCI drivers.
>>
>> My next plan for neard is to extend the CI. There is no way I (or anyone
>> else I believe) can keep good quality of releases without automated
>> checks. I'll add some more distros, clang and later many some linters or
>> cppcheck.
> =

> Hi Krzysztof, I see you've been busy.  Thanks for that.
> =

> FYI, I made a repo on github some time back but never announced it.  The
> only reason I mention it is because the name/link looks more official:
> =

> 	https://github.com/linux-nfc/neard
> =

> Let see what happens with permssion on kernel.org and go from there.

For the kernel.org I think you need an account @kernel.org (which itself
requires your key to be signed by someone), but I am not sure.

I am happy to move entire development to github and keep kernel.org only
for releases till some distro packages notice the change. If Github,
then your linux-nfc looks indeed nicer.

> Re: hardware - I don't have much reader hardware either.  I almost
> exclusively use BeagleBone[Black] + RF Cape + trf7970atb.  I also have
> a USB dongle with a pn533, FWIW. I do have a decent collection of NFC tag=
s,
> though.  I'll contact you privately to arrange to send some to you.

Thanks! I managed to do some testing with nfc-sim modules, although I am
not sure how much is supported.

> For peer-to-peer testing, your smartphone probably has an NFC reader but
> you'll have to play around to find the sweet spot where they put the
> antenna (older phones were notoriously bad for NFC antenna design; newer
> ones are generally better).
> =

> I will review your patch sets but the earliest I will get to them will
> be Sunday.

I just sent one more set :)


Best regards,
Krzysztof
--===============1301330862970891412==--

