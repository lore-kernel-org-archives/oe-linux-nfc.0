Content-Type: multipart/mixed; boundary="===============4614862876490488785=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 09/11] ci: add CodeQL static analysis
Date: Wed, 04 Aug 2021 10:42:16 +0200
Message-ID: <20210804084218.14677-10-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4614862876490488785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add Github CodeQL static analysis workflow.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/codeql-analysis.yml | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 .github/workflows/codeql-analysis.yml

diff --git a/.github/workflows/codeql-analysis.yml b/.github/workflows/code=
ql-analysis.yml
new file mode 100644
index 000000000000..66ad27d5eca0
--- /dev/null
+++ b/.github/workflows/codeql-analysis.yml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+#
+name: "CodeQL"
+on: [push, pull_request]
+
+jobs:
+  analyze:
+    name: Analyze
+    runs-on: ubuntu-latest
+    permissions:
+      actions: read
+      contents: read
+      security-events: write
+
+    strategy:
+      fail-fast: false
+      matrix:
+        language: [ 'cpp', 'python' ]
+
+    steps:
+    - name: Checkout repository
+      uses: actions/checkout(a)v2
+
+    - name: Initialize CodeQL
+      uses: github/codeql-action/init(a)v1
+      with:
+        languages: ${{ matrix.language }}
+
+    - name: Install additional packages
+      run: sudo ./ci/ubuntu.sh
+
+    - name: Configure
+      run: ./bootstrap-configure
+
+    - name: Compile
+      run: |
+        make -j$(nproc)
+        make check
+
+    - name: Perform CodeQL Analysis
+      uses: github/codeql-action/analyze(a)v1
-- =

2.30.2

--===============4614862876490488785==--

