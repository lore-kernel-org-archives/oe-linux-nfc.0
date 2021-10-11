Content-Type: multipart/mixed; boundary="===============3276897098728672118=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 2/8] dt-bindings: nfc: nxp, nci: document NXP PN547 binding
Date: Mon, 11 Oct 2021 09:39:28 +0200
Message-ID: <20211011073934.34340-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211011073934.34340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3276897098728672118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

NXP PN547 NFC controller seems to be compatible with the NXP NCI and
there already DTS files using two compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml b/Docum=
entation/devicetree/bindings/net/nfc/nxp,nci.yaml
index 70634d20d4d7..7465aea2e1c0 100644
--- a/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
@@ -12,7 +12,11 @@ maintainers:
 =

 properties:
   compatible:
-    const: nxp,nxp-nci-i2c
+    oneOf:
+      - const: nxp,nxp-nci-i2c
+      - items:
+          - const: nxp,pn547
+          - const: nxp,nxp-nci-i2c
 =

   enable-gpios:
     description: Output GPIO pin used for enabling/disabling the controller
-- =

2.30.2

--===============3276897098728672118==--

