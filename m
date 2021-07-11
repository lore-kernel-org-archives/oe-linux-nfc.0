Content-Type: multipart/mixed; boundary="===============9045804791713003937=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 02/34] ci: add building without maintainer options
Date: Sun, 11 Jul 2021 22:20:30 +0200
Message-ID: <20210711202102.18094-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============9045804791713003937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Check also silent builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index fb322381e7f5..ecd0683f6c79 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -20,27 +20,43 @@ jobs:
           - container: "ubuntu:hirsute"
             env:
               CC: gcc
+              MODE: maintainer
 =

           - container: "ubuntu:focal"
             env:
               CC: gcc
+              MODE: maintainer
+
+          - container: "ubuntu:focal"
+            env:
+              CC: gcc
+              MODE: no-maintainer
 =

           - container: "ubuntu:bionic"
             env:
               CC: gcc
+              MODE: maintainer
 =

           - container: "ubuntu:xenial"
             env:
               CC: gcc
+              MODE: maintainer
 =

           # Ubuntu clang
           - container: "ubuntu:hirsute"
             env:
               CC: clang
+              MODE: maintainer
 =

           - container: "ubuntu:focal"
             env:
               CC: clang
+              MODE: maintainer
+
+          - container: "ubuntu:focal"
+            env:
+              CC: clang
+              MODE: no-maintainer
 =

     container:
       image: ${{ matrix.container }}
@@ -72,7 +88,19 @@ jobs:
         cat /proc/cmdline
 =

     - name: Configure
-      run: ./bootstrap-configure
+      run: |
+        echo "Bootstraping in mode: $MODE"
+        if [ "$MODE" =3D "maintainer" ]; then
+          ./bootstrap-configure
+        else
+          ./bootstrap && \
+            ./configure \
+            --disable-systemd \
+            --prefix=3D/usr \
+            --enable-ese \
+            --sysconfdir=3D/etc \
+            --enable-tools
+        fi
 =

     - name: Compile
       run: make -j$(nproc)
-- =

2.27.0

--===============9045804791713003937==--

