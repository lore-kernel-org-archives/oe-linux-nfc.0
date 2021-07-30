Content-Type: multipart/mixed; boundary="===============7597517306806807626=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v3 3/7] nfc: hci: annotate nfc_llc_init() as __init
Date: Fri, 30 Jul 2021 16:41:58 +0200
Message-ID: <20210730144202.255890-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7597517306806807626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The nfc_llc_init() is used only in other __init annotated context.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/hci/llc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/hci/llc.c b/net/nfc/hci/llc.c
index fc6b63de3462..2140f6724644 100644
--- a/net/nfc/hci/llc.c
+++ b/net/nfc/hci/llc.c
@@ -11,7 +11,7 @@
 =

 static LIST_HEAD(llc_engines);
 =

-int nfc_llc_init(void)
+int __init nfc_llc_init(void)
 {
 	int r;
 =

-- =

2.27.0

--===============7597517306806807626==--

