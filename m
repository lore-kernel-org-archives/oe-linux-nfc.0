Content-Type: multipart/mixed; boundary="===============0633462321445643026=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH] build: fix missing pkglibdir substitute in neard.pc
Date: Wed, 04 Aug 2021 13:01:45 +0200
Message-ID: <20210804110145.85210-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0633462321445643026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The pkglibdir is used by neard.pc.in (so by autoconf) however the
automake defines it, not autoconf.  Add early definition of pkglibdir so
substitute in neard.pc.in will work correctly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 configure.ac | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure.ac b/configure.ac
index c1fdc44ae02d..ffe453049939 100644
--- a/configure.ac
+++ b/configure.ac
@@ -15,6 +15,10 @@ if (test "${libdir}" =3D '${exec_prefix}/lib'); then
 	libdir=3D'${prefix}/lib'
 fi
 =

+# pkglibdir is defined by automake but autoconf parses the neard.pc.in
+# which uses pkglibdir, therefore define it manually in autoconf.
+AC_SUBST([pkglibdir], ["\${libdir}/${PACKAGE_NAME}"])
+
 plugindir=3D'${pkglibdir}/plugins'
 se_plugindir=3D'${pkglibdir}/plugins-se'
 AC_SUBST(plugindir)
-- =

2.30.2

--===============0633462321445643026==--

