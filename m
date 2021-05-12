Content-Type: multipart/mixed; boundary="===============2740306197207290213=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
Date: Wed, 12 May 2021 16:22:58 -0400
Message-ID: <06892f2b-e4af-66d4-f033-aff49039d1a9@canonical.com>
In-Reply-To: <20210512164952.GA222094@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2740306197207290213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/05/2021 12:49, Mark Greer wrote:
> On Wed, May 12, 2021 at 11:43:13AM -0400, Krzysztof Kozlowski wrote:
>> On 12/05/2021 11:11, Daniel Lezcano wrote:
>>> On 12/05/2021 16:43, Krzysztof Kozlowski wrote:
>>>> The NFC subsystem is orphaned.  I am happy to spend some cycles to
>>>> review the patches, send pull requests and in general keep the NFC
>>>> subsystem running.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.co=
m>
>>>>
>>>> ---
>>>>
>>>> I admit I don't have big experience in NFC part but this will be nice
>>>> opportunity to learn something new. =

>>>
>>> NFC has been lost in the limbos since a while. Good to see someone
>>> volunteering to take care of it.
>>>
>>> May I suggest to create a simple nfc reading program in the 'tools'
>>> directory (could be a training exercise ;)
>>>
>>
>> Noted, thanks. I also need to get a simple hardware dongle for this....
> =

> Krzysztof, the NFC portion of the kernel has a counterpart in userspace
> called neard.  I'm supposed to be maintaining it but I have next to no
> time to do so.  If you have spare cycles, any help would be appreciated.
> =

> Anyway, in neard, there are some simple test scripts (python2 - I/we need
> to update to python3).  The current home of neard is:
> =

> git://git.kernel.org/pub/scm/network/nfc/neard.git

Thanks for sharing this. Let me take a look at it first, before
committing to something too big.

Best regards,
Krzysztof
--===============2740306197207290213==--

