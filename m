Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553102;
	b=kgF5KPj1FQ8roDl78IU8eli/rKE5hsJmOl07ebOacKkjSGYNMacyhqTMGHKB8mTnryti
	 oZNX6UDfrJvT4jMtBze4bz44iU1ohObjfazo/l7+Sp3ch/zhGDlCwtdq6cO1TJ24r2lfp
	 Xe6W94OcIjQTXoADYae/2VLpTfAy3FpKzx6iaVycGSwn+5cn7EIsVzt76aqwhnHDW0uN8
	 eMgHX6JBrGXKbjp5ernBigmU2xsL4KpaV2Wk50k1uabjWXI7+7zGsLHRX+RNXDayeyOHh
	 1brmpfSMsGBSZtQOvm/McbCY7KM11xKV2s0HfIL+lfGvzV6LdnS+9eIYIcBo9E+87Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VCfGQX5Enxz7dxwKYko3XxUHVAAWfi+FllLcCi4k6eA=;
	b=RfUiGJL+Hf9tcTUduknKhSAd7AMg8+ByfWVDPK56BkfphR1v+MzAeK6O+uEUmQf/O27H
	 2UkTC7FpyMeGKFvnzhiOukhGRQjm/SKPkM1HdYYidBve8jbZeYDPNnL7h7LC/CdsYzpTu
	 AztnDLJmBzMozCqqlBcInYoKpOZJyXgH0XyASRKjMwl93zWeYRLh59oglhaG2gjU7khvx
	 AjjcyNuOKPsRZSirtXNs6QHCaWzrQ9auwx1WwtM9SClvYNOd/x0ran4lTCEPnRwNVBlIS
	 SQXUoQDA9tFib1mO9BgvTzyxUJ113WfdtYSbEqr8AtyHsXKWnDq+EagLYUlarwYMpfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=octane.security;
	spf=pass smtp.mailfrom=octane.security;
	dkim=pass header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=TyVSZid3;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4385606E860
	for <oe-linux-nfc@lists.linux.dev>; Wed, 21 Oct 2026 03:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4385606E860
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=TyVSZid3
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so57508a12.3
        for <oe-linux-nfc@lists.linux.dev>; Tue, 20 Oct 2026 20:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1792553100; x=1793157900; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VCfGQX5Enxz7dxwKYko3XxUHVAAWfi+FllLcCi4k6eA=;
        b=TyVSZid313amz0gHRd4buDrKM9MQbUb8wJAbgPRJyMnaAo3zU7rAK98aVyC1gRyRlw
         4HXheJ/6UvdMGxAi+71spWjsFLPmt7IFJT+OEGOqs6TuMvCZr6JGsFrWhXcp2SWiuVvm
         VNyMnVF0LJV1Wg5zjwSefK+KwoL9keWjJNeOz/FzJJD8o4dJYEH9cnKPLxVhUdWhgzq2
         fyrMUf0056hpqD3AWfo/mVWbdYxfiNmb6NeZsI8EATpPcD71I8wUgB3BKYoDIVLcRHw9
         v3saDA9nT7IKUDKKpB/Dah2eFOtpGy2WhYcMv173AsE/wMhrvltCVIK+Tq8NBze3mj6D
         V5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792553100; x=1793157900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VCfGQX5Enxz7dxwKYko3XxUHVAAWfi+FllLcCi4k6eA=;
        b=khvFsaUABhpO+nOvHY+hkxiVPFR4LnO3vxQKh/IIZ4qPSDYMt+ETH5ZHtC3Ih29hYS
         x5lqRgyKtxfXqhBPtZAe7gWXnJd4KujtWtssUUEynJkuVrvjqYTr8sbaS3zMMayt0SSu
         cPwOJAEQ71qG2T8ufcmypd0C1Fg5lfxRpAFHLPjIO6/2nz1TYP/pgDLhn6zzMhFGl14r
         fJEgHVBYH5mPiJb4N+ZY/hKFUXTsZLQJ6M8kjxh/vNsmv9JPTAXm0WOERmHu7DsmjILe
         xFufiVDgINNS8TbBX/76/rIiubYwX485t4MmTxA7mYmE+2LmZsUfTf61UO5CDyFmJtnz
         7Tfw==
X-Forwarded-Encrypted: i=1; AKwUvBz7mJ+OghM5T9ej6L0DlQSae1+RRuGT35wwM2vOa8OwfOTbpsvjVdyjp2wOhWYNvLUH2wooZcQ1Sex8lMM=@lists.linux.dev
X-Gm-Message-State: AFq9FYKVf94fXRVdcuwHvrLxcMRcPvEEbZtPlGAWS75G1iAJk9jtK5D+
	0I6ndqgT3zNwY8/VU7caqKrNRluZxpZLmdls6LorlYFIVNNDWDOOU+HFE5pP8GkJ5Jg=
X-Gm-Gg: AYBFou2KnJyRS9vjCanPasun2IPhlMAwhvDjo6U24gwytXh1XhfBAHkbzTdLKezG5Eb
	9t5AGEFt2FbhttXYd+0M3VFECpXteWRvr+ggYeasThgRP6VBfG+sC2DSEbHGZX8NjwaWWV9CDGs
	vNJ+JZv5WjJ0TQD53K9tauQpBk0+AcMIFryAEzZ0LR8RwdaFkp9Q3keAjA0tww4cWhmf5bRy2XB
	EzSnZWUlrlwV5qkttSzEQ1voIbooVJuyznYHETnMvCcjtmfetm0Ae42bIlR/FiNVavPO6DoO2u6
	K+YD7VjPkh1J97ZVKfn0W+t2IdsUKyzCEP0d58+My+Q4cBSkfyCVwGBz4BFLI2ttwJvNJewctFg
	o4ahHxjfkSo81D7uwuHHcenHdrVEfjM4Q1uD4myYYqA48NXvd4Yw+1U4nQXyTwVXVrWzAOYpmHJ
	Un3oxEd7AU7zLDI49sf2H1XkfW4Oysbt0oBk/AaqrLxPbEBxIPkdp4AjYSsxCoukXkqDrzf7sZQ
	yqN7NYTwORAgJNILbMoW6U29MhAkI6WtQIbiPPV2Ic9U77qe8Df0zJvMb2wQgMETBs1OGEKq3DG
	AMDwx2CBwV8zutffFxt2YGnKWUtTT7DfEbzbVLPa6a/FT1879Utf7e+Rhj5klL31S6f37x9VRm8
	2hG2iI6oT84VXXHNivcaKfA==
X-Received: by 2002:a17:90b:1b0e:b0:3ac:9a54:e3ce with SMTP id 98e67ed59e1d1-3ad86ddec88mr739902a91.63.1792553100121;
        Tue, 20 Oct 2026 20:25:00 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8030226csm2155285a91.12.2026.10.20.20.24.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 20:24:59 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>,
	oe-linux-nfc@lists.linux.dev,
	gio@octane.security,
	stable@vger.kernel.org
Subject: [PATCH net v6 4/6] nfc: nfcmrvl: publish UART state before registration
Date: Wed, 21 Oct 2026 08:54:41 +0530
Message-ID: <20261021032443.44412-5-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021032443.44412-1-shubham@octane.security>
References: <20261021032443.44412-1-shubham@octane.security>
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

nfcmrvl_nci_uart_open() does not publish the UART back-pointers until
nfcmrvl_nci_register_dev() returns.  The registration call exposes the NCI
device first, so an early open can reach the transmit path while those
pointers are unset.  Its response is also dropped because the TTY receive
path is not enabled yet.

Add a transport callback which publishes the Marvell UART state and
enables its TTY callbacks before nci_register_device().  Halt the
controller before that publication.  The existing quiesce callback rolls
the state back if registration fails and withdraws it during normal
teardown.

The generic UART layer still marks the transport ready after ->open()
returns.  For Marvell, repeating the publication is idempotent.  It also
retains the fallback for transports without an early publication hook.

Found during a source audit assisted by OpenAI Codex, gpt-5.6-sol, and
reproduced with a pty-backed controller that returned CORE_RESET_RSP during
device registration.

Fixes: e097dc624f78 ("NFC: nfcmrvl: add UART driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM KASAN
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 drivers/nfc/nfcmrvl/main.c    |  9 ++++++---
 drivers/nfc/nfcmrvl/nfcmrvl.h |  1 +
 drivers/nfc/nfcmrvl/uart.c    | 16 +++++++++++-----
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index baf4c781ee6b..b6f47cce0f1f 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -154,15 +154,18 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 
 	nci_set_drvdata(priv->ndev, priv);
 
+	/* Ensure that the controller is powered off before exposing it. */
+	nfcmrvl_chip_halt(priv);
+
+	if (priv->if_ops->nci_ready)
+		priv->if_ops->nci_ready(priv);
+
 	rc = nci_register_device(priv->ndev);
 	if (rc) {
 		nfc_err(dev, "nci_register_device failed %d\n", rc);
 		goto error_fw_dnld_deinit;
 	}
 
-	/* Ensure that controller is powered off */
-	nfcmrvl_chip_halt(priv);
-
 	nfc_info(dev, "registered with nci successfully\n");
 	return priv;
 
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index 61b3f4a4f096..5c2a5382c280 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -112,6 +112,7 @@ struct nfcmrvl_if_ops {
 	int (*nci_open) (struct nfcmrvl_private *priv);
 	int (*nci_close) (struct nfcmrvl_private *priv);
 	int (*nci_send) (struct nfcmrvl_private *priv, struct sk_buff *skb);
+	void (*nci_ready)(struct nfcmrvl_private *priv);
 	void (*nci_quiesce)(struct nfcmrvl_private *priv);
 	void (*nci_update_config)(struct nfcmrvl_private *priv,
 				  const void *param);
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 66803f1c6fd3..95223c20d50f 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -44,6 +44,16 @@ static int nfcmrvl_uart_nci_send(struct nfcmrvl_private *priv,
 	return nu->ops.send(nu, skb);
 }
 
+static void nfcmrvl_uart_nci_ready(struct nfcmrvl_private *priv)
+{
+	struct nci_uart *nu = priv->drv_data;
+
+	priv->support_fw_dnld = true;
+	nu->drv_data = priv;
+	nu->ndev = priv->ndev;
+	nci_uart_set_ready(nu);
+}
+
 static void nfcmrvl_uart_nci_quiesce(struct nfcmrvl_private *priv)
 {
 	struct nci_uart *nu = priv->drv_data;
@@ -68,6 +78,7 @@ static const struct nfcmrvl_if_ops uart_ops = {
 	.nci_open = nfcmrvl_uart_nci_open,
 	.nci_close = nfcmrvl_uart_nci_close,
 	.nci_send = nfcmrvl_uart_nci_send,
+	.nci_ready = nfcmrvl_uart_nci_ready,
 	.nci_quiesce = nfcmrvl_uart_nci_quiesce,
 	.nci_update_config = nfcmrvl_uart_nci_update_config
 };
@@ -147,11 +158,6 @@ static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
 	if (IS_ERR(priv))
 		return PTR_ERR(priv);
 
-	priv->support_fw_dnld = true;
-
-	nu->drv_data = priv;
-	nu->ndev = priv->ndev;
-
 	return 0;
 }
 
-- 
2.43.0

