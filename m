Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93915471D01
	for <oe-linux-nfc@lists.linux.dev>; Tue, 13 Oct 2026 02:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860286; cv=none; b=c/sFDcTGqxKS7BZ70KE3kKnExMmwmV6sj+BI7OU0RYoAYfb897f9uub1M3dpxEKDuVUMyB32rr5cP/cvo85UynJ7NcvU5Q8KsbvUK8uazXT87cJd5IQoD7JZX9QShYKGN/u5oq+CotrKdqgdFpK6BScM0GSMDIaKPggR76acVGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860286; c=relaxed/simple;
	bh=Hmp6kD33CCTxbaHRrfzwTFQCBpL1CL9ksWeMOwmFTb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDQBmyHbXMAPzOWXuZHpZTZwDVeD2dsAFf93zu84niwK7U8SZ3S93TrH8OHmvt5S2DNzIs94D7Qbq3b6lVmTgllx/Yz9TdaRLnKreknRFQwJfkAR528VFtwz60j7apWYoQds0nB+elrtimY7pDgGevSRM60lNwrESePWERhQtbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=GI1JQZZq; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="GI1JQZZq"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1720399eec.1
        for <oe-linux-nfc@lists.linux.dev>; Mon, 12 Oct 2026 19:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791860284; x=1792465084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQbi0ubk7/MCTKPm4mHPKxuy2uo+88OVn5fQMncOhr8=;
        b=GI1JQZZqn5spZugxCKvTyRGjPqJV7KZ5aAi3dvzedZib1AXi3jP60kyAhydPkG9NvA
         Fv0H/RML4BH3eQvAA5Fie/JRnQjQ1fHXwi2t9vJCz71nBkGWBGehw5ZhC1Cjwm7/LqHt
         DjNlCUOMDKFpOSAaNI654VKn2n+NEeG9SvVj16FLBZEQnkGI2M0doGL+pAWVkx3TTD5h
         VH/Up4bAXIviXeV0jUeRX8eBlCQmzPKFK5fRvj6SpzM1baHYZY+YdfJRU4EP6QzUciYn
         ctx4EJL1jBmJdMLQzamc9tIq+UEFZfYJbjKcfOK9Rvl1ExVP9PzaNu39L5A82Dnrcl9V
         1pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791860284; x=1792465084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQbi0ubk7/MCTKPm4mHPKxuy2uo+88OVn5fQMncOhr8=;
        b=awMjEmoWF8zLwHqM31bGYxKYc0Cxewe2UZDU038WvhCxYeoZWFrZPC7PxhuzXftAR0
         CTjNS5ERlwImJv48gHlZAsxx5sGRfC42aUgxZvfmPjc7m6jX6++rE+9VUMrEYVAXoNkU
         ATfy+7Kab9yucAbD9qh7GYIy3Mqlo5NU5R6a8CazZKClpXcf3sKddEW0feADG+5Z3xJf
         6BCiXsv3cO1W/JHxzTzHRpBify3yFJvSPKhkgS7GyES5eGfR3XA+UUVRYfrjVJ1Tab2s
         GnRg2wYLBfkgQn0YR9n9paEW+8qTXCKWHM+Ko6b7FL13mGhWCsNw+3vLG6oBfX0y1jZ9
         fa8w==
X-Forwarded-Encrypted: i=1; AKwUvBxlIUWRu8n5iuyRZqlDKC/QfqgiL70ErLVBOKcOdxWlYkHhGDvlctthSZdzktNTJnRyzVg1JJ5xdPlq5lE=@lists.linux.dev
X-Gm-Message-State: AFq9FYJJGSM3eGKfSDlXHxF3qjWzWkZQdg4a8aYzF9po8qEhauzsjYqd
	cQAkSYlxnfY+SgHoIchYFwICZmU3BYIBXfozMcVqoi38G7gt90XdbfJbWBslnzTvnFI=
X-Gm-Gg: AYBFou0m6M0jiRygqXPGJTZPDSzhdNBXcOEf6hdMZLB2z5cLEhlTVZSm6iCgCoApEyw
	OnYcfEWwCd4QkgOYpcyaN4I0hq+xmKuno1egZpKCLv3ErZaGBBFsrrAwiVAtjVGx/RxkTGPEsc5
	wxO67S19IwuTI82q9jp2kp0qP5RtMq/Kx0a2qyBR7zlNcTO5YtF0njojZ93OcN9ssrS3mTIlOgO
	j1w0VpVPK/4VAVlrHHacZzWDplOIktKydWZApEq4PL5Q7nMWXEh8S1Vm2/+v8snfpDzwCUbIKlV
	G+3p4sHxaHe49T68FbJYp4GrJMI1mclHTtal4uPRswuC6tW6ComhQyahLr+YdOSyO0XcTR1paan
	+HS0HCp9mS3w1f3NNHVYnKQc33kYMFKCSMyGgfcjja5DLIFgIgkGhRkIs2xQ8JQj/AEHQ2SPS23
	gxk8rpPoT8xf4RhO8sRBKrhmAwZfr+iF7rQnWfNvrNh8z86rXHg/APsDYgTvj86BdO3yjle0FDY
	wZvXxKN9RIGt8W6dChgbHQ2oVxxkwJkqUG4Eayhz2tCGMnGyCPN6kEuBJMS42aZrmPgzT85uVpl
	sv+T6d88gOQBUg==
X-Received: by 2002:a05:701b:2910:b0:143:6080:668f with SMTP id a92af1059eb24-16a61789c7cmr15341521c88.7.1791860283446;
        Mon, 12 Oct 2026 19:58:03 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becefdsm34223721c88.7.2026.10.12.19.57.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 19:58:02 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	cuissard@marvell.com,
	sameo@linux.intel.com,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gio@octane.security,
	Shubham Antil <shubham@octane.security>,
	stable@vger.kernel.org
Subject: [PATCH net v5 2/2] nfc: nci: uart: quiesce write_work during teardown
Date: Tue, 13 Oct 2026 08:27:46 +0530
Message-ID: <20261013025746.41292-3-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261013025746.41292-1-shubham@octane.security>
References: <20261013025746.41292-1-shubham@octane.security>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nci_uart_tty_close() releases the active transmit state before ensuring
write_work has stopped.  A TTY write-wakeup can queue or run that worker
immediately before close, leaving the worker active while teardown
proceeds.

Serialize work scheduling and the worker's final state handoff with a
transmit lock.  Once closing starts, block new scheduling and synchronously
cancel the worker before freeing its skbs and queue.  Test and clear the
wakeup bit under the producers' lock.  This prevents a lost wakeup between
the worker's final test and clearing the sending bit.

Keep the transport close callback before the generic stop barrier because
NCI unregister may transmit a CORE_RESET command.  Require the transport to
quiesce UART callbacks before releasing its private state; the Marvell UART
transport does so after NCI unregister and before freeing that state.  Also
hold the transport module while its open callback runs and apply the same
worker barrier to the open-error path.

The teardown ordering issue was found during an LLM-assisted source audit
and reproduced using a pty-backed NCI UART under KASAN.

Fixes: 9961127d4bce ("NFC: nci: add generic uart support")
Cc: stable@vger.kernel.org
Assisted-by: LLM (OpenAI Codex, gpt-5.6-sol)
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 drivers/nfc/nfcmrvl/main.c    |  7 +++
 drivers/nfc/nfcmrvl/nfcmrvl.h |  1 +
 drivers/nfc/nfcmrvl/uart.c    |  8 ++++
 include/net/nfc/nci_core.h    |  3 ++
 net/nfc/nci/uart.c            | 90 ++++++++++++++++++++++++++++-------
 5 files changed, 91 insertions(+), 18 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 3d26a54ef51b..45c7d3546b0e 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -170,6 +170,8 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 	return priv;
 
 error_fw_dnld_deinit:
+	if (priv->if_ops->nci_quiesce)
+		priv->if_ops->nci_quiesce(priv);
 	nfcmrvl_fw_dnld_deinit(priv);
 	if (priv->if_ops->nci_unready)
 		priv->if_ops->nci_unready(priv);
@@ -186,10 +188,15 @@ void nfcmrvl_nci_unregister_dev(struct nfcmrvl_private *priv)
 	struct nci_dev *ndev = priv->ndev;
 
 	nci_unregister_device(ndev);
+	if (priv->if_ops->nci_quiesce)
+		priv->if_ops->nci_quiesce(priv);
+
 	if (priv->ndev->nfc_dev->fw_download_in_progress)
 		nfcmrvl_fw_dnld_abort(priv);
 
 	nfcmrvl_fw_dnld_deinit(priv);
+	if (priv->if_ops->nci_unready)
+		priv->if_ops->nci_unready(priv);
 
 	nci_free_device(ndev);
 	kfree(priv);
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index 66f8cc06e2d5..3b7483e5aff9 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -114,6 +114,7 @@ struct nfcmrvl_if_ops {
 	int (*nci_send) (struct nfcmrvl_private *priv, struct sk_buff *skb);
 	void (*nci_ready)(struct nfcmrvl_private *priv);
 	void (*nci_unready)(struct nfcmrvl_private *priv);
+	void (*nci_quiesce)(struct nfcmrvl_private *priv);
 	void (*nci_update_config)(struct nfcmrvl_private *priv,
 				  const void *param);
 };
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index d688071f4b26..164896070dfc 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -61,6 +61,13 @@ static void nfcmrvl_uart_nci_unready(struct nfcmrvl_private *priv)
 	nu->ndev = NULL;
 }
 
+static void nfcmrvl_uart_nci_quiesce(struct nfcmrvl_private *priv)
+{
+	struct nci_uart *nu = priv->drv_data;
+
+	nci_uart_tx_stop(nu);
+}
+
 static void nfcmrvl_uart_nci_update_config(struct nfcmrvl_private *priv,
 					   const void *param)
 {
@@ -77,6 +84,7 @@ static const struct nfcmrvl_if_ops uart_ops = {
 	.nci_send = nfcmrvl_uart_nci_send,
 	.nci_ready = nfcmrvl_uart_nci_ready,
 	.nci_unready = nfcmrvl_uart_nci_unready,
+	.nci_quiesce = nfcmrvl_uart_nci_quiesce,
 	.nci_update_config = nfcmrvl_uart_nci_update_config
 };
 
diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 664d5058e66e..ce0ffe56593a 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -436,6 +436,7 @@ struct nci_uart;
 
 struct nci_uart_ops {
 	int (*open)(struct nci_uart *nci_uart);
+	/* Quiesce callbacks before releasing transport-private state. */
 	void (*close)(struct nci_uart *nci_uart);
 	int (*recv)(struct nci_uart *nci_uart, struct sk_buff *skb);
 	int (*send)(struct nci_uart *nci_uart, struct sk_buff *skb);
@@ -452,6 +453,7 @@ struct nci_uart {
 	/* Dynamic data */
 	struct nci_dev		*ndev;
 	spinlock_t		rx_lock;
+	spinlock_t		tx_lock; /* protects tx_state */
 	struct work_struct	write_work;
 	struct tty_struct	*tty;
 	unsigned long		tx_state;
@@ -465,5 +467,6 @@ struct nci_uart {
 int nci_uart_register(struct nci_uart *nu);
 void nci_uart_unregister(struct nci_uart *nu);
 void nci_uart_set_config(struct nci_uart *nu, int baudrate, int flow_ctrl);
+void nci_uart_tx_stop(struct nci_uart *nu);
 
 #endif /* __NCI_CORE_H */
diff --git a/net/nfc/nci/uart.c b/net/nfc/nci/uart.c
index aa20e8603f32..8e54eb1c8712 100644
--- a/net/nfc/nci/uart.c
+++ b/net/nfc/nci/uart.c
@@ -33,6 +33,7 @@
 /* TX states  */
 #define NCI_UART_SENDING	1
 #define NCI_UART_TX_WAKEUP	2
+#define NCI_UART_CLOSING	3
 
 static struct nci_uart *nci_uart_drivers[NCI_UART_DRIVER_MAX];
 
@@ -58,24 +59,59 @@ static inline int nci_uart_queue_empty(struct nci_uart *nu)
 
 static int nci_uart_tx_wakeup(struct nci_uart *nu)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	if (test_bit(NCI_UART_CLOSING, &nu->tx_state))
+		goto unlock;
+
 	if (test_and_set_bit(NCI_UART_SENDING, &nu->tx_state)) {
 		set_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
-		return 0;
+		goto unlock;
 	}
 
 	schedule_work(&nu->write_work);
 
+unlock:
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
+
 	return 0;
 }
 
+void nci_uart_tx_stop(struct nci_uart *nu)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	set_bit(NCI_UART_CLOSING, &nu->tx_state);
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
+
+	cancel_work_sync(&nu->write_work);
+
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	clear_bit(NCI_UART_SENDING, &nu->tx_state);
+	clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
+}
+EXPORT_SYMBOL_GPL(nci_uart_tx_stop);
+
 static void nci_uart_write_work(struct work_struct *work)
 {
 	struct nci_uart *nu = container_of(work, struct nci_uart, write_work);
 	struct tty_struct *tty = nu->tty;
 	struct sk_buff *skb;
+	unsigned long flags;
 
 restart:
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	if (test_bit(NCI_UART_CLOSING, &nu->tx_state)) {
+		clear_bit(NCI_UART_SENDING, &nu->tx_state);
+		clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
+		spin_unlock_irqrestore(&nu->tx_lock, flags);
+		return;
+	}
 	clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
 
 	if (nu->ops.tx_start)
 		nu->ops.tx_start(nu);
@@ -93,48 +129,65 @@ static void nci_uart_write_work(struct work_struct *work)
 		kfree_skb(skb);
 	}
 
-	if (test_bit(NCI_UART_TX_WAKEUP, &nu->tx_state))
-		goto restart;
-
 	if (nu->ops.tx_done && nci_uart_queue_empty(nu))
 		nu->ops.tx_done(nu);
 
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	if (!test_bit(NCI_UART_CLOSING, &nu->tx_state) &&
+	    test_and_clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state)) {
+		spin_unlock_irqrestore(&nu->tx_lock, flags);
+		goto restart;
+	}
 	clear_bit(NCI_UART_SENDING, &nu->tx_state);
+	clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
 }
 
 static int nci_uart_set_driver(struct tty_struct *tty, unsigned int driver)
 {
+	struct nci_uart *template;
 	struct nci_uart *nu = NULL;
 	int ret;
 
 	if (driver >= NCI_UART_DRIVER_MAX)
 		return -EINVAL;
 
-	if (!nci_uart_drivers[driver])
+	template = nci_uart_drivers[driver];
+	if (!template)
+		return -ENOENT;
+
+	if (!try_module_get(template->owner))
 		return -ENOENT;
 
 	nu = kzalloc_obj(*nu);
-	if (!nu)
+	if (!nu) {
+		module_put(template->owner);
 		return -ENOMEM;
+	}
 
-	memcpy(nu, nci_uart_drivers[driver], sizeof(struct nci_uart));
+	memcpy(nu, template, sizeof(struct nci_uart));
 	nu->tty = tty;
 	skb_queue_head_init(&nu->tx_q);
 	INIT_WORK(&nu->write_work, nci_uart_write_work);
+	spin_lock_init(&nu->tx_lock);
 	spin_lock_init(&nu->rx_lock);
 
 	ret = nu->ops.open(nu);
-	if (ret) {
-		kfree(nu);
-		return ret;
-	} else if (!try_module_get(nu->owner)) {
-		nu->ops.close(nu);
-		kfree(nu);
-		return -ENOENT;
-	}
+	if (ret)
+		goto err_stop;
+
 	tty->disc_data = nu;
 
 	return 0;
+
+err_stop:
+	nci_uart_tx_stop(nu);
+	kfree_skb(nu->tx_skb);
+	kfree_skb(nu->rx_skb);
+	skb_queue_purge(&nu->tx_q);
+	module_put(nu->owner);
+	kfree(nu);
+	return ret;
 }
 
 /* ------ LDISC part ------ */
@@ -180,17 +233,18 @@ static void nci_uart_tty_close(struct tty_struct *tty)
 	if (!nu)
 		return;
 
+	/* The transport quiesces callbacks before releasing private state. */
+	nu->ops.close(nu);
+	nci_uart_tx_stop(nu);
+
 	kfree_skb(nu->tx_skb);
 	kfree_skb(nu->rx_skb);
 
 	skb_queue_purge(&nu->tx_q);
 
-	nu->ops.close(nu);
 	nu->tty = NULL;
 	module_put(nu->owner);
 
-	cancel_work_sync(&nu->write_work);
-
 	kfree(nu);
 }
 
-- 
2.43.0
