Content-Type: multipart/mixed; boundary="===============3199976511874904507=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2 3/6] test: Reformat Python test scripts
Date: Mon, 06 Dec 2021 10:10:52 -0700
Message-ID: <20211206171052.GA234718@animalcreek.com>
In-Reply-To: <5664bce3-2c4e-3cc9-0f9c-40f80f207b8f@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3199976511874904507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof.

On Wed, Dec 01, 2021 at 10:13:55AM +0100, Krzysztof Kozlowski wrote:
> On 29/11/2021 06:06, Mark Greer wrote:
> > Reformat the Python-based test scripts using the "Prettier"
> > beautifiers (default options). This brings the code closer to
> > conformance with the PEP 8 style guide.
> > =

> > Signed-off-by: Mark Greer <mgreer@animalcreek.com>
> > ---
> >  test/bt-handover         | 249 ++++++++++++++++++--------------
> >  test/handover-agent      | 284 +++++++++++++++++++++---------------
> >  test/monitor-near        |  76 +++++-----
> >  test/ndef-agent          | 112 +++++++--------
> >  test/neard-ui.py         | 304 +++++++++++++++++++++------------------
> >  test/neardutils.py       | 138 ++++++++++--------
> >  test/phdc-simple-manager | 228 +++++++++++++++--------------
> >  test/test-adapter        | 156 ++++++++++----------
> >  test/test-device         | 218 ++++++++++++++++------------
> >  test/test-tag            | 204 +++++++++++++-------------
> >  10 files changed, 1076 insertions(+), 893 deletions(-)
> > =

> > diff --git a/test/bt-handover b/test/bt-handover
> > index eebae9338e00..468e58cb18a8 100755
> > --- a/test/bt-handover
> > +++ b/test/bt-handover
> > @@ -13,119 +13,152 @@ from dbus.lowlevel import MethodCallMessage, HAND=
LER_RESULT_NOT_YET_HANDLED
> >  =

> >  mainloop =3D gobject.MainLoop()
> >  =

> > -def device_added(path, interfaces):
> > -        for iface, props in interfaces.items():
> > -                if "org.neard.Device" in interfaces:
> > -                        print("Pairing with %s" % (path))
> > -                        device =3D dbus.Interface(bus.get_object("org.=
neard", path),
> > -                                                        "org.neard.Dev=
ice")
> > -                        device.Push(({ "Type" : "Handover", "Carrier" =
: "bluetooth"}))
> > -                        break
> > -
> > -def device_removed(path, interfaces):
> > -        for iface in interfaces:
> > -                if "org.neard.Device" in interfaces:
> > -                        print("Lost device %s" % (path))
> > -                        mainloop.quit()
> > -                        break
> > -
> > -def remove_paired_devices(bt_adapter):
> > -        manager =3D dbus.Interface(bus.get_object("org.bluez", "/"),
> > -                                        "org.freedesktop.DBus.ObjectMa=
nager")
> > -        objects =3D manager.GetManagedObjects()
> >  =

> > -        all_adapters =3D (path for path, interfaces in objects.items()=
 if
> > -                                "org.bluez.Adapter1" in interfaces.key=
s()
> > -                                and path.endswith(bt_adapter))
> > -
> > -        bluez_adapter =3D None
> > -        for adapter in sorted(all_adapters):
> > -                bluez_adapter =3D dbus.Interface(bus.get_object("org.b=
luez",
> > -                                                        adapter),
> > -                                                        "org.bluez.Ada=
pter1")
> > -                break
> > -
> =

> Which tool did you use?

I used "Prettier".  I'll try autopep8.

> The autopep8 produces different results, which
> look more readable in argument alignment:
> =

> --- a/test/bt-handover
> =

> +++ b/test/bt-handover
> =

> @@ -18,9 +18,8 @@ def device_added(path, interfaces):
> =

>      for iface, props in interfaces.items():
> =

>          if "org.neard.Device" in interfaces:
> =

>              print("Pairing with %s" % (path))
> =

> -            device =3D dbus.Interface(
> =

> -                bus.get_object("org.neard", path), "org.neard.Device"
> =

> -            )
> =

> +            device =3D dbus.Interface(bus.get_object("org.neard", path),
> =

> +                                    "org.neard.Device")
> =

>              device.Push(({"Type": "Handover", "Carrier": "bluetooth"}))
> =

>              break
> =

> =

> =

> Or in array elements:
> =

>      tag =3D neardutils.find_tag(sys.argv[2])
> =

> =

> =

>      if sys.argv[3] in ["Text"]:
> =

> -        tag.Write(
> =

> -            (
> =

> -                {
> =

> -                    "Type": "Text",
> =

> +        tag.Write(({"Type": "Text",
> =

>                      "Encoding": sys.argv[4],
> =

>                      "Language": sys.argv[5],
> =

> -                    "Representation": sys.argv[6],
> =

> -                }
> =

> -            )
> =

> -        )
> =

> +                    "Representation": sys.argv[6]}))
> =

> =

> =

>      elif sys.argv[3] =3D=3D "URI":
> =

>          write_uri(sys.argv[4:])
> =

> =

> =

> The only trouble with autopep8 is that it puts every, even simple, if
> with parentheses:
> =

> -if sys.argv[1] =3D=3D "write":
> =

> -    if len(sys.argv) < 5:
> =

> +if (sys.argv[1] =3D=3D "write"):
> =

> +    if (len(sys.argv) < 5):
> =

>          usage()

Some time ago I thought I read that pep8 recommends using parentheses in
all if-statement expressions but now I can't find it.

> However existing code already had such syntax in few places.

I've never seen a beautifier that did it all the way that I liked but
consistency is good so I'll check use autopep8 and resubmit.

Mark
--
--===============3199976511874904507==--

