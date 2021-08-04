Content-Type: multipart/mixed; boundary="===============0729743417489670316=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 00/11] CI under Github
Date: Wed, 04 Aug 2021 10:42:07 +0200
Message-ID: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0729743417489670316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Add a Continuous Integration builds under Github (with its Actions) to
build and unit test on several configurations.

Changes since v1 [1]:
1. Rebase on latest master.
2. Remove CI-unrelated patches from this set.
3. Add CodeQL analysis.
4. Add builds and tests with GCC sanitizers.
5. Use matrix to extend the build configuration.

[1] https://lore.kernel.org/linux-nfc/20210710033859.3989-1-krzysztof.kozlo=
wski(a)canonical.com/


Best regards,
Krzysztof


Krzysztof Kozlowski (11):
  ci: add GitHub actions for building
  bootstrap: parse CROSS_COMPILE and set proper configure option
  ci: add clang builds
  ci: add building without maintainer options
  ci: be verbose when building
  ci: add more build configurations (Fedora, Alpine, Debian,
    cross-compile, i386)
  ci: run unit tests
  ci: add build with sanitizers (asan, lsan and ubsan)
  ci: add CodeQL static analysis
  ci: print configure logs on failures
  ci: use matrix instead of duplicating each build configuration

 .github/workflows/ci.yml              | 255 ++++++++++++++++++++++++++
 .github/workflows/codeql-analysis.yml |  45 +++++
 bootstrap-configure                   |   6 +
 ci/alpine.sh                          |  42 +++++
 ci/debian.cross-compile.sh            |  41 +++++
 ci/debian.i386.sh                     |  32 ++++
 ci/debian.sanitizers.sh               |  18 ++
 ci/debian.sh                          |  41 +++++
 ci/fedora.sh                          |  33 ++++
 ci/ubuntu.cross-compile.sh            |   1 +
 ci/ubuntu.i386.sh                     |   1 +
 ci/ubuntu.sanitizers.sh               |   1 +
 ci/ubuntu.sh                          |   1 +
 13 files changed, 517 insertions(+)
 create mode 100644 .github/workflows/ci.yml
 create mode 100644 .github/workflows/codeql-analysis.yml
 create mode 100755 ci/alpine.sh
 create mode 100755 ci/debian.cross-compile.sh
 create mode 100755 ci/debian.i386.sh
 create mode 100755 ci/debian.sanitizers.sh
 create mode 100755 ci/debian.sh
 create mode 100755 ci/fedora.sh
 create mode 120000 ci/ubuntu.cross-compile.sh
 create mode 120000 ci/ubuntu.i386.sh
 create mode 120000 ci/ubuntu.sanitizers.sh
 create mode 120000 ci/ubuntu.sh

-- =

2.30.2

--===============0729743417489670316==--

