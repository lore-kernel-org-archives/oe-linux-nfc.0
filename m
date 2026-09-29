Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E013DDDD2
	for <oe-linux-nfc@lists.linux.dev>; Tue, 29 Sep 2026 22:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722244; cv=none; b=ddgrrUjTM7sfVCP+lm/pH7OpUz60yoiXDROubwSuk85yDbg2nbPLs4rT0g6kPawSzfQsvlqs6+43RnHq5PbWyV6IMQf1NQBg0461qs/FccfYZoDQBFXzY4lxyh6n6yZDlGLj3YdUyD8uqZ/giVSdkgBF8VQSWLn3gYG/NfCudws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722244; c=relaxed/simple;
	bh=hqXjfdWqMLuDrLRNlAqf1wXI4o4a41A7QgRV06xeQ3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHeru1wDhOc48657DpfMliPZeb6qATozg6cxHAncSovCoW/wQBVuRj6X/GRKBg0n2QTxSrKL3iir6Jz1tAwRsFUPhPhZgt6UKXBSGFNnBh7+8Ip4fP0yHuqWW/1/MKgAVTwWBRM6L7SdpuTEWoTaUDOu2OpbgZxoNed4j/bFZ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=taufderl.de; spf=pass smtp.mailfrom=taufderl.de; dkim=pass (4096-bit key) header.d=taufderl.de header.i=@taufderl.de header.b=VMkmrShD; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=taufderl.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=taufderl.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=taufderl.de header.i=@taufderl.de header.b="VMkmrShD"
Received: from christensen.uberspace.de (christensen.uberspace.de [185.26.156.203])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id AE22D180A16
	for <oe-linux-nfc@lists.linux.dev>; Wed, 30 Sep 2026 00:41:27 +0200 (CEST)
Received: (qmail 1192 invoked by uid 990); 29 Sep 2026 22:41:27 -0000
Authentication-Results: christensen.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by christensen.uberspace.de (Haraka/3.1.1) with ESMTPSA; Wed, 30 Sep 2026 00:41:27 +0200
From: Tim auf der Landwehr <tadl-git@taufderl.de>
To: Kristian Brox <isyourbrainfoss@proton.me>
Cc: David Heidelberg <david@ixit.cz>,
	luca.weiss@fairphone.com,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tim auf der Landwehr <tadl-git@taufderl.de>
Subject: [PATCH 2/3] nfc: st-nci: restart the reference clock on power-up
Date: Wed, 30 Sep 2026 00:41:24 +0200
Message-ID: <20260929224125.3656680-3-tadl-git@taufderl.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
References: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.979481) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.579481
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=taufderl.de; s=uberspace;
	h=from:to:cc:subject:date;
	bh=hqXjfdWqMLuDrLRNlAqf1wXI4o4a41A7QgRV06xeQ3k=;
	b=VMkmrShDexYSp+DzTK+Tqc2H/34DR1J45uj71EM3P9VtGkgvKbCQoT+mDpvNu+xK9qx2YCbgeD
	0DF9kHqqYtNnSM+t6W0KovXVX4zgTZMLzCEgzZoA3ZgSzDKYidyax6YItuP0xYJw4rjPEX0oi776
	dtma8N1chOEeXTAkxlsTVRizNva+NiHNVModkgoJaf/v9PH5TXaNAqDZbmHTHPR+pvA51KYJ/3e4
	s3u3oJjLWTIcFVx00Y1WVesOW6lkmOeuFYBkYRk9rraB/PKsfWZg2HJ9P75QebQ9xJzy+edcD1B5
	jIoAlR5WJB54F7qoSECH03fHebiusOfwqtcvqidsVuVfDuHIEx1a3TNuQ86IUTOHseFKDrMLptez
	5m4bQuQTN1TC5jkyqiIe7Iu0vRdB53KHT4zrDcJpJtpi8gkprGy94R00I0EP2WdufTswTWitgN/2
	N2Io2+9JA5nZ/XXrH1vb+gFue/bWI5N8h5uMbfS5GPWqtriIXG7mC4AvQkYEm2sJDF7jdLWS9xMQ
	ciDne9QiQbEfmv20ehX1I2ckIcQMYpNBoSpLfnschqnmVguoTD+Df67IJw0ThSLZ/SOlWzS87kaE
	MALyJMNWcfPZKSOtS7zkT2NK2GJFyFZtQ3Y98PdFF6thgOn3shBJdW2UHIMQW4HHhQjL+wGF9Rnu
	E=

On the Fairphone 4 (and reported on the Fairphone 5), the ST21NFCD stops
answering NCI after a poll enable/disable cycle: the next NFC_CMD_DEV_UP
sends CORE_RESET and never gets a response (__nci_request timeout,
nfc_dev_up: SE discovery failed), and the controller stays dead until a
reboot. No tag is needed to trigger it; enable/disable/enable polling is
enough.

A reset pulse alone does not recover the part; its input clock has to be
stopped and restarted. The driver enabled the clock once at probe and left
it running, so only re-probing (which cycles the clock) recovered it.

Cycle the reference clock in the power-up path, while the controller is
held in reset. Scope it to the raw-NCI (st21nfcd) part so the NDLC parts
are untouched; the reset-assert delay stays unconditional.

Signed-off-by: Tim auf der Landwehr <tadl-git@taufderl.de>
---
 drivers/nfc/st-nci/i2c.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index e527d3cc9..16f643b3a 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -46,6 +46,7 @@ struct st_nci_i2c_phy {
 	bool irq_active;
 	bool raw_nci;
 
+	struct clk *clk;
 	struct gpio_desc *gpiod_reset;
 
 	struct st_nci_se_status se_status;
@@ -60,15 +61,29 @@ static int st_nci_i2c_enable(void *phy_id)
 	 * chip-running. GPIO_ACTIVE_LOW: logical 1 asserts reset
 	 * (physical LOW).
 	 */
-	if (gpiod_is_active_low(phy->gpiod_reset)) {
+	if (gpiod_is_active_low(phy->gpiod_reset))
 		gpiod_set_value(phy->gpiod_reset, 1);
-		usleep_range(10000, 15000);
+	else
 		gpiod_set_value(phy->gpiod_reset, 0);
-	} else {
+
+	/*
+	 * The ST21NFCD (raw NCI) stops answering NCI after a poll on/off cycle
+	 * and does not recover on a reset pulse alone: its input clock has to be
+	 * stopped and restarted. The clock is enabled once at probe, so cycle it
+	 * here, while the controller is held in reset, on every power-up. Scoped
+	 * to the raw-NCI part; the NDLC parts keep their previous timing. The
+	 * usleep below is the reset-assert width and stays unconditional.
+	 */
+	if (phy->raw_nci)
+		clk_disable_unprepare(phy->clk);
+	usleep_range(10000, 15000);
+	if (phy->raw_nci)
+		clk_prepare_enable(phy->clk);
+
+	if (gpiod_is_active_low(phy->gpiod_reset))
 		gpiod_set_value(phy->gpiod_reset, 0);
-		usleep_range(10000, 15000);
+	else
 		gpiod_set_value(phy->gpiod_reset, 1);
-	}
 	usleep_range(80000, 85000);
 
 	if (phy->ndlc->powered == 0 && phy->irq_active == 0) {
@@ -282,9 +297,10 @@ static int st_nci_i2c_probe(struct i2c_client *client)
 	if (r && r != -ENODEV)
 		return dev_err_probe(dev, r, "failed to enable vdd-io\n");
 
-	r = PTR_ERR_OR_ZERO(devm_clk_get_optional_enabled(dev, NULL));
-	if (r)
-		return dev_err_probe(dev, r, "failed to enable clock\n");
+	phy->clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(phy->clk))
+		return dev_err_probe(dev, PTR_ERR(phy->clk),
+				     "failed to enable clock\n");
 
 	/* Get RESET GPIO */
 	phy->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
-- 
2.55.0

