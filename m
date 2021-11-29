Content-Type: multipart/mixed; boundary="===============7301253834127500963=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 2/6] test: Convert test script from Python2 to Python3
Date: Sun, 28 Nov 2021 22:06:02 -0700
Message-ID: <20211129050606.873494-3-mgreer@animalcreek.com>
In-Reply-To: <20211129050606.873494-1-mgreer@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7301253834127500963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Python2 is deprecated so convert the neard test scripts, which are
Python2, to Python3.

Signed-off-by: Mark Greer <mgreer@animalcreek.com>
---
 test/bt-handover         |  8 ++---
 test/handover-agent      | 34 +++++++++----------
 test/monitor-near        | 10 +++---
 test/ndef-agent          | 20 ++++++------
 test/neard-ui.py         | 70 ++++++++++++++++++++--------------------
 test/neardutils.py       | 17 ++++------
 test/phdc-simple-manager | 50 ++++++++++++++--------------
 test/test-adapter        | 16 ++++-----
 test/test-device         | 34 +++++++++----------
 test/test-tag            | 10 +++---
 10 files changed, 132 insertions(+), 137 deletions(-)

diff --git a/test/bt-handover b/test/bt-handover
index fc77404da972..eebae9338e00 100755
--- a/test/bt-handover
+++ b/test/bt-handover
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 =

 import os
 import sys
@@ -14,7 +14,7 @@ from dbus.lowlevel import MethodCallMessage, HANDLER_RESU=
LT_NOT_YET_HANDLED
 mainloop =3D gobject.MainLoop()
 =

 def device_added(path, interfaces):
-        for iface, props in interfaces.iteritems():
+        for iface, props in interfaces.items():
                 if "org.neard.Device" in interfaces:
                         print("Pairing with %s" % (path))
                         device =3D dbus.Interface(bus.get_object("org.near=
d", path),
@@ -34,7 +34,7 @@ def remove_paired_devices(bt_adapter):
                                         "org.freedesktop.DBus.ObjectManage=
r")
         objects =3D manager.GetManagedObjects()
 =

-        all_adapters =3D (path for path, interfaces in objects.iteritems()=
 if
+        all_adapters =3D (path for path, interfaces in objects.items() if
                                 "org.bluez.Adapter1" in interfaces.keys()
                                 and path.endswith(bt_adapter))
 =

@@ -60,7 +60,7 @@ def remove_paired_devices(bt_adapter):
                 print("Bluetooth adapter %s is not powered" % adapter_path=
 )
                 exit()
 =

-        all_devices =3D (path for path, interfaces in objects.iteritems() =
if
+        all_devices =3D (path for path, interfaces in objects.items() if
                                 ("org.bluez.Device1" in interfaces.keys()
                                 and path.startswith(bluez_adapter.object_p=
ath)))
 =

diff --git a/test/handover-agent b/test/handover-agent
index dba00b6b9229..bed79a87cf09 100755
--- a/test/handover-agent
+++ b/test/handover-agent
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 =

 import gobject
 =

@@ -23,18 +23,18 @@ power_state =3D None
 def print_fields(fields):
         if 'EIR' in fields:
                 s =3D ' '.join('{:#02x}'.format(i) for i in fields['EIR'])
-                print '  EIR:  %s' % s
+                print('  EIR:  %s' % s)
 =

         if 'nokia.com:bt' in fields:
                 s =3D ' '.join('{:#02x}'.format(i) for i in fields['nokia.=
com:bt'])
-                print '  nokia.com:bt:  %s' % s
+                print('  nokia.com:bt:  %s' % s)
 =

         if 'State' in fields:
-                print '  State: %s' % fields['State']
+                print('  State: %s' % fields['State'])
 =

         if 'WSC' in fields:
                 s =3D ' '.join('{:#02x}'.format(i) for i in fields['WSC'])
-                print '  WSC:  %s' % s
+                print('  WSC:  %s' % s)
 =

 class BTHOAgent(dbus.service.Object):
 =

@@ -42,14 +42,14 @@ class BTHOAgent(dbus.service.Object):
                                         in_signature=3D'',
                                         out_signature=3D'')
         def Release(self):
-                print 'Release'
+                print('Release')
                 mainloop.quit()
 =

         @dbus.service.method('org.neard.HandoverAgent',
                                         in_signature=3D'a{sv}',
                                         out_signature=3D'')
         def PushOOB(self, fields):
-                print 'PushOOB'
+                print('PushOOB')
                 print_fields(fields)
 =

         @dbus.service.method('org.neard.HandoverAgent',
@@ -57,15 +57,15 @@ class BTHOAgent(dbus.service.Object):
                                         out_signature=3D'a{sv}')
 =

         def RequestOOB(self, fields):
-                print 'RequestOOB'
+                print('RequestOOB')
                 print_fields(fields)
 =

-                print '  Replying with'
+                print('  Replying with')
                 s =3D ' '.join('{:#02x}'.format(i) for i in eir_test_data)
-                print '    EIR: %s' % s
+                print('    EIR: %s' % s)
 =

                 if power_state !=3D 'unknown':
-                        print '    State: %s' % power_state
+                        print('    State: %s' % power_state)
                         return {'EIR' : eir_test_data, 'State' : power_sta=
te}
                 else:
                         return {'EIR' : eir_test_data}
@@ -76,14 +76,14 @@ class WiFiHOAgent(dbus.service.Object):
                                         in_signature=3D'',
                                         out_signature=3D'')
         def Release(self):
-                print 'Release'
+                print('Release')
                 mainloop.quit()
 =

         @dbus.service.method('org.neard.HandoverAgent',
                                         in_signature=3D'a{sv}',
                                         out_signature=3D'')
         def PushOOB(self, fields):
-                print 'PushOOB'
+                print('PushOOB')
                 print_fields(fields)
 =

         @dbus.service.method('org.neard.HandoverAgent',
@@ -91,15 +91,15 @@ class WiFiHOAgent(dbus.service.Object):
                                         out_signature=3D'a{sv}')
 =

         def RequestOOB(self, fields):
-                print 'RequestOOB'
+                print('RequestOOB')
                 print_fields(fields)
 =

-                print '  Replying with'
+                print('  Replying with')
                 s =3D ' '.join('{:#02x}'.format(i) for i in wsc_test_data)
-                print '    WSC: %s' % s
+                print('    WSC: %s' % s)
 =

                 if power_state !=3D 'unknown':
-                        print '    State: %s' % power_state
+                        print('    State: %s' % power_state)
                         return {'WSC' : wsc_test_data, 'State' : power_sta=
te}
                 else:
                         return {'WSC' : wsc_test_data}
diff --git a/test/monitor-near b/test/monitor-near
index 49aa6db23f3f..d6cd24f9f64f 100755
--- a/test/monitor-near
+++ b/test/monitor-near
@@ -1,6 +1,4 @@
-#!/usr/bin/python
-
-from __future__ import absolute_import, print_function, unicode_literals
+#!/usr/bin/python3
 =

 import gobject
 =

@@ -9,15 +7,15 @@ import dbus.mainloop.glib
 =

 def property_changed(interface, changed, invalidated, path):
         iface =3D interface[interface.rfind(".") + 1:]
-        for name, value in changed.iteritems():
+        for name, value in changed.items():
                 val =3D str(value)
                 print("{%s.PropertyChanged} [%s] %s =3D %s" % (iface, path=
, name,
                                                                         va=
l))
 =

 def interfaces_added(path, interfaces):
-        for iface, props in interfaces.iteritems():
+        for iface, props in interfaces.items():
                 print("{Added %s} [%s]" % (iface, path))
-                for name, value in props.iteritems():
+                for name, value in props.items():
                         print("      %s =3D %s" % (name, value))
 =

 def interfaces_removed(path, interfaces):
diff --git a/test/ndef-agent b/test/ndef-agent
index bb25ab17edf2..72fcecf9d3a1 100755
--- a/test/ndef-agent
+++ b/test/ndef-agent
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 =

 import gobject
 =

@@ -12,43 +12,43 @@ class NDEFAgent(dbus.service.Object):
         @dbus.service.method("org.neard.NDEFAgent",
                                         in_signature=3D'', out_signature=
=3D'')
         def Release(self):
-                print "Release"
+                print("Release")
                 mainloop.quit()
 =

         @dbus.service.method("org.neard.NDEFAgent",
                                         in_signature=3D'a{sv}',
                                         out_signature=3D'')
         def GetNDEF(self, fields):
-                print "GetNDEF"
+                print("GetNDEF")
 =

                 if fields.has_key("Record"):
-                        print "Record path %s" % (fields["Record"])
+                        print("Record path %s" % (fields["Record"]))
 =

                 if fields.has_key("Payload"):
                         val =3D "["
                         for i in fields["Payload"]:
                                 val +=3D " 0x%x" % i
                         val +=3D " ]"
-                        print "Record payload %s" % val
+                        print("Record payload %s" % val)
 =

                 if fields.has_key("NDEF"):
                         val =3D "["
                         for i in fields["NDEF"]:
                                 val +=3D " 0x%x" % i
                         val +=3D " ]"
-                        print "Complete NDEF %s" % val
+                        print("Complete NDEF %s" % val)
 =

                 return
 =

         @dbus.service.method("org.neard.NDEFAgent",
                                         in_signature=3D'', out_signature=
=3D'')
         def Cancel(self):
-                print "Cancel"
+                print("Cancel")
 =

 def print_usage():
-        print "Usage:"
-        print "%s Type=3D<record type>" % (sys.argv[0])
-        print "Help: %s help" % (sys.argv[0])
+        print("Usage:")
+        print("%s Type=3D<record type>" % (sys.argv[0]))
+        print("Help: %s help" % (sys.argv[0]))
         sys.exit(1)
 =

 if __name__ =3D=3D '__main__':
diff --git a/test/neard-ui.py b/test/neard-ui.py
index cf4bb13c5155..e960891eccf0 100755
--- a/test/neard-ui.py
+++ b/test/neard-ui.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 =

 import pdb
 import sys
@@ -18,12 +18,12 @@ import neardutils
 class Neard:
 =

     def interface_Added(self, path, interface):
-        print (" New interface added: %s") % path
+        print(" New interface added: %s" % path)
         self.objects =3D neardutils.get_managed_objects()
         self.interface_updateDetails(interface, path)
 =

     def interface_Removed(self, path, interface):
-        print (" Remove interface: %s") % path
+        print(" Remove interface: %s" % path)
         self.objects =3D neardutils.get_managed_objects()
         self.interface_updateDetails(interface)
 =

@@ -32,7 +32,7 @@ class Neard:
     #add/remove interface
     def interfaces_Connect(self):
         try:
-            print 'interfaces_Connect'
+            print('interfaces_Connect')
             bus =3D dbus.SystemBus()
             self.objects =3D neardutils.get_managed_objects()
             bus.add_signal_receiver(self.interface_Added, bus_name=3Dneard=
utils.SERVICE_NAME,
@@ -42,7 +42,7 @@ class Neard:
                                     dbus_interface=3D"org.freedesktop.DBus=
.ObjectManager",
                                     signal_name=3D"InterfacesRemoved")
         except:
-            print ("Can't connect to org.freedesktop.DBus.ObjectManager");
+            print("Can't connect to org.freedesktop.DBus.ObjectManager");
             self.objects =3D None
 =

         #Retrieve the manager informations
@@ -60,7 +60,7 @@ class Neard:
             self.record_updateDetails(path)
 =

     def adapter_PropertyChanged(self, prop, value, adapt_path =3D None):
-        print("Prop changed: %s") % prop
+        print("Prop changed: %s" % prop)
         adapt_properties =3D {}
         adapt_properties[prop] =3D value
         if prop =3D=3D "Tags":
@@ -71,7 +71,7 @@ class Neard:
     #Update the records UI
     def record_updateDetails(self, tag_path=3DNone):
         if tag_path is not None:
-            for record_path, record_iface in self.objects.iteritems():
+            for record_path, record_iface in self.objects.items():
 =

                 if neardutils.RECORD_INTERFACE not in record_iface:
                     continue
@@ -88,11 +88,11 @@ class Neard:
     #Update the tags UI
     def tag_updateDetails(self, adapter_path=3DNone):
         if adapter_path is not None:
-            for tag_path, interfaces in self.objects.iteritems():
+            for tag_path, interfaces in self.objects.items():
                 if neardutils.TAG_INTERFACE not in interfaces:
                     continue
 =

-                print ("TAG %s ") % tag_path
+                print("TAG %s " % tag_path)
 =

                 tag_properties =3D interfaces[neardutils.TAG_INTERFACE]
 =

@@ -102,19 +102,19 @@ class Neard:
                 #Process the records
                 self.record_updateDetails(tag_properties)
         else:
-            print ("remove tags and records")
+            print("remove tags and records")
             self.tags_update()
             self.records_update()
 =

 =

     #Something changed, must update the UI
     def adapter_updateDetails(self):
-        for adapt_path, interfaces in self.objects.iteritems():
+        for adapt_path, interfaces in self.objects.items():
             if neardutils.ADAPTER_INTERFACE not in interfaces:
                    continue
 =

             if adapt_path in self.adaptregistered:
-                   print (" already registered %s") % adapt_path
+                   print(" already registered %s" % adapt_path)
             else:
                    adapt_properties =3D interfaces[neardutils.ADAPTER_INTE=
RFACE]
 =

@@ -179,16 +179,16 @@ class NeardUI(Neard):
 =

             try:
                 if self.adapters_actionToggle(i, 2):
-                    print ("Disable Adapter %s") % objpath
+                    print("Disable Adapter %s" % objpath)
                     adapter.Set(neardutils.ADAPTER_INTERFACE, "Powered", F=
alse)
                     self.adapters_list.set_value(i, 2, 0)
                 else:
-                    print ("Enable Adapter %s") % objpath
+                    print("Enable Adapter %s" % objpath)
                     adapter.Set(neardutils.ADAPTER_INTERFACE, "Powered", T=
rue)
                     self.adapters_list.set_value(i, 2, 1)
 =

             except:
-                print ("Can't toggle adapter %s") % objpath
+                print("Can't toggle adapter %s" % objpath)
 =

     # Action: activate or not the polling mode
     def adapter_pollingToggled(self, poolingRendererToggle, path, user):
@@ -199,15 +199,15 @@ class NeardUI(Neard):
 =

             try:
                 if self.adapters_actionToggle(i, 3):
-                    print ("Stop Polling %s") % objpath
+                    print("Stop Polling %s" % objpath)
                     adapt_iface.StopPollLoop()
                     self.adapters_list.set_value(i, 3, 0)
                 else:
-                    print ("Start Polling %s") % objpath
+                    print("Start Polling %s" % objpath)
                     adapt_iface.StartPollLoop("Initiator")
                     self.adapters_list.set_value(i, 3, 1)
             except:
-                print ("Can't toggle polling on adapter %s") % objpath
+                print("Can't toggle polling on adapter %s" % objpath)
 =

     #------------------------------
     #Set the field values
@@ -238,7 +238,7 @@ class NeardUI(Neard):
 =

             if value is not None:
                 self.adapters_list.set_value(i, col, value)
-            print ("  property %s, value %s") % (name, value)
+            print("  property %s, value %s" % (name, value))
 =

     # Clear one or all the adapters present in list
     def adapter_RemoveUI(self):
@@ -254,18 +254,18 @@ class NeardUI(Neard):
 =

         if adapt_properties is None:
             if i:
-                print ("Delete adapter %s") % path
+                print("Delete adapter %s" % path)
                 self.adapters_list.remove(i)
             else:
-                print ("Already deleted adapter %s") % path
+                print("Already deleted adapter %s" % path)
             return
 =

         if i is None:
             i =3D self.adapters_list.append()
             self.adapters_list.set_value(i, 0, path)
-            print ("Add adapter %s") % (path)
+            print("Add adapter %s" % (path))
         else:
-            print ("Update adapter %s") % (path)
+            print("Update adapter %s" % (path))
 =

 =

         self.adapters_setUIList(adapt_properties, i, 2, "Powered")
@@ -289,11 +289,11 @@ class NeardUI(Neard):
 =

             if value is not None:
                 self.tags_list.set_value(i, col, value)
-            print ("  property %s, value %s") % (name, value)
+            print("  property %s, value %s" % (name, value))
 =

     #Add, Update or delete a list entry
     def tag_UpdateUI(self, path =3D None, tag_properties =3D None):
-        print("Tag Update %s") % path
+        print("Tag Update %s" % path)
         i =3D self.tags_list.get_iter_first()
         while i is not None:
             if self.tags_list.get_value(i, 0) =3D=3D path:
@@ -305,7 +305,7 @@ class NeardUI(Neard):
             i =3D self.tags_list.get_iter_first()
             while i is not None:
                 path_name =3D self.tags_list.get_value(i, 0)
-                print ("Deleted tag %s") % path_name
+                print("Deleted tag %s" % path_name)
                 self.tags_list.remove(i)
                 if self.tags_list.iter_is_valid(i):
                     i =3D self.tags_list.iter_next(i)
@@ -316,9 +316,9 @@ class NeardUI(Neard):
         if i is None:
             i =3D self.tags_list.append()
             self.tags_list.set_value(i, 0, path)
-            print ("Add tag %s") % (path)
+            print("Add tag %s" % (path))
         else:
-            print ("Update tag %s") % (path)
+            print("Update tag %s" % (path))
         self.tags_setUIList(tag_properties, i, 2, "ReadOnly")
         self.tags_setUIList(tag_properties, i, 3, "Type")
 =

@@ -336,11 +336,11 @@ class NeardUI(Neard):
 =

         if value is not None:
             self.records_list.set_value(i, col, value)
-        print ("  property %s, value %s") % (name, value)
+        print("  property %s, value %s" % (name, value))
 =

     #Add, Update or delete a list entry
     def record_UpdateUI(self, path =3D None, record_properties =3D None):
-        print("Record Update %s") % path
+        print("Record Update %s" % path)
         i =3D self.records_list.get_iter_first()
         while i is not None:
             if self.records_list.get_value(i, 0) =3D=3D path:
@@ -352,7 +352,7 @@ class NeardUI(Neard):
             i =3D self.records_list.get_iter_first()
             while i is not None:
                 path_name =3D self.records_list.get_value(i, 0)
-                print ("Delete record %s") % path_name
+                print("Delete record %s" % path_name)
                 self.records_list.remove(i)
                 if self.records_list.iter_is_valid(i):
                     i =3D self.records_list.iter_next(i)
@@ -363,9 +363,9 @@ class NeardUI(Neard):
         if i is None:
             i =3D self.records_list.append()
             self.records_list.set_value(i, 0, path)
-            print ("Add record %s") % (path)
+            print("Add record %s" % (path))
         else:
-            print ("Update record %s") % (path)
+            print("Update record %s" % (path))
 =

         self.records_setUIList(record_properties, i, 2, "Type")
         self.records_setUIList(record_properties, i, 3, "Data")
@@ -379,9 +379,9 @@ class NeardUI(Neard):
         model, iter =3D selection.get_selected()
         if iter:
              value =3D self.adapters_list.get_value(iter, 0)
-             print ("value %s") % value
+             print("value %s" % value)
              value =3D self.adapters_list.get_value(iter, 5)
-             print ("tag: %s") % value
+             print("tag: %s" % value)
 =

 =

     #-----------------------------------------------------
diff --git a/test/neardutils.py b/test/neardutils.py
index 6e423c075fe2..520870ab7944 100644
--- a/test/neardutils.py
+++ b/test/neardutils.py
@@ -17,7 +17,7 @@ def find_adapter(pattern=3DNone):
 =

 def find_adapter_in_objects(objects, pattern=3DNone):
         bus =3D dbus.SystemBus()
-        for path, ifaces in objects.iteritems():
+        for path, ifaces in objects.items():
                 adapter =3D ifaces.get(ADAPTER_INTERFACE)
                 if adapter is None:
                         continue
@@ -31,7 +31,7 @@ def find_device(pattern=3DNone):
 =

 def find_device_in_objects(objects, pattern=3DNone):
         bus =3D dbus.SystemBus()
-        for path, ifaces in objects.iteritems():
+        for path, ifaces in objects.items():
                 device =3D ifaces.get(DEVICE_INTERFACE)
                 if device is None:
                         continue
@@ -45,7 +45,7 @@ def find_tag(pattern=3DNone):
 =

 def find_tag_in_objects(objects, pattern=3DNone):
         bus =3D dbus.SystemBus()
-        for path, ifaces in objects.iteritems():
+        for path, ifaces in objects.items():
                 tag =3D ifaces.get(TAG_INTERFACE)
                 if tag is None:
                         continue
@@ -59,7 +59,7 @@ def find_record(pattern=3DNone):
 =

 def find_record_in_objects(objects, pattern=3DNone):
         bus =3D dbus.SystemBus()
-        for path, ifaces in objects.iteritems():
+        for path, ifaces in objects.items():
                 record =3D ifaces.get(RECORD_INTERFACE)
                 if record is None:
                         continue
@@ -76,18 +76,15 @@ def dump_record(record_path):
         properties =3D record_prop.GetAll(RECORD_INTERFACE)
 =

         for key in properties.keys():
-                if key in ["Representation"]:
-                        val =3D unicode(properties[key])
-                else:
-                        val =3D str(properties[key])
-                print "      %s =3D %s" % (key, val)
+                val =3D str(properties[key])
+                print("      %s =3D %s" % (key, val))
 =

 def dump_all_records(path):
         bus =3D dbus.SystemBus()
         om =3D dbus.Interface(bus.get_object(SERVICE_NAME, "/"),
                                         "org.freedesktop.DBus.ObjectManage=
r")
         objects =3D om.GetManagedObjects()
-        for path, interfaces in objects.iteritems():
+        for path, interfaces in objects.items():
                 if RECORD_INTERFACE not in interfaces:
                         continue
 =

diff --git a/test/phdc-simple-manager b/test/phdc-simple-manager
index e802c5a3252c..97dc8fd6090d 100755
--- a/test/phdc-simple-manager
+++ b/test/phdc-simple-manager
@@ -1,4 +1,4 @@
-#!/usr/bin/env python2.7
+#!/usr/bin/env python3
 =

 import sys
 import dbus
@@ -46,8 +46,8 @@ def hexdump( chars, sep, width ):
                 line =3D chars[:width]
                 chars =3D chars[width:]
                 line =3D line.ljust( width, '\000' )
-                print "%s%s%s" % ( sep.join( "%02x" % ord(c) for c in line=
 ),
-                         sep, quotechars( line ))
+                print("%s%s%s" % ( sep.join( "%02x" % ord(c) for c in line=
 ),
+                         sep, quotechars( line )))
 =

 =

 def quotechars( chars ):
@@ -57,26 +57,26 @@ def quotechars( chars ):
 class PhdcPeerManager:
     def __init__(self, agent_fd):
         #Grab the agent ....
-        print 'Init PhdcPeerManager thread'
+        print('Init PhdcPeerManager thread')
         self.r_fd =3D agent_fd.take()
-        print 'Agent fd:', str(self.r_fd)
+        print('Agent fd:', str(self.r_fd))
 =

     def run( self):
-        print 'Run PhdcPeerManager thread: ', str(self.r_fd)
+        print('Run PhdcPeerManager thread: ', str(self.r_fd))
         self.sock =3D socket.fromfd(self.r_fd, AF_NFC, socket.SOCK_STREAM)
         try:
             while True:
                 miu =3D self.sock.getsockopt(SOL_NFC, NFC_LLCP_MIUX)
-                print 'MIU=3D', miu
+                print('MIU=3D', miu)
 =

                 while True:
                     data =3D self.sock.recv(16)
                     if data =3D=3D None:
-                       print 'no data'
+                       print('no data')
                        break
 =

                    #analyze frame
-                    print 'analyze'
+                    print('analyze')
                     size =3D struct.unpack(">H", data[0:2])[0]
                     apdu =3D data[2:]
 =

@@ -86,7 +86,7 @@ class PhdcPeerManager:
                         if data =3D=3D None: break
                         hexdump(data, ':', 16)
                         apdu +=3D data
-                    print "[ieee] <<< {0}".format(str(apdu).encode("hex"))
+                    print("[ieee] <<< {0}".format(str(apdu).encode("hex")))
                     if apdu.startswith("\xE2\x00"):
                         apdu =3D bytearray.fromhex(thermometer_assoc_res)
                     elif apdu.startswith("\xE4\x00"):
@@ -94,26 +94,26 @@ class PhdcPeerManager:
                     else:
                         apdu =3D apdu[::-1]
                     time.sleep(0.2)
-                    print "[ieee] >>> {0}".format(str(apdu).encode("hex"))
+                    print("[ieee] >>> {0}".format(str(apdu).encode("hex")))
                     data =3D struct.pack(">H", len(apdu)) + apdu
                     for i in range(0, len(data), miu):
                         self.sock.send(str(data[i:i+miu]))
 =

-                print "remote peer {0} closed connection".format(agent_fd)
-                print "leaving ieee manager"
+                print("remote peer {0} closed connection".format(agent_fd))
+                print("leaving ieee manager")
                 self.sock.close()
 =

         except IOError as e:
                 if e.errno =3D=3D errno.EPIPE:
-                        print 'Remote disconnect'
+                        print('Remote disconnect')
                 else:
-                        print "I/O error({0}): {1}".format(e.errno, e.stre=
rror)
+                        print("I/O error({0}): {1}".format(e.errno, e.stre=
rror))
         finally:
-                print 'Finally exit'
+                print('Finally exit')
                 stop()
 =

         def stop(self):
-                print 'Stop PhdcPeerManager:', str(self.r_fd)
+                print('Stop PhdcPeerManager:', str(self.r_fd))
                 self._Thread__stop()
 =

 #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
@@ -125,7 +125,7 @@ class SimplePhdcManager(dbus.service.Object):
                                         in_signature=3D'',
                                         out_signature=3D'')
         def Release(self):
-                print 'Release'
+                print('Release')
                 mainloop.quit()
 =

 =

@@ -135,11 +135,11 @@ class SimplePhdcManager(dbus.service.Object):
                                         in_signature=3D'h',
                                         out_signature=3D'')
         def NewConnection(self, agent_fd):
-                print'Launch Phdc Manager thread for fd:', str(agent_fd)
+                print('Launch Phdc Manager thread for fd:', str(agent_fd))
                 self.server =3D PhdcPeerManager(agent_fd)
-                print'Run Server'
+                print('Run Server')
                 self.server.run()
-                print'Leave Server'
+                print('Leave Server')
                 return
 =

         ''' Called when the agent ends (from phdc_close)
@@ -147,7 +147,7 @@ class SimplePhdcManager(dbus.service.Object):
         @dbus.service.method('org.neard.PHDC.Manager',
                                         in_signature=3D'hi', out_signature=
=3D'')
         def Disconnection(self,agent_fd, i_err):
-                print'Stop Phdc Manager thread'
+                print('Stop Phdc Manager thread')
                 self.server.stop()
                 return
 =

@@ -159,7 +159,7 @@ This sample installs two PHDC Managers:
 if "__main__" =3D=3D __name__:
         dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
 =

-        print 'PHDC Simple Manager Test'
+        print('PHDC Simple Manager Test')
         bus =3D dbus.SystemBus()
         obj =3D bus.get_object("org.neard", "/org/neard");
         neard_manager =3D dbus.Interface(obj, "org.neard.PHDC")
@@ -167,14 +167,14 @@ if "__main__" =3D=3D __name__:
         simple_path =3D '/Simple'
         valid_path =3D '/Validation'
 =

-        print 'Creating & registering PHDC Simple Manager'
+        print('Creating & registering PHDC Simple Manager')
         simpleobject =3D SimplePhdcManager(bus, simple_path)
 =

         d =3D dbus.Dictionary({'Role': 'Manager', 'Path': simple_path,
                         'ServiceName': 'urn:nfc:sn:phdc' }, signature=3D's=
v')
         neard_manager.RegisterAgent(d)
 =

-        print 'Creating & Registering Validation Manager'
+        print('Creating & Registering Validation Manager')
 =

         validationobj=3D SimplePhdcManager(bus, valid_path)
         d =3D dbus.Dictionary({'Role': 'Manager', 'Path': valid_path,
diff --git a/test/test-adapter b/test/test-adapter
index 93b6f96e33ca..6d22f59bda0f 100755
--- a/test/test-adapter
+++ b/test/test-adapter
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 =

 import sys
 import dbus
@@ -27,7 +27,7 @@ if (len(sys.argv) < 2):
 if (sys.argv[1] =3D=3D "list"):
         if (len(sys.argv) < 3):
                 objects =3D neardutils.get_managed_objects()
-                for path, interfaces in objects.iteritems():
+                for path, interfaces in objects.items():
                         if "org.neard.Adapter" not in interfaces:
                                 continue
 =

@@ -70,8 +70,8 @@ if (sys.argv[1] =3D=3D "powered"):
                         value =3D dbus.Boolean(sys.argv[3])
                 try:
                         adapter.Set("org.neard.Adapter", "Powered", value)
-                except dbus.DBusException, error:
-                        print "%s: %s" % (error._dbus_error_name, error.me=
ssage)
+                except dbus.DBusException as error:
+                        print("%s: %s" % (error._dbus_error_name, error.me=
ssage))
         sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "poll"):
@@ -90,14 +90,14 @@ if (sys.argv[1] =3D=3D "poll"):
 =

                         try:
                                 adapter.StartPollLoop(mode)
-                        except dbus.DBusException, error:
-                                print "%s: %s" % (error._dbus_error_name, =
error.message)
+                        except dbus.DBusException as error:
+                                print("%s: %s" % (error._dbus_error_name, =
error.message))
 =

                 elif (sys.argv[3] =3D=3D "off"):
                         try:
                                 adapter.StopPollLoop()
-                        except dbus.DBusException, error:
-                                print "%s: %s" % (error._dbus_error_name, =
error.message)
+                        except dbus.DBusException as error:
+                                print("%s: %s" % (error._dbus_error_name, =
error.message))
 =

                 else:
                         usage()
diff --git a/test/test-device b/test/test-device
index bc66ce3f01cd..3086e1aad915 100755
--- a/test/test-device
+++ b/test/test-device
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 =

 import sys
 import dbus
@@ -19,20 +19,20 @@ def usage():
         print("  list")
         print("  dump <device>")
         print("  push <device> <type> <...>")
-        print "    If type is Text, parameters are <encoding> <language> <=
representation>"
-        print "    If type is URI, parameters are <uri>"
-        print "    If type is SmartPoster, parameters are <uri>"
-        print "    If type is Handover, parameters are <carrier>"
-        print "    If type is StaticHandover, parameters are <carrier>"
-        print "    If type is MIME, parameters are <mime_type> (only wifi_=
wsc and raw)"
-        print "       raw is for sending raw payload, parameters are <mime=
_type> <payload>"
-        print "e.g. < %s push /org/neard/nfc0/device0 Text UTF-8 en-US hel=
lo,Type2! >" % (sys.argv[0])
-        print "e.g. < %s push /org/neard/nfc0/device0 URI http://www.nfc-f=
orum.com >" % (sys.argv[0])
-        print "e.g. < %s push /org/neard/nfc0/device0 SmartPoster http://w=
ww.nfc-forum.com >" % (sys.argv[0])
-        print "e.g. < %s push /org/neard/nfc0/device0 Handover bluetooth,w=
ifi >" % (sys.argv[0])
-        print "e.g. < %s push /org/neard/nfc0/device0 StaticHandover bluet=
ooth,wifi >" % (sys.argv[0])
-        print "e.g. < %s push /org/neard/nfc0/device0 MIME wifi_wsc>" % (s=
ys.argv[0])
-        print "e.g. < %s push /org/neard/nfc0/device0 MIME raw application=
/xml '<your><xml tags></your>' >" % (sys.argv[0])
+        print("    If type is Text, parameters are <encoding> <language> <=
representation>")
+        print("    If type is URI, parameters are <uri>")
+        print("    If type is SmartPoster, parameters are <uri>")
+        print("    If type is Handover, parameters are <carrier>")
+        print("    If type is StaticHandover, parameters are <carrier>")
+        print("    If type is MIME, parameters are <mime_type> (only wifi_=
wsc and raw)")
+        print("       raw is for sending raw payload, parameters are <mime=
_type> <payload>")
+        print("e.g. < %s push /org/neard/nfc0/device0 Text UTF-8 en-US hel=
lo,Type2! >" % (sys.argv[0]))
+        print("e.g. < %s push /org/neard/nfc0/device0 URI http://www.nfc-f=
orum.com >" % (sys.argv[0]))
+        print("e.g. < %s push /org/neard/nfc0/device0 SmartPoster http://w=
ww.nfc-forum.com >" % (sys.argv[0]))
+        print("e.g. < %s push /org/neard/nfc0/device0 Handover bluetooth,w=
ifi >" % (sys.argv[0]))
+        print("e.g. < %s push /org/neard/nfc0/device0 StaticHandover bluet=
ooth,wifi >" % (sys.argv[0]))
+        print("e.g. < %s push /org/neard/nfc0/device0 MIME wifi_wsc>" % (s=
ys.argv[0]))
+        print("e.g. < %s push /org/neard/nfc0/device0 MIME raw application=
/xml '<your><xml tags></your>' >" % (sys.argv[0]))
 =

         sys.exit(1)
 =

@@ -42,7 +42,7 @@ if (len(sys.argv) < 2):
 if (sys.argv[1] =3D=3D "list"):
         if (len(sys.argv) < 3):
                 objects =3D neardutils.get_managed_objects()
-                for path, interfaces in objects.iteritems():
+                for path, interfaces in objects.items():
                         if "org.neard.Device" not in interfaces:
                                 continue
 =

@@ -58,7 +58,7 @@ if (sys.argv[1] =3D=3D "list"):
 if (sys.argv[1] =3D=3D "dump"):
         if (len(sys.argv) < 3):
                 objects =3D neardutils.get_managed_objects()
-                for path, interfaces in objects.iteritems():
+                for path, interfaces in objects.items():
                         if "org.neard.Device" not in interfaces:
                                 continue
 =

diff --git a/test/test-tag b/test/test-tag
index 9f7f58851cc9..4183b9c3ded8 100755
--- a/test/test-tag
+++ b/test/test-tag
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 =

 import sys
 import dbus
@@ -46,7 +46,7 @@ if (len(sys.argv) < 2):
 if (sys.argv[1] =3D=3D "list"):
         if (len(sys.argv) < 3):
                 objects =3D neardutils.get_managed_objects()
-                for path, interfaces in objects.iteritems():
+                for path, interfaces in objects.items():
                         if "org.neard.Tag" not in interfaces:
                                 continue
 =

@@ -70,7 +70,7 @@ if (sys.argv[1] =3D=3D "list"):
 if (sys.argv[1] =3D=3D "dump"):
         if (len(sys.argv) < 3):
                 objects =3D neardutils.get_managed_objects()
-                for path, interfaces in objects.iteritems():
+                for path, interfaces in objects.items():
                         if "org.neard.Tag" not in interfaces:
                                 continue
 =

@@ -127,7 +127,7 @@ def write_uri(args):
                 data["Type"] =3D "URI"
                 data["URI"] =3D args[0]
 =

-        print data
+        print(data)
 =

         tag.Write(data)
 =

@@ -169,7 +169,7 @@ if (sys.argv[1] =3D=3D "write"):
         sys.exit(0)
 =

 if (sys.argv[1] =3D=3D "deactivate"):
-        print sys.argv[2]
+        print(sys.argv[2])
         if (len(sys.argv) !=3D 2):
                 tag =3D neardutils.find_tag(sys.argv[2])
                 tag.Deactivate()
-- =

2.33.1

--===============7301253834127500963==--

