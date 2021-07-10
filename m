Content-Type: multipart/mixed; boundary="===============2348871081985880405=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 16/16] ci: add clang builds
Date: Sat, 10 Jul 2021 05:38:59 +0200
Message-ID: <20210710033859.3989-17-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2348871081985880405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 10 ++++++++++
 ci/debian.sh             |  9 +++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index e746eb67df29..fb322381e7f5 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -16,6 +16,7 @@ jobs:
       fail-fast: false
       matrix:
         include:
+          # Ubuntu gcc
           - container: "ubuntu:hirsute"
             env:
               CC: gcc
@@ -32,6 +33,15 @@ jobs:
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
index 35eb3681f059..1d31d8364982 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -20,13 +20,18 @@ tzdata tzdata/Zones/Europe select Berlin
 " > /tmp/tzdata-preseed.txt
 debconf-set-selections /tmp/tzdata-preseed.txt
 =

+PKGS_CC=3D"build-essential"
+if [ "$CC" =3D=3D "clang" ]; then
+	PKGS_CC=3D"clang"
+fi
+
+
 apt install -y --no-install-recommends \
 	autoconf \
 	automake \
-	build-essential \
 	libdbus-1-dev \
 	libglib2.0-dev \
 	libnl-3-dev \
 	libnl-genl-3-dev \
 	libtool \
-
+	$PKGS_CC
-- =

2.27.0

--===============2348871081985880405==--

