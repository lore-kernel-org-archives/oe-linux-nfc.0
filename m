Content-Type: multipart/mixed; boundary="===============5810062084206873536=="
MIME-Version: 1.0
From: Gottstein, Fabian <fabian.gottstein@philips.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2] tag: Implement readout of tag UID via DBus interface
Date: Tue, 16 Mar 2021 18:49:37 +0000
Message-ID: <
 <AM0P122MB011340CE87F73F55335D040C826B9@AM0P122MB0113.EURP122.PROD.OUTLOOK.COM>>
In-Reply-To: <20210316112210.50100-1-frieder.schrempf@kontron.de>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5810062084206873536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Frieder,

thanks for the patch.

Could you please also consider the following situation:
In the case of a NFC Tag Type 1, the identifier is delivered via the RID co=
mmand (see NFC Digital Protocol). Thus, the Tag's nfcid property is updated=
 in a later step.
To inform the neard users, a property changed signal has to be emitted when=
 nfcid has changed (in near_tag_set_nfcid). Also, a exists() handler for th=
e new DBus property should be implemented.

Another thing regarding building the response message:
The following code snippet could simplify and improve the readability of th=
e usage of the dbus message builder:

dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY, DBUS_TYPE_BYTE_AS_S=
TRING, &entry);
dbus_message_iter_append_fixed_array(&entry, DBUS_TYPE_BYTE, &uid, len);
dbus_message_iter_close_container(iter, &entry);


Best Regards
Fabian


-----Original Message-----
From: Schrempf Frieder <frieder.schrempf@kontron.de>
Sent: Dienstag, 16. M=C3=A4rz 2021 12:22
To: Samuel Ortiz <sameo@linux.intel.com>; linux-nfc(a)lists.01.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [linux-nfc] [PATCH v2] tag: Implement readout of tag UID via DBus =
interface

Caution: This e-mail originated from outside of Philips, be careful for phi=
shing.


From: Frieder Schrempf <frieder.schrempf@kontron.de>

NFC tags usually provide an unique identifier. Neard already checks if one =
of the two types of identifiers is available, reads them from tags and stor=
es them in near_tag.nfcid or near_tag.iso15693_uid respectively.

Though currently it is not possible for any client application to get this =
information via the D-Bus interface as no property for the UID is implement=
ed.

This adds a 'Uid' property to the D-Bus interface for tags, which exposes t=
he UID of the tag as byte array. If nfcid is available this is returned as =
UID, otherwise if iso15693_uid is available this is returned. If no UID is =
available, no 'Uid' property is exposed.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes in v2:
* Add whitespaces after 'for' statements
* Add more details to the commit message
---
 src/tag.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/src/tag.c b/src/tag.c
index 9eba4ee..d530893 100644
--- a/src/tag.c
+++ b/src/tag.c
@@ -53,6 +53,7 @@ struct near_tag {
        uint8_t nfcid_len;

        uint8_t iso15693_dsfid;
+       uint8_t iso15693_uid_len;
        uint8_t iso15693_uid[NFC_MAX_ISO15693_UID_LEN];

        size_t data_length;
@@ -168,6 +169,29 @@ static const char *type_string(struct near_tag *tag)
        return type;
 }

+static const uint8_t uid_array(struct near_tag *tag, uint8_t **uid) {
+       if (tag->nfcid_len) {
+               DBG("NFCID: ");
+               for (int i =3D 0; i < tag->nfcid_len; i++)
+                       DBG("%x", tag->nfcid[i]);
+
+               *uid =3D tag->nfcid;
+
+               return tag->nfcid_len;
+       } else if (tag->iso15693_uid_len) {
+               DBG("ISO-UID: ");
+               for (int i =3D 0; i < tag->iso15693_uid_len; i++)
+                       DBG("%x", tag->iso15693_uid[i]);
+
+               *uid =3D tag->iso15693_uid;
+
+               return tag->iso15693_uid_len;
+       }
+
+       return 0;
+}
+
 static const char *protocol_string(struct near_tag *tag)  {
        const char *protocol;
@@ -219,6 +243,30 @@ static gboolean property_get_type(const GDBusPropertyT=
able *property,
        return TRUE;
 }

+static gboolean property_get_uid(const GDBusPropertyTable *property,
+                                       DBusMessageIter *iter, void
+*user_data) {
+       struct near_tag *tag =3D user_data;
+       DBusMessageIter entry;
+       uint8_t *uid;
+       uint8_t len;
+
+       len =3D uid_array(tag, &uid);
+       if (!uid || !len)
+               return FALSE;
+
+       dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY,
+                                        "{y}", &entry);
+
+       for (int i =3D 0; i < len; i++)
+               dbus_message_iter_append_basic(&entry, DBUS_TYPE_BYTE,
+                                              (void *)&uid[i]);
+
+       dbus_message_iter_close_container(iter, &entry);
+
+       return TRUE;
+}
+
 static gboolean property_get_protocol(const GDBusPropertyTable *property,
                                        DBusMessageIter *iter, void *user_d=
ata)  { @@ -526,6 +574,7 @@ static const GDBusPropertyTable tag_properties[=
] =3D {
        { "Protocol", "s", property_get_protocol },
        { "ReadOnly", "b", property_get_readonly },
        { "Adapter", "o", property_get_adapter },
+       { "Uid", "ay", property_get_uid },

        { }
 };
@@ -671,8 +720,10 @@ static int tag_initialize(struct near_tag *tag,
        if (nfcid_len && nfcid_len <=3D NFC_MAX_NFCID1_LEN) {
                tag->nfcid_len =3D nfcid_len;
                memcpy(tag->nfcid, nfcid, nfcid_len);
-       } else if (iso15693_uid_len) {
+       } else if (iso15693_uid_len &&
+                  iso15693_uid_len <=3D NFC_MAX_ISO15693_UID_LEN) {
                tag->iso15693_dsfid =3D iso15693_dsfid;
+               tag->iso15693_uid_len =3D iso15693_uid_len;
                memcpy(tag->iso15693_uid, iso15693_uid, iso15693_uid_len);
        }

@@ -837,11 +888,11 @@ uint8_t *near_tag_get_iso15693_uid(uint32_t adapter_i=
dx, uint32_t target_idx)
        if (!tag)
                goto fail;

-       iso15693_uid =3D g_try_malloc0(NFC_MAX_ISO15693_UID_LEN);
+       iso15693_uid =3D g_try_malloc0(tag->iso15693_uid_len);
        if (!iso15693_uid)
                goto fail;

-       memcpy(iso15693_uid, tag->iso15693_uid, NFC_MAX_ISO15693_UID_LEN);
+       memcpy(iso15693_uid, tag->iso15693_uid, tag->iso15693_uid_len);

        return iso15693_uid;

--
2.25.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc(a)lists.01.org To unsubscribe send an e=
mail to linux-nfc-leave(a)lists.01.org %(web_page_url)slistinfo%(cgiext)s/%=
(_internal_name)s

________________________________
The information contained in this message may be confidential and legally p=
rotected under applicable law. The message is intended solely for the addre=
ssee(s). If you are not the intended recipient, you are hereby notified tha=
t any use, forwarding, dissemination, or reproduction of this message is st=
rictly prohibited and may be unlawful. If you are not the intended recipien=
t, please contact the sender by return e-mail and destroy all copies of the=
 original message.
--===============5810062084206873536==--

