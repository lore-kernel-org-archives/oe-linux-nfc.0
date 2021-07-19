Content-Type: multipart/mixed; boundary="===============6963944185935118772=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 70/73] build: enable -Wunsafe-loop-optimizations and -Wstrict-overflow=2 warnings
Date: Mon, 19 Jul 2021 13:08:16 +0200
Message-ID: <20210719110819.27340-71-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6963944185935118772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Enable basic overflow in optimization checks (portability related) and
missed loop optimizations.  The latter (-Wunsafe-loop-optimizations)
does not work well with GCC v7.5 so simply skip it there.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 accflags.m4 | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/accflags.m4 b/accflags.m4
index 57cc48beecc2..0030ac339c86 100644
--- a/accflags.m4
+++ b/accflags.m4
@@ -24,6 +24,7 @@ AC_DEFUN([NEARD_COMPILER_FLAGS], [
 		AX_CHECK_COMPILE_FLAG([-Wjump-misses-init], [CFLAGS=3D"$CFLAGS -Wjump-mi=
sses-init"])
 		AX_CHECK_COMPILE_FLAG([-Wpointer-arith], [CFLAGS=3D"$CFLAGS -Wpointer-ar=
ith"])
 		AX_CHECK_COMPILE_FLAG([-Wshadow], [CFLAGS=3D"$CFLAGS -Wshadow"])
+		AX_CHECK_COMPILE_FLAG([-Wstrict-overflow=3D2], [CFLAGS=3D"$CFLAGS -Wstri=
ct-overflow=3D2"])
 =

 		# GCC v5.0
 		AX_CHECK_COMPILE_FLAG([-Wformat-signedness], [CFLAGS=3D"$CFLAGS -Wformat=
-signedness"])
@@ -36,10 +37,16 @@ AC_DEFUN([NEARD_COMPILER_FLAGS], [
 		AX_CHECK_COMPILE_FLAG([-Walloc-zero], [CFLAGS=3D"$CFLAGS -Walloc-zero"])
 		# GCC v8.0
 		AX_CHECK_COMPILE_FLAG([-Wstringop-truncation], [CFLAGS=3D"$CFLAGS -Wstri=
ngop-truncation"])
+
+		# GCC v7.5 from Ubuntu Bionic incorrectly assumes several loops can over=
flow, so enable
+		# -Wunsafe-loop-optimizations only on newer GCC.
+		CC_VERSION=3D`$CC --version | head -n 1 | sed -e 's/.*\ \(@<:@0-9@:>@\+\=
.@<:@0-9@:>@\+\.@<:@0-9@:>@\+\)\(-@<:@0-9@:>@\+\)\?$/\1/'`
+		AX_COMPARE_VERSION([$CC_VERSION],[ge],[8.0.0],
+			[AX_CHECK_COMPILE_FLAG([-Wunsafe-loop-optimizations], [CFLAGS=3D"$CFLAG=
S -Wunsafe-loop-optimizations"])], [])
 	fi
 	if (test "$USE_MAINTAINER_MODE" =3D "pedantic"); then
-		AX_CHECK_COMPILE_FLAG([-Wstrict-overflow=3D3], [CFLAGS=3D"$CFLAGS -Wstri=
ct-overflow=3D3"])
 		AX_CHECK_COMPILE_FLAG([-Wcast-qual], [CFLAGS=3D"$CFLAGS -Wcast-qual"])
-		AX_CHECK_COMPILE_FLAG([-Wunsafe-loop-optimizations], [CFLAGS=3D"$CFLAGS =
-Wunsafe-loop-optimizations"])
+		# Instead of -Wstrict-overflow=3D2
+		AX_CHECK_COMPILE_FLAG([-Wstrict-overflow=3D3], [CFLAGS=3D"$CFLAGS -Wstri=
ct-overflow=3D3"])
 	fi
 ])
-- =

2.27.0

--===============6963944185935118772==--

