Content-Type: multipart/mixed; boundary="===============1166849776382852574=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] tag: Implement readout of tag UID via DBus interface
Date: Thu, 11 Mar 2021 18:21:40 -0700
Message-ID: <20210312012140.GA316619@animalcreek.com>
In-Reply-To: <20210311085020.429987-1-frieder.schrempf@kontron.de>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1166849776382852574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 09:50:20AM +0100, Schrempf Frieder wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>

Hi Frieder.

I am supposed to be taking over neard maintenance but I have been
completely derelict in my duties.  I need to refresh my brain's
cache and look at your patch in more detail.  In the meantime,
I have a few minor comments below.

> =

> This adds a 'Uid' property to the DBus interface for tags, which
> returns the UID of the tag as byte array.

Please add more high-level information to this commit description.
For example, what problem does it solve and how does it solve it?
Something that we can look back at in 5 years and be satisfied that
it solved a problem, that it solved the problem in reasonable way,
and that it was a change worth incorporating.

> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  src/tag.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 54 insertions(+), 3 deletions(-)
> =

> diff --git a/src/tag.c b/src/tag.c
> index 9eba4ee..2039e48 100644
> --- a/src/tag.c
> +++ b/src/tag.c
> @@ -53,6 +53,7 @@ struct near_tag {
>  	uint8_t nfcid_len;
>  =

>  	uint8_t iso15693_dsfid;
> +	uint8_t iso15693_uid_len;
>  	uint8_t iso15693_uid[NFC_MAX_ISO15693_UID_LEN];
>  =

>  	size_t data_length;
> @@ -168,6 +169,29 @@ static const char *type_string(struct near_tag *tag)
>  	return type;
>  }
>  =

> +static const uint8_t uid_array(struct near_tag *tag, uint8_t **uid)
> +{
> +	if (tag->nfcid_len) {
> +		DBG("NFCID: ");
> +		for(int i =3D 0; i < tag->nfcid_len; i++)
                  ^^
nit: Please put a space between the 'for' and the "('.

> +			DBG("%x", tag->nfcid[i]);
> +
> +		*uid =3D tag->nfcid;
> +
> +		return tag->nfcid_len;
> +	} else if (tag->iso15693_uid_len) {
> +		DBG("ISO-UID: ");
> +		for(int i =3D 0; i < tag->iso15693_uid_len; i++)
                  ^^
nit: Please put a space between the 'for' and the "('.

Thanks,

Mark
--
--===============1166849776382852574==--

