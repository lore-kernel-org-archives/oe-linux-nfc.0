Content-Type: multipart/mixed; boundary="===============8353538365730883548=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 2/8] build: replace deprecated AC_HELP_STRING
Date: Wed, 22 Sep 2021 18:11:07 +0200
Message-ID: <20210922161113.142758-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8353538365730883548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

AC_HELP_STRING is deprecated in favor of AS_HELP_STRING at least since
autoconf v2.60.  In autoconf v2.71 (used on current ArchLinux and Fedora
Rawhide) this causes error:

  configure.ac:112: warning: The macro `AC_HELP_STRING' is obsolete.
  configure.ac:112: You should run autoupdate.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 configure.ac | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure.ac b/configure.ac
index a1f7bd8bf56a..2cf9a19e4fab 100644
--- a/configure.ac
+++ b/configure.ac
@@ -109,7 +109,7 @@ save_LIBS=3D$LIBS
 AC_CHECK_LIB(asan, _init)
 LIBS=3D$save_LIBS
 =

-AC_ARG_ENABLE(asan, AC_HELP_STRING([--enable-asan],
+AC_ARG_ENABLE(asan, AS_HELP_STRING([--enable-asan],
 			[enable linking with address sanitizer]), [
 	if (test "${enableval}" =3D "yes" &&
 				test "${ac_cv_lib_asan__init}" =3D "yes" &&
@@ -123,7 +123,7 @@ save_LIBS=3D$LIBS
 AC_CHECK_LIB(lsan, _init)
 LIBS=3D$save_LIBS
 =

-AC_ARG_ENABLE(lsan, AC_HELP_STRING([--enable-lsan],
+AC_ARG_ENABLE(lsan, AS_HELP_STRING([--enable-lsan],
 			[enable linking with leak sanitizer]), [
 	if (test "${enableval}" =3D "yes" &&
 				test "${ac_cv_lib_lsan__init}" =3D "yes" &&
@@ -137,7 +137,7 @@ save_LIBS=3D$LIBS
 AC_CHECK_LIB(ubsan, _init)
 LIBS=3D$save_LIBS
 =

-AC_ARG_ENABLE(ubsan, AC_HELP_STRING([--enable-ubsan],
+AC_ARG_ENABLE(ubsan, AS_HELP_STRING([--enable-ubsan],
 			[enable linking with undefined behavior sanitizer]), [
 	if (test "${enableval}" =3D "yes" &&
 				test "${ac_cv_lib_ubsan__init}" =3D "yes" &&
-- =

2.30.2

--===============8353538365730883548==--

