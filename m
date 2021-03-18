Content-Type: multipart/mixed; boundary="===============8826716617852278760=="
MIME-Version: 1.0
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2] tag: Implement readout of tag UID via DBus interface
Date: Thu, 18 Mar 2021 17:14:35 +0100
Message-ID: <e925f779-3be9-1d11-81ea-e8841f55381a@kontron.de>
In-Reply-To: <AM0P122MB011340CE87F73F55335D040C826B9@AM0P122MB0113.EURP122.PROD.OUTLOOK.COM>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8826716617852278760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fabian,

On 16.03.21 19:49, Gottstein, Fabian wrote:
> Hi Frieder,
> =

> thanks for the patch.

thanks for your feedback.

> =

> Could you please also consider the following situation:
> In the case of a NFC Tag Type 1, the identifier is delivered via the RID =
command (see NFC Digital Protocol). Thus, the Tag's nfcid property is updat=
ed in a later step.
> To inform the neard users, a property changed signal has to be emitted wh=
en nfcid has changed (in near_tag_set_nfcid). Also, a exists() handler for =
the new DBus property should be implemented.

I'm new to NFC and D-Bus, so I don't know much about what use-cases and =

requirements there are.

Your request sounds reasonable and I think I have a rough understanding =

of what is probably needed to implement this. Still to actually do this =

I need to look at the specifications and the code more closely and I =

don't know if/when I will find time to do this.

Also I don't have any hardware to test this with NFC type 1 tags.

> =

> Another thing regarding building the response message:
> The following code snippet could simplify and improve the readability of =
the usage of the dbus message builder:
> =

> dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY, DBUS_TYPE_BYTE_AS=
_STRING, &entry);
> dbus_message_iter_append_fixed_array(&entry, DBUS_TYPE_BYTE, &uid, len);
> dbus_message_iter_close_container(iter, &entry);
> =

Thanks for the improved code, I will use this instead.

Frieder

> =

> =

> -----Original Message-----
> From: Schrempf Frieder <frieder.schrempf@kontron.de>
> Sent: Dienstag, 16. M=C3=A4rz 2021 12:22
> To: Samuel Ortiz <sameo@linux.intel.com>; linux-nfc(a)lists.01.org
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Subject: [linux-nfc] [PATCH v2] tag: Implement readout of tag UID via DBu=
s interface
> =

> Caution: This e-mail originated from outside of Philips, be careful for p=
hishing.
> =

> =

> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> =

> NFC tags usually provide an unique identifier. Neard already checks if on=
e of the two types of identifiers is available, reads them from tags and st=
ores them in near_tag.nfcid or near_tag.iso15693_uid respectively.
> =

> Though currently it is not possible for any client application to get thi=
s information via the D-Bus interface as no property for the UID is impleme=
nted.
> =

> This adds a 'Uid' property to the D-Bus interface for tags, which exposes=
 the UID of the tag as byte array. If nfcid is available this is returned a=
s UID, otherwise if iso15693_uid is available this is returned. If no UID i=
s available, no 'Uid' property is exposed.
> =

> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> Changes in v2:
> * Add whitespaces after 'for' statements
> * Add more details to the commit message
> ---
>   src/tag.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 54 insertions(+), 3 deletions(-)
> =

> diff --git a/src/tag.c b/src/tag.c
> index 9eba4ee..d530893 100644
> --- a/src/tag.c
> +++ b/src/tag.c
> @@ -53,6 +53,7 @@ struct near_tag {
>          uint8_t nfcid_len;
> =

>          uint8_t iso15693_dsfid;
> +       uint8_t iso15693_uid_len;
>          uint8_t iso15693_uid[NFC_MAX_ISO15693_UID_LEN];
> =

>          size_t data_length;
> @@ -168,6 +169,29 @@ static const char *type_string(struct near_tag *tag)
>          return type;
>   }
> =

> +static const uint8_t uid_array(struct near_tag *tag, uint8_t **uid) {
> +       if (tag->nfcid_len) {
> +               DBG("NFCID: ");
> +               for (int i =3D 0; i < tag->nfcid_len; i++)
> +                       DBG("%x", tag->nfcid[i]);
> +
> +               *uid =3D tag->nfcid;
> +
> +               return tag->nfcid_len;
> +       } else if (tag->iso15693_uid_len) {
> +               DBG("ISO-UID: ");
> +               for (int i =3D 0; i < tag->iso15693_uid_len; i++)
> +                       DBG("%x", tag->iso15693_uid[i]);
> +
> +               *uid =3D tag->iso15693_uid;
> +
> +               return tag->iso15693_uid_len;
> +       }
> +
> +       return 0;
> +}
> +
>   static const char *protocol_string(struct near_tag *tag)  {
>          const char *protocol;
> @@ -219,6 +243,30 @@ static gboolean property_get_type(const GDBusPropert=
yTable *property,
>          return TRUE;
>   }
> =

> +static gboolean property_get_uid(const GDBusPropertyTable *property,
> +                                       DBusMessageIter *iter, void
> +*user_data) {
> +       struct near_tag *tag =3D user_data;
> +       DBusMessageIter entry;
> +       uint8_t *uid;
> +       uint8_t len;
> +
> +       len =3D uid_array(tag, &uid);
> +       if (!uid || !len)
> +               return FALSE;
> +
> +       dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY,
> +                                        "{y}", &entry);
> +
> +       for (int i =3D 0; i < len; i++)
> +               dbus_message_iter_append_basic(&entry, DBUS_TYPE_BYTE,
> +                                              (void *)&uid[i]);
> +
> +       dbus_message_iter_close_container(iter, &entry);
> +
> +       return TRUE;
> +}
> +
>   static gboolean property_get_protocol(const GDBusPropertyTable *propert=
y,
>                                          DBusMessageIter *iter, void *use=
r_data)  { @@ -526,6 +574,7 @@ static const GDBusPropertyTable tag_properti=
es[] =3D {
>          { "Protocol", "s", property_get_protocol },
>          { "ReadOnly", "b", property_get_readonly },
>          { "Adapter", "o", property_get_adapter },
> +       { "Uid", "ay", property_get_uid },
> =

>          { }
>   };
> @@ -671,8 +720,10 @@ static int tag_initialize(struct near_tag *tag,
>          if (nfcid_len && nfcid_len <=3D NFC_MAX_NFCID1_LEN) {
>                  tag->nfcid_len =3D nfcid_len;
>                  memcpy(tag->nfcid, nfcid, nfcid_len);
> -       } else if (iso15693_uid_len) {
> +       } else if (iso15693_uid_len &&
> +                  iso15693_uid_len <=3D NFC_MAX_ISO15693_UID_LEN) {
>                  tag->iso15693_dsfid =3D iso15693_dsfid;
> +               tag->iso15693_uid_len =3D iso15693_uid_len;
>                  memcpy(tag->iso15693_uid, iso15693_uid, iso15693_uid_len=
);
>          }
> =

> @@ -837,11 +888,11 @@ uint8_t *near_tag_get_iso15693_uid(uint32_t adapter=
_idx, uint32_t target_idx)
>          if (!tag)
>                  goto fail;
> =

> -       iso15693_uid =3D g_try_malloc0(NFC_MAX_ISO15693_UID_LEN);
> +       iso15693_uid =3D g_try_malloc0(tag->iso15693_uid_len);
>          if (!iso15693_uid)
>                  goto fail;
> =

> -       memcpy(iso15693_uid, tag->iso15693_uid, NFC_MAX_ISO15693_UID_LEN);
> +       memcpy(iso15693_uid, tag->iso15693_uid, tag->iso15693_uid_len);
> =

>          return iso15693_uid;
> =

> --
> 2.25.1
> _______________________________________________
> Linux-nfc mailing list -- linux-nfc(a)lists.01.org To unsubscribe send an=
 email to linux-nfc-leave(a)lists.01.org %(web_page_url)slistinfo%(cgiext)s=
/%(_internal_name)s
> =

> ________________________________
> The information contained in this message may be confidential and legally=
 protected under applicable law. The message is intended solely for the add=
ressee(s). If you are not the intended recipient, you are hereby notified t=
hat any use, forwarding, dissemination, or reproduction of this message is =
strictly prohibited and may be unlawful. If you are not the intended recipi=
ent, please contact the sender by return e-mail and destroy all copies of t=
he original message.
>=20
--===============8826716617852278760==--

