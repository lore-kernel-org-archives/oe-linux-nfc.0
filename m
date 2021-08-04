Content-Type: multipart/mixed; boundary="===============8778021307939958959=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 02/11] bootstrap: parse CROSS_COMPILE and set proper configure option
Date: Wed, 04 Aug 2021 10:42:09 +0200
Message-ID: <20210804084218.14677-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8778021307939958959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Makes cross compiling in CI easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 bootstrap-configure | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/bootstrap-configure b/bootstrap-configure
index 7cb14588f816..0652e3b223b6 100755
--- a/bootstrap-configure
+++ b/bootstrap-configure
@@ -4,6 +4,11 @@ if [ -f config.status ]; then
 	make maintainer-clean
 fi
 =

+CONFIGURE_CROSS=3D""
+if [ "$CROSS_COMPILE" ]; then
+	CONFIGURE_CROSS=3D"--host=3D${CROSS_COMPILE}"
+fi
+
 ./bootstrap && \
     ./configure --enable-maintainer-mode \
 		--enable-debug \
@@ -11,4 +16,5 @@ fi
 		--prefix=3D/usr \
 		--enable-ese \
 		--sysconfdir=3D/etc \
+		"$CONFIGURE_CROSS" \
 		--enable-tools "$@"
-- =

2.30.2

--===============8778021307939958959==--

