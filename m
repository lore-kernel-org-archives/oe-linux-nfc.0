Content-Type: multipart/mixed; boundary="===============0647432116490740087=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 04/11] ci: add building without maintainer options
Date: Wed, 04 Aug 2021 10:42:11 +0200
Message-ID: <20210804084218.14677-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0647432116490740087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Check also silent builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 3d9b50251602..589ad66280f5 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -24,27 +24,49 @@ jobs:
           - container: "ubuntu:hirsute"
             env:
               CC: gcc
+              MODE: maintainer
+
+          - container: "ubuntu:hirsute"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: no-maintainer
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
+
+          - container: "ubuntu:focal"
+            env:
+              CC: clang
+              MODE: maintainer
 =

           - container: "ubuntu:focal"
             env:
               CC: clang
+              MODE: no-maintainer
 =

     container:
       image: ${{ matrix.container }}
@@ -77,7 +99,19 @@ jobs:
         printenv
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

2.30.2

--===============0647432116490740087==--

