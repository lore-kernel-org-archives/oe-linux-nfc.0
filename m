Content-Type: multipart/mixed; boundary="===============8357843780339503814=="
MIME-Version: 1.0
From: Stephan Gerhold <stephan@gerhold.net>
To: linux-nfc@lists.01.org
Subject: [PATCH 1/2] dt-bindings: net: nfc: s3fwrn5: Add optional clock
Date: Tue, 18 May 2021 15:39:34 +0200
Message-ID: <20210518133935.571298-1-stephan@gerhold.net>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8357843780339503814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On some systems, S3FWRN5 depends on having an external clock enabled
to function correctly. Allow declaring that clock (optionally) in the
device tree.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml=
 b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
index 477066e2b821..081742c2b726 100644
--- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -27,6 +27,9 @@ properties:
   reg:
     maxItems: 1
 =

+  clocks:
+    maxItems: 1
+
   wake-gpios:
     maxItems: 1
     description:
@@ -80,6 +83,8 @@ examples:
 =

             en-gpios =3D <&gpf1 4 GPIO_ACTIVE_HIGH>;
             wake-gpios =3D <&gpj0 2 GPIO_ACTIVE_HIGH>;
+
+            clocks =3D <&rpmcc 20>;
         };
     };
   # UART example on Raspberry Pi
-- =

2.31.1

--===============8357843780339503814==--

