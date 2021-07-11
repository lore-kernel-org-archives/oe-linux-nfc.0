Content-Type: multipart/mixed; boundary="===============1740124927356311810=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 03/34] ci: be verbose when building
Date: Sun, 11 Jul 2021 22:20:31 +0200
Message-ID: <20210711202102.18094-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1740124927356311810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index ecd0683f6c79..85821ee6617c 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -91,11 +91,13 @@ jobs:
       run: |
         echo "Bootstraping in mode: $MODE"
         if [ "$MODE" =3D "maintainer" ]; then
-          ./bootstrap-configure
+          ./bootstrap-configure \
+            --disable-silent-rules
         else
           ./bootstrap && \
             ./configure \
             --disable-systemd \
+            --disable-silent-rules \
             --prefix=3D/usr \
             --enable-ese \
             --sysconfdir=3D/etc \
-- =

2.27.0

--===============1740124927356311810==--

