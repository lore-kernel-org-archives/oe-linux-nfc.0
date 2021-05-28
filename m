Content-Type: multipart/mixed; boundary="===============2979335349051563402=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 05/11] nfc: mrvl: simplify with module_driver
Date: Fri, 28 May 2021 10:55:28 -0400
Message-ID: <20210528145534.125460-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528145534.125460-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2979335349051563402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Remove standard module init/exit boilerplate with module_driver() which
also annotates the functions with __init.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/uart.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index ed85645eb885..50d86c90b9dd 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -189,23 +189,7 @@ static struct nci_uart nfcmrvl_nci_uart =3D {
 		.tx_done	=3D nfcmrvl_nci_uart_tx_done,
 	}
 };
-
-/*
-** Module init
-*/
-
-static int nfcmrvl_uart_init_module(void)
-{
-	return nci_uart_register(&nfcmrvl_nci_uart);
-}
-
-static void nfcmrvl_uart_exit_module(void)
-{
-	nci_uart_unregister(&nfcmrvl_nci_uart);
-}
-
-module_init(nfcmrvl_uart_init_module);
-module_exit(nfcmrvl_uart_exit_module);
+module_driver(nfcmrvl_nci_uart, nci_uart_register, nci_uart_unregister);
 =

 MODULE_AUTHOR("Marvell International Ltd.");
 MODULE_DESCRIPTION("Marvell NFC-over-UART");
-- =

2.27.0

--===============2979335349051563402==--

