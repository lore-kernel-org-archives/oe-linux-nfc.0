Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACAE348C5D
	for <oe-linux-nfc@lists.linux.dev>; Tue, 18 Aug 2026 21:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787086811; cv=none; b=JmqncDIx5nFLbVWWJ1COwEDclLe+xFbxE9wQQNTo2Co5VuULT5+058G1Cd3C/9E4+CuxT8BrGaI0UkHVBRx+Fb6knl+uAWKvSGjEQOw/NAu/52T6fLw9/SUJJqf2aMQtijN0Ot61vdD3CCoUZSGvOoXxavFRIIumwTbvWmv7mco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787086811; c=relaxed/simple;
	bh=9pGqU61ItbXfoCDgTIv4Xbkixc9KWLSXJv2atH7AfSo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=odWnaEO+pHWj6Ef8ETdYpR/fQLx155YvhGlzQTsEsJM/lrHkmN6BBOK1Wit94SjDonASiJx4lcYnT2nFs3Xs9bBXGk52Ty3dFW7aXgNqjliRU9sL3t7br9rZ+pxY6oVTPLMpiQHCgkOdde5WEPnhH+e2mCE+0e+Y/ub92FmZm4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=mhSYWzGd; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mhSYWzGd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1787086799; x=1787345999;
	bh=NkVgtw1kJ6MqPpD5arjOh9k8jZTXo2lx3VWAOsobngE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mhSYWzGd2cXpUpuqKP7v58nkIER5vaYXHR/cisXCeZpKTuZr5qsSPKV3CeNADxRDD
	 LaTCGIYMfwOuu+GCuN1YqeEdkr0pUbdqhJkfEKeGXNQC6eBwSm+SDIz0f6yzGklFjb
	 v1RSZhSy8CbYq7PAoIrrdVZz/N3A/JO1l2Y5Gnx8ZyHm1t+EtDTwJnb4LqOQ/xeC/j
	 p2Qde/XAMJWrYPGvQUdV53R681CxyAxpZZFRoHanO/M3Gjn3vefWzgPmxofvXFvZ4o
	 5N/oLkuZsHYVcoVod+uOunlhI+2kB9vQGPVZWAjKQknCjsRIbpiqqjS2wrIxnZ4G3s
	 guLFA+zEiYJoA==
Date: Tue, 18 Aug 2026 20:59:56 +0000
To: oe-linux-nfc@lists.linux.dev
From: Kristian Brox <isyourbrainfoss@proton.me>
Cc: david+nfc@ixit.cz, krzysztof.kozlowski@linaro.org, luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org, Kristian Brox <isyourbrainfoss@proton.me>
Subject: [PATCH 1/3] dt-bindings: net: nfc: add st,st21nfcd-i2c
Message-ID: <20260818205940.1973944-2-isyourbrainfoss@proton.me>
In-Reply-To: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
Feedback-ID: 203906395:user:proton
X-Pm-Message-ID: 2e4fbc4366b6b90ede0efb52cc59d40556f71d7b
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------09b1762d2f5a8de4e1bc2ea2f3097d8948188062ab807c4c415bb583a4fc9d31"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------09b1762d2f5a8de4e1bc2ea2f3097d8948188062ab807c4c415bb583a4fc9d31
Content-Type: multipart/mixed;
 boundary=8fd759cc22b3885906fd3d968f0062459f264dc140b14c3bbded1f1cb830
From: Kristian Brox <isyourbrainfoss@proton.me>
To: oe-linux-nfc@lists.linux.dev
Cc: david+nfc@ixit.cz,
	krzysztof.kozlowski@linaro.org,
	luca.weiss@fairphone.com,
	linux-arm-msm@vger.kernel.org,
	Kristian Brox <isyourbrainfoss@proton.me>
Subject: [PATCH 1/3] dt-bindings: net: nfc: add st,st21nfcd-i2c
Date: Tue, 18 Aug 2026 22:59:38 +0200
Message-ID: <20260818205940.1973944-2-isyourbrainfoss@proton.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
MIME-Version: 1.0

--8fd759cc22b3885906fd3d968f0062459f264dc140b14c3bbded1f1cb830
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ST21NFCD (e.g. Fairphone 5) speaks raw NCI on I2C. Existing
st,st21nfcb-* and st,st21nfcc-i2c compatibles stay NDLC. Add a
separate compatible so those boards are not switched to the wrong
framing.

Also document the difference and add an I2C example without
ese-present / uicc-present.

Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
---
diff --git a/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml b/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
index 1dcbddbc5..3523a8df0 100644
--- a/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
@@ -11,10 +11,14 @@ maintainers:
 
 properties:
   compatible:
+    description: |
+      st,st21nfcb-* and st,st21nfcc-i2c use NDLC on the wire.
+      st,st21nfcd-i2c is ST21NFCD with raw NCI (no NDLC PCB).
     enum:
       - st,st21nfcb-i2c
       - st,st21nfcb-spi
       - st,st21nfcc-i2c
+      - st,st21nfcd-i2c
 
   reset-
gpios:
     description: Output GPIO pin used for resetting the controller
@@ -49,6 +53,7 @@ if:
         enum:
           - st,st21nfcb-i2c
           - st,st21nfcc-i2c
+          - st,st21nfcd-i2c
 then:
   properties:
     spi-max-frequency: false
@@ -81,6 +86,24 @@ examples:
         };
     };
 
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nfc@8 {
+            compatible = "st,st21nfcd-i2c";
+            reg = <0x08>;
+
+            interrupt-parent = <&gpio5>;
+            interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+            reset-gpios = <&gpio5 29 GPIO_ACTIVE_HIGH>;
+        };
+    };
+
   - |
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>

--8fd759cc22b3885906fd3d968f0062459f264dc140b14c3bbded1f1cb830
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"; name="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"
Content-Type: application/pgp-keys; filename="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"; name="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuMTAuMAoKeGpNRWFqR1U0UllKS3dZQkJBSGFS
dzhCQVFkQVJkaFRsODdNUnJZNlJsOC9FeUhRdmJjVWtqWXBEcmptcmZBRwoxNzV5djR2Tk5XbHpl
VzkxY21KeVlXbHVabTl6YzBCd2NtOTBiMjR1YldVZ1BHbHplVzkxY21KeVlXbHVabTl6CmMwQndj
bTkwYjI0dWJXVSt3c0FSQkJNV0NnQ0RCWUpxTVpUaEF3c0pCd2tRcVFlNkNIM2p3cWhGRkFBQUFB
QUEKSEFBZ2MyRnNkRUJ1YjNSaGRHbHZibk11YjNCbGJuQm5jR3B6TG05eVo2bTkwZmNOZ2Q0cVp6
NWFnV05OTmorbwpyTjkrOHc2TUVRZ0J4MElqR0NPcUF4VUtDQVFXQUFJQkFoa0JBcHNEQWg0QkZp
RUVtU0lrWU5Najl2RWxSS0JyCnFRZTZDSDNqd3FnQUFCcHVBUUNiUmgxb3VRMUVhQmlHWGtYeVhS
bjZkWTNaVjUzdXkrWHRRWGhtOWtpSFJBRDkKRkxROWtzdGJyVmx3WGlrUkl5OVpINUQ0R1VXS292
ZXJIdlpWbzd5RFpnM09PQVJxTVpUaEVnb3JCZ0VFQVpkVgpBUVVCQVFkQUdHZDhVMnJyaldxMVBa
YmhsQUFPUE1KanJEeTVkSjdMbnQ3ZHE1Q21VUWdEQVFnSHdyNEVHQllLCkFIQUZnbW94bE9FSkVL
a0h1Z2g5NDhLb1JSUUFBQUFBQUJ3QUlITmhiSFJBYm05MFlYUnBiMjV6TG05d1pXNXcKWjNCcWN5
NXZjbWNVbzFQNFhTZExyNEpzRlRBaThTcUVDSERDa2thdTBtTmthSk5aaWFjU2p3S2JEQlloQkpr
aQpKR0RUSS9ieEpVU2dhNmtIdWdoOTQ4S29BQUQrZndEK0lLcStqbUFKZytYbmVXT09YNHA4eTFX
K0dYN3FTQzFCCnE4aUFYUWJpa2VNQkFLdHc0aStPZ2VHTWMyOUxHSnNIellXbVJhRU9nS0JvOEcr
UklhK0ZUa29GCj1rbmFrCi0tLS0tRU5EIFBHUCBQVUJMSUMgS0VZIEJMT0NLLS0tLS0=
--8fd759cc22b3885906fd3d968f0062459f264dc140b14c3bbded1f1cb830--

--------09b1762d2f5a8de4e1bc2ea2f3097d8948188062ab807c4c415bb583a4fc9d31
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmqEx8wJEKkHugh948KoNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmcBweDJ4Odqv8PWqj4zPufbFiEEmSIkYNMj9vEl
RKBrqQe6CH3jwqgAAEk5AQCVYJPy1a46Rl+0t/RSDbNQwilDnppi/c1Ek3EA
9hHBuAD9Ek73UoIqeFYN5M58t9IKwHM4TgsBizmHTV4hvbYhhQ0=
=sxVY
-----END PGP SIGNATURE-----


--------09b1762d2f5a8de4e1bc2ea2f3097d8948188062ab807c4c415bb583a4fc9d31--

