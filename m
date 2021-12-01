Content-Type: multipart/mixed; boundary="===============7479115101077112975=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] [neard][RFC] test: Convert Python2 scripts to Python3
Date: Wed, 01 Dec 2021 09:53:20 +0100
Message-ID: <cd4169f5-2a97-61d8-240d-30ee16bcdd06@canonical.com>
In-Reply-To: <20211129041536.GA830560@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7479115101077112975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 29/11/2021 05:15, Mark Greer wrote:
> On Mon, Aug 09, 2021 at 12:35:07PM +0200, Krzysztof Kozlowski wrote:
>> On 08/08/2021 04:20, Mark Greer wrote:
>>> Python2 is deprecated so convert the neard test scripts, which are
>>> Python2, to Python3.
>>>
>>> Signed-off-by: Mark Greer <mgreer@animalcreek.com>
>>> ---
>>> This is a first pass at converting the python scripts to Python3.
>>> Not a lot of testing yet.  It appears that the 'gobject' is not
>>> available anymore so I have to look into how to rework the code that
>>> uses it.
>>>
>>> I would appreciate any testing that you are willing to provide.
>>>
>>> Also available at:
>>> 	https://github.com/linux-nfc/neard/tree/mag/python3-ize
>>>
>>>  se/test/test-channel     | 18 +++++------
>>>  se/test/test-seel        | 38 +++++++++++-----------
>>>  test/bt-handover         |  8 ++---
>>>  test/handover-agent      | 34 +++++++++----------
>>>  test/monitor-near        |  8 ++---
>>>  test/ndef-agent          | 20 ++++++------
>>>  test/neard-ui.py         | 70 ++++++++++++++++++++--------------------
>>>  test/neardutils.py       | 14 ++++----
>>>  test/phdc-simple-manager | 50 ++++++++++++++--------------
>>>  test/test-adapter        | 16 ++++-----
>>>  test/test-device         | 34 +++++++++----------
>>>  test/test-tag            | 10 +++---
>>>  12 files changed, 160 insertions(+), 160 deletions(-)
>>>
>>
>> Few tests:
>> ------------
>> $ sudo python3 ./test/test-adapter poll nfc0 on
>> Traceback (most recent call last):
>>   File "./test/test-adapter", line 92, in <module>
>>     adapter.StartPollLoop(mode)
>>   File "/usr/lib/python3/dist-packages/dbus/proxies.py", line 72, in
>> __call__
>>     return self._proxy_method(*args, **keywords)
>>   File "/usr/lib/python3/dist-packages/dbus/proxies.py", line 141, in
>> __call__
>>     return self._connection.call_blocking(self._named_service,
>>   File "/usr/lib/python3/dist-packages/dbus/connection.py", line 652, in
>> call_blocking
>>     reply_message =3D self.send_message_with_reply_and_block(
>> dbus.exceptions.DBusException: org.neard.Error.Failed: No such device
>>
>> During handling of the above exception, another exception occurred:
>>
>> Traceback (most recent call last):
>>   File "./test/test-adapter", line 94, in <module>
>>     print("%s: %s" % (error._dbus_error_name, error.message))
>> AttributeError: 'DBusException' object has no attribute 'message'
>> ------------
> =

> This looks like you may not have installed the necessary dbus support
> (e.g., src/org.neard.conf).  After building neard, you can install this
> with:
> =

> $ sudo make install
> =

> If that isn't it, I'll need more info about your environment because I
> don't get those errors.  To make sure we're on the same page, these steps
> should get you going (this example on an amd64 running Ubuntu 20.04):

Indeed lack of dbus support could be the original exception but the
final exception is "AttributeError: 'DBusException' object has no
attribute 'message'" which looks unrelated to actual DBUS installation.
The error is that new Python dbus does not have message field. It has
__str__ representation or get_dbus_message() method.

Best regards,
Krzysztof
--===============7479115101077112975==--

