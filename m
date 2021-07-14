Content-Type: multipart/mixed; boundary="===============5677241611873581723=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 16/16] ci: add build with sanitizers (asan, lsan and ubsan)
Date: Wed, 14 Jul 2021 13:05:18 +0200
Message-ID: <20210714110518.104655-17-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5677241611873581723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Check the results if sanitizers were correctly linked.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 44 ++++++++++++++++++++++++++++++++++++++--
 HACKING                  |  5 ++++-
 ci/debian.sanitizers.sh  | 18 ++++++++++++++++
 ci/ubuntu.sanitizers.sh  |  1 +
 4 files changed, 65 insertions(+), 3 deletions(-)
 create mode 100755 ci/debian.sanitizers.sh
 create mode 120000 ci/ubuntu.sanitizers.sh

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 14cc4306de23..7c2eb3cb13f4 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -66,6 +66,13 @@ jobs:
               CC: gcc
               MODE: maintainer
 =

+          - container: "debian:stable"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              VARIANT: sanitizers
+              MODE: maintainer
+
           - container: "debian:stable"
             env:
               ARCH: x86-64
@@ -78,6 +85,13 @@ jobs:
               CC: gcc
               MODE: maintainer
 =

+          - container: "debian:testing"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              VARIANT: sanitizers
+              MODE: maintainer
+
           - container: "debian:testing"
             env:
               ARCH: x86-64
@@ -153,6 +167,13 @@ jobs:
               CC: gcc
               MODE: maintainer
 =

+          - container: "ubuntu:hirsute"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              VARIANT: sanitizers
+              MODE: maintainer
+
           - container: "ubuntu:hirsute"
             env:
               ARCH: x86-64
@@ -165,6 +186,13 @@ jobs:
               CC: gcc
               MODE: maintainer
 =

+          - container: "ubuntu:focal"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              VARIANT: sanitizers
+              MODE: maintainer
+
           - container: "ubuntu:focal"
             env:
               ARCH: x86-64
@@ -235,9 +263,14 @@ jobs:
     - name: Configure
       run: |
         echo "Bootstraping in mode: $MODE"
+        CONFIGURE_ARGS=3D""
+        if [ "$VARIANT" =3D "sanitizers" ]; then
+          CONFIGURE_ARGS=3D"--enable-asan --enable-lsan --enable-ubsan --e=
nable-pie"
+        fi
         if [ "$MODE" =3D "maintainer" ]; then
           ./bootstrap-configure \
-            --disable-silent-rules
+            --disable-silent-rules \
+            $CONFIGURE_ARGS
         else
           ./bootstrap && \
             ./configure \
@@ -246,7 +279,8 @@ jobs:
             --prefix=3D/usr \
             --enable-ese \
             --sysconfdir=3D/etc \
-            --enable-tools
+            --enable-tools \
+            $CONFIGURE_ARGS
         fi
 =

     - name: Compile
@@ -277,6 +311,12 @@ jobs:
         esac
         echo "Checking for built matching architecture: $ARCH_CHECK"
         file src/neard | grep "$ARCH_CHECK"
+        if [ "$VARIANT" =3D "sanitizers" ]; then
+          echo "Checking for linking against sanitizer libraries"
+          ldd src/neard | grep libasan.so
+          # liblsan won't appear if asan is used
+          ldd src/neard | grep libubsan.so
+        fi
 =

     - name: Install
       run: make install
diff --git a/HACKING b/HACKING
index 7326242506a6..40bde2fb3c8b 100644
--- a/HACKING
+++ b/HACKING
@@ -51,8 +51,11 @@ like this:
     # git clone git://git.kernel.org/pub/scm/network/.../neard.git
     # cd neard
 =

-  Configure and build
+  Configure (choose only one)
     # ./bootstrap-configure
+    # ./bootstrap-configure --enable-asan --enable-lsan --enable-ubsan
+
+  Build
     # make
 =

   Check installation
diff --git a/ci/debian.sanitizers.sh b/ci/debian.sanitizers.sh
new file mode 100755
index 000000000000..40dc1f44b55a
--- /dev/null
+++ b/ci/debian.sanitizers.sh
@@ -0,0 +1,18 @@
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
+apt install -y --no-install-recommends \
+	liblsan0 \
+	libubsan1
+
+apt install -y --no-install-recommends libasan6 || \
+	apt install -y --no-install-recommends libasan5
+
+echo "Install finished: $0"
diff --git a/ci/ubuntu.sanitizers.sh b/ci/ubuntu.sanitizers.sh
new file mode 120000
index 000000000000..53cd9418ed35
--- /dev/null
+++ b/ci/ubuntu.sanitizers.sh
@@ -0,0 +1 @@
+debian.sanitizers.sh
\ No newline at end of file
-- =

2.27.0

--===============5677241611873581723==--

