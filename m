Content-Type: multipart/mixed; boundary="===============4666483602029243931=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 23/73] nciattach: fix poll.h include location
Date: Mon, 19 Jul 2021 13:07:29 +0200
Message-ID: <20210719110819.27340-24-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4666483602029243931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

poll.h header should not be included from include/sys.  This works fine
on Glibc but fails on musl:

    In file included from tools/nciattach.c:42:
    /usr/include/sys/poll.h:1:2: error: #warning redirecting incorrect #inc=
lude <sys/poll.h> to <poll.h> [-Werror=3Dcpp]
        1 | #warning redirecting incorrect #include <sys/poll.h> to <poll.h>

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/nciattach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/nciattach.c b/tools/nciattach.c
index 370f98bb176c..574c0fbe784a 100644
--- a/tools/nciattach.c
+++ b/tools/nciattach.c
@@ -32,6 +32,7 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <unistd.h>
+#include <poll.h>
 #include <stdlib.h>
 #include <string.h>
 #include <signal.h>
@@ -39,7 +40,6 @@
 #include <termios.h>
 #include <time.h>
 #include <sys/time.h>
-#include <sys/poll.h>
 #include <sys/param.h>
 #include <sys/ioctl.h>
 #include <termios.h>
-- =

2.27.0

--===============4666483602029243931==--

