Content-Type: multipart/mixed; boundary="===============1628330055281845129=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] NFC: NCI: make parent aware in PM terms
Date: Mon, 23 Aug 2021 13:29:27 +0200
Message-ID: <9219eca0-d6e9-5cec-3113-995743549332@canonical.com>
In-Reply-To: <3d825314-4fd5-ac5b-36e9-819cf2bbdb93@suse.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1628330055281845129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 23/08/2021 12:50, Oliver Neukum wrote:
> =

> On 19.08.21 16:45, Krzysztof Kozlowski wrote
> Hi,
>> Hi,
>>
>> Thanks for the patch.
>> However this
>> is unparseable.
>> Please wrap commit
>> message around 75th character:
>> https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/subm=
itting-patches.rst#L124
>>
>> The subject prefix: "nfc: nxp-nci: "
> OK.
>> Please also Cc all people and lists. You missed here netdev
>> and linux-kernel, so this cannot be applied.
> Do you really want LKML on CC for all NFC patches?

I personally like it a lot because I have filters organized with it.
Nowadays no one reads LKML itself (too big volume) so it is purely for
archiving on lore.kernel.org for searching and for people's filters.

Therefore unless someone here objects, I would prefer to Cc LKML as
well. Anyway, netdev is important as it is tracked by patchwork.

>>> The necessary extension of runtime PM
>>> to the NFC device requires that it
>>> be activated as a child of the i2c device.
>>> It is not necessary to do any runtime PM
>>> operations. This will disable runtime PM
>>> for this branch of the tree, but otherwise
>>> the NFC device is inoperable.
>>>
>>> Signed-off-by: Oliver Neukum <oneukum@suse.com>
>>> ---
>>>  drivers/nfc/nxp-nci/i2c.c | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
>>> index 94f7f6d9cbad..dba78a5d217a 100644
>>> --- a/drivers/nfc/nxp-nci/i2c.c
>>> +++ b/drivers/nfc/nxp-nci/i2c.c
>>> @@ -18,6 +18,7 @@
>>>  #include <linux/interrupt.h>
>>>  #include <linux/module.h>
>>>  #include <linux/nfc.h>
>>> +#include <linux/pm_runtime.h>
>>>  #include <linux/gpio/consumer.h>
>>>  #include <asm/unaligned.h>
>>>  =

>>> @@ -261,6 +262,7 @@ static int nxp_nci_i2c_probe(struct i2c_client *cli=
ent,
>>>  {
>>>  	struct device *dev =3D &client->dev;
>>>  	struct nxp_nci_i2c_phy *phy;
>>> +	struct nfc_dev *ndev;
>>>  	int r;
>>>  =

>>>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>>> @@ -297,6 +299,11 @@ static int nxp_nci_i2c_probe(struct i2c_client *cl=
ient,
>>>  	if (r < 0)
>>>  		return r;
>>>  =

>>> +	ndev =3D phy->ndev->nfc_dev;
>>> +	pm_runtime_set_active(&ndev->dev);
>>> +	pm_runtime_enable(&ndev->dev);
>>> +	pm_runtime_mark_last_busy(&ndev->dev);
>> Setting PM for someone else does not look correct. This breaks
> As far as I can tell I am doing this for the device noted in nfc_dev.
> Could you elaborate?

I meant that it looks unusual that you don't do it for your own device
(client->dev) but for device allocated in different unit. Here, you
receive client->dev and mostly you should play only with it.

While I am looking at this more, there is another issue actually - you
touch runtime PM of NFC/NCI core device but it's the NFC/NCI core who
should handle it's own runtime PM.

>> encapsulation and separation of these files. The NCI device
>> (nxp_nci_probe() and other parts of core.c) should instead manage
>> it's own runtime PM.
> =

> That would be better. The problem I encountered is that i2c and USB have
> different
> needs concerning runtime PM. Any ideas?

I think we look at different code bases. I failed to find the USB
device... It's difficult for me to judge how the final runtime PM should
look like because actually you don't do any runtime PM here. You just
enable it. Where are the callbacks? Where is suspending and resuming
(get/put)?


Best regards,
Krzysztof
--===============1628330055281845129==--

