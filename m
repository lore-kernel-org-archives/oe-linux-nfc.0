Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553104;
	b=E5pWqf7uPuTKOncb7edKHPbv5FyAtDtU0KxU7jqc5uW8C49fjgunRIlx+wiDqk/uqYcU
	 t6soVW8/AuSuG8BjN2VGXCJDSPXfrnn/45B5JwEj1bSbJmfznQeIwOXj13zGYqrDJAld7
	 syiWXFzFuBPZTs2Gf4Bk1Vr0ak4cIBEZdvM1uxzuv8mXPeup3mjJBRliA1m4QWSOhZp+K
	 HIMH4Bt92O4eSe1hILeNQhnPTfk+sTCJrZf/tRN0w+8pb1BEF4njR38jvcHZIl2sIFUBH
	 sHJt0rqcZPIvo7BnwlxXqt1OIKDeOXL3bkeL+xc4F9B5wjpAz9gyZX858cT4LoyAleQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6rj9QUbsFJOA4qpafrOsme0S3/Ei7bet+9iObpPybeA=;
	b=tbO6MmimiPxPki6VNwhl5SFhdf6VpEhwxkvNfX3cBc4/34dr91dS0Yc1w2fcm/snHdik
	 elGlOGq+A/p4VvZkSmJVLZcvq0NSJT0kTdwMI3AxjGuiTeGu5pwViIrNVT3/1LmTDQte7
	 QlaIHBtVU3FcSR0GENsivu50RQdNQ7/+zEZfiYmORRqfKAl/9+lW+pR4hO3gV6fWp1Iq7
	 zo5y4XPDzxniPLlvv397Tb0uW5SXVzf5L+zP9GhxrGV86r8TE30PObL+RLKrO38enUGT6
	 cFi2+Pvo+UeWCNrPavFa6kqoAiygJJm5qI2t/QN3tyMdVrupl1sWinUxG30EdrqAKXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=octane.security;
	spf=pass smtp.mailfrom=octane.security;
	dkim=pass header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=m3XWvpnb;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7030606E86D
	for <oe-linux-nfc@lists.linux.dev>; Wed, 21 Oct 2026 03:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7030606E86D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=m3XWvpnb
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso1195485ad.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 20 Oct 2026 20:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1792553103; x=1793157903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rj9QUbsFJOA4qpafrOsme0S3/Ei7bet+9iObpPybeA=;
        b=m3XWvpnbL36Ln/ZDjNsZaMm+8Mjm3o8C1H+589i4LHuJyK34DtI9Mim1DsHB6HaIa8
         CEeqkqXMlpz6FYkP27YLc30OTzfIRPAJlWhsFdk/G8KbrcSZbaCRx4OQLh67f1zIRTqz
         lCfROX/w12tO5G8tJzBkkhvJyglvHTM7FVZBjmHb2P/W+nxNsQznT6WVKoIMv+b+GruG
         PQAaCHmPzGWWsneaZhNdWtfpiTyZYGYX+ymBp72W60JOshM6LRVKVfig1V2hZBj0MBkh
         2VYpaaH44pYwJeQIYLaj3MJutpFSQKqoo7RiAI8DX8+9sImSOiTWmSIYs4DOVRgl6TzY
         WZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792553103; x=1793157903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rj9QUbsFJOA4qpafrOsme0S3/Ei7bet+9iObpPybeA=;
        b=n4/LnICHbQ+naXOxKk285HM7Ufu7fCmrWBrN2LJK1QY60f/MbrioxCpw6JxB2uEJWT
         wfYUKUHdex49OB9TJ198U4WiKT+hBg7tEUKYhl3/g6X0JWg4MWWlQCIyDtyAsz1372qI
         uyX7XDeg68NFYLEzZotzhvPGqq1W+jjJIT50vwS5fmlq6Iev26sNwGl+t1EJyfzPa3er
         RmnjJ8KfQDEtmA3KJeTJ+kMO5yZjPYeaR4D3NSKPWGVy78N6KGI7xEfndjMGvqollUqE
         8jwkkhz5Mrslrlaebdeu8oNPt3zMm3Q6Qck9Zg1B3Ztk9LJJSdlVcRvRcIhCPUsqf25N
         cSUg==
X-Forwarded-Encrypted: i=1; AKwUvBxEKyJ6/DIj1mx8PgegCu4/3K90MZwDiTlCHZp5BrhQ0rNO8kZXUqsSRYcZm82C6boiHAWPmtbHH9ynFls=@lists.linux.dev
X-Gm-Message-State: AFq9FYI1bvK6lkQchYDhp6/oz3eVojMMmLR+gLOf/HJ7jBCdGN858+vX
	d5JW6+WUE8wK+eosHfo9Y3B0NdAid0dceDHNWisSlByTsvyV2BGeW6tHCsIrKt8hCgc=
X-Gm-Gg: AYBFou1Ja+9xx2Psdehr5dmIKEmU84x9gYXmHoNXwDoPeI8CyXO0ndiwgf2B5iSaUQA
	K/f6pnhHx5+BJQZi6H3Ox9Xx3z535gbAKIOkFbwiZpWNaOkxQhbRW7nlV9h8bEX+NhQjQnM0WN2
	w0TeszzeHovkZRNvOLorSJk68KyBXfueg8Q/edEL9w4v/WOLdJUNoLbQRrWwXLmWLvOhT+dR76P
	+2RSWc/FhdVoKpNBSUJoejE3ZfOQhT7ow15rcnzOev9rg6n44k/ll9k0GYvAqTfSbI6YOYVVAhr
	LlSyhDzyet9FTnPsGxH1mLSSX71ZxT4G/cCzfZoNJWYxeoMvpDxCkSrOw4/62G5SERpo+78Y8iX
	B9vxSw+4pOgCqspogyvH6n9ocJndzqUUoMKMh2OjpGUG+A378uuZZTGXZ5389cgrall2JTuHYYL
	aidQD1zQAQJ633uXJH0cWhSi7O27twXx9c244IZ7nouWV9TvEA9fITRacZFxIJ99us3GgC7neiR
	oAEmE1qY0Q5yc3GH8HerATIsCSNIQXhflsNFq+O2uUWRV//qoyli8tL5i1vByrbouIvtOtVVh1Y
	59uR6zMgwWewIdMc3ftPA1k2XC1HQ8Tk8RKOPHtg0/JRUsZXNzr+z/klzGtUHKNZbord30qJaun
	d
X-Received: by 2002:a17:90a:c107:b0:3a8:495b:d64b with SMTP id 98e67ed59e1d1-3ad86c2e6dfmr718797a91.4.1792553102953;
        Tue, 20 Oct 2026 20:25:02 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8030226csm2155285a91.12.2026.10.20.20.25.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 20:25:02 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>,
	oe-linux-nfc@lists.linux.dev,
	gio@octane.security,
	stable@vger.kernel.org
Subject: [PATCH net v6 5/6] nfc: serialize firmware download state
Date: Wed, 21 Oct 2026 08:54:42 +0530
Message-ID: <20261021032443.44412-6-shubham@octane.security>
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

nfc_fw_download() marks a firmware download in progress but does not reject
a second request.  An overlapping request can replace driver-owned download
state, and an error from that request clears the shared in-progress flag
while the first download is still running.

Make the in-progress state atomic and claim it before invoking the driver.
An overlapping request then leaves the first download's state unchanged.
Copy the firmware name before releasing that claim, then send the
completion notification after the release so userspace can immediately
start its next operation.  Use release/acquire ordering so the next
operation observes the completed download cleanup.

OpenAI Codex, gpt-5.6-sol assisted a source audit of NFC firmware teardown.

Fixes: 9674da8759df ("NFC: Add firmware upload netlink command")
Cc: stable@vger.kernel.org
Assisted-by: LLM KASAN
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 drivers/nfc/nfcmrvl/main.c       |  4 ++--
 drivers/nfc/nfcmrvl/uart.c       |  4 ++--
 drivers/nfc/st-nci/vendor_cmds.c |  8 ++++----
 include/net/nfc/nfc.h            |  3 ++-
 net/nfc/core.c                   | 19 ++++++++++++++-----
 5 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index b6f47cce0f1f..27fadd64155e 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -189,7 +189,7 @@ void nfcmrvl_nci_unregister_dev(struct nfcmrvl_private *priv)
 	if (priv->if_ops->nci_quiesce)
 		priv->if_ops->nci_quiesce(priv);
 
-	if (priv->ndev->nfc_dev->fw_download_in_progress)
+	if (atomic_read(&priv->ndev->nfc_dev->fw_download_in_progress))
 		nfcmrvl_fw_dnld_abort(priv);
 
 	nfcmrvl_fw_dnld_deinit(priv);
@@ -213,7 +213,7 @@ int nfcmrvl_nci_recv_frame(struct nfcmrvl_private *priv, struct sk_buff *skb)
 		}
 	}
 
-	if (priv->ndev->nfc_dev->fw_download_in_progress) {
+	if (atomic_read(&priv->ndev->nfc_dev->fw_download_in_progress)) {
 		nfcmrvl_fw_dnld_recv_frame(priv, skb);
 		return 0;
 	}
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 95223c20d50f..d87f6497baf2 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -176,7 +176,7 @@ static void nfcmrvl_nci_uart_tx_start(struct nci_uart *nu)
 {
 	struct nfcmrvl_private *priv = (struct nfcmrvl_private *)nu->drv_data;
 
-	if (priv->ndev->nfc_dev->fw_download_in_progress)
+	if (atomic_read(&priv->ndev->nfc_dev->fw_download_in_progress))
 		return;
 
 	/* Remove BREAK to wake up the NFCC */
@@ -190,7 +190,7 @@ static void nfcmrvl_nci_uart_tx_done(struct nci_uart *nu)
 {
 	struct nfcmrvl_private *priv = (struct nfcmrvl_private *)nu->drv_data;
 
-	if (priv->ndev->nfc_dev->fw_download_in_progress)
+	if (atomic_read(&priv->ndev->nfc_dev->fw_download_in_progress))
 		return;
 
 	/*
diff --git a/drivers/nfc/st-nci/vendor_cmds.c b/drivers/nfc/st-nci/vendor_cmds.c
index 6335d7afca24..ec577d497500 100644
--- a/drivers/nfc/st-nci/vendor_cmds.c
+++ b/drivers/nfc/st-nci/vendor_cmds.c
@@ -158,11 +158,12 @@ static int st_nci_hci_dm_fwupd_start(struct nfc_dev *dev, void *data,
 	int r;
 	struct nci_dev *ndev = nfc_get_drvdata(dev);
 
-	dev->fw_download_in_progress = true;
+	if (atomic_cmpxchg_acquire(&dev->fw_download_in_progress, 0, 1))
+		return -EBUSY;
 	r = nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
 			ST_NCI_HCI_DM_FWUPD_START, data, data_len, NULL);
 	if (r)
-		dev->fw_download_in_progress = false;
+		atomic_set_release(&dev->fw_download_in_progress, 0);
 
 	return r;
 }
@@ -181,8 +182,7 @@ static int st_nci_hci_dm_direct_load(struct nfc_dev *dev, void *data,
 {
 	struct nci_dev *ndev = nfc_get_drvdata(dev);
 
-	if (dev->fw_download_in_progress) {
-		dev->fw_download_in_progress = false;
+	if (atomic_xchg(&dev->fw_download_in_progress, 0)) {
 		return nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
 				ST_NCI_HCI_DM_LOAD, data, data_len, NULL);
 	}
diff --git a/include/net/nfc/nfc.h b/include/net/nfc/nfc.h
index bcafab5c53e5..f6cb17f46ca7 100644
--- a/include/net/nfc/nfc.h
+++ b/include/net/nfc/nfc.h
@@ -11,6 +11,7 @@
 #ifndef __NET_NFC_H
 #define __NET_NFC_H
 
+#include <linux/atomic.h>
 #include <linux/nfc.h>
 #include <linux/device.h>
 #include <linux/skbuff.h>
@@ -172,7 +173,7 @@ struct nfc_dev {
 	int targets_generation;
 	struct device dev;
 	bool dev_up;
-	bool fw_download_in_progress;
+	atomic_t fw_download_in_progress;
 	u8 rf_mode;
 	bool polling;
 	struct nfc_target *active_target;
diff --git a/net/nfc/core.c b/net/nfc/core.c
index f521669293f0..1f335fa7f6f0 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/rfkill.h>
 #include <linux/nfc.h>
+#include <linux/string.h>
 
 #include <net/genetlink.h>
 
@@ -53,10 +54,14 @@ int nfc_fw_download(struct nfc_dev *dev, const char *firmware_name)
 		goto error;
 	}
 
-	dev->fw_download_in_progress = true;
+	if (atomic_cmpxchg_acquire(&dev->fw_download_in_progress, 0, 1)) {
+		rc = -EBUSY;
+		goto error;
+	}
+
 	rc = dev->ops->fw_download(dev, firmware_name);
 	if (rc)
-		dev->fw_download_in_progress = false;
+		atomic_set_release(&dev->fw_download_in_progress, 0);
 
 error:
 	device_unlock(&dev->dev);
@@ -73,9 +78,12 @@ error:
 int nfc_fw_download_done(struct nfc_dev *dev, const char *firmware_name,
 			 u32 result)
 {
-	dev->fw_download_in_progress = false;
+	char name[NFC_FIRMWARE_NAME_MAXSIZE + 1];
+
+	strscpy(name, firmware_name, sizeof(name));
+	atomic_set_release(&dev->fw_download_in_progress, 0);
 
-	return nfc_genl_fw_download_done(dev, firmware_name, result);
+	return nfc_genl_fw_download_done(dev, name, result);
 }
 EXPORT_SYMBOL(nfc_fw_download_done);
 
@@ -104,7 +112,7 @@ int nfc_dev_up(struct nfc_dev *dev)
 		goto error;
 	}
 
-	if (dev->fw_download_in_progress) {
+	if (atomic_read_acquire(&dev->fw_download_in_progress)) {
 		rc = -EBUSY;
 		goto error;
 	}
@@ -1073,6 +1081,7 @@ struct nfc_dev *nfc_allocate_device(const struct nfc_ops *ops,
 	dev->dev.class = &nfc_class;
 	dev_set_name(&dev->dev, "nfc%d", dev->idx);
 	device_initialize(&dev->dev);
+	atomic_set(&dev->fw_download_in_progress, 0);
 
 	dev->ops = ops;
 	dev->supported_protocols = supported_protocols;
-- 
2.43.0

