Content-Type: multipart/mixed; boundary="===============9027023342229807001=="
MIME-Version: 1.0
From: Bongsu jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next 1/4] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
Date: Mon, 30 Nov 2020 21:00:27 +0900
Message-ID: <1606737627-29485-1-git-send-email-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============9027023342229807001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Since S3FWRN82 NFC Chip, The UART interface can be used.
S3FWRN82 supports I2C and UART interface.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---

Changes in v2:
 -change the compatible name.
 -change the const to enum for compatible.
 -change the node name to nfc.

 .../bindings/net/nfc/samsung,s3fwrn5.yaml          | 32 ++++++++++++++++++=
++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml=
 b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
index cb0b8a5..481bbcc 100644
--- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -12,7 +12,10 @@ maintainers:
 =

 properties:
   compatible:
-    const: samsung,s3fwrn5-i2c
+    oneOf:
+      - enum:
+        - samsung,s3fwrn5-i2c
+        - samsung,s3fwrn82
 =

   en-gpios:
     maxItems: 1
@@ -47,10 +50,19 @@ additionalProperties: false
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
@@ -71,3 +83,17 @@ examples:
             wake-gpios =3D <&gpj0 2 GPIO_ACTIVE_HIGH>;
         };
     };
+  # UART example on Raspberry Pi
+  - |
+    uart0 {
+        status =3D "okay";
+
+        nfc {
+            compatible =3D "samsung,s3fwrn82";
+
+            en-gpios =3D <&gpio 20 0>;
+            wake-gpios =3D <&gpio 16 0>;
+
+            status =3D "okay";
+        };
+    };
-- =

1.9.1

--===============9027023342229807001==--

