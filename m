Content-Type: multipart/mixed; boundary="===============6119952754511429723=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 10/16] ci: no need to print twice compiler version
Date: Sat, 10 Jul 2021 05:38:53 +0200
Message-ID: <20210710033859.3989-11-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6119952754511429723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There is separate step for showing compiler version.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 866fa846c7f8..e746eb67df29 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -60,8 +60,6 @@ jobs:
         lsb_release -a || true
         uname -a
         cat /proc/cmdline
-        gcc --version || true
-        clang --version || true
 =

     - name: Configure
       run: ./bootstrap-configure
-- =

2.27.0

--===============6119952754511429723==--

