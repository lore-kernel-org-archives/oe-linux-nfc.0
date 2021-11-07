Content-Type: multipart/mixed; boundary="===============2788132835450977036=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 4/4] ci: add Debian Testing for i386 and cross compile
Date: Sun, 07 Nov 2021 18:26:19 +0100
Message-ID: <20211107172619.13560-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211107172619.13560-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2788132835450977036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Build also Debian Testing on i386 and cross compile configurations.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index aed8c089351d..2e1ad40debb9 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -44,6 +44,20 @@ jobs:
         variant: [""]
         include:
           # Debian 32-bit builds
+          - container: "debian:testing"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
+
+          - container: "debian:testing"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
+
           - container: "debian:stable"
             arch: i386
             compiler: gcc -m32
@@ -87,6 +101,34 @@ jobs:
             variant: i386
 =

           # Debian cross compilation builds
+          - container: "debian:testing"
+            arch: armel
+            compiler: arm-linux-gnueabi-gcc
+            cross_compile: arm-linux-gnueabi
+            mode: maintainer
+            variant: cross-compile
+
+          - container: "debian:testing"
+            arch: arm64
+            compiler: aarch64-linux-gnu-gcc
+            cross_compile: aarch64-linux-gnu
+            mode: maintainer
+            variant: cross-compile
+
+          - container: "debian:testing"
+            arch: ppc64el
+            compiler: powerpc64le-linux-gnu-gcc
+            cross_compile: powerpc64le-linux-gnu
+            mode: maintainer
+            variant: cross-compile
+
+          - container: "debian:testing"
+            arch: s390x
+            compiler: s390x-linux-gnu-gcc
+            cross_compile: s390x-linux-gnu
+            mode: maintainer
+            variant: cross-compile
+
           - container: "debian:stable"
             arch: armel
             compiler: arm-linux-gnueabi-gcc
-- =

2.32.0

--===============2788132835450977036==--

