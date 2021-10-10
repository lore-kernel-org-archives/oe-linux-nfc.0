Content-Type: multipart/mixed; boundary="===============1558112177963431469=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 5/7] dt-bindings: nfc: st, nci: convert to dtschema
Date: Sun, 10 Oct 2021 16:23:15 +0200
Message-ID: <20211010142317.168259-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1558112177963431469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Convert the ST NCI (ST21NFCB) NFC controller to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/net/nfc/st,st-nci.yaml           | 114 ++++++++++++++++++
 .../bindings/net/nfc/st-nci-i2c.txt           |  38 ------
 .../bindings/net/nfc/st-nci-spi.txt           |  36 ------
 3 files changed, 114 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt

diff --git a/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml b/Doc=
umentation/devicetree/bindings/net/nfc/st,st-nci.yaml
new file mode 100644
index 000000000000..4486ae75f8a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nfc/st,st-nci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics ST NCI NFC controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    enum:
+      - st,st21nfcb-i2c
+      - st,st21nfcb-spi
+      - st,st21nfcc-i2c
+
+  clock-frequency: true
+
+  reset-gpios:
+    description: Output GPIO pin used for resetting the controller
+
+  ese-present:
+    type: boolean
+    description: |
+      Specifies that an ese is physically connected to the controller
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency: true
+
+  uicc-present:
+    type: boolean
+    description: |
+      Specifies that the uicc swp signal can be physically connected to the
+      controller
+
+required:
+  - compatible
+  - interrupts
+  - reg
+  - reset-gpios
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - st,st21nfcb-i2c
+          - st,st21nfcc-i2c
+then:
+  properties:
+    spi-max-frequency: false
+  required:
+    - clock-frequency
+else:
+  properties:
+    clock-frequency: false
+  required:
+    - spi-max-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        nfc(a)8 {
+            compatible =3D "st,st21nfcb-i2c";
+            reg =3D <0x08>;
+
+            clock-frequency =3D <400000>;
+
+            interrupt-parent =3D <&gpio5>;
+            interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>;
+            reset-gpios =3D <&gpio5 29 GPIO_ACTIVE_HIGH>;
+
+            ese-present;
+            uicc-present;
+        };
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        nfc(a)0 {
+            compatible =3D "st,st21nfcb-spi";
+            reg =3D <0>;
+
+            spi-max-frequency =3D <4000000>;
+
+            interrupt-parent =3D <&gpio5>;
+            interrupts =3D <2 IRQ_TYPE_EDGE_RISING>;
+            reset-gpios =3D <&gpio5 29 GPIO_ACTIVE_HIGH>;
+
+            ese-present;
+            uicc-present;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt b/Doc=
umentation/devicetree/bindings/net/nfc/st-nci-i2c.txt
deleted file mode 100644
index baa8f8133d19..000000000000
--- a/Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-* STMicroelectronics SAS. ST NCI NFC Controller
-
-Required properties:
-- compatible: Should be "st,st21nfcb-i2c" or "st,st21nfcc-i2c".
-- clock-frequency: I=C2=B2C work frequency.
-- reg: address on the bus
-- interrupts: GPIO interrupt to which the chip is connected
-- reset-gpios: Output GPIO pin used to reset the ST21NFCB
-
-Optional SoC Specific Properties:
-- pinctrl-names: Contains only one value - "default".
-- pintctrl-0: Specifies the pin control groups used for this controller.
-- ese-present: Specifies that an ese is physically connected to the nfc
-controller.
-- uicc-present: Specifies that the uicc swp signal can be physically
-connected to the nfc controller.
-
-Example (for ARM-based BeagleBoard xM with ST21NFCB on I2C2):
-
-&i2c2 {
-
-
-	st21nfcb: st21nfcb(a)8 {
-
-		compatible =3D "st,st21nfcb-i2c";
-
-		reg =3D <0x08>;
-		clock-frequency =3D <400000>;
-
-		interrupt-parent =3D <&gpio5>;
-		interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>;
-
-		reset-gpios =3D <&gpio5 29 GPIO_ACTIVE_HIGH>;
-
-		ese-present;
-		uicc-present;
-	};
-};
diff --git a/Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt b/Doc=
umentation/devicetree/bindings/net/nfc/st-nci-spi.txt
deleted file mode 100644
index d33343330b94..000000000000
--- a/Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* STMicroelectronics SAS. ST NCI NFC Controller
-
-Required properties:
-- compatible: Should be "st,st21nfcb-spi"
-- spi-max-frequency: Maximum SPI frequency (<=3D 4000000).
-- interrupts: GPIO interrupt to which the chip is connected
-- reset-gpios: Output GPIO pin used to reset the ST21NFCB
-
-Optional SoC Specific Properties:
-- pinctrl-names: Contains only one value - "default".
-- pintctrl-0: Specifies the pin control groups used for this controller.
-- ese-present: Specifies that an ese is physically connected to the nfc
-controller.
-- uicc-present: Specifies that the uicc swp signal can be physically
-connected to the nfc controller.
-
-Example (for ARM-based BeagleBoard xM with ST21NFCB on SPI4):
-
-&mcspi4 {
-
-
-	st21nfcb: st21nfcb@0 {
-
-		compatible =3D "st,st21nfcb-spi";
-
-		clock-frequency =3D <4000000>;
-
-		interrupt-parent =3D <&gpio5>;
-		interrupts =3D <2 IRQ_TYPE_EDGE_RISING>;
-
-		reset-gpios =3D <&gpio5 29 GPIO_ACTIVE_HIGH>;
-
-		ese-present;
-		uicc-present;
-	};
-};
-- =

2.30.2

--===============1558112177963431469==--

