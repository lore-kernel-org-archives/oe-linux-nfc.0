Content-Type: multipart/mixed; boundary="===============8887011602691337161=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next 1/2] dt-bindings: net: nfc: s3fwrn5: Change I2C interrupt trigger type
Date: Tue, 08 Dec 2020 23:10:11 +0900
Message-ID: <20201208141012.6033-2-bongsu.jeon@samsung.com>
In-Reply-To: <20201208141012.6033-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8887011602691337161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Change interrupt trigger from IRQ_TYPE_LEVEL_HIGH to IRQ_TYPE_EDGE_RISING
 for stable NFC I2C interrupt handling.
Samsung's NFC Firmware sends an i2c frame as below.
1. NFC Firmware sets the GPIO(interrupt pin) high when there is an i2c
 frame to send.
2. If the CPU's I2C master has received the i2c frame, NFC F/W sets the
GPIO low.
NFC driver's i2c interrupt handler would be called in the abnormal case
as the NFC FW task of number 2 is delayed because of other high priority
tasks.
In that case, NFC driver will try to receive the i2c frame but there isn't
 any i2c frame to send in NFC.
It would cause an I2C communication problem. This case would hardly happen.
But, I changed the interrupt as a defense code.
If Driver uses the TRIGGER_RISING instead of the LEVEL trigger,
there would be no problem even if the NFC FW task is delayed.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml=
 b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
index ca3904bf90e0..477066e2b821 100644
--- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -76,7 +76,7 @@ examples:
             reg =3D <0x27>;
 =

             interrupt-parent =3D <&gpa1>;
-            interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH>;
+            interrupts =3D <3 IRQ_TYPE_EDGE_RISING>;
 =

             en-gpios =3D <&gpf1 4 GPIO_ACTIVE_HIGH>;
             wake-gpios =3D <&gpj0 2 GPIO_ACTIVE_HIGH>;
-- =

2.17.1

--===============8887011602691337161==--

