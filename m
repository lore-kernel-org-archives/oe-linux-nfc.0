Content-Type: multipart/mixed; boundary="===============4806591504940938624=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 08/16] ci: simplify getting test logs
Date: Wed, 14 Jul 2021 13:05:10 +0200
Message-ID: <20210714110518.104655-9-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4806591504940938624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

make check-TESTS stores the logs in one file, so no need to get them one
by one.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 6ecd38177bde..14cc4306de23 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -259,13 +259,7 @@ jobs:
       if: ${{ (matrix.env['ARCH'] =3D=3D 'x86-64') || (matrix.env['ARCH'] =
=3D=3D 'i386') }}
 =

     - name: Get unit tests logs
-      run: |
-        for i in unit/*log
-        do
-          echo "#######################"
-          echo "LOG: $i"
-          cat $i
-        done
+      run: cat test-suite.log
       if: ${{ always() && ((steps.unit_tests.outcome =3D=3D 'failure') ||
                            (steps.unit_tests.outcome =3D=3D 'success')) }}
 =

-- =

2.27.0

--===============4806591504940938624==--

