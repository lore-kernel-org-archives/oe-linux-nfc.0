Content-Type: multipart/mixed; boundary="===============6158306879288522354=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 05/11] ci: be verbose when building
Date: Wed, 04 Aug 2021 10:42:12 +0200
Message-ID: <20210804084218.14677-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6158306879288522354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 589ad66280f5..389c47dcd781 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -102,11 +102,13 @@ jobs:
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

2.30.2

--===============6158306879288522354==--

