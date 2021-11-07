Content-Type: multipart/mixed; boundary="===============7837865895172270723=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 3/4] ci: add Debian Buster and Stretch
Date: Sun, 07 Nov 2021 18:26:18 +0100
Message-ID: <20211107172619.13560-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211107172619.13560-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7837865895172270723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add older releases of Debian: Buster and Stretch.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 5540ad2ebc39..aed8c089351d 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -26,6 +26,9 @@ jobs:
           - archlinux:latest
           - debian:testing
           - debian:stable
+          - debian:bullseye
+          - debian:buster
+          - debian:stretch
           # Fails on configure on GCC and clang (process restrictions?)
           # - fedora:rawhide
           - fedora:latest
@@ -55,6 +58,34 @@ jobs:
             mode: no-maintainer
             variant: i386
 =

+          - container: "debian:buster"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
+
+          - container: "debian:buster"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
+
+          - container: "debian:stretch"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
+
+          - container: "debian:stretch"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
+
           # Debian cross compilation builds
           - container: "debian:stable"
             arch: armel
@@ -85,13 +116,19 @@ jobs:
             variant: cross-compile
 =

           # Debian GCC sanitizer builds
+          - container: "debian:testing"
+            arch: x86-64
+            compiler: gcc
+            mode: maintainer
+            variant: sanitizers
+
           - container: "debian:stable"
             arch: x86-64
             compiler: gcc
             mode: maintainer
             variant: sanitizers
 =

-          - container: "debian:testing"
+          - container: "debian:buster"
             arch: x86-64
             compiler: gcc
             mode: maintainer
-- =

2.32.0

--===============7837865895172270723==--

