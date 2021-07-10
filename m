Content-Type: multipart/mixed; boundary="===============5475643435765790361=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 07/16] ci: add SPDX and copyright notes to ci.yml
Date: Sat, 10 Jul 2021 05:38:50 +0200
Message-ID: <20210710033859.3989-8-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5475643435765790361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index fb754ac78038..266b93ff9895 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -1,3 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+# Loosely based on https://github.com/linux-test-project/ltp
+#
 name: "CI: docker based builds"
 on: [push, pull_request]
 =

-- =

2.27.0

--===============5475643435765790361==--

