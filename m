Content-Type: multipart/mixed; boundary="===============4245832207217719734=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 01/11] ci: add GitHub actions for building
Date: Wed, 04 Aug 2021 10:42:08 +0200
Message-ID: <20210804084218.14677-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4245832207217719734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 79 ++++++++++++++++++++++++++++++++++++++++
 ci/debian.sh             | 32 ++++++++++++++++
 ci/ubuntu.sh             |  1 +
 3 files changed, 112 insertions(+)
 create mode 100644 .github/workflows/ci.yml
 create mode 100755 ci/debian.sh
 create mode 120000 ci/ubuntu.sh

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
new file mode 100644
index 000000000000..e48ee0eb6815
--- /dev/null
+++ b/.github/workflows/ci.yml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+# Loosely based on https://github.com/linux-test-project/ltp
+#
+name: "Builds"
+on: [push, pull_request]
+
+jobs:
+  job:
+    name: Build
+    runs-on: ubuntu-latest
+    permissions:
+      actions: read
+      contents: read
+
+    strategy:
+      fail-fast: false
+      matrix:
+        include:
+          - container: "ubuntu:hirsute"
+            env:
+              CC: gcc
+
+          - container: "ubuntu:focal"
+            env:
+              CC: gcc
+
+          - container: "ubuntu:bionic"
+            env:
+              CC: gcc
+
+          - container: "ubuntu:xenial"
+            env:
+              CC: gcc
+
+    container:
+      image: ${{ matrix.container }}
+      env: ${{ matrix.env }}
+
+    steps:
+    - name: Show OS
+      run: cat /etc/os-release
+
+    - name: Git checkout
+      uses: actions/checkout(a)v2
+
+    - name: Install additional packages
+      run: |
+        INSTALL=3D${{ matrix.container }}
+        INSTALL=3D"${INSTALL%%:*}"
+        INSTALL=3D"${INSTALL%%/*}"
+        ./ci/$INSTALL.sh
+        if [ "$VARIANT" ]; then ./ci/$INSTALL.$VARIANT.sh; fi
+
+    - name: Compiler version
+      run: $CC --version
+
+    - name: Display environment and Linux version
+      run: |
+        test -f /etc/issue && cat /etc/issue
+        lsb_release -a || true
+        uname -a
+        cat /proc/cmdline
+        printenv
+
+    - name: Configure
+      run: ./bootstrap-configure
+
+    - name: Compile
+      run: make -j$(nproc)
+
+    - name: Install
+      run: make install
+
+    - name: Distribution check
+      run: make distcheck
diff --git a/ci/debian.sh b/ci/debian.sh
new file mode 100755
index 000000000000..07b7c9305cdb
--- /dev/null
+++ b/ci/debian.sh
@@ -0,0 +1,32 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+#
+
+set -eEx
+
+apt update
+
+# Some distros (e.g. Ubuntu Hirsute) might pull tzdata which asks questions
+export DEBIAN_FRONTEND=3Dnoninteractive DEBCONF_NONINTERACTIVE_SEEN=3Dtrue
+
+# Choose some random place in Europe
+echo "tzdata tzdata/Areas select Europe
+tzdata tzdata/Zones/Europe select Berlin
+" > /tmp/tzdata-preseed.txt
+debconf-set-selections /tmp/tzdata-preseed.txt
+
+apt install -y --no-install-recommends \
+	autoconf \
+	autoconf-archive \
+	automake \
+	build-essential \
+	libdbus-1-dev \
+	libglib2.0-dev \
+	libnl-3-dev \
+	libnl-genl-3-dev \
+	libtool \
+
diff --git a/ci/ubuntu.sh b/ci/ubuntu.sh
new file mode 120000
index 000000000000..0edcb8b838ca
--- /dev/null
+++ b/ci/ubuntu.sh
@@ -0,0 +1 @@
+debian.sh
\ No newline at end of file
-- =

2.30.2

--===============4245832207217719734==--

