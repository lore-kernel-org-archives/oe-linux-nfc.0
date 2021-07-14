Content-Type: multipart/mixed; boundary="===============2846430163083288387=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 00/16] -Wformat=2 and few memory leaks
Date: Wed, 14 Jul 2021 13:05:02 +0200
Message-ID: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2846430163083288387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

This is a third series of my patches, built on top of
https://lore.kernel.org/linux-nfc/20210711202102.18094-1-krzysztof.kozlowsk=
i(a)canonical.com/T/#t

The ASAN detected several leaks in the unit tests which lead me to
investigate such leaks through neard.  The patchset fixes few easier
ones.

Best regards,
Krzysztof


Krzysztof Kozlowski (16):
  gdbus: annotate printf-like functions as accepting format
  nfctool: annotate printf-like functions as accepting format
  mifare: use unsigned int to suppress compiler -Wstrict-overflow
  build: enable -Wformat=3D2 warnings
  build: enable -Wunsafe-loop-optimizations and -Wstrict-overflow=3D2
    warnings
  TODO: remove finished tasks
  ci: build also on Ubuntu Hirsute in non-maintainer mode
  ci: simplify getting test logs
  build: fix missing usage of PIE check result
  build: add support for GCC sanitizers (asan, lsan and ubsan)
  ndef: make freeing near_ndef_message reusable
  snep-send: fix near_ndef_message memory leak
  unit: fix memory leaks in test-ndef-parse
  tag: do not open-code freeing ndef message
  unit: do not open-code freeing ndef message
  ci: add build with sanitizers (asan, lsan and ubsan)

 .github/workflows/ci.yml | 58 +++++++++++++++++++++++++++++++++-------
 HACKING                  |  5 +++-
 TODO                     | 12 ---------
 accflags.m4              | 12 +++++++--
 acinclude.m4             | 36 +++++++++++++++++++++++++
 ci/debian.sanitizers.sh  | 18 +++++++++++++
 ci/ubuntu.sanitizers.sh  |  1 +
 configure.ac             | 47 +++++++++++++++++++++++++++++++-
 gdbus/gdbus.h            | 15 +++++++----
 include/ndef.h           |  1 +
 plugins/mifare.c         |  6 ++---
 src/adapter.c            |  1 +
 src/ndef.c               | 56 +++++++++++++++++++-------------------
 src/tag.c                |  6 ++---
 tools/nfctool/sniffer.c  |  8 +++---
 tools/snep-send.c        |  2 ++
 unit/test-ndef-parse.c   | 39 ++++-----------------------
 unit/test-snep-read.c    |  3 +--
 18 files changed, 221 insertions(+), 105 deletions(-)
 create mode 100755 ci/debian.sanitizers.sh
 create mode 120000 ci/ubuntu.sanitizers.sh

-- =

2.27.0

--===============2846430163083288387==--

