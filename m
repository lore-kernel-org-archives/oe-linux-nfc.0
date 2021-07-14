Content-Type: multipart/mixed; boundary="===============0920787396320102628=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 07/16] ci: build also on Ubuntu Hirsute in non-maintainer mode
Date: Wed, 14 Jul 2021 13:05:09 +0200
Message-ID: <20210714110518.104655-8-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0920787396320102628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Increase the coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index a9335e100fb4..6ecd38177bde 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -153,6 +153,12 @@ jobs:
               CC: gcc
               MODE: maintainer
 =

+          - container: "ubuntu:hirsute"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: no-maintainer
+
           - container: "ubuntu:focal"
             env:
               ARCH: x86-64
-- =

2.27.0

--===============0920787396320102628==--

