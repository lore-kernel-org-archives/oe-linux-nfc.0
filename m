Content-Type: multipart/mixed; boundary="===============5380483184684181764=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 11/11] ci: use matrix instead of duplicating each build configuration
Date: Wed, 04 Aug 2021 10:42:18 +0200
Message-ID: <20210804084218.14677-12-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5380483184684181764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use matrix to list all typical configurations which allows easily to
build different distros with clang and maintainer mode.  This extends
the number of jobs considerably but makes the entire CI YAML file
smaller and easier to understand.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 295 ++++++++++++++-------------------------
 ci/alpine.sh             |   9 +-
 2 files changed, 114 insertions(+), 190 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index d4ddcdd3f8f4..6a4eeedf3d66 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -19,229 +19,141 @@ jobs:
     strategy:
       fail-fast: false
       matrix:
+        arch: [x86-64]
+        compiler: [gcc, clang]
+        container:
+          - alpine:latest
+          - debian:testing
+          - debian:stable
+          - fedora:latest
+          - ubuntu:hirsute
+          - ubuntu:focal
+          - ubuntu:bionic
+          - ubuntu:xenial
+        cross_compile: [""]
+        mode: [maintainer, no-maintainer]
+        variant: [""]
         include:
-          # Debian builds
-          # 32bit build
+          # Debian 32-bit builds
           - container: "debian:stable"
-            env:
-              ARCH: i386
-              CC: gcc -m32
-              CROSS_COMPILE: i686-linux-gnu
-              VARIANT: i386
-              MODE: maintainer
-
-          # Debian cross compilation builds
-          - container: "debian:stable"
-            env:
-              ARCH: armel
-              CC: arm-linux-gnueabi-gcc
-              CROSS_COMPILE: arm-linux-gnueabi
-              VARIANT: cross-compile
-              MODE: maintainer
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
 =

           - container: "debian:stable"
-            env:
-              ARCH: arm64
-              CC: aarch64-linux-gnu-gcc
-              CROSS_COMPILE: aarch64-linux-gnu
-              VARIANT: cross-compile
-              MODE: maintainer
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
 =

+          # Debian cross compilation builds
           - container: "debian:stable"
-            env:
-              ARCH: ppc64el
-              CC: powerpc64le-linux-gnu-gcc
-              CROSS_COMPILE: powerpc64le-linux-gnu
-              VARIANT: cross-compile
-              MODE: maintainer
+            arch: armel
+            compiler: arm-linux-gnueabi-gcc
+            cross_compile: arm-linux-gnueabi
+            mode: maintainer
+            variant: cross-compile
 =

           - container: "debian:stable"
-            env:
-              ARCH: s390x
-              CC: s390x-linux-gnu-gcc
-              CROSS_COMPILE: s390x-linux-gnu
-              VARIANT: cross-compile
-              MODE: maintainer
+            arch: arm64
+            compiler: aarch64-linux-gnu-gcc
+            cross_compile: aarch64-linux-gnu
+            mode: maintainer
+            variant: cross-compile
 =

-          # Debian gcc
           - container: "debian:stable"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
+            arch: ppc64el
+            compiler: powerpc64le-linux-gnu-gcc
+            cross_compile: powerpc64le-linux-gnu
+            mode: maintainer
+            variant: cross-compile
 =

           - container: "debian:stable"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              VARIANT: sanitizers
-              MODE: maintainer
+            arch: s390x
+            compiler: s390x-linux-gnu-gcc
+            cross_compile: s390x-linux-gnu
+            mode: maintainer
+            variant: cross-compile
 =

+          # Debian GCC sanitizer builds
           - container: "debian:stable"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: no-maintainer
+            arch: x86-64
+            compiler: gcc
+            mode: maintainer
+            variant: sanitizers
 =

           - container: "debian:testing"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
-
-          - container: "debian:testing"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              VARIANT: sanitizers
-              MODE: maintainer
-
-          - container: "debian:testing"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: no-maintainer
-
-          # Debian clang
-          - container: "debian:stable"
-            env:
-              ARCH: x86-64
-              CC: clang
-              MODE: maintainer
-
-          - container: "debian:stable"
-            env:
-              ARCH: x86-64
-              CC: clang
-              MODE: no-maintainer
-
-          - container: "debian:testing"
-            env:
-              ARCH: x86-64
-              CC: clang
-              MODE: maintainer
-
-          # musl (native)
-          - container: "alpine:latest"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
-
-          # Fedora
-          - container: "fedora:latest"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
-
-          - container: "fedora:latest"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: no-maintainer
-
-          - container: "fedora:latest"
-            env:
-              ARCH: x86-64
-              CC: clang
-              MODE: maintainer
-
-          # Ubuntu 32bit builds: gcc and clang
-          - container: "ubuntu:hirsute"
-            env:
-              ARCH: i386
-              CC: gcc -m32
-              CROSS_COMPILE: i686-linux-gnu
-              VARIANT: i386
-              MODE: maintainer
-
-          - container: "ubuntu:focal"
-            env:
-              ARCH: i386
-              CC: gcc -m32
-              CROSS_COMPILE: i686-linux-gnu
-              VARIANT: i386
-              MODE: maintainer
-
-          # Ubuntu x86-64 gcc
-          - container: "ubuntu:hirsute"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
+            arch: x86-64
+            compiler: gcc
+            mode: maintainer
+            variant: sanitizers
 =

+          # Ubuntu 32-bit builds
           - container: "ubuntu:hirsute"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              VARIANT: sanitizers
-              MODE: maintainer
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
 =

           - container: "ubuntu:hirsute"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: no-maintainer
-
-          - container: "ubuntu:focal"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
 =

           - container: "ubuntu:focal"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              VARIANT: sanitizers
-              MODE: maintainer
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
 =

           - container: "ubuntu:focal"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: no-maintainer
-
-          - container: "ubuntu:bionic"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
 =

-          - container: "ubuntu:xenial"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
-
-          # Ubuntu x86-64 clang
+          # Ubuntu GCC sanitizer builds
           - container: "ubuntu:hirsute"
-            env:
-              ARCH: x86-64
-              CC: clang
-              MODE: maintainer
-
-          - container: "ubuntu:focal"
-            env:
-              ARCH: x86-64
-              CC: clang
-              MODE: maintainer
+            arch: x86-64
+            compiler: gcc
+            mode: maintainer
+            variant: sanitizers
 =

           - container: "ubuntu:focal"
-            env:
-              ARCH: x86-64
-              CC: clang
-              MODE: no-maintainer
+            arch: x86-64
+            compiler: gcc
+            mode: maintainer
+            variant: sanitizers
 =

     container:
       image: ${{ matrix.container }}
-      env: ${{ matrix.env }}
+      env:
+        ARCH: ${{ matrix.arch }}
+        CC: ${{ matrix.compiler }}
+        CROSS_COMPILE: ${{ matrix.cross_compile }}
+        MODE: ${{ matrix.mode }}
+        VARIANT: ${{ matrix.variant }}
 =

     steps:
     - name: Show OS
       run: cat /etc/os-release
 =

+    - name: Show env (matrix settings)
+      run: |
+        echo "ARCH: $ARCH"
+        echo "CC: $CC"
+        echo "CROSS_COMPILE: $CROSS_COMPILE"
+        echo "MODE: $MODE"
+        echo "VARIANT: $VARIANT"
+
     - name: Git checkout
       uses: actions/checkout(a)v2
 =

@@ -272,11 +184,16 @@ jobs:
         if [ "$VARIANT" =3D "sanitizers" ]; then
           CONFIGURE_ARGS=3D"--enable-asan --enable-lsan --enable-ubsan --e=
nable-pie"
         fi
+        CONFIGURE_CROSS=3D""
+        if [ "$CROSS_COMPILE" ]; then
+          CONFIGURE_CROSS=3D"--host=3D${CROSS_COMPILE}"
+        fi
         if [ "$MODE" =3D "maintainer" ]; then
           ./bootstrap-configure \
             --disable-silent-rules \
             $CONFIGURE_ARGS
         else
+          CONFIGURE_ARGS=3D"$CONFIGURE_ARGS $CONFIGURE_CROSS"
           ./bootstrap && \
             ./configure \
             --disable-systemd \
@@ -300,7 +217,7 @@ jobs:
       id: unit_tests
       run: |
         make check
-      if: ${{ (matrix.env['ARCH'] =3D=3D 'x86-64') || (matrix.env['ARCH'] =
=3D=3D 'i386') }}
+      if: ${{ (matrix.arch =3D=3D 'x86-64') || (matrix.arch =3D=3D 'i386')=
 }}
 =

     - name: Get unit tests logs
       run: cat test-suite.log
@@ -335,4 +252,4 @@ jobs:
       run: make distcheck
       # distcheck runs unit tests so no point for cross compile
       # TODO: figure out how to re-configure during distcheck with --host =
for i386 (DISTCHECK_CONFIGURE_FLAGS)
-      if: ${{ (matrix.env['ARCH'] =3D=3D 'x86-64')}}
+      if: ${{ (matrix.arch =3D=3D 'x86-64')}}
diff --git a/ci/alpine.sh b/ci/alpine.sh
index 81b5c72a392e..56449dd7c969 100755
--- a/ci/alpine.sh
+++ b/ci/alpine.sh
@@ -12,13 +12,20 @@ set -ex
 apk update
 =

 PKGS_CC=3D"gcc"
+case $CC in
+	clang*)
+		# On Alpine v3.14 clang fails without gcc:
+		# cannot find crtbeginS.o: No such file or directory
+		PKGS_CC=3D"clang gcc"
+	;;
+esac
 =

 # gzip: for distcheck
 apk add \
 	autoconf \
 	autoconf-archive \
 	automake \
-	gcc \
+	binutils \
 	gzip \
 	dbus-dev \
 	glib-dev \
-- =

2.30.2

--===============5380483184684181764==--

