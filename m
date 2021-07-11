Content-Type: multipart/mixed; boundary="===============2107009844980031253=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 33/34] build: enable -Wshadow and -Wformat-signedness compiler warnings
Date: Sun, 11 Jul 2021 22:23:50 +0200
Message-ID: <20210711202351.18363-21-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2107009844980031253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Enable code quality warnings - shadowing variables and using wrong
signed data in formats (leading to conversions).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 accflags.m4 | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/accflags.m4 b/accflags.m4
index b1bb1500324f..e4df62c13cf3 100644
--- a/accflags.m4
+++ b/accflags.m4
@@ -22,7 +22,10 @@ AC_DEFUN([NEARD_COMPILER_FLAGS], [
 		AX_CHECK_COMPILE_FLAG([-Wmissing-prototypes], [CFLAGS=3D"$CFLAGS -Wmissi=
ng-prototypes"])
 		AX_CHECK_COMPILE_FLAG([-Wjump-misses-init], [CFLAGS=3D"$CFLAGS -Wjump-mi=
sses-init"])
 		AX_CHECK_COMPILE_FLAG([-Wpointer-arith], [CFLAGS=3D"$CFLAGS -Wpointer-ar=
ith"])
+		AX_CHECK_COMPILE_FLAG([-Wshadow], [CFLAGS=3D"$CFLAGS -Wshadow"])
 =

+		# GCC v5.0
+		AX_CHECK_COMPILE_FLAG([-Wformat-signedness], [CFLAGS=3D"$CFLAGS -Wformat=
-signedness"])
 		# GCC v6.0
 		AX_CHECK_COMPILE_FLAG([-Wnull-dereference], [CFLAGS=3D"$CFLAGS -Wnull-de=
reference"])
 		AX_CHECK_COMPILE_FLAG([-Wduplicated-cond], [CFLAGS=3D"$CFLAGS -Wduplicat=
ed-cond"])
@@ -35,11 +38,7 @@ AC_DEFUN([NEARD_COMPILER_FLAGS], [
 	fi
 	if (test "$USE_MAINTAINER_MODE" =3D "pedantic"); then
 		AX_CHECK_COMPILE_FLAG([-Wstrict-overflow=3D3], [CFLAGS=3D"$CFLAGS -Wstri=
ct-overflow=3D3"])
-		AX_CHECK_COMPILE_FLAG([-Wshadow], [CFLAGS=3D"$CFLAGS -Wshadow"])
 		AX_CHECK_COMPILE_FLAG([-Wcast-qual], [CFLAGS=3D"$CFLAGS -Wcast-qual"])
 		AX_CHECK_COMPILE_FLAG([-Wunsafe-loop-optimizations], [CFLAGS=3D"$CFLAGS =
-Wunsafe-loop-optimizations"])
-
-		# GCC v5.0
-		AX_CHECK_COMPILE_FLAG([-Wformat-signedness], [CFLAGS=3D"$CFLAGS -Wformat=
-signedness"])
 	fi
 ])
-- =

2.27.0

--===============2107009844980031253==--

