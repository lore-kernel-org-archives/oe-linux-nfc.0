Content-Type: multipart/mixed; boundary="===============4029256847871208999=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 00/16] neard CI under Github and rouund of fixes
Date: Sat, 10 Jul 2021 05:38:43 +0200
Message-ID: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4029256847871208999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Mark proposed to do some work around neard (the user-space counterpart
of NFC drivers) [1], so here it is.

I made a fork on Github [2] and I add here Continuous Integration via
Github actions. These are pretty easy to set up. For starting only few
builds are done, but I have also more in the queue - just need to fix
32-bit and clang builds.

The neard fails to compile on GCC v10 (earlier maybe as well) in
maintainer moe (so with some warnings enabled) which is fixed here. It
is also first round of fixes around UTF-8 and UTF-16 parsing, although
this is not finished yet.

Further plans:
1. Decide whether official releases should be made from Github or
   kernel.org.
2. Fix for clang.
3. Fix UTF-8 and UTF-16 in ndef.
4. Add more unit tests around ndef and others (help would be here
   appreciated).
5. Add more GCC/clang warnings and fix them.
6. Add some static analysis checks in Github CI.

[1] https://lore.kernel.org/linux-nfc/20210512144319.30852-1-krzysztof.kozl=
owski(a)canonical.com/T/#m6a1cdae5f435b295cc7670c361b5bdc1daf30273
[2] https://github.com/krzk/neard

Best regards,
Krzysztof


Krzysztof Kozlowski (16):
  nfctool: fix adapter_compare_idx() cast-function-type
  nfctool: fix nfctool_send_dep_link_up() cast-function-type
  nfctool: fix nfctool_print_and_remove_snl() cast-function-type
  ci: temporarily disable Ubuntu Hirsute
  dbus: fix -Wformat in near_dbus_encode_string()
  bootstrap: parse CROSS_COMPILE and set proper configure option
  ci: add SPDX and copyright notes to ci.yml
  ci: enable back Ubuntu Hirsute
  ci: print executed commands when configuring debian
  ci: no need to print twice compiler version
  unit: pass real UTF-8 for testing text NDEF
  ndef: check UTF-16 text payload length
  ndef: silence clang -Wcast-align warning
  ndef: fix parsing of UTF-16 text payload
  nfctype5: fix returning uninitialized stack value in
    t5_tag_is_ti_pro()
  ci: add clang builds

 .github/workflows/ci.yml | 19 ++++++++++++++--
 bootstrap-configure      |  6 +++++
 ci/debian.sh             | 20 ++++++++++++++---
 plugins/nfctype5.c       |  2 +-
 src/dbus.c               |  2 +-
 src/ndef.c               | 24 +++++++++++++++-----
 tools/nfctool/adapter.c  |  6 +++--
 tools/nfctool/main.c     |  8 +++----
 unit/test-ndef-parse.c   | 47 ++++++++++++++++++++++++++++++++++------
 9 files changed, 108 insertions(+), 26 deletions(-)

-- =

2.27.0

--===============4029256847871208999==--

