Content-Type: multipart/mixed; boundary="===============0964934821212227955=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 1/8] build: adjust configure.ac syntax to match autoupdate
Date: Wed, 22 Sep 2021 18:11:06 +0200
Message-ID: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0964934821212227955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Effect of autoupdate, without changing the version.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 configure.ac | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index 25b12b9a85d8..a1f7bd8bf56a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -1,5 +1,5 @@
-AC_PREREQ(2.60)
-AC_INIT(neard, 0.17, [linux-nfc(a)lists.01.org])
+AC_PREREQ([2.60])
+AC_INIT([neard],[0.17],[linux-nfc(a)lists.01.org])
 AC_CONFIG_MACRO_DIR([m4])
 =

 AM_INIT_AUTOMAKE([foreign subdir-objects color-tests])
-- =

2.30.2

--===============0964934821212227955==--

