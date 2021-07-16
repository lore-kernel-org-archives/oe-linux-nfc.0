Content-Type: multipart/mixed; boundary="===============7647057552976798176=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 0/7] Fixes for more memory issues
Date: Fri, 16 Jul 2021 12:08:37 +0200
Message-ID: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7647057552976798176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Few memory leaks (not finished - test-snep-read has still one which
I don't know how to fix yet), one memory corruption and minor
improvements:

This is on top of my previous patchsets (from latest):
1. -Wformat=3D2 and few memory leaks
   https://lore.kernel.org/linux-nfc/20210714110518.104655-1-krzysztof.kozl=
owski(a)canonical.com/T/#t

2. fixes and improvements for neard (continued)
   https://lore.kernel.org/linux-nfc/20210711202102.18094-1-krzysztof.kozlo=
wski(a)canonical.com/T/#t

3. neard CI under Github and rouund of fixes
   https://lore.kernel.org/linux-nfc/20210710033859.3989-1-krzysztof.kozlow=
ski(a)canonical.com/T/#t

The patchset is also available on:
https://github.com/krzk/neard
branch: dev-asan-ubsan-continued

Best regards,
Krzysztof


Krzysztof Kozlowski (7):
  snep: do not open-code freeing ndef message
  unit: fix memory leaks in test-ndef-build
  snep: remove useless NULL-ify of local pointer variable
  snep: fix double free of GSList
  unit: fix memory leaks in test-snep-read error paths
  unit: fix record memory leak in test-snep-read
  unit: fix records GList memory leak in test-snep-read

 src/snep.c             | 10 ++--------
 unit/test-ndef-build.c |  6 ++++++
 unit/test-snep-read.c  | 11 ++++++++---
 unit/test-utils.c      |  8 --------
 unit/test-utils.h      |  2 --
 5 files changed, 16 insertions(+), 21 deletions(-)

-- =

2.27.0

--===============7647057552976798176==--

