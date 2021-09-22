Content-Type: multipart/mixed; boundary="===============7987692794865710845=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 5/8] ci: add ArchLinux container
Date: Wed, 22 Sep 2021 18:11:10 +0200
Message-ID: <20210922161113.142758-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7987692794865710845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Build in ArchLinux latest container.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml |  1 +
 ci/archlinux.sh          | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100755 ci/archlinux.sh

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index cc977670e380..734969325692 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -23,6 +23,7 @@ jobs:
         compiler: [gcc, clang]
         container:
           - alpine:latest
+          - archlinux:latest
           - debian:testing
           - debian:stable
           # Fails on configure on GCC and clang (process restrictions?)
diff --git a/ci/archlinux.sh b/ci/archlinux.sh
new file mode 100755
index 000000000000..b08069ad2589
--- /dev/null
+++ b/ci/archlinux.sh
@@ -0,0 +1,30 @@
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
+pacman -Sy --noconfirm \
+	autoconf \
+	autoconf-archive \
+	automake \
+	dbus \
+	glib2 \
+	libnl \
+	libtool \
+	make \
+	pkg-config \
+	$PKGS_CC
+
+echo "Install finished: $0"
-- =

2.30.2

--===============7987692794865710845==--

