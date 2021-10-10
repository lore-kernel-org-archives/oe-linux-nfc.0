Content-Type: multipart/mixed; boundary="===============1415294263328848221=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 2/7] dt-bindings: nfc: nxp, pn532: convert to dtschema
Date: Sun, 10 Oct 2021 16:23:12 +0200
Message-ID: <20211010142317.168259-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1415294263328848221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Convert the NXP PN532 NFC controller to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/net/nfc/nxp,pn532.yaml           | 70 +++++++++++++++++++
 .../devicetree/bindings/net/nfc/pn532.txt     | 46 ------------
 2 files changed, 70 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/nxp,pn532.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/pn532.txt

diff --git a/Documentation/devicetree/bindings/net/nfc/nxp,pn532.yaml b/Doc=
umentation/devicetree/bindings/net/nfc/nxp,pn532.yaml
new file mode 100644
index 000000000000..c6f41b483297
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/nxp,pn532.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nfc/nxp,pn532.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Semiconductors PN532 NFC controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,pn532
+      - description: Deprecated bindings
+        enum:
+          - nxp,pn532-i2c
+          - nxp,pn533-i2c
+        deprecated: true
+
+  clock-frequency:
+    description: Required if connected via I2C
+
+  interrupts:
+    description: Required if connected via I2C
+    maxItems: 1
+
+  reg:
+    description: Required if connected via I2C
+    maxItems: 1
+
+required:
+  - compatible
+
+dependencies:
+  clock-frequency: [ 'reg' ]
+  interrupts: [ 'reg' ]
+
+additionalProperties: false
+
+examples:
+  # PN532 on I2C bus
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        nfc(a)24 {
+            compatible =3D "nxp,pn532";
+
+            reg =3D <0x24>;
+            clock-frequency =3D <400000>;
+
+            interrupt-parent =3D <&gpio1>;
+            interrupts =3D <17 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+
+  # PN532 connected via UART
+  - |
+    serial(a)49042000 {
+        reg =3D <0x49042000 0x400>;
+
+        nfc {
+            compatible =3D "nxp,pn532";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/nfc/pn532.txt b/Document=
ation/devicetree/bindings/net/nfc/pn532.txt
deleted file mode 100644
index a5507dc499bc..000000000000
--- a/Documentation/devicetree/bindings/net/nfc/pn532.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-* NXP Semiconductors PN532 NFC Controller
-
-Required properties:
-- compatible: Should be
-    - "nxp,pn532" Place a node with this inside the devicetree node of the=
 bus
-                  where the NFC chip is connected to.
-                  Currently the kernel has phy bindings for uart and i2c.
-    - "nxp,pn532-i2c" (DEPRECATED) only works for the i2c binding.
-    - "nxp,pn533-i2c" (DEPRECATED) only works for the i2c binding.
-
-Required properties if connected on i2c:
-- clock-frequency: I=C2=B2C work frequency.
-- reg: for the I=C2=B2C bus address. This is fixed at 0x24 for the PN532.
-- interrupts: GPIO interrupt to which the chip is connected
-
-Optional SoC Specific Properties:
-- pinctrl-names: Contains only one value - "default".
-- pintctrl-0: Specifies the pin control groups used for this controller.
-
-Example (for ARM-based BeagleBone with PN532 on I2C2):
-
-&i2c2 {
-
-
-	pn532: nfc(a)24 {
-
-		compatible =3D "nxp,pn532";
-
-		reg =3D <0x24>;
-		clock-frequency =3D <400000>;
-
-		interrupt-parent =3D <&gpio1>;
-		interrupts =3D <17 IRQ_TYPE_EDGE_FALLING>;
-
-	};
-};
-
-Example (for PN532 connected via uart):
-
-uart4: serial(a)49042000 {
-        compatible =3D "ti,omap3-uart";
-
-        pn532: nfc {
-                compatible =3D "nxp,pn532";
-        };
-};
-- =

2.30.2

--===============1415294263328848221==--

