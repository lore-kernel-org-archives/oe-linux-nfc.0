Content-Type: multipart/mixed; boundary="===============6926012623801022356=="
MIME-Version: 1.0
From: Oliver Neukum <oneukum@suse.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] NFC: NCI: make parent aware in PM terms
Date: Mon, 23 Aug 2021 13:52:40 +0200
Message-ID: <b9d1fd42-290e-e60e-92a0-5f0cf3003f90@suse.com>
In-Reply-To: <9219eca0-d6e9-5cec-3113-995743549332@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6926012623801022356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 23.08.21 13:29, Krzysztof Kozlowski wrote:
> On 23/08/2021 12:50, Oliver Neukum wrote:
>> On 19.08.21 16:45, Krzysztof Kozlowski wrote


Hi,

>> I personally like it a lot because I have filters organized with it.
>> Nowadays no one reads LKML itself (too big volume) so it is purely for
>> archiving on lore.kernel.org for searching and for people's filters.
>>
>> Therefore unless someone here objects, I would prefer to Cc LKML as
>> well. Anyway, netdev is important as it is tracked by patchwork.
very well, It shall be done.
>> As far as I can tell I am doing this for the device noted in nfc_dev.
>> Could you elaborate?
> I meant that it looks unusual that you don't do it for your own device
> (client->dev) but for device allocated in different unit. Here, you
> receive client->dev and mostly you should play only with it.
>
> While I am looking at this more, there is another issue actually - you
> touch runtime PM of NFC/NCI core device but it's the NFC/NCI core who
> should handle it's own runtime PM.

Well, I looked into that and that was very difficult. The NFC core has
no idea what hardware it is running on. On my test hardware as far as
I can tell, the power supply of my NFC hardware is just tied to
the power supply of the i2c host controller, which is a PCI device.

It goes into D3cold when the i2c bus is not transferring anything.
That makes it impossible to actually communicate over NFC.

However, at least on USB sending a device into USB suspend with
remote wakeup should work. So I do not see how to put this into
NFC core.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

--===============6926012623801022356==--

