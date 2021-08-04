Content-Type: multipart/mixed; boundary="===============8598961177616840365=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 08/11] ci: add build with sanitizers (asan, lsan and ubsan)
Date: Wed, 04 Aug 2021 10:42:15 +0200
Message-ID: <20210804084218.14677-9-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8598961177616840365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Check the results if sanitizers were correctly linked.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 44 ++++++++++++++++++++++++++++++++++++++--
 ci/debian.sanitizers.sh  | 18 ++++++++++++++++
 ci/ubuntu.sanitizers.sh  |  1 +
 3 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100755 ci/debian.sanitizers.sh
 create mode 120000 ci/ubuntu.sanitizers.sh

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index e8f507a128e0..b6f29cf9ddfb 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -70,6 +70,13 @@ jobs:
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
@@ -82,6 +89,13 @@ jobs:
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
@@ -157,6 +171,13 @@ jobs:
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
@@ -169,6 +190,13 @@ jobs:
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
@@ -239,9 +267,14 @@ jobs:
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
@@ -250,7 +283,8 @@ jobs:
             --prefix=3D/usr \
             --enable-ese \
             --sysconfdir=3D/etc \
-            --enable-tools
+            --enable-tools \
+            $CONFIGURE_ARGS
         fi
 =

     - name: Compile
@@ -281,6 +315,12 @@ jobs:
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

2.30.2

--===============8598961177616840365==--

