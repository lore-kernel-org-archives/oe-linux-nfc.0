Content-Type: multipart/mixed; boundary="===============7543143362667110335=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH] ci: build on newest Ubuntu Jammy Jellyfish (22.04)
Date: Wed, 01 Jun 2022 14:16:34 +0200
Message-ID: <20220601121634.192225-1-krzysztof.kozlowski@linaro.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7543143362667110335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add building under CI on Ubuntu Jammy Jellyfish (22.04).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .github/workflows/ci.yml | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 1759d6571e74..2adf6f102d36 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -34,6 +34,7 @@ jobs:
           - fedora:latest
           - fedora:35
           - fedora:34
+          - ubuntu:jammy
           - ubuntu:impish
           - ubuntu:hirsute
           - ubuntu:focal
@@ -177,6 +178,20 @@ jobs:
             variant: sanitizers
 =

           # Ubuntu 32-bit builds
+          - container: "ubuntu:jammy"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
+
+          - container: "ubuntu:jammy"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
+
           - container: "ubuntu:impish"
             arch: i386
             compiler: gcc -m32
@@ -220,6 +235,12 @@ jobs:
             variant: i386
 =

           # Ubuntu GCC sanitizer builds
+          - container: "ubuntu:jammy"
+            arch: x86-64
+            compiler: gcc
+            mode: maintainer
+            variant: sanitizers
+
           - container: "ubuntu:impish"
             arch: x86-64
             compiler: gcc
-- =

2.34.1

--===============7543143362667110335==--

