Content-Type: multipart/mixed; boundary="===============2907453441019718813=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: [RFC v2 0/6] Python3 conversion + formatting
Date: Sun, 28 Nov 2021 22:06:00 -0700
Message-ID: <20211129050606.873494-1-mgreer@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2907453441019718813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Take 2 of porting deprecated Python2 code to Python3 plus some
reformatting to better conform with the PEP 8 style guide.  There
are still issue with any python scripts using gobject but this
should move things a small step forward.

Changes v1->v2:
 - replaced tabs with spaces as per PEP 8 style guide
 - removed extra parens in print calls
 - reformatted using "Prettier" (4 space indent as per
   PEP 8 style guide

Mark Greer (6):
  test: Use spaces for Python test scripts
  test: Convert test script from Python2 to Python3
  test: Reformat Python test scripts
  se: Use spaces only for SE Python test scripts
  se: Convert SE test script from Python2 to Python3
  se: Reformat SE Python test scripts

 se/test/test-channel     | 100 ++++++-----
 se/test/test-seel        | 215 ++++++++++++-----------
 test/bt-handover         | 251 +++++++++++++++------------
 test/handover-agent      | 286 +++++++++++++++++-------------
 test/monitor-near        |  80 +++++----
 test/ndef-agent          | 114 ++++++------
 test/neard-ui.py         | 364 +++++++++++++++++++++------------------
 test/neardutils.py       | 141 ++++++++-------
 test/phdc-simple-manager | 252 ++++++++++++++-------------
 test/test-adapter        | 194 +++++++++++----------
 test/test-device         | 240 ++++++++++++++------------
 test/test-tag            | 244 +++++++++++++-------------
 12 files changed, 1337 insertions(+), 1144 deletions(-)

-- =

2.33.1

--===============2907453441019718813==--

