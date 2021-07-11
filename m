Content-Type: multipart/mixed; boundary="===============5085814238742343185=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 05/34] ci: run unit tests
Date: Sun, 11 Jul 2021 22:20:33 +0200
Message-ID: <20210711202102.18094-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5085814238742343185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Although unit tests are executed as part of distcheck, but add it as a
dedicated step to make it explicit with getting the logs afterwards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 8160aada2042..7daccd2672fd 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -245,6 +245,23 @@ jobs:
     - name: Compile
       run: make -j$(nproc)
 =

+    - name: Run unit tests
+      id: unit_tests
+      run: |
+        make check
+      if: ${{ (matrix.env['ARCH'] =3D=3D 'x86-64') || (matrix.env['ARCH'] =
=3D=3D 'i386') }}
+
+    - name: Get unit tests logs
+      run: |
+        for i in unit/*log
+        do
+          echo "#######################"
+          echo "LOG: $i"
+          cat $i
+        done
+      if: ${{ always() && ((steps.unit_tests.outcome =3D=3D 'failure') ||
+                           (steps.unit_tests.outcome =3D=3D 'success')) }}
+
     - name: Check final binary
       run: |
         file src/neard
-- =

2.27.0

--===============5085814238742343185==--

