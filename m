Content-Type: multipart/mixed; boundary="===============8421914211985534386=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 6/7] dt-bindings: nfc: ti, trf7970a: convert to dtschema
Date: Sun, 10 Oct 2021 16:23:16 +0200
Message-ID: <20211010142317.168259-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8421914211985534386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Convert the TI TRF7970A NFC to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/net/nfc/ti,trf7970a.yaml         | 98 +++++++++++++++++++
 .../devicetree/bindings/net/nfc/trf7970a.txt  | 43 --------
 MAINTAINERS                                   |  2 +-
 3 files changed, 99 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/ti,trf7970a.y=
aml
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/trf7970a.txt

diff --git a/Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml b/D=
ocumentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml
new file mode 100644
index 000000000000..40da2ac98978
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nfc/ti,trf7970a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TRF7970A RFID/NFC/15693 Transceiver
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Mark Greer <mgreer@animalcreek.com>
+
+properties:
+  compatible:
+    const: ti,trf7970a
+
+  autosuspend-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Specify autosuspend delay in milliseconds.
+
+  clock-frequency:
+    description: |
+      Set to specify that the input frequency to the trf7970a is 13560000H=
z or
+      27120000Hz
+
+  en2-rf-quirk:
+    type: boolean
+    description: |
+      Specify that the trf7970a being used has the "EN2 RF" erratum
+
+  interrupts:
+    maxItems: 1
+
+  irq-status-read-quirk:
+    type: boolean
+    description: |
+      Specify that the trf7970a being used has the "IRQ Status Read" errat=
um
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency: true
+
+  ti,enable-gpios:
+    minItems: 1
+    maxItems: 2
+    description: |
+      One or two GPIO entries used for 'EN' and 'EN2' pins on the TRF7970A=
. EN2
+      is optional.
+
+  vdd-io-supply:
+    description: |
+      Regulator specifying voltage for VDD-IO
+
+  vin-supply:
+    description: |
+      Regulator for supply voltage to VIN pin
+
+required:
+  - compatible
+  - interrupts
+  - reg
+  - spi-max-frequency
+  - ti,enable-gpios
+  - vin-supply
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
+        nfc(a)0 {
+            compatible =3D "ti,trf7970a";
+            reg =3D <0>;
+
+            pinctrl-names =3D "default";
+            pinctrl-0 =3D <&trf7970a_default>;
+            spi-max-frequency =3D <2000000>;
+            interrupt-parent =3D <&gpio2>;
+            interrupts =3D <14 0>;
+
+            ti,enable-gpios =3D <&gpio2 2 GPIO_ACTIVE_HIGH>,
+                              <&gpio2 5 GPIO_ACTIVE_HIGH>;
+            vin-supply =3D <&ldo3_reg>;
+            vdd-io-supply =3D <&ldo2_reg>;
+            autosuspend-delay =3D <30000>;
+            irq-status-read-quirk;
+            en2-rf-quirk;
+            clock-frequency =3D <27120000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/nfc/trf7970a.txt b/Docum=
entation/devicetree/bindings/net/nfc/trf7970a.txt
deleted file mode 100644
index ba1934b950e5..000000000000
--- a/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-* Texas Instruments TRF7970A RFID/NFC/15693 Transceiver
-
-Required properties:
-- compatible: Should be "ti,trf7970a".
-- spi-max-frequency: Maximum SPI frequency (<=3D 2000000).
-- interrupts: A single interrupt specifier.
-- ti,enable-gpios: One or two GPIO entries used for 'EN' and 'EN2' pins on=
 the
-  TRF7970A. EN2 is optional.
-- vin-supply: Regulator for supply voltage to VIN pin
-
-Optional SoC Specific Properties:
-- pinctrl-names: Contains only one value - "default".
-- pintctrl-0: Specifies the pin control groups used for this controller.
-- autosuspend-delay: Specify autosuspend delay in milliseconds.
-- irq-status-read-quirk: Specify that the trf7970a being used has the
-  "IRQ Status Read" erratum.
-- en2-rf-quirk: Specify that the trf7970a being used has the "EN2 RF"
-  erratum.
-- vdd-io-supply: Regulator specifying voltage for vdd-io
-- clock-frequency: Set to specify that the input frequency to the trf7970a=
 is 13560000Hz or 27120000Hz
-
-Example (for ARM-based BeagleBone with TRF7970A on SPI1):
-
-&spi1 {
-
-	nfc@0 {
-		compatible =3D "ti,trf7970a";
-		reg =3D <0>;
-		pinctrl-names =3D "default";
-		pinctrl-0 =3D <&trf7970a_default>;
-		spi-max-frequency =3D <2000000>;
-		interrupt-parent =3D <&gpio2>;
-		interrupts =3D <14 0>;
-		ti,enable-gpios =3D <&gpio2 2 GPIO_ACTIVE_HIGH>,
-				  <&gpio2 5 GPIO_ACTIVE_HIGH>;
-		vin-supply =3D <&ldo3_reg>;
-		vdd-io-supply =3D <&ldo2_reg>;
-		autosuspend-delay =3D <30000>;
-		irq-status-read-quirk;
-		en2-rf-quirk;
-		clock-frequency =3D <27120000>;
-	};
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 3294aaf5e56c..23dd7aac38a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18916,7 +18916,7 @@ M:	Mark Greer <mgreer@animalcreek.com>
 L:	linux-wireless(a)vger.kernel.org
 L:	linux-nfc(a)lists.01.org (subscribers-only)
 S:	Supported
-F:	Documentation/devicetree/bindings/net/nfc/trf7970a.txt
+F:	Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml
 F:	drivers/nfc/trf7970a.c
 =

 TI TSC2046 ADC DRIVER
-- =

2.30.2

--===============8421914211985534386==--

