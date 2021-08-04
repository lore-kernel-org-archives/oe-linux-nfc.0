Content-Type: multipart/mixed; boundary="===============1239348598741476578=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 07/11] ci: run unit tests
Date: Wed, 04 Aug 2021 10:42:14 +0200
Message-ID: <20210804084218.14677-8-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1239348598741476578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Although unit tests are executed as part of distcheck, but add it as a
dedicated step to make it explicit with getting the logs afterwards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index c8e3fb8fb10b..e8f507a128e0 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -256,6 +256,17 @@ jobs:
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
+      run: cat test-suite.log
+      if: ${{ always() && ((steps.unit_tests.outcome =3D=3D 'failure') ||
+                           (steps.unit_tests.outcome =3D=3D 'success')) }}
+
     - name: Check final binary
       run: |
         file src/neard
-- =

2.30.2

--===============1239348598741476578==--

