Content-Type: multipart/mixed; boundary="===============2585341945420390999=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 1/6] test: Use spaces for Python test scripts
Date: Sun, 28 Nov 2021 22:06:01 -0700
Message-ID: <20211129050606.873494-2-mgreer@animalcreek.com>
In-Reply-To: <20211129050606.873494-1-mgreer@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2585341945420390999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The Python PEP 8 style guide prefers spaces over tabs so replace all
tabs in the Python test scripts with spaces. See:

	https://www.python.org/dev/peps/pep-0008/#tabs-or-spaces

Signed-off-by: Mark Greer <mgreer@animalcreek.com>
---
 test/bt-handover         | 192 ++++++++++++++++-----------------
 test/handover-agent      | 208 ++++++++++++++++++------------------
 test/monitor-near        |  50 ++++-----
 test/ndef-agent          | 112 ++++++++++----------
 test/neardutils.py       | 128 +++++++++++-----------
 test/phdc-simple-manager | 154 +++++++++++++--------------
 test/test-adapter        | 160 ++++++++++++++--------------
 test/test-device         | 180 +++++++++++++++----------------
 test/test-tag            | 224 +++++++++++++++++++--------------------
 9 files changed, 704 insertions(+), 704 deletions(-)

diff --git a/test/bt-handover b/test/bt-handover
index 42d66bff8d66..fc77404da972 100755
--- a/test/bt-handover
+++ b/test/bt-handover
@@ -14,118 +14,118 @@ from dbus.lowlevel import MethodCallMessage, HANDLER_=
RESULT_NOT_YET_HANDLED
 mainloop =3D gobject.MainLoop()
 =

 def device_added(path, interfaces):
-	for iface, props in interfaces.iteritems():
-		if "org.neard.Device" in interfaces:
-			print("Pairing with %s" % (path))
-			device =3D dbus.Interface(bus.get_object("org.neard", path),
-							"org.neard.Device")
-			device.Push(({ "Type" : "Handover", "Carrier" : "bluetooth"}))
-			break
+        for iface, props in interfaces.iteritems():
+                if "org.neard.Device" in interfaces:
+                        print("Pairing with %s" % (path))
+                        device =3D dbus.Interface(bus.get_object("org.near=
d", path),
+                                                        "org.neard.Device")
+                        device.Push(({ "Type" : "Handover", "Carrier" : "b=
luetooth"}))
+                        break
 =

 def device_removed(path, interfaces):
-	for iface in interfaces:
-		if "org.neard.Device" in interfaces:
-			print("Lost device %s" % (path))
-			mainloop.quit()
-			break
+        for iface in interfaces:
+                if "org.neard.Device" in interfaces:
+                        print("Lost device %s" % (path))
+                        mainloop.quit()
+                        break
 =

 def remove_paired_devices(bt_adapter):
-	manager =3D dbus.Interface(bus.get_object("org.bluez", "/"),
-					"org.freedesktop.DBus.ObjectManager")
-	objects =3D manager.GetManagedObjects()
+        manager =3D dbus.Interface(bus.get_object("org.bluez", "/"),
+                                        "org.freedesktop.DBus.ObjectManage=
r")
+        objects =3D manager.GetManagedObjects()
 =

-	all_adapters =3D (path for path, interfaces in objects.iteritems() if
-				"org.bluez.Adapter1" in interfaces.keys()
-				and path.endswith(bt_adapter))
+        all_adapters =3D (path for path, interfaces in objects.iteritems()=
 if
+                                "org.bluez.Adapter1" in interfaces.keys()
+                                and path.endswith(bt_adapter))
 =

-	bluez_adapter =3D None
-	for adapter in sorted(all_adapters):
-		bluez_adapter =3D dbus.Interface(bus.get_object("org.bluez",
-							adapter),
-							"org.bluez.Adapter1")
-		break
+        bluez_adapter =3D None
+        for adapter in sorted(all_adapters):
+                bluez_adapter =3D dbus.Interface(bus.get_object("org.bluez=
",
+                                                        adapter),
+                                                        "org.bluez.Adapter=
1")
+                break
 =

-	if(bluez_adapter is None):
-		print("Bluetooth adapter %s could not be found" % bluez_adapter)
-		exit()
+        if(bluez_adapter is None):
+                print("Bluetooth adapter %s could not be found" % bluez_ad=
apter)
+                exit()
 =

-	adapter_path =3D bluez_adapter.object_path
-	print("Using %s" % adapter_path)
+        adapter_path =3D bluez_adapter.object_path
+        print("Using %s" % adapter_path)
 =

-	adapter_props =3D dbus.Interface(bus.get_object("org.bluez", adapter_path=
),
-					"org.freedesktop.DBus.Properties")
+        adapter_props =3D dbus.Interface(bus.get_object("org.bluez", adapt=
er_path),
+                                        "org.freedesktop.DBus.Properties")
 =

-	powered =3D adapter_props.Get("org.bluez.Adapter1", "Powered")
-	if (powered =3D=3D dbus.Boolean(0)):
-		print("Bluetooth adapter %s is not powered" % adapter_path )
-		exit()
+        powered =3D adapter_props.Get("org.bluez.Adapter1", "Powered")
+        if (powered =3D=3D dbus.Boolean(0)):
+                print("Bluetooth adapter %s is not powered" % adapter_path=
 )
+                exit()
 =

-	all_devices =3D (path for path, interfaces in objects.iteritems() if
-				("org.bluez.Device1" in interfaces.keys()
-				and path.startswith(bluez_adapter.object_path)))
+        all_devices =3D (path for path, interfaces in objects.iteritems() =
if
+                                ("org.bluez.Device1" in interfaces.keys()
+                                and path.startswith(bluez_adapter.object_p=
ath)))
 =

-	for device in all_devices:
-		print("Removing %s" % (device))
-		bluez_adapter.RemoveDevice(device)
+        for device in all_devices:
+                print("Removing %s" % (device))
+                bluez_adapter.RemoveDevice(device)
 =

 def remove_paired_devices_bluez4():
-	bluez_manager =3D dbus.Interface(bus.get_object("org.bluez", "/"),
-					"org.bluez.Manager")
+        bluez_manager =3D dbus.Interface(bus.get_object("org.bluez", "/"),
+                                        "org.bluez.Manager")
 =

-	bluez_adapter_path =3D bluez_manager.DefaultAdapter()
-	bluez_adapter =3D dbus.Interface(bus.get_object("org.bluez",
-						bluez_adapter_path),
-						"org.bluez.Adapter")
+        bluez_adapter_path =3D bluez_manager.DefaultAdapter()
+        bluez_adapter =3D dbus.Interface(bus.get_object("org.bluez",
+                                                bluez_adapter_path),
+                                                "org.bluez.Adapter")
 =

-	print("Using %s" % bluez_adapter.object_path)
+        print("Using %s" % bluez_adapter.object_path)
 =

-	for bluez_path in bluez_adapter.ListDevices():
-		print("Removing %s" % (bluez_path))
-		bluez_adapter.RemoveDevice(bluez_path)
+        for bluez_path in bluez_adapter.ListDevices():
+                print("Removing %s" % (bluez_path))
+                bluez_adapter.RemoveDevice(bluez_path)
 =

 if __name__ =3D=3D '__main__':
-	parser =3D OptionParser()
-	parser.add_option("", "--bluez4", action=3D"store_true",
-				dest=3D"use_bluez4",
-				help=3D"Use BlueZ 4 to remove paired devices.")
-	parser.add_option("-a", "--adapter", metavar=3D"BT_ADAPTER",
-				dest=3D"bt_adapter", default=3D"",
-				help=3D"The bluetooth adapter that is used by "
-					"the bluetooth stack. This options is "
-					"ignored when using BlueZ 4, instead "
-					"the default adapter is used.")
-	(options, args) =3D parser.parse_args()
-
-	dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
-
-	bus =3D dbus.SystemBus()
-
-	adapter_path =3D neardutils.find_adapter().object_path
-	print("Adapter path %s" % (adapter_path))
-	adapter =3D dbus.Interface(bus.get_object("org.neard", adapter_path),
-							"org.neard.Adapter")
-
-	adapter_props =3D dbus.Interface(bus.get_object("org.neard", adapter_path=
),
-					"org.freedesktop.DBus.Properties")
-	powered =3D adapter_props.Get("org.neard.Adapter", "Powered")
-	if (powered =3D=3D dbus.Boolean(0)):
-		adapter_props.Set("org.neard.Adapter", "Powered", dbus.Boolean(1))
-
-	if (options.use_bluez4):
-		remove_paired_devices_bluez4()
-	else:
-		remove_paired_devices(options.bt_adapter)
-
-	polling =3D adapter_props.Get("org.neard.Adapter", "Polling")
-	if (polling =3D=3D dbus.Boolean(0)):
-		adapter.StartPollLoop("Initiator")
-
-	bus.add_signal_receiver(device_added, bus_name=3D"org.neard",
-			dbus_interface=3D"org.freedesktop.DBus.ObjectManager",
-			signal_name=3D"InterfacesAdded")
-
-	bus.add_signal_receiver(device_removed, bus_name=3D"org.neard",
-			dbus_interface=3D"org.freedesktop.DBus.ObjectManager",
-			signal_name=3D"InterfacesRemoved")
-
-	mainloop.run()
+        parser =3D OptionParser()
+        parser.add_option("", "--bluez4", action=3D"store_true",
+                                dest=3D"use_bluez4",
+                                help=3D"Use BlueZ 4 to remove paired devic=
es.")
+        parser.add_option("-a", "--adapter", metavar=3D"BT_ADAPTER",
+                                dest=3D"bt_adapter", default=3D"",
+                                help=3D"The bluetooth adapter that is used=
 by "
+                                        "the bluetooth stack. This options=
 is "
+                                        "ignored when using BlueZ 4, inste=
ad "
+                                        "the default adapter is used.")
+        (options, args) =3D parser.parse_args()
+
+        dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
+
+        bus =3D dbus.SystemBus()
+
+        adapter_path =3D neardutils.find_adapter().object_path
+        print("Adapter path %s" % (adapter_path))
+        adapter =3D dbus.Interface(bus.get_object("org.neard", adapter_pat=
h),
+                                                        "org.neard.Adapter=
")
+
+        adapter_props =3D dbus.Interface(bus.get_object("org.neard", adapt=
er_path),
+                                        "org.freedesktop.DBus.Properties")
+        powered =3D adapter_props.Get("org.neard.Adapter", "Powered")
+        if (powered =3D=3D dbus.Boolean(0)):
+                adapter_props.Set("org.neard.Adapter", "Powered", dbus.Boo=
lean(1))
+
+        if (options.use_bluez4):
+                remove_paired_devices_bluez4()
+        else:
+                remove_paired_devices(options.bt_adapter)
+
+        polling =3D adapter_props.Get("org.neard.Adapter", "Polling")
+        if (polling =3D=3D dbus.Boolean(0)):
+                adapter.StartPollLoop("Initiator")
+
+        bus.add_signal_receiver(device_added, bus_name=3D"org.neard",
+                        dbus_interface=3D"org.freedesktop.DBus.ObjectManag=
er",
+                        signal_name=3D"InterfacesAdded")
+
+        bus.add_signal_receiver(device_removed, bus_name=3D"org.neard",
+                        dbus_interface=3D"org.freedesktop.DBus.ObjectManag=
er",
+                        signal_name=3D"InterfacesRemoved")
+
+        mainloop.run()
diff --git a/test/handover-agent b/test/handover-agent
index 7f2ac23246b0..dba00b6b9229 100755
--- a/test/handover-agent
+++ b/test/handover-agent
@@ -8,133 +8,133 @@ import dbus.mainloop.glib
 from optparse import OptionParser
 =

 eir_test_data =3D [0x16,0x00\
-		,0x01,0x02,0x03,0x04,0x05,0x06\
-		,0x08,0x09,0x41,0x72,0x72,0x61,0x6b,0x69,0x73\
-		,0x04,0x0d,0x6e,0x01,0x00]
+                ,0x01,0x02,0x03,0x04,0x05,0x06\
+                ,0x08,0x09,0x41,0x72,0x72,0x61,0x6b,0x69,0x73\
+                ,0x04,0x0d,0x6e,0x01,0x00]
 =

 wsc_test_data =3D [0x10,0x4A,0x00,0x01,0x10\
-		,0x10,0x45,0x00,0x08\
-		,0x74,0x65,0x73,0x74,0x73,0x73,0x69,0x64\
-		,0x10,0x27,0x00,0x06\
-		,0x62,0x6C,0x61,0x62,0x6C,0x61]
+                ,0x10,0x45,0x00,0x08\
+                ,0x74,0x65,0x73,0x74,0x73,0x73,0x69,0x64\
+                ,0x10,0x27,0x00,0x06\
+                ,0x62,0x6C,0x61,0x62,0x6C,0x61]
 =

 power_state =3D None
 =

 def print_fields(fields):
-	if 'EIR' in fields:
-		s =3D ' '.join('{:#02x}'.format(i) for i in fields['EIR'])
-		print '  EIR:  %s' % s
+        if 'EIR' in fields:
+                s =3D ' '.join('{:#02x}'.format(i) for i in fields['EIR'])
+                print '  EIR:  %s' % s
 =

-	if 'nokia.com:bt' in fields:
-		s =3D ' '.join('{:#02x}'.format(i) for i in fields['nokia.com:bt'])
-		print '  nokia.com:bt:  %s' % s
+        if 'nokia.com:bt' in fields:
+                s =3D ' '.join('{:#02x}'.format(i) for i in fields['nokia.=
com:bt'])
+                print '  nokia.com:bt:  %s' % s
 =

-	if 'State' in fields:
-		print '  State: %s' % fields['State']
+        if 'State' in fields:
+                print '  State: %s' % fields['State']
 =

-	if 'WSC' in fields:
-		s =3D ' '.join('{:#02x}'.format(i) for i in fields['WSC'])
-		print '  WSC:  %s' % s
+        if 'WSC' in fields:
+                s =3D ' '.join('{:#02x}'.format(i) for i in fields['WSC'])
+                print '  WSC:  %s' % s
 =

 class BTHOAgent(dbus.service.Object):
 =

-	@dbus.service.method('org.neard.HandoverAgent',
-					in_signature=3D'',
-					out_signature=3D'')
-	def Release(self):
-		print 'Release'
-		mainloop.quit()
-
-	@dbus.service.method('org.neard.HandoverAgent',
-					in_signature=3D'a{sv}',
-					out_signature=3D'')
-	def PushOOB(self, fields):
-		print 'PushOOB'
-		print_fields(fields)
-
-	@dbus.service.method('org.neard.HandoverAgent',
-					in_signature=3D'a{sv}',
-					out_signature=3D'a{sv}')
-
-	def RequestOOB(self, fields):
-		print 'RequestOOB'
-		print_fields(fields)
-
-		print '  Replying with'
-		s =3D ' '.join('{:#02x}'.format(i) for i in eir_test_data)
-		print '    EIR: %s' % s
-
-		if power_state !=3D 'unknown':
-			print '    State: %s' % power_state
-			return {'EIR' : eir_test_data, 'State' : power_state}
-		else:
-			return {'EIR' : eir_test_data}
+        @dbus.service.method('org.neard.HandoverAgent',
+                                        in_signature=3D'',
+                                        out_signature=3D'')
+        def Release(self):
+                print 'Release'
+                mainloop.quit()
+
+        @dbus.service.method('org.neard.HandoverAgent',
+                                        in_signature=3D'a{sv}',
+                                        out_signature=3D'')
+        def PushOOB(self, fields):
+                print 'PushOOB'
+                print_fields(fields)
+
+        @dbus.service.method('org.neard.HandoverAgent',
+                                        in_signature=3D'a{sv}',
+                                        out_signature=3D'a{sv}')
+
+        def RequestOOB(self, fields):
+                print 'RequestOOB'
+                print_fields(fields)
+
+                print '  Replying with'
+                s =3D ' '.join('{:#02x}'.format(i) for i in eir_test_data)
+                print '    EIR: %s' % s
+
+                if power_state !=3D 'unknown':
+                        print '    State: %s' % power_state
+                        return {'EIR' : eir_test_data, 'State' : power_sta=
te}
+                else:
+                        return {'EIR' : eir_test_data}
 =

 class WiFiHOAgent(dbus.service.Object):
 =

-	@dbus.service.method('org.neard.HandoverAgent',
-					in_signature=3D'',
-					out_signature=3D'')
-	def Release(self):
-		print 'Release'
-		mainloop.quit()
-
-	@dbus.service.method('org.neard.HandoverAgent',
-					in_signature=3D'a{sv}',
-					out_signature=3D'')
-	def PushOOB(self, fields):
-		print 'PushOOB'
-		print_fields(fields)
-
-	@dbus.service.method('org.neard.HandoverAgent',
-					in_signature=3D'a{sv}',
-					out_signature=3D'a{sv}')
-
-	def RequestOOB(self, fields):
-		print 'RequestOOB'
-		print_fields(fields)
-
-		print '  Replying with'
-		s =3D ' '.join('{:#02x}'.format(i) for i in wsc_test_data)
-		print '    WSC: %s' % s
-
-		if power_state !=3D 'unknown':
-			print '    State: %s' % power_state
-			return {'WSC' : wsc_test_data, 'State' : power_state}
-		else:
-			return {'WSC' : wsc_test_data}
+        @dbus.service.method('org.neard.HandoverAgent',
+                                        in_signature=3D'',
+                                        out_signature=3D'')
+        def Release(self):
+                print 'Release'
+                mainloop.quit()
+
+        @dbus.service.method('org.neard.HandoverAgent',
+                                        in_signature=3D'a{sv}',
+                                        out_signature=3D'')
+        def PushOOB(self, fields):
+                print 'PushOOB'
+                print_fields(fields)
+
+        @dbus.service.method('org.neard.HandoverAgent',
+                                        in_signature=3D'a{sv}',
+                                        out_signature=3D'a{sv}')
+
+        def RequestOOB(self, fields):
+                print 'RequestOOB'
+                print_fields(fields)
+
+                print '  Replying with'
+                s =3D ' '.join('{:#02x}'.format(i) for i in wsc_test_data)
+                print '    WSC: %s' % s
+
+                if power_state !=3D 'unknown':
+                        print '    State: %s' % power_state
+                        return {'WSC' : wsc_test_data, 'State' : power_sta=
te}
+                else:
+                        return {'WSC' : wsc_test_data}
 =

 if __name__ =3D=3D '__main__':
-	dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
+        dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
 =

-	bus =3D dbus.SystemBus()
+        bus =3D dbus.SystemBus()
 =

-	parser =3D OptionParser()
-	parser.add_option("-s", "--power-state", action=3D"store", type=3D"string=
",
-				dest=3D"power_state", default=3D"active",
-				help=3D"active inactive activating unknown")
-	(options, args) =3D parser.parse_args()
+        parser =3D OptionParser()
+        parser.add_option("-s", "--power-state", action=3D"store", type=3D=
"string",
+                                dest=3D"power_state", default=3D"active",
+                                help=3D"active inactive activating unknown=
")
+        (options, args) =3D parser.parse_args()
 =

-	power_state =3D options.power_state
+        power_state =3D options.power_state
 =

-	obj =3D bus.get_object("org.neard", "/org/neard");
-	manager =3D dbus.Interface(obj, "org.neard.AgentManager")
+        obj =3D bus.get_object("org.neard", "/org/neard");
+        manager =3D dbus.Interface(obj, "org.neard.AgentManager")
 =

-	btpath =3D '/test/handover/bt/agent'
-	btcarrier =3D 'bluetooth'
-	btobject =3D BTHOAgent(bus, btpath)
+        btpath =3D '/test/handover/bt/agent'
+        btcarrier =3D 'bluetooth'
+        btobject =3D BTHOAgent(bus, btpath)
 =

-	wifipath =3D '/test/handover/wifi/agent'
-	wificarrier =3D 'wifi'
-	wifiobject =3D WiFiHOAgent(bus, wifipath)
+        wifipath =3D '/test/handover/wifi/agent'
+        wificarrier =3D 'wifi'
+        wifiobject =3D WiFiHOAgent(bus, wifipath)
 =

-	manager.RegisterHandoverAgent(btpath, btcarrier)
-	manager.RegisterHandoverAgent(wifipath, wificarrier)
+        manager.RegisterHandoverAgent(btpath, btcarrier)
+        manager.RegisterHandoverAgent(wifipath, wificarrier)
 =

-	mainloop =3D gobject.MainLoop()
+        mainloop =3D gobject.MainLoop()
 =

-	try:
-		mainloop.run()
-	except (KeyboardInterrupt):
-		manager.UnregisterHandoverAgent(btpath, btcarrier)
-		manager.UnregisterHandoverAgent(wifipath, wificarrier)
+        try:
+                mainloop.run()
+        except (KeyboardInterrupt):
+                manager.UnregisterHandoverAgent(btpath, btcarrier)
+                manager.UnregisterHandoverAgent(wifipath, wificarrier)
diff --git a/test/monitor-near b/test/monitor-near
index f3ad021d60a3..49aa6db23f3f 100755
--- a/test/monitor-near
+++ b/test/monitor-near
@@ -8,39 +8,39 @@ import dbus
 import dbus.mainloop.glib
 =

 def property_changed(interface, changed, invalidated, path):
-	iface =3D interface[interface.rfind(".") + 1:]
-	for name, value in changed.iteritems():
-		val =3D str(value)
-		print("{%s.PropertyChanged} [%s] %s =3D %s" % (iface, path, name,
-									val))
+        iface =3D interface[interface.rfind(".") + 1:]
+        for name, value in changed.iteritems():
+                val =3D str(value)
+                print("{%s.PropertyChanged} [%s] %s =3D %s" % (iface, path=
, name,
+                                                                        va=
l))
 =

 def interfaces_added(path, interfaces):
-	for iface, props in interfaces.iteritems():
-		print("{Added %s} [%s]" % (iface, path))
-		for name, value in props.iteritems():
-			print("      %s =3D %s" % (name, value))
+        for iface, props in interfaces.iteritems():
+                print("{Added %s} [%s]" % (iface, path))
+                for name, value in props.iteritems():
+                        print("      %s =3D %s" % (name, value))
 =

 def interfaces_removed(path, interfaces):
-	for iface in interfaces:
-		print("{Removed %s} [%s]" % (iface, path))
+        for iface in interfaces:
+                print("{Removed %s} [%s]" % (iface, path))
 =

 if __name__ =3D=3D '__main__':
-	dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
+        dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
 =

-	bus =3D dbus.SystemBus()
+        bus =3D dbus.SystemBus()
 =

-	bus.add_signal_receiver(property_changed, bus_name=3D"org.neard",
-			dbus_interface=3D"org.freedesktop.DBus.Properties",
-			signal_name=3D"PropertiesChanged",
-			path_keyword=3D"path")
+        bus.add_signal_receiver(property_changed, bus_name=3D"org.neard",
+                        dbus_interface=3D"org.freedesktop.DBus.Properties",
+                        signal_name=3D"PropertiesChanged",
+                        path_keyword=3D"path")
 =

-	bus.add_signal_receiver(interfaces_added, bus_name=3D"org.neard",
-			dbus_interface=3D"org.freedesktop.DBus.ObjectManager",
-			signal_name=3D"InterfacesAdded")
+        bus.add_signal_receiver(interfaces_added, bus_name=3D"org.neard",
+                        dbus_interface=3D"org.freedesktop.DBus.ObjectManag=
er",
+                        signal_name=3D"InterfacesAdded")
 =

-	bus.add_signal_receiver(interfaces_removed, bus_name=3D"org.neard",
-			dbus_interface=3D"org.freedesktop.DBus.ObjectManager",
-			signal_name=3D"InterfacesRemoved")
+        bus.add_signal_receiver(interfaces_removed, bus_name=3D"org.neard",
+                        dbus_interface=3D"org.freedesktop.DBus.ObjectManag=
er",
+                        signal_name=3D"InterfacesRemoved")
 =

-	mainloop =3D gobject.MainLoop()
-	mainloop.run()
\ No newline at end of file
+        mainloop =3D gobject.MainLoop()
+        mainloop.run()
diff --git a/test/ndef-agent b/test/ndef-agent
index 1cfeb03e2330..bb25ab17edf2 100755
--- a/test/ndef-agent
+++ b/test/ndef-agent
@@ -9,70 +9,70 @@ import sys
 =

 class NDEFAgent(dbus.service.Object):
 =

-	@dbus.service.method("org.neard.NDEFAgent",
-					in_signature=3D'', out_signature=3D'')
-	def Release(self):
-		print "Release"
-		mainloop.quit()
-
-	@dbus.service.method("org.neard.NDEFAgent",
-					in_signature=3D'a{sv}',
-					out_signature=3D'')
-	def GetNDEF(self, fields):
-		print "GetNDEF"
-
-		if fields.has_key("Record"):
-			print "Record path %s" % (fields["Record"])
-
-		if fields.has_key("Payload"):
-			val =3D "["
-			for i in fields["Payload"]:
-				val +=3D " 0x%x" % i
-			val +=3D " ]"
-			print "Record payload %s" % val
-
-		if fields.has_key("NDEF"):
-			val =3D "["
-			for i in fields["NDEF"]:
-				val +=3D " 0x%x" % i
-			val +=3D " ]"
-			print "Complete NDEF %s" % val
-
-		return
-
-	@dbus.service.method("org.neard.NDEFAgent",
-					in_signature=3D'', out_signature=3D'')
-	def Cancel(self):
-		print "Cancel"
+        @dbus.service.method("org.neard.NDEFAgent",
+                                        in_signature=3D'', out_signature=
=3D'')
+        def Release(self):
+                print "Release"
+                mainloop.quit()
+
+        @dbus.service.method("org.neard.NDEFAgent",
+                                        in_signature=3D'a{sv}',
+                                        out_signature=3D'')
+        def GetNDEF(self, fields):
+                print "GetNDEF"
+
+                if fields.has_key("Record"):
+                        print "Record path %s" % (fields["Record"])
+
+                if fields.has_key("Payload"):
+                        val =3D "["
+                        for i in fields["Payload"]:
+                                val +=3D " 0x%x" % i
+                        val +=3D " ]"
+                        print "Record payload %s" % val
+
+                if fields.has_key("NDEF"):
+                        val =3D "["
+                        for i in fields["NDEF"]:
+                                val +=3D " 0x%x" % i
+                        val +=3D " ]"
+                        print "Complete NDEF %s" % val
+
+                return
+
+        @dbus.service.method("org.neard.NDEFAgent",
+                                        in_signature=3D'', out_signature=
=3D'')
+        def Cancel(self):
+                print "Cancel"
 =

 def print_usage():
-	print "Usage:"
-	print "%s Type=3D<record type>" % (sys.argv[0])
-	print "Help: %s help" % (sys.argv[0])
-	sys.exit(1)
+        print "Usage:"
+        print "%s Type=3D<record type>" % (sys.argv[0])
+        print "Help: %s help" % (sys.argv[0])
+        sys.exit(1)
 =

 if __name__ =3D=3D '__main__':
-	if len(sys.argv) !=3D 2:
-		print_usage()
+        if len(sys.argv) !=3D 2:
+                print_usage()
 =

-	if len(sys.argv) =3D=3D 2 and sys.argv[1] =3D=3D "help":
-		print_usage()
+        if len(sys.argv) =3D=3D 2 and sys.argv[1] =3D=3D "help":
+                print_usage()
 =

-	dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
+        dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
 =

-	bus =3D dbus.SystemBus()
-	obj =3D bus.get_object("org.neard", "/org/neard");
-	manager =3D dbus.Interface(obj, "org.neard.AgentManager")
+        bus =3D dbus.SystemBus()
+        obj =3D bus.get_object("org.neard", "/org/neard");
+        manager =3D dbus.Interface(obj, "org.neard.AgentManager")
 =

-	path =3D "/test/ndef/agent"
-	object =3D NDEFAgent(bus, path)
-	rec_type =3D sys.argv[1].replace("Type=3D", "", 1)
+        path =3D "/test/ndef/agent"
+        object =3D NDEFAgent(bus, path)
+        rec_type =3D sys.argv[1].replace("Type=3D", "", 1)
 =

-	manager.RegisterNDEFAgent(path, rec_type)
+        manager.RegisterNDEFAgent(path, rec_type)
 =

-	mainloop =3D gobject.MainLoop()
+        mainloop =3D gobject.MainLoop()
 =

-	try:
-		mainloop.run()
-	except (KeyboardInterrupt):
-		manager.UnregisterNDEFAgent(path, rec_type)
+        try:
+                mainloop.run()
+        except (KeyboardInterrupt):
+                manager.UnregisterNDEFAgent(path, rec_type)
diff --git a/test/neardutils.py b/test/neardutils.py
index d93ae637bb27..6e423c075fe2 100644
--- a/test/neardutils.py
+++ b/test/neardutils.py
@@ -7,90 +7,90 @@ TAG_INTERFACE =3D SERVICE_NAME + ".Tag"
 RECORD_INTERFACE =3D SERVICE_NAME + ".Record"
 =

 def get_managed_objects():
-	bus =3D dbus.SystemBus()
-	manager =3D dbus.Interface(bus.get_object(SERVICE_NAME, "/"),
-				"org.freedesktop.DBus.ObjectManager")
-	return manager.GetManagedObjects()
+        bus =3D dbus.SystemBus()
+        manager =3D dbus.Interface(bus.get_object(SERVICE_NAME, "/"),
+                                "org.freedesktop.DBus.ObjectManager")
+        return manager.GetManagedObjects()
 =

 def find_adapter(pattern=3DNone):
-	return find_adapter_in_objects(get_managed_objects(), pattern)
+        return find_adapter_in_objects(get_managed_objects(), pattern)
 =

 def find_adapter_in_objects(objects, pattern=3DNone):
-	bus =3D dbus.SystemBus()
-	for path, ifaces in objects.iteritems():
-		adapter =3D ifaces.get(ADAPTER_INTERFACE)
-		if adapter is None:
-			continue
-		if not pattern or path.endswith(pattern):
-			obj =3D bus.get_object(SERVICE_NAME, path)
-			return dbus.Interface(obj, ADAPTER_INTERFACE)
-	raise Exception("NFC adapter not found")
+        bus =3D dbus.SystemBus()
+        for path, ifaces in objects.iteritems():
+                adapter =3D ifaces.get(ADAPTER_INTERFACE)
+                if adapter is None:
+                        continue
+                if not pattern or path.endswith(pattern):
+                        obj =3D bus.get_object(SERVICE_NAME, path)
+                        return dbus.Interface(obj, ADAPTER_INTERFACE)
+        raise Exception("NFC adapter not found")
 =

 def find_device(pattern=3DNone):
-	return find_device_in_objects(get_managed_objects(), pattern)
+        return find_device_in_objects(get_managed_objects(), pattern)
 =

 def find_device_in_objects(objects, pattern=3DNone):
-	bus =3D dbus.SystemBus()
-	for path, ifaces in objects.iteritems():
-		device =3D ifaces.get(DEVICE_INTERFACE)
-		if device is None:
-			continue
-		if not pattern or path.endswith(pattern):
-			obj =3D bus.get_object(SERVICE_NAME, path)
-			return dbus.Interface(obj, DEVICE_INTERFACE)
-	raise Exception("NFC device not found")
+        bus =3D dbus.SystemBus()
+        for path, ifaces in objects.iteritems():
+                device =3D ifaces.get(DEVICE_INTERFACE)
+                if device is None:
+                        continue
+                if not pattern or path.endswith(pattern):
+                        obj =3D bus.get_object(SERVICE_NAME, path)
+                        return dbus.Interface(obj, DEVICE_INTERFACE)
+        raise Exception("NFC device not found")
 =

 def find_tag(pattern=3DNone):
-	return find_tag_in_objects(get_managed_objects(), pattern)
+        return find_tag_in_objects(get_managed_objects(), pattern)
 =

 def find_tag_in_objects(objects, pattern=3DNone):
-	bus =3D dbus.SystemBus()
-	for path, ifaces in objects.iteritems():
-		tag =3D ifaces.get(TAG_INTERFACE)
-		if tag is None:
-			continue
-		if not pattern or path.endswith(pattern):
-			obj =3D bus.get_object(SERVICE_NAME, path)
-			return dbus.Interface(obj, TAG_INTERFACE)
-	raise Exception("NFC tag not found")
+        bus =3D dbus.SystemBus()
+        for path, ifaces in objects.iteritems():
+                tag =3D ifaces.get(TAG_INTERFACE)
+                if tag is None:
+                        continue
+                if not pattern or path.endswith(pattern):
+                        obj =3D bus.get_object(SERVICE_NAME, path)
+                        return dbus.Interface(obj, TAG_INTERFACE)
+        raise Exception("NFC tag not found")
 =

 def find_record(pattern=3DNone):
-	return find_record_in_objects(get_managed_objects(), pattern)
+        return find_record_in_objects(get_managed_objects(), pattern)
 =

 def find_record_in_objects(objects, pattern=3DNone):
-	bus =3D dbus.SystemBus()
-	for path, ifaces in objects.iteritems():
-		record =3D ifaces.get(RECORD_INTERFACE)
-		if record is None:
-			continue
-		if not pattern or path.endswith(pattern):
-			obj =3D bus.get_object(SERVICE_NAME, path)
-			return dbus.Interface(obj, RECORD_INTERFACE)
-	raise Exception("NFC record not found")
+        bus =3D dbus.SystemBus()
+        for path, ifaces in objects.iteritems():
+                record =3D ifaces.get(RECORD_INTERFACE)
+                if record is None:
+                        continue
+                if not pattern or path.endswith(pattern):
+                        obj =3D bus.get_object(SERVICE_NAME, path)
+                        return dbus.Interface(obj, RECORD_INTERFACE)
+        raise Exception("NFC record not found")
 =

 def dump_record(record_path):
-	bus =3D dbus.SystemBus()
-	record_prop =3D dbus.Interface(bus.get_object(SERVICE_NAME, record_path),
-					"org.freedesktop.DBus.Properties")
+        bus =3D dbus.SystemBus()
+        record_prop =3D dbus.Interface(bus.get_object(SERVICE_NAME, record=
_path),
+                                        "org.freedesktop.DBus.Properties")
 =

-	properties =3D record_prop.GetAll(RECORD_INTERFACE)
+        properties =3D record_prop.GetAll(RECORD_INTERFACE)
 =

-	for key in properties.keys():
-		if key in ["Representation"]:
-			val =3D unicode(properties[key])
-		else:
-			val =3D str(properties[key])
-		print "      %s =3D %s" % (key, val)
+        for key in properties.keys():
+                if key in ["Representation"]:
+                        val =3D unicode(properties[key])
+                else:
+                        val =3D str(properties[key])
+                print "      %s =3D %s" % (key, val)
 =

 def dump_all_records(path):
-	bus =3D dbus.SystemBus()
-	om =3D dbus.Interface(bus.get_object(SERVICE_NAME, "/"),
-					"org.freedesktop.DBus.ObjectManager")
-	objects =3D om.GetManagedObjects()
-	for path, interfaces in objects.iteritems():
-		if RECORD_INTERFACE not in interfaces:
-			continue
+        bus =3D dbus.SystemBus()
+        om =3D dbus.Interface(bus.get_object(SERVICE_NAME, "/"),
+                                        "org.freedesktop.DBus.ObjectManage=
r")
+        objects =3D om.GetManagedObjects()
+        for path, interfaces in objects.iteritems():
+                if RECORD_INTERFACE not in interfaces:
+                        continue
 =

-		if path.startswith(path):
-			print("  [ %s ]" % (path))
-			dump_record(path)
+                if path.startswith(path):
+                        print("  [ %s ]" % (path))
+                        dump_record(path)
diff --git a/test/phdc-simple-manager b/test/phdc-simple-manager
index 4fd25df541d8..e802c5a3252c 100755
--- a/test/phdc-simple-manager
+++ b/test/phdc-simple-manager
@@ -42,38 +42,38 @@ assoc_release_res =3D "E50000020000"
 #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 # Display helper
 def hexdump( chars, sep, width ):
-	while chars:
-		line =3D chars[:width]
-		chars =3D chars[width:]
-		line =3D line.ljust( width, '\000' )
-		print "%s%s%s" % ( sep.join( "%02x" % ord(c) for c in line ),
-			 sep, quotechars( line ))
+        while chars:
+                line =3D chars[:width]
+                chars =3D chars[width:]
+                line =3D line.ljust( width, '\000' )
+                print "%s%s%s" % ( sep.join( "%02x" % ord(c) for c in line=
 ),
+                         sep, quotechars( line ))
 =

 =

 def quotechars( chars ):
-	return ''.join( ['.', c][c.isalnum()] for c in chars )
+        return ''.join( ['.', c][c.isalnum()] for c in chars )
 =

 #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 class PhdcPeerManager:
     def __init__(self, agent_fd):
-	#Grab the agent ....
-	print 'Init PhdcPeerManager thread'
-	self.r_fd =3D agent_fd.take()
-	print 'Agent fd:', str(self.r_fd)
+        #Grab the agent ....
+        print 'Init PhdcPeerManager thread'
+        self.r_fd =3D agent_fd.take()
+        print 'Agent fd:', str(self.r_fd)
 =

     def run( self):
-	print 'Run PhdcPeerManager thread: ', str(self.r_fd)
-	self.sock =3D socket.fromfd(self.r_fd, AF_NFC, socket.SOCK_STREAM)
+        print 'Run PhdcPeerManager thread: ', str(self.r_fd)
+        self.sock =3D socket.fromfd(self.r_fd, AF_NFC, socket.SOCK_STREAM)
         try:
             while True:
-		miu =3D self.sock.getsockopt(SOL_NFC, NFC_LLCP_MIUX)
-		print 'MIU=3D', miu
+                miu =3D self.sock.getsockopt(SOL_NFC, NFC_LLCP_MIUX)
+                print 'MIU=3D', miu
 =

                 while True:
                     data =3D self.sock.recv(16)
                     if data =3D=3D None:
-		       print 'no data'
-		       break
+                       print 'no data'
+                       break
 =

                    #analyze frame
                     print 'analyze'
@@ -104,90 +104,90 @@ class PhdcPeerManager:
                 self.sock.close()
 =

         except IOError as e:
-		if e.errno =3D=3D errno.EPIPE:
-			print 'Remote disconnect'
-		else:
-			print "I/O error({0}): {1}".format(e.errno, e.strerror)
+                if e.errno =3D=3D errno.EPIPE:
+                        print 'Remote disconnect'
+                else:
+                        print "I/O error({0}): {1}".format(e.errno, e.stre=
rror)
         finally:
-		print 'Finally exit'
-		stop()
+                print 'Finally exit'
+                stop()
 =

-	def stop(self):
-		print 'Stop PhdcPeerManager:', str(self.r_fd)
-		self._Thread__stop()
+        def stop(self):
+                print 'Stop PhdcPeerManager:', str(self.r_fd)
+                self._Thread__stop()
 =

 #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
 ''' Phdc Manager Class
 '''
 class SimplePhdcManager(dbus.service.Object):
 =

-	@dbus.service.method('org.neard.PHDC.Manager',
-					in_signature=3D'',
-					out_signature=3D'')
-	def Release(self):
-		print 'Release'
-		mainloop.quit()
-
-
-	''' Called on incoming agents
-	'''
-	@dbus.service.method('org.neard.PHDC.Manager',
-					in_signature=3D'h',
-					out_signature=3D'')
-	def NewConnection(self, agent_fd):
-		print'Launch Phdc Manager thread for fd:', str(agent_fd)
-		self.server =3D PhdcPeerManager(agent_fd)
-		print'Run Server'
-		self.server.run()
-		print'Leave Server'
-		return
-
-	''' Called when the agent ends (from phdc_close)
-	'''
-	@dbus.service.method('org.neard.PHDC.Manager',
-					in_signature=3D'hi', out_signature=3D'')
-	def Disconnection(self,agent_fd, i_err):
-		print'Stop Phdc Manager thread'
-		self.server.stop()
-		return
+        @dbus.service.method('org.neard.PHDC.Manager',
+                                        in_signature=3D'',
+                                        out_signature=3D'')
+        def Release(self):
+                print 'Release'
+                mainloop.quit()
+
+
+        ''' Called on incoming agents
+        '''
+        @dbus.service.method('org.neard.PHDC.Manager',
+                                        in_signature=3D'h',
+                                        out_signature=3D'')
+        def NewConnection(self, agent_fd):
+                print'Launch Phdc Manager thread for fd:', str(agent_fd)
+                self.server =3D PhdcPeerManager(agent_fd)
+                print'Run Server'
+                self.server.run()
+                print'Leave Server'
+                return
+
+        ''' Called when the agent ends (from phdc_close)
+        '''
+        @dbus.service.method('org.neard.PHDC.Manager',
+                                        in_signature=3D'hi', out_signature=
=3D'')
+        def Disconnection(self,agent_fd, i_err):
+                print'Stop Phdc Manager thread'
+                self.server.stop()
+                return
 =

 ''' Main loop
 This sample installs two PHDC Managers:
-	* Simple: simulates a thermometer data exchange
-	* Validation: Validation Manager for NFC Forum PHDC)
+        * Simple: simulates a thermometer data exchange
+        * Validation: Validation Manager for NFC Forum PHDC)
 '''
 if "__main__" =3D=3D __name__:
-	dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
+        dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
 =

-	print 'PHDC Simple Manager Test'
-	bus =3D dbus.SystemBus()
-	obj =3D bus.get_object("org.neard", "/org/neard");
-	neard_manager =3D dbus.Interface(obj, "org.neard.PHDC")
+        print 'PHDC Simple Manager Test'
+        bus =3D dbus.SystemBus()
+        obj =3D bus.get_object("org.neard", "/org/neard");
+        neard_manager =3D dbus.Interface(obj, "org.neard.PHDC")
 =

-	simple_path =3D '/Simple'
-	valid_path =3D '/Validation'
+        simple_path =3D '/Simple'
+        valid_path =3D '/Validation'
 =

-	print 'Creating & registering PHDC Simple Manager'
-	simpleobject =3D SimplePhdcManager(bus, simple_path)
+        print 'Creating & registering PHDC Simple Manager'
+        simpleobject =3D SimplePhdcManager(bus, simple_path)
 =

-	d =3D dbus.Dictionary({'Role': 'Manager', 'Path': simple_path,
-			'ServiceName': 'urn:nfc:sn:phdc' }, signature=3D'sv')
-	neard_manager.RegisterAgent(d)
+        d =3D dbus.Dictionary({'Role': 'Manager', 'Path': simple_path,
+                        'ServiceName': 'urn:nfc:sn:phdc' }, signature=3D's=
v')
+        neard_manager.RegisterAgent(d)
 =

-	print 'Creating & Registering Validation Manager'
+        print 'Creating & Registering Validation Manager'
 =

-	validationobj=3D SimplePhdcManager(bus, valid_path)
-	d =3D dbus.Dictionary({'Role': 'Manager', 'Path': valid_path,
-		'ServiceName': 'urn:nfc:xsn:nfc-forum.org:phdc-validation' },
-		 signature=3D'sv')
-	neard_manager.RegisterAgent(d)
+        validationobj=3D SimplePhdcManager(bus, valid_path)
+        d =3D dbus.Dictionary({'Role': 'Manager', 'Path': valid_path,
+                'ServiceName': 'urn:nfc:xsn:nfc-forum.org:phdc-validation'=
 },
+                 signature=3D'sv')
+        neard_manager.RegisterAgent(d)
 =

-	mainloop =3D gobject.MainLoop()
+        mainloop =3D gobject.MainLoop()
 =

 try:
         mainloop.run()
 =

 except(KeyboardInterrupt):
-	#Call for unregister...
+        #Call for unregister...
         neard_manager.UnregisterAgent(simple_path, 'Manager')
         neard_manager.UnregisterAgent(valid_path, 'Manager')
diff --git a/test/test-adapter b/test/test-adapter
index 173519e46d99..93b6f96e33ca 100755
--- a/test/test-adapter
+++ b/test/test-adapter
@@ -7,101 +7,101 @@ import neardutils
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
-	print("Usage: %s <command>" % (sys.argv[0]) )
-	print("")
-	print("  list")
-	print("  powered nfcX [on/off]")
-	print("  poll nfcX [on/off] [Initiator/Target/Dual]")
-	sys.exit(1)
+        print("Usage: %s <command>" % (sys.argv[0]) )
+        print("")
+        print("  list")
+        print("  powered nfcX [on/off]")
+        print("  poll nfcX [on/off] [Initiator/Target/Dual]")
+        sys.exit(1)
 =

 if (len(sys.argv) < 2):
-	usage()
+        usage()
 =

 if (sys.argv[1] =3D=3D "list"):
-	if (len(sys.argv) < 3):
-		objects =3D neardutils.get_managed_objects()
-		for path, interfaces in objects.iteritems():
-			if "org.neard.Adapter" not in interfaces:
-				continue
+        if (len(sys.argv) < 3):
+                objects =3D neardutils.get_managed_objects()
+                for path, interfaces in objects.iteritems():
+                        if "org.neard.Adapter" not in interfaces:
+                                continue
 =

-			print(" [ %s ]" % (path))
+                        print(" [ %s ]" % (path))
 =

-			props =3D interfaces["org.neard.Adapter"]
+                        props =3D interfaces["org.neard.Adapter"]
 =

-			for (key, value) in props.items():
-				if (key =3D=3D "Protocols"):
-					val =3D extract_list(value)
-					print("    %s =3D %s" % (key, val))
+                        for (key, value) in props.items():
+                                if (key =3D=3D "Protocols"):
+                                        val =3D extract_list(value)
+                                        print("    %s =3D %s" % (key, val))
 =

-				elif key in ["Powered", "Polling"]:
-					if value =3D=3D dbus.Boolean(1):
-						val =3D "true"
-					else:
-						val =3D "false"
-					print("    %s =3D %s" % (key, val))
+                                elif key in ["Powered", "Polling"]:
+                                        if value =3D=3D dbus.Boolean(1):
+                                                val =3D "true"
+                                        else:
+                                                val =3D "false"
+                                        print("    %s =3D %s" % (key, val))
 =

-				else:
-					print("    %s =3D %s" % (key, value))
+                                else:
+                                        print("    %s =3D %s" % (key, valu=
e))
 =

-		sys.exit(0)
+                sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "powered"):
-	if (len(sys.argv) < 4):
-		usage()
-	else:
-		path =3D "/org/neard/" + sys.argv[2]
-
-		adapter_path =3D neardutils.find_adapter(path).object_path
-		adapter =3D dbus.Interface(bus.get_object("org.neard", adapter_path),
-					"org.freedesktop.DBus.Properties")
-
-		if (sys.argv[3] =3D=3D "on"):
-			value =3D dbus.Boolean(1)
-		elif (sys.argv[3] =3D=3D "off"):
-			value =3D dbus.Boolean(0)
-		else:
-			value =3D dbus.Boolean(sys.argv[3])
-		try:
-			adapter.Set("org.neard.Adapter", "Powered", value)
-		except dbus.DBusException, error:
-			print "%s: %s" % (error._dbus_error_name, error.message)
-	sys.exit(0)
+        if (len(sys.argv) < 4):
+                usage()
+        else:
+                path =3D "/org/neard/" + sys.argv[2]
+
+                adapter_path =3D neardutils.find_adapter(path).object_path
+                adapter =3D dbus.Interface(bus.get_object("org.neard", ada=
pter_path),
+                                        "org.freedesktop.DBus.Properties")
+
+                if (sys.argv[3] =3D=3D "on"):
+                        value =3D dbus.Boolean(1)
+                elif (sys.argv[3] =3D=3D "off"):
+                        value =3D dbus.Boolean(0)
+                else:
+                        value =3D dbus.Boolean(sys.argv[3])
+                try:
+                        adapter.Set("org.neard.Adapter", "Powered", value)
+                except dbus.DBusException, error:
+                        print "%s: %s" % (error._dbus_error_name, error.me=
ssage)
+        sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "poll"):
-	if (len(sys.argv) < 4):
-		usage()
-	else:
-		path =3D "/org/neard/" + sys.argv[2]
-
-		adapter =3D neardutils.find_adapter(path)
-
-		if (sys.argv[3] =3D=3D "on"):
-			if (len(sys.argv) =3D=3D 4):
-				mode =3D "Initiator"
-			else:
-				mode =3D sys.argv[4]
-
-			try:
-				adapter.StartPollLoop(mode)
-			except dbus.DBusException, error:
-				print "%s: %s" % (error._dbus_error_name, error.message)
-
-		elif (sys.argv[3] =3D=3D "off"):
-			try:
-				adapter.StopPollLoop()
-			except dbus.DBusException, error:
-				print "%s: %s" % (error._dbus_error_name, error.message)
-
-		else:
-			usage()
-
-	sys.exit(0)
+        if (len(sys.argv) < 4):
+                usage()
+        else:
+                path =3D "/org/neard/" + sys.argv[2]
+
+                adapter =3D neardutils.find_adapter(path)
+
+                if (sys.argv[3] =3D=3D "on"):
+                        if (len(sys.argv) =3D=3D 4):
+                                mode =3D "Initiator"
+                        else:
+                                mode =3D sys.argv[4]
+
+                        try:
+                                adapter.StartPollLoop(mode)
+                        except dbus.DBusException, error:
+                                print "%s: %s" % (error._dbus_error_name, =
error.message)
+
+                elif (sys.argv[3] =3D=3D "off"):
+                        try:
+                                adapter.StopPollLoop()
+                        except dbus.DBusException, error:
+                                print "%s: %s" % (error._dbus_error_name, =
error.message)
+
+                else:
+                        usage()
+
+        sys.exit(0)
 =

 usage()
diff --git a/test/test-device b/test/test-device
index 1c90ef1e5d32..bc66ce3f01cd 100755
--- a/test/test-device
+++ b/test/test-device
@@ -7,110 +7,110 @@ import neardutils
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
-	print("Usage: %s <command>" % (sys.argv[0]) )
-	print("")
-	print("  list")
-	print("  dump <device>")
-	print("  push <device> <type> <...>")
-	print "	   If type is Text, parameters are <encoding> <language> <represe=
ntation>"
-	print "	   If type is URI, parameters are <uri>"
-	print "	   If type is SmartPoster, parameters are <uri>"
-	print "	   If type is Handover, parameters are <carrier>"
-	print "	   If type is StaticHandover, parameters are <carrier>"
-	print "    If type is MIME, parameters are <mime_type> (only wifi_wsc and=
 raw)"
-	print "       raw is for sending raw payload, parameters are <mime_type> =
<payload>"
-	print "e.g. < %s push /org/neard/nfc0/device0 Text UTF-8 en-US hello,Type=
2! >" % (sys.argv[0])
-	print "e.g. < %s push /org/neard/nfc0/device0 URI http://www.nfc-forum.co=
m >" % (sys.argv[0])
-	print "e.g. < %s push /org/neard/nfc0/device0 SmartPoster http://www.nfc-=
forum.com >" % (sys.argv[0])
-	print "e.g. < %s push /org/neard/nfc0/device0 Handover bluetooth,wifi >" =
% (sys.argv[0])
-	print "e.g. < %s push /org/neard/nfc0/device0 StaticHandover bluetooth,wi=
fi >" % (sys.argv[0])
-	print "e.g. < %s push /org/neard/nfc0/device0 MIME wifi_wsc>" % (sys.argv=
[0])
-	print "e.g. < %s push /org/neard/nfc0/device0 MIME raw application/xml '<=
your><xml tags></your>' >" % (sys.argv[0])
-
-	sys.exit(1)
+        print("Usage: %s <command>" % (sys.argv[0]) )
+        print("")
+        print("  list")
+        print("  dump <device>")
+        print("  push <device> <type> <...>")
+        print "    If type is Text, parameters are <encoding> <language> <=
representation>"
+        print "    If type is URI, parameters are <uri>"
+        print "    If type is SmartPoster, parameters are <uri>"
+        print "    If type is Handover, parameters are <carrier>"
+        print "    If type is StaticHandover, parameters are <carrier>"
+        print "    If type is MIME, parameters are <mime_type> (only wifi_=
wsc and raw)"
+        print "       raw is for sending raw payload, parameters are <mime=
_type> <payload>"
+        print "e.g. < %s push /org/neard/nfc0/device0 Text UTF-8 en-US hel=
lo,Type2! >" % (sys.argv[0])
+        print "e.g. < %s push /org/neard/nfc0/device0 URI http://www.nfc-f=
orum.com >" % (sys.argv[0])
+        print "e.g. < %s push /org/neard/nfc0/device0 SmartPoster http://w=
ww.nfc-forum.com >" % (sys.argv[0])
+        print "e.g. < %s push /org/neard/nfc0/device0 Handover bluetooth,w=
ifi >" % (sys.argv[0])
+        print "e.g. < %s push /org/neard/nfc0/device0 StaticHandover bluet=
ooth,wifi >" % (sys.argv[0])
+        print "e.g. < %s push /org/neard/nfc0/device0 MIME wifi_wsc>" % (s=
ys.argv[0])
+        print "e.g. < %s push /org/neard/nfc0/device0 MIME raw application=
/xml '<your><xml tags></your>' >" % (sys.argv[0])
+
+        sys.exit(1)
 =

 if (len(sys.argv) < 2):
-	usage()
+        usage()
 =

 if (sys.argv[1] =3D=3D "list"):
-	if (len(sys.argv) < 3):
-		objects =3D neardutils.get_managed_objects()
-		for path, interfaces in objects.iteritems():
-			if "org.neard.Device" not in interfaces:
-				continue
+        if (len(sys.argv) < 3):
+                objects =3D neardutils.get_managed_objects()
+                for path, interfaces in objects.iteritems():
+                        if "org.neard.Device" not in interfaces:
+                                continue
 =

-			print(" [ %s ]" % (path))
+                        print(" [ %s ]" % (path))
 =

-			props =3D interfaces["org.neard.Device"]
+                        props =3D interfaces["org.neard.Device"]
 =

-			for (key, value) in props.items():
-				print("    %s =3D %s" % (key, value))
+                        for (key, value) in props.items():
+                                print("    %s =3D %s" % (key, value))
 =

-		sys.exit(0)
+                sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "dump"):
-	if (len(sys.argv) < 3):
-		objects =3D neardutils.get_managed_objects()
-		for path, interfaces in objects.iteritems():
-			if "org.neard.Device" not in interfaces:
-				continue
+        if (len(sys.argv) < 3):
+                objects =3D neardutils.get_managed_objects()
+                for path, interfaces in objects.iteritems():
+                        if "org.neard.Device" not in interfaces:
+                                continue
 =

-			print("[ %s ]" % (path))
-			neardutils.dump_all_records(path)
+                        print("[ %s ]" % (path))
+                        neardutils.dump_all_records(path)
 =

-		sys.exit(0)
-	else:
-		neardutils.dump_all_records(sys.argv[2])
+                sys.exit(0)
+        else:
+                neardutils.dump_all_records(sys.argv[2])
 =

-		sys.exit(0)
+                sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "push"):
-   	if (len(sys.argv) < 5):
-		usage()
-	=

-	device =3D neardutils.find_device(sys.argv[2])
-
-	if len(sys.argv) =3D=3D 7:
-		if sys.argv[3] in ["Text"]:
-			device.Push(({ "Type" : "Text",
-				"Encoding" : sys.argv[4],
-				"Language" : sys.argv[5],
-				"Representation" : sys.argv[6] }))
-		elif sys.argv[3] in ["MIME"]:
-			if sys.argv[4] in ["raw"]:
-				device.Push(({ "Type" : "MIME",
-				       "MIME" : sys.argv[5],
-				       "Payload" : dbus.ByteArray(sys.argv[6]) }))
-		else:
-			usage()
-
-	elif len(sys.argv) =3D=3D 5:
-		if sys.argv[3] in ["URI"]:
-			device.Push(({ "Type" : "URI",
-				"URI" : sys.argv[4] }))
-		elif sys.argv[3] in ["SmartPoster"]:
-		     	device.Push(({ "Type" : "SmartPoster",
-				"URI" : sys.argv[4] }))
-		elif sys.argv[3] in ["Handover"]:
-		     	device.Push(({ "Type" : "Handover",
-				"Carrier" : sys.argv[4] }))
-		elif sys.argv[3] in ["StaticHandover"]:
-		     	device.Push(({ "Type" : "StaticHandover",
-				"Carrier" : sys.argv[4] }))
-		elif sys.argv[3] in ["MIME"]:
-		     	if sys.argv[4] in ["wifi_wsc"]:
-				device.Push(({ "Type" : "MIME",
-					"MIME" : "application/vnd.wfa.wsc"}))
-		else:
-			usage()
-	else:
-		usage()
-
-	sys.exit(0)
+        if (len(sys.argv) < 5):
+                usage()
+        =

+        device =3D neardutils.find_device(sys.argv[2])
+
+        if len(sys.argv) =3D=3D 7:
+                if sys.argv[3] in ["Text"]:
+                        device.Push(({ "Type" : "Text",
+                                "Encoding" : sys.argv[4],
+                                "Language" : sys.argv[5],
+                                "Representation" : sys.argv[6] }))
+                elif sys.argv[3] in ["MIME"]:
+                        if sys.argv[4] in ["raw"]:
+                                device.Push(({ "Type" : "MIME",
+                                       "MIME" : sys.argv[5],
+                                       "Payload" : dbus.ByteArray(sys.argv=
[6]) }))
+                else:
+                        usage()
+
+        elif len(sys.argv) =3D=3D 5:
+                if sys.argv[3] in ["URI"]:
+                        device.Push(({ "Type" : "URI",
+                                "URI" : sys.argv[4] }))
+                elif sys.argv[3] in ["SmartPoster"]:
+                        device.Push(({ "Type" : "SmartPoster",
+                                "URI" : sys.argv[4] }))
+                elif sys.argv[3] in ["Handover"]:
+                        device.Push(({ "Type" : "Handover",
+                                "Carrier" : sys.argv[4] }))
+                elif sys.argv[3] in ["StaticHandover"]:
+                        device.Push(({ "Type" : "StaticHandover",
+                                "Carrier" : sys.argv[4] }))
+                elif sys.argv[3] in ["MIME"]:
+                        if sys.argv[4] in ["wifi_wsc"]:
+                                device.Push(({ "Type" : "MIME",
+                                        "MIME" : "application/vnd.wfa.wsc"=
}))
+                else:
+                        usage()
+        else:
+                usage()
+
+        sys.exit(0)
diff --git a/test/test-tag b/test/test-tag
index cb2c9e84d7fa..9f7f58851cc9 100755
--- a/test/test-tag
+++ b/test/test-tag
@@ -7,176 +7,176 @@ import neardutils
 bus =3D dbus.SystemBus()
 =

 def usage():
-	print("Usage: %s <command>" % sys.argv[0])
-	text =3D """
+        print("Usage: %s <command>" % sys.argv[0])
+        text =3D """
 list
 dump <tag>
 deactivate <tag>
 write <tag> <type> <...>
 =

-	If type is Text, parameters are <encoding> <language> <representation>
-	If type is URI, parameters are <uri>
-	If type is SmartPoster, parameters are <uri>
-	If type is SMS, parameters are <phone number> <text>
-	If type is E-Mail, parameters are <e-mail address>
-	If type is MIME, and WiFi AP is passphrase protected
-		Type is MIME, parameters are wifi_wsc <ssid> <passphrase>
-	If type is MIME, and WiFi AP is open network
-		Type is MIME, parameters are wifi_wsc <ssid>
-	For MIME with arbitrary content, parameters are:
-			<ContentType> <Content>
+        If type is Text, parameters are <encoding> <language> <representat=
ion>
+        If type is URI, parameters are <uri>
+        If type is SmartPoster, parameters are <uri>
+        If type is SMS, parameters are <phone number> <text>
+        If type is E-Mail, parameters are <e-mail address>
+        If type is MIME, and WiFi AP is passphrase protected
+                Type is MIME, parameters are wifi_wsc <ssid> <passphrase>
+        If type is MIME, and WiFi AP is open network
+                Type is MIME, parameters are wifi_wsc <ssid>
+        For MIME with arbitrary content, parameters are:
+                        <ContentType> <Content>
 =

 For example: # %s write /org/neard/nfc0/tag0 \\
-	Text UTF-8 en-US hello,NFC!
-	URI http://www.nfc-forum.com
-	SmartPoster http://www.nfc-forum.com
-	SMS 0102030405 YourSMSMessage
-	E-Mail test(a)test.com
-	MIME wifi_wsc YourAPname passphrase
-	MIME wifi_wsc YourAPname
-	MIME 'application/octet-stream' 1234
+        Text UTF-8 en-US hello,NFC!
+        URI http://www.nfc-forum.com
+        SmartPoster http://www.nfc-forum.com
+        SMS 0102030405 YourSMSMessage
+        E-Mail test(a)test.com
+        MIME wifi_wsc YourAPname passphrase
+        MIME wifi_wsc YourAPname
+        MIME 'application/octet-stream' 1234
 """
-	print(text % sys.argv[0])
+        print(text % sys.argv[0])
 =

-	sys.exit(1)
+        sys.exit(1)
 =

 if (len(sys.argv) < 2):
-	usage()
+        usage()
 =

 if (sys.argv[1] =3D=3D "list"):
-	if (len(sys.argv) < 3):
-		objects =3D neardutils.get_managed_objects()
-		for path, interfaces in objects.iteritems():
-			if "org.neard.Tag" not in interfaces:
-				continue
+        if (len(sys.argv) < 3):
+                objects =3D neardutils.get_managed_objects()
+                for path, interfaces in objects.iteritems():
+                        if "org.neard.Tag" not in interfaces:
+                                continue
 =

-			print(" [ %s ]" % (path))
+                        print(" [ %s ]" % (path))
 =

-			props =3D interfaces["org.neard.Tag"]
+                        props =3D interfaces["org.neard.Tag"]
 =

-			for (key, value) in props.items():
-				if key in ["ReadOnly"]:
-					if value =3D=3D dbus.Boolean(1):
-						val =3D "true"
-					else:
-						val =3D "false"
-					print("    %s =3D %s" % (key, val))
+                        for (key, value) in props.items():
+                                if key in ["ReadOnly"]:
+                                        if value =3D=3D dbus.Boolean(1):
+                                                val =3D "true"
+                                        else:
+                                                val =3D "false"
+                                        print("    %s =3D %s" % (key, val))
 =

-				else:
-					print("    %s =3D %s" % (key, value))
+                                else:
+                                        print("    %s =3D %s" % (key, valu=
e))
 =

-		sys.exit(0)
+                sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "dump"):
-	if (len(sys.argv) < 3):
-		objects =3D neardutils.get_managed_objects()
-		for path, interfaces in objects.iteritems():
-			if "org.neard.Tag" not in interfaces:
-				continue
+        if (len(sys.argv) < 3):
+                objects =3D neardutils.get_managed_objects()
+                for path, interfaces in objects.iteritems():
+                        if "org.neard.Tag" not in interfaces:
+                                continue
 =

-			print("[ %s ]" % (path))
-			neardutils.dump_all_records(path)
+                        print("[ %s ]" % (path))
+                        neardutils.dump_all_records(path)
 =

-		sys.exit(0)
-	else:
-		neardutils.dump_all_records(sys.argv[2])
+                sys.exit(0)
+        else:
+                neardutils.dump_all_records(sys.argv[2])
 =

-		sys.exit(0)
+                sys.exit(0)
 =

 def write_mime(args):
 =

-	data =3D { "Type" : "MIME" }
+        data =3D { "Type" : "MIME" }
 =

-	if len(args) < 2:
-		usage()
+        if len(args) < 2:
+                usage()
 =

-	if args[0] =3D=3D "wifi_wsc":
+        if args[0] =3D=3D "wifi_wsc":
 =

-		data["MIME"] =3D "application/vnd.wfa.wsc"
-		data["SSID"] =3D args[1]
+                data["MIME"] =3D "application/vnd.wfa.wsc"
+                data["SSID"] =3D args[1]
 =

-		if len(args) > 2:
+                if len(args) > 2:
 =

-			data["Passphrase"] =3D args[2]
-	else:
-		data["MIME"] =3D args[0]
-		data["MIMEPayload"] =3D dbus.ByteArray(args[1])
+                        data["Passphrase"] =3D args[2]
+        else:
+                data["MIME"] =3D args[0]
+                data["MIMEPayload"] =3D dbus.ByteArray(args[1])
 =

-	tag.Write(data)
+        tag.Write(data)
 =

 def write_uri(args):
 =

-	data =3D { }
-	records =3D [ ]
+        data =3D { }
+        records =3D [ ]
 =

-	if len(args) > 1:
+        if len(args) > 1:
 =

-		for i in args:
+                for i in args:
 =

-			record =3D { }
+                        record =3D { }
 =

-			record["Type"] =3D dbus.String("URI", variant_level =3D 1)
-			record["URI"] =3D dbus.String(i, variant_level =3D 1)
+                        record["Type"] =3D dbus.String("URI", variant_leve=
l =3D 1)
+                        record["URI"] =3D dbus.String(i, variant_level =3D=
 1)
 =

-			records.append(record)
+                        records.append(record)
 =

-		data["Records"] =3D records
+                data["Records"] =3D records
 =

-	else:
+        else:
 =

-		data["Type"] =3D "URI"
-		data["URI"] =3D args[0]
+                data["Type"] =3D "URI"
+                data["URI"] =3D args[0]
 =

-	print data
+        print data
 =

-	tag.Write(data)
+        tag.Write(data)
 =

 if (sys.argv[1] =3D=3D "write"):
-	if (len(sys.argv) < 5):
-		usage()
+        if (len(sys.argv) < 5):
+                usage()
 =

-	tag =3D neardutils.find_tag(sys.argv[2])
+        tag =3D neardutils.find_tag(sys.argv[2])
 =

-	if sys.argv[3] in ["Text"]:
-		tag.Write(({ "Type" : "Text",
-			"Encoding" : sys.argv[4],
-			"Language" : sys.argv[5],
-			"Representation" : sys.argv[6] }))
+        if sys.argv[3] in ["Text"]:
+                tag.Write(({ "Type" : "Text",
+                        "Encoding" : sys.argv[4],
+                        "Language" : sys.argv[5],
+                        "Representation" : sys.argv[6] }))
 =

-	elif sys.argv[3] =3D=3D "URI":
-		write_uri(sys.argv[4:])
+        elif sys.argv[3] =3D=3D "URI":
+                write_uri(sys.argv[4:])
 =

-	elif sys.argv[3] in ["SmartPoster"]:
-		tag.Write(({ "Type" : "SmartPoster",
-			"URI" : sys.argv[4] }))
+        elif sys.argv[3] in ["SmartPoster"]:
+                tag.Write(({ "Type" : "SmartPoster",
+                        "URI" : sys.argv[4] }))
 =

-	elif sys.argv[3] in ["SMS"]:
-		URI =3D "sms:" + sys.argv[4] + "?body=3D" + sys.argv[5]
-		tag.Write(({ "Type" : "URI",
-			"URI" : URI }))
+        elif sys.argv[3] in ["SMS"]:
+                URI =3D "sms:" + sys.argv[4] + "?body=3D" + sys.argv[5]
+                tag.Write(({ "Type" : "URI",
+                        "URI" : URI }))
 =

-	elif sys.argv[3] in ["E-Mail"]:
-		URI =3D "mailto:" + sys.argv[4]
-		tag.Write(({ "Type" : "URI",
-			"URI" : URI }))
+        elif sys.argv[3] in ["E-Mail"]:
+                URI =3D "mailto:" + sys.argv[4]
+                tag.Write(({ "Type" : "URI",
+                        "URI" : URI }))
 =

-	elif sys.argv[3] in ["MIME"]:
-		write_mime(sys.argv[4:])
+        elif sys.argv[3] in ["MIME"]:
+                write_mime(sys.argv[4:])
 =

-	else:
-		usage()
+        else:
+                usage()
 =

-	sys.exit(0)
+        sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "deactivate"):
-	print sys.argv[2]
-	if (len(sys.argv) !=3D 2):
-		tag =3D neardutils.find_tag(sys.argv[2])
-		tag.Deactivate()
-	else:
-		usage()
+        print sys.argv[2]
+        if (len(sys.argv) !=3D 2):
+                tag =3D neardutils.find_tag(sys.argv[2])
+                tag.Deactivate()
+        else:
+                usage()
 =

-	sys.exit(0)
+        sys.exit(0)
 =

 else:
-	usage()
+        usage()
-- =

2.33.1

--===============2585341945420390999==--

