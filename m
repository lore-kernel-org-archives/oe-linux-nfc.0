Content-Type: multipart/mixed; boundary="===============5590558457105992950=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: [PATCH v3 2/8] dt-bindings: net: nfc: s3fwrn5: Remove wrong vendor prefix from GPIOs
Date: Thu, 10 Sep 2020 18:12:13 +0200
Message-ID: <20200910161219.6237-3-krzk@kernel.org>
In-Reply-To: <20200910161219.6237-1-krzk@kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5590558457105992950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The device tree property prefix describes the vendor, which in case of
S3FWRN5 chip is Samsung.  Therefore the "s3fwrn5" prefix for "en-gpios"
and "fw-gpios" is not correct and should be deprecated.  Introduce
properly named properties for these GPIOs and rename the fw-gpios" to
"wake-gpios" to better describe its purpose.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../bindings/net/nfc/samsung,s3fwrn5.yaml     | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml=
 b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
index f43d31a2d94b..cb0b8a560282 100644
--- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -14,30 +14,42 @@ properties:
   compatible:
     const: samsung,s3fwrn5-i2c
 =

+  en-gpios:
+    maxItems: 1
+    description:
+      Output GPIO pin used for enabling/disabling the chip
+
   interrupts:
     maxItems: 1
 =

   reg:
     maxItems: 1
 =

+  wake-gpios:
+    maxItems: 1
+    description:
+      Output GPIO pin used to enter firmware mode and sleep/wakeup control
+
   s3fwrn5,en-gpios:
     maxItems: 1
+    deprecated: true
     description:
-      Output GPIO pin used for enabling/disabling the chip
+      Use en-gpios
 =

   s3fwrn5,fw-gpios:
     maxItems: 1
+    deprecated: true
     description:
-      Output GPIO pin used to enter firmware mode and sleep/wakeup control
+      Use wake-gpios
 =

 additionalProperties: false
 =

 required:
   - compatible
+  - en-gpios
   - interrupts
   - reg
-  - s3fwrn5,en-gpios
-  - s3fwrn5,fw-gpios
+  - wake-gpios
 =

 examples:
   - |
@@ -55,7 +67,7 @@ examples:
             interrupt-parent =3D <&gpa1>;
             interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH>;
 =

-            s3fwrn5,en-gpios =3D <&gpf1 4 GPIO_ACTIVE_HIGH>;
-            s3fwrn5,fw-gpios =3D <&gpj0 2 GPIO_ACTIVE_HIGH>;
+            en-gpios =3D <&gpf1 4 GPIO_ACTIVE_HIGH>;
+            wake-gpios =3D <&gpj0 2 GPIO_ACTIVE_HIGH>;
         };
     };
-- =

2.17.1

--===============5590558457105992950==--

