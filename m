Content-Type: multipart/mixed; boundary="===============4647634629114356034=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 00/34] fixes and improvements for neard (continued)
Date: Sun, 11 Jul 2021 22:20:28 +0200
Message-ID: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4647634629114356034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I continued with the fixes and CI for neard, on top of my previous
patchset:
https://lore.kernel.org/linux-nfc/20210710033859.3989-1-krzysztof.kozlowski=
(a)canonical.com/T/#t

Except compiler fixes, extend also Continuous Integration with
additional build configurations (i686, cross compile).  Explicitly run
also unit tests although they do not cover much of the code.

The patchset is available on Github:
https://github.com/krzk/neard
branches dev-more-ci and dev-c-warnings

Best regards,
Krzysztof

Krzysztof Kozlowski (34):
  Drop empty NEWS
  ci: add building without maintainer options
  ci: be verbose when building
  ci: add more build configurations (Fedora, Alpine, Debian,
    cross-compile, i386)
  ci: run unit tests
  adapter: adjust indentation of continued arguments
  ci: display printenv
  HACKING: refine required packages
  nciattach: fix poll.h include location
  unit: use proper pointer to uint8_t in test_snep_read_recv_fragments()
  build: fix setting CFLAGS on dash shell (Alpine Linux)
  build: add more compiler warnings
  gdbus: do not shadow global 'pending' variable (-Wshadow)
  nciattach: do not shadow other local 'opt' variable (-Wshadow)
  unit: do not shadow global 'uri' variable (-Wshadow)
  nfctool: use proper format for integers (-Wformat)
  bluetooth: use proper format for integers (-Wformat)
  ndef: use proper format for integers (-Wformat)
  nfctype2: use proper format for integers (-Wformat)
  nfctype3: use proper format for integers (-Wformat)
  nfctype5: use proper format for integers (-Wformat)
  mifare: use proper format for integers (-Wformat)
  p2p: use proper format for integers (-Wformat)
  npp: use proper format for integers (-Wformat)
  adapter: use proper format for integers (-Wformat)
  device: use proper format for integers (-Wformat)
  manager: use proper format for integers (-Wformat)
  tag: use proper format for integers (-Wformat)
  netlink: use proper format for integers (-Wformat)
  se: use proper format for integers (-Wformat)
  ndef: use proper format for integers (-Wformat)
  unit: use proper format for integers (-Wformat)
  build: enable -Wshadow and -Wformat-signedness compiler warnings
  AUTHORS: Mention Krzysztof Kozlowski's contributions

 .github/workflows/ci.yml    | 210 +++++++++++++++++++++++++++++++++++-
 AUTHORS                     |   1 +
 HACKING                     |  24 +++--
 NEWS                        |   0
 accflags.m4                 |  44 ++++++++
 acinclude.m4                |  16 ---
 ci/alpine.sh                |  35 ++++++
 ci/debian.cross-compile.sh  |  40 +++++++
 ci/debian.i386.sh           |  31 ++++++
 ci/debian.sh                |  14 ++-
 ci/fedora.sh                |  33 ++++++
 ci/ubuntu.cross-compile.sh  |   1 +
 ci/ubuntu.i386.sh           |   1 +
 configure.ac                |   5 +-
 gdbus/object.c              |  22 ++--
 plugins/mifare.c            |   8 +-
 plugins/nfctype2.c          |  12 +--
 plugins/nfctype3.c          |   2 +-
 plugins/nfctype5.c          |   6 +-
 plugins/npp.c               |   2 +-
 plugins/p2p.c               |   4 +-
 se/ace.c                    |  34 +++---
 se/apdu.c                   |   8 +-
 se/plugins/nfc.c            |   8 +-
 se/plugins/tizen.c          |   2 +-
 se/se.c                     |   6 +-
 src/adapter.c               |  40 +++----
 src/bluetooth.c             |   4 +-
 src/device.c                |   6 +-
 src/manager.c               |   4 +-
 src/ndef.c                  |  12 +--
 src/netlink.c               |  16 +--
 src/tag.c                   |   8 +-
 tools/nciattach.c           |  10 +-
 tools/nfctool/adapter.c     |   4 +-
 tools/nfctool/llcp-decode.c |   4 +-
 tools/nfctool/main.c        |  20 ++--
 tools/nfctool/sniffer.c     |   2 +-
 unit/test-ndef-parse.c      |  12 +--
 unit/test-snep-read.c       |   8 +-
 40 files changed, 550 insertions(+), 169 deletions(-)
 delete mode 100644 NEWS
 create mode 100644 accflags.m4
 create mode 100755 ci/alpine.sh
 create mode 100755 ci/debian.cross-compile.sh
 create mode 100755 ci/debian.i386.sh
 create mode 100755 ci/fedora.sh
 create mode 120000 ci/ubuntu.cross-compile.sh
 create mode 120000 ci/ubuntu.i386.sh

-- =

2.27.0

--===============4647634629114356034==--

