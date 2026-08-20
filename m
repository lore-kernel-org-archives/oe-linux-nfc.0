Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6F03DAADF
	for <oe-linux-nfc@lists.linux.dev>; Thu, 20 Aug 2026 20:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787259393; cv=none; b=PpFx3JV07YilQXHBZoGyBZVbqeLoHsuvQZ1RQIOV9RtuXvUDGW7Kbrs54enOk2b7yMDSwAMD6THg5UXflGPaE3fqg9bHsOwS5xQd8YIZNP4QG2PKIqKsecx67TBbbdaajcO/szIDz1Rih4+dK/Gro7jybAI5CR/lVsydmozzhVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787259393; c=relaxed/simple;
	bh=lwm38KTfsw/pjCNVhsVFi9nbwsq7EF/sB8P8Jcau1kY=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U+KeybNBEa2gCQxO0co6SbMm17UGg7zssjVCSFvJHLmAcim/D6gWtdoz7tcg9+5ASlSe/huTOlRqd2DJho3p0o7q5Y+5ZbQhx+XdlJmpfqvvcUqkCSrfFzWmJivBMj/hmxG2JSCL1dfUrHzwO8ijqvHBaksRP0H36UbRKsfsfM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=VvOEp+qJ; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="VvOEp+qJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1787259371; x=1787518571;
	bh=PpDu5cq7SquYTzyZGwtLqNub3RattoKBrrxs4oLHiuo=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VvOEp+qJFI8HZ0WgMzo4flfUv+TDwhXFMZ7Qhx0t5C3qTBe8GC3W3XcrSO2N9onsR
	 qBvscWvV/M/+qGbN9jQ7Se2QkWZ5jEdY4l9gXGKhbilzmSnKQWqTRy1H5ebi2VkwEB
	 peEmOdRXXBPmfdSOX2te15+OrL8AMq+uX3CTA3SK/ux9qQQAl47Px/NlovWBAnN81S
	 hKAJj4f6hyDx3sS+DiuvPa4ijW6Lgd9ekfABzleoB5Fis5cuaxpKmO5jJbZGmwvDKf
	 jycHT6awNcgMRfBZQCJu2hp5mfetkwL/uqfuthydSMdpe1cvn7VVj6Mp/dbYIDv4Qx
	 MZIYW/SB4UgCA==
Date: Thu, 20 Aug 2026 20:56:07 +0000
From: Kristian Brox <isyourbrainfoss@proton.me>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Kristian Brox <isyourbrainfoss@proton.me>
Subject: [PATCH v3 1/3] dt-bindings: net: nfc: add st,st21nfcd
Message-ID: <20260820-fp5-st21nfcd-v3-v3-1-5ee0a7f44d04@proton.me>
In-Reply-To: <20260820-fp5-st21nfcd-v3-v3-0-5ee0a7f44d04@proton.me>
References: <20260820-fp5-st21nfcd-v3-v3-0-5ee0a7f44d04@proton.me>
Feedback-ID: 203906395:user:proton
X-Pm-Message-ID: 2deb959f14ac7fb6dd1b1b816acef53ea3764a0f
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a compatible for the ST ST21NFCD NFC controller. Document optional
SYS_CLK (clocks) and VPS_IO (vdd-io-supply), and add an I2C example
that uses interrupts-extended.

Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
---
 .../devicetree/bindings/net/nfc/st,st-nci.yaml     | 31 ++++++++++++++++++=
++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml b/Doc=
umentation/devicetree/bindings/net/nfc/st,st-nci.yaml
index 1dcbddbc5..c859797f4 100644
--- a/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
@@ -15,6 +15,7 @@ properties:
       - st,st21nfcb-i2c
       - st,st21nfcb-spi
       - st,st21nfcc-i2c
+      - st,st21nfcd
=20
   reset-gpios:
     description: Output GPIO pin used for resetting the controller
@@ -36,6 +37,15 @@ properties:
       Specifies that the uicc swp signal can be physically connected to th=
e
       controller
=20
+  clocks:
+    maxItems: 1
+    description:
+      External reference clock connected to SYS_CLK.
+
+  vdd-io-supply:
+    description:
+      Digital I/O supply (VPS_IO).
+
 required:
   - compatible
   - interrupts
@@ -49,6 +59,7 @@ if:
         enum:
           - st,st21nfcb-i2c
           - st,st21nfcc-i2c
+          - st,st21nfcd
 then:
   properties:
     spi-max-frequency: false
@@ -81,6 +92,26 @@ examples:
         };
     };
=20
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        nfc@8 {
+            compatible =3D "st,st21nfcd";
+            reg =3D <0x08>;
+
+            interrupts-extended =3D <&gpio5 2 IRQ_TYPE_LEVEL_HIGH>;
+            reset-gpios =3D <&gpio5 29 GPIO_ACTIVE_HIGH>;
+
+            clocks =3D <&clk>;
+            vdd-io-supply =3D <&vdd_io>;
+        };
+    };
+
   - |
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>

--=20
2.55.0


