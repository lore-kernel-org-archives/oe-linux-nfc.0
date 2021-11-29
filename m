Content-Type: multipart/mixed; boundary="===============4535917895915564427=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] [neard][RFC] test: Convert Python2 scripts to Python3
Date: Sun, 28 Nov 2021 21:15:36 -0700
Message-ID: <20211129041536.GA830560@animalcreek.com>
In-Reply-To: <65c7b6ca-c1f6-6557-1b54-f8f666e3a5bf@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4535917895915564427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 12:35:07PM +0200, Krzysztof Kozlowski wrote:
> On 08/08/2021 04:20, Mark Greer wrote:
> > Python2 is deprecated so convert the neard test scripts, which are
> > Python2, to Python3.
> > =

> > Signed-off-by: Mark Greer <mgreer@animalcreek.com>
> > ---
> > This is a first pass at converting the python scripts to Python3.
> > Not a lot of testing yet.  It appears that the 'gobject' is not
> > available anymore so I have to look into how to rework the code that
> > uses it.
> > =

> > I would appreciate any testing that you are willing to provide.
> > =

> > Also available at:
> > 	https://github.com/linux-nfc/neard/tree/mag/python3-ize
> > =

> >  se/test/test-channel     | 18 +++++------
> >  se/test/test-seel        | 38 +++++++++++-----------
> >  test/bt-handover         |  8 ++---
> >  test/handover-agent      | 34 +++++++++----------
> >  test/monitor-near        |  8 ++---
> >  test/ndef-agent          | 20 ++++++------
> >  test/neard-ui.py         | 70 ++++++++++++++++++++--------------------
> >  test/neardutils.py       | 14 ++++----
> >  test/phdc-simple-manager | 50 ++++++++++++++--------------
> >  test/test-adapter        | 16 ++++-----
> >  test/test-device         | 34 +++++++++----------
> >  test/test-tag            | 10 +++---
> >  12 files changed, 160 insertions(+), 160 deletions(-)
> > =

> =

> Few tests:
> ------------
> $ sudo python3 ./test/test-adapter poll nfc0 on
> Traceback (most recent call last):
>   File "./test/test-adapter", line 92, in <module>
>     adapter.StartPollLoop(mode)
>   File "/usr/lib/python3/dist-packages/dbus/proxies.py", line 72, in
> __call__
>     return self._proxy_method(*args, **keywords)
>   File "/usr/lib/python3/dist-packages/dbus/proxies.py", line 141, in
> __call__
>     return self._connection.call_blocking(self._named_service,
>   File "/usr/lib/python3/dist-packages/dbus/connection.py", line 652, in
> call_blocking
>     reply_message =3D self.send_message_with_reply_and_block(
> dbus.exceptions.DBusException: org.neard.Error.Failed: No such device
> =

> During handling of the above exception, another exception occurred:
> =

> Traceback (most recent call last):
>   File "./test/test-adapter", line 94, in <module>
>     print("%s: %s" % (error._dbus_error_name, error.message))
> AttributeError: 'DBusException' object has no attribute 'message'
> ------------

This looks like you may not have installed the necessary dbus support
(e.g., src/org.neard.conf).  After building neard, you can install this
with:

$ sudo make install

If that isn't it, I'll need more info about your environment because I
don't get those errors.  To make sure we're on the same page, these steps
should get you going (this example on an amd64 running Ubuntu 20.04):

$ ./bootstrap-configure
$ make
$ sudo make install

<now insert your nfc hardware (a pn533 in this case)>

$ test/test-adapter list  # no need for sudo
 [ /org/neard/nfc0 ]
    Protocols =3D [ Felica MIFARE Jewel ISO-DEP NFC-DEP ]
    Mode =3D Idle
    Polling =3D false
    Powered =3D false
$ test/test-adapter powered nfc0 on
$ test/test-adapter list
 [ /org/neard/nfc0 ]
    Protocols =3D [ Felica MIFARE Jewel ISO-DEP NFC-DEP ]
    Mode =3D Idle
    Polling =3D false
    Powered =3D true
$ test/test-adapter poll nfc0 on Initiator
$ test/test-adapter list
 [ /org/neard/nfc0 ]
    Protocols =3D [ Felica MIFARE Jewel ISO-DEP NFC-DEP ]
    Mode =3D Idle
    Polling =3D true
    Powered =3D true

<now more a tag within range>

$ test/test-adapter list
 [ /org/neard/nfc0 ]
    Protocols =3D [ Felica MIFARE Jewel ISO-DEP NFC-DEP ]
    Mode =3D Initiator
    Polling =3D false
    Powered =3D true
$ test/test-tag list
 [ /org/neard/nfc0/tag0 ]
    Protocol =3D MIFARE
    ReadOnly =3D false
    Type =3D Type 2
    Adapter =3D /org/neard/nfc0
$ test/test-tag write /org/neard/nfc0/tag0 Text UTF-8 en-US "Hello World"
$ test/test-tag dump
[ /org/neard/nfc0/tag0 ]
  [ /org/neard/nfc0/tag0/record1 ]
      Representation =3D Hello World
      Type =3D Text
      Language =3D en-US
      Encoding =3D UTF-8

<move tag out of range>

$ test/test-tag dump
$ test/test-tag list
$ test/test-adapter list
 [ /org/neard/nfc0 ]
    Protocols =3D [ Felica MIFARE Jewel ISO-DEP NFC-DEP ]
    Mode =3D Idle
    Polling =3D false
    Powered =3D true

<you have to poll again to read/write again and it should be called nfc1>

> Others:
> ------------
> sudo python3 ./test/test-device
>   File "./test/test-device", line 76
>     usage()
>           ^
> TabError: inconsistent use of tabs and spaces in indentation
> ------------
> sudo python3 ./test/phdc-simple-manager
>   File "./test/phdc-simple-manager", line 60
>     print('Init PhdcPeerManager thread')
>                                        ^
> TabError: inconsistent use of tabs and spaces in indentation
> ------------

Not a py3-specific issue but I will fix this and other formatting issues.

> > diff --git a/test/neard-ui.py b/test/neard-ui.py
> > index cf4bb13c5155..91f8e6bbaa6a 100755
> > --- a/test/neard-ui.py
> > +++ b/test/neard-ui.py
> > @@ -1,4 +1,4 @@
> > -#!/usr/bin/env python
> > +#!/usr/bin/env python3
> >  =

> >  import pdb
> >  import sys
> > @@ -18,12 +18,12 @@ import neardutils
> >  class Neard:
> >  =

> >      def interface_Added(self, path, interface):
> > -        print (" New interface added: %s") % path
> > +        print((" New interface added: %s") % path)
> =

> =

> Instead:
> print(" New interface added: %s" % path)

Will fix all of these.

> > @@ -42,7 +42,7 @@ class Neard:
> >                                      dbus_interface=3D"org.freedesktop.=
DBus.ObjectManager",
> >                                      signal_name=3D"InterfacesRemoved")
> >          except:
> > -            print ("Can't connect to org.freedesktop.DBus.ObjectManage=
r");
> > +            print(("Can't connect to org.freedesktop.DBus.ObjectManage=
r"));
> =

> Double ((

Will fix all of these.

> > @@ -57,26 +57,26 @@ def quotechars( chars ):
> >  class PhdcPeerManager:
> >      def __init__(self, agent_fd):
> >  	#Grab the agent ....
> > -	print 'Init PhdcPeerManager thread'
> > +	print('Init PhdcPeerManager thread')
> >  	self.r_fd =3D agent_fd.take()
> > -	print 'Agent fd:', str(self.r_fd)
> > +	print('Agent fd:', str(self.r_fd))
> >  =

> >      def run( self):
> > -	print 'Run PhdcPeerManager thread: ', str(self.r_fd)
> > +	print('Run PhdcPeerManager thread: ', str(self.r_fd))
> >  	self.sock =3D socket.fromfd(self.r_fd, AF_NFC, socket.SOCK_STREAM)
> >          try:
> >              while True:
> >  		miu =3D self.sock.getsockopt(SOL_NFC, NFC_LLCP_MIUX)
> > -		print 'MIU=3D', miu
> > +		print('MIU=3D', miu)
> =

> Mixed up indentation but I guess the issue was here before.

Looks like an artifact of tabs vs. spaces.  I'll fix that and other
formatting issues.

> Best regards,
> Krzysztof

Thanks for the review.

Mark
--
--===============4535917895915564427==--

