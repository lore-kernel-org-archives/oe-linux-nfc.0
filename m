Content-Type: multipart/mixed; boundary="===============3127544441594694404=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 03/11] ci: add clang builds
Date: Wed, 04 Aug 2021 10:42:10 +0200
Message-ID: <20210804084218.14677-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3127544441594694404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 10 ++++++++++
 ci/debian.sh             | 10 ++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index e48ee0eb6815..3d9b50251602 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -20,6 +20,7 @@ jobs:
       fail-fast: false
       matrix:
         include:
+          # Ubuntu gcc
           - container: "ubuntu:hirsute"
             env:
               CC: gcc
@@ -36,6 +37,15 @@ jobs:
             env:
               CC: gcc
 =

+          # Ubuntu clang
+          - container: "ubuntu:hirsute"
+            env:
+              CC: clang
+
+          - container: "ubuntu:focal"
+            env:
+              CC: clang
+
     container:
       image: ${{ matrix.container }}
       env: ${{ matrix.env }}
diff --git a/ci/debian.sh b/ci/debian.sh
index 07b7c9305cdb..8cc4d307cccf 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -19,14 +19,20 @@ tzdata tzdata/Zones/Europe select Berlin
 " > /tmp/tzdata-preseed.txt
 debconf-set-selections /tmp/tzdata-preseed.txt
 =

+PKGS_CC=3D"build-essential"
+if [ "$CC" =3D "clang" ]; then
+	PKGS_CC=3D"clang"
+fi
+
+
 apt install -y --no-install-recommends \
 	autoconf \
 	autoconf-archive \
 	automake \
-	build-essential \
 	libdbus-1-dev \
 	libglib2.0-dev \
 	libnl-3-dev \
 	libnl-genl-3-dev \
 	libtool \
-
+	make \
+	$PKGS_CC
-- =

2.30.2

--===============3127544441594694404==--

