Content-Type: multipart/mixed; boundary="===============4914518096214724968=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 4/6] se: Use spaces only for SE Python test scripts
Date: Sun, 28 Nov 2021 22:06:04 -0700
Message-ID: <20211129050606.873494-5-mgreer@animalcreek.com>
In-Reply-To: <20211129050606.873494-1-mgreer@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4914518096214724968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The Python PEP 8 style guide prefers spaces over tabs so replace all
tabs in the SE Python test scripts with spaces. See:

	https://www.python.org/dev/peps/pep-0008/#tabs-or-spaces

Signed-off-by: Mark Greer <mgreer@animalcreek.com>
---
 se/test/test-channel |  84 ++++++++++----------
 se/test/test-seel    | 178 +++++++++++++++++++++----------------------
 2 files changed, 131 insertions(+), 131 deletions(-)

diff --git a/se/test/test-channel b/se/test/test-channel
index e6ed0114c8c8..5fa9b7e7fc41 100755
--- a/se/test/test-channel
+++ b/se/test/test-channel
@@ -6,59 +6,59 @@ import dbus
 bus =3D dbus.SystemBus()
 =

 def extract_byte_array(byte_array):
-	return ' '.join("{:02x}".format(byte) for byte in byte_array)
+        return ' '.join("{:02x}".format(byte) for byte in byte_array)
 =

 def usage():
-	print "Usage: %s <command>" % (sys.argv[0])
-	print ""
-	print "  list"
-	print "  send_apdu se/nfcX_<se_type>_seX channelX <apdu>"
-	sys.exit(1)
+        print "Usage: %s <command>" % (sys.argv[0])
+        print ""
+        print "  list"
+        print "  send_apdu se/nfcX_<se_type>_seX channelX <apdu>"
+        sys.exit(1)
 =

 if (len(sys.argv) < 2):
         usage()
 =

 if (sys.argv[1] =3D=3D "list"):
-	if (len(sys.argv) !=3D 3):
-		usage()
-	else:
-		path =3D "/org/neard/se/" + sys.argv[2]
-
-		seel =3D dbus.Interface(bus.get_object("org.neard.se", path),
-							"org.neard.se.SecureElement")
-		properties =3D seel.GetProperties()
-
-		for path in properties["Channels"]:
-			print "[ %s ]" % (path)
-
-			channel =3D dbus.Interface(bus.get_object("org.neard.se", path),
-						"org.neard.se.Channel")
-			properties =3D channel.GetProperties()
-
-			for key in properties.keys():
-				if key in ["Basic"]:
-					if properties[key] =3D=3D dbus.Boolean(1):
-						val =3D "true"
-					else:
-						val =3D "false"
-					print "    %s =3D %s" % (key, val)
-
-				if key in ["AID"]:
-					print "    %s =3D %s" % (key, extract_byte_array(properties[key]))
-	sys.exit(0)
+        if (len(sys.argv) !=3D 3):
+                usage()
+        else:
+                path =3D "/org/neard/se/" + sys.argv[2]
+
+                seel =3D dbus.Interface(bus.get_object("org.neard.se", pat=
h),
+                                                        "org.neard.se.Secu=
reElement")
+                properties =3D seel.GetProperties()
+
+                for path in properties["Channels"]:
+                        print "[ %s ]" % (path)
+
+                        channel =3D dbus.Interface(bus.get_object("org.nea=
rd.se", path),
+                                                "org.neard.se.Channel")
+                        properties =3D channel.GetProperties()
+
+                        for key in properties.keys():
+                                if key in ["Basic"]:
+                                        if properties[key] =3D=3D dbus.Boo=
lean(1):
+                                                val =3D "true"
+                                        else:
+                                                val =3D "false"
+                                        print "    %s =3D %s" % (key, val)
+
+                                if key in ["AID"]:
+                                        print "    %s =3D %s" % (key, extr=
act_byte_array(properties[key]))
+        sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "send_apdu"):
-	if (len(sys.argv) !=3D 5):
-		usage()
-	else:
-		path =3D "/org/neard/se/" + sys.argv[2] + "/" + sys.argv[3]
+        if (len(sys.argv) !=3D 5):
+                usage()
+        else:
+                path =3D "/org/neard/se/" + sys.argv[2] + "/" + sys.argv[3]
 =

-		channel =3D dbus.Interface(bus.get_object("org.neard.se", path),
-					"org.neard.se.Channel")
+                channel =3D dbus.Interface(bus.get_object("org.neard.se", =
path),
+                                        "org.neard.se.Channel")
 =

-		response =3D channel.SendAPDU(sys.argv[4].decode("hex"))
+                response =3D channel.SendAPDU(sys.argv[4].decode("hex"))
 =

-		print "--> %s" % extract_byte_array(response)
-	sys.exit(0)
+                print "--> %s" % extract_byte_array(response)
+        sys.exit(0)
 =

 usage()
diff --git a/se/test/test-seel b/se/test/test-seel
index e238a38851a9..16c797dbc6fc 100755
--- a/se/test/test-seel
+++ b/se/test/test-seel
@@ -6,109 +6,109 @@ import dbus
 bus =3D dbus.SystemBus()
 =

 def extract_list(list):
-	val =3D "["
-	for i in list:
-		val +=3D " " + str(i)
-	val +=3D " ]"
-	return val
+        val =3D "["
+        for i in list:
+                val +=3D " " + str(i)
+        val +=3D " ]"
+        return val
 =

 def usage():
-	print "Usage: %s <command>" % (sys.argv[0])
-	print ""
-	print "  list"
-	print "  enabled se/nfcX_<se_type>_seX [on/off]"
-	print "  open_channel se/nfcX_<se_type>_seX <AID>"
-	print "  close_channel se/nfcX_<se_type>_seX channelX"
-	sys.exit(1)
+        print "Usage: %s <command>" % (sys.argv[0])
+        print ""
+        print "  list"
+        print "  enabled se/nfcX_<se_type>_seX [on/off]"
+        print "  open_channel se/nfcX_<se_type>_seX <AID>"
+        print "  close_channel se/nfcX_<se_type>_seX channelX"
+        sys.exit(1)
 =

 if (len(sys.argv) < 2):
-	usage()
+        usage()
 =

 if (sys.argv[1] =3D=3D "list"):
-	if (len(sys.argv) !=3D 2):
-		usage()
-	else:
-		manager =3D dbus.Interface(bus.get_object("org.neard.se", "/"),
-							"org.neard.se.Manager")
-		properties =3D manager.GetProperties()
-
-		for path in properties["SecureElements"]:
-			print "[ %s ]" % (path)
-
-			seel =3D dbus.Interface(bus.get_object("org.neard.se", path),
-						"org.neard.se.SecureElement")
-			properties =3D seel.GetProperties()
-
-			for key in properties.keys():
-				if key in ["Enabled"]:
-					if properties[key] =3D=3D dbus.Boolean(1):
-						val =3D "true"
-					else:
-						val =3D "false"
-					print "    %s =3D %s" % (key, val)
-
-				if key in ["Type"]:
-					print "    %s =3D %s" % (key, str(properties[key]))
-
-				if key in ["Channels"]:
-					print "    %s =3D %s" % (key, extract_list(properties[key]))
-	sys.exit(0)
+        if (len(sys.argv) !=3D 2):
+                usage()
+        else:
+                manager =3D dbus.Interface(bus.get_object("org.neard.se", =
"/"),
+                                                        "org.neard.se.Mana=
ger")
+                properties =3D manager.GetProperties()
+
+                for path in properties["SecureElements"]:
+                        print "[ %s ]" % (path)
+
+                        seel =3D dbus.Interface(bus.get_object("org.neard.=
se", path),
+                                                "org.neard.se.SecureElemen=
t")
+                        properties =3D seel.GetProperties()
+
+                        for key in properties.keys():
+                                if key in ["Enabled"]:
+                                        if properties[key] =3D=3D dbus.Boo=
lean(1):
+                                                val =3D "true"
+                                        else:
+                                                val =3D "false"
+                                        print "    %s =3D %s" % (key, val)
+
+                                if key in ["Type"]:
+                                        print "    %s =3D %s" % (key, str(=
properties[key]))
+
+                                if key in ["Channels"]:
+                                        print "    %s =3D %s" % (key, extr=
act_list(properties[key]))
+        sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "enabled"):
-	if (len(sys.argv) < 4):
-		usage()
-	else:
-		path =3D "/org/neard/se/" + sys.argv[2]
-
-		seel =3D dbus.Interface(bus.get_object("org.neard.se", path),
-					"org.neard.se.SecureElement")
-
-		try:
-			if (sys.argv[3] =3D=3D "on"):
-				val =3D seel.SetProperty("Enabled", dbus.Boolean(1), timeout =3D 10)
-			elif (sys.argv[3] =3D=3D "off"):
-				val =3D seel.SetProperty("Enabled", dbus.Boolean(0), timeout =3D 10)
-			else:
-				print "Invalid option %s" % sys.argv[3]
-
-		except dbus.DBusException, error:
-			print "%s: %s" % (error._dbus_error_name, error.message)
-	sys.exit(0)
+        if (len(sys.argv) < 4):
+                usage()
+        else:
+                path =3D "/org/neard/se/" + sys.argv[2]
+
+                seel =3D dbus.Interface(bus.get_object("org.neard.se", pat=
h),
+                                        "org.neard.se.SecureElement")
+
+                try:
+                        if (sys.argv[3] =3D=3D "on"):
+                                val =3D seel.SetProperty("Enabled", dbus.B=
oolean(1), timeout =3D 10)
+                        elif (sys.argv[3] =3D=3D "off"):
+                                val =3D seel.SetProperty("Enabled", dbus.B=
oolean(0), timeout =3D 10)
+                        else:
+                                print "Invalid option %s" % sys.argv[3]
+
+                except dbus.DBusException, error:
+                        print "%s: %s" % (error._dbus_error_name, error.me=
ssage)
+        sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "open_channel"):
-	if (len(sys.argv) < 4):
-		usage()
-	else:
-		path =3D "/org/neard/se/" + sys.argv[2]
+        if (len(sys.argv) < 4):
+                usage()
+        else:
+                path =3D "/org/neard/se/" + sys.argv[2]
 =

-		seel =3D dbus.Interface(bus.get_object("org.neard.se", path),
-					"org.neard.se.SecureElement")
+                seel =3D dbus.Interface(bus.get_object("org.neard.se", pat=
h),
+                                        "org.neard.se.SecureElement")
 =

-		try:
-			channel =3D seel.OpenChannel(sys.argv[3].decode("hex"))
+                try:
+                        channel =3D seel.OpenChannel(sys.argv[3].decode("h=
ex"))
 =

-			print "Opened channel: %s" % str(channel)
-		except dbus.DBusException, error:
-			print "%s: %s" % (error._dbus_error_name, error.message)
-	sys.exit(0)
+                        print "Opened channel: %s" % str(channel)
+                except dbus.DBusException, error:
+                        print "%s: %s" % (error._dbus_error_name, error.me=
ssage)
+        sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "close_channel"):
-	if (len(sys.argv) < 4):
-		usage()
-	else:
-		seel_path =3D "/org/neard/se/" + sys.argv[2]
-		channel_path =3D seel_path + "/" + sys.argv[3]
-
-		seel =3D dbus.Interface(bus.get_object("org.neard.se", seel_path),
-					"org.neard.se.SecureElement")
-
-		channel =3D dbus.Interface(bus.get_object("org.neard.se", channel_path),
-					"org.neard.se.Channel")
-		try:
-			seel.CloseChannel(channel)
-
-		except dbus.DBusException, error:
-			print "%s: %s" % (error._dbus_error_name, error.message)
-	sys.exit(0)
+        if (len(sys.argv) < 4):
+                usage()
+        else:
+                seel_path =3D "/org/neard/se/" + sys.argv[2]
+                channel_path =3D seel_path + "/" + sys.argv[3]
+
+                seel =3D dbus.Interface(bus.get_object("org.neard.se", see=
l_path),
+                                        "org.neard.se.SecureElement")
+
+                channel =3D dbus.Interface(bus.get_object("org.neard.se", =
channel_path),
+                                        "org.neard.se.Channel")
+                try:
+                        seel.CloseChannel(channel)
+
+                except dbus.DBusException, error:
+                        print "%s: %s" % (error._dbus_error_name, error.me=
ssage)
+        sys.exit(0)
 =

 usage()
-- =

2.33.1

--===============4914518096214724968==--

