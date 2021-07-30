Content-Type: multipart/mixed; boundary="===============5542217659490654566=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v3 2/7] nfc: annotate af_nfc_exit() as __exit
Date: Fri, 30 Jul 2021 16:41:57 +0200
Message-ID: <20210730144202.255890-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5542217659490654566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The af_nfc_exit() is used only in other __exit annotated context
(nfc_exit()).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/af_nfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/af_nfc.c b/net/nfc/af_nfc.c
index 4a9e72073564..6024fad905ff 100644
--- a/net/nfc/af_nfc.c
+++ b/net/nfc/af_nfc.c
@@ -79,7 +79,7 @@ int __init af_nfc_init(void)
 	return sock_register(&nfc_sock_family_ops);
 }
 =

-void af_nfc_exit(void)
+void __exit af_nfc_exit(void)
 {
 	sock_unregister(PF_NFC);
 }
-- =

2.27.0

--===============5542217659490654566==--

