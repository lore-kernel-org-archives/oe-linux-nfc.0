Content-Type: multipart/mixed; boundary="===============1891415581817140159=="
MIME-Version: 1.0
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] tag: Implement readout of tag UID via DBus interface
Date: Tue, 16 Mar 2021 09:53:21 +0100
Message-ID: <baa083e3-0f3c-6038-7b0b-f1c576d8f200@kontron.de>
In-Reply-To: <20210312012140.GA316619@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1891415581817140159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On 12.03.21 02:21, Mark Greer wrote:
> On Thu, Mar 11, 2021 at 09:50:20AM +0100, Schrempf Frieder wrote:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> =

> Hi Frieder.
> =

> I am supposed to be taking over neard maintenance but I have been
> completely derelict in my duties.  I need to refresh my brain's
> cache and look at your patch in more detail.  In the meantime,
> I have a few minor comments below.

Good to hear that you are planning to take over maintainership. I was a =

bit worried to see neard being abandoned.

I also recently found out that Qt has abandoned their support for neard =

in Qt 6 [1], which means that Qt 5.15 is the last version to offer =

integration with neard.

I think that's very unfortunate as this provided a nice and mainline-ish =

stack for NFC devices from the kernel up to the application layer. I =

don't know the reasons for this decision, but neard looking like it is =

not maintained anymore is maybe one of them.

[1] https://bugreports.qt.io/browse/QTBUG-81824

> =

>>
>> This adds a 'Uid' property to the DBus interface for tags, which
>> returns the UID of the tag as byte array.
> =

> Please add more high-level information to this commit description.
> For example, what problem does it solve and how does it solve it?
> Something that we can look back at in 5 years and be satisfied that
> it solved a problem, that it solved the problem in reasonable way,
> and that it was a change worth incorporating.

Ok, I will improve the description to provide more information about =

what this does.

> =

>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>>   src/tag.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 54 insertions(+), 3 deletions(-)
>>
>> diff --git a/src/tag.c b/src/tag.c
>> index 9eba4ee..2039e48 100644
>> --- a/src/tag.c
>> +++ b/src/tag.c
>> @@ -53,6 +53,7 @@ struct near_tag {
>>   	uint8_t nfcid_len;
>>   =

>>   	uint8_t iso15693_dsfid;
>> +	uint8_t iso15693_uid_len;
>>   	uint8_t iso15693_uid[NFC_MAX_ISO15693_UID_LEN];
>>   =

>>   	size_t data_length;
>> @@ -168,6 +169,29 @@ static const char *type_string(struct near_tag *tag)
>>   	return type;
>>   }
>>   =

>> +static const uint8_t uid_array(struct near_tag *tag, uint8_t **uid)
>> +{
>> +	if (tag->nfcid_len) {
>> +		DBG("NFCID: ");
>> +		for(int i =3D 0; i < tag->nfcid_len; i++)
>                    ^^
> nit: Please put a space between the 'for' and the "('.

Sure

> =

>> +			DBG("%x", tag->nfcid[i]);
>> +
>> +		*uid =3D tag->nfcid;
>> +
>> +		return tag->nfcid_len;
>> +	} else if (tag->iso15693_uid_len) {
>> +		DBG("ISO-UID: ");
>> +		for(int i =3D 0; i < tag->iso15693_uid_len; i++)
>                    ^^
> nit: Please put a space between the 'for' and the "('.

Sure

Thanks
Frieder
--===============1891415581817140159==--

