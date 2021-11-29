Content-Type: multipart/mixed; boundary="===============9076792527138063899=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 5/6] se: Convert SE test script from Python2 to Python3
Date: Sun, 28 Nov 2021 22:06:05 -0700
Message-ID: <20211129050606.873494-6-mgreer@animalcreek.com>
In-Reply-To: <20211129050606.873494-1-mgreer@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============9076792527138063899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Python2 is deprecated so convert the SE test scripts, which are
Python2, to Python3.

Signed-off-by: Mark Greer <mgreer@animalcreek.com>
---
 se/test/test-channel | 18 +++++++++---------
 se/test/test-seel    | 38 +++++++++++++++++++-------------------
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/se/test/test-channel b/se/test/test-channel
index 5fa9b7e7fc41..52af1b38e937 100755
--- a/se/test/test-channel
+++ b/se/test/test-channel
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 =

 import sys
 import dbus
@@ -9,10 +9,10 @@ def extract_byte_array(byte_array):
         return ' '.join("{:02x}".format(byte) for byte in byte_array)
 =

 def usage():
-        print "Usage: %s <command>" % (sys.argv[0])
-        print ""
-        print "  list"
-        print "  send_apdu se/nfcX_<se_type>_seX channelX <apdu>"
+        print("Usage: %s <command>" % (sys.argv[0]))
+        print("")
+        print("  list")
+        print("  send_apdu se/nfcX_<se_type>_seX channelX <apdu>")
         sys.exit(1)
 =

 if (len(sys.argv) < 2):
@@ -29,7 +29,7 @@ if (sys.argv[1] =3D=3D "list"):
                 properties =3D seel.GetProperties()
 =

                 for path in properties["Channels"]:
-                        print "[ %s ]" % (path)
+                        print("[ %s ]" % (path))
 =

                         channel =3D dbus.Interface(bus.get_object("org.nea=
rd.se", path),
                                                 "org.neard.se.Channel")
@@ -41,10 +41,10 @@ if (sys.argv[1] =3D=3D "list"):
                                                 val =3D "true"
                                         else:
                                                 val =3D "false"
-                                        print "    %s =3D %s" % (key, val)
+                                        print("    %s =3D %s" % (key, val))
 =

                                 if key in ["AID"]:
-                                        print "    %s =3D %s" % (key, extr=
act_byte_array(properties[key]))
+                                        print("    %s =3D %s" % (key, extr=
act_byte_array(properties[key])))
         sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "send_apdu"):
@@ -58,7 +58,7 @@ if (sys.argv[1] =3D=3D "send_apdu"):
 =

                 response =3D channel.SendAPDU(sys.argv[4].decode("hex"))
 =

-                print "--> %s" % extract_byte_array(response)
+                print("--> %s" % extract_byte_array(response))
         sys.exit(0)
 =

 usage()
diff --git a/se/test/test-seel b/se/test/test-seel
index 16c797dbc6fc..f3df3e7a7b95 100755
--- a/se/test/test-seel
+++ b/se/test/test-seel
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 =

 import sys
 import dbus
@@ -13,12 +13,12 @@ def extract_list(list):
         return val
 =

 def usage():
-        print "Usage: %s <command>" % (sys.argv[0])
-        print ""
-        print "  list"
-        print "  enabled se/nfcX_<se_type>_seX [on/off]"
-        print "  open_channel se/nfcX_<se_type>_seX <AID>"
-        print "  close_channel se/nfcX_<se_type>_seX channelX"
+        print("Usage: %s <command>" % (sys.argv[0]))
+        print("")
+        print("  list")
+        print("  enabled se/nfcX_<se_type>_seX [on/off]")
+        print("  open_channel se/nfcX_<se_type>_seX <AID>")
+        print("  close_channel se/nfcX_<se_type>_seX channelX")
         sys.exit(1)
 =

 if (len(sys.argv) < 2):
@@ -33,7 +33,7 @@ if (sys.argv[1] =3D=3D "list"):
                 properties =3D manager.GetProperties()
 =

                 for path in properties["SecureElements"]:
-                        print "[ %s ]" % (path)
+                        print("[ %s ]" % (path))
 =

                         seel =3D dbus.Interface(bus.get_object("org.neard.=
se", path),
                                                 "org.neard.se.SecureElemen=
t")
@@ -45,13 +45,13 @@ if (sys.argv[1] =3D=3D "list"):
                                                 val =3D "true"
                                         else:
                                                 val =3D "false"
-                                        print "    %s =3D %s" % (key, val)
+                                        print("    %s =3D %s" % (key, val))
 =

                                 if key in ["Type"]:
-                                        print "    %s =3D %s" % (key, str(=
properties[key]))
+                                        print("    %s =3D %s" % (key, str(=
properties[key])))
 =

                                 if key in ["Channels"]:
-                                        print "    %s =3D %s" % (key, extr=
act_list(properties[key]))
+                                        print("    %s =3D %s" % (key, extr=
act_list(properties[key])))
         sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "enabled"):
@@ -69,10 +69,10 @@ if (sys.argv[1] =3D=3D "enabled"):
                         elif (sys.argv[3] =3D=3D "off"):
                                 val =3D seel.SetProperty("Enabled", dbus.B=
oolean(0), timeout =3D 10)
                         else:
-                                print "Invalid option %s" % sys.argv[3]
+                                print("Invalid option %s" % sys.argv[3])
 =

-                except dbus.DBusException, error:
-                        print "%s: %s" % (error._dbus_error_name, error.me=
ssage)
+                except dbus.DBusException as error:
+                        print("%s: %s" % (error._dbus_error_name, error.me=
ssage))
         sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "open_channel"):
@@ -87,9 +87,9 @@ if (sys.argv[1] =3D=3D "open_channel"):
                 try:
                         channel =3D seel.OpenChannel(sys.argv[3].decode("h=
ex"))
 =

-                        print "Opened channel: %s" % str(channel)
-                except dbus.DBusException, error:
-                        print "%s: %s" % (error._dbus_error_name, error.me=
ssage)
+                        print("Opened channel: %s" % str(channel))
+                except dbus.DBusException as error:
+                        print("%s: %s" % (error._dbus_error_name, error.me=
ssage))
         sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "close_channel"):
@@ -107,8 +107,8 @@ if (sys.argv[1] =3D=3D "close_channel"):
                 try:
                         seel.CloseChannel(channel)
 =

-                except dbus.DBusException, error:
-                        print "%s: %s" % (error._dbus_error_name, error.me=
ssage)
+                except dbus.DBusException as error:
+                        print("%s: %s" % (error._dbus_error_name, error.me=
ssage))
         sys.exit(0)
 =

 usage()
-- =

2.33.1

--===============9076792527138063899==--

