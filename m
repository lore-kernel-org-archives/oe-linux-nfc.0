Content-Type: multipart/mixed; boundary="===============3308873685827521392=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 7/7] dt-bindings: nfc: marvell, nfc: convert to dtschema
Date: Sun, 10 Oct 2021 16:23:17 +0200
Message-ID: <20211010142317.168259-7-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3308873685827521392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Convert the Marvell NCI NFC controller to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/net/nfc/marvell,nci.yaml         | 170 ++++++++++++++++++
 .../devicetree/bindings/net/nfc/nfcmrvl.txt   |  84 ---------
 2 files changed, 170 insertions(+), 84 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/marvell,nci.y=
aml
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt

diff --git a/Documentation/devicetree/bindings/net/nfc/marvell,nci.yaml b/D=
ocumentation/devicetree/bindings/net/nfc/marvell,nci.yaml
new file mode 100644
index 000000000000..15a45db3899a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/marvell,nci.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nfc/marvell,nci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell International Ltd. NCI NFC controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    enum:
+      - marvell,nfc-i2c
+      - marvell,nfc-spi
+      - marvell,nfc-uart
+
+  hci-muxed:
+    type: boolean
+    description: |
+      Specifies that the chip is muxing NCI over HCI frames
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  reset-n-io:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    maxItems: 1
+    description: |
+      Output GPIO pin used to reset the chip (active low)
+
+  i2c-int-falling:
+    type: boolean
+    description: |
+      For I2C type of connection. Specifies that the chip read event shall=
 be
+      trigged on falling edge.
+
+  i2c-int-rising:
+    type: boolean
+    description: |
+      For I2C type of connection.  Specifies that the chip read event shal=
l be
+      trigged on rising edge.
+
+  break-control:
+    type: boolean
+    description: |
+      For UART type of connection. Specifies that the chip needs specific =
break
+      management.
+
+  flow-control:
+    type: boolean
+    description: |
+      For UART type of connection. Specifies that the chip is using RTS/CT=
S.
+
+  spi-cpha: true
+  spi-cpol: true
+  spi-max-frequency: true
+
+required:
+  - compatible
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: marvell,nfc-i2c
+    then:
+      properties:
+        break-control: false
+        flow-control: false
+        spi-cpha: false
+        spi-cpol: false
+        spi-max-frequency: false
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: marvell,nfc-spi
+    then:
+      properties:
+        break-control: false
+        flow-control: false
+        i2c-int-falling: false
+        i2c-int-rising: false
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: marvell,nfc-uart
+    then:
+      properties:
+        i2c-int-falling: false
+        i2c-int-rising: false
+        interrupts: false
+        spi-cpha: false
+        spi-cpol: false
+        spi-max-frequency: false
+        reg: false
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
+            compatible =3D "marvell,nfc-i2c";
+            reg =3D <0x8>;
+
+            interrupt-parent =3D <&gpio3>;
+            interrupts =3D <21 IRQ_TYPE_EDGE_RISING>;
+
+            i2c-int-rising;
+
+            reset-n-io =3D <&gpio3 19 GPIO_ACTIVE_HIGH>;
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
+            compatible =3D "marvell,nfc-spi";
+            reg =3D <0>;
+
+            spi-max-frequency =3D <3000000>;
+            spi-cpha;
+            spi-cpol;
+
+            interrupt-parent =3D <&gpio1>;
+            interrupts =3D <17 IRQ_TYPE_EDGE_RISING>;
+
+            reset-n-io =3D <&gpio3 19 GPIO_ACTIVE_HIGH>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    uart {
+        nfc {
+            compatible =3D "marvell,nfc-uart";
+
+            reset-n-io =3D <&gpio3 16 GPIO_ACTIVE_HIGH>;
+
+            hci-muxed;
+            flow-control;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt b/Docume=
ntation/devicetree/bindings/net/nfc/nfcmrvl.txt
deleted file mode 100644
index c9b35251bb20..000000000000
--- a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
+++ /dev/null
@@ -1,84 +0,0 @@
-* Marvell International Ltd. NCI NFC Controller
-
-Required properties:
-- compatible: Should be:
-  - "marvell,nfc-uart" or "mrvl,nfc-uart" for UART devices
-  - "marvell,nfc-i2c" for I2C devices
-  - "marvell,nfc-spi" for SPI devices
-
-Optional SoC specific properties:
-- pinctrl-names: Contains only one value - "default".
-- pintctrl-0: Specifies the pin control groups used for this controller.
-- reset-n-io: Output GPIO pin used to reset the chip (active low).
-- hci-muxed: Specifies that the chip is muxing NCI over HCI frames.
-
-Optional UART-based chip specific properties:
-- flow-control: Specifies that the chip is using RTS/CTS.
-- break-control: Specifies that the chip needs specific break management.
-
-Optional I2C-based chip specific properties:
-- i2c-int-falling: Specifies that the chip read event shall be trigged on
-  		   falling edge.
-- i2c-int-rising: Specifies that the chip read event shall be trigged on
-  		  rising edge.
-
-Example (for ARM-based BeagleBoard Black with 88W8887 on UART5):
-
-&uart5 {
-
-	nfcmrvluart: nfcmrvluart(a)5 {
-		compatible =3D "marvell,nfc-uart";
-
-		reset-n-io =3D <&gpio3 16 0>;
-
-		hci-muxed;
-		flow-control;
-        }
-};
-
-
-Example (for ARM-based BeagleBoard Black with 88W8887 on I2C1):
-
-&i2c1 {
-	clock-frequency =3D <400000>;
-
-	nfcmrvli2c0: i2c(a)1 {
-		compatible =3D "marvell,nfc-i2c";
-
-		reg =3D <0x8>;
-
-		/* I2C INT configuration */
-		interrupt-parent =3D <&gpio3>;
-		interrupts =3D <21 0>;
-
-		/* I2C INT trigger configuration */
-		i2c-int-rising;
-
-		/* Reset IO */
-		reset-n-io =3D <&gpio3 19 0>;
-	};
-};
-
-
-Example (for ARM-based BeagleBoard Black on SPI0):
-
-&spi0 {
-
-	mrvlnfcspi0: spi(a)0 {
-		compatible =3D "marvell,nfc-spi";
-
-		reg =3D <0>;
-
-		/* SPI Bus configuration */
-		spi-max-frequency =3D <3000000>;
-		spi-cpha;
-		spi-cpol;
-
-		/* SPI INT configuration */
-		interrupt-parent =3D <&gpio1>;
-		interrupts =3D <17 0>;
-
-		/* Reset IO */
-       		reset-n-io =3D <&gpio3 19 0>;
-	};
-};
-- =

2.30.2

--===============3308873685827521392==--

