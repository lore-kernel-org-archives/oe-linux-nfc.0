Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE4F3E6DF7
	for <oe-linux-nfc@lists.linux.dev>; Tue,  6 Oct 2026 11:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287746; cv=none; b=usm7HBzz2kerYPIuxFXH+mXqKD3a8od348JlrHIvNxpYWtVd16WBsbJmWVtXxCcOrdXqTZ5JmwnM1a3rmfgZM0VKQXCvfqz7NYhJJ6Lx7mX8i63c0nBiVLwmBf7vzXMdEIlDF6DWBWMbyHPgJEWJtMx3fQ8/p0sgoPDW0Xz4nJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287746; c=relaxed/simple;
	bh=PYDA2NsGtvdEO6m48SQvTOJ4Ei1MI+nEE3W/KkMJ/BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yjn/zrHGpg+OJq/pWx2PY36Z77lQYonZ85ZpcZES0PIghEi11vSTg3XrqdQzVWX8u9F/EjjlfZxakjvUFjeXa7n/CRDnllIgEf/FAO0ogJ27qmVJP6m7oQzC0KDKs/OSP8VaDFxHpCLFi2r5cNeUVQDh8G4C60AjQOX5moGzX1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=YnLCvmtx; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="YnLCvmtx"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-34ceab2900eso654075eec.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 06 Oct 2026 04:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791287744; x=1791892544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rp9ExwtVwETjuUXyxP6tQzqH186LBUjG5zHp0li/qcw=;
        b=YnLCvmtxjZGoCMQD//0Ju3dGPoMku0Ln3r9Xkcn3yT7aXKG10Y9QC0nCip+o/Wk/kd
         dWtA0dEX+QF42zyVf1Ot1PvHfRSIiPTg32jnS5PIGNcFpvaHwsPbQMf8brsylU6YxIbK
         BIRBYuYRPTQsqrsFdF7fq/MiAkTq5zQdhk0iatq9FygwXU/PZb7a+Dyv8E3yCIQ8yw/m
         C7NhMj2tAXVMIyWO3INr7b0Ggpxh/UBMJmTpmrtc922WqeGo8knlIjEoUkW+NDiyulrq
         7nJk0TCcWtziWA5HsaDHHHJrN/2da0ASIEXSd6P7C3cgNNX1BguT5OfNwUdAXUdLi+WX
         BYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791287744; x=1791892544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rp9ExwtVwETjuUXyxP6tQzqH186LBUjG5zHp0li/qcw=;
        b=OSJ1ftNl4i32Q2Qvo6p/eofd6oBSwXsgTRz/NtpeoC7ucNwlB1nWScd++uczzoTrxz
         tB+KTfCIuI/MezOkCKwt/LDFaKmpZRTwCkLQmnNT8v60Fzxuogd4Asg3ThJgLAUrjmIs
         xgPCgZr1LJClTwiXg+WuhbHYAifEShb2Ac2heE2eW0rVH/5LPNKzqhzl4xoA3J5Pal9B
         swFSYzRZGVeCZPvc6bk8EE2hKmFxZAHVNvKV0dGXyh3+f7YOlVdpHxGAEe4OJxDXc3CZ
         Ar1ys2thRpkoKOBEexD5k/ifsS8EFnZgqOiyeOI2tpOK059+4lzjpn2UivKd3IBu8qSZ
         X7dg==
X-Gm-Message-State: AFuF++mGL93U4mnQ3rb7uCtU6Yr7AU44xqGuvhw5lTKv4x7C4CP3aeID
	OQDN2NnAMnxJ4vcRmlleEgkYQMZR2oER+MSgmmzn3GsAnn7FjDvz3MMPw6iu8G4Pthk=
X-Gm-Gg: AYBFou235/5swDPhMb9PAninyey4Ws7zPwKro30G82Ui8fwU8INnmxaPdy0StcMkBBn
	Q+JiNLR0kXAKcrfR1mXeVNNQn4KXHylRqLMiAV0EPYuuYzKGyPL19lMreSoTRJDW9cOy1pyiiiC
	u0HhrsdSiS5bBziVMlXIGwLBofOae7XfTvhosnL4dxjaYDw55hg7jF3YIVM+ld1SHGxEzAheUR0
	RcQEFoXZJOgG0SWD5tIc/8zy/O6K2r51aOT3/dD+2tSzvrnm3mZzU7/3IQxOf/SUBD1Kr/zA68S
	WUdadN62Z47U2xiMJfMUt5QiWxMOSVSX8oM5yvFmni5CumoaIGIIufwU1FBZD/4BSFK66f0oN7w
	tFKqs6cLHWokjPpsP4xUuRbtkm7sA5ivmBPd1jO/j+KBpvf5uWlDskOR1VWH5dkGxJCo0vslI8Z
	p6DDwb1NVNHlIK0mAeGE1Q8RGnye9GyR29eviS5qcuhC5kwLUx+eF8F3dsP34Kp+efLPhxnoUHc
	ibCBLgyjkQXdyVd4+QFSpA1AJ14UUVkkLNymNhgWKoRxBayYjWzxYZyluVIsptottTn7agPkuVo
	G2xdFnIuEi805jJDFQU=
X-Received: by 2002:a05:7301:4601:b0:351:1f6c:2a85 with SMTP id 5a478bee46e88-3514e2e78edmr1202521eec.14.1791287743780;
        Tue, 06 Oct 2026 04:55:43 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469f75fesm8638511eec.5.2026.10.06.04.55.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 04:55:43 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	Giovanni Vignone <gio@octane.security>
Subject: [PATCH v4 1/2] nfc: nfcmrvl: set drv_data before registering the nci device
Date: Tue,  6 Oct 2026 17:25:30 +0530
Message-ID: <20261006115532.72100-2-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261006115532.72100-1-shubham@octane.security>
References: <20261006115532.72100-1-shubham@octane.security>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfcmrvl_nci_uart_open() stores the per-ldisc back-pointer nu->drv_data
only after nfcmrvl_nci_register_dev() has returned.  That function
registers the nci device, and a transmit started during registration
reaches the UART write path

  nci_uart_write_work() -> nu->ops.tx_start()
  == nfcmrvl_nci_uart_tx_start()

which dereferences nu->drv_data:

  struct nfcmrvl_private *priv = (struct nfcmrvl_private *)nu->drv_data;

  if (priv->ndev->nfc_dev->fw_download_in_progress)

At that point nu->drv_data is still NULL:

  BUG: KASAN: null-ptr-deref in nfcmrvl_nci_uart_tx_start+0x2c/0xc0
  Workqueue: events nci_uart_write_work
  Call Trace:
   nfcmrvl_nci_uart_tx_start
   nci_uart_write_work
   worker_thread

Publish nu->drv_data (and nu->ndev) for the UART phy before
nci_register_device() is called, and clear them again if registration
fails, so that a transmit triggered during registration finds a valid
pointer.  The now-redundant assignment in nfcmrvl_nci_uart_open() is
removed.

Fixes: e097dc624f78 ("NFC: nfcmrvl: add UART driver")
Assisted-by: LLM Claude
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 drivers/nfc/nfcmrvl/main.c | 17 +++++++++++++++++
 drivers/nfc/nfcmrvl/uart.c |  3 ---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 6efa83219..8186e86d7 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -96,6 +96,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 				const struct nfcmrvl_platform_data *pdata)
 {
 	struct nfcmrvl_private *priv;
+	struct nci_uart *nu = NULL;
 	int rc;
 	int headroom;
 	int tailroom;
@@ -110,6 +111,9 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 	priv->dev = dev;
 	priv->phy = phy;
 
+	if (phy == NFCMRVL_PHY_UART)
+		nu = drv_data;
+
 	memcpy(&priv->config, pdata, sizeof(*pdata));
 
 	if (!priv->config.reset_gpio) {
@@ -154,9 +158,22 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 
 	nci_set_drvdata(priv->ndev, priv);
 
+	/* For the UART phy the transmit path reaches the driver through
+	 * nu->drv_data; publish it before nci_register_device() so a transmit
+	 * triggered during registration does not dereference a NULL pointer.
+	 */
+	if (nu) {
+		nu->drv_data = priv;
+		nu->ndev = priv->ndev;
+	}
+
 	rc = nci_register_device(priv->ndev);
 	if (rc) {
 		nfc_err(dev, "nci_register_device failed %d\n", rc);
+		if (nu) {
+			nu->drv_data = NULL;
+			nu->ndev = NULL;
+		}
 		goto error_fw_dnld_deinit;
 	}
 
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 9aedd1687..421e6dc99 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -138,9 +138,6 @@ static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
 
 	priv->support_fw_dnld = true;
 
-	nu->drv_data = priv;
-	nu->ndev = priv->ndev;
-
 	return 0;
 }
 
-- 
2.43.0

