Content-Type: multipart/mixed; boundary="===============8985647712943412691=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 17/73] se: fix multiple apdu definitions
Date: Mon, 19 Jul 2021 13:07:23 +0200
Message-ID: <20210719110819.27340-18-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8985647712943412691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fixes:

    /usr/bin/ld: se/seeld-manager.o:se/seel.h:31: multiple definition of `a=
pdu'; se/seeld-main.o:se/seel.h:31: first defined here
    /usr/bin/ld: se/seeld-se.o:se/seel.h:31: multiple definition of `apdu';=
 se/seeld-main.o:se/seel.h:31: first defined here
    /usr/bin/ld: se/seeld-driver.o:se/seel.h:31: multiple definition of `ap=
du'; se/seeld-main.o:se/seel.h:31: first defined here
    /usr/bin/ld: se/seeld-apdu.o:se/seel.h:31: multiple definition of `apdu=
'; se/seeld-main.o:se/seel.h:31: first defined here
    /usr/bin/ld: se/seeld-channel.o:se/seel.h:31: multiple definition of `a=
pdu'; se/seeld-main.o:se/seel.h:31: first defined here
    /usr/bin/ld: se/seeld-ace.o:se/seel.h:31: multiple definition of `apdu'=
; se/seeld-main.o:se/seel.h:31: first defined here

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 se/seel.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/se/seel.h b/se/seel.h
index 24cd0011ffb7..ea89e1519764 100644
--- a/se/seel.h
+++ b/se/seel.h
@@ -28,7 +28,7 @@
 struct seel_se;
 struct seel_channel;
 struct seel_ace;
-struct seel_apdu *apdu;
+struct seel_apdu;
 =

 int __seel_manager_init(DBusConnection *conn);
 void __seel_manager_cleanup(void);
-- =

2.27.0

--===============8985647712943412691==--

