Content-Type: multipart/mixed; boundary="===============6968136286690189026=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 12/34] build: add more compiler warnings
Date: Sun, 11 Jul 2021 22:20:40 +0200
Message-ID: <20210711202102.18094-13-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6968136286690189026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use the AX_CHECK_COMPILE_FLAG() macro from autoconf-archive to check for
support for more compiler warning flags (not enabled via -Wall and
-Wextra) and enable these which pass.

These flags are warning for:
1. Code bugs like dereferencing NULL or truncating string operations
   functions.

2. Minor code quality or portability issues like using undefined
   defines, wrong casts of functions, missing global function
   declarations, skipping variable initializations, duplicated if
   conditions or branches, usage of variable-length arrays.

3. Portability issues like implicit promoting float to double,
   allocating zero bytes or depending of size of void *.

Keep more warnings for later, because the code does not build with them.

The AX_CHECK_COMPILE_FLAG() macro tries to compile C code with given
flag, so move the code from acinclude.m4 (executed early, before AC_LANG
and others) to separate accflags.m4.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 HACKING      |  1 +
 accflags.m4  | 45 +++++++++++++++++++++++++++++++++++++++++++++
 acinclude.m4 | 17 -----------------
 ci/alpine.sh |  1 +
 ci/debian.sh |  1 +
 ci/fedora.sh |  1 +
 configure.ac |  5 +++--
 7 files changed, 52 insertions(+), 19 deletions(-)
 create mode 100644 accflags.m4

diff --git a/HACKING b/HACKING
index c1eb6d6189a6..7326242506a6 100644
--- a/HACKING
+++ b/HACKING
@@ -7,6 +7,7 @@ Build tools requirements
 =

 Required packages and tools:
   autoconf
+  autoconf-archive
   automake
   dbus
   gcc/clang
diff --git a/accflags.m4 b/accflags.m4
new file mode 100644
index 000000000000..b1bb1500324f
--- /dev/null
+++ b/accflags.m4
@@ -0,0 +1,45 @@
+AC_DEFUN([NEARD_COMPILER_FLAGS], [
+	# AX_CHECK_COMPILE_FLAG comes from autoconf-archive
+	AC_REQUIRE([AC_PROG_CC])
+	AC_REQUIRE([AX_CHECK_COMPILE_FLAG])
+
+	if (test "${CFLAGS}" =3D ""); then
+		CFLAGS=3D"-Wall -O2 -D_FORTIFY_SOURCE=3D2"
+	fi
+	if (test "$USE_MAINTAINER_MODE" =3D "yes"); then
+		CFLAGS=3D"$CFLAGS -Werror -Wextra"
+		CFLAGS=3D"$CFLAGS -Wno-unused-parameter"
+		CFLAGS=3D"$CFLAGS -Wno-missing-field-initializers"
+		CFLAGS=3D"$CFLAGS -Wdeclaration-after-statement"
+		CFLAGS=3D"$CFLAGS -Wmissing-declarations"
+		CFLAGS=3D"$CFLAGS -Wredundant-decls"
+		CFLAGS=3D"$CFLAGS -Wcast-align"
+		CFLAGS=3D"$CFLAGS -DG_DISABLE_DEPRECATED"
+
+		AX_CHECK_COMPILE_FLAG([-Wdouble-promotion], [CFLAGS=3D"$CFLAGS -Wdouble-=
promotion"])
+		AX_CHECK_COMPILE_FLAG([-Wundef], [CFLAGS=3D"$CFLAGS -Wundef"])
+		AX_CHECK_COMPILE_FLAG([-Wbad-function-cast], [CFLAGS=3D"$CFLAGS -Wbad-fu=
nction-cast"])
+		AX_CHECK_COMPILE_FLAG([-Wmissing-prototypes], [CFLAGS=3D"$CFLAGS -Wmissi=
ng-prototypes"])
+		AX_CHECK_COMPILE_FLAG([-Wjump-misses-init], [CFLAGS=3D"$CFLAGS -Wjump-mi=
sses-init"])
+		AX_CHECK_COMPILE_FLAG([-Wpointer-arith], [CFLAGS=3D"$CFLAGS -Wpointer-ar=
ith"])
+
+		# GCC v6.0
+		AX_CHECK_COMPILE_FLAG([-Wnull-dereference], [CFLAGS=3D"$CFLAGS -Wnull-de=
reference"])
+		AX_CHECK_COMPILE_FLAG([-Wduplicated-cond], [CFLAGS=3D"$CFLAGS -Wduplicat=
ed-cond"])
+		# GCC v7.0
+		AX_CHECK_COMPILE_FLAG([-Wduplicated-branches], [CFLAGS=3D"$CFLAGS -Wdupl=
icated-branches"])
+		AX_CHECK_COMPILE_FLAG([-Wvla-larger-than=3D1], [CFLAGS=3D"$CFLAGS -Wvla-=
larger-than=3D1"])
+		AX_CHECK_COMPILE_FLAG([-Walloc-zero], [CFLAGS=3D"$CFLAGS -Walloc-zero"])
+		# GCC v8.0
+		AX_CHECK_COMPILE_FLAG([-Wstringop-truncation], [CFLAGS=3D"$CFLAGS -Wstri=
ngop-truncation"])
+	fi
+	if (test "$USE_MAINTAINER_MODE" =3D "pedantic"); then
+		AX_CHECK_COMPILE_FLAG([-Wstrict-overflow=3D3], [CFLAGS=3D"$CFLAGS -Wstri=
ct-overflow=3D3"])
+		AX_CHECK_COMPILE_FLAG([-Wshadow], [CFLAGS=3D"$CFLAGS -Wshadow"])
+		AX_CHECK_COMPILE_FLAG([-Wcast-qual], [CFLAGS=3D"$CFLAGS -Wcast-qual"])
+		AX_CHECK_COMPILE_FLAG([-Wunsafe-loop-optimizations], [CFLAGS=3D"$CFLAGS =
-Wunsafe-loop-optimizations"])
+
+		# GCC v5.0
+		AX_CHECK_COMPILE_FLAG([-Wformat-signedness], [CFLAGS=3D"$CFLAGS -Wformat=
-signedness"])
+	fi
+])
diff --git a/acinclude.m4 b/acinclude.m4
index 027ed69977db..a12b93972cfa 100644
--- a/acinclude.m4
+++ b/acinclude.m4
@@ -9,20 +9,3 @@ AC_DEFUN([NEARD_PROG_CC_PIE], [
 		rm -rf conftest*
 	])
 ])
-
-AC_DEFUN([NEARD_COMPILER_FLAGS], [
-	if (test "${CFLAGS}" =3D ""); then
-		CFLAGS=3D"-Wall -O2 -D_FORTIFY_SOURCE=3D2"
-	fi
-	if (test "$USE_MAINTAINER_MODE" =3D "yes"); then
-		CFLAGS=3D"$CFLAGS -Werror -Wextra"
-		CFLAGS=3D"$CFLAGS -Werror -Wextra"
-		CFLAGS=3D"$CFLAGS -Wno-unused-parameter"
-		CFLAGS=3D"$CFLAGS -Wno-missing-field-initializers"
-		CFLAGS=3D"$CFLAGS -Wdeclaration-after-statement"
-		CFLAGS=3D"$CFLAGS -Wmissing-declarations"
-		CFLAGS=3D"$CFLAGS -Wredundant-decls"
-		CFLAGS=3D"$CFLAGS -Wcast-align"
-		CFLAGS=3D"$CFLAGS -DG_DISABLE_DEPRECATED"
-	fi
-])
diff --git a/ci/alpine.sh b/ci/alpine.sh
index 006dca22aaf9..81b5c72a392e 100755
--- a/ci/alpine.sh
+++ b/ci/alpine.sh
@@ -16,6 +16,7 @@ PKGS_CC=3D"gcc"
 # gzip: for distcheck
 apk add \
 	autoconf \
+	autoconf-archive \
 	automake \
 	gcc \
 	gzip \
diff --git a/ci/debian.sh b/ci/debian.sh
index dc2beecd8849..962e554304ee 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -28,6 +28,7 @@ esac
 =

 apt install -y --no-install-recommends \
 	autoconf \
+	autoconf-archive \
 	automake \
 	libdbus-1-dev \
 	libglib2.0-dev \
diff --git a/ci/fedora.sh b/ci/fedora.sh
index ea6e8a5f5b16..c5a67d237e91 100755
--- a/ci/fedora.sh
+++ b/ci/fedora.sh
@@ -17,6 +17,7 @@ esac
 =

 yum -y install \
 	autoconf \
+	autoconf-archive \
 	automake \
 	dbus-devel \
 	glib2-devel \
diff --git a/configure.ac b/configure.ac
index c4e8993305b1..b9419c1fad74 100644
--- a/configure.ac
+++ b/configure.ac
@@ -22,8 +22,6 @@ AC_SUBST(se_plugindir)
 =

 PKG_PROG_PKG_CONFIG
 =

-NEARD_COMPILER_FLAGS
-
 AC_LANG([C])
 =

 AC_PROG_CC
@@ -34,6 +32,9 @@ AC_PROG_MKDIR_P
 m4_define([_LT_AC_TAGCONFIG], [])
 m4_ifdef([AC_LIBTOOL_TAGS], [AC_LIBTOOL_TAGS([])])
 =

+m4_include([accflags.m4])
+NEARD_COMPILER_FLAGS
+
 LT_INIT([disable-static])
 =

 AM_CONDITIONAL(READLINE, test "${enable_readline}" =3D "yes")
-- =

2.27.0

--===============6968136286690189026==--

