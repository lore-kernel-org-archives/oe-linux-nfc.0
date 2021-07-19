Content-Type: multipart/mixed; boundary="===============2617019838283823962=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 61/73] unit: do not search for headers locally where they do not exist
Date: Mon, 19 Jul 2021 13:08:07 +0200
Message-ID: <20210719110819.27340-62-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2617019838283823962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

near/ndef.h and src/near.h are coming from include path, so no point to
look for them in current folder.  Also reverse the order to match
unit/test-snep-read.c

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-build.c | 4 ++--
 unit/test-ndef-parse.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/unit/test-ndef-build.c b/unit/test-ndef-build.c
index 54b502f4a40b..5174f053841e 100644
--- a/unit/test-ndef-build.c
+++ b/unit/test-ndef-build.c
@@ -30,8 +30,8 @@
 #include <glib.h>
 #include <glib/gprintf.h>
 =

-#include "src/near.h"
-#include "include/ndef.h"
+#include <near/ndef.h>
+#include <src/near.h>
 =

 #define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
 =

diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index ace0f9038ad9..de3cac81b90d 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -30,8 +30,8 @@
 #include <glib.h>
 #include <glib/gprintf.h>
 =

-#include "src/near.h"
-#include "include/ndef.h"
+#include <near/ndef.h>
+#include <src/near.h>
 =

 enum record_type {
 	RECORD_TYPE_WKT_SMART_POSTER          =3D   0x01,
-- =

2.27.0

--===============2617019838283823962==--

