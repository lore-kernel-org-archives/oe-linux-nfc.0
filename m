Content-Type: multipart/mixed; boundary="===============1095027720204394328=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 2/3] ci: build on newer Fedora Linux (34 and 35)
Date: Mon, 14 Feb 2022 13:31:09 +0100
Message-ID: <20220214123110.27056-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214123110.27056-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1095027720204394328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Support for Fedora Linux 32 and 33 ended, so switch to new Fedora Linux
34 and 35.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 8cd836d398a7..1759d6571e74 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -32,8 +32,8 @@ jobs:
           # Fails on configure on GCC and clang (process restrictions?)
           # - fedora:rawhide
           - fedora:latest
-          - fedora:33
-          - fedora:32
+          - fedora:35
+          - fedora:34
           - ubuntu:impish
           - ubuntu:hirsute
           - ubuntu:focal
-- =

2.32.0

--===============1095027720204394328==--

