Content-Type: multipart/mixed; boundary="===============0402838354844883015=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 3/8] ci: switch to dnf on Fedora
Date: Wed, 22 Sep 2021 18:11:08 +0200
Message-ID: <20210922161113.142758-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0402838354844883015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

dnf is the new package manager on Fedora.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 ci/fedora.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ci/fedora.sh b/ci/fedora.sh
index c5a67d237e91..f054f7d296d4 100755
--- a/ci/fedora.sh
+++ b/ci/fedora.sh
@@ -15,7 +15,7 @@ case $CC in
 	;;
 esac
 =

-yum -y install \
+dnf -y install \
 	autoconf \
 	autoconf-archive \
 	automake \
@@ -27,7 +27,7 @@ yum -y install \
 	$PKGS_CC
 =

 # Packages needed by CI
-yum -y install \
+dnf -y install \
 	file
 =

 echo "Install finished: $0"
-- =

2.30.2

--===============0402838354844883015==--

