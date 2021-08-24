Content-Type: multipart/mixed; boundary="===============0714376486685521676=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] NFC: NCI: make parent aware in PM terms
Date: Tue, 24 Aug 2021 09:24:34 +0200
Message-ID: <4cdc831f-1db9-ead2-bac5-5b9ea9f06aa0@canonical.com>
In-Reply-To: <b9d1fd42-290e-e60e-92a0-5f0cf3003f90@suse.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0714376486685521676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 23/08/2021 13:52, Oliver Neukum wrote:
> =

> On 23.08.21 13:29, Krzysztof Kozlowski wrote:
>> On 23/08/2021 12:50, Oliver Neukum wrote:
>>> On 19.08.21 16:45, Krzysztof Kozlowski wrote
> =

> =

> Hi,
> =

>>> I personally like it a lot because I have filters organized with it.
>>> Nowadays no one reads LKML itself (too big volume) so it is purely for
>>> archiving on lore.kernel.org for searching and for people's filters.
>>>
>>> Therefore unless someone here objects, I would prefer to Cc LKML as
>>> well. Anyway, netdev is important as it is tracked by patchwork.
> very well, It shall be done.
>>> As far as I can tell I am doing this for the device noted in nfc_dev.
>>> Could you elaborate?
>> I meant that it looks unusual that you don't do it for your own device
>> (client->dev) but for device allocated in different unit. Here, you
>> receive client->dev and mostly you should play only with it.
>>
>> While I am looking at this more, there is another issue actually - you
>> touch runtime PM of NFC/NCI core device but it's the NFC/NCI core who
>> should handle it's own runtime PM.
> =

> Well, I looked into that and that was very difficult. The NFC core has
> no idea what hardware it is running on. On my test hardware as far as
> I can tell, the power supply of my NFC hardware is just tied to
> the power supply of the i2c host controller, which is a PCI device.
> =

> It goes into D3cold when the i2c bus is not transferring anything.
> That makes it impossible to actually communicate over NFC.
> =

> However, at least on USB sending a device into USB suspend with
> remote wakeup should work. So I do not see how to put this into
> NFC core.

If I understand your case correctly, you have a tree of devices:
PCI I2C bus controller
 - NXP NFC I2C device
   - NFC NCI device

and the only thing you care is to make PCI I2C bus resumed all the time.
The simplest seems to add PM runtime to the NXP NFC I2C device (so
i2c.c) with get_noresume+active+enable.


Best regards,
Krzysztof
--===============0714376486685521676==--

