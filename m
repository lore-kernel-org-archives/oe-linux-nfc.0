Content-Type: multipart/mixed; boundary="===============9207969863870147353=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 04/12] nfc: pn533: drop of_match_ptr from device ID table
Date: Fri, 28 May 2021 08:41:52 -0400
Message-ID: <20210528124200.79655-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============9207969863870147353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might be not relevant here).  This
fixes compile warning (!CONFIG_OF):

    drivers/nfc/pn533/i2c.c:252:34: warning:
      =E2=80=98of_pn533_i2c_match=E2=80=99 defined but not used [-Wunused-c=
onst-variable=3D]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn533/uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/pn533/uart.c b/drivers/nfc/pn533/uart.c
index a0665d8ea85b..7bdaf8263070 100644
--- a/drivers/nfc/pn533/uart.c
+++ b/drivers/nfc/pn533/uart.c
@@ -319,7 +319,7 @@ static struct serdev_device_driver pn532_uart_driver =
=3D {
 	.remove =3D pn532_uart_remove,
 	.driver =3D {
 		.name =3D "pn532_uart",
-		.of_match_table =3D of_match_ptr(pn532_uart_of_match),
+		.of_match_table =3D pn532_uart_of_match,
 	},
 };
 =

-- =

2.27.0

--===============9207969863870147353==--

