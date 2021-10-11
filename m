Content-Type: multipart/mixed; boundary="===============1188155716822908987=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 1/8] dt-bindings: nfc: nxp, nci: convert to dtschema
Date: Mon, 11 Oct 2021 09:39:27 +0200
Message-ID: <20211011073934.34340-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211011073934.34340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1188155716822908987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Convert the NXP NCI NFC controller to DT schema format.

Drop the "clock-frequency" property during conversion because it is a
property of I2C bus controller, not I2C slave device.  It was also never
used by the driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/net/nfc/nxp,nci.yaml  | 57 +++++++++++++++++++
 .../devicetree/bindings/net/nfc/nxp-nci.txt   | 33 -----------
 MAINTAINERS                                   |  1 +
 3 files changed, 58 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/nxp-nci.txt

diff --git a/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml b/Docum=
entation/devicetree/bindings/net/nfc/nxp,nci.yaml
new file mode 100644
index 000000000000..70634d20d4d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nfc/nxp,nci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Semiconductors NCI NFC controller
+
+maintainers:
+  - Charles Gorand <charles.gorand@effinnov.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    const: nxp,nxp-nci-i2c
+
+  enable-gpios:
+    description: Output GPIO pin used for enabling/disabling the controller
+
+  firmware-gpios:
+    description: Output GPIO pin used to enter firmware download mode
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - enable-gpios
+  - interrupts
+  - reg
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
+        nfc(a)29 {
+            compatible =3D "nxp,nxp-nci-i2c";
+
+            reg =3D <0x29>;
+
+            interrupt-parent =3D <&gpio1>;
+            interrupts =3D <29 IRQ_TYPE_LEVEL_HIGH>;
+
+            enable-gpios =3D <&gpio0 30 GPIO_ACTIVE_HIGH>;
+            firmware-gpios =3D <&gpio0 31 GPIO_ACTIVE_HIGH>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/nfc/nxp-nci.txt b/Docume=
ntation/devicetree/bindings/net/nfc/nxp-nci.txt
deleted file mode 100644
index 285a37c2f189..000000000000
--- a/Documentation/devicetree/bindings/net/nfc/nxp-nci.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-* NXP Semiconductors NXP NCI NFC Controllers
-
-Required properties:
-- compatible: Should be "nxp,nxp-nci-i2c".
-- clock-frequency: I=C2=B2C work frequency.
-- reg: address on the bus
-- interrupts: GPIO interrupt to which the chip is connected
-- enable-gpios: Output GPIO pin used for enabling/disabling the chip
-
-Optional SoC Specific Properties:
-- pinctrl-names: Contains only one value - "default".
-- pintctrl-0: Specifies the pin control groups used for this controller.
-- firmware-gpios: Output GPIO pin used to enter firmware download mode
-
-Example (for ARM-based BeagleBone with NPC100 NFC controller on I2C2):
-
-&i2c2 {
-
-
-	npc100: npc100(a)29 {
-
-		compatible =3D "nxp,nxp-nci-i2c";
-
-		reg =3D <0x29>;
-		clock-frequency =3D <100000>;
-
-		interrupt-parent =3D <&gpio1>;
-		interrupts =3D <29 IRQ_TYPE_LEVEL_HIGH>;
-
-		enable-gpios =3D <&gpio0 30 GPIO_ACTIVE_HIGH>;
-		firmware-gpios =3D <&gpio0 31 GPIO_ACTIVE_HIGH>;
-	};
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 7cfd63ce7122..3294aaf5e56c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13632,6 +13632,7 @@ NXP-NCI NFC DRIVER
 R:	Charles Gorand <charles.gorand@effinnov.com>
 L:	linux-nfc(a)lists.01.org (subscribers-only)
 S:	Supported
+F:	Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
 F:	drivers/nfc/nxp-nci
 =

 NXP i.MX 8QXP/8QM JPEG V4L2 DRIVER
-- =

2.30.2

--===============1188155716822908987==--

