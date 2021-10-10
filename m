Content-Type: multipart/mixed; boundary="===============4523284250159401170=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 3/7] dt-bindings: nfc: st, st21nfca: convert to dtschema
Date: Sun, 10 Oct 2021 16:23:13 +0200
Message-ID: <20211010142317.168259-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4523284250159401170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Convert the ST ST21NFCA NFC controller to DT schema format.  The
conversion also adds a new required property - interrupts - because it
was missing in the old bindings by mistake.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/net/nfc/st,st21nfca.yaml         | 68 +++++++++++++++++++
 .../devicetree/bindings/net/nfc/st21nfca.txt  | 37 ----------
 2 files changed, 68 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/st,st21nfca.y=
aml
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/st21nfca.txt

diff --git a/Documentation/devicetree/bindings/net/nfc/st,st21nfca.yaml b/D=
ocumentation/devicetree/bindings/net/nfc/st,st21nfca.yaml
new file mode 100644
index 000000000000..2cb65fd517ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/st,st21nfca.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nfc/st,st21nfca.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics SAS ST21NFCA NFC controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    const: st,st21nfca-i2c
+
+  clock-frequency: true
+
+  enable-gpios:
+    description: Output GPIO pin used for enabling/disabling the controller
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
+  uicc-present:
+    type: boolean
+    description: |
+      Specifies that the uicc swp signal can be physically connected to the
+      controller
+
+required:
+  - compatible
+  - clock-frequency
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
+        nfc(a)1 {
+            compatible =3D "st,st21nfca-i2c";
+            reg =3D <0x1>;
+
+            clock-frequency =3D <400000>;
+            interrupt-parent =3D <&gpio5>;
+            interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
+            enable-gpios =3D <&gpio5 29 GPIO_ACTIVE_HIGH>;
+
+            ese-present;
+            uicc-present;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/nfc/st21nfca.txt b/Docum=
entation/devicetree/bindings/net/nfc/st21nfca.txt
deleted file mode 100644
index b8bd90f80e12..000000000000
--- a/Documentation/devicetree/bindings/net/nfc/st21nfca.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-* STMicroelectronics SAS. ST21NFCA NFC Controller
-
-Required properties:
-- compatible: Should be "st,st21nfca-i2c".
-- clock-frequency: I=C2=B2C work frequency.
-- reg: address on the bus
-- enable-gpios: Output GPIO pin used for enabling/disabling the ST21NFCA
-
-Optional SoC Specific Properties:
-- pinctrl-names: Contains only one value - "default".
-- pintctrl-0: Specifies the pin control groups used for this controller.
-- ese-present: Specifies that an ese is physically connected to the nfc
-controller.
-- uicc-present: Specifies that the uicc swp signal can be physically
-connected to the nfc controller.
-
-Example (for ARM-based BeagleBoard xM with ST21NFCA on I2C2):
-
-&i2c2 {
-
-
-	st21nfca: st21nfca(a)1 {
-
-		compatible =3D "st,st21nfca-i2c";
-
-		reg =3D <0x01>;
-		clock-frequency =3D <400000>;
-
-		interrupt-parent =3D <&gpio5>;
-		interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
-
-		enable-gpios =3D <&gpio5 29 GPIO_ACTIVE_HIGH>;
-
-		ese-present;
-		uicc-present;
-	};
-};
-- =

2.30.2

--===============4523284250159401170==--

