Content-Type: multipart/mixed; boundary="===============1532326063932067611=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 10/11] ci: print configure logs on failures
Date: Wed, 04 Aug 2021 10:42:17 +0200
Message-ID: <20210804084218.14677-11-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1532326063932067611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Helps debugging of container-specific configure failures.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index b6f29cf9ddfb..d4ddcdd3f8f4 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -265,6 +265,7 @@ jobs:
         printenv
 =

     - name: Configure
+      id: configure
       run: |
         echo "Bootstraping in mode: $MODE"
         CONFIGURE_ARGS=3D""
@@ -287,6 +288,11 @@ jobs:
             $CONFIGURE_ARGS
         fi
 =

+    - name: Get configure logs
+      run: cat config.log
+      if: ${{ always() && ((steps.configure.outcome =3D=3D 'failure') ||
+                           (steps.configure.outcome =3D=3D 'success')) }}
+
     - name: Compile
       run: make -j$(nproc)
 =

-- =

2.30.2

--===============1532326063932067611==--

