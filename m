Content-Type: multipart/mixed; boundary="===============1802769392939762350=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 6/8] ci: install pkg-config
Date: Wed, 22 Sep 2021 18:11:11 +0200
Message-ID: <20210922161113.142758-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1802769392939762350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Some newer distros (e.g. Fedora 35) might not pull pkg-config and print
confusing errors like:

  configure.ac:61: error: possibly undefined macro: AC_MSG_ERROR
  If this token and others are legitimate, please use m4_pattern_allow.
  See the Autoconf documentation.
  configure.ac:179: error: possibly undefined macro: AC_DEFINE

Configure explicitly uses pkg-config so install it always.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 HACKING      | 1 +
 ci/alpine.sh | 1 +
 ci/debian.sh | 1 +
 3 files changed, 3 insertions(+)

diff --git a/HACKING b/HACKING
index 40bde2fb3c8b..db75f0d11a17 100644
--- a/HACKING
+++ b/HACKING
@@ -16,6 +16,7 @@ Required packages and tools:
   libnl-3
   libnl-genl-3
   make
+  pkg-config
 =

 See also installation scripts for  Continuous Integration in ci/ directory.
 =

diff --git a/ci/alpine.sh b/ci/alpine.sh
index 56449dd7c969..bf87068228f3 100755
--- a/ci/alpine.sh
+++ b/ci/alpine.sh
@@ -33,6 +33,7 @@ apk add \
 	libtool \
 	make \
 	musl-dev \
+	pkgconfig \
 	$PKGS_CC
 =

 # Packages needed by CI
diff --git a/ci/debian.sh b/ci/debian.sh
index 962e554304ee..adb683eadf81 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -36,6 +36,7 @@ apt install -y --no-install-recommends \
 	libnl-genl-3-dev \
 	libtool \
 	make \
+	pkg-config \
 	$PKGS_CC
 =

 echo "Install finished: $0"
-- =

2.30.2

--===============1802769392939762350==--

