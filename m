Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773239;
	b=q93NsNuC1ocmZLK38o005GNk1GeOXJ4cMT5ufj8OHFj1SWMmB8URHG2LRkriPKwjgu56
	 tsK6+ZgW5HLCJgi5KwKbi0xZHa+YeBwj4e3YFk7fyZwS0awKYrUxHL1fLimn8oIn+fu8m
	 dy5817k5Al/J5Ehf+lcZqlnRBali+lcDyr1bfgj1behofqOcGnlsmMvFfRYHmEi/diax6
	 NtLFQFfLDUHauFt9X0S3DToohESw0399zaLgfdWIJNxdHGEYfxrse8/vq34nb6G/gfmGZ
	 uttvyWjtYWIwFFdF2YZztxbd6oywzf2vyjlLcw9RB/6ikB7K/nmEHKWIj9VQrQIOfWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CunNi0WoZeC7/a5MvV/P1anO2Wdj5ACeH4FRxQtP5e0=;
	b=Fj/yIqQUu7kpBOHEb1XKBZMayQRuQQAZb3HRCEXki+YPX9TQMfVoVfxq7hsdBQnL/jlc
	 ff8RAPXrdJdBbxM/AYjO4cjsackJDGMMpngc/THwUD9tzwaec4Hld+8NXu1k9ArGFsiqM
	 CUd52wJotz1LrgWygVxqE6t15UTxBYGDByOVhnFccZ96qBdNEv2/s1j5akKbXoern9r2P
	 lJQupMJpBU3FJb30nzULV6fc35Lam/E9X5ygRAnSvvRtQBWLIg49Td0Tl+VaMiDx5dDvn
	 l6hRCtxwQzS2HtWFdIXi0USok4i1dp5dpMxb4Z6IENVv6qqfvRz0JIog+ByJ2X40sCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=octane.security;
	spf=pass smtp.mailfrom=octane.security;
	dkim=pass header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=JeOrrVto;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C19606A328
	for <oe-linux-nfc@lists.linux.dev>; Wed,  4 Nov 2026 06:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C19606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=JeOrrVto
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2af4c8d00so873212c88.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 03 Nov 2026 22:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1793773238; x=1794378038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CunNi0WoZeC7/a5MvV/P1anO2Wdj5ACeH4FRxQtP5e0=;
        b=JeOrrVtov7QPqzwFy45KlXyT9cOn1hE+6a3wYYCwULvQYyNwDdk084GKtlMfT9bphN
         b53Z+zxh6QrEQZJBATka2z3NH1hr471+mv7veJAFNfFulabC+vR4lJwhYvphvjtnwPNv
         Eq0/BoxIYANhdxo7UEaj3Reomzo32Y4MJO+Zo7A1O4ZKr2t0xFaDbaPTBffMqITD+2rl
         SIBlT9iLHnPdZobH6PHvn7n+lcXbkAAQW2D/uNM28uPvobJ1SUiPejGf7GWsPbuKz3OZ
         HpXLo8xKHfb/8qNxv8dR6SUntVi1IXG9FxoTBzZrUEe0k5BGCV1Ug7GctzEnwR02YqTu
         Jh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773238; x=1794378038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CunNi0WoZeC7/a5MvV/P1anO2Wdj5ACeH4FRxQtP5e0=;
        b=XNnwzP92GLUfcmE4XuJHzKWkEuae1chiXnx3AxgZDoFc43dFT5IxUs0hRvRpbDQfXx
         x2LimE+krzMwGENHTp0968a3Ew/hRoCvi3xCMBh0OfQGok75lAy756kdE7/O6GT1qVl+
         IYKYw9APGM4IufWbIgbIEh/rmCoSXfd8dD4kgob/rjoBBn7LKiT21i4CEzoZe4/qgiVk
         iIibH414XYuVdYYIlq6Mm0p+mvDmVG1Fk83pCYjdOYhzz8qAwMu8tGp6rQq2N/+WTC/0
         uyfdg4gJ60FuyBFYtETE5OB5LxdJpIxNQI/jqk5bd/rhKbBPwUK7GigUfSjFftlK80ox
         T03w==
X-Gm-Message-State: APuU4Z/cxwEA7DTuW0t5OSYrsODhTWKiqbnByAkP1kNhE+iTHrtRFd9l
	kyHdxSBKcbMhQ8lCPu5CIrnfAoPqr08b16/44AhoacgZ7XNHcvbECoQtU/CImaDAC/wsFtA/ZEq
	7F4YC
X-Gm-Gg: AYBFou0z6KzLEj/WTHXruVuBJIOLiU5lsqqoYWOC5tKBqr5nP29dZZ3N3ZJNgNvbNSC
	UcgCJa/uSvqic5h7a/dYWIk7m6SKwu6CnVO8wM0sTPLh0tOiefErnSlje1tUScY1gGMZ9BccC8c
	89u0HLzpUe9TbGicQ6U1SmVQwV19sh95hfBy/gP6Eo/Qs6csBo0pczSmCrM4DtPBk9jLt4ziyP6
	1dbwLCcplUFsp9wz+XLfQN4Y8hTKcs31Lwx1khWKdEoEtfiR8zMuGTIv/uOyR2PoxHPY/klbz9b
	77puq6hokj5mjiWbPet2sN45vWt/cF0An/ROLOlIa8iAs3MWmA1ctpCap+pNdZjJm5jAJl6w+Ei
	KGLZk8c1sXb+YieG26PEUilpYdANEbEp4r4ZnN8RwlmelpenEcJFVa49Z970bAokxYQAomLfrZj
	yfHLv2MszQ4k+/vpDZNzMweBL0RBLqazQbTHdEtoJwcZdsHrMlc5o03sbXlrVNYFDojYpyjvzDM
	8w8Cz5ZfaeDkHyAPdjwhJJ6KVBHI7L3NW4Kq9KgAxVXOUM7kvs5du8XIbobdl0WUe+qQbeF/F2U
	A+UU3xsB5PUvqUKsg7VpjFbkB6dX84OGw6IGZ5BWF00GzI1w2Nw4gUNYVVV9NFMH6sHHNatTVB5
	qIsEpznIScvLSKJEtRdMU0wPCRrcgmR9RCjQqqoFDyC4sUXkbBy3VxZu6+bT+UJTrw8rXaQ==
X-Received: by 2002:a05:701b:4213:20b0:16c:4eef:a526 with SMTP id a92af1059eb24-1ac5a0b430bmr24216913c88.15.1793773237329;
        Tue, 03 Nov 2026 22:20:37 -0800 (PST)
Received: from localhost.localdomain ([103.196.55.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c69c3fsm4486279c88.20.2026.11.03.22.20.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 22:20:36 -0800 (PST)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	david@ixit.cz,
	horms@kernel.org,
	gio@octane.security
Subject: [PATCH net v7 2/3] nfc: nci: uart: quiesce callbacks during teardown
Date: Wed,  4 Nov 2026 11:50:25 +0530
Message-ID: <20261104062026.80599-3-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104062026.80599-1-shubham@octane.security>
References: <20261104062026.80599-1-shubham@octane.security>
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

nci_uart_tty_close() releases transport state before ensuring that the
UART write worker and receive callback have stopped using it.  A write
wakeup can also race the worker's final TX_WAKEUP test and SENDING handoff.

The Marvell open path has a related publication window.  It registers the
NCI device before publishing the UART back-pointers and enabling receive
callbacks, so an early device-open can use unset transport state or lose
the controller response.

Serialize transmit scheduling and the worker's final state transition.
Once quiescing starts, block new work and cancel the worker synchronously.
Balance tx_start() with tx_done() if teardown catches an active transmit
burst, and make readiness publication restart an already queued frame.

Publish the Marvell UART state before NCI registration exposes the device
and roll the state back if registration fails.  On close, detach TTY
callback admission first but keep transmit available while the transport
unregisters, so the existing close-time CORE_RESET can still be sent.
Then stop generic callbacks, halt the controller when a reset GPIO is
available, and withdraw the UART back-pointers before releasing private
state.  Apply the same barriers to the failed-open path.

Discovered during an AI-assisted source audit using OpenAI Codex,
gpt-5.6-sol.  Patch development and test planning used the same assistant.
Confirmed with repeated NCI UART registration, device-open, and hangup
cycles using an unmodified kernel and a pty-backed user-space controller;
no error injection was used.

With the fix applied, the registration/publication reproducer passed 20
cycles under KASAN, UBSAN, and lockdep, and 5 cycles under strict-mode
KCSAN.  Lifecycle testing observed all four expected CORE_RESET commands.
No physical Marvell controller was available, and no in-tree selftest
covers this UART path.

Fixes: 9961127d4bce ("NFC: nci: add generic uart support")
Fixes: e097dc624f78 ("NFC: nfcmrvl: add UART driver")
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 drivers/nfc/nfcmrvl/main.c    |  15 ++++-
 drivers/nfc/nfcmrvl/nfcmrvl.h |   2 +
 drivers/nfc/nfcmrvl/uart.c    |  28 +++++++--
 include/net/nfc/nci_core.h    |   5 ++
 net/nfc/nci/uart.c            | 115 ++++++++++++++++++++++++++++------
 5 files changed, 139 insertions(+), 26 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 6efa83219..81c760534 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -154,19 +154,24 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 
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
 
 error_fw_dnld_deinit:
+	if (priv->if_ops->nci_quiesce)
+		priv->if_ops->nci_quiesce(priv);
 	nfcmrvl_fw_dnld_deinit(priv);
 error_free_dev:
 	nci_free_device(priv->ndev);
@@ -181,6 +186,9 @@ void nfcmrvl_nci_unregister_dev(struct nfcmrvl_private *priv)
 	struct nci_dev *ndev = priv->ndev;
 
 	nci_unregister_device(ndev);
+	if (priv->if_ops->nci_quiesce)
+		priv->if_ops->nci_quiesce(priv);
+
 	if (priv->ndev->nfc_dev->fw_download_in_progress)
 		nfcmrvl_fw_dnld_abort(priv);
 
@@ -241,6 +249,7 @@ void nfcmrvl_chip_halt(struct nfcmrvl_private *priv)
 	if (priv->config.reset_gpio)
 		gpiod_set_value(priv->config.reset_gpio, 1);
 }
+EXPORT_SYMBOL_GPL(nfcmrvl_chip_halt);
 
 int nfcmrvl_parse_dt(struct device_node *node,
 		     struct nfcmrvl_platform_data *pdata)
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index 62fa77d58..5c2a5382c 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -112,6 +112,8 @@ struct nfcmrvl_if_ops {
 	int (*nci_open) (struct nfcmrvl_private *priv);
 	int (*nci_close) (struct nfcmrvl_private *priv);
 	int (*nci_send) (struct nfcmrvl_private *priv, struct sk_buff *skb);
+	void (*nci_ready)(struct nfcmrvl_private *priv);
+	void (*nci_quiesce)(struct nfcmrvl_private *priv);
 	void (*nci_update_config)(struct nfcmrvl_private *priv,
 				  const void *param);
 };
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 9aedd1687..b7f99cdb4 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -44,6 +44,27 @@ static int nfcmrvl_uart_nci_send(struct nfcmrvl_private *priv,
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
+static void nfcmrvl_uart_nci_quiesce(struct nfcmrvl_private *priv)
+{
+	struct nci_uart *nu = priv->drv_data;
+
+	nci_uart_rx_stop(nu);
+	nci_uart_tx_stop(nu);
+	nfcmrvl_chip_halt(priv);
+	nu->drv_data = NULL;
+	nu->ndev = NULL;
+}
+
 static void nfcmrvl_uart_nci_update_config(struct nfcmrvl_private *priv,
 					   const void *param)
 {
@@ -58,6 +79,8 @@ static const struct nfcmrvl_if_ops uart_ops = {
 	.nci_open = nfcmrvl_uart_nci_open,
 	.nci_close = nfcmrvl_uart_nci_close,
 	.nci_send = nfcmrvl_uart_nci_send,
+	.nci_ready = nfcmrvl_uart_nci_ready,
+	.nci_quiesce = nfcmrvl_uart_nci_quiesce,
 	.nci_update_config = nfcmrvl_uart_nci_update_config
 };
 
@@ -136,11 +159,6 @@ static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
 	if (IS_ERR(priv))
 		return PTR_ERR(priv);
 
-	priv->support_fw_dnld = true;
-
-	nu->drv_data = priv;
-	nu->ndev = priv->ndev;
-
 	return 0;
 }
 
diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 2f542f5c9..6b938c2b5 100644
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
 	unsigned long		flags;
@@ -466,5 +468,8 @@ struct nci_uart {
 int nci_uart_register(struct nci_uart *nu);
 void nci_uart_unregister(struct nci_uart *nu);
 void nci_uart_set_config(struct nci_uart *nu, int baudrate, int flow_ctrl);
+void nci_uart_set_ready(struct nci_uart *nu);
+void nci_uart_rx_stop(struct nci_uart *nu);
+void nci_uart_tx_stop(struct nci_uart *nu);
 
 #endif /* __NCI_CORE_H */
diff --git a/net/nfc/nci/uart.c b/net/nfc/nci/uart.c
index 529c8cf88..63671ea38 100644
--- a/net/nfc/nci/uart.c
+++ b/net/nfc/nci/uart.c
@@ -34,6 +34,7 @@
 /* TX states  */
 #define NCI_UART_SENDING	1
 #define NCI_UART_TX_WAKEUP	2
+#define NCI_UART_CLOSING	3
 
 /* UART flags */
 #define NCI_UART_DRIVER_SET	0
@@ -64,24 +65,61 @@ static inline int nci_uart_queue_empty(struct nci_uart *nu)
 
 static int nci_uart_tx_wakeup(struct nci_uart *nu)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	if (test_bit(NCI_UART_CLOSING, &nu->tx_state) ||
+	    !test_bit_acquire(NCI_UART_READY, &nu->flags))
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
+	clear_bit(TTY_DO_WRITE_WAKEUP, &nu->tty->flags);
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
@@ -99,14 +137,55 @@ static void nci_uart_write_work(struct work_struct *work)
 		kfree_skb(skb);
 	}
 
-	if (test_bit(NCI_UART_TX_WAKEUP, &nu->tx_state))
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	if (test_bit(NCI_UART_CLOSING, &nu->tx_state)) {
+		clear_bit(NCI_UART_SENDING, &nu->tx_state);
+		clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
+		spin_unlock_irqrestore(&nu->tx_lock, flags);
+		if (nu->ops.tx_done)
+			nu->ops.tx_done(nu);
+		return;
+	}
+	if (test_and_clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state)) {
+		spin_unlock_irqrestore(&nu->tx_lock, flags);
 		goto restart;
+	}
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
 
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
+}
+
+void nci_uart_set_ready(struct nci_uart *nu)
+{
+	/* Publish transport fields before callbacks observe READY. */
+	smp_mb__before_atomic();
+	set_bit(NCI_UART_READY, &nu->flags);
+
+	if (!nci_uart_queue_empty(nu))
+		nci_uart_tx_wakeup(nu);
 }
+EXPORT_SYMBOL_GPL(nci_uart_set_ready);
+
+void nci_uart_rx_stop(struct nci_uart *nu)
+{
+	spin_lock(&nu->rx_lock);
+	clear_bit(NCI_UART_READY, &nu->flags);
+	kfree_skb(nu->rx_skb);
+	nu->rx_skb = NULL;
+	spin_unlock(&nu->rx_lock);
+}
+EXPORT_SYMBOL_GPL(nci_uart_rx_stop);
 
 static int nci_uart_set_driver(struct nci_uart *nu, unsigned int driver)
 {
@@ -136,21 +215,17 @@ static int nci_uart_set_driver(struct nci_uart *nu, unsigned int driver)
 	if (ret)
 		goto err_module;
 
-	/* Publish transport fields before callbacks observe READY. */
-	smp_mb__before_atomic();
-	set_bit(NCI_UART_READY, &nu->flags);
+	nci_uart_set_ready(nu);
 
 	return 0;
 
 err_module:
-	cancel_work_sync(&nu->write_work);
+	nci_uart_rx_stop(nu);
+	nci_uart_tx_stop(nu);
 	kfree_skb(nu->tx_skb);
 	nu->tx_skb = NULL;
-	kfree_skb(nu->rx_skb);
-	nu->rx_skb = NULL;
 	skb_queue_purge(&nu->tx_q);
-	clear_bit(NCI_UART_SENDING, &nu->tx_state);
-	clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
+	clear_bit(NCI_UART_CLOSING, &nu->tx_state);
 	module_put(nu->owner);
 	nu->owner = NULL;
 	goto err_clear;
@@ -173,6 +248,7 @@ static int nci_uart_tty_alloc(struct tty_struct *tty)
 	nu->tty = tty;
 	skb_queue_head_init(&nu->tx_q);
 	INIT_WORK(&nu->write_work, nci_uart_write_work);
+	spin_lock_init(&nu->tx_lock);
 	spin_lock_init(&nu->rx_lock);
 
 	tty->disc_data = nu;
@@ -213,26 +289,25 @@ static void nci_uart_tty_close(struct tty_struct *tty)
 {
 	struct nci_uart *nu = tty->disc_data;
 
-	/* Detach from the tty */
-	tty->disc_data = NULL;
-
 	if (!nu)
 		return;
 
+	tty->disc_data = NULL;
+
 	if (test_bit(NCI_UART_DRIVER_SET, &nu->flags)) {
-		kfree_skb(nu->tx_skb);
-		kfree_skb(nu->rx_skb);
+		nu->ops.close(nu);
 
+		nci_uart_rx_stop(nu);
+		nci_uart_tx_stop(nu);
+
+		kfree_skb(nu->tx_skb);
 		skb_queue_purge(&nu->tx_q);
 
-		nu->ops.close(nu);
 		module_put(nu->owner);
 	}
 
 	nu->tty = NULL;
 
-	cancel_work_sync(&nu->write_work);
-
 	kfree(nu);
 }
 
@@ -348,6 +423,10 @@ static void nci_uart_tty_receive(struct tty_struct *tty, const u8 *data,
 		return;
 
 	spin_lock(&nu->rx_lock);
+	if (!test_bit(NCI_UART_READY, &nu->flags)) {
+		spin_unlock(&nu->rx_lock);
+		return;
+	}
 	nci_uart_default_recv_buf(nu, data, count);
 	spin_unlock(&nu->rx_lock);
 
-- 
2.54.0

