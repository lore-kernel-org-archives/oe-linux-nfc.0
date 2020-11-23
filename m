Content-Type: multipart/mixed; boundary="===============4941418680244298086=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon@samsung.com>
To: linux-nfc@lists.01.org
Subject: [PATCH net-next 1/2] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
Date: Mon, 23 Nov 2020 16:55:26 +0900
Message-ID: <20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0@epcms2p5>
In-Reply-To: <CGME20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0@epcms2p5>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4941418680244298086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since S3FWRN82 NFC Chip, The UART interface can be used.
S3FWRN82 supports I2C and UART interface.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 .../bindings/net/nfc/samsung,s3fwrn5.yaml     | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml=
 b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
index cb0b8a560282..37b3e5ae5681 100644
--- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -13,6 +13,7 @@ maintainers:
 properties:
   compatible:
     const: samsung,s3fwrn5-i2c
+    const: samsung,s3fwrn82-uart
 =

   en-gpios:
     maxItems: 1
@@ -47,10 +48,19 @@ additionalProperties: false
 required:
   - compatible
   - en-gpios
-  - interrupts
-  - reg
   - wake-gpios
 =

+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s3fwrn5-i2c
+    then:
+      required:
+        - interrupts
+        - reg
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
@@ -71,3 +81,17 @@ examples:
             wake-gpios =3D <&gpj0 2 GPIO_ACTIVE_HIGH>;
         };
     };
+  # UART example on Raspberry Pi
+  - |
+    &uart0 {
+        status =3D "okay";
+
+        s3fwrn82_uart {
+            compatible =3D "samsung,s3fwrn82-uart";
+
+            en-gpios =3D <&gpio 20 0>;
+            wake-gpios =3D <&gpio 16 0>;
+
+            status =3D "okay";
+        };
+    };
-- =

2.17.1

--===============4941418680244298086==--

