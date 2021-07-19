Content-Type: multipart/mixed; boundary="===============7226605732495169516=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 72/73] build: add support for GCC sanitizers (asan, lsan and ubsan)
Date: Mon, 19 Jul 2021 13:08:18 +0200
Message-ID: <20210719110819.27340-73-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7226605732495169516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add support for GCC sanitizers: address (asan), leak (lsan) and
undefined behavior (ubsan).  These can be toggled in ./configure with
--enable-asan, --enable-lsan and --enable-ubsan.

The autoconf code for this derived from ell (mostly authored by Mat
Martineau <mathew.j.martineau@linux.intel.com>):
https://git.kernel.org/pub/scm/libs/ell/ell.git

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 HACKING      |  5 ++++-
 acinclude.m4 | 36 ++++++++++++++++++++++++++++++++++++
 configure.ac | 45 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/HACKING b/HACKING
index 7326242506a6..40bde2fb3c8b 100644
--- a/HACKING
+++ b/HACKING
@@ -51,8 +51,11 @@ like this:
     # git clone git://git.kernel.org/pub/scm/network/.../neard.git
     # cd neard
 =

-  Configure and build
+  Configure (choose only one)
     # ./bootstrap-configure
+    # ./bootstrap-configure --enable-asan --enable-lsan --enable-ubsan
+
+  Build
     # make
 =

   Check installation
diff --git a/acinclude.m4 b/acinclude.m4
index a12b93972cfa..e9ad0d63cc8c 100644
--- a/acinclude.m4
+++ b/acinclude.m4
@@ -9,3 +9,39 @@ AC_DEFUN([NEARD_PROG_CC_PIE], [
 		rm -rf conftest*
 	])
 ])
+
+AC_DEFUN([NEARD_PROG_CC_ASAN], [
+AC_CACHE_CHECK([whether ${CC-cc} accepts -fsanitize=3Daddress], neard_cv_p=
rog_cc_asan, [
+	echo 'void f(){}' > conftest.c
+	if test -z "`${CC-cc} -fsanitize=3Daddress -c conftest.c 2>&1`"; then
+		neard_cv_prog_cc_asan=3Dyes
+	else
+		neard_cv_prog_cc_asan=3Dno
+	fi
+	rm -rf conftest*
+])
+])
+
+AC_DEFUN([NEARD_PROG_CC_LSAN], [
+AC_CACHE_CHECK([whether ${CC-cc} accepts -fsanitize=3Dleak], neard_cv_prog=
_cc_lsan, [
+	echo 'void f(){}' > conftest.c
+	if test -z "`${CC-cc} -fsanitize=3Dleak -c conftest.c 2>&1`"; then
+		neard_cv_prog_cc_lsan=3Dyes
+	else
+		neard_cv_prog_cc_lsan=3Dno
+	fi
+	rm -rf conftest*
+])
+])
+
+AC_DEFUN([NEARD_PROG_CC_UBSAN], [
+AC_CACHE_CHECK([whether ${CC-cc} accepts -fsanitize=3Dundefined], neard_cv=
_prog_cc_ubsan, [
+	echo 'void f(){}' > conftest.c
+	if test -z "`${CC-cc} -fsanitize=3Dundefined -c conftest.c 2>&1`"; then
+		neard_cv_prog_cc_ubsan=3Dyes
+	else
+		neard_cv_prog_cc_ubsan=3Dno
+	fi
+	rm -rf conftest*
+])
+])
diff --git a/configure.ac b/configure.ac
index 1ec6f4eb30ea..c1fdc44ae02d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -26,6 +26,9 @@ AC_LANG([C])
 =

 AC_PROG_CC
 NEARD_PROG_CC_PIE
+NEARD_PROG_CC_ASAN
+NEARD_PROG_CC_LSAN
+NEARD_PROG_CC_UBSAN
 AC_PROG_INSTALL
 AC_PROG_MKDIR_P
 =

@@ -98,6 +101,48 @@ AC_ARG_ENABLE(pie, AS_HELP_STRING([--enable-pie],
 AC_CHECK_LIB(dl, dlopen, dummy=3Dyes,
 			AC_MSG_ERROR(dynamic linking loader is required))
 =

+save_LIBS=3D$LIBS
+AC_CHECK_LIB(asan, _init)
+LIBS=3D$save_LIBS
+
+AC_ARG_ENABLE(asan, AC_HELP_STRING([--enable-asan],
+			[enable linking with address sanitizer]), [
+	if (test "${enableval}" =3D "yes" &&
+				test "${ac_cv_lib_asan__init}" =3D "yes" &&
+				test "${neard_cv_prog_cc_asan}" =3D "yes"); then
+		CFLAGS=3D"$CFLAGS -fsanitize=3Daddress";
+		LDFLAGS=3D"$LDFLAGS -fsanitize=3Daddress"
+	fi
+])
+
+save_LIBS=3D$LIBS
+AC_CHECK_LIB(lsan, _init)
+LIBS=3D$save_LIBS
+
+AC_ARG_ENABLE(lsan, AC_HELP_STRING([--enable-lsan],
+			[enable linking with leak sanitizer]), [
+	if (test "${enableval}" =3D "yes" &&
+				test "${ac_cv_lib_lsan__init}" =3D "yes" &&
+				test "${neard_cv_prog_cc_lsan}" =3D "yes"); then
+		CFLAGS=3D"$CFLAGS -fsanitize=3Dleak";
+		LDFLAGS=3D"$LDFLAGS -fsanitize=3Dleak"
+	fi
+])
+
+save_LIBS=3D$LIBS
+AC_CHECK_LIB(ubsan, _init)
+LIBS=3D$save_LIBS
+
+AC_ARG_ENABLE(ubsan, AC_HELP_STRING([--enable-ubsan],
+			[enable linking with undefined behavior sanitizer]), [
+	if (test "${enableval}" =3D "yes" &&
+				test "${ac_cv_lib_ubsan__init}" =3D "yes" &&
+				test "${neard_cv_prog_cc_ubsan}" =3D "yes"); then
+		CFLAGS=3D"$CFLAGS -fsanitize=3Dundefined";
+		LDFLAGS=3D"$LDFLAGS -fsanitize=3Dundefined"
+	fi
+])
+
 GLIB_DEPS=3D"glib-2.0 >=3D 2.28"
 PKG_CHECK_MODULES(GLIB, [${GLIB_DEPS}], dummy=3Dyes,
 				AC_MSG_ERROR(GLib >=3D 2.28 is required))
-- =

2.27.0

--===============7226605732495169516==--

