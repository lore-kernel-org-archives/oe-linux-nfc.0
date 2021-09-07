Content-Type: multipart/mixed; boundary="===============6242721620786103077=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 05/15] nfc: pn533: drop unneeded debug prints
Date: Tue, 07 Sep 2021 19:06:55 +0200
Message-ID: <f6677c91-30ba-132d-20d2-0ec7edf40025@canonical.com>
In-Reply-To: <20210907100310.0cdec18b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6242721620786103077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/09/2021 19:03, Jakub Kicinski wrote:
> On Tue, 7 Sep 2021 18:05:25 +0200 Krzysztof Kozlowski wrote:
>> On 07/09/2021 14:18, Krzysztof Kozlowski wrote:
>>> ftrace is a preferred and standard way to debug entering and exiting
>>> functions so drop useless debug prints.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> ---
>>>  drivers/nfc/pn533/i2c.c   | 1 -
>>>  drivers/nfc/pn533/pn533.c | 2 --
>>>  2 files changed, 3 deletions(-)
>>>
>>> diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
>>> index e6bf8cfe3aa7..91d4a035eb63 100644
>>> --- a/drivers/nfc/pn533/i2c.c
>>> +++ b/drivers/nfc/pn533/i2c.c
>>> @@ -138,7 +138,6 @@ static irqreturn_t pn533_i2c_irq_thread_fn(int irq,=
 void *data)
>>>  	}
>>>  =

>>>  	client =3D phy->i2c_dev;  =

>>
>> This line should also be removed (reported by kbuild robot).
>>
>> I will send a v2.
> =

> Dave marked the series as Deferred (although this patch is Changes
> Requested, I'm guessing you did that, if so please don't change patch
> states in netdev pw)

Yes, that was me. Sorry for disturbing the process.

>, please hold off:
> =

> =

> # Form letter - net-next is closed
> =

> We have already sent the networking pull request for 5.15
> and therefore net-next is closed for new drivers, features,
> code refactoring and optimizations. We are currently accepting
> bug fixes only.
> =

> Please repost when net-next reopens after 5.15-rc1 is cut.
> =

> Look out for the announcement on the mailing list or check:
> http://vger.kernel.org/~davem/net-next.html
> =

> RFC patches sent for review only are obviously welcome at any time.

Sure, I'll wait till end of merge window.


Best regards,
Krzysztof
--===============6242721620786103077==--

