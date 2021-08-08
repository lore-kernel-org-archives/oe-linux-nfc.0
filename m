Content-Type: multipart/mixed; boundary="===============3048498410526549857=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2] tag: Implement readout of tag UID via DBus interface
Date: Sat, 07 Aug 2021 18:55:32 -0700
Message-ID: <20210808015532.GE124928@animalcreek.com>
In-Reply-To: <e925f779-3be9-1d11-81ea-e8841f55381a@kontron.de>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3048498410526549857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 18, 2021 at 05:14:35PM +0100, Frieder Schrempf wrote:
> Hi Fabian,
> =

> On 16.03.21 19:49, Gottstein, Fabian wrote:
> > Hi Frieder,
> > =

> > thanks for the patch.
> =

> thanks for your feedback.
> =

> > =

> > Could you please also consider the following situation:
> > In the case of a NFC Tag Type 1, the identifier is delivered via the RI=
D command (see NFC Digital Protocol). Thus, the Tag's nfcid property is upd=
ated in a later step.
> > To inform the neard users, a property changed signal has to be emitted =
when nfcid has changed (in near_tag_set_nfcid). Also, a exists() handler fo=
r the new DBus property should be implemented.
> =

> I'm new to NFC and D-Bus, so I don't know much about what use-cases and
> requirements there are.
> =

> Your request sounds reasonable and I think I have a rough understanding of
> what is probably needed to implement this. Still to actually do this I ne=
ed
> to look at the specifications and the code more closely and I don't know
> if/when I will find time to do this.
> =

> Also I don't have any hardware to test this with NFC type 1 tags.
> =

> > =

> > Another thing regarding building the response message:
> > The following code snippet could simplify and improve the readability o=
f the usage of the dbus message builder:
> > =

> > dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY, DBUS_TYPE_BYTE_=
AS_STRING, &entry);
> > dbus_message_iter_append_fixed_array(&entry, DBUS_TYPE_BYTE, &uid, len);
> > dbus_message_iter_close_container(iter, &entry);
> > =

> Thanks for the improved code, I will use this instead.
> =

> Frieder

Hi Frieder.

Do you have an updated version of this patch (or did I miss it)?

Thanks,

Mark
--
--===============3048498410526549857==--

