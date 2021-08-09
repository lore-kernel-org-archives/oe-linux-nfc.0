Content-Type: multipart/mixed; boundary="===============3445886607306232441=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] [neard][RFC] test: Convert Python2 scripts to Python3
Date: Mon, 09 Aug 2021 12:35:07 +0200
Message-ID: <65c7b6ca-c1f6-6557-1b54-f8f666e3a5bf@canonical.com>
In-Reply-To: <20210808022058.171350-1-mgreer@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3445886607306232441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/08/2021 04:20, Mark Greer wrote:
> Python2 is deprecated so convert the neard test scripts, which are
> Python2, to Python3.
> =

> Signed-off-by: Mark Greer <mgreer@animalcreek.com>
> ---
> This is a first pass at converting the python scripts to Python3.
> Not a lot of testing yet.  It appears that the 'gobject' is not
> available anymore so I have to look into how to rework the code that
> uses it.
> =

> I would appreciate any testing that you are willing to provide.
> =

> Also available at:
> 	https://github.com/linux-nfc/neard/tree/mag/python3-ize
> =

>  se/test/test-channel     | 18 +++++------
>  se/test/test-seel        | 38 +++++++++++-----------
>  test/bt-handover         |  8 ++---
>  test/handover-agent      | 34 +++++++++----------
>  test/monitor-near        |  8 ++---
>  test/ndef-agent          | 20 ++++++------
>  test/neard-ui.py         | 70 ++++++++++++++++++++--------------------
>  test/neardutils.py       | 14 ++++----
>  test/phdc-simple-manager | 50 ++++++++++++++--------------
>  test/test-adapter        | 16 ++++-----
>  test/test-device         | 34 +++++++++----------
>  test/test-tag            | 10 +++---
>  12 files changed, 160 insertions(+), 160 deletions(-)
> =


Few tests:
------------
$ sudo python3 ./test/test-adapter poll nfc0 on
Traceback (most recent call last):
  File "./test/test-adapter", line 92, in <module>
    adapter.StartPollLoop(mode)
  File "/usr/lib/python3/dist-packages/dbus/proxies.py", line 72, in
__call__
    return self._proxy_method(*args, **keywords)
  File "/usr/lib/python3/dist-packages/dbus/proxies.py", line 141, in
__call__
    return self._connection.call_blocking(self._named_service,
  File "/usr/lib/python3/dist-packages/dbus/connection.py", line 652, in
call_blocking
    reply_message =3D self.send_message_with_reply_and_block(
dbus.exceptions.DBusException: org.neard.Error.Failed: No such device

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "./test/test-adapter", line 94, in <module>
    print("%s: %s" % (error._dbus_error_name, error.message))
AttributeError: 'DBusException' object has no attribute 'message'
------------

The same attribute message error also with:
------------
$ sudo python3 ./test/test-adapter powered nfc0 on
$ sudo python3 ./test/test-adapter poll nfc0 on
$ sudo python3 ./test/test-adapter powered nfc0 off
Traceback (most recent call last):
  File "./test/test-adapter", line 72, in <module>
    adapter.Set("org.neard.Adapter", "Powered", value)
  File "/usr/lib/python3/dist-packages/dbus/proxies.py", line 72, in
__call__
    return self._proxy_method(*args, **keywords)
  File "/usr/lib/python3/dist-packages/dbus/proxies.py", line 141, in
__call__
    return self._connection.call_blocking(self._named_service,
  File "/usr/lib/python3/dist-packages/dbus/connection.py", line 652, in
call_blocking
    reply_message =3D self.send_message_with_reply_and_block(
dbus.exceptions.DBusException: org.neard.Error.Failed: Unknown error -16

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "./test/test-adapter", line 74, in <module>
    print("%s: %s" % (error._dbus_error_name, error.message))
AttributeError: 'DBusException' object has no attribute 'message'
------------


Others:
------------
sudo python3 ./test/test-device
  File "./test/test-device", line 76
    usage()
          ^
TabError: inconsistent use of tabs and spaces in indentation
------------
sudo python3 ./test/phdc-simple-manager
  File "./test/phdc-simple-manager", line 60
    print('Init PhdcPeerManager thread')
                                       ^
TabError: inconsistent use of tabs and spaces in indentation
------------


> diff --git a/se/test/test-channel b/se/test/test-channel
> index e6ed0114c8c8..600ab8647e08 100755
> --- a/se/test/test-channel
> +++ b/se/test/test-channel
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/python3
>  =

>  import sys
>  import dbus
> @@ -9,10 +9,10 @@ def extract_byte_array(byte_array):
>  	return ' '.join("{:02x}".format(byte) for byte in byte_array)
>  =

>  def usage():
> -	print "Usage: %s <command>" % (sys.argv[0])
> -	print ""
> -	print "  list"
> -	print "  send_apdu se/nfcX_<se_type>_seX channelX <apdu>"
> +	print("Usage: %s <command>" % (sys.argv[0]))
> +	print("")
> +	print("  list")
> +	print("  send_apdu se/nfcX_<se_type>_seX channelX <apdu>")
>  	sys.exit(1)
>  =

>  if (len(sys.argv) < 2):
> @@ -29,7 +29,7 @@ if (sys.argv[1] =3D=3D "list"):
>  		properties =3D seel.GetProperties()
>  =

>  		for path in properties["Channels"]:
> -			print "[ %s ]" % (path)
> +			print("[ %s ]" % (path))
>  =

>  			channel =3D dbus.Interface(bus.get_object("org.neard.se", path),
>  						"org.neard.se.Channel")
> @@ -41,10 +41,10 @@ if (sys.argv[1] =3D=3D "list"):
>  						val =3D "true"
>  					else:
>  						val =3D "false"
> -					print "    %s =3D %s" % (key, val)
> +					print("    %s =3D %s" % (key, val))
>  =

>  				if key in ["AID"]:
> -					print "    %s =3D %s" % (key, extract_byte_array(properties[key]))
> +					print("    %s =3D %s" % (key, extract_byte_array(properties[key])))
>  	sys.exit(0)
>  =

>  if (sys.argv[1] =3D=3D "send_apdu"):
> @@ -58,7 +58,7 @@ if (sys.argv[1] =3D=3D "send_apdu"):
>  =

>  		response =3D channel.SendAPDU(sys.argv[4].decode("hex"))
>  =

> -		print "--> %s" % extract_byte_array(response)
> +		print("--> %s" % extract_byte_array(response))
>  	sys.exit(0)
>  =

>  usage()
> diff --git a/se/test/test-seel b/se/test/test-seel
> index e238a38851a9..2b877daf5bd1 100755
> --- a/se/test/test-seel
> +++ b/se/test/test-seel
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/python3
>  =

>  import sys
>  import dbus
> @@ -13,12 +13,12 @@ def extract_list(list):
>  	return val
>  =

>  def usage():
> -	print "Usage: %s <command>" % (sys.argv[0])
> -	print ""
> -	print "  list"
> -	print "  enabled se/nfcX_<se_type>_seX [on/off]"
> -	print "  open_channel se/nfcX_<se_type>_seX <AID>"
> -	print "  close_channel se/nfcX_<se_type>_seX channelX"
> +	print("Usage: %s <command>" % (sys.argv[0]))
> +	print("")
> +	print("  list")
> +	print("  enabled se/nfcX_<se_type>_seX [on/off]")
> +	print("  open_channel se/nfcX_<se_type>_seX <AID>")
> +	print("  close_channel se/nfcX_<se_type>_seX channelX")
>  	sys.exit(1)
>  =

>  if (len(sys.argv) < 2):
> @@ -33,7 +33,7 @@ if (sys.argv[1] =3D=3D "list"):
>  		properties =3D manager.GetProperties()
>  =

>  		for path in properties["SecureElements"]:
> -			print "[ %s ]" % (path)
> +			print("[ %s ]" % (path))
>  =

>  			seel =3D dbus.Interface(bus.get_object("org.neard.se", path),
>  						"org.neard.se.SecureElement")
> @@ -45,13 +45,13 @@ if (sys.argv[1] =3D=3D "list"):
>  						val =3D "true"
>  					else:
>  						val =3D "false"
> -					print "    %s =3D %s" % (key, val)
> +					print("    %s =3D %s" % (key, val))
>  =

>  				if key in ["Type"]:
> -					print "    %s =3D %s" % (key, str(properties[key]))
> +					print("    %s =3D %s" % (key, str(properties[key])))
>  =

>  				if key in ["Channels"]:
> -					print "    %s =3D %s" % (key, extract_list(properties[key]))
> +					print("    %s =3D %s" % (key, extract_list(properties[key])))
>  	sys.exit(0)
>  =

>  if (sys.argv[1] =3D=3D "enabled"):
> @@ -69,10 +69,10 @@ if (sys.argv[1] =3D=3D "enabled"):
>  			elif (sys.argv[3] =3D=3D "off"):
>  				val =3D seel.SetProperty("Enabled", dbus.Boolean(0), timeout =3D 10)
>  			else:
> -				print "Invalid option %s" % sys.argv[3]
> +				print("Invalid option %s" % sys.argv[3])
>  =

> -		except dbus.DBusException, error:
> -			print "%s: %s" % (error._dbus_error_name, error.message)
> +		except dbus.DBusException as error:
> +			print("%s: %s" % (error._dbus_error_name, error.message))
>  	sys.exit(0)
>  =

>  if (sys.argv[1] =3D=3D "open_channel"):
> @@ -87,9 +87,9 @@ if (sys.argv[1] =3D=3D "open_channel"):
>  		try:
>  			channel =3D seel.OpenChannel(sys.argv[3].decode("hex"))
>  =

> -			print "Opened channel: %s" % str(channel)
> -		except dbus.DBusException, error:
> -			print "%s: %s" % (error._dbus_error_name, error.message)
> +			print("Opened channel: %s" % str(channel))
> +		except dbus.DBusException as error:
> +			print("%s: %s" % (error._dbus_error_name, error.message))
>  	sys.exit(0)
>  =

>  if (sys.argv[1] =3D=3D "close_channel"):
> @@ -107,8 +107,8 @@ if (sys.argv[1] =3D=3D "close_channel"):
>  		try:
>  			seel.CloseChannel(channel)
>  =

> -		except dbus.DBusException, error:
> -			print "%s: %s" % (error._dbus_error_name, error.message)
> +		except dbus.DBusException as error:
> +			print("%s: %s" % (error._dbus_error_name, error.message))
>  	sys.exit(0)
>  =

>  usage()
> diff --git a/test/bt-handover b/test/bt-handover
> index 42d66bff8d66..f6921d2b4534 100755
> --- a/test/bt-handover
> +++ b/test/bt-handover
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/python3
>  =

>  import os
>  import sys
> @@ -14,7 +14,7 @@ from dbus.lowlevel import MethodCallMessage, HANDLER_RE=
SULT_NOT_YET_HANDLED
>  mainloop =3D gobject.MainLoop()
>  =

>  def device_added(path, interfaces):
> -	for iface, props in interfaces.iteritems():
> +	for iface, props in interfaces.items():
>  		if "org.neard.Device" in interfaces:
>  			print("Pairing with %s" % (path))
>  			device =3D dbus.Interface(bus.get_object("org.neard", path),
> @@ -34,7 +34,7 @@ def remove_paired_devices(bt_adapter):
>  					"org.freedesktop.DBus.ObjectManager")
>  	objects =3D manager.GetManagedObjects()
>  =

> -	all_adapters =3D (path for path, interfaces in objects.iteritems() if
> +	all_adapters =3D (path for path, interfaces in objects.items() if
>  				"org.bluez.Adapter1" in interfaces.keys()
>  				and path.endswith(bt_adapter))
>  =

> @@ -60,7 +60,7 @@ def remove_paired_devices(bt_adapter):
>  		print("Bluetooth adapter %s is not powered" % adapter_path )
>  		exit()
>  =

> -	all_devices =3D (path for path, interfaces in objects.iteritems() if
> +	all_devices =3D (path for path, interfaces in objects.items() if
>  				("org.bluez.Device1" in interfaces.keys()
>  				and path.startswith(bluez_adapter.object_path)))
>  =

> diff --git a/test/handover-agent b/test/handover-agent
> index 7f2ac23246b0..a1b42d9f890e 100755
> --- a/test/handover-agent
> +++ b/test/handover-agent
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/python3
>  =

>  import gobject
>  =

> @@ -23,18 +23,18 @@ power_state =3D None
>  def print_fields(fields):
>  	if 'EIR' in fields:
>  		s =3D ' '.join('{:#02x}'.format(i) for i in fields['EIR'])
> -		print '  EIR:  %s' % s
> +		print('  EIR:  %s' % s)
>  =

>  	if 'nokia.com:bt' in fields:
>  		s =3D ' '.join('{:#02x}'.format(i) for i in fields['nokia.com:bt'])
> -		print '  nokia.com:bt:  %s' % s
> +		print('  nokia.com:bt:  %s' % s)
>  =

>  	if 'State' in fields:
> -		print '  State: %s' % fields['State']
> +		print('  State: %s' % fields['State'])
>  =

>  	if 'WSC' in fields:
>  		s =3D ' '.join('{:#02x}'.format(i) for i in fields['WSC'])
> -		print '  WSC:  %s' % s
> +		print('  WSC:  %s' % s)
>  =

>  class BTHOAgent(dbus.service.Object):
>  =

> @@ -42,14 +42,14 @@ class BTHOAgent(dbus.service.Object):
>  					in_signature=3D'',
>  					out_signature=3D'')
>  	def Release(self):
> -		print 'Release'
> +		print('Release')
>  		mainloop.quit()
>  =

>  	@dbus.service.method('org.neard.HandoverAgent',
>  					in_signature=3D'a{sv}',
>  					out_signature=3D'')
>  	def PushOOB(self, fields):
> -		print 'PushOOB'
> +		print('PushOOB')
>  		print_fields(fields)
>  =

>  	@dbus.service.method('org.neard.HandoverAgent',
> @@ -57,15 +57,15 @@ class BTHOAgent(dbus.service.Object):
>  					out_signature=3D'a{sv}')
>  =

>  	def RequestOOB(self, fields):
> -		print 'RequestOOB'
> +		print('RequestOOB')
>  		print_fields(fields)
>  =

> -		print '  Replying with'
> +		print('  Replying with')
>  		s =3D ' '.join('{:#02x}'.format(i) for i in eir_test_data)
> -		print '    EIR: %s' % s
> +		print('    EIR: %s' % s)
>  =

>  		if power_state !=3D 'unknown':
> -			print '    State: %s' % power_state
> +			print('    State: %s' % power_state)
>  			return {'EIR' : eir_test_data, 'State' : power_state}
>  		else:
>  			return {'EIR' : eir_test_data}
> @@ -76,14 +76,14 @@ class WiFiHOAgent(dbus.service.Object):
>  					in_signature=3D'',
>  					out_signature=3D'')
>  	def Release(self):
> -		print 'Release'
> +		print('Release')
>  		mainloop.quit()
>  =

>  	@dbus.service.method('org.neard.HandoverAgent',
>  					in_signature=3D'a{sv}',
>  					out_signature=3D'')
>  	def PushOOB(self, fields):
> -		print 'PushOOB'
> +		print('PushOOB')
>  		print_fields(fields)
>  =

>  	@dbus.service.method('org.neard.HandoverAgent',
> @@ -91,15 +91,15 @@ class WiFiHOAgent(dbus.service.Object):
>  					out_signature=3D'a{sv}')
>  =

>  	def RequestOOB(self, fields):
> -		print 'RequestOOB'
> +		print('RequestOOB')
>  		print_fields(fields)
>  =

> -		print '  Replying with'
> +		print('  Replying with')
>  		s =3D ' '.join('{:#02x}'.format(i) for i in wsc_test_data)
> -		print '    WSC: %s' % s
> +		print('    WSC: %s' % s)
>  =

>  		if power_state !=3D 'unknown':
> -			print '    State: %s' % power_state
> +			print('    State: %s' % power_state)
>  			return {'WSC' : wsc_test_data, 'State' : power_state}
>  		else:
>  			return {'WSC' : wsc_test_data}
> diff --git a/test/monitor-near b/test/monitor-near
> index f3ad021d60a3..ee0cb4177ae3 100755
> --- a/test/monitor-near
> +++ b/test/monitor-near
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/python3
>  =

>  from __future__ import absolute_import, print_function, unicode_literals
>  =

> @@ -9,15 +9,15 @@ import dbus.mainloop.glib
>  =

>  def property_changed(interface, changed, invalidated, path):
>  	iface =3D interface[interface.rfind(".") + 1:]
> -	for name, value in changed.iteritems():
> +	for name, value in changed.items():
>  		val =3D str(value)
>  		print("{%s.PropertyChanged} [%s] %s =3D %s" % (iface, path, name,
>  									val))
>  =

>  def interfaces_added(path, interfaces):
> -	for iface, props in interfaces.iteritems():
> +	for iface, props in interfaces.items():
>  		print("{Added %s} [%s]" % (iface, path))
> -		for name, value in props.iteritems():
> +		for name, value in props.items():
>  			print("      %s =3D %s" % (name, value))
>  =

>  def interfaces_removed(path, interfaces):
> diff --git a/test/ndef-agent b/test/ndef-agent
> index 1cfeb03e2330..084768bf0e5c 100755
> --- a/test/ndef-agent
> +++ b/test/ndef-agent
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/python3
>  =

>  import gobject
>  =

> @@ -12,43 +12,43 @@ class NDEFAgent(dbus.service.Object):
>  	@dbus.service.method("org.neard.NDEFAgent",
>  					in_signature=3D'', out_signature=3D'')
>  	def Release(self):
> -		print "Release"
> +		print("Release")
>  		mainloop.quit()
>  =

>  	@dbus.service.method("org.neard.NDEFAgent",
>  					in_signature=3D'a{sv}',
>  					out_signature=3D'')
>  	def GetNDEF(self, fields):
> -		print "GetNDEF"
> +		print("GetNDEF")
>  =

>  		if fields.has_key("Record"):
> -			print "Record path %s" % (fields["Record"])
> +			print("Record path %s" % (fields["Record"]))
>  =

>  		if fields.has_key("Payload"):
>  			val =3D "["
>  			for i in fields["Payload"]:
>  				val +=3D " 0x%x" % i
>  			val +=3D " ]"
> -			print "Record payload %s" % val
> +			print("Record payload %s" % val)
>  =

>  		if fields.has_key("NDEF"):
>  			val =3D "["
>  			for i in fields["NDEF"]:
>  				val +=3D " 0x%x" % i
>  			val +=3D " ]"
> -			print "Complete NDEF %s" % val
> +			print("Complete NDEF %s" % val)
>  =

>  		return
>  =

>  	@dbus.service.method("org.neard.NDEFAgent",
>  					in_signature=3D'', out_signature=3D'')
>  	def Cancel(self):
> -		print "Cancel"
> +		print("Cancel")
>  =

>  def print_usage():
> -	print "Usage:"
> -	print "%s Type=3D<record type>" % (sys.argv[0])
> -	print "Help: %s help" % (sys.argv[0])
> +	print("Usage:")
> +	print("%s Type=3D<record type>" % (sys.argv[0]))
> +	print("Help: %s help" % (sys.argv[0]))
>  	sys.exit(1)
>  =

>  if __name__ =3D=3D '__main__':
> diff --git a/test/neard-ui.py b/test/neard-ui.py
> index cf4bb13c5155..91f8e6bbaa6a 100755
> --- a/test/neard-ui.py
> +++ b/test/neard-ui.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>  =

>  import pdb
>  import sys
> @@ -18,12 +18,12 @@ import neardutils
>  class Neard:
>  =

>      def interface_Added(self, path, interface):
> -        print (" New interface added: %s") % path
> +        print((" New interface added: %s") % path)


Instead:
print(" New interface added: %s" % path)

>          self.objects =3D neardutils.get_managed_objects()
>          self.interface_updateDetails(interface, path)
>  =

>      def interface_Removed(self, path, interface):
> -        print (" Remove interface: %s") % path
> +        print((" Remove interface: %s") % path)

Same here.

>          self.objects =3D neardutils.get_managed_objects()
>          self.interface_updateDetails(interface)
>  =

> @@ -32,7 +32,7 @@ class Neard:
>      #add/remove interface
>      def interfaces_Connect(self):
>          try:
> -            print 'interfaces_Connect'
> +            print('interfaces_Connect')
>              bus =3D dbus.SystemBus()
>              self.objects =3D neardutils.get_managed_objects()
>              bus.add_signal_receiver(self.interface_Added, bus_name=3Dnea=
rdutils.SERVICE_NAME,
> @@ -42,7 +42,7 @@ class Neard:
>                                      dbus_interface=3D"org.freedesktop.DB=
us.ObjectManager",
>                                      signal_name=3D"InterfacesRemoved")
>          except:
> -            print ("Can't connect to org.freedesktop.DBus.ObjectManager"=
);
> +            print(("Can't connect to org.freedesktop.DBus.ObjectManager"=
));

Double ((

>              self.objects =3D None
>  =

>          #Retrieve the manager informations
> @@ -60,7 +60,7 @@ class Neard:
>              self.record_updateDetails(path)
>  =

>      def adapter_PropertyChanged(self, prop, value, adapt_path =3D None):
> -        print("Prop changed: %s") % prop
> +        print(("Prop changed: %s") % prop)

Ditto

>          adapt_properties =3D {}
>          adapt_properties[prop] =3D value
>          if prop =3D=3D "Tags":
> @@ -71,7 +71,7 @@ class Neard:
>      #Update the records UI
>      def record_updateDetails(self, tag_path=3DNone):
>          if tag_path is not None:
> -            for record_path, record_iface in self.objects.iteritems():
> +            for record_path, record_iface in self.objects.items():
>  =

>                  if neardutils.RECORD_INTERFACE not in record_iface:
>                      continue
> @@ -88,11 +88,11 @@ class Neard:
>      #Update the tags UI
>      def tag_updateDetails(self, adapter_path=3DNone):
>          if adapter_path is not None:
> -            for tag_path, interfaces in self.objects.iteritems():
> +            for tag_path, interfaces in self.objects.items():
>                  if neardutils.TAG_INTERFACE not in interfaces:
>                      continue
>  =

> -                print ("TAG %s ") % tag_path
> +                print(("TAG %s ") % tag_path)

Ditto

>  =

>                  tag_properties =3D interfaces[neardutils.TAG_INTERFACE]
>  =

> @@ -102,19 +102,19 @@ class Neard:
>                  #Process the records
>                  self.record_updateDetails(tag_properties)
>          else:
> -            print ("remove tags and records")
> +            print("remove tags and records")
>              self.tags_update()
>              self.records_update()
>  =

>  =

>      #Something changed, must update the UI
>      def adapter_updateDetails(self):
> -        for adapt_path, interfaces in self.objects.iteritems():
> +        for adapt_path, interfaces in self.objects.items():
>              if neardutils.ADAPTER_INTERFACE not in interfaces:
>                     continue
>  =

>              if adapt_path in self.adaptregistered:
> -                   print (" already registered %s") % adapt_path
> +                   print((" already registered %s") % adapt_path)

Same... and in following places as well.

>              else:
>                     adapt_properties =3D interfaces[neardutils.ADAPTER_IN=
TERFACE]
>  =

> @@ -179,16 +179,16 @@ class NeardUI(Neard):
>  =

>              try:
>                  if self.adapters_actionToggle(i, 2):
> -                    print ("Disable Adapter %s") % objpath
> +                    print(("Disable Adapter %s") % objpath)
>                      adapter.Set(neardutils.ADAPTER_INTERFACE, "Powered",=
 False)
>                      self.adapters_list.set_value(i, 2, 0)
>                  else:
> -                    print ("Enable Adapter %s") % objpath
> +                    print(("Enable Adapter %s") % objpath)
>                      adapter.Set(neardutils.ADAPTER_INTERFACE, "Powered",=
 True)
>                      self.adapters_list.set_value(i, 2, 1)
>  =

>              except:
> -                print ("Can't toggle adapter %s") % objpath
> +                print(("Can't toggle adapter %s") % objpath)
>  =

>      # Action: activate or not the polling mode
>      def adapter_pollingToggled(self, poolingRendererToggle, path, user):
> @@ -199,15 +199,15 @@ class NeardUI(Neard):
>  =

>              try:
>                  if self.adapters_actionToggle(i, 3):
> -                    print ("Stop Polling %s") % objpath
> +                    print(("Stop Polling %s") % objpath)
>                      adapt_iface.StopPollLoop()
>                      self.adapters_list.set_value(i, 3, 0)
>                  else:
> -                    print ("Start Polling %s") % objpath
> +                    print(("Start Polling %s") % objpath)
>                      adapt_iface.StartPollLoop("Initiator")
>                      self.adapters_list.set_value(i, 3, 1)
>              except:
> -                print ("Can't toggle polling on adapter %s") % objpath
> +                print(("Can't toggle polling on adapter %s") % objpath)
>  =

>      #------------------------------
>      #Set the field values
> @@ -238,7 +238,7 @@ class NeardUI(Neard):
>  =

>              if value is not None:
>                  self.adapters_list.set_value(i, col, value)
> -            print ("  property %s, value %s") % (name, value)
> +            print(("  property %s, value %s") % (name, value))
>  =

>      # Clear one or all the adapters present in list
>      def adapter_RemoveUI(self):
> @@ -254,18 +254,18 @@ class NeardUI(Neard):
>  =

>          if adapt_properties is None:
>              if i:
> -                print ("Delete adapter %s") % path
> +                print(("Delete adapter %s") % path)
>                  self.adapters_list.remove(i)
>              else:
> -                print ("Already deleted adapter %s") % path
> +                print(("Already deleted adapter %s") % path)
>              return
>  =

>          if i is None:
>              i =3D self.adapters_list.append()
>              self.adapters_list.set_value(i, 0, path)
> -            print ("Add adapter %s") % (path)
> +            print(("Add adapter %s") % (path))
>          else:
> -            print ("Update adapter %s") % (path)
> +            print(("Update adapter %s") % (path))
>  =

>  =

>          self.adapters_setUIList(adapt_properties, i, 2, "Powered")
> @@ -289,11 +289,11 @@ class NeardUI(Neard):
>  =

>              if value is not None:
>                  self.tags_list.set_value(i, col, value)
> -            print ("  property %s, value %s") % (name, value)
> +            print(("  property %s, value %s") % (name, value))
>  =

>      #Add, Update or delete a list entry
>      def tag_UpdateUI(self, path =3D None, tag_properties =3D None):
> -        print("Tag Update %s") % path
> +        print(("Tag Update %s") % path)
>          i =3D self.tags_list.get_iter_first()
>          while i is not None:
>              if self.tags_list.get_value(i, 0) =3D=3D path:
> @@ -305,7 +305,7 @@ class NeardUI(Neard):
>              i =3D self.tags_list.get_iter_first()
>              while i is not None:
>                  path_name =3D self.tags_list.get_value(i, 0)
> -                print ("Deleted tag %s") % path_name
> +                print(("Deleted tag %s") % path_name)
>                  self.tags_list.remove(i)
>                  if self.tags_list.iter_is_valid(i):
>                      i =3D self.tags_list.iter_next(i)
> @@ -316,9 +316,9 @@ class NeardUI(Neard):
>          if i is None:
>              i =3D self.tags_list.append()
>              self.tags_list.set_value(i, 0, path)
> -            print ("Add tag %s") % (path)
> +            print(("Add tag %s") % (path))
>          else:
> -            print ("Update tag %s") % (path)
> +            print(("Update tag %s") % (path))
>          self.tags_setUIList(tag_properties, i, 2, "ReadOnly")
>          self.tags_setUIList(tag_properties, i, 3, "Type")
>  =

> @@ -336,11 +336,11 @@ class NeardUI(Neard):
>  =

>          if value is not None:
>              self.records_list.set_value(i, col, value)
> -        print ("  property %s, value %s") % (name, value)
> +        print(("  property %s, value %s") % (name, value))
>  =

>      #Add, Update or delete a list entry
>      def record_UpdateUI(self, path =3D None, record_properties =3D None):
> -        print("Record Update %s") % path
> +        print(("Record Update %s") % path)
>          i =3D self.records_list.get_iter_first()
>          while i is not None:
>              if self.records_list.get_value(i, 0) =3D=3D path:
> @@ -352,7 +352,7 @@ class NeardUI(Neard):
>              i =3D self.records_list.get_iter_first()
>              while i is not None:
>                  path_name =3D self.records_list.get_value(i, 0)
> -                print ("Delete record %s") % path_name
> +                print(("Delete record %s") % path_name)
>                  self.records_list.remove(i)
>                  if self.records_list.iter_is_valid(i):
>                      i =3D self.records_list.iter_next(i)
> @@ -363,9 +363,9 @@ class NeardUI(Neard):
>          if i is None:
>              i =3D self.records_list.append()
>              self.records_list.set_value(i, 0, path)
> -            print ("Add record %s") % (path)
> +            print(("Add record %s") % (path))
>          else:
> -            print ("Update record %s") % (path)
> +            print(("Update record %s") % (path))
>  =

>          self.records_setUIList(record_properties, i, 2, "Type")
>          self.records_setUIList(record_properties, i, 3, "Data")
> @@ -379,9 +379,9 @@ class NeardUI(Neard):
>          model, iter =3D selection.get_selected()
>          if iter:
>               value =3D self.adapters_list.get_value(iter, 0)
> -             print ("value %s") % value
> +             print(("value %s") % value)
>               value =3D self.adapters_list.get_value(iter, 5)
> -             print ("tag: %s") % value
> +             print(("tag: %s") % value)
>  =

>  =

>      #-----------------------------------------------------
> diff --git a/test/neardutils.py b/test/neardutils.py
> index d93ae637bb27..047678b3f8e5 100644
> --- a/test/neardutils.py
> +++ b/test/neardutils.py
> @@ -17,7 +17,7 @@ def find_adapter(pattern=3DNone):
>  =

>  def find_adapter_in_objects(objects, pattern=3DNone):
>  	bus =3D dbus.SystemBus()
> -	for path, ifaces in objects.iteritems():
> +	for path, ifaces in objects.items():
>  		adapter =3D ifaces.get(ADAPTER_INTERFACE)
>  		if adapter is None:
>  			continue
> @@ -31,7 +31,7 @@ def find_device(pattern=3DNone):
>  =

>  def find_device_in_objects(objects, pattern=3DNone):
>  	bus =3D dbus.SystemBus()
> -	for path, ifaces in objects.iteritems():
> +	for path, ifaces in objects.items():
>  		device =3D ifaces.get(DEVICE_INTERFACE)
>  		if device is None:
>  			continue
> @@ -45,7 +45,7 @@ def find_tag(pattern=3DNone):
>  =

>  def find_tag_in_objects(objects, pattern=3DNone):
>  	bus =3D dbus.SystemBus()
> -	for path, ifaces in objects.iteritems():
> +	for path, ifaces in objects.items():
>  		tag =3D ifaces.get(TAG_INTERFACE)
>  		if tag is None:
>  			continue
> @@ -59,7 +59,7 @@ def find_record(pattern=3DNone):
>  =

>  def find_record_in_objects(objects, pattern=3DNone):
>  	bus =3D dbus.SystemBus()
> -	for path, ifaces in objects.iteritems():
> +	for path, ifaces in objects.items():
>  		record =3D ifaces.get(RECORD_INTERFACE)
>  		if record is None:
>  			continue
> @@ -77,17 +77,17 @@ def dump_record(record_path):
>  =

>  	for key in properties.keys():
>  		if key in ["Representation"]:
> -			val =3D unicode(properties[key])
> +			val =3D str(properties[key])
>  		else:
>  			val =3D str(properties[key])
> -		print "      %s =3D %s" % (key, val)
> +		print("      %s =3D %s" % (key, val))
>  =

>  def dump_all_records(path):
>  	bus =3D dbus.SystemBus()
>  	om =3D dbus.Interface(bus.get_object(SERVICE_NAME, "/"),
>  					"org.freedesktop.DBus.ObjectManager")
>  	objects =3D om.GetManagedObjects()
> -	for path, interfaces in objects.iteritems():
> +	for path, interfaces in objects.items():
>  		if RECORD_INTERFACE not in interfaces:
>  			continue
>  =

> diff --git a/test/phdc-simple-manager b/test/phdc-simple-manager
> index 4fd25df541d8..2536d4b0c5b7 100755
> --- a/test/phdc-simple-manager
> +++ b/test/phdc-simple-manager
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python2.7
> +#!/usr/bin/env python3
>  =

>  import sys
>  import dbus
> @@ -46,8 +46,8 @@ def hexdump( chars, sep, width ):
>  		line =3D chars[:width]
>  		chars =3D chars[width:]
>  		line =3D line.ljust( width, '\000' )
> -		print "%s%s%s" % ( sep.join( "%02x" % ord(c) for c in line ),
> -			 sep, quotechars( line ))
> +		print("%s%s%s" % ( sep.join( "%02x" % ord(c) for c in line ),
> +			 sep, quotechars( line )))
>  =

>  =

>  def quotechars( chars ):
> @@ -57,26 +57,26 @@ def quotechars( chars ):
>  class PhdcPeerManager:
>      def __init__(self, agent_fd):
>  	#Grab the agent ....
> -	print 'Init PhdcPeerManager thread'
> +	print('Init PhdcPeerManager thread')
>  	self.r_fd =3D agent_fd.take()
> -	print 'Agent fd:', str(self.r_fd)
> +	print('Agent fd:', str(self.r_fd))
>  =

>      def run( self):
> -	print 'Run PhdcPeerManager thread: ', str(self.r_fd)
> +	print('Run PhdcPeerManager thread: ', str(self.r_fd))
>  	self.sock =3D socket.fromfd(self.r_fd, AF_NFC, socket.SOCK_STREAM)
>          try:
>              while True:
>  		miu =3D self.sock.getsockopt(SOL_NFC, NFC_LLCP_MIUX)
> -		print 'MIU=3D', miu
> +		print('MIU=3D', miu)

Mixed up indentation but I guess the issue was here before.

>  =

>                  while True:
>                      data =3D self.sock.recv(16)
>                      if data =3D=3D None:
> -		       print 'no data'
> +		       print('no data')
>  		       break
>  =


Best regards,
Krzysztof
--===============3445886607306232441==--

