Content-Type: multipart/mixed; boundary="===============6608750730726660818=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 06/11] ci: add more build configurations (Fedora, Alpine, Debian, cross-compile, i386)
Date: Wed, 04 Aug 2021 10:42:13 +0200
Message-ID: <20210804084218.14677-7-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6608750730726660818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The installation scripts were based on LTP project.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml   | 160 ++++++++++++++++++++++++++++++++++++-
 ci/alpine.sh               |  35 ++++++++
 ci/debian.cross-compile.sh |  41 ++++++++++
 ci/debian.i386.sh          |  32 ++++++++
 ci/debian.sh               |  13 +--
 ci/fedora.sh               |  33 ++++++++
 ci/ubuntu.cross-compile.sh |   1 +
 ci/ubuntu.i386.sh          |   1 +
 8 files changed, 309 insertions(+), 7 deletions(-)
 create mode 100755 ci/alpine.sh
 create mode 100755 ci/debian.cross-compile.sh
 create mode 100755 ci/debian.i386.sh
 create mode 100755 ci/fedora.sh
 create mode 120000 ci/ubuntu.cross-compile.sh
 create mode 120000 ci/ubuntu.i386.sh

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 389c47dcd781..c8e3fb8fb10b 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -20,9 +20,140 @@ jobs:
       fail-fast: false
       matrix:
         include:
-          # Ubuntu gcc
+          # Debian builds
+          # 32bit build
+          - container: "debian:stable"
+            env:
+              ARCH: i386
+              CC: gcc -m32
+              CROSS_COMPILE: i686-linux-gnu
+              VARIANT: i386
+              MODE: maintainer
+
+          # Debian cross compilation builds
+          - container: "debian:stable"
+            env:
+              ARCH: armel
+              CC: arm-linux-gnueabi-gcc
+              CROSS_COMPILE: arm-linux-gnueabi
+              VARIANT: cross-compile
+              MODE: maintainer
+
+          - container: "debian:stable"
+            env:
+              ARCH: arm64
+              CC: aarch64-linux-gnu-gcc
+              CROSS_COMPILE: aarch64-linux-gnu
+              VARIANT: cross-compile
+              MODE: maintainer
+
+          - container: "debian:stable"
+            env:
+              ARCH: ppc64el
+              CC: powerpc64le-linux-gnu-gcc
+              CROSS_COMPILE: powerpc64le-linux-gnu
+              VARIANT: cross-compile
+              MODE: maintainer
+
+          - container: "debian:stable"
+            env:
+              ARCH: s390x
+              CC: s390x-linux-gnu-gcc
+              CROSS_COMPILE: s390x-linux-gnu
+              VARIANT: cross-compile
+              MODE: maintainer
+
+          # Debian gcc
+          - container: "debian:stable"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: maintainer
+
+          - container: "debian:stable"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: no-maintainer
+
+          - container: "debian:testing"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: maintainer
+
+          - container: "debian:testing"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: no-maintainer
+
+          # Debian clang
+          - container: "debian:stable"
+            env:
+              ARCH: x86-64
+              CC: clang
+              MODE: maintainer
+
+          - container: "debian:stable"
+            env:
+              ARCH: x86-64
+              CC: clang
+              MODE: no-maintainer
+
+          - container: "debian:testing"
+            env:
+              ARCH: x86-64
+              CC: clang
+              MODE: maintainer
+
+          # musl (native)
+          - container: "alpine:latest"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: maintainer
+
+          # Fedora
+          - container: "fedora:latest"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: maintainer
+
+          - container: "fedora:latest"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: no-maintainer
+
+          - container: "fedora:latest"
+            env:
+              ARCH: x86-64
+              CC: clang
+              MODE: maintainer
+
+          # Ubuntu 32bit builds: gcc and clang
+          - container: "ubuntu:hirsute"
+            env:
+              ARCH: i386
+              CC: gcc -m32
+              CROSS_COMPILE: i686-linux-gnu
+              VARIANT: i386
+              MODE: maintainer
+
+          - container: "ubuntu:focal"
+            env:
+              ARCH: i386
+              CC: gcc -m32
+              CROSS_COMPILE: i686-linux-gnu
+              VARIANT: i386
+              MODE: maintainer
+
+          # Ubuntu x86-64 gcc
           - container: "ubuntu:hirsute"
             env:
+              ARCH: x86-64
               CC: gcc
               MODE: maintainer
 =

@@ -34,37 +165,44 @@ jobs:
 =

           - container: "ubuntu:focal"
             env:
+              ARCH: x86-64
               CC: gcc
               MODE: maintainer
 =

           - container: "ubuntu:focal"
             env:
+              ARCH: x86-64
               CC: gcc
               MODE: no-maintainer
 =

           - container: "ubuntu:bionic"
             env:
+              ARCH: x86-64
               CC: gcc
               MODE: maintainer
 =

           - container: "ubuntu:xenial"
             env:
+              ARCH: x86-64
               CC: gcc
               MODE: maintainer
 =

-          # Ubuntu clang
+          # Ubuntu x86-64 clang
           - container: "ubuntu:hirsute"
             env:
+              ARCH: x86-64
               CC: clang
               MODE: maintainer
 =

           - container: "ubuntu:focal"
             env:
+              ARCH: x86-64
               CC: clang
               MODE: maintainer
 =

           - container: "ubuntu:focal"
             env:
+              ARCH: x86-64
               CC: clang
               MODE: no-maintainer
 =

@@ -118,8 +256,26 @@ jobs:
     - name: Compile
       run: make -j$(nproc)
 =

+    - name: Check final binary
+      run: |
+        file src/neard
+        ARCH_CHECK=3D"$ARCH"
+        case "$ARCH" in
+          armel) ARCH_CHECK=3D"ARM, EABI";;
+          arm64) ARCH_CHECK=3D"aarch64";;
+          i386) ARCH_CHECK=3D"Intel 80386";;
+          ppc64el) ARCH_CHECK=3D"64-bit PowerPC";;
+          s390x) ARCH_CHECK=3D"IBM S/390";;
+          *) ARCH_CHECK=3D"x86-64";;
+        esac
+        echo "Checking for built matching architecture: $ARCH_CHECK"
+        file src/neard | grep "$ARCH_CHECK"
+
     - name: Install
       run: make install
 =

     - name: Distribution check
       run: make distcheck
+      # distcheck runs unit tests so no point for cross compile
+      # TODO: figure out how to re-configure during distcheck with --host =
for i386 (DISTCHECK_CONFIGURE_FLAGS)
+      if: ${{ (matrix.env['ARCH'] =3D=3D 'x86-64')}}
diff --git a/ci/alpine.sh b/ci/alpine.sh
new file mode 100755
index 000000000000..81b5c72a392e
--- /dev/null
+++ b/ci/alpine.sh
@@ -0,0 +1,35 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2019-2021 Petr Vorel <petr.vorel@gmail.com>
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+#
+
+set -ex
+
+apk update
+
+PKGS_CC=3D"gcc"
+
+# gzip: for distcheck
+apk add \
+	autoconf \
+	autoconf-archive \
+	automake \
+	gcc \
+	gzip \
+	dbus-dev \
+	glib-dev \
+	libnl3-dev \
+	libtool \
+	make \
+	musl-dev \
+	$PKGS_CC
+
+# Packages needed by CI
+apk add \
+	file
+
+echo "Install finished: $0"
diff --git a/ci/debian.cross-compile.sh b/ci/debian.cross-compile.sh
new file mode 100755
index 000000000000..8d4c5bb38cfd
--- /dev/null
+++ b/ci/debian.cross-compile.sh
@@ -0,0 +1,41 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+#
+
+set -ex
+
+if [ -z "$ARCH" ]; then
+	echo "missing \$ARCH!" >&2
+	exit 1
+fi
+
+case "$ARCH" in
+	armel) PKGS_CC=3D"gcc-arm-linux-gnueabi libc6-dev-${ARCH}-cross";;
+	arm64) PKGS_CC=3D"gcc-aarch64-linux-gnu libc6-dev-${ARCH}-cross";;
+	ppc64el) PKGS_CC=3D"gcc-powerpc64le-linux-gnu libc6-dev-${ARCH}-cross";;
+	# TODO: libraries for riscv?
+	#riscv64) PKGS_CC=3D"gcc-riscv64-linux-gnu libc6-dev-${ARCH}-cross";;
+	s390x) PKGS_CC=3D"gcc-${ARCH}-linux-gnu libc6-dev-${ARCH}-cross";;
+	*) echo "unsupported arch: '$ARCH'!" >&2; exit 1;;
+esac
+
+dpkg --add-architecture $ARCH
+apt update
+
+apt install -y --no-install-recommends \
+	autoconf:${ARCH} \
+	autoconf-archive \
+	automake:${ARCH} \
+	libdbus-1-dev:${ARCH} \
+	libglib2.0-dev:${ARCH} \
+	libnl-3-dev:${ARCH} \
+	libnl-genl-3-dev:${ARCH} \
+	libtool:${ARCH} \
+	$PKGS_CC
+
+echo "Install finished: $0"
diff --git a/ci/debian.i386.sh b/ci/debian.i386.sh
new file mode 100755
index 000000000000..8d154412e3b7
--- /dev/null
+++ b/ci/debian.i386.sh
@@ -0,0 +1,32 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+#
+
+set -ex
+
+dpkg --add-architecture i386
+apt update
+
+# gcc-multilib are also needed for clang 32-bit builds
+PKGS_CC=3D"gcc-multilib"
+
+apt install -y --no-install-recommends \
+	linux-libc-dev:i386
+
+apt install -y --no-install-recommends \
+	autoconf:i386 \
+	autoconf-archive \
+	automake:i386 \
+	libdbus-1-dev:i386 \
+	libglib2.0-dev:i386 \
+	libnl-3-dev:i386 \
+	libnl-genl-3-dev:i386 \
+	libtool:i386 \
+	$PKGS_CC
+
+echo "Install finished: $0"
diff --git a/ci/debian.sh b/ci/debian.sh
index 8cc4d307cccf..962e554304ee 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -6,7 +6,7 @@
 #                             <krzk@kernel.org>
 #
 =

-set -eEx
+set -ex
 =

 apt update
 =

@@ -20,10 +20,11 @@ tzdata tzdata/Zones/Europe select Berlin
 debconf-set-selections /tmp/tzdata-preseed.txt
 =

 PKGS_CC=3D"build-essential"
-if [ "$CC" =3D "clang" ]; then
-	PKGS_CC=3D"clang"
-fi
-
+case $CC in
+	clang*)
+		PKGS_CC=3D"clang"
+	;;
+esac
 =

 apt install -y --no-install-recommends \
 	autoconf \
@@ -36,3 +37,5 @@ apt install -y --no-install-recommends \
 	libtool \
 	make \
 	$PKGS_CC
+
+echo "Install finished: $0"
diff --git a/ci/fedora.sh b/ci/fedora.sh
new file mode 100755
index 000000000000..c5a67d237e91
--- /dev/null
+++ b/ci/fedora.sh
@@ -0,0 +1,33 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+#
+
+set -ex
+
+PKGS_CC=3D"gcc"
+case $CC in
+	clang*)
+		PKGS_CC=3D"clang"
+	;;
+esac
+
+yum -y install \
+	autoconf \
+	autoconf-archive \
+	automake \
+	dbus-devel \
+	glib2-devel \
+	libnl3-devel \
+	libtool \
+	make \
+	$PKGS_CC
+
+# Packages needed by CI
+yum -y install \
+	file
+
+echo "Install finished: $0"
diff --git a/ci/ubuntu.cross-compile.sh b/ci/ubuntu.cross-compile.sh
new file mode 120000
index 000000000000..18f77ad009bb
--- /dev/null
+++ b/ci/ubuntu.cross-compile.sh
@@ -0,0 +1 @@
+debian.cross-compile.sh
\ No newline at end of file
diff --git a/ci/ubuntu.i386.sh b/ci/ubuntu.i386.sh
new file mode 120000
index 000000000000..813bdf90e6ec
--- /dev/null
+++ b/ci/ubuntu.i386.sh
@@ -0,0 +1 @@
+debian.i386.sh
\ No newline at end of file
-- =

2.30.2

--===============6608750730726660818==--

