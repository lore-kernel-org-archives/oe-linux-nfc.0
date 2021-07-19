Content-Type: multipart/mixed; boundary="===============3237288657575118226=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 66/73] build: fix setting CFLAGS on dash shell (Alpine Linux)
Date: Mon, 19 Jul 2021 13:08:12 +0200
Message-ID: <20210719110819.27340-67-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3237288657575118226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Syntax like "CFLAGS+=3D" does not work on simple shells, e.g. dash from
BusyBox.  This seems to fail to properly configure CFLAGS on Alpine
Linux:

    checking for pkg-config... /usr/bin/pkg-config
    checking pkg-config is at least version 0.9.0... yes
    ./configure: line 3441: CFLAGS+=3D -Werror -Wextra: not found
    ./configure: line 3442: CFLAGS+=3D -Wno-unused-parameter: not found
    ./configure: line 3443: CFLAGS+=3D -Wno-missing-field-initializers: not=
 found
    ./configure: line 3444: CFLAGS+=3D -Wdeclaration-after-statement: not f=
ound
    ./configure: line 3445: CFLAGS+=3D -Wmissing-declarations: not found
    ./configure: line 3446: CFLAGS+=3D -Wredundant-decls: not found
    ./configure: line 3447: CFLAGS+=3D -Wcast-align: not found
    ./configure: line 3448: CFLAGS+=3D -DG_DISABLE_DEPRECATED: not found
    checking for gcc... gcc

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 acinclude.m4 | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/acinclude.m4 b/acinclude.m4
index fbc7660dfb67..027ed69977db 100644
--- a/acinclude.m4
+++ b/acinclude.m4
@@ -15,13 +15,14 @@ AC_DEFUN([NEARD_COMPILER_FLAGS], [
 		CFLAGS=3D"-Wall -O2 -D_FORTIFY_SOURCE=3D2"
 	fi
 	if (test "$USE_MAINTAINER_MODE" =3D "yes"); then
-		CFLAGS+=3D" -Werror -Wextra"
-		CFLAGS+=3D" -Wno-unused-parameter"
-		CFLAGS+=3D" -Wno-missing-field-initializers"
-		CFLAGS+=3D" -Wdeclaration-after-statement"
-		CFLAGS+=3D" -Wmissing-declarations"
-		CFLAGS+=3D" -Wredundant-decls"
-		CFLAGS+=3D" -Wcast-align"
-		CFLAGS+=3D" -DG_DISABLE_DEPRECATED"
+		CFLAGS=3D"$CFLAGS -Werror -Wextra"
+		CFLAGS=3D"$CFLAGS -Werror -Wextra"
+		CFLAGS=3D"$CFLAGS -Wno-unused-parameter"
+		CFLAGS=3D"$CFLAGS -Wno-missing-field-initializers"
+		CFLAGS=3D"$CFLAGS -Wdeclaration-after-statement"
+		CFLAGS=3D"$CFLAGS -Wmissing-declarations"
+		CFLAGS=3D"$CFLAGS -Wredundant-decls"
+		CFLAGS=3D"$CFLAGS -Wcast-align"
+		CFLAGS=3D"$CFLAGS -DG_DISABLE_DEPRECATED"
 	fi
 ])
-- =

2.27.0

--===============3237288657575118226==--

