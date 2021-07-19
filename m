Content-Type: multipart/mixed; boundary="===============2167630098583319851=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 71/73] build: fix missing usage of PIE check result
Date: Mon, 19 Jul 2021 13:08:17 +0200
Message-ID: <20210719110819.27340-72-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2167630098583319851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The test result whether compiler accepts -fPIE in acinclude.m4 is stored
as neard_cv_prog_cc_pie variable.  Using wrong name of that variable in
a test for accepting '--enable-pie' configure argument caused PIE to be
never enabled (unless by default by compiler).

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

--===============2167630098583319851==--

