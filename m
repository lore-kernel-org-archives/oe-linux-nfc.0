Content-Type: multipart/mixed; boundary="===============8087862337778708894=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 09/16] build: fix missing usage of PIE check result
Date: Wed, 14 Jul 2021 13:05:11 +0200
Message-ID: <20210714110518.104655-10-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8087862337778708894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The test whether compiler accepts -fPIE in acinclude.m4 is stored as
neard_cv_prog_cc_pie variable.  Refering wrong name in test for
accepting '--enable-pie' configure argument caused PIE to be never
enabled (unless by default by compiler).

Fixes: 10c7e4a3cec3 ("build: Namespace local macros with NEARD_ instead of =
AC_ or nothing")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index b9419c1fad74..1ec6f4eb30ea 100644
--- a/configure.ac
+++ b/configure.ac
@@ -89,7 +89,7 @@ AC_ARG_ENABLE(debug, AS_HELP_STRING([--enable-debug],
 AC_ARG_ENABLE(pie, AS_HELP_STRING([--enable-pie],
 			[enable position independent executables flag]), [
 	if (test "${enableval}" =3D "yes" &&
-				test "${ac_cv_prog_cc_pie}" =3D "yes"); then
+				test "${neard_cv_prog_cc_pie}" =3D "yes"); then
 		CFLAGS=3D"$CFLAGS -fPIE"
 		LDFLAGS=3D"$LDFLAGS -pie"
 	fi
-- =

2.27.0

--===============8087862337778708894==--

