Content-Type: multipart/mixed; boundary="===============3610949820197446222=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 1/4] include: include endian.h to fix missing __BYTE_ORDER definition on Debian Stretch
Date: Sun, 07 Nov 2021 18:26:16 +0100
Message-ID: <20211107172619.13560-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3610949820197446222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Code should pull explicitly headers for necessary symbols instead of
relying on dependencies.  Lack of endian.h caused build failures on
Debian Stretch:

    In file included from tools/nfctool/ndef-decode.c:28:0:
    include/near/types.h:43:5: error: "__BYTE_ORDER" is not defined [-Werro=
r=3Dundef]
     #if __BYTE_ORDER =3D=3D __LITTLE_ENDIAN

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/types.h b/include/types.h
index c4a8d6a31886..1dd8de530d58 100644
--- a/include/types.h
+++ b/include/types.h
@@ -23,6 +23,7 @@
 #define __NEAR_TYPES_H
 =

 #include <byteswap.h>
+#include <endian.h>
 =

 #define near_get_unaligned(ptr)			\
 ({						\
-- =

2.32.0

--===============3610949820197446222==--

