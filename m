Content-Type: multipart/mixed; boundary="===============2648447119480529323=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [RESEND PATCH v2 4/6] nfc: llcp: use test_bit()
Date: Thu, 03 Mar 2022 14:13:30 +0100
Message-ID: <92ecef5a-cd8d-09e6-a8af-201e04b251c1@canonical.com>
In-Reply-To: <7fc4cb250bb8406cadf80649e366b249@AcuMS.aculab.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2648447119480529323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/03/2022 01:10, David Laight wrote:
> From: Krzysztof Kozlowski
>> Sent: 02 March 2022 19:25
>>
>> Use test_bit() instead of open-coding it, just like in other places
>> touching the bitmap.
> =

> Except it isn't a bitmap, it is just a structure member that contains bit=
s.
> So all the other places should be changes to use C shifts and masks (etc).
> =


It's not declared as bitmap but it is unsigned long, so an appropriate
type (and same type) for test_bit.


Best regards,
Krzysztof
--===============2648447119480529323==--

