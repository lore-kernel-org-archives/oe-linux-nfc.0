Content-Type: multipart/mixed; boundary="===============4405355016224504552=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [RESEND PATCH v2 2/7] nfc: nci: replace GPLv2 boilerplate with SPDX
Date: Fri, 08 Oct 2021 12:46:31 +0200
Message-ID: <9669a6cd-77de-ca0c-153c-75b531bd2490@canonical.com>
In-Reply-To: <34cc3eda06fa2e793c46b48ee734fd879e6f8ab1.camel@perches.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4405355016224504552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/10/2021 12:33, Joe Perches wrote:
> On Thu, 2021-10-07 at 15:30 +0200, Krzysztof Kozlowski wrote:
>> Replace standard GPLv2 only license text with SPDX tag.
> =

> Nak
> =

> This is actually licenced with GPL-2.0-or-later
> =

>> diff --git a/net/nfc/nci/uart.c b/net/nfc/nci/uart.c
> []
>> @@ -1,20 +1,8 @@
>> +// SPDX-License-Identifier: GPL-2.0
> []
> You may use, redistribute and/or modify this File in
>> - * accordance with the terms and conditions of the License, a copy of w=
hich
>> - * is available on the worldwide web at
>> - * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
> =

> See the actual text at the old link which includes:
> =

>     This program is free software; you can redistribute it and/or modify
>     it under the terms of the GNU General Public License as published by
>     the Free Software Foundation; either version 2 of the License, or
>     (at your option) any later version.


Thanks Joe for checking this. Isn't this conflicting with first
paragraph in the source file:

  This software file (the "File") is distributed by Marvell
InternationalLtd. under the terms of the GNU General Public License
Version 2, June 1991(the "License").

This part does not specify "or later".

Best regards,
Krzysztof
--===============4405355016224504552==--

