Content-Type: multipart/mixed; boundary="===============3778797871726451256=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 8/8] ci: group package installation on Alpine
Date: Wed, 22 Sep 2021 18:11:13 +0200
Message-ID: <20210922161113.142758-8-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3778797871726451256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 ci/alpine.sh | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/ci/alpine.sh b/ci/alpine.sh
index bf87068228f3..550bf86370bf 100755
--- a/ci/alpine.sh
+++ b/ci/alpine.sh
@@ -20,6 +20,9 @@ case $CC in
 	;;
 esac
 =

+# Packages needed by CI
+PKGS_MORE=3D"file"
+
 # gzip: for distcheck
 apk add \
 	autoconf \
@@ -34,10 +37,7 @@ apk add \
 	make \
 	musl-dev \
 	pkgconfig \
-	$PKGS_CC
-
-# Packages needed by CI
-apk add \
-	file
+	$PKGS_CC \
+	$PKGS_MORE
 =

 echo "Install finished: $0"
-- =

2.30.2

--===============3778797871726451256==--

