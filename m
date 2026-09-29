Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9263BC680
	for <oe-linux-nfc@lists.linux.dev>; Tue, 29 Sep 2026 22:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722241; cv=none; b=FFd3PoP9XhN6VNDyvP+BpbNZEBog7D24jMHUmSPlcqbYX15Dv+bSz9oGxM6h54u6G7M4Tti4elvPSQSNFuuim+6dfXQ9lLJ+WTh80DxAzHYdw+yZLIWl0R9I7NolI0nqVLS9Pwdh6XLR7Qy1/48XvXLrlBjobxxBtzoLjBdX6Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722241; c=relaxed/simple;
	bh=CesYRmiunC+xMCdutfhld2dYxLwBjJzmm7seB+Xjpu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WFxRgFg/w63VOFLjCMKT4Ts93Ayh2Jhm3dp+63b2oTWEbBIwnf1ZCMOVwHqMpS1TPxgjdToueuxOnmk+9ZvYk1zuCTEvqaGoqcZZq1oCTYmwqYXjq7gVxUY0Fse4JKn21P7AVSsYso9F1qBFua/tdobiAaAIR7gG9l8XmzM0OxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=taufderl.de; spf=pass smtp.mailfrom=taufderl.de; dkim=pass (4096-bit key) header.d=taufderl.de header.i=@taufderl.de header.b=LsY8sXIz; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=taufderl.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=taufderl.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=taufderl.de header.i=@taufderl.de header.b="LsY8sXIz"
Received: from christensen.uberspace.de (christensen.uberspace.de [185.26.156.203])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 1332F180686
	for <oe-linux-nfc@lists.linux.dev>; Wed, 30 Sep 2026 00:41:28 +0200 (CEST)
Received: (qmail 1261 invoked by uid 990); 29 Sep 2026 22:41:28 -0000
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
Subject: [PATCH 3/3] nfc: st-nci: treat the idle 0x7e read as no-data
Date: Wed, 30 Sep 2026 00:41:25 +0200
Message-ID: <20260929224125.3656680-4-tadl-git@taufderl.de>
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
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.974721) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.574721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=taufderl.de; s=uberspace;
	h=from:to:cc:subject:date;
	bh=CesYRmiunC+xMCdutfhld2dYxLwBjJzmm7seB+Xjpu8=;
	b=LsY8sXIzYR+7YyDr0u8tCndQ7B2MXSYqZEFyHY/J6ATT2JQ13JIzlgpvgdF5+G5DBX59Z0k8dH
	TvmAGEly9/hdUlcjKX+oS0qR13GRsCMsPWkQLzNgm9vXzPzEdFGGrfzjEPwuQ222BVtaKFDeXFpb
	x/FKjasCg8IBgP4Ozn/bkyqm5sdEvdBun0psdSel9lJdhDs9VfJK8JyzzvZ80Vatd4c6nFSmPmb7
	r+1Z3ZcFwGpmnwn9WW4l9iVFcRVq4uyse7J3jZEfeSKDTfXRV0xuSLWzcFBZWmUeDjWctwDLAVw7
	BNItZM08A82aRJ9qlBOCTilutDcdrPu03/Uho6KdeiwsV/VyFgJA+dyH5ePwChyBmGm7ngIXUbL+
	2wQMmlnZV8k+WIi3M+MzclS2RE7ug6DXLgj15Gx3r01kGHF5w1xpC4vxispioWbLjERjzyslbP6p
	MXxYw4wOgu6cvzQ/lZ7gVroRsllgJLdlZrNqAI4tT0m8xEoTLEq2sQCuoROb/8xFQxNCnKi2MSo/
	7B0qVVp2SJV0a+OmR7FihtbuI/TntGuOzYdMPTaR/JdspJ3vrb6yScwh7BI1ZRWPIvGmH8bevsyM
	kwPopqixaYvqm9oVPnW7nvE1D7597SQ1dI2pGwx4Hwwc/O3JPoyjXEoTE72sGF8PmT4lGs2MpKNE
	8=

In the raw-NCI read path the controller returns 0x7e as the first byte
when it has nothing to send, and its IRQ can fire without a frame behind
it. The driver took buf[2] of that idle read as a frame length, logged
"invalid frame len", and read the following bytes at the wrong offset,
desyncing the next real frame on the bus.

On the Fairphone 4 this produced repeated "invalid frame len" during
polling. Return -ENODATA when the first byte is the idle marker, and treat
it like the other benign read outcomes in the IRQ handler.

Signed-off-by: Tim auf der Landwehr <tadl-git@taufderl.de>
---
 drivers/nfc/st-nci/i2c.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 16f643b3a..3a99dc23f 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -29,6 +29,7 @@
 
 #define ST_NCI_I2C_MIN_SIZE 4   /* PCB(1) + NCI Packet header(3) */
 #define ST_NCI_NCI_HDR_SIZE 3   /* raw NCI: MT/PBF/GID + OID + len */
+#define ST_NCI_IDLE_BYTE 0x7e /* first read byte when the controller is idle (observed) */
 #define ST_NCI_I2C_MAX_SIZE 250 /* req 4.2.1 */
 
 enum st_nci_i2c_proto {
@@ -157,6 +158,15 @@ static int st_nci_i2c_read(struct st_nci_i2c_phy *phy,
 		if (r != ST_NCI_NCI_HDR_SIZE)
 			return -EREMOTEIO;
 
+		/*
+		 * The controller returns 0x7e as the first byte when it has
+		 * nothing to send; its IRQ can assert without a frame behind it.
+		 * Treat that as no-data, otherwise buf[2] is taken as a length and
+		 * the next real frame is read off the bus at the wrong offset.
+		 */
+		if (buf[0] == ST_NCI_IDLE_BYTE)
+			return -ENODATA;
+
 		len = buf[2];
 		if (len > ST_NCI_I2C_MAX_SIZE) {
 			nfc_err(&client->dev, "invalid frame len\n");
@@ -247,7 +257,7 @@ static irqreturn_t st_nci_irq_thread_fn(int irq, void *phy_id)
 	}
 
 	r = st_nci_i2c_read(phy, &skb);
-	if (r == -EREMOTEIO || r == -ENOMEM || r == -EBADMSG)
+	if (r == -EREMOTEIO || r == -ENOMEM || r == -EBADMSG || r == -ENODATA)
 		return IRQ_HANDLED;
 
 	ndlc_recv(phy->ndlc, skb);
-- 
2.55.0

