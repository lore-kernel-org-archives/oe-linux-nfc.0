Content-Type: multipart/mixed; boundary="===============4767362569871372222=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 08/34] HACKING: refine required packages
Date: Sun, 11 Jul 2021 22:20:36 +0200
Message-ID: <20210711202102.18094-9-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4767362569871372222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Debian since Jessie (8.0 from 2015) seems to have automake v1.14, so
mentioning some specific configuration for it is not needed.  In the
same time other required libraries and tools are not mentioned, so let's
refresh the requirements list.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 HACKING | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/HACKING b/HACKING
index 478653c8a292..c1eb6d6189a6 100644
--- a/HACKING
+++ b/HACKING
@@ -5,17 +5,18 @@ Hacking on Near Field Communication manager
 Build tools requirements
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =

-When building and testing directly from the repository it is important to
-have at least automake version 1.10 or later installed. All modern
-distributions should default to the latest version, but it seems that
-Debian's default is still an earlier version:
-
-  Check version
-    # dpkg -l '*automake*'
-
-  Install new version
-    # apt-get install automake1.10
-    # update-alternatives --config automake
+Required packages and tools:
+  autoconf
+  automake
+  dbus
+  gcc/clang
+  glib 2.0
+  libtool
+  libnl-3
+  libnl-genl-3
+  make
+
+See also installation scripts for  Continuous Integration in ci/ directory.
 =

 =

 Working with the source code repository
-- =

2.27.0

--===============4767362569871372222==--

