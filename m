Content-Type: multipart/mixed; boundary="===============3237251766655295463=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2 7/8] nfc: hci: pass callback data param as pointer in nci_request()
Date: Fri, 30 Jul 2021 15:56:19 +0200
Message-ID: <53f89bae-fcb5-8e7c-0b03-effa156584fe@canonical.com>
In-Reply-To: <20210730064922.078bd222@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3237251766655295463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 30/07/2021 15:49, Jakub Kicinski wrote:
> On Fri, 30 Jul 2021 08:56:24 +0200 Krzysztof Kozlowski wrote:
>> The nci_request() receives a callback function and unsigned long data
>> argument "opt" which is passed to the callback.  Almost all of the
>> nci_request() callers pass pointer to a stack variable as data argument.
>> Only few pass scalar value (e.g. u8).
>>
>> All such callbacks do not modify passed data argument and in previous
>> commit they were made as const.  However passing pointers via unsigned
>> long removes the const annotation.  The callback could simply cast
>> unsigned long to a pointer to writeable memory.
>>
>> Use "const void *" as type of this "opt" argument to solve this and
>> prevent modifying the pointed contents.  This is also consistent with
>> generic pattern of passing data arguments - via "void *".  In few places
>> passing scalar values, use casts via "unsigned long" to suppress any
>> warnings.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> =

> This generates a bunch of warnings:
> =

> net/nfc/nci/core.c:381:51: warning: Using plain integer as NULL pointer
> net/nfc/nci/core.c:388:50: warning: Using plain integer as NULL pointer
> net/nfc/nci/core.c:494:57: warning: Using plain integer as NULL pointer
> net/nfc/nci/core.c:520:65: warning: Using plain integer as NULL pointer
> net/nfc/nci/core.c:570:44: warning: Using plain integer as NULL pointer
> net/nfc/nci/core.c:815:34: warning: Using plain integer as NULL pointer
> net/nfc/nci/core.c:856:50: warning: Using plain integer as NULL pointer

Indeed. Not that code before was better - the logic was exactly the
same. I might think more how to avoid these and maybe pass pointer to
stack value (like in other cases).

The 7/8 and 8/8 could be skipped in such case.

> =

> BTW applying this set will resolve the warnings introduced by applying
> "part 2" out of order, right? No further action needed?

Yes, it will resolve all warnings. No further action needed, at least I
am not aware of any new issues.

Best regards,
Krzysztof
--===============3237251766655295463==--

