Content-Type: multipart/mixed; boundary="===============8788328114147997521=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 3/3] include: sync nfc_copy.h with Linux kernel v5.17-rc4
Date: Mon, 14 Feb 2022 13:31:10 +0100
Message-ID: <20220214123110.27056-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214123110.27056-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8788328114147997521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use include/uapi/linux/nfc.h from Linux kernel v5.17-rc4.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/nfc_copy.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/nfc_copy.h b/include/nfc_copy.h
index f6e3c8c9c744..4fa4e979e948 100644
--- a/include/nfc_copy.h
+++ b/include/nfc_copy.h
@@ -263,7 +263,7 @@ enum nfc_sdp_attr {
 #define NFC_SE_ENABLED  0x1
 =

 struct sockaddr_nfc {
-	sa_family_t sa_family;
+	__kernel_sa_family_t sa_family;
 	__u32 dev_idx;
 	__u32 target_idx;
 	__u32 nfc_protocol;
@@ -271,14 +271,14 @@ struct sockaddr_nfc {
 =

 #define NFC_LLCP_MAX_SERVICE_NAME 63
 struct sockaddr_nfc_llcp {
-	sa_family_t sa_family;
+	__kernel_sa_family_t sa_family;
 	__u32 dev_idx;
 	__u32 target_idx;
 	__u32 nfc_protocol;
 	__u8 dsap; /* Destination SAP, if known */
 	__u8 ssap; /* Source SAP to be bound to */
 	char service_name[NFC_LLCP_MAX_SERVICE_NAME]; /* Service name URI */;
-	size_t service_name_len;
+	__kernel_size_t service_name_len;
 };
 =

 /* NFC socket protocols */
-- =

2.32.0

--===============8788328114147997521==--

