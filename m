Content-Type: multipart/mixed; boundary="===============1186541223016299629=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 3/6] test: Reformat Python test scripts
Date: Sun, 28 Nov 2021 22:06:03 -0700
Message-ID: <20211129050606.873494-4-mgreer@animalcreek.com>
In-Reply-To: <20211129050606.873494-1-mgreer@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1186541223016299629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Reformat the Python-based test scripts using the "Prettier"
beautifiers (default options). This brings the code closer to
conformance with the PEP 8 style guide.

Signed-off-by: Mark Greer <mgreer@animalcreek.com>
---
 test/bt-handover         | 249 ++++++++++++++++++--------------
 test/handover-agent      | 284 +++++++++++++++++++++---------------
 test/monitor-near        |  76 +++++-----
 test/ndef-agent          | 112 +++++++--------
 test/neard-ui.py         | 304 +++++++++++++++++++++------------------
 test/neardutils.py       | 138 ++++++++++--------
 test/phdc-simple-manager | 228 +++++++++++++++--------------
 test/test-adapter        | 156 ++++++++++----------
 test/test-device         | 218 ++++++++++++++++------------
 test/test-tag            | 204 +++++++++++++-------------
 10 files changed, 1076 insertions(+), 893 deletions(-)

diff --git a/test/bt-handover b/test/bt-handover
index eebae9338e00..468e58cb18a8 100755
--- a/test/bt-handover
+++ b/test/bt-handover
@@ -13,119 +13,152 @@ from dbus.lowlevel import MethodCallMessage, HANDLER_=
RESULT_NOT_YET_HANDLED
 =

 mainloop =3D gobject.MainLoop()
 =

-def device_added(path, interfaces):
-        for iface, props in interfaces.items():
-                if "org.neard.Device" in interfaces:
-                        print("Pairing with %s" % (path))
-                        device =3D dbus.Interface(bus.get_object("org.near=
d", path),
-                                                        "org.neard.Device")
-                        device.Push(({ "Type" : "Handover", "Carrier" : "b=
luetooth"}))
-                        break
-
-def device_removed(path, interfaces):
-        for iface in interfaces:
-                if "org.neard.Device" in interfaces:
-                        print("Lost device %s" % (path))
-                        mainloop.quit()
-                        break
-
-def remove_paired_devices(bt_adapter):
-        manager =3D dbus.Interface(bus.get_object("org.bluez", "/"),
-                                        "org.freedesktop.DBus.ObjectManage=
r")
-        objects =3D manager.GetManagedObjects()
 =

-        all_adapters =3D (path for path, interfaces in objects.items() if
-                                "org.bluez.Adapter1" in interfaces.keys()
-                                and path.endswith(bt_adapter))
-
-        bluez_adapter =3D None
-        for adapter in sorted(all_adapters):
-                bluez_adapter =3D dbus.Interface(bus.get_object("org.bluez=
",
-                                                        adapter),
-                                                        "org.bluez.Adapter=
1")
-                break
-
-        if(bluez_adapter is None):
-                print("Bluetooth adapter %s could not be found" % bluez_ad=
apter)
-                exit()
+def device_added(path, interfaces):
+    for iface, props in interfaces.items():
+        if "org.neard.Device" in interfaces:
+            print("Pairing with %s" % (path))
+            device =3D dbus.Interface(
+                bus.get_object("org.neard", path), "org.neard.Device"
+            )
+            device.Push(({"Type": "Handover", "Carrier": "bluetooth"}))
+            break
 =

-        adapter_path =3D bluez_adapter.object_path
-        print("Using %s" % adapter_path)
 =

-        adapter_props =3D dbus.Interface(bus.get_object("org.bluez", adapt=
er_path),
-                                        "org.freedesktop.DBus.Properties")
+def device_removed(path, interfaces):
+    for iface in interfaces:
+        if "org.neard.Device" in interfaces:
+            print("Lost device %s" % (path))
+            mainloop.quit()
+            break
 =

-        powered =3D adapter_props.Get("org.bluez.Adapter1", "Powered")
-        if (powered =3D=3D dbus.Boolean(0)):
-                print("Bluetooth adapter %s is not powered" % adapter_path=
 )
-                exit()
 =

-        all_devices =3D (path for path, interfaces in objects.items() if
-                                ("org.bluez.Device1" in interfaces.keys()
-                                and path.startswith(bluez_adapter.object_p=
ath)))
+def remove_paired_devices(bt_adapter):
+    manager =3D dbus.Interface(
+        bus.get_object("org.bluez", "/"), "org.freedesktop.DBus.ObjectMana=
ger"
+    )
+    objects =3D manager.GetManagedObjects()
+
+    all_adapters =3D (
+        path
+        for path, interfaces in objects.items()
+        if "org.bluez.Adapter1" in interfaces.keys() and path.endswith(bt_=
adapter)
+    )
+
+    bluez_adapter =3D None
+    for adapter in sorted(all_adapters):
+        bluez_adapter =3D dbus.Interface(
+            bus.get_object("org.bluez", adapter), "org.bluez.Adapter1"
+        )
+        break
+
+    if bluez_adapter is None:
+        print("Bluetooth adapter %s could not be found" % bluez_adapter)
+        exit()
+
+    adapter_path =3D bluez_adapter.object_path
+    print("Using %s" % adapter_path)
+
+    adapter_props =3D dbus.Interface(
+        bus.get_object("org.bluez", adapter_path), "org.freedesktop.DBus.P=
roperties"
+    )
+
+    powered =3D adapter_props.Get("org.bluez.Adapter1", "Powered")
+    if powered =3D=3D dbus.Boolean(0):
+        print("Bluetooth adapter %s is not powered" % adapter_path)
+        exit()
+
+    all_devices =3D (
+        path
+        for path, interfaces in objects.items()
+        if (
+            "org.bluez.Device1" in interfaces.keys()
+            and path.startswith(bluez_adapter.object_path)
+        )
+    )
+
+    for device in all_devices:
+        print("Removing %s" % (device))
+        bluez_adapter.RemoveDevice(device)
 =

-        for device in all_devices:
-                print("Removing %s" % (device))
-                bluez_adapter.RemoveDevice(device)
 =

 def remove_paired_devices_bluez4():
-        bluez_manager =3D dbus.Interface(bus.get_object("org.bluez", "/"),
-                                        "org.bluez.Manager")
-
-        bluez_adapter_path =3D bluez_manager.DefaultAdapter()
-        bluez_adapter =3D dbus.Interface(bus.get_object("org.bluez",
-                                                bluez_adapter_path),
-                                                "org.bluez.Adapter")
-
-        print("Using %s" % bluez_adapter.object_path)
-
-        for bluez_path in bluez_adapter.ListDevices():
-                print("Removing %s" % (bluez_path))
-                bluez_adapter.RemoveDevice(bluez_path)
-
-if __name__ =3D=3D '__main__':
-        parser =3D OptionParser()
-        parser.add_option("", "--bluez4", action=3D"store_true",
-                                dest=3D"use_bluez4",
-                                help=3D"Use BlueZ 4 to remove paired devic=
es.")
-        parser.add_option("-a", "--adapter", metavar=3D"BT_ADAPTER",
-                                dest=3D"bt_adapter", default=3D"",
-                                help=3D"The bluetooth adapter that is used=
 by "
-                                        "the bluetooth stack. This options=
 is "
-                                        "ignored when using BlueZ 4, inste=
ad "
-                                        "the default adapter is used.")
-        (options, args) =3D parser.parse_args()
-
-        dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
-
-        bus =3D dbus.SystemBus()
-
-        adapter_path =3D neardutils.find_adapter().object_path
-        print("Adapter path %s" % (adapter_path))
-        adapter =3D dbus.Interface(bus.get_object("org.neard", adapter_pat=
h),
-                                                        "org.neard.Adapter=
")
-
-        adapter_props =3D dbus.Interface(bus.get_object("org.neard", adapt=
er_path),
-                                        "org.freedesktop.DBus.Properties")
-        powered =3D adapter_props.Get("org.neard.Adapter", "Powered")
-        if (powered =3D=3D dbus.Boolean(0)):
-                adapter_props.Set("org.neard.Adapter", "Powered", dbus.Boo=
lean(1))
-
-        if (options.use_bluez4):
-                remove_paired_devices_bluez4()
-        else:
-                remove_paired_devices(options.bt_adapter)
-
-        polling =3D adapter_props.Get("org.neard.Adapter", "Polling")
-        if (polling =3D=3D dbus.Boolean(0)):
-                adapter.StartPollLoop("Initiator")
-
-        bus.add_signal_receiver(device_added, bus_name=3D"org.neard",
-                        dbus_interface=3D"org.freedesktop.DBus.ObjectManag=
er",
-                        signal_name=3D"InterfacesAdded")
-
-        bus.add_signal_receiver(device_removed, bus_name=3D"org.neard",
-                        dbus_interface=3D"org.freedesktop.DBus.ObjectManag=
er",
-                        signal_name=3D"InterfacesRemoved")
-
-        mainloop.run()
+    bluez_manager =3D dbus.Interface(
+        bus.get_object("org.bluez", "/"), "org.bluez.Manager"
+    )
+
+    bluez_adapter_path =3D bluez_manager.DefaultAdapter()
+    bluez_adapter =3D dbus.Interface(
+        bus.get_object("org.bluez", bluez_adapter_path), "org.bluez.Adapte=
r"
+    )
+
+    print("Using %s" % bluez_adapter.object_path)
+
+    for bluez_path in bluez_adapter.ListDevices():
+        print("Removing %s" % (bluez_path))
+        bluez_adapter.RemoveDevice(bluez_path)
+
+
+if __name__ =3D=3D "__main__":
+    parser =3D OptionParser()
+    parser.add_option(
+        "",
+        "--bluez4",
+        action=3D"store_true",
+        dest=3D"use_bluez4",
+        help=3D"Use BlueZ 4 to remove paired devices.",
+    )
+    parser.add_option(
+        "-a",
+        "--adapter",
+        metavar=3D"BT_ADAPTER",
+        dest=3D"bt_adapter",
+        default=3D"",
+        help=3D"The bluetooth adapter that is used by "
+        "the bluetooth stack. This options is "
+        "ignored when using BlueZ 4, instead "
+        "the default adapter is used.",
+    )
+    (options, args) =3D parser.parse_args()
+
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
+
+    bus =3D dbus.SystemBus()
+
+    adapter_path =3D neardutils.find_adapter().object_path
+    print("Adapter path %s" % (adapter_path))
+    adapter =3D dbus.Interface(
+        bus.get_object("org.neard", adapter_path), "org.neard.Adapter"
+    )
+
+    adapter_props =3D dbus.Interface(
+        bus.get_object("org.neard", adapter_path), "org.freedesktop.DBus.P=
roperties"
+    )
+    powered =3D adapter_props.Get("org.neard.Adapter", "Powered")
+    if powered =3D=3D dbus.Boolean(0):
+        adapter_props.Set("org.neard.Adapter", "Powered", dbus.Boolean(1))
+
+    if options.use_bluez4:
+        remove_paired_devices_bluez4()
+    else:
+        remove_paired_devices(options.bt_adapter)
+
+    polling =3D adapter_props.Get("org.neard.Adapter", "Polling")
+    if polling =3D=3D dbus.Boolean(0):
+        adapter.StartPollLoop("Initiator")
+
+    bus.add_signal_receiver(
+        device_added,
+        bus_name=3D"org.neard",
+        dbus_interface=3D"org.freedesktop.DBus.ObjectManager",
+        signal_name=3D"InterfacesAdded",
+    )
+
+    bus.add_signal_receiver(
+        device_removed,
+        bus_name=3D"org.neard",
+        dbus_interface=3D"org.freedesktop.DBus.ObjectManager",
+        signal_name=3D"InterfacesRemoved",
+    )
+
+    mainloop.run()
diff --git a/test/handover-agent b/test/handover-agent
index bed79a87cf09..5efc55ac6efd 100755
--- a/test/handover-agent
+++ b/test/handover-agent
@@ -7,134 +7,180 @@ import dbus.service
 import dbus.mainloop.glib
 from optparse import OptionParser
 =

-eir_test_data =3D [0x16,0x00\
-                ,0x01,0x02,0x03,0x04,0x05,0x06\
-                ,0x08,0x09,0x41,0x72,0x72,0x61,0x6b,0x69,0x73\
-                ,0x04,0x0d,0x6e,0x01,0x00]
-
-wsc_test_data =3D [0x10,0x4A,0x00,0x01,0x10\
-                ,0x10,0x45,0x00,0x08\
-                ,0x74,0x65,0x73,0x74,0x73,0x73,0x69,0x64\
-                ,0x10,0x27,0x00,0x06\
-                ,0x62,0x6C,0x61,0x62,0x6C,0x61]
+eir_test_data =3D [
+    0x16,
+    0x00,
+    0x01,
+    0x02,
+    0x03,
+    0x04,
+    0x05,
+    0x06,
+    0x08,
+    0x09,
+    0x41,
+    0x72,
+    0x72,
+    0x61,
+    0x6B,
+    0x69,
+    0x73,
+    0x04,
+    0x0D,
+    0x6E,
+    0x01,
+    0x00,
+]
+
+wsc_test_data =3D [
+    0x10,
+    0x4A,
+    0x00,
+    0x01,
+    0x10,
+    0x10,
+    0x45,
+    0x00,
+    0x08,
+    0x74,
+    0x65,
+    0x73,
+    0x74,
+    0x73,
+    0x73,
+    0x69,
+    0x64,
+    0x10,
+    0x27,
+    0x00,
+    0x06,
+    0x62,
+    0x6C,
+    0x61,
+    0x62,
+    0x6C,
+    0x61,
+]
 =

 power_state =3D None
 =

+
 def print_fields(fields):
-        if 'EIR' in fields:
-                s =3D ' '.join('{:#02x}'.format(i) for i in fields['EIR'])
-                print('  EIR:  %s' % s)
+    if "EIR" in fields:
+        s =3D " ".join("{:#02x}".format(i) for i in fields["EIR"])
+        print("  EIR:  %s" % s)
+
+    if "nokia.com:bt" in fields:
+        s =3D " ".join("{:#02x}".format(i) for i in fields["nokia.com:bt"])
+        print("  nokia.com:bt:  %s" % s)
 =

-        if 'nokia.com:bt' in fields:
-                s =3D ' '.join('{:#02x}'.format(i) for i in fields['nokia.=
com:bt'])
-                print('  nokia.com:bt:  %s' % s)
+    if "State" in fields:
+        print("  State: %s" % fields["State"])
 =

-        if 'State' in fields:
-                print('  State: %s' % fields['State'])
+    if "WSC" in fields:
+        s =3D " ".join("{:#02x}".format(i) for i in fields["WSC"])
+        print("  WSC:  %s" % s)
 =

-        if 'WSC' in fields:
-                s =3D ' '.join('{:#02x}'.format(i) for i in fields['WSC'])
-                print('  WSC:  %s' % s)
 =

 class BTHOAgent(dbus.service.Object):
+    @dbus.service.method("org.neard.HandoverAgent", in_signature=3D"", out=
_signature=3D"")
+    def Release(self):
+        print("Release")
+        mainloop.quit()
+
+    @dbus.service.method(
+        "org.neard.HandoverAgent", in_signature=3D"a{sv}", out_signature=
=3D""
+    )
+    def PushOOB(self, fields):
+        print("PushOOB")
+        print_fields(fields)
+
+    @dbus.service.method(
+        "org.neard.HandoverAgent", in_signature=3D"a{sv}", out_signature=
=3D"a{sv}"
+    )
+    def RequestOOB(self, fields):
+        print("RequestOOB")
+        print_fields(fields)
+
+        print("  Replying with")
+        s =3D " ".join("{:#02x}".format(i) for i in eir_test_data)
+        print("    EIR: %s" % s)
+
+        if power_state !=3D "unknown":
+            print("    State: %s" % power_state)
+            return {"EIR": eir_test_data, "State": power_state}
+        else:
+            return {"EIR": eir_test_data}
 =

-        @dbus.service.method('org.neard.HandoverAgent',
-                                        in_signature=3D'',
-                                        out_signature=3D'')
-        def Release(self):
-                print('Release')
-                mainloop.quit()
-
-        @dbus.service.method('org.neard.HandoverAgent',
-                                        in_signature=3D'a{sv}',
-                                        out_signature=3D'')
-        def PushOOB(self, fields):
-                print('PushOOB')
-                print_fields(fields)
-
-        @dbus.service.method('org.neard.HandoverAgent',
-                                        in_signature=3D'a{sv}',
-                                        out_signature=3D'a{sv}')
-
-        def RequestOOB(self, fields):
-                print('RequestOOB')
-                print_fields(fields)
-
-                print('  Replying with')
-                s =3D ' '.join('{:#02x}'.format(i) for i in eir_test_data)
-                print('    EIR: %s' % s)
-
-                if power_state !=3D 'unknown':
-                        print('    State: %s' % power_state)
-                        return {'EIR' : eir_test_data, 'State' : power_sta=
te}
-                else:
-                        return {'EIR' : eir_test_data}
 =

 class WiFiHOAgent(dbus.service.Object):
-
-        @dbus.service.method('org.neard.HandoverAgent',
-                                        in_signature=3D'',
-                                        out_signature=3D'')
-        def Release(self):
-                print('Release')
-                mainloop.quit()
-
-        @dbus.service.method('org.neard.HandoverAgent',
-                                        in_signature=3D'a{sv}',
-                                        out_signature=3D'')
-        def PushOOB(self, fields):
-                print('PushOOB')
-                print_fields(fields)
-
-        @dbus.service.method('org.neard.HandoverAgent',
-                                        in_signature=3D'a{sv}',
-                                        out_signature=3D'a{sv}')
-
-        def RequestOOB(self, fields):
-                print('RequestOOB')
-                print_fields(fields)
-
-                print('  Replying with')
-                s =3D ' '.join('{:#02x}'.format(i) for i in wsc_test_data)
-                print('    WSC: %s' % s)
-
-                if power_state !=3D 'unknown':
-                        print('    State: %s' % power_state)
-                        return {'WSC' : wsc_test_data, 'State' : power_sta=
te}
-                else:
-                        return {'WSC' : wsc_test_data}
-
-if __name__ =3D=3D '__main__':
-        dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
-
-        bus =3D dbus.SystemBus()
-
-        parser =3D OptionParser()
-        parser.add_option("-s", "--power-state", action=3D"store", type=3D=
"string",
-                                dest=3D"power_state", default=3D"active",
-                                help=3D"active inactive activating unknown=
")
-        (options, args) =3D parser.parse_args()
-
-        power_state =3D options.power_state
-
-        obj =3D bus.get_object("org.neard", "/org/neard");
-        manager =3D dbus.Interface(obj, "org.neard.AgentManager")
-
-        btpath =3D '/test/handover/bt/agent'
-        btcarrier =3D 'bluetooth'
-        btobject =3D BTHOAgent(bus, btpath)
-
-        wifipath =3D '/test/handover/wifi/agent'
-        wificarrier =3D 'wifi'
-        wifiobject =3D WiFiHOAgent(bus, wifipath)
-
-        manager.RegisterHandoverAgent(btpath, btcarrier)
-        manager.RegisterHandoverAgent(wifipath, wificarrier)
-
-        mainloop =3D gobject.MainLoop()
-
-        try:
-                mainloop.run()
-        except (KeyboardInterrupt):
-                manager.UnregisterHandoverAgent(btpath, btcarrier)
-                manager.UnregisterHandoverAgent(wifipath, wificarrier)
+    @dbus.service.method("org.neard.HandoverAgent", in_signature=3D"", out=
_signature=3D"")
+    def Release(self):
+        print("Release")
+        mainloop.quit()
+
+    @dbus.service.method(
+        "org.neard.HandoverAgent", in_signature=3D"a{sv}", out_signature=
=3D""
+    )
+    def PushOOB(self, fields):
+        print("PushOOB")
+        print_fields(fields)
+
+    @dbus.service.method(
+        "org.neard.HandoverAgent", in_signature=3D"a{sv}", out_signature=
=3D"a{sv}"
+    )
+    def RequestOOB(self, fields):
+        print("RequestOOB")
+        print_fields(fields)
+
+        print("  Replying with")
+        s =3D " ".join("{:#02x}".format(i) for i in wsc_test_data)
+        print("    WSC: %s" % s)
+
+        if power_state !=3D "unknown":
+            print("    State: %s" % power_state)
+            return {"WSC": wsc_test_data, "State": power_state}
+        else:
+            return {"WSC": wsc_test_data}
+
+
+if __name__ =3D=3D "__main__":
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
+
+    bus =3D dbus.SystemBus()
+
+    parser =3D OptionParser()
+    parser.add_option(
+        "-s",
+        "--power-state",
+        action=3D"store",
+        type=3D"string",
+        dest=3D"power_state",
+        default=3D"active",
+        help=3D"active inactive activating unknown",
+    )
+    (options, args) =3D parser.parse_args()
+
+    power_state =3D options.power_state
+
+    obj =3D bus.get_object("org.neard", "/org/neard")
+    manager =3D dbus.Interface(obj, "org.neard.AgentManager")
+
+    btpath =3D "/test/handover/bt/agent"
+    btcarrier =3D "bluetooth"
+    btobject =3D BTHOAgent(bus, btpath)
+
+    wifipath =3D "/test/handover/wifi/agent"
+    wificarrier =3D "wifi"
+    wifiobject =3D WiFiHOAgent(bus, wifipath)
+
+    manager.RegisterHandoverAgent(btpath, btcarrier)
+    manager.RegisterHandoverAgent(wifipath, wificarrier)
+
+    mainloop =3D gobject.MainLoop()
+
+    try:
+        mainloop.run()
+    except (KeyboardInterrupt):
+        manager.UnregisterHandoverAgent(btpath, btcarrier)
+        manager.UnregisterHandoverAgent(wifipath, wificarrier)
diff --git a/test/monitor-near b/test/monitor-near
index d6cd24f9f64f..7211b6ab477c 100755
--- a/test/monitor-near
+++ b/test/monitor-near
@@ -5,40 +5,52 @@ import gobject
 import dbus
 import dbus.mainloop.glib
 =

-def property_changed(interface, changed, invalidated, path):
-        iface =3D interface[interface.rfind(".") + 1:]
-        for name, value in changed.items():
-                val =3D str(value)
-                print("{%s.PropertyChanged} [%s] %s =3D %s" % (iface, path=
, name,
-                                                                        va=
l))
-
-def interfaces_added(path, interfaces):
-        for iface, props in interfaces.items():
-                print("{Added %s} [%s]" % (iface, path))
-                for name, value in props.items():
-                        print("      %s =3D %s" % (name, value))
-
-def interfaces_removed(path, interfaces):
-        for iface in interfaces:
-                print("{Removed %s} [%s]" % (iface, path))
 =

-if __name__ =3D=3D '__main__':
-        dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
-
-        bus =3D dbus.SystemBus()
+def property_changed(interface, changed, invalidated, path):
+    iface =3D interface[interface.rfind(".") + 1 :]
+    for name, value in changed.items():
+        val =3D str(value)
+        print("{%s.PropertyChanged} [%s] %s =3D %s" % (iface, path, name, =
val))
 =

-        bus.add_signal_receiver(property_changed, bus_name=3D"org.neard",
-                        dbus_interface=3D"org.freedesktop.DBus.Properties",
-                        signal_name=3D"PropertiesChanged",
-                        path_keyword=3D"path")
 =

-        bus.add_signal_receiver(interfaces_added, bus_name=3D"org.neard",
-                        dbus_interface=3D"org.freedesktop.DBus.ObjectManag=
er",
-                        signal_name=3D"InterfacesAdded")
+def interfaces_added(path, interfaces):
+    for iface, props in interfaces.items():
+        print("{Added %s} [%s]" % (iface, path))
+        for name, value in props.items():
+            print("      %s =3D %s" % (name, value))
 =

-        bus.add_signal_receiver(interfaces_removed, bus_name=3D"org.neard",
-                        dbus_interface=3D"org.freedesktop.DBus.ObjectManag=
er",
-                        signal_name=3D"InterfacesRemoved")
 =

-        mainloop =3D gobject.MainLoop()
-        mainloop.run()
+def interfaces_removed(path, interfaces):
+    for iface in interfaces:
+        print("{Removed %s} [%s]" % (iface, path))
+
+
+if __name__ =3D=3D "__main__":
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
+
+    bus =3D dbus.SystemBus()
+
+    bus.add_signal_receiver(
+        property_changed,
+        bus_name=3D"org.neard",
+        dbus_interface=3D"org.freedesktop.DBus.Properties",
+        signal_name=3D"PropertiesChanged",
+        path_keyword=3D"path",
+    )
+
+    bus.add_signal_receiver(
+        interfaces_added,
+        bus_name=3D"org.neard",
+        dbus_interface=3D"org.freedesktop.DBus.ObjectManager",
+        signal_name=3D"InterfacesAdded",
+    )
+
+    bus.add_signal_receiver(
+        interfaces_removed,
+        bus_name=3D"org.neard",
+        dbus_interface=3D"org.freedesktop.DBus.ObjectManager",
+        signal_name=3D"InterfacesRemoved",
+    )
+
+    mainloop =3D gobject.MainLoop()
+    mainloop.run()
diff --git a/test/ndef-agent b/test/ndef-agent
index 72fcecf9d3a1..cb62ecd8c840 100755
--- a/test/ndef-agent
+++ b/test/ndef-agent
@@ -7,72 +7,70 @@ import dbus.service
 import dbus.mainloop.glib
 import sys
 =

+
 class NDEFAgent(dbus.service.Object):
+    @dbus.service.method("org.neard.NDEFAgent", in_signature=3D"", out_sig=
nature=3D"")
+    def Release(self):
+        print("Release")
+        mainloop.quit()
+
+    @dbus.service.method("org.neard.NDEFAgent", in_signature=3D"a{sv}", ou=
t_signature=3D"")
+    def GetNDEF(self, fields):
+        print("GetNDEF")
+
+        if fields.has_key("Record"):
+            print("Record path %s" % (fields["Record"]))
+
+        if fields.has_key("Payload"):
+            val =3D "["
+            for i in fields["Payload"]:
+                val +=3D " 0x%x" % i
+            val +=3D " ]"
+            print("Record payload %s" % val)
+
+        if fields.has_key("NDEF"):
+            val =3D "["
+            for i in fields["NDEF"]:
+                val +=3D " 0x%x" % i
+            val +=3D " ]"
+            print("Complete NDEF %s" % val)
+
+        return
+
+    @dbus.service.method("org.neard.NDEFAgent", in_signature=3D"", out_sig=
nature=3D"")
+    def Cancel(self):
+        print("Cancel")
 =

-        @dbus.service.method("org.neard.NDEFAgent",
-                                        in_signature=3D'', out_signature=
=3D'')
-        def Release(self):
-                print("Release")
-                mainloop.quit()
-
-        @dbus.service.method("org.neard.NDEFAgent",
-                                        in_signature=3D'a{sv}',
-                                        out_signature=3D'')
-        def GetNDEF(self, fields):
-                print("GetNDEF")
-
-                if fields.has_key("Record"):
-                        print("Record path %s" % (fields["Record"]))
-
-                if fields.has_key("Payload"):
-                        val =3D "["
-                        for i in fields["Payload"]:
-                                val +=3D " 0x%x" % i
-                        val +=3D " ]"
-                        print("Record payload %s" % val)
-
-                if fields.has_key("NDEF"):
-                        val =3D "["
-                        for i in fields["NDEF"]:
-                                val +=3D " 0x%x" % i
-                        val +=3D " ]"
-                        print("Complete NDEF %s" % val)
-
-                return
-
-        @dbus.service.method("org.neard.NDEFAgent",
-                                        in_signature=3D'', out_signature=
=3D'')
-        def Cancel(self):
-                print("Cancel")
 =

 def print_usage():
-        print("Usage:")
-        print("%s Type=3D<record type>" % (sys.argv[0]))
-        print("Help: %s help" % (sys.argv[0]))
-        sys.exit(1)
+    print("Usage:")
+    print("%s Type=3D<record type>" % (sys.argv[0]))
+    print("Help: %s help" % (sys.argv[0]))
+    sys.exit(1)
+
 =

-if __name__ =3D=3D '__main__':
-        if len(sys.argv) !=3D 2:
-                print_usage()
+if __name__ =3D=3D "__main__":
+    if len(sys.argv) !=3D 2:
+        print_usage()
 =

-        if len(sys.argv) =3D=3D 2 and sys.argv[1] =3D=3D "help":
-                print_usage()
+    if len(sys.argv) =3D=3D 2 and sys.argv[1] =3D=3D "help":
+        print_usage()
 =

-        dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
 =

-        bus =3D dbus.SystemBus()
-        obj =3D bus.get_object("org.neard", "/org/neard");
-        manager =3D dbus.Interface(obj, "org.neard.AgentManager")
+    bus =3D dbus.SystemBus()
+    obj =3D bus.get_object("org.neard", "/org/neard")
+    manager =3D dbus.Interface(obj, "org.neard.AgentManager")
 =

-        path =3D "/test/ndef/agent"
-        object =3D NDEFAgent(bus, path)
-        rec_type =3D sys.argv[1].replace("Type=3D", "", 1)
+    path =3D "/test/ndef/agent"
+    object =3D NDEFAgent(bus, path)
+    rec_type =3D sys.argv[1].replace("Type=3D", "", 1)
 =

-        manager.RegisterNDEFAgent(path, rec_type)
+    manager.RegisterNDEFAgent(path, rec_type)
 =

-        mainloop =3D gobject.MainLoop()
+    mainloop =3D gobject.MainLoop()
 =

-        try:
-                mainloop.run()
-        except (KeyboardInterrupt):
-                manager.UnregisterNDEFAgent(path, rec_type)
+    try:
+        mainloop.run()
+    except (KeyboardInterrupt):
+        manager.UnregisterNDEFAgent(path, rec_type)
diff --git a/test/neard-ui.py b/test/neard-ui.py
index e960891eccf0..bb6ae3ad4c1e 100755
--- a/test/neard-ui.py
+++ b/test/neard-ui.py
@@ -16,7 +16,6 @@ import neardutils
 =

 ##=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 class Neard:
-
     def interface_Added(self, path, interface):
         print(" New interface added: %s" % path)
         self.objects =3D neardutils.get_managed_objects()
@@ -27,25 +26,30 @@ class Neard:
         self.objects =3D neardutils.get_managed_objects()
         self.interface_updateDetails(interface)
 =

-
-    #connect to the object_manager in order to be notified on
-    #add/remove interface
+    # connect to the object_manager in order to be notified on
+    # add/remove interface
     def interfaces_Connect(self):
         try:
-            print('interfaces_Connect')
+            print("interfaces_Connect")
             bus =3D dbus.SystemBus()
             self.objects =3D neardutils.get_managed_objects()
-            bus.add_signal_receiver(self.interface_Added, bus_name=3Dneard=
utils.SERVICE_NAME,
-                                    dbus_interface=3D"org.freedesktop.DBus=
.ObjectManager",
-                                    signal_name=3D"InterfacesAdded")
-            bus.add_signal_receiver(self.interface_Removed, bus_name=3Dnea=
rdutils.SERVICE_NAME,
-                                    dbus_interface=3D"org.freedesktop.DBus=
.ObjectManager",
-                                    signal_name=3D"InterfacesRemoved")
+            bus.add_signal_receiver(
+                self.interface_Added,
+                bus_name=3Dneardutils.SERVICE_NAME,
+                dbus_interface=3D"org.freedesktop.DBus.ObjectManager",
+                signal_name=3D"InterfacesAdded",
+            )
+            bus.add_signal_receiver(
+                self.interface_Removed,
+                bus_name=3Dneardutils.SERVICE_NAME,
+                dbus_interface=3D"org.freedesktop.DBus.ObjectManager",
+                signal_name=3D"InterfacesRemoved",
+            )
         except:
-            print("Can't connect to org.freedesktop.DBus.ObjectManager");
+            print("Can't connect to org.freedesktop.DBus.ObjectManager")
             self.objects =3D None
 =

-        #Retrieve the manager informations
+        # Retrieve the manager informations
         self.interface_getDetails()
 =

     def interface_getDetails(self):
@@ -59,7 +63,7 @@ class Neard:
         elif neardutils.RECORD_INTERFACE in interface:
             self.record_updateDetails(path)
 =

-    def adapter_PropertyChanged(self, prop, value, adapt_path =3D None):
+    def adapter_PropertyChanged(self, prop, value, adapt_path=3DNone):
         print("Prop changed: %s" % prop)
         adapt_properties =3D {}
         adapt_properties[prop] =3D value
@@ -68,7 +72,7 @@ class Neard:
         else:
             self.adapter_update(adapt_path, adapt_properties)
 =

-    #Update the records UI
+    # Update the records UI
     def record_updateDetails(self, tag_path=3DNone):
         if tag_path is not None:
             for record_path, record_iface in self.objects.items():
@@ -85,7 +89,7 @@ class Neard:
         else:
             self.records_update()
 =

-    #Update the tags UI
+    # Update the tags UI
     def tag_updateDetails(self, adapter_path=3DNone):
         if adapter_path is not None:
             for tag_path, interfaces in self.objects.items():
@@ -99,35 +103,33 @@ class Neard:
                 self.tagregistered[tag_path] =3D True
                 # call UI update
                 self.tags_update(tag_path, tag_properties)
-                #Process the records
+                # Process the records
                 self.record_updateDetails(tag_properties)
         else:
             print("remove tags and records")
             self.tags_update()
             self.records_update()
 =

-
-    #Something changed, must update the UI
+    # Something changed, must update the UI
     def adapter_updateDetails(self):
         for adapt_path, interfaces in self.objects.items():
             if neardutils.ADAPTER_INTERFACE not in interfaces:
-                   continue
+                continue
 =

             if adapt_path in self.adaptregistered:
-                   print(" already registered %s" % adapt_path)
+                print(" already registered %s" % adapt_path)
             else:
-                   adapt_properties =3D interfaces[neardutils.ADAPTER_INTE=
RFACE]
-
-                   self.adaptregistered[adapt_path] =3D True
+                adapt_properties =3D interfaces[neardutils.ADAPTER_INTERFA=
CE]
 =

-                   #Update display info
-                   self.adapter_update(adapt_path, adapt_properties)
+                self.adaptregistered[adapt_path] =3D True
 =

-                   #udpate UI for tags
-                   self.tag_updateDetails()
+                # Update display info
+                self.adapter_update(adapt_path, adapt_properties)
 =

+                # udpate UI for tags
+                self.tag_updateDetails()
 =

-    #Search DBUS to find any neard instance
+    # Search DBUS to find any neard instance
     def neardNameOwnerChanged(self, proxy):
         if proxy:
             print("Neard is connected to System bus")
@@ -138,9 +140,14 @@ class Neard:
             self.adaptregistered =3D {}
             self.interface_getDetails()
 =

-    #Main init function
-    def __init__(self, adapter_update =3D None, adapters_remove =3D None,
-                  tags_update =3D None, records_update =3D None):
+    # Main init function
+    def __init__(
+        self,
+        adapter_update=3DNone,
+        adapters_remove=3DNone,
+        tags_update=3DNone,
+        records_update=3DNone,
+    ):
         self.test =3D False
         self.adapter_update =3D adapter_update
         self.adapters_remove =3D adapters_remove
@@ -153,9 +160,11 @@ class Neard:
 =

         self.systemBus =3D dbus.SystemBus()
 =

-        #Prepare the first handler
-        self.systemBus.watch_name_owner(neardutils.SERVICE_NAME,
-                                        self.neardNameOwnerChanged)
+        # Prepare the first handler
+        self.systemBus.watch_name_owner(
+            neardutils.SERVICE_NAME, self.neardNameOwnerChanged
+        )
+
 =

 ##=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 class NeardUI(Neard):
@@ -174,8 +183,10 @@ class NeardUI(Neard):
             i =3D self.adapters_list.get_iter(path)
             objpath =3D self.adapters_list.get_value(i, 0)
             adapt_iface =3D neardutils.find_adapter(path)
-            adapter =3D dbus.Interface(bus.get_object(neardutils.SERVICE_N=
AME, adapt_iface.object_path),
-                                     "org.freedesktop.DBus.Properties")
+            adapter =3D dbus.Interface(
+                bus.get_object(neardutils.SERVICE_NAME, adapt_iface.object=
_path),
+                "org.freedesktop.DBus.Properties",
+            )
 =

             try:
                 if self.adapters_actionToggle(i, 2):
@@ -209,18 +220,18 @@ class NeardUI(Neard):
             except:
                 print("Can't toggle polling on adapter %s" % objpath)
 =

-    #------------------------------
-    #Set the field values
-    def adapters_setUIList(self, adapt_properties, i, col, name, path =3D =
None):
+    # ------------------------------
+    # Set the field values
+    def adapters_setUIList(self, adapt_properties, i, col, name, path=3DNo=
ne):
         if name in adapt_properties:
             value =3D adapt_properties[name]
 =

             if name =3D=3D "Tags":
                 value =3D "{"
                 for tgts in adapt_properties[name]:
-                    #For each tag, add it to the tag lbox:
-                    #Trim path....
-                    short_tgt =3D tgts[len(path)+1:]
+                    # For each tag, add it to the tag lbox:
+                    # Trim path....
+                    short_tgt =3D tgts[len(path) + 1 :]
 =

                     if value =3D=3D "{":
                         value =3D "{" + short_tgt
@@ -244,8 +255,8 @@ class NeardUI(Neard):
     def adapter_RemoveUI(self):
         self.adapters_list.clear()
 =

-    #Add, Update or delete a list entry
-    def adapter_UpdateUI(self, path =3D None, adapt_properties =3D None):
+    # Add, Update or delete a list entry
+    def adapter_UpdateUI(self, path=3DNone, adapt_properties=3DNone):
         i =3D self.adapters_list.get_iter_first()
         while i is not None:
             if self.adapters_list.get_value(i, 0) =3D=3D path:
@@ -267,13 +278,12 @@ class NeardUI(Neard):
         else:
             print("Update adapter %s" % (path))
 =

-
         self.adapters_setUIList(adapt_properties, i, 2, "Powered")
         self.adapters_setUIList(adapt_properties, i, 3, "Polling")
         self.adapters_setUIList(adapt_properties, i, 4, "Protocols")
         self.adapters_setUIList(adapt_properties, i, 5, "Tags", path)
 =

-    #--------------------------------------------------
+    # --------------------------------------------------
     def tags_setUIList(self, tag_properties, i, col, name):
         if name in tag_properties:
             value =3D tag_properties[name]
@@ -281,7 +291,7 @@ class NeardUI(Neard):
             if name =3D=3D "Type":
                 value =3D None
                 for tags in tag_properties[name]:
-                    #For each tag, add it to the tag lbox:
+                    # For each tag, add it to the tag lbox:
                     if value is None:
                         value =3D tags
                     else:
@@ -291,8 +301,8 @@ class NeardUI(Neard):
                 self.tags_list.set_value(i, col, value)
             print("  property %s, value %s" % (name, value))
 =

-    #Add, Update or delete a list entry
-    def tag_UpdateUI(self, path =3D None, tag_properties =3D None):
+    # Add, Update or delete a list entry
+    def tag_UpdateUI(self, path=3DNone, tag_properties=3DNone):
         print("Tag Update %s" % path)
         i =3D self.tags_list.get_iter_first()
         while i is not None:
@@ -300,7 +310,7 @@ class NeardUI(Neard):
                 break
             i =3D self.tags_list.iter_next(i)
 =

-        #Delete mode: Remove all
+        # Delete mode: Remove all
         if tag_properties is None:
             i =3D self.tags_list.get_iter_first()
             while i is not None:
@@ -322,7 +332,7 @@ class NeardUI(Neard):
         self.tags_setUIList(tag_properties, i, 2, "ReadOnly")
         self.tags_setUIList(tag_properties, i, 3, "Type")
 =

-    #--------------------------------------------------
+    # --------------------------------------------------
     def records_setUIList(self, record_properties, i, col, name):
         if name in record_properties:
             value =3D record_properties[name]
@@ -330,16 +340,16 @@ class NeardUI(Neard):
             value =3D ""
             for rec_data in record_properties:
                 if rec_data !=3D "Type":
-                     if value !=3D "":
-                         value =3D value + "\n"
-                     value =3D value + rec_data + " :   " +record_properti=
es[rec_data]
+                    if value !=3D "":
+                        value =3D value + "\n"
+                    value =3D value + rec_data + " :   " + record_properti=
es[rec_data]
 =

         if value is not None:
             self.records_list.set_value(i, col, value)
         print("  property %s, value %s" % (name, value))
 =

-    #Add, Update or delete a list entry
-    def record_UpdateUI(self, path =3D None, record_properties =3D None):
+    # Add, Update or delete a list entry
+    def record_UpdateUI(self, path=3DNone, record_properties=3DNone):
         print("Record Update %s" % path)
         i =3D self.records_list.get_iter_first()
         while i is not None:
@@ -347,7 +357,7 @@ class NeardUI(Neard):
                 break
             i =3D self.records_list.iter_next(i)
 =

-         #Delete mode: Remove all records
+        # Delete mode: Remove all records
         if record_properties is None:
             i =3D self.records_list.get_iter_first()
             while i is not None:
@@ -370,25 +380,23 @@ class NeardUI(Neard):
         self.records_setUIList(record_properties, i, 2, "Type")
         self.records_setUIList(record_properties, i, 3, "Data")
 =

-
     def tag_RemoveUI(self):
         printf("Tag Remove")
 =

-    #Adapter selected on lbox
-    def on_adapter_sel_changed(self, selection =3D None):
+    # Adapter selected on lbox
+    def on_adapter_sel_changed(self, selection=3DNone):
         model, iter =3D selection.get_selected()
         if iter:
-             value =3D self.adapters_list.get_value(iter, 0)
-             print("value %s" % value)
-             value =3D self.adapters_list.get_value(iter, 5)
-             print("tag: %s" % value)
+            value =3D self.adapters_list.get_value(iter, 0)
+            print("value %s" % value)
+            value =3D self.adapters_list.get_value(iter, 5)
+            print("tag: %s" % value)
 =

-
-    #-----------------------------------------------------
+    # -----------------------------------------------------
     # Prepare TreeView  for Adapters
     def createAdaptersWidgets(self, adaptlist):
 =

-        #treeview adapters
+        # treeview adapters
         tv_adapters =3D gtk.TreeView(adaptlist)
 =

         column =3D gtk.TreeViewColumn("Path", gtk.CellRendererText(), text=
=3D0)
@@ -396,26 +404,24 @@ class NeardUI(Neard):
 =

         toggle =3D gtk.CellRendererToggle()
         column =3D gtk.TreeViewColumn("Powered", toggle, active=3D2)
-        toggle.connect('toggled', self.adapter_poweredToggled, None)
+        toggle.connect("toggled", self.adapter_poweredToggled, None)
         tv_adapters.append_column(column)
 =

         toggle =3D gtk.CellRendererToggle()
         column =3D gtk.TreeViewColumn("Polling", toggle, active=3D3)
-        toggle.connect('toggled', self.adapter_pollingToggled, None)
+        toggle.connect("toggled", self.adapter_pollingToggled, None)
         tv_adapters.append_column(column)
 =

-        column =3D gtk.TreeViewColumn("Protocols",gtk.CellRendererText(), =
text=3D4)
+        column =3D gtk.TreeViewColumn("Protocols", gtk.CellRendererText(),=
 text=3D4)
         tv_adapters.append_column(column)
 =

-        tv_adapters.get_selection().connect("changed",
-                                            self.on_adapter_sel_changed)
+        tv_adapters.get_selection().connect("changed", self.on_adapter_sel=
_changed)
 =

-        return tv_adapters;
+        return tv_adapters
 =

     # Prepare TreeView  for Tags
     def createTagsWidgets(self, tags_list):
 =

-
         tv_tags =3D gtk.TreeView(tags_list)
 =

         column =3D gtk.TreeViewColumn("Path", gtk.CellRendererText(), text=
=3D0)
@@ -427,11 +433,12 @@ class NeardUI(Neard):
         column =3D gtk.TreeViewColumn("Type", gtk.CellRendererText(), text=
=3D3)
         tv_tags.append_column(column)
 =

-        return tv_tags;#
+        return tv_tags
+        #
 =

     # Prepare TreeView  for Records
     def createRecordsWidgets(self, records_list):
-        #treeview Records
+        # treeview Records
         tv_records =3D gtk.TreeView(records_list)
         tv_records.connect("row-activated", self.on_record_activated)
 =

@@ -443,23 +450,23 @@ class NeardUI(Neard):
 =

         column =3D gtk.TreeViewColumn("Data", gtk.CellRendererText(), text=
=3D3)
         tv_records.append_column(column)
-        return tv_records;
+        return tv_records
 =

     # Prepare TreeView  for Records
     def createWriteWidgets(self, records_list):
-        #treeview Records
+        # treeview Records
         tv_records =3D gtk.TreeView(records_list)
-        #tv_records.connect("row-activated", self.on_record_activated)
+        # tv_records.connect("row-activated", self.on_record_activated)
 =

-        #column =3D gtk.TreeViewColumn("Path", gtk.CellRendererText(), tex=
t=3D0)
-        #tv_records.append_column(column)
+        # column =3D gtk.TreeViewColumn("Path", gtk.CellRendererText(), te=
xt=3D0)
+        # tv_records.append_column(column)
 =

-        #column =3D gtk.TreeViewColumn("Type", gtk.CellRendererText(), tex=
t=3D2)
-        #tv_records.append_column(column)
+        # column =3D gtk.TreeViewColumn("Type", gtk.CellRendererText(), te=
xt=3D2)
+        # tv_records.append_column(column)
 =

-        #column =3D gtk.TreeViewColumn("Data", gtk.CellRendererText(), tex=
t=3D3)
-        #tv_records.append_column(column)
-        return tv_records;
+        # column =3D gtk.TreeViewColumn("Data", gtk.CellRendererText(), te=
xt=3D3)
+        # tv_records.append_column(column)
+        return tv_records
 =

     def on_record_activated(self, widget, row, col):
         model =3D widget.get_model()
@@ -472,15 +479,17 @@ class NeardUI(Neard):
         if self.response_callback is not None:
             self.response_callback(response)
 =

-    #------------------------------
-    #Prepare the dialog
-    def createDialog(self, title =3D None):
+    # ------------------------------
+    # Prepare the dialog
+    def createDialog(self, title=3DNone):
         if self.title is not None:
             title =3D self.title
-        dialog =3D gtk.Dialog(title, None,
-                            gtk.DIALOG_MODAL |
-                            gtk.DIALOG_DESTROY_WITH_PARENT,
-                            (gtk.STOCK_OK, gtk.RESPONSE_ACCEPT))
+        dialog =3D gtk.Dialog(
+            title,
+            None,
+            gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT,
+            (gtk.STOCK_OK, gtk.RESPONSE_ACCEPT),
+        )
         dialog.set_property("resizable", True)
         dialog.set_default_size(800, 300)
 =

@@ -504,7 +513,7 @@ class NeardUI(Neard):
         scrolledwindow.add(widget)
         notebook.append_page(scrolledwindow, gtk.Label("Records"))
 =

-        dialog.connect('response', self.dlg_onResponse)
+        dialog.connect("response", self.dlg_onResponse)
         return dialog
 =

     def show(self):
@@ -512,33 +521,45 @@ class NeardUI(Neard):
             self.neardDialog =3D self.createDialog()
         self.neardDialog.show_all()
 =

-    def __init__(self, title =3D None, response_callback =3D None):
+    def __init__(self, title=3DNone, response_callback=3DNone):
         self.title =3D title
         self.response_callback =3D response_callback
         self.neardDialog =3D None
 =

-        self.adapters_list =3D gtk.ListStore(gobject.TYPE_STRING,  # path =
=3D0
-                                      gobject.TYPE_STRING,  # Name =3D 1
-                                      gobject.TYPE_BOOLEAN, # powered =3D 2
-                                      gobject.TYPE_BOOLEAN, # polling =3D 3
-                                      gobject.TYPE_STRING,  # protocols =
=3D 4
-                                      gobject.TYPE_STRING)  # tags =3D 5
-
-        self.tags_list =3D gtk.ListStore(gobject.TYPE_STRING,  # path =3D0
-                                      gobject.TYPE_STRING,      # Name =3D=
 1
-                                      gobject.TYPE_BOOLEAN,     # Read Onl=
y 2
-                                      gobject.TYPE_STRING,      # Type =3D=
 3
-                                      gobject.TYPE_STRING)     # Record =
=3D 4
-
-        self.records_list =3D gtk.ListStore(gobject.TYPE_STRING,  # path =
=3D0
-                                      gobject.TYPE_STRING,      # Name =3D=
 1
-                                      gobject.TYPE_STRING,      # Type =3D=
 2
-                                      gobject.TYPE_STRING)        # conten=
t =3D 3
-
-        Neard.__init__(self, self.adapter_UpdateUI, self.adapter_RemoveUI
-                       , self.tag_UpdateUI, self.record_UpdateUI)
-
-class RecordUI():
+        self.adapters_list =3D gtk.ListStore(
+            gobject.TYPE_STRING,  # path =3D0
+            gobject.TYPE_STRING,  # Name =3D 1
+            gobject.TYPE_BOOLEAN,  # powered =3D 2
+            gobject.TYPE_BOOLEAN,  # polling =3D 3
+            gobject.TYPE_STRING,  # protocols =3D 4
+            gobject.TYPE_STRING,
+        )  # tags =3D 5
+
+        self.tags_list =3D gtk.ListStore(
+            gobject.TYPE_STRING,  # path =3D0
+            gobject.TYPE_STRING,  # Name =3D 1
+            gobject.TYPE_BOOLEAN,  # Read Only 2
+            gobject.TYPE_STRING,  # Type =3D 3
+            gobject.TYPE_STRING,
+        )  # Record =3D 4
+
+        self.records_list =3D gtk.ListStore(
+            gobject.TYPE_STRING,  # path =3D0
+            gobject.TYPE_STRING,  # Name =3D 1
+            gobject.TYPE_STRING,  # Type =3D 2
+            gobject.TYPE_STRING,
+        )  # content =3D 3
+
+        Neard.__init__(
+            self,
+            self.adapter_UpdateUI,
+            self.adapter_RemoveUI,
+            self.tag_UpdateUI,
+            self.record_UpdateUI,
+        )
+
+
+class RecordUI:
     def wr_onResponse(self, dialog, response):
         if response !=3D gtk.RESPONSE_ACCEPT:
             return
@@ -546,30 +567,35 @@ class RecordUI():
         type_name =3D self.type_combo.get_active_text()
         bus =3D dbus.SystemBus()
         record_path =3D self.path
-        tag_path =3D record_path[:record_path.rfind("/")]
-        tag =3D dbus.Interface(bus.get_object(neardutils.SERVICE_NAME, tag=
_path), neardutils.TAG_INTERFACE)
+        tag_path =3D record_path[: record_path.rfind("/")]
+        tag =3D dbus.Interface(
+            bus.get_object(neardutils.SERVICE_NAME, tag_path), neardutils.=
TAG_INTERFACE
+        )
         if type_name in ["Text"]:
             content1 =3D content.split()
-            tag.Write({"Type" : type_name,
-                      "Encoding" : content1[0],
-                      "Language" : content1[1],
-                      "Representation" : ' '.join(content1[2:])})
+            tag.Write(
+                {
+                    "Type": type_name,
+                    "Encoding": content1[0],
+                    "Language": content1[1],
+                    "Representation": " ".join(content1[2:]),
+                }
+            )
         else:
-            tag.Write({"Type" : type_name,
-                       "URI" : content})
+            tag.Write({"Type": type_name, "URI": content})
         dialog.destroy()
 =

-    def __init__(self, parent =3D None, path =3D None, type_name =3D None):
+    def __init__(self, parent=3DNone, path=3DNone, type_name=3DNone):
         self.path =3D path
         type_combo =3D gtk.combo_box_new_text()
-        type_combo.append_text('Text')
-        type_combo.append_text('URI')
-        type_combo.append_text('SmartPoster')
-        if type_name =3D=3D 'Text':
+        type_combo.append_text("Text")
+        type_combo.append_text("URI")
+        type_combo.append_text("SmartPoster")
+        if type_name =3D=3D "Text":
             type_combo.set_active(0)
-        elif type_name =3D=3D 'URI':
+        elif type_name =3D=3D "URI":
             type_combo.set_active(1)
-        elif type_name =3D=3D 'SmartPoster':
+        elif type_name =3D=3D "SmartPoster":
             type_combo.set_active(2)
         fixed =3D gtk.Fixed()
         content_entry =3D gtk.Entry()
@@ -580,13 +606,16 @@ class RecordUI():
         fixed.put(type_label, 20, 15)
         fixed.put(content_label, 150, 15)
 =

-        record_dialog =3D gtk.Dialog("Write Record", parent,
-                        gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT,
-                        (gtk.STOCK_CANCEL, gtk.RESPONSE_REJECT,gtk.STOCK_O=
K, gtk.RESPONSE_ACCEPT))
+        record_dialog =3D gtk.Dialog(
+            "Write Record",
+            parent,
+            gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT,
+            (gtk.STOCK_CANCEL, gtk.RESPONSE_REJECT, gtk.STOCK_OK, gtk.RESP=
ONSE_ACCEPT),
+        )
         self.record_dialog =3D record_dialog
         record_dialog.set_default_size(280, 120)
         record_dialog.set_position(gtk.WIN_POS_CENTER)
-        record_dialog.connect('response', self.wr_onResponse)
+        record_dialog.connect("response", self.wr_onResponse)
         hbox =3D record_dialog.get_content_area()
         hbox.pack_start(fixed)
         self.type_combo =3D type_combo
@@ -597,6 +626,7 @@ class RecordUI():
         self.record_dialog.run()
         self.record_dialog.destroy()
 =

+
 ##=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 if __name__ =3D=3D "__main__":
 =

diff --git a/test/neardutils.py b/test/neardutils.py
index 520870ab7944..da421daaae05 100644
--- a/test/neardutils.py
+++ b/test/neardutils.py
@@ -6,88 +6,102 @@ DEVICE_INTERFACE =3D SERVICE_NAME + ".Device"
 TAG_INTERFACE =3D SERVICE_NAME + ".Tag"
 RECORD_INTERFACE =3D SERVICE_NAME + ".Record"
 =

+
 def get_managed_objects():
-        bus =3D dbus.SystemBus()
-        manager =3D dbus.Interface(bus.get_object(SERVICE_NAME, "/"),
-                                "org.freedesktop.DBus.ObjectManager")
-        return manager.GetManagedObjects()
+    bus =3D dbus.SystemBus()
+    manager =3D dbus.Interface(
+        bus.get_object(SERVICE_NAME, "/"), "org.freedesktop.DBus.ObjectMan=
ager"
+    )
+    return manager.GetManagedObjects()
+
 =

 def find_adapter(pattern=3DNone):
-        return find_adapter_in_objects(get_managed_objects(), pattern)
+    return find_adapter_in_objects(get_managed_objects(), pattern)
+
 =

 def find_adapter_in_objects(objects, pattern=3DNone):
-        bus =3D dbus.SystemBus()
-        for path, ifaces in objects.items():
-                adapter =3D ifaces.get(ADAPTER_INTERFACE)
-                if adapter is None:
-                        continue
-                if not pattern or path.endswith(pattern):
-                        obj =3D bus.get_object(SERVICE_NAME, path)
-                        return dbus.Interface(obj, ADAPTER_INTERFACE)
-        raise Exception("NFC adapter not found")
+    bus =3D dbus.SystemBus()
+    for path, ifaces in objects.items():
+        adapter =3D ifaces.get(ADAPTER_INTERFACE)
+        if adapter is None:
+            continue
+        if not pattern or path.endswith(pattern):
+            obj =3D bus.get_object(SERVICE_NAME, path)
+            return dbus.Interface(obj, ADAPTER_INTERFACE)
+    raise Exception("NFC adapter not found")
+
 =

 def find_device(pattern=3DNone):
-        return find_device_in_objects(get_managed_objects(), pattern)
+    return find_device_in_objects(get_managed_objects(), pattern)
+
 =

 def find_device_in_objects(objects, pattern=3DNone):
-        bus =3D dbus.SystemBus()
-        for path, ifaces in objects.items():
-                device =3D ifaces.get(DEVICE_INTERFACE)
-                if device is None:
-                        continue
-                if not pattern or path.endswith(pattern):
-                        obj =3D bus.get_object(SERVICE_NAME, path)
-                        return dbus.Interface(obj, DEVICE_INTERFACE)
-        raise Exception("NFC device not found")
+    bus =3D dbus.SystemBus()
+    for path, ifaces in objects.items():
+        device =3D ifaces.get(DEVICE_INTERFACE)
+        if device is None:
+            continue
+        if not pattern or path.endswith(pattern):
+            obj =3D bus.get_object(SERVICE_NAME, path)
+            return dbus.Interface(obj, DEVICE_INTERFACE)
+    raise Exception("NFC device not found")
+
 =

 def find_tag(pattern=3DNone):
-        return find_tag_in_objects(get_managed_objects(), pattern)
+    return find_tag_in_objects(get_managed_objects(), pattern)
+
 =

 def find_tag_in_objects(objects, pattern=3DNone):
-        bus =3D dbus.SystemBus()
-        for path, ifaces in objects.items():
-                tag =3D ifaces.get(TAG_INTERFACE)
-                if tag is None:
-                        continue
-                if not pattern or path.endswith(pattern):
-                        obj =3D bus.get_object(SERVICE_NAME, path)
-                        return dbus.Interface(obj, TAG_INTERFACE)
-        raise Exception("NFC tag not found")
+    bus =3D dbus.SystemBus()
+    for path, ifaces in objects.items():
+        tag =3D ifaces.get(TAG_INTERFACE)
+        if tag is None:
+            continue
+        if not pattern or path.endswith(pattern):
+            obj =3D bus.get_object(SERVICE_NAME, path)
+            return dbus.Interface(obj, TAG_INTERFACE)
+    raise Exception("NFC tag not found")
+
 =

 def find_record(pattern=3DNone):
-        return find_record_in_objects(get_managed_objects(), pattern)
+    return find_record_in_objects(get_managed_objects(), pattern)
+
 =

 def find_record_in_objects(objects, pattern=3DNone):
-        bus =3D dbus.SystemBus()
-        for path, ifaces in objects.items():
-                record =3D ifaces.get(RECORD_INTERFACE)
-                if record is None:
-                        continue
-                if not pattern or path.endswith(pattern):
-                        obj =3D bus.get_object(SERVICE_NAME, path)
-                        return dbus.Interface(obj, RECORD_INTERFACE)
-        raise Exception("NFC record not found")
+    bus =3D dbus.SystemBus()
+    for path, ifaces in objects.items():
+        record =3D ifaces.get(RECORD_INTERFACE)
+        if record is None:
+            continue
+        if not pattern or path.endswith(pattern):
+            obj =3D bus.get_object(SERVICE_NAME, path)
+            return dbus.Interface(obj, RECORD_INTERFACE)
+    raise Exception("NFC record not found")
+
 =

 def dump_record(record_path):
-        bus =3D dbus.SystemBus()
-        record_prop =3D dbus.Interface(bus.get_object(SERVICE_NAME, record=
_path),
-                                        "org.freedesktop.DBus.Properties")
+    bus =3D dbus.SystemBus()
+    record_prop =3D dbus.Interface(
+        bus.get_object(SERVICE_NAME, record_path), "org.freedesktop.DBus.P=
roperties"
+    )
+
+    properties =3D record_prop.GetAll(RECORD_INTERFACE)
 =

-        properties =3D record_prop.GetAll(RECORD_INTERFACE)
+    for key in properties.keys():
+        val =3D str(properties[key])
+        print("      %s =3D %s" % (key, val))
 =

-        for key in properties.keys():
-                val =3D str(properties[key])
-                print("      %s =3D %s" % (key, val))
 =

 def dump_all_records(path):
-        bus =3D dbus.SystemBus()
-        om =3D dbus.Interface(bus.get_object(SERVICE_NAME, "/"),
-                                        "org.freedesktop.DBus.ObjectManage=
r")
-        objects =3D om.GetManagedObjects()
-        for path, interfaces in objects.items():
-                if RECORD_INTERFACE not in interfaces:
-                        continue
-
-                if path.startswith(path):
-                        print("  [ %s ]" % (path))
-                        dump_record(path)
+    bus =3D dbus.SystemBus()
+    om =3D dbus.Interface(
+        bus.get_object(SERVICE_NAME, "/"), "org.freedesktop.DBus.ObjectMan=
ager"
+    )
+    objects =3D om.GetManagedObjects()
+    for path, interfaces in objects.items():
+        if RECORD_INTERFACE not in interfaces:
+            continue
+
+        if path.startswith(path):
+            print("  [ %s ]" % (path))
+            dump_record(path)
diff --git a/test/phdc-simple-manager b/test/phdc-simple-manager
index 97dc8fd6090d..7bcf68b20cd2 100755
--- a/test/phdc-simple-manager
+++ b/test/phdc-simple-manager
@@ -19,72 +19,76 @@ SOL_NFC =3D 280
 NFC_LLCP_MIUX =3D 1
 =

 # Sample test code - compliant with nfcpy phdc test agent
-thermometer_assoc_req =3D \
-    "E200 0032 8000 0000" \
-    "0001 002A 5079 0026" \
-    "8000 0000 A000 8000" \
-    "0000 0000 0000 0080" \
-    "0000 0008 3132 3334" \
-    "3536 3738 0320 0001" \
+thermometer_assoc_req =3D (
+    "E200 0032 8000 0000"
+    "0001 002A 5079 0026"
+    "8000 0000 A000 8000"
+    "0000 0000 0000 0080"
+    "0000 0008 3132 3334"
+    "3536 3738 0320 0001"
     "0100 0000 0000"
-
-thermometer_assoc_res =3D \
-    "E300 002C 0003 5079" \
-    "0026 8000 0000 8000" \
-    "8000 0000 0000 0000" \
-    "8000 0000 0008 3837" \
-    "3635 3433 3231 0000" \
-    "0000 0000 0000 0000" \
-
+)
+
+thermometer_assoc_res =3D (
+    "E300 002C 0003 5079"
+    "0026 8000 0000 8000"
+    "8000 0000 0000 0000"
+    "8000 0000 0008 3837"
+    "3635 3433 3231 0000"
+    "0000 0000 0000 0000"
+)
 assoc_release_req =3D "E40000020000"
 assoc_release_res =3D "E50000020000"
 =

-#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 # Display helper
-def hexdump( chars, sep, width ):
-        while chars:
-                line =3D chars[:width]
-                chars =3D chars[width:]
-                line =3D line.ljust( width, '\000' )
-                print("%s%s%s" % ( sep.join( "%02x" % ord(c) for c in line=
 ),
-                         sep, quotechars( line )))
+def hexdump(chars, sep, width):
+    while chars:
+        line =3D chars[:width]
+        chars =3D chars[width:]
+        line =3D line.ljust(width, "\000")
+        print(
+            "%s%s%s" % (sep.join("%02x" % ord(c) for c in line), sep, quot=
echars(line))
+        )
 =

 =

-def quotechars( chars ):
-        return ''.join( ['.', c][c.isalnum()] for c in chars )
+def quotechars(chars):
+    return "".join([".", c][c.isalnum()] for c in chars)
 =

-#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 class PhdcPeerManager:
     def __init__(self, agent_fd):
-        #Grab the agent ....
-        print('Init PhdcPeerManager thread')
+        # Grab the agent ....
+        print("Init PhdcPeerManager thread")
         self.r_fd =3D agent_fd.take()
-        print('Agent fd:', str(self.r_fd))
+        print("Agent fd:", str(self.r_fd))
 =

-    def run( self):
-        print('Run PhdcPeerManager thread: ', str(self.r_fd))
+    def run(self):
+        print("Run PhdcPeerManager thread: ", str(self.r_fd))
         self.sock =3D socket.fromfd(self.r_fd, AF_NFC, socket.SOCK_STREAM)
         try:
             while True:
                 miu =3D self.sock.getsockopt(SOL_NFC, NFC_LLCP_MIUX)
-                print('MIU=3D', miu)
+                print("MIU=3D", miu)
 =

                 while True:
                     data =3D self.sock.recv(16)
                     if data =3D=3D None:
-                       print('no data')
-                       break
+                        print("no data")
+                        break
 =

-                   #analyze frame
-                    print('analyze')
+                    # analyze frame
+                    print("analyze")
                     size =3D struct.unpack(">H", data[0:2])[0]
                     apdu =3D data[2:]
 =

-                    #should i read more data ?
+                    # should i read more data ?
                     while len(apdu) < size:
                         data =3D self.sock.recv(10)
-                        if data =3D=3D None: break
-                        hexdump(data, ':', 16)
+                        if data =3D=3D None:
+                            break
+                        hexdump(data, ":", 16)
                         apdu +=3D data
                     print("[ieee] <<< {0}".format(str(apdu).encode("hex")))
                     if apdu.startswith("\xE2\x00"):
@@ -97,97 +101,103 @@ class PhdcPeerManager:
                     print("[ieee] >>> {0}".format(str(apdu).encode("hex")))
                     data =3D struct.pack(">H", len(apdu)) + apdu
                     for i in range(0, len(data), miu):
-                        self.sock.send(str(data[i:i+miu]))
+                        self.sock.send(str(data[i : i + miu]))
 =

                 print("remote peer {0} closed connection".format(agent_fd))
                 print("leaving ieee manager")
                 self.sock.close()
 =

         except IOError as e:
-                if e.errno =3D=3D errno.EPIPE:
-                        print('Remote disconnect')
-                else:
-                        print("I/O error({0}): {1}".format(e.errno, e.stre=
rror))
+            if e.errno =3D=3D errno.EPIPE:
+                print("Remote disconnect")
+            else:
+                print("I/O error({0}): {1}".format(e.errno, e.strerror))
         finally:
-                print('Finally exit')
-                stop()
+            print("Finally exit")
+            stop()
 =

         def stop(self):
-                print('Stop PhdcPeerManager:', str(self.r_fd))
-                self._Thread__stop()
+            print("Stop PhdcPeerManager:", str(self.r_fd))
+            self._Thread__stop()
 =

-#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-''' Phdc Manager Class
-'''
-class SimplePhdcManager(dbus.service.Object):
 =

-        @dbus.service.method('org.neard.PHDC.Manager',
-                                        in_signature=3D'',
-                                        out_signature=3D'')
-        def Release(self):
-                print('Release')
-                mainloop.quit()
-
-
-        ''' Called on incoming agents
-        '''
-        @dbus.service.method('org.neard.PHDC.Manager',
-                                        in_signature=3D'h',
-                                        out_signature=3D'')
-        def NewConnection(self, agent_fd):
-                print('Launch Phdc Manager thread for fd:', str(agent_fd))
-                self.server =3D PhdcPeerManager(agent_fd)
-                print('Run Server')
-                self.server.run()
-                print('Leave Server')
-                return
-
-        ''' Called when the agent ends (from phdc_close)
-        '''
-        @dbus.service.method('org.neard.PHDC.Manager',
-                                        in_signature=3D'hi', out_signature=
=3D'')
-        def Disconnection(self,agent_fd, i_err):
-                print('Stop Phdc Manager thread')
-                self.server.stop()
-                return
-
-''' Main loop
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+""" Phdc Manager Class
+"""
+
+
+class SimplePhdcManager(dbus.service.Object):
+    @dbus.service.method("org.neard.PHDC.Manager", in_signature=3D"", out_=
signature=3D"")
+    def Release(self):
+        print("Release")
+        mainloop.quit()
+
+    """ Called on incoming agents
+        """
+
+    @dbus.service.method("org.neard.PHDC.Manager", in_signature=3D"h", out=
_signature=3D"")
+    def NewConnection(self, agent_fd):
+        print("Launch Phdc Manager thread for fd:", str(agent_fd))
+        self.server =3D PhdcPeerManager(agent_fd)
+        print("Run Server")
+        self.server.run()
+        print("Leave Server")
+        return
+
+    """ Called when the agent ends (from phdc_close)
+        """
+
+    @dbus.service.method("org.neard.PHDC.Manager", in_signature=3D"hi", ou=
t_signature=3D"")
+    def Disconnection(self, agent_fd, i_err):
+        print("Stop Phdc Manager thread")
+        self.server.stop()
+        return
+
+
+""" Main loop
 This sample installs two PHDC Managers:
         * Simple: simulates a thermometer data exchange
         * Validation: Validation Manager for NFC Forum PHDC)
-'''
+"""
 if "__main__" =3D=3D __name__:
-        dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
 =

-        print('PHDC Simple Manager Test')
-        bus =3D dbus.SystemBus()
-        obj =3D bus.get_object("org.neard", "/org/neard");
-        neard_manager =3D dbus.Interface(obj, "org.neard.PHDC")
+    print("PHDC Simple Manager Test")
+    bus =3D dbus.SystemBus()
+    obj =3D bus.get_object("org.neard", "/org/neard")
+    neard_manager =3D dbus.Interface(obj, "org.neard.PHDC")
 =

-        simple_path =3D '/Simple'
-        valid_path =3D '/Validation'
+    simple_path =3D "/Simple"
+    valid_path =3D "/Validation"
 =

-        print('Creating & registering PHDC Simple Manager')
-        simpleobject =3D SimplePhdcManager(bus, simple_path)
+    print("Creating & registering PHDC Simple Manager")
+    simpleobject =3D SimplePhdcManager(bus, simple_path)
 =

-        d =3D dbus.Dictionary({'Role': 'Manager', 'Path': simple_path,
-                        'ServiceName': 'urn:nfc:sn:phdc' }, signature=3D's=
v')
-        neard_manager.RegisterAgent(d)
+    d =3D dbus.Dictionary(
+        {"Role": "Manager", "Path": simple_path, "ServiceName": "urn:nfc:s=
n:phdc"},
+        signature=3D"sv",
+    )
+    neard_manager.RegisterAgent(d)
 =

-        print('Creating & Registering Validation Manager')
+    print("Creating & Registering Validation Manager")
 =

-        validationobj=3D SimplePhdcManager(bus, valid_path)
-        d =3D dbus.Dictionary({'Role': 'Manager', 'Path': valid_path,
-                'ServiceName': 'urn:nfc:xsn:nfc-forum.org:phdc-validation'=
 },
-                 signature=3D'sv')
-        neard_manager.RegisterAgent(d)
+    validationobj =3D SimplePhdcManager(bus, valid_path)
+    d =3D dbus.Dictionary(
+        {
+            "Role": "Manager",
+            "Path": valid_path,
+            "ServiceName": "urn:nfc:xsn:nfc-forum.org:phdc-validation",
+        },
+        signature=3D"sv",
+    )
+    neard_manager.RegisterAgent(d)
 =

-        mainloop =3D gobject.MainLoop()
+    mainloop =3D gobject.MainLoop()
 =

 try:
-        mainloop.run()
+    mainloop.run()
 =

-except(KeyboardInterrupt):
-        #Call for unregister...
-        neard_manager.UnregisterAgent(simple_path, 'Manager')
-        neard_manager.UnregisterAgent(valid_path, 'Manager')
+except (KeyboardInterrupt):
+    # Call for unregister...
+    neard_manager.UnregisterAgent(simple_path, "Manager")
+    neard_manager.UnregisterAgent(valid_path, "Manager")
diff --git a/test/test-adapter b/test/test-adapter
index 6d22f59bda0f..682a8bd73c94 100755
--- a/test/test-adapter
+++ b/test/test-adapter
@@ -6,102 +6,106 @@ import neardutils
 =

 bus =3D dbus.SystemBus()
 =

-def extract_list(list):
-        val =3D "["
-        for i in list:
-                val +=3D " " + str(i)
-        val +=3D " ]"
-        return val
 =

-def usage():
-        print("Usage: %s <command>" % (sys.argv[0]) )
-        print("")
-        print("  list")
-        print("  powered nfcX [on/off]")
-        print("  poll nfcX [on/off] [Initiator/Target/Dual]")
-        sys.exit(1)
-
-if (len(sys.argv) < 2):
-        usage()
+def extract_list(list):
+    val =3D "["
+    for i in list:
+        val +=3D " " + str(i)
+    val +=3D " ]"
+    return val
 =

-if (sys.argv[1] =3D=3D "list"):
-        if (len(sys.argv) < 3):
-                objects =3D neardutils.get_managed_objects()
-                for path, interfaces in objects.items():
-                        if "org.neard.Adapter" not in interfaces:
-                                continue
 =

-                        print(" [ %s ]" % (path))
+def usage():
+    print("Usage: %s <command>" % (sys.argv[0]))
+    print("")
+    print("  list")
+    print("  powered nfcX [on/off]")
+    print("  poll nfcX [on/off] [Initiator/Target/Dual]")
+    sys.exit(1)
 =

-                        props =3D interfaces["org.neard.Adapter"]
 =

-                        for (key, value) in props.items():
-                                if (key =3D=3D "Protocols"):
-                                        val =3D extract_list(value)
-                                        print("    %s =3D %s" % (key, val))
+if len(sys.argv) < 2:
+    usage()
 =

-                                elif key in ["Powered", "Polling"]:
-                                        if value =3D=3D dbus.Boolean(1):
-                                                val =3D "true"
-                                        else:
-                                                val =3D "false"
-                                        print("    %s =3D %s" % (key, val))
+if sys.argv[1] =3D=3D "list":
+    if len(sys.argv) < 3:
+        objects =3D neardutils.get_managed_objects()
+        for path, interfaces in objects.items():
+            if "org.neard.Adapter" not in interfaces:
+                continue
 =

-                                else:
-                                        print("    %s =3D %s" % (key, valu=
e))
+            print(" [ %s ]" % (path))
 =

-                sys.exit(0)
+            props =3D interfaces["org.neard.Adapter"]
 =

-if (sys.argv[1] =3D=3D "powered"):
-        if (len(sys.argv) < 4):
-                usage()
-        else:
-                path =3D "/org/neard/" + sys.argv[2]
+            for (key, value) in props.items():
+                if key =3D=3D "Protocols":
+                    val =3D extract_list(value)
+                    print("    %s =3D %s" % (key, val))
 =

-                adapter_path =3D neardutils.find_adapter(path).object_path
-                adapter =3D dbus.Interface(bus.get_object("org.neard", ada=
pter_path),
-                                        "org.freedesktop.DBus.Properties")
+                elif key in ["Powered", "Polling"]:
+                    if value =3D=3D dbus.Boolean(1):
+                        val =3D "true"
+                    else:
+                        val =3D "false"
+                    print("    %s =3D %s" % (key, val))
 =

-                if (sys.argv[3] =3D=3D "on"):
-                        value =3D dbus.Boolean(1)
-                elif (sys.argv[3] =3D=3D "off"):
-                        value =3D dbus.Boolean(0)
                 else:
-                        value =3D dbus.Boolean(sys.argv[3])
-                try:
-                        adapter.Set("org.neard.Adapter", "Powered", value)
-                except dbus.DBusException as error:
-                        print("%s: %s" % (error._dbus_error_name, error.me=
ssage))
+                    print("    %s =3D %s" % (key, value))
+
         sys.exit(0)
 =

-if (sys.argv[1] =3D=3D "poll"):
-        if (len(sys.argv) < 4):
-                usage()
+if sys.argv[1] =3D=3D "powered":
+    if len(sys.argv) < 4:
+        usage()
+    else:
+        path =3D "/org/neard/" + sys.argv[2]
+
+        adapter_path =3D neardutils.find_adapter(path).object_path
+        adapter =3D dbus.Interface(
+            bus.get_object("org.neard", adapter_path), "org.freedesktop.DB=
us.Properties"
+        )
+
+        if sys.argv[3] =3D=3D "on":
+            value =3D dbus.Boolean(1)
+        elif sys.argv[3] =3D=3D "off":
+            value =3D dbus.Boolean(0)
         else:
-                path =3D "/org/neard/" + sys.argv[2]
+            value =3D dbus.Boolean(sys.argv[3])
+        try:
+            adapter.Set("org.neard.Adapter", "Powered", value)
+        except dbus.DBusException as error:
+            print("%s: %s" % (error._dbus_error_name, error.message))
+    sys.exit(0)
+
+if sys.argv[1] =3D=3D "poll":
+    if len(sys.argv) < 4:
+        usage()
+    else:
+        path =3D "/org/neard/" + sys.argv[2]
 =

-                adapter =3D neardutils.find_adapter(path)
+        adapter =3D neardutils.find_adapter(path)
 =

-                if (sys.argv[3] =3D=3D "on"):
-                        if (len(sys.argv) =3D=3D 4):
-                                mode =3D "Initiator"
-                        else:
-                                mode =3D sys.argv[4]
+        if sys.argv[3] =3D=3D "on":
+            if len(sys.argv) =3D=3D 4:
+                mode =3D "Initiator"
+            else:
+                mode =3D sys.argv[4]
 =

-                        try:
-                                adapter.StartPollLoop(mode)
-                        except dbus.DBusException as error:
-                                print("%s: %s" % (error._dbus_error_name, =
error.message))
+            try:
+                adapter.StartPollLoop(mode)
+            except dbus.DBusException as error:
+                print("%s: %s" % (error._dbus_error_name, error.message))
 =

-                elif (sys.argv[3] =3D=3D "off"):
-                        try:
-                                adapter.StopPollLoop()
-                        except dbus.DBusException as error:
-                                print("%s: %s" % (error._dbus_error_name, =
error.message))
+        elif sys.argv[3] =3D=3D "off":
+            try:
+                adapter.StopPollLoop()
+            except dbus.DBusException as error:
+                print("%s: %s" % (error._dbus_error_name, error.message))
 =

-                else:
-                        usage()
+        else:
+            usage()
 =

-        sys.exit(0)
+    sys.exit(0)
 =

 usage()
diff --git a/test/test-device b/test/test-device
index 3086e1aad915..63f97559223f 100755
--- a/test/test-device
+++ b/test/test-device
@@ -6,111 +6,139 @@ import neardutils
 =

 bus =3D dbus.SystemBus()
 =

+
 def extract_list(list):
-        val =3D "["
-        for i in list:
-                val +=3D " " + str(i)
-        val +=3D " ]"
-        return val
+    val =3D "["
+    for i in list:
+        val +=3D " " + str(i)
+    val +=3D " ]"
+    return val
 =

-def usage():
-        print("Usage: %s <command>" % (sys.argv[0]) )
-        print("")
-        print("  list")
-        print("  dump <device>")
-        print("  push <device> <type> <...>")
-        print("    If type is Text, parameters are <encoding> <language> <=
representation>")
-        print("    If type is URI, parameters are <uri>")
-        print("    If type is SmartPoster, parameters are <uri>")
-        print("    If type is Handover, parameters are <carrier>")
-        print("    If type is StaticHandover, parameters are <carrier>")
-        print("    If type is MIME, parameters are <mime_type> (only wifi_=
wsc and raw)")
-        print("       raw is for sending raw payload, parameters are <mime=
_type> <payload>")
-        print("e.g. < %s push /org/neard/nfc0/device0 Text UTF-8 en-US hel=
lo,Type2! >" % (sys.argv[0]))
-        print("e.g. < %s push /org/neard/nfc0/device0 URI http://www.nfc-f=
orum.com >" % (sys.argv[0]))
-        print("e.g. < %s push /org/neard/nfc0/device0 SmartPoster http://w=
ww.nfc-forum.com >" % (sys.argv[0]))
-        print("e.g. < %s push /org/neard/nfc0/device0 Handover bluetooth,w=
ifi >" % (sys.argv[0]))
-        print("e.g. < %s push /org/neard/nfc0/device0 StaticHandover bluet=
ooth,wifi >" % (sys.argv[0]))
-        print("e.g. < %s push /org/neard/nfc0/device0 MIME wifi_wsc>" % (s=
ys.argv[0]))
-        print("e.g. < %s push /org/neard/nfc0/device0 MIME raw application=
/xml '<your><xml tags></your>' >" % (sys.argv[0]))
-
-        sys.exit(1)
-
-if (len(sys.argv) < 2):
-        usage()
 =

-if (sys.argv[1] =3D=3D "list"):
-        if (len(sys.argv) < 3):
-                objects =3D neardutils.get_managed_objects()
-                for path, interfaces in objects.items():
-                        if "org.neard.Device" not in interfaces:
-                                continue
+def usage():
+    print("Usage: %s <command>" % (sys.argv[0]))
+    print("")
+    print("  list")
+    print("  dump <device>")
+    print("  push <device> <type> <...>")
+    print("    If type is Text, parameters are <encoding> <language> <repr=
esentation>")
+    print("    If type is URI, parameters are <uri>")
+    print("    If type is SmartPoster, parameters are <uri>")
+    print("    If type is Handover, parameters are <carrier>")
+    print("    If type is StaticHandover, parameters are <carrier>")
+    print("    If type is MIME, parameters are <mime_type> (only wifi_wsc =
and raw)")
+    print("       raw is for sending raw payload, parameters are <mime_typ=
e> <payload>")
+    print(
+        "e.g. < %s push /org/neard/nfc0/device0 Text UTF-8 en-US hello,Typ=
e2! >"
+        % (sys.argv[0])
+    )
+    print(
+        "e.g. < %s push /org/neard/nfc0/device0 URI http://www.nfc-forum.c=
om >"
+        % (sys.argv[0])
+    )
+    print(
+        "e.g. < %s push /org/neard/nfc0/device0 SmartPoster http://www.nfc=
-forum.com >"
+        % (sys.argv[0])
+    )
+    print(
+        "e.g. < %s push /org/neard/nfc0/device0 Handover bluetooth,wifi >"
+        % (sys.argv[0])
+    )
+    print(
+        "e.g. < %s push /org/neard/nfc0/device0 StaticHandover bluetooth,w=
ifi >"
+        % (sys.argv[0])
+    )
+    print("e.g. < %s push /org/neard/nfc0/device0 MIME wifi_wsc>" % (sys.a=
rgv[0]))
+    print(
+        "e.g. < %s push /org/neard/nfc0/device0 MIME raw application/xml '=
<your><xml tags></your>' >"
+        % (sys.argv[0])
+    )
+
+    sys.exit(1)
+
+
+if len(sys.argv) < 2:
+    usage()
+
+if sys.argv[1] =3D=3D "list":
+    if len(sys.argv) < 3:
+        objects =3D neardutils.get_managed_objects()
+        for path, interfaces in objects.items():
+            if "org.neard.Device" not in interfaces:
+                continue
+
+            print(" [ %s ]" % (path))
+
+            props =3D interfaces["org.neard.Device"]
+
+            for (key, value) in props.items():
+                print("    %s =3D %s" % (key, value))
 =

-                        print(" [ %s ]" % (path))
+        sys.exit(0)
 =

-                        props =3D interfaces["org.neard.Device"]
+if sys.argv[1] =3D=3D "dump":
+    if len(sys.argv) < 3:
+        objects =3D neardutils.get_managed_objects()
+        for path, interfaces in objects.items():
+            if "org.neard.Device" not in interfaces:
+                continue
 =

-                        for (key, value) in props.items():
-                                print("    %s =3D %s" % (key, value))
+            print("[ %s ]" % (path))
+            neardutils.dump_all_records(path)
 =

-                sys.exit(0)
+        sys.exit(0)
+    else:
+        neardutils.dump_all_records(sys.argv[2])
 =

-if (sys.argv[1] =3D=3D "dump"):
-        if (len(sys.argv) < 3):
-                objects =3D neardutils.get_managed_objects()
-                for path, interfaces in objects.items():
-                        if "org.neard.Device" not in interfaces:
-                                continue
+        sys.exit(0)
 =

-                        print("[ %s ]" % (path))
-                        neardutils.dump_all_records(path)
+if sys.argv[1] =3D=3D "push":
+    if len(sys.argv) < 5:
+        usage()
 =

-                sys.exit(0)
+    device =3D neardutils.find_device(sys.argv[2])
+
+    if len(sys.argv) =3D=3D 7:
+        if sys.argv[3] in ["Text"]:
+            device.Push(
+                (
+                    {
+                        "Type": "Text",
+                        "Encoding": sys.argv[4],
+                        "Language": sys.argv[5],
+                        "Representation": sys.argv[6],
+                    }
+                )
+            )
+        elif sys.argv[3] in ["MIME"]:
+            if sys.argv[4] in ["raw"]:
+                device.Push(
+                    (
+                        {
+                            "Type": "MIME",
+                            "MIME": sys.argv[5],
+                            "Payload": dbus.ByteArray(sys.argv[6]),
+                        }
+                    )
+                )
         else:
-                neardutils.dump_all_records(sys.argv[2])
-
-                sys.exit(0)
-
-if (sys.argv[1] =3D=3D "push"):
-        if (len(sys.argv) < 5):
-                usage()
-        =

-        device =3D neardutils.find_device(sys.argv[2])
-
-        if len(sys.argv) =3D=3D 7:
-                if sys.argv[3] in ["Text"]:
-                        device.Push(({ "Type" : "Text",
-                                "Encoding" : sys.argv[4],
-                                "Language" : sys.argv[5],
-                                "Representation" : sys.argv[6] }))
-                elif sys.argv[3] in ["MIME"]:
-                        if sys.argv[4] in ["raw"]:
-                                device.Push(({ "Type" : "MIME",
-                                       "MIME" : sys.argv[5],
-                                       "Payload" : dbus.ByteArray(sys.argv=
[6]) }))
-                else:
-                        usage()
-
-        elif len(sys.argv) =3D=3D 5:
-                if sys.argv[3] in ["URI"]:
-                        device.Push(({ "Type" : "URI",
-                                "URI" : sys.argv[4] }))
-                elif sys.argv[3] in ["SmartPoster"]:
-                        device.Push(({ "Type" : "SmartPoster",
-                                "URI" : sys.argv[4] }))
-                elif sys.argv[3] in ["Handover"]:
-                        device.Push(({ "Type" : "Handover",
-                                "Carrier" : sys.argv[4] }))
-                elif sys.argv[3] in ["StaticHandover"]:
-                        device.Push(({ "Type" : "StaticHandover",
-                                "Carrier" : sys.argv[4] }))
-                elif sys.argv[3] in ["MIME"]:
-                        if sys.argv[4] in ["wifi_wsc"]:
-                                device.Push(({ "Type" : "MIME",
-                                        "MIME" : "application/vnd.wfa.wsc"=
}))
-                else:
-                        usage()
+            usage()
+
+    elif len(sys.argv) =3D=3D 5:
+        if sys.argv[3] in ["URI"]:
+            device.Push(({"Type": "URI", "URI": sys.argv[4]}))
+        elif sys.argv[3] in ["SmartPoster"]:
+            device.Push(({"Type": "SmartPoster", "URI": sys.argv[4]}))
+        elif sys.argv[3] in ["Handover"]:
+            device.Push(({"Type": "Handover", "Carrier": sys.argv[4]}))
+        elif sys.argv[3] in ["StaticHandover"]:
+            device.Push(({"Type": "StaticHandover", "Carrier": sys.argv[4]=
}))
+        elif sys.argv[3] in ["MIME"]:
+            if sys.argv[4] in ["wifi_wsc"]:
+                device.Push(({"Type": "MIME", "MIME": "application/vnd.wfa=
.wsc"}))
         else:
-                usage()
+            usage()
+    else:
+        usage()
 =

-        sys.exit(0)
+    sys.exit(0)
diff --git a/test/test-tag b/test/test-tag
index 4183b9c3ded8..782e1e6977c0 100755
--- a/test/test-tag
+++ b/test/test-tag
@@ -6,9 +6,10 @@ import neardutils
 =

 bus =3D dbus.SystemBus()
 =

+
 def usage():
-        print("Usage: %s <command>" % sys.argv[0])
-        text =3D """
+    print("Usage: %s <command>" % sys.argv[0])
+    text =3D """
 list
 dump <tag>
 deactivate <tag>
@@ -36,147 +37,154 @@ For example: # %s write /org/neard/nfc0/tag0 \\
         MIME wifi_wsc YourAPname
         MIME 'application/octet-stream' 1234
 """
-        print(text % sys.argv[0])
+    print(text % sys.argv[0])
 =

-        sys.exit(1)
+    sys.exit(1)
 =

-if (len(sys.argv) < 2):
-        usage()
 =

-if (sys.argv[1] =3D=3D "list"):
-        if (len(sys.argv) < 3):
-                objects =3D neardutils.get_managed_objects()
-                for path, interfaces in objects.items():
-                        if "org.neard.Tag" not in interfaces:
-                                continue
+if len(sys.argv) < 2:
+    usage()
 =

-                        print(" [ %s ]" % (path))
+if sys.argv[1] =3D=3D "list":
+    if len(sys.argv) < 3:
+        objects =3D neardutils.get_managed_objects()
+        for path, interfaces in objects.items():
+            if "org.neard.Tag" not in interfaces:
+                continue
 =

-                        props =3D interfaces["org.neard.Tag"]
+            print(" [ %s ]" % (path))
 =

-                        for (key, value) in props.items():
-                                if key in ["ReadOnly"]:
-                                        if value =3D=3D dbus.Boolean(1):
-                                                val =3D "true"
-                                        else:
-                                                val =3D "false"
-                                        print("    %s =3D %s" % (key, val))
+            props =3D interfaces["org.neard.Tag"]
 =

-                                else:
-                                        print("    %s =3D %s" % (key, valu=
e))
+            for (key, value) in props.items():
+                if key in ["ReadOnly"]:
+                    if value =3D=3D dbus.Boolean(1):
+                        val =3D "true"
+                    else:
+                        val =3D "false"
+                    print("    %s =3D %s" % (key, val))
 =

-                sys.exit(0)
+                else:
+                    print("    %s =3D %s" % (key, value))
 =

-if (sys.argv[1] =3D=3D "dump"):
-        if (len(sys.argv) < 3):
-                objects =3D neardutils.get_managed_objects()
-                for path, interfaces in objects.items():
-                        if "org.neard.Tag" not in interfaces:
-                                continue
+        sys.exit(0)
 =

-                        print("[ %s ]" % (path))
-                        neardutils.dump_all_records(path)
+if sys.argv[1] =3D=3D "dump":
+    if len(sys.argv) < 3:
+        objects =3D neardutils.get_managed_objects()
+        for path, interfaces in objects.items():
+            if "org.neard.Tag" not in interfaces:
+                continue
 =

-                sys.exit(0)
-        else:
-                neardutils.dump_all_records(sys.argv[2])
+            print("[ %s ]" % (path))
+            neardutils.dump_all_records(path)
+
+        sys.exit(0)
+    else:
+        neardutils.dump_all_records(sys.argv[2])
+
+        sys.exit(0)
 =

-                sys.exit(0)
 =

 def write_mime(args):
 =

-        data =3D { "Type" : "MIME" }
+    data =3D {"Type": "MIME"}
+
+    if len(args) < 2:
+        usage()
 =

-        if len(args) < 2:
-                usage()
+    if args[0] =3D=3D "wifi_wsc":
 =

-        if args[0] =3D=3D "wifi_wsc":
+        data["MIME"] =3D "application/vnd.wfa.wsc"
+        data["SSID"] =3D args[1]
 =

-                data["MIME"] =3D "application/vnd.wfa.wsc"
-                data["SSID"] =3D args[1]
+        if len(args) > 2:
 =

-                if len(args) > 2:
+            data["Passphrase"] =3D args[2]
+    else:
+        data["MIME"] =3D args[0]
+        data["MIMEPayload"] =3D dbus.ByteArray(args[1])
 =

-                        data["Passphrase"] =3D args[2]
-        else:
-                data["MIME"] =3D args[0]
-                data["MIMEPayload"] =3D dbus.ByteArray(args[1])
+    tag.Write(data)
 =

-        tag.Write(data)
 =

 def write_uri(args):
 =

-        data =3D { }
-        records =3D [ ]
+    data =3D {}
+    records =3D []
 =

-        if len(args) > 1:
+    if len(args) > 1:
 =

-                for i in args:
+        for i in args:
 =

-                        record =3D { }
+            record =3D {}
 =

-                        record["Type"] =3D dbus.String("URI", variant_leve=
l =3D 1)
-                        record["URI"] =3D dbus.String(i, variant_level =3D=
 1)
+            record["Type"] =3D dbus.String("URI", variant_level=3D1)
+            record["URI"] =3D dbus.String(i, variant_level=3D1)
 =

-                        records.append(record)
+            records.append(record)
 =

-                data["Records"] =3D records
+        data["Records"] =3D records
 =

-        else:
+    else:
 =

-                data["Type"] =3D "URI"
-                data["URI"] =3D args[0]
+        data["Type"] =3D "URI"
+        data["URI"] =3D args[0]
 =

-        print(data)
+    print(data)
 =

-        tag.Write(data)
+    tag.Write(data)
 =

-if (sys.argv[1] =3D=3D "write"):
-        if (len(sys.argv) < 5):
-                usage()
 =

-        tag =3D neardutils.find_tag(sys.argv[2])
+if sys.argv[1] =3D=3D "write":
+    if len(sys.argv) < 5:
+        usage()
 =

-        if sys.argv[3] in ["Text"]:
-                tag.Write(({ "Type" : "Text",
-                        "Encoding" : sys.argv[4],
-                        "Language" : sys.argv[5],
-                        "Representation" : sys.argv[6] }))
+    tag =3D neardutils.find_tag(sys.argv[2])
 =

-        elif sys.argv[3] =3D=3D "URI":
-                write_uri(sys.argv[4:])
+    if sys.argv[3] in ["Text"]:
+        tag.Write(
+            (
+                {
+                    "Type": "Text",
+                    "Encoding": sys.argv[4],
+                    "Language": sys.argv[5],
+                    "Representation": sys.argv[6],
+                }
+            )
+        )
 =

-        elif sys.argv[3] in ["SmartPoster"]:
-                tag.Write(({ "Type" : "SmartPoster",
-                        "URI" : sys.argv[4] }))
+    elif sys.argv[3] =3D=3D "URI":
+        write_uri(sys.argv[4:])
 =

-        elif sys.argv[3] in ["SMS"]:
-                URI =3D "sms:" + sys.argv[4] + "?body=3D" + sys.argv[5]
-                tag.Write(({ "Type" : "URI",
-                        "URI" : URI }))
+    elif sys.argv[3] in ["SmartPoster"]:
+        tag.Write(({"Type": "SmartPoster", "URI": sys.argv[4]}))
 =

-        elif sys.argv[3] in ["E-Mail"]:
-                URI =3D "mailto:" + sys.argv[4]
-                tag.Write(({ "Type" : "URI",
-                        "URI" : URI }))
+    elif sys.argv[3] in ["SMS"]:
+        URI =3D "sms:" + sys.argv[4] + "?body=3D" + sys.argv[5]
+        tag.Write(({"Type": "URI", "URI": URI}))
 =

-        elif sys.argv[3] in ["MIME"]:
-                write_mime(sys.argv[4:])
+    elif sys.argv[3] in ["E-Mail"]:
+        URI =3D "mailto:" + sys.argv[4]
+        tag.Write(({"Type": "URI", "URI": URI}))
 =

-        else:
-                usage()
+    elif sys.argv[3] in ["MIME"]:
+        write_mime(sys.argv[4:])
 =

-        sys.exit(0)
+    else:
+        usage()
 =

-if (sys.argv[1] =3D=3D "deactivate"):
-        print(sys.argv[2])
-        if (len(sys.argv) !=3D 2):
-                tag =3D neardutils.find_tag(sys.argv[2])
-                tag.Deactivate()
-        else:
-                usage()
+    sys.exit(0)
 =

-        sys.exit(0)
+if sys.argv[1] =3D=3D "deactivate":
+    print(sys.argv[2])
+    if len(sys.argv) !=3D 2:
+        tag =3D neardutils.find_tag(sys.argv[2])
+        tag.Deactivate()
+    else:
+        usage()
+
+    sys.exit(0)
 =

 else:
-        usage()
+    usage()
-- =

2.33.1

--===============1186541223016299629==--

