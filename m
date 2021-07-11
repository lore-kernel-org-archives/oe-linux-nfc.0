Content-Type: multipart/mixed; boundary="===============7466939197478476111=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 07/34] ci: display printenv
Date: Sun, 11 Jul 2021 22:20:35 +0200
Message-ID: <20210711202102.18094-8-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7466939197478476111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 7daccd2672fd..a9335e100fb4 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -224,6 +224,7 @@ jobs:
         lsb_release -a || true
         uname -a
         cat /proc/cmdline
+        printenv
 =

     - name: Configure
       run: |
-- =

2.27.0

--===============7466939197478476111==--

