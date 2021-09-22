Content-Type: multipart/mixed; boundary="===============7789094182237866362=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 4/8] ci: add more Fedora containers
Date: Wed, 22 Sep 2021 18:11:09 +0200
Message-ID: <20210922161113.142758-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7789094182237866362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Build in Fedora rawhide and in stable release containers.

Rawhide fails to install packages in two rounds (with two dnf/yum
commands), so combine these.  Rawhide also needs explicit pkg-config as
it is not pulled in by other packages.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml |  4 ++++
 ci/fedora.sh             | 13 ++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 6a4eeedf3d66..cc977670e380 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -25,7 +25,11 @@ jobs:
           - alpine:latest
           - debian:testing
           - debian:stable
+          # Fails on configure on GCC and clang (process restrictions?)
+          # - fedora:rawhide
           - fedora:latest
+          - fedora:33
+          - fedora:32
           - ubuntu:hirsute
           - ubuntu:focal
           - ubuntu:bionic
diff --git a/ci/fedora.sh b/ci/fedora.sh
index f054f7d296d4..f9ec67a15062 100755
--- a/ci/fedora.sh
+++ b/ci/fedora.sh
@@ -15,19 +15,22 @@ case $CC in
 	;;
 esac
 =

+# Packages needed by CI
+PKGS_MORE=3D"file"
+
+# diffutils: Rawhide/35 needs "cmp" for configure
 dnf -y install \
 	autoconf \
 	autoconf-archive \
 	automake \
 	dbus-devel \
+	diffutils \
 	glib2-devel \
 	libnl3-devel \
 	libtool \
 	make \
-	$PKGS_CC
-
-# Packages needed by CI
-dnf -y install \
-	file
+	pkg-config \
+	$PKGS_CC \
+	$PKGS_MORE
 =

 echo "Install finished: $0"
-- =

2.30.2

--===============7789094182237866362==--

