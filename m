Content-Type: multipart/mixed; boundary="===============2780518415920099878=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 1/9] dt-bindings: net: nfc: s3fwrn5: Convert to dtschema
Date: Sun, 06 Sep 2020 17:36:46 +0200
Message-ID: <20200906153654.2925-2-krzk@kernel.org>
In-Reply-To: <20200906153654.2925-1-krzk@kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2780518415920099878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Convert the Samsung S3FWRN5 NCI NFC controller bindings to dtschema.
This is conversion only so it includes properties with invalid prefixes
(s3fwrn5,en-gpios) which should be addressed later.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/net/nfc/s3fwrn5.txt   | 25 --------
 .../bindings/net/nfc/samsung,s3fwrn5.yaml     | 61 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 62 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt
 create mode 100644 Documentation/devicetree/bindings/net/nfc/samsung,s3fwr=
n5.yaml

diff --git a/Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt b/Docume=
ntation/devicetree/bindings/net/nfc/s3fwrn5.txt
deleted file mode 100644
index f02f6fb7f81c..000000000000
--- a/Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-* Samsung S3FWRN5 NCI NFC Controller
-
-Required properties:
-- compatible: Should be "samsung,s3fwrn5-i2c".
-- reg: address on the bus
-- interrupts: GPIO interrupt to which the chip is connected
-- s3fwrn5,en-gpios: Output GPIO pin used for enabling/disabling the chip
-- s3fwrn5,fw-gpios: Output GPIO pin used to enter firmware mode and
-  sleep/wakeup control
-
-Example:
-
-&hsi2c_4 {
-	s3fwrn5(a)27 {
-		compatible =3D "samsung,s3fwrn5-i2c";
-
-		reg =3D <0x27>;
-
-		interrupt-parent =3D <&gpa1>;
-		interrupts =3D <3 0 0>;
-
-		s3fwrn5,en-gpios =3D <&gpf1 4 0>;
-		s3fwrn5,fw-gpios =3D <&gpj0 2 0>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml=
 b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
new file mode 100644
index 000000000000..81e27cc85dd3
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nfc/s3fwrn5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S3FWRN5 NCI NFC Controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Krzysztof Opasiak <k.opasiak@samsung.com>
+
+properties:
+  compatible:
+    const: samsung,s3fwrn5-i2c
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  s3fwrn5,en-gpios:
+    maxItems: 1
+    description:
+      Output GPIO pin used for enabling/disabling the chip
+
+  s3fwrn5,fw-gpios:
+    maxItems: 1
+    description:
+      Output GPIO pin used to enter firmware mode and sleep/wakeup control
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts
+  - reg
+  - s3fwrn5,en-gpios
+  - s3fwrn5,fw-gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c4 {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        s3fwrn5(a)27 {
+            compatible =3D "samsung,s3fwrn5-i2c";
+            reg =3D <0x27>;
+
+            interrupt-parent =3D <&gpa1>;
+            interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH>;
+
+            s3fwrn5,en-gpios =3D <&gpf1 4 GPIO_ACTIVE_HIGH>;
+            s3fwrn5,fw-gpios =3D <&gpj0 2 GPIO_ACTIVE_HIGH>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ac79fdbdf8d0..ec4f1d9cb3dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15273,6 +15273,7 @@ M:	Robert Baldyga <r.baldyga@samsung.com>
 M:	Krzysztof Opasiak <k.opasiak@samsung.com>
 L:	linux-nfc(a)lists.01.org (moderated for non-subscribers)
 S:	Supported
+F:	Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
 F:	drivers/nfc/s3fwrn5
 =

 SAMSUNG S5C73M3 CAMERA DRIVER
-- =

2.17.1

--===============2780518415920099878==--

