Content-Type: multipart/mixed; boundary="===============2472937025343566022=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 69/73] build: enable -Wformat=2 warnings
Date: Mon, 19 Jul 2021 13:08:15 +0200
Message-ID: <20210719110819.27340-70-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2472937025343566022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The -Wformat=3D2 compiler warning can detect potentials errors when using
printf-like functions.  It is supported by GCC and clang.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 accflags.m4 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accflags.m4 b/accflags.m4
index e4df62c13cf3..57cc48beecc2 100644
--- a/accflags.m4
+++ b/accflags.m4
@@ -14,6 +14,7 @@ AC_DEFUN([NEARD_COMPILER_FLAGS], [
 		CFLAGS=3D"$CFLAGS -Wmissing-declarations"
 		CFLAGS=3D"$CFLAGS -Wredundant-decls"
 		CFLAGS=3D"$CFLAGS -Wcast-align"
+		CFLAGS=3D"$CFLAGS -Wformat=3D2"
 		CFLAGS=3D"$CFLAGS -DG_DISABLE_DEPRECATED"
 =

 		AX_CHECK_COMPILE_FLAG([-Wdouble-promotion], [CFLAGS=3D"$CFLAGS -Wdouble-=
promotion"])
-- =

2.27.0

--===============2472937025343566022==--

