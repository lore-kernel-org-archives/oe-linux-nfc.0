Received: from out-2z4y-a153.jellyfish.systems (out-2z4y-a153.jellyfish.systems [198.54.127.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8667E3AB262
	for <oe-linux-nfc@lists.linux.dev>; Fri,  7 Aug 2026 02:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786069010; cv=none; b=evOw/TubV1G7rCsTQ8b0rgm85oCZAf2hlo1eKEPMjp6vSCrupPelbi1gQ+9DrOatv35PXXN7MHktuiyygU3dHEIZsBGTM3DomeCf/el6RrcuSCEO7CI1rmYIvuI31eG4ZGWPAxdw6IJ5aEZ/d5pDHP+K0djI9jSMsRCDnIV0DQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786069010; c=relaxed/simple;
	bh=iWXX5PxMaP04ryNNbWmVZPaipmdXKPbm4deuqIMkQaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=euHYd0R7pB3U58JDdhTMNztxNyQfd/Xgbm2FTFO0F3haQWoKMIqMw/HVhGe85mA8sRalaupcc9dQh+25VNIZAoPEK7Nahw/wAp4sdVubRgehXRLv/tMtoAfpNou1Ab32+yxxsp3LfkF7Wqn7nMqBIpiHOawnP65WOsqPemb9rYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.127.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (unknown [87.215.145.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hGSLB1zxwz2x99;
	Fri, 07 Aug 2026 02:10:58 +0000 (UTC)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: David Heidelberg <david@ixit.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Subject: [PATCH v4 3/6] dt-bindings: net: nfc: samsung,s3fwrn5: add the S3NRN4V
Date: Fri,  7 Aug 2026 04:09:58 +0200
Message-ID: <20260807021001.239389-4-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807021001.239389-1-jorijnvdgraaf@catcrafts.net>
References: <20260807021001.239389-1-jorijnvdgraaf@catcrafts.net>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: jorijnvdgraaf@catcrafts.net

The S3NRN4V is a later part in the Samsung NCI NFC controller line
this binding documents, found e.g. on the Fairphone 6 (SM7635). Its
host interface is NCI over I2C like the S3FWRN5, but it is not
compatible with any of the existing parts, so no fallback compatible
applies: its bootloader reports a hardware version none of the
existing parts use, and its RF configuration is loaded through a
different proprietary command set.

Also document the PVDD supply, the externally switched rail powering
the controller (boards feed it from a PMIC LDO). It is required for the
new device; deployed DTs for the existing parts never described a
supply, so for those it stays optional.

Assisted-by: Claude:claude-opus-4-8
Assisted-by: Claude:claude-fable-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
---
Conor's Acked-by, given on v2 and carried into v3, is dropped: this
version removes clk-req-gpios (and its dependencies clause) and the
S3NRN4V example. The compatible and pvdd-supply hunks are unchanged
from the acked text.

 .../bindings/net/nfc/samsung,s3fwrn5.yaml     | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
index 12baee45752c..40a69466802b 100644
--- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - samsung,s3fwrn5-i2c
       - samsung,s3fwrn82
+      - samsung,s3nrn4v
 
   en-gpios:
     maxItems: 1
@@ -29,6 +30,9 @@ properties:
   clocks:
     maxItems: 1
 
+  pvdd-supply:
+    description: PVDD power supply
+
   wake-gpios:
     maxItems: 1
     description:
@@ -58,12 +62,25 @@ allOf:
       properties:
         compatible:
           contains:
-            const: samsung,s3fwrn5-i2c
+            enum:
+              - samsung,s3fwrn5-i2c
+              - samsung,s3nrn4v
     then:
       required:
         - interrupts
         - reg
 
+  # Deployed DTs for the older parts never described a supply, so PVDD is
+  # only required for the new device.
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s3nrn4v
+    then:
+      required:
+        - pvdd-supply
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.55.0

