Content-Type: multipart/mixed; boundary="===============3472029073094310559=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 09/16] ci: print executed commands when configuring debian
Date: Sat, 10 Jul 2021 05:38:52 +0200
Message-ID: <20210710033859.3989-10-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3472029073094310559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 ci/debian.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/debian.sh b/ci/debian.sh
index 004e7d84ae07..35eb3681f059 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -7,7 +7,7 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 =

-set -e -E
+set -eEx
 =

 apt update
 =

-- =

2.27.0

--===============3472029073094310559==--

