Content-Type: multipart/mixed; boundary="===============7360870516417872868=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] nfc: mrvl: remove useless "continue" at end of loop
Date: Wed, 02 Jun 2021 13:10:16 +0200
Message-ID: <c3641235-6cd0-99dc-2e4b-c61875bdb52c@canonical.com>
In-Reply-To: <5780056e09dbbd285d470a313939e5d3cc1a0c3e.camel@perches.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7360870516417872868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/06/2021 18:30, Joe Perches wrote:
> On Tue, 2021-06-01 at 18:07 +0200, Krzysztof Kozlowski wrote:
>> The "continue" statement at the end of a for loop does not have an
>> effect.
> []
>> diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
> []
>> @@ -325,7 +325,6 @@ static int nfcmrvl_probe(struct usb_interface *intf,
>> =C2=A0		if (!drv_data->bulk_rx_ep &&
>> =C2=A0		    usb_endpoint_is_bulk_in(ep_desc)) {
>> =C2=A0			drv_data->bulk_rx_ep =3D ep_desc;
>> -			continue;
>> =C2=A0		}
>> =C2=A0	}
> =

> I think this code would be clearer with an if/else instead of
> multiple continues.

Makes sense. I'll send a v2.


Best regards,
Krzysztof
--===============7360870516417872868==--

