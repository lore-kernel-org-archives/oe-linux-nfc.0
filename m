Content-Type: multipart/mixed; boundary="===============8255470812859366759=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 2/4] ci: add Ubuntu Impish (21.10)
Date: Sun, 07 Nov 2021 18:26:17 +0100
Message-ID: <20211107172619.13560-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211107172619.13560-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8255470812859366759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Build on newest Ubuntu 21.10.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 734969325692..5540ad2ebc39 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -31,6 +31,7 @@ jobs:
           - fedora:latest
           - fedora:33
           - fedora:32
+          - ubuntu:impish
           - ubuntu:hirsute
           - ubuntu:focal
           - ubuntu:bionic
@@ -97,6 +98,20 @@ jobs:
             variant: sanitizers
 =

           # Ubuntu 32-bit builds
+          - container: "ubuntu:impish"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
+
+          - container: "ubuntu:impish"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
+
           - container: "ubuntu:hirsute"
             arch: i386
             compiler: gcc -m32
@@ -126,6 +141,12 @@ jobs:
             variant: i386
 =

           # Ubuntu GCC sanitizer builds
+          - container: "ubuntu:impish"
+            arch: x86-64
+            compiler: gcc
+            mode: maintainer
+            variant: sanitizers
+
           - container: "ubuntu:hirsute"
             arch: x86-64
             compiler: gcc
-- =

2.32.0

--===============8255470812859366759==--

