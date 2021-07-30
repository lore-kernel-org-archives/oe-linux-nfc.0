Content-Type: multipart/mixed; boundary="===============7456835083560401676=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2 7/8] nfc: hci: pass callback data param as pointer in nci_request()
Date: Fri, 30 Jul 2021 16:03:27 +0200
Message-ID: <6f609952-cf76-58f9-1917-f06f3f376843@canonical.com>
In-Reply-To: <20210730065830.547df546@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7456835083560401676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 30/07/2021 15:58, Jakub Kicinski wrote:
> On Fri, 30 Jul 2021 15:56:19 +0200 Krzysztof Kozlowski wrote:
>> On 30/07/2021 15:49, Jakub Kicinski wrote:
>>> This generates a bunch of warnings:
>>>
>>> net/nfc/nci/core.c:381:51: warning: Using plain integer as NULL pointer
>>> net/nfc/nci/core.c:388:50: warning: Using plain integer as NULL pointer
>>> net/nfc/nci/core.c:494:57: warning: Using plain integer as NULL pointer
>>> net/nfc/nci/core.c:520:65: warning: Using plain integer as NULL pointer
>>> net/nfc/nci/core.c:570:44: warning: Using plain integer as NULL pointer
>>> net/nfc/nci/core.c:815:34: warning: Using plain integer as NULL pointer
>>> net/nfc/nci/core.c:856:50: warning: Using plain integer as NULL pointer=
  =

>>
>> Indeed. Not that code before was better - the logic was exactly the
>> same. I might think more how to avoid these and maybe pass pointer to
>> stack value (like in other cases).
>>
>> The 7/8 and 8/8 could be skipped in such case.
> =

> We don't usually take parts of series, would you mind resending first 6
> or respinning with the warnings addressed?

Sure, no problem.


Best regards,
Krzysztof
--===============7456835083560401676==--

