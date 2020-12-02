Content-Type: multipart/mixed; boundary="===============8323722457040477091=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v5 net-next 1/4] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
Date: Wed, 02 Dec 2020 20:47:38 +0900
Message-ID: <1606909661-3814-2-git-send-email-bongsu.jeon@samsung.com>
In-Reply-To: <1606909661-3814-1-git-send-email-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8323722457040477091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Since S3FWRN82 NFC Chip, The UART interface can be used.
S3FWRN82 supports I2C and UART interface.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 .../bindings/net/nfc/samsung,s3fwrn5.yaml          | 31 ++++++++++++++++++=
+---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml=
 b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
index cb0b8a5..ca3904b 100644
--- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -12,7 +12,9 @@ maintainers:
 =

 properties:
   compatible:
-    const: samsung,s3fwrn5-i2c
+    enum:
+      - samsung,s3fwrn5-i2c
+      - samsung,s3fwrn82
 =

   en-gpios:
     maxItems: 1
@@ -47,10 +49,19 @@ additionalProperties: false
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
@@ -71,3 +82,17 @@ examples:
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
+            en-gpios =3D <&gpio 20 GPIO_ACTIVE_HIGH>;
+            wake-gpios =3D <&gpio 16 GPIO_ACTIVE_HIGH>;
+
+            status =3D "okay";
+        };
+    };
-- =

1.9.1

--===============8323722457040477091==--

