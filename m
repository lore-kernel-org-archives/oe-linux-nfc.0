Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060985;
	b=vS6rCIJdLlnwCN6qfvyECK7n4+0vQcy++QGRdwqU4jtSfw7i7v1Nvx3lPlHqrcsDQSNN
	 tImpgHVSMTJ85BnAPO5HcdSF+3scT8OFP/pbHplSGSWNFgVVdSMcZ1wmVui5EaymEZBvQ
	 q9nqv2IVav4xZNNP6wE1WdQhiroSyM+5JGeAD32BMVQcPecKE7aFIC+F90f6DIGsrUja3
	 yygMooctkk9RCDCTc1ICIlcqFjYl3nHNBTTgOJvQ49FaVvbxcxaf1SV15qFe6/TXc6lDJ
	 PHv6385HVmXnLEysqwGLgvrCSC/KKU24e1nIEUr2CNChfozbifJZm7qQ6T8xOzU0qlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uJTeJR5eoOxAAfYNVIbKciM1+UPVngasXpXnnN+uSGo=;
	b=juYlqmNzhekCc/5S6+/9vgWylH5HmBu8T4lAVSur1mkCMD54NSkYIV7z7OVRGDz27StM
	 8ecbqJLqmyWpnEGydRJGysKWXbw/YWMAj+BmoQgdPPz3AqHN8a7TN1czvcqWTQeHeh5xt
	 uM0nTMN13YD18wfvDozwSqKUhaxrstJC8AKWCeZ/p2mE4yPOjxAIrjcmR0Gztgtoh7wMz
	 WVTi4zGZMTb4JNt3MjwvhLQNY7f6ZXQMGZg956MafmDM2YIhzmGF+UrQUpU+YChFFgz3X
	 7BtDYIB3/AlQlbBedmmUWkPa73OUrgc4Xs7VPc+w2rCYVT9RW8H3k98Z4MP+Jeo+88g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=octane.security;
	spf=pass smtp.mailfrom=octane.security;
	dkim=pass header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=MtYP3iTo;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916C4606A32F
	for <oe-linux-nfc@lists.linux.dev>; Thu, 19 Nov 2026 04:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 916C4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=MtYP3iTo
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso906418a12.2
        for <oe-linux-nfc@lists.linux.dev>; Wed, 18 Nov 2026 20:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1795060984; x=1795665784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJTeJR5eoOxAAfYNVIbKciM1+UPVngasXpXnnN+uSGo=;
        b=MtYP3iToH3M1roWMVAKVwHoxeeK30NGeFF9EHj8dAQPXJjDW3oCJG2YGbEQraKRUNu
         uX8W0VQ5j/IQNfDxPV279Ae3yayXCZMbpR5BeA2LI0j5tn5p78oO6s6gJHd4PdjIm8cO
         yPIONtjhzms8vyDMgq5r97XLZVL2N4lXbwXZpgA/WUd2GueiZU6/WAIRjLST4qqqlM5t
         kTfcLyXh1IzQViYEBP5KQNjRQYVQEFzG2OZ2dUBaBBVIHG3yVm6Uo5L2lpzGvnm6znVQ
         +jN7Hu4LfcmhaHNduu4JYZmNPczIpteOWVyj5Q3r2XR1mu3xAOdNnAzG1aSUtNuKjIef
         h8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060984; x=1795665784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJTeJR5eoOxAAfYNVIbKciM1+UPVngasXpXnnN+uSGo=;
        b=YqrbzjsIqatz6N9QWT353WlsYAG4oKKcOcPQeaVO5jx0f51xNXw8HEXtUqFl9TVhfp
         9/FiaAqnC6CkXaUM86WBa3Rv84cvv0bHw4fBHQMnet7Q5gKKBhWjqkMra0VQvAVV3nFh
         045rVrLqbBA1hIIOxAyXN6maKknwL+1Que2SFbGTbzqEUtdme8LEQZdumANSD1Hhnh+Z
         bCrwm4s1I61RH8EOyTpFzyi31XVYZmy0WngcUJpxZZKJsw67RMSsp6Km+bGWVQ7XBT3y
         g/I4bPx5HpAjjf0RNZl+yEdopNFtaqS7R6o8cF3EK/K0u/byWUNRzWn3poHgy5/leL2j
         VADQ==
X-Gm-Message-State: APuU4Z8DvYolIexd2mmcuxPXjqyRlQGZJgNR7gUUp8NVsN5JPDorLWt/
	gJXTUSL5vMje3oKXckpXHijkKDZZR4wuJGCIsYwhf2Xo11JOXF3f2kPa2mSxXCvURcCP7tTgv9V
	FzHqx
X-Gm-Gg: AZFdTZejGyhyk01dmTUzrtRLa8By3jH2wkfaFgYynF/ScMABYed7aY4pHtbxgs4csj/
	ysFQ1vwU9ysC6TR2hWRF7p0gJQhQY1RJCNeE9SjL47pD+At9uCkBFe0883D1JD4k65ohSYwL0HC
	iTyBET7BDSopLwAPKe878rSYGLhqK7AqGwNlEtm1yttZ0DbelWsiLB/D4AtKDIspCdaXTX7XupY
	vr0/vlWBL9K4jGtbEI8q3l80QdFBngojaZjFpuewIhaTvdlNRVhk2/MUOVhHQphOR8F8Joj60Cy
	Yke1QOU3DFnwZlTokAI5tRT15/8oRelRCLmv3fPiAoVEF6EEHBWLmLisq6ZlBh52bkgcu7SuMGY
	qLu6neVSI6iGQHV80ZqLVQR7a7en1Pd4+6E22z95wiHiLrsWfaGVifOANT78wD957EfPS5hMqTF
	MygjeNJ2NLFNJxTSm2LhilBRkqVRhJ4TTtGQvMW51f5/6D665ldm6chsxiO2p9S4hhuKAj72vY5
	Zi1BIBSlSGUTqvaW4rkl0H8TyeLC0E9iUOWvJppHNGVgmdBj1VG8PZ+8Z3g5kbIuHYXal8U1hqm
	hNBo8ZwQj4i1uHa6dcQ3UNhCybl9ODCjf/JUotVbyUfV697c+fOpPFUFXK9DECiqu51rgxc9rqG
	JFgaKHw2mBtprNK8tZ7Tj6jAhAqHdyWr0C3yAQCkTaBovwN1LSqw=
X-Received: by 2002:a17:90b:448b:b0:3b0:9782:8721 with SMTP id 98e67ed59e1d1-3b3d07b9f34mr4659096a91.36.1795060983787;
        Wed, 18 Nov 2026 20:03:03 -0800 (PST)
Received: from localhost.localdomain ([103.207.175.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4057af4e2sm406863a91.7.2026.11.18.20.03.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 20:03:03 -0800 (PST)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	david@ixit.cz,
	horms@kernel.org,
	gio@octane.security,
	stable@vger.kernel.org
Subject: [PATCH net v8 2/4] nfc: reject overlapping firmware downloads
Date: Thu, 19 Nov 2026 09:32:51 +0530
Message-ID: <20261119040253.15986-3-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119040253.15986-1-shubham@octane.security>
References: <20261119040253.15986-1-shubham@octane.security>
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfc_fw_download() records an asynchronous download before calling the
driver, but does not reject another request while that download is active.
If the driver rejects the second request with -EBUSY, the core clears
fw_download_in_progress even though the first request is still running.
Firmware frames can then be routed through the normal receive path and the
device can be brought up before the original download completes.

Check the core state while holding the NFC device lock and reject an
overlapping request without changing that state.  Keep asynchronous
completion lockless because drivers can report completion while holding
their own locks, while the start path calls into those drivers with the NFC
device lock held.  Nesting the device lock in both directions would create
an inverse lock order.  Use one-copy accesses in the completion, receive,
and transmit callbacks, which cannot take the device lock, so all contexts
observe the state without a data race.

Discovered during an AI-assisted source audit using OpenAI Codex,
gpt-5.6-sol.  Patch development and test planning used the same assistant.
Confirmed using an unmodified kernel and a pty-backed user-space controller
which issued two NFC_CMD_FW_DOWNLOAD requests and checked that the second
returned -EBUSY without disrupting the first; no error injection was used.

With the final v8 fix applied, 105 first/overlapping request pairs
passed under KASAN, UBSAN, and lockdep, and 105 pairs passed under
strict-mode KCSAN.
No in-tree selftest covers the NFC firmware-download path.

Fixes: 9674da8759df ("NFC: Add firmware upload netlink command")
Cc: stable@vger.kernel.org
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 drivers/nfc/nfcmrvl/main.c |  2 +-
 drivers/nfc/nfcmrvl/uart.c |  4 ++--
 net/nfc/core.c             | 13 +++++++++----
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 6efa83219..b9b66127f 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -205,7 +205,7 @@ int nfcmrvl_nci_recv_frame(struct nfcmrvl_private *priv, struct sk_buff *skb)
 		}
 	}
 
-	if (priv->ndev->nfc_dev->fw_download_in_progress) {
+	if (READ_ONCE(priv->ndev->nfc_dev->fw_download_in_progress)) {
 		nfcmrvl_fw_dnld_recv_frame(priv, skb);
 		return 0;
 	}
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 9aedd1687..4b989fc4e 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -159,7 +159,7 @@ static void nfcmrvl_nci_uart_tx_start(struct nci_uart *nu)
 {
 	struct nfcmrvl_private *priv = (struct nfcmrvl_private *)nu->drv_data;
 
-	if (priv->ndev->nfc_dev->fw_download_in_progress)
+	if (READ_ONCE(priv->ndev->nfc_dev->fw_download_in_progress))
 		return;
 
 	/* Remove BREAK to wake up the NFCC */
@@ -173,7 +173,7 @@ static void nfcmrvl_nci_uart_tx_done(struct nci_uart *nu)
 {
 	struct nfcmrvl_private *priv = (struct nfcmrvl_private *)nu->drv_data;
 
-	if (priv->ndev->nfc_dev->fw_download_in_progress)
+	if (READ_ONCE(priv->ndev->nfc_dev->fw_download_in_progress))
 		return;
 
 	/*
diff --git a/net/nfc/core.c b/net/nfc/core.c
index f52166929..b03b34b40 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -48,15 +48,20 @@ int nfc_fw_download(struct nfc_dev *dev, const char *firmware_name)
 		goto error;
 	}
 
+	if (READ_ONCE(dev->fw_download_in_progress)) {
+		rc = -EBUSY;
+		goto error;
+	}
+
 	if (!dev->ops->fw_download) {
 		rc = -EOPNOTSUPP;
 		goto error;
 	}
 
-	dev->fw_download_in_progress = true;
+	WRITE_ONCE(dev->fw_download_in_progress, true);
 	rc = dev->ops->fw_download(dev, firmware_name);
 	if (rc)
-		dev->fw_download_in_progress = false;
+		WRITE_ONCE(dev->fw_download_in_progress, false);
 
 error:
 	device_unlock(&dev->dev);
@@ -73,7 +78,7 @@ int nfc_fw_download(struct nfc_dev *dev, const char *firmware_name)
 int nfc_fw_download_done(struct nfc_dev *dev, const char *firmware_name,
 			 u32 result)
 {
-	dev->fw_download_in_progress = false;
+	WRITE_ONCE(dev->fw_download_in_progress, false);
 
 	return nfc_genl_fw_download_done(dev, firmware_name, result);
 }
@@ -104,7 +109,7 @@ int nfc_dev_up(struct nfc_dev *dev)
 		goto error;
 	}
 
-	if (dev->fw_download_in_progress) {
+	if (READ_ONCE(dev->fw_download_in_progress)) {
 		rc = -EBUSY;
 		goto error;
 	}
-- 
2.54.0

