Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060988;
	b=uecxLOcNOQoscktI4ObpEZnMXKwPeY8j/Zho9xVMluKm1WhZ4Ba7fBJenFdAgwaOlKNN
	 xAerZNV3UCdjOpFdnZglDQDy1KQkovaXCO9fdqUmyVx/Kdm91LvvvgOl6iGYeghh5RwvW
	 5x0/KiIPWY/jN4cKRZXPzu6cSCnz18Sxh0pOw8REo9hCc0b7ScpbX5Jjp1/KZrUMfJdAc
	 gW+dZqHVoB57YEZB0Ior6F7sRtbdo7Xz5xBZvyylC0aB4oSyWwxlGElbVsvBHY3szhLVM
	 p0n0zCc/RnQnKw3sYve8lApGFR+KcR34hg+jqOjwVXatrUPtD/YtxDpt99rAfpfuy5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rjqBSH8opB6fIxS8Gm1tAZsQc0oApd1VyTFjQoNi7R8=;
	b=hbyy0RaWq+deO6GW63TyTFg5qRhFwZJ8N2rhn5SI8pO961USRkaCoNrWt4/fCUMt8xJT
	 kLMrC2oOq2b7cHUz1c1OSAi0EKgY8XRkiAof/y+9ghkhmhsFXDC0z5Z8mXitMQ93BeQNZ
	 AdHPVqX3OOCuvd5y6NO8QZCmKZ97AikYxWA8YKI6mgVNVCiPUE4lq1rFdC89kkK+NBEaY
	 Hz3aJPP1XcukF1CmEDys2tqcD5d2iCxwXdaVqbO3bQP+9sQTUsMs+a4g37gn94M2uceaN
	 R9NLsTa8YX6UCQsCIVWoRhf6i4zNqtwDg/87nn1GqdsrbDFspNJ0cweBvIBEderGuSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=octane.security;
	spf=pass smtp.mailfrom=octane.security;
	dkim=pass header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=QLj7w60b;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C165A606A32C
	for <oe-linux-nfc@lists.linux.dev>; Thu, 19 Nov 2026 04:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C165A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=QLj7w60b
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so999009a12.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 18 Nov 2026 20:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1795060987; x=1795665787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjqBSH8opB6fIxS8Gm1tAZsQc0oApd1VyTFjQoNi7R8=;
        b=QLj7w60b1YusU6aDz4Gj94weQhHq8RTjr9JK/pOyFLmolQPanPerbewl2DwuqI3djS
         11kXwp11cqwH4MSIrIp66kbPq2vqk+nN7WFh/dEK8HrJyhSqFfztRKe+M7j5frxqPh5L
         h9A3huu+dQGJzYO1Yab3OokDE5Y19VieLb888JMVS2OzuYmcX0G3jDG279XTz/i3QvWP
         AzKLnO2Vc70mpWLyJF15NbLe2a8xoOlvzZ+UiIc8DwA/OUUYiZkiouekObsne5fXNBtl
         szJ0bucRrjTzhgINyk4sZkO7zjw1aGOnYxgIbwwYeaQtNSo91WPoOORJmQghnFwoG0ER
         w2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060987; x=1795665787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjqBSH8opB6fIxS8Gm1tAZsQc0oApd1VyTFjQoNi7R8=;
        b=FGFHd++MHnd55OwH2AE+ZO2u7//o/2wRD4+DpZyiD71jecDIYu0BmRq6CsJPCQdEkr
         PjadDrn51a7q7j412OXG8RpmOxyTatkDKLDDKbylGIJcDZrVKqEImnMosc5e6gkmUa/P
         lnFYRHOzW0PTv2obwiUUM4iIDIAtASILtEYaPVaIUGY6mcezgMz4gVEVp/OlJP9eXYle
         7vpwbnWPQAuRtVwrc0Fcy/lCPh/g7ym+cv+r6rCkq3RwDv0KLpNFFMRUXrzvTN6mRglU
         GGfx/bFIAbg/5KH5/y102lnnyLTM8gp6s8jVJesEofJeg+Sjd7j0+YFzQzCqqccNXFIH
         HOng==
X-Gm-Message-State: APuU4Z9z2EqoZyzA0MBUi6mvz42/JQ/HOyuHUeihMQ/oGHhYdll4JUR6
	KduoDs7kj5TXhGTZX1k3Tn2mQQfgLTDH/aw/DJ7rV4d5Z5kLpZQAqTks9rCYgvBOo4RdBZ+aMsF
	ltZA1
X-Gm-Gg: AZFdTZdHTRiRtxynwRwTbsGMUC0MA11VWn7IcgToDElg74BzQarfPc94sGpSYqGm1Qn
	jRWm3iWgY8CQSdEeuYCc5yOGWRETtkbvH3ZZcTWFOqNyCQH8ps5etz5TXyfnPTeInEKHMKkponR
	tFvVulKX3vjiHXQSlMt7Ns5cvbIuugc59y7vEnEuflZdxwVNfpfCQN+GH7hVhDSRdXaoVH/WftQ
	MC6kXeHsYYdieYHszd9JAgVcOkY7olWO6WLirwSgDDjhUxKf7CZ2OuhdieIRVSB1hHXbBi0H2hA
	a7jqwWNK2Pk6kyOMBhebV2zAr8qTxcwYqQNHhVQRzu4NFqYbpWOZ/KDnWCIEOJU5glfxXYv+7vp
	7u5MNFhNq6x07mcCJjQFo3sVgW7VfL1lFJvzQOzNQeIl+YSPQPZLm6PUT8SFJr00CFdWQz5sXC4
	Y/2T5gbeB/kcr2BxjE/YbhfO3ZZ9u0Dlttk7MpD+15FPtGlR8M/j/UAwwK4uULa+f8uwq5Wmt4O
	EUm7s6RxphZ6/ppIVnMPzbJ641CL7f0Dlk5Coyr9jCSvEBAsuHcmqsEhNwbxBTGYFBY8ys0SB/V
	HlTeYScg4SDU3AWhnq/Fn8+ssAXGb41WbfkLG6rttlgkF0qCGJbhrV5yooKS4yHLLThTvxoWzOd
	o2gL6KZWd+dlR87u2OsWJtE+Yzsmc68Vjduz7AXLLFww1Vg8X1Bz3EslcRh6JbczG7waNzzY5gA
	==
X-Received: by 2002:a17:90b:278c:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3b3d07aa79fmr4645720a91.44.1795060986516;
        Wed, 18 Nov 2026 20:03:06 -0800 (PST)
Received: from localhost.localdomain ([103.207.175.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4057af4e2sm406863a91.7.2026.11.18.20.03.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 20:03:06 -0800 (PST)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	david@ixit.cz,
	horms@kernel.org,
	gio@octane.security
Subject: [PATCH net v8 3/4] nfc: nci: uart: quiesce callbacks during teardown
Date: Thu, 19 Nov 2026 09:32:52 +0530
Message-ID: <20261119040253.15986-4-shubham@octane.security>
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

The UART write worker can miss a wakeup while handing SENDING back to a
producer.  Teardown also has no state which prevents a new wakeup from
queuing work after the close path starts cancelling it.

The Marvell open path has a related publication window.  It registers the
NCI device before publishing the UART back-pointers, so an early open can
use unset transport state or lose the controller response.

Serialize transmit scheduling and the worker's final state transition.
When a transmit burst is active, record a wakeup before consulting the
shared queue.  A partial skb can temporarily be owned only by the worker,
and an empty-queue test in that window would otherwise discard the sole tty
wakeup.  Once quiescing starts, block new work and cancel the worker
synchronously.  Track an active transmit burst across partial writes and
worker restarts so each tx_start() has exactly one tx_done(), including
when close interrupts the burst.  Protect tx_skb with the same lock as the
transmit state.

Publish the Marvell UART back-pointers before NCI registration, but keep
UART callbacks gated until nci_register_device() has initialized the core
queues.  Add a core ready callback immediately before public registration
so transport state is visible before an early device-open can submit its
first reset.  Keep the generic ready publication after transport open as an
idempotent fallback.  Gate receive parsing on an active firmware download,
NCI_UP, or NCI_INIT.  Bytes rejected outside those states discard any
partial parser state and still unthrottle the tty, so a later reset
response cannot be spliced into an old frame and a throttled peer cannot
remain asleep.

Before the close-time reset, close command admission and drain a response
already owned by the NCI receive worker before cancelling command work.
Make the response and command workers honor that closing gate, then reopen
it only for the reset exchange and a driver's final close command.  Cancel
commands after both synchronous stages so a signal cannot leave its skb for
the next open.  This also preserves close callbacks which legitimately
submit a final proprietary command.  A late response therefore cannot make
an old command runnable after cancellation.

Ask the transport to finish complete queued frames and wait for both the
UART queue and tty driver buffer with a bounded timeout.  Keep a partial
frame intact while a reset exchange remains possible.  If framing cannot
be preserved, skip the reset, stop the writer, flush the tty driver's
output, and release the unsent data.  Leave that line-discipline instance
poisoned so a later NCI open cannot append bytes; recovery requires closing
and selecting the line discipline again.  Clear receive parser state after
the transport flush and immediately before reset admission opens.  Retry a
partial write from the bounded flush itself, so line-discipline close does
not depend on a write-wakeup callback which its write lock prevents.

Keep tty->disc_data and receive admission valid while the transport close
performs its reset exchange.  Stop generic callbacks afterward, halt the
controller while its device-managed reset GPIO is still valid, and withdraw
the UART back-pointers before releasing private state.  Apply the same
barriers to the failed-open path and document the sleep, lifetime, and
queue-ownership contracts of the lifecycle helpers.

Discovered during an AI-assisted source audit using OpenAI Codex,
gpt-5.6-sol.  Patch development and test planning used the same assistant.
Confirmed with repeated NCI UART registration, device-open, and hangup
cycles using an unmodified kernel and a pty-backed user-space controller;
no error injection was used.

With the fix applied, the final v8 registration/publication reproducer
passed 5 cycles under KASAN, UBSAN, and lockdep, and 5 cycles under
strict-mode KCSAN.  Lifecycle testing observed all four expected CORE_RESET
commands in each of 5 cycles under both configurations.  No physical
Marvell controller was available, and no in-tree selftest covers this UART
path.

Fixes: 9961127d4bce ("NFC: nci: add generic uart support")
Fixes: e097dc624f78 ("NFC: nfcmrvl: add UART driver")
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 drivers/nfc/nfcmrvl/main.c    |  40 +++-
 drivers/nfc/nfcmrvl/nfcmrvl.h |   4 +
 drivers/nfc/nfcmrvl/uart.c    |  60 +++++-
 include/net/nfc/nci_core.h    |  20 ++
 net/nfc/core.c                |   7 +-
 net/nfc/nci/core.c            |  73 +++++--
 net/nfc/nci/rsp.c             |   3 +
 net/nfc/nci/uart.c            | 347 +++++++++++++++++++++++++++++++---
 8 files changed, 496 insertions(+), 58 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index b9b66127f..a721d97a8 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -22,13 +22,12 @@ static int nfcmrvl_nci_open(struct nci_dev *ndev)
 	if (test_and_set_bit(NFCMRVL_NCI_RUNNING, &priv->flags))
 		return 0;
 
-	/* Reset possible fault of previous session */
-	clear_bit(NFCMRVL_PHY_ERROR, &priv->flags);
-
 	err = priv->if_ops->nci_open(priv);
 
 	if (err)
 		clear_bit(NFCMRVL_NCI_RUNNING, &priv->flags);
+	else
+		clear_bit(NFCMRVL_PHY_ERROR, &priv->flags);
 
 	return err;
 }
@@ -67,6 +66,24 @@ static int nfcmrvl_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
 	return priv->if_ops->nci_send(priv, skb);
 }
 
+static void nfcmrvl_nci_ready(struct nci_dev *ndev)
+{
+	struct nfcmrvl_private *priv = nci_get_drvdata(ndev);
+
+	if (priv->if_ops->nci_ready)
+		priv->if_ops->nci_ready(priv);
+}
+
+static int nfcmrvl_nci_flush(struct nci_dev *ndev)
+{
+	struct nfcmrvl_private *priv = nci_get_drvdata(ndev);
+
+	if (priv->if_ops->nci_flush)
+		return priv->if_ops->nci_flush(priv);
+
+	return 0;
+}
+
 static int nfcmrvl_nci_setup(struct nci_dev *ndev)
 {
 	__u8 val = 1;
@@ -85,6 +102,8 @@ static const struct nci_ops nfcmrvl_nci_ops = {
 	.open = nfcmrvl_nci_open,
 	.close = nfcmrvl_nci_close,
 	.send = nfcmrvl_nci_send,
+	.ready = nfcmrvl_nci_ready,
+	.flush = nfcmrvl_nci_flush,
 	.setup = nfcmrvl_nci_setup,
 	.fw_download = nfcmrvl_nci_fw_download,
 };
@@ -154,19 +173,24 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 
 	nci_set_drvdata(priv->ndev, priv);
 
+	/* Ensure that the controller is powered off before exposing it. */
+	nfcmrvl_chip_halt(priv);
+
+	if (priv->if_ops->nci_prepare)
+		priv->if_ops->nci_prepare(priv);
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
@@ -181,6 +205,9 @@ void nfcmrvl_nci_unregister_dev(struct nfcmrvl_private *priv)
 	struct nci_dev *ndev = priv->ndev;
 
 	nci_unregister_device(ndev);
+	if (priv->if_ops->nci_quiesce)
+		priv->if_ops->nci_quiesce(priv);
+
 	if (priv->ndev->nfc_dev->fw_download_in_progress)
 		nfcmrvl_fw_dnld_abort(priv);
 
@@ -241,6 +268,7 @@ void nfcmrvl_chip_halt(struct nfcmrvl_private *priv)
 	if (priv->config.reset_gpio)
 		gpiod_set_value(priv->config.reset_gpio, 1);
 }
+EXPORT_SYMBOL_GPL(nfcmrvl_chip_halt);
 
 int nfcmrvl_parse_dt(struct device_node *node,
 		     struct nfcmrvl_platform_data *pdata)
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index 62fa77d58..085ea4953 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -112,6 +112,10 @@ struct nfcmrvl_if_ops {
 	int (*nci_open) (struct nfcmrvl_private *priv);
 	int (*nci_close) (struct nfcmrvl_private *priv);
 	int (*nci_send) (struct nfcmrvl_private *priv, struct sk_buff *skb);
+	void (*nci_ready)(struct nfcmrvl_private *priv);
+	int (*nci_flush)(struct nfcmrvl_private *priv);
+	void (*nci_prepare)(struct nfcmrvl_private *priv);
+	void (*nci_quiesce)(struct nfcmrvl_private *priv);
 	void (*nci_update_config)(struct nfcmrvl_private *priv,
 				  const void *param);
 };
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 4b989fc4e..49f2c1204 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -28,11 +28,17 @@ static unsigned int break_control;
 
 static int nfcmrvl_uart_nci_open(struct nfcmrvl_private *priv)
 {
-	return 0;
+	struct nci_uart *nu = priv->drv_data;
+
+	/* A failed close-time flush poisons this line-discipline instance. */
+	return nci_uart_tx_flush(nu);
 }
 
 static int nfcmrvl_uart_nci_close(struct nfcmrvl_private *priv)
 {
+	if (test_bit(NFCMRVL_PHY_ERROR, &priv->flags))
+		nfcmrvl_chip_halt(priv);
+
 	return 0;
 }
 
@@ -44,6 +50,48 @@ static int nfcmrvl_uart_nci_send(struct nfcmrvl_private *priv,
 	return nu->ops.send(nu, skb);
 }
 
+static void nfcmrvl_uart_nci_ready(struct nfcmrvl_private *priv)
+{
+	struct nci_uart *nu = priv->drv_data;
+
+	nci_uart_set_ready(nu);
+}
+
+static int nfcmrvl_uart_nci_flush(struct nfcmrvl_private *priv)
+{
+	struct nci_uart *nu = priv->drv_data;
+	int ret;
+
+	ret = nci_uart_tx_flush(nu);
+	if (ret) {
+		set_bit(NFCMRVL_PHY_ERROR, &priv->flags);
+		nci_uart_tx_abort(nu);
+	}
+	nci_uart_rx_clear(nu);
+
+	return ret;
+}
+
+static void nfcmrvl_uart_nci_prepare(struct nfcmrvl_private *priv)
+{
+	struct nci_uart *nu = priv->drv_data;
+
+	priv->support_fw_dnld = true;
+	nu->drv_data = priv;
+	nu->ndev = priv->ndev;
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
@@ -58,6 +106,10 @@ static const struct nfcmrvl_if_ops uart_ops = {
 	.nci_open = nfcmrvl_uart_nci_open,
 	.nci_close = nfcmrvl_uart_nci_close,
 	.nci_send = nfcmrvl_uart_nci_send,
+	.nci_ready = nfcmrvl_uart_nci_ready,
+	.nci_flush = nfcmrvl_uart_nci_flush,
+	.nci_prepare = nfcmrvl_uart_nci_prepare,
+	.nci_quiesce = nfcmrvl_uart_nci_quiesce,
 	.nci_update_config = nfcmrvl_uart_nci_update_config
 };
 
@@ -136,11 +188,6 @@ static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
 	if (IS_ERR(priv))
 		return PTR_ERR(priv);
 
-	priv->support_fw_dnld = true;
-
-	nu->drv_data = priv;
-	nu->ndev = priv->ndev;
-
 	return 0;
 }
 
@@ -199,6 +246,7 @@ static struct nci_uart nfcmrvl_nci_uart = {
 		.tx_done	= nfcmrvl_nci_uart_tx_done,
 	}
 };
+
 module_driver(nfcmrvl_nci_uart, nci_uart_register, nci_uart_unregister);
 
 MODULE_AUTHOR("Marvell International Ltd.");
diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 2f542f5c9..8ada44f9f 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -20,6 +20,7 @@
 #include <linux/interrupt.h>
 #include <linux/skbuff.h>
 #include <linux/tty.h>
+#include <linux/wait.h>
 
 #include <net/nfc/nfc.h>
 #include <net/nfc/nci.h>
@@ -28,6 +29,7 @@
 enum nci_flag {
 	NCI_INIT,
 	NCI_UP,
+	NCI_CLOSING,
 	NCI_DATA_EXCHANGE,
 	NCI_DATA_EXCHANGE_TO,
 	NCI_UNREG,
@@ -67,6 +69,15 @@ struct nci_ops {
 	int   (*open)(struct nci_dev *ndev);
 	int   (*close)(struct nci_dev *ndev);
 	int   (*send)(struct nci_dev *ndev, struct sk_buff *skb);
+	/* Publish transport callbacks after core setup, before registration. */
+	void  (*ready)(struct nci_dev *ndev);
+	/*
+	 * Flush transport-owned frames before the close-time reset.  This may
+	 * sleep and is called with req_lock held after command producers have
+	 * stopped.  Return an error if framing cannot be preserved; the core
+	 * will then skip the reset exchange.
+	 */
+	int   (*flush)(struct nci_dev *ndev);
 	int   (*setup)(struct nci_dev *ndev);
 	int   (*post_setup)(struct nci_dev *ndev);
 	int   (*fw_download)(struct nci_dev *ndev, const char *firmware_name);
@@ -436,6 +447,7 @@ struct nci_uart;
 
 struct nci_uart_ops {
 	int (*open)(struct nci_uart *nci_uart);
+	/* Quiesce callbacks before releasing transport-private state. */
 	void (*close)(struct nci_uart *nci_uart);
 	int (*recv)(struct nci_uart *nci_uart, struct sk_buff *skb);
 	int (*send)(struct nci_uart *nci_uart, struct sk_buff *skb);
@@ -452,7 +464,9 @@ struct nci_uart {
 	/* Dynamic data */
 	struct nci_dev		*ndev;
 	spinlock_t		rx_lock;
+	spinlock_t		tx_lock; /* protects tx_state and tx_skb */
 	struct work_struct	write_work;
+	wait_queue_head_t	tx_wait;
 	struct tty_struct	*tty;
 	unsigned long		flags;
 	unsigned long		tx_state;
@@ -466,5 +480,11 @@ struct nci_uart {
 int nci_uart_register(struct nci_uart *nu);
 void nci_uart_unregister(struct nci_uart *nu);
 void nci_uart_set_config(struct nci_uart *nu, int baudrate, int flow_ctrl);
+void nci_uart_set_ready(struct nci_uart *nu);
+void nci_uart_rx_clear(struct nci_uart *nu);
+void nci_uart_rx_stop(struct nci_uart *nu);
+void nci_uart_tx_stop(struct nci_uart *nu);
+void nci_uart_tx_abort(struct nci_uart *nu);
+int nci_uart_tx_flush(struct nci_uart *nu);
 
 #endif /* __NCI_CORE_H */
diff --git a/net/nfc/core.c b/net/nfc/core.c
index b03b34b40..d73ea2fd4 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -1070,6 +1070,9 @@ struct nfc_dev *nfc_allocate_device(const struct nfc_ops *ops,
 	if (!dev)
 		return NULL;
 
+	/* Reject requests until registration has finished. */
+	dev->shutting_down = true;
+
 	rc = ida_alloc(&nfc_index_ida, GFP_KERNEL);
 	if (rc < 0)
 		goto err_free_dev;
@@ -1138,7 +1141,7 @@ int nfc_register_device(struct nfc_dev *dev)
 			dev->rfkill = NULL;
 		}
 	}
-	dev->shutting_down = false;
+	WRITE_ONCE(dev->shutting_down, false);
 	device_unlock(&dev->dev);
 
 	rc = nfc_genl_device_added(dev);
@@ -1172,7 +1175,7 @@ void nfc_unregister_rfkill(struct nfc_dev *dev)
 		rfk = dev->rfkill;
 		dev->rfkill = NULL;
 	}
-	dev->shutting_down = true;
+	WRITE_ONCE(dev->shutting_down, true);
 	device_unlock(&dev->dev);
 
 	if (rfk) {
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 73e3a9647..4df6b1f7a 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -553,6 +553,8 @@ static int nci_open_device(struct nci_dev *ndev)
 
 static int nci_close_device(struct nci_dev *ndev)
 {
+	int flush_rc = 0;
+
 	nci_req_cancel(ndev, ENODEV);
 
 	/* This mutex needs to be held as a barrier for
@@ -574,33 +576,69 @@ static int nci_close_device(struct nci_dev *ndev)
 		mutex_unlock(&ndev->req_lock);
 		return 0;
 	}
+	set_bit(NCI_CLOSING, &ndev->flags);
 
 	/* Drop RX and TX queues */
 	skb_queue_purge(&ndev->rx_q);
 	skb_queue_purge(&ndev->tx_q);
 
-	/* Flush TX wq, RX wq flush can't be under the lock */
+	/*
+	 * An RX worker may already own a response which can make another
+	 * command runnable.  No new frame is admitted after NCI_UP was
+	 * cleared.  Drop req_lock so an old RX worker can finish a request,
+	 * then cancel every command it made runnable.
+	 */
+	mutex_unlock(&ndev->req_lock);
+	flush_workqueue(ndev->rx_wq);
+	mutex_lock(&ndev->req_lock);
+
+	/* Flush TX wq after the last pre-close RX work has completed. */
 	flush_workqueue(ndev->tx_wq);
 
-	/* Reset device */
+	/* Stop command producers before flushing the transport backlog. */
+	timer_delete_sync(&ndev->cmd_timer);
 	skb_queue_purge(&ndev->cmd_q);
-	atomic_set(&ndev->cmd_cnt, 1);
-
-	set_bit(NCI_INIT, &ndev->flags);
-	__nci_request(ndev, nci_reset_req, (void *)0,
-		      msecs_to_jiffies(NCI_RESET_TIMEOUT));
+	flush_workqueue(ndev->cmd_wq);
+	timer_delete_sync(&ndev->cmd_timer);
+	flush_workqueue(ndev->cmd_wq);
+	if (ndev->ops->flush)
+		flush_rc = ndev->ops->flush(ndev);
+
+	if (!flush_rc) {
+		/* Reset device only when the transport preserved framing. */
+		atomic_set(&ndev->cmd_cnt, 1);
+
+		set_bit(NCI_INIT, &ndev->flags);
+		clear_bit(NCI_CLOSING, &ndev->flags);
+		__nci_request(ndev, nci_reset_req, (void *)0,
+			      msecs_to_jiffies(NCI_RESET_TIMEOUT));
+		set_bit(NCI_CLOSING, &ndev->flags);
+
+		/*
+		 * A signal can end the request before cmd_work dequeues its skb.
+		 * Remove that command before admitting a driver close callback,
+		 * some of which issue their own synchronous NCI command.
+		 */
+		timer_delete_sync(&ndev->cmd_timer);
+		atomic_set(&ndev->cmd_cnt, 0);
+		cancel_work_sync(&ndev->cmd_work);
+		timer_delete_sync(&ndev->cmd_timer);
+		skb_queue_purge(&ndev->cmd_q);
+		atomic_set(&ndev->cmd_cnt, 1);
+		clear_bit(NCI_CLOSING, &ndev->flags);
+	}
 
-	/* After this point our queues are empty
-	 * rx work may be running but will see that NCI_UP was cleared
-	 */
+	/* Let driver close callbacks complete their final command exchange. */
 	ndev->ops->close(ndev);
 
+	set_bit(NCI_CLOSING, &ndev->flags);
 	clear_bit(NCI_INIT, &ndev->flags);
-
-	/* Flush cmd and tx wq */
-	flush_workqueue(ndev->cmd_wq);
-
 	timer_delete_sync(&ndev->cmd_timer);
+	atomic_set(&ndev->cmd_cnt, 0);
+	cancel_work_sync(&ndev->cmd_work);
+	timer_delete_sync(&ndev->cmd_timer);
+	skb_queue_purge(&ndev->cmd_q);
+
 	timer_delete_sync(&ndev->data_timer);
 
 	if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags))
@@ -1254,8 +1292,6 @@ int nci_register_device(struct nci_dev *ndev)
 	struct device *dev = &ndev->nfc_dev->dev;
 	char name[32];
 
-	ndev->flags = 0;
-
 	INIT_WORK(&ndev->cmd_work, nci_cmd_work);
 	snprintf(name, sizeof(name), "%s_nci_cmd_wq", dev_name(dev));
 	ndev->cmd_wq = create_singlethread_workqueue(name);
@@ -1289,6 +1325,8 @@ int nci_register_device(struct nci_dev *ndev)
 
 	mutex_init(&ndev->req_lock);
 	INIT_LIST_HEAD(&ndev->conn_info_list);
+	if (ndev->ops->ready)
+		ndev->ops->ready(ndev);
 
 	rc = nfc_register_device(ndev->nfc_dev);
 	if (rc)
@@ -1320,7 +1358,6 @@ void nci_unregister_device(struct nci_dev *ndev)
 	struct nci_conn_info *conn_info, *n;
 
 	nfc_unregister_rfkill(ndev->nfc_dev);
-
 	/* This set_bit is not protected with specialized barrier,
 	 * However, it is fine because the mutex_lock(&ndev->req_lock);
 	 * in nci_close_device() will help to emit one.
@@ -1614,6 +1651,8 @@ static void nci_cmd_work(struct work_struct *work)
 	struct sk_buff *skb;
 
 	pr_debug("cmd_cnt %d\n", atomic_read(&ndev->cmd_cnt));
+	if (test_bit(NCI_CLOSING, &ndev->flags))
+		return;
 
 	/* Send queued command */
 	if (atomic_read(&ndev->cmd_cnt)) {
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index b0ab4f5ac..da71bf4ec 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -458,6 +458,9 @@ void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 	kfree_skb(skb);
 
 	/* trigger the next cmd */
+	if (test_bit(NCI_CLOSING, &ndev->flags))
+		return;
+
 	atomic_set(&ndev->cmd_cnt, 1);
 	if (!skb_queue_empty(&ndev->cmd_q))
 		queue_work(ndev->cmd_wq, &ndev->cmd_work);
diff --git a/net/nfc/nci/uart.c b/net/nfc/nci/uart.c
index 529c8cf88..ff8b9e39d 100644
--- a/net/nfc/nci/uart.c
+++ b/net/nfc/nci/uart.c
@@ -34,6 +34,8 @@
 /* TX states  */
 #define NCI_UART_SENDING	1
 #define NCI_UART_TX_WAKEUP	2
+#define NCI_UART_CLOSING	3
+#define NCI_UART_TX_STARTED	4
 
 /* UART flags */
 #define NCI_UART_DRIVER_SET	0
@@ -42,7 +44,7 @@
 static struct nci_uart *nci_uart_drivers[NCI_UART_DRIVER_MAX];
 static DEFINE_MUTEX(nci_uart_drivers_lock);
 
-static inline struct sk_buff *nci_uart_dequeue(struct nci_uart *nu)
+static struct sk_buff *nci_uart_dequeue_locked(struct nci_uart *nu)
 {
 	struct sk_buff *skb = nu->tx_skb;
 
@@ -54,63 +56,322 @@ static inline struct sk_buff *nci_uart_dequeue(struct nci_uart *nu)
 	return skb;
 }
 
-static inline int nci_uart_queue_empty(struct nci_uart *nu)
+static bool nci_uart_queue_empty_locked(struct nci_uart *nu)
 {
 	if (nu->tx_skb)
-		return 0;
+		return false;
 
 	return skb_queue_empty(&nu->tx_q);
 }
 
+static bool nci_uart_tx_idle(struct nci_uart *nu)
+{
+	unsigned long flags;
+	bool idle;
+
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	idle = nci_uart_queue_empty_locked(nu) &&
+	       !test_bit(NCI_UART_SENDING, &nu->tx_state);
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
+
+	return idle;
+}
+
 static int nci_uart_tx_wakeup(struct nci_uart *nu)
 {
-	if (test_and_set_bit(NCI_UART_SENDING, &nu->tx_state)) {
+	unsigned long flags;
+
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	if (test_bit(NCI_UART_CLOSING, &nu->tx_state) ||
+	    !test_bit_acquire(NCI_UART_READY, &nu->flags))
+		goto unlock;
+
+	if (test_bit(NCI_UART_SENDING, &nu->tx_state)) {
 		set_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
-		return 0;
+		goto unlock;
 	}
+	if (nci_uart_queue_empty_locked(nu))
+		goto unlock;
 
+	set_bit(NCI_UART_SENDING, &nu->tx_state);
 	schedule_work(&nu->write_work);
 
+unlock:
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
+
 	return 0;
 }
 
+/**
+ * nci_uart_tx_stop - stop UART transmit callbacks
+ * @nu: NCI UART transport
+ *
+ * Prevent new transmit work, wait for an active worker, and balance an
+ * outstanding tx_start() callback.  This function may sleep and the caller
+ * must keep @nu->tty and transport-private state valid until it returns.
+ * Queued skbs are left for the caller to release and the closing state stays
+ * set until the transport instance is either freed or explicitly unwound.
+ */
+void nci_uart_tx_stop(struct nci_uart *nu)
+{
+	unsigned long flags;
+	bool tx_started;
+
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	set_bit(NCI_UART_CLOSING, &nu->tx_state);
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
+
+	cancel_work_sync(&nu->write_work);
+	clear_bit(TTY_DO_WRITE_WAKEUP, &nu->tty->flags);
+
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	tx_started = test_and_clear_bit(NCI_UART_TX_STARTED,
+					&nu->tx_state);
+	clear_bit(NCI_UART_SENDING, &nu->tx_state);
+	clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
+
+	if (tx_started && nu->ops.tx_done)
+		nu->ops.tx_done(nu);
+	wake_up_all(&nu->tx_wait);
+}
+EXPORT_SYMBOL_GPL(nci_uart_tx_stop);
+
+/**
+ * nci_uart_tx_flush - finish queued UART frames before a controller reset
+ * @nu: NCI UART transport
+ *
+ * Wait until the transport queue and the tty driver have transmitted every
+ * complete frame.  The caller must first prevent producers from submitting
+ * new frames and must keep the tty valid.  Return an error instead of
+ * discarding a partial frame, so the NCI core can skip its reset exchange
+ * rather than append the reset bytes to that frame.
+ */
+int nci_uart_tx_flush(struct nci_uart *nu)
+{
+	long timeout = msecs_to_jiffies(NCI_RESET_TIMEOUT);
+	long retry = max_t(long, 1, msecs_to_jiffies(20));
+	unsigned long deadline = jiffies + timeout;
+	unsigned long flags;
+	bool closing;
+
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	closing = test_bit(NCI_UART_CLOSING, &nu->tx_state);
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
+	if (closing)
+		return -ESHUTDOWN;
+
+	for (;;) {
+		long remaining;
+
+		nci_uart_tx_wakeup(nu);
+		if (nci_uart_tx_idle(nu))
+			break;
+		remaining = deadline - jiffies;
+		if (remaining <= 0)
+			return -ETIMEDOUT;
+
+		/*
+		 * Line-discipline close holds ldisc_sem write-locked, so the tty
+		 * cannot deliver write_wakeup.  Retry a partial write here rather
+		 * than depending on that callback to reschedule write_work.
+		 */
+		wait_event_timeout(nu->tx_wait, nci_uart_tx_idle(nu),
+				   min(retry, remaining));
+	}
+
+	timeout = deadline - jiffies;
+	if (tty_chars_in_buffer(nu->tty) && timeout > 0)
+		tty_wait_until_sent(nu->tty, timeout);
+	if (tty_chars_in_buffer(nu->tty))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nci_uart_tx_flush);
+
+/**
+ * nci_uart_tx_abort - discard a transport which cannot preserve framing
+ * @nu: NCI UART transport
+ *
+ * Stop the writer, flush the tty driver's output buffer, and release the
+ * unsent suffix and queued frames.  Transmit remains stopped so a later NCI
+ * open cannot append bytes to the incomplete frame.  Recovery requires the
+ * line discipline to be closed and selected again.
+ */
+void nci_uart_tx_abort(struct nci_uart *nu)
+{
+	struct sk_buff *skb;
+	unsigned long flags;
+
+	nci_uart_tx_stop(nu);
+	tty_driver_flush_buffer(nu->tty);
+
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	skb = nu->tx_skb;
+	nu->tx_skb = NULL;
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
+	kfree_skb(skb);
+	skb_queue_purge(&nu->tx_q);
+	wake_up_all(&nu->tx_wait);
+}
+EXPORT_SYMBOL_GPL(nci_uart_tx_abort);
+
 static void nci_uart_write_work(struct work_struct *work)
 {
 	struct nci_uart *nu = container_of(work, struct nci_uart, write_work);
 	struct tty_struct *tty = nu->tty;
 	struct sk_buff *skb;
+	unsigned long flags;
+	bool tx_started;
 
 restart:
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	if (test_bit(NCI_UART_CLOSING, &nu->tx_state)) {
+		tx_started = test_and_clear_bit(NCI_UART_TX_STARTED,
+						&nu->tx_state);
+		clear_bit(NCI_UART_SENDING, &nu->tx_state);
+		clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
+		spin_unlock_irqrestore(&nu->tx_lock, flags);
+		if (tx_started && nu->ops.tx_done)
+			nu->ops.tx_done(nu);
+		wake_up_all(&nu->tx_wait);
+		return;
+	}
 	clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
+	tx_started = !test_and_set_bit(NCI_UART_TX_STARTED,
+					&nu->tx_state);
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
 
-	if (nu->ops.tx_start)
+	if (tx_started && nu->ops.tx_start)
 		nu->ops.tx_start(nu);
 
-	while ((skb = nci_uart_dequeue(nu))) {
+	for (;;) {
 		int len;
 
+		spin_lock_irqsave(&nu->tx_lock, flags);
+		skb = nci_uart_dequeue_locked(nu);
+		spin_unlock_irqrestore(&nu->tx_lock, flags);
+		if (!skb)
+			break;
+
 		set_bit(TTY_DO_WRITE_WAKEUP, &tty->flags);
 		len = tty->ops->write(tty, skb->data, skb->len);
 		skb_pull(skb, len);
 		if (skb->len) {
+			spin_lock_irqsave(&nu->tx_lock, flags);
 			nu->tx_skb = skb;
+			spin_unlock_irqrestore(&nu->tx_lock, flags);
 			break;
 		}
 		kfree_skb(skb);
 	}
 
-	if (test_bit(NCI_UART_TX_WAKEUP, &nu->tx_state))
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	if (test_bit(NCI_UART_CLOSING, &nu->tx_state)) {
+		tx_started = test_and_clear_bit(NCI_UART_TX_STARTED,
+						&nu->tx_state);
+		clear_bit(NCI_UART_SENDING, &nu->tx_state);
+		clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
+		spin_unlock_irqrestore(&nu->tx_lock, flags);
+		if (tx_started && nu->ops.tx_done)
+			nu->ops.tx_done(nu);
+		wake_up_all(&nu->tx_wait);
+		return;
+	}
+	if (test_and_clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state)) {
+		spin_unlock_irqrestore(&nu->tx_lock, flags);
 		goto restart;
+	}
+	if (!nci_uart_queue_empty_locked(nu)) {
+		clear_bit(NCI_UART_SENDING, &nu->tx_state);
+		spin_unlock_irqrestore(&nu->tx_lock, flags);
+		wake_up_all(&nu->tx_wait);
+		return;
+	}
+	tx_started = test_and_clear_bit(NCI_UART_TX_STARTED,
+					&nu->tx_state);
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
 
-	if (nu->ops.tx_done && nci_uart_queue_empty(nu))
+	if (tx_started && nu->ops.tx_done)
 		nu->ops.tx_done(nu);
 
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	if (test_bit(NCI_UART_CLOSING, &nu->tx_state)) {
+		clear_bit(NCI_UART_SENDING, &nu->tx_state);
+		clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
+		spin_unlock_irqrestore(&nu->tx_lock, flags);
+		wake_up_all(&nu->tx_wait);
+		return;
+	}
+	if (test_and_clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state) ||
+	    !nci_uart_queue_empty_locked(nu)) {
+		spin_unlock_irqrestore(&nu->tx_lock, flags);
+		goto restart;
+	}
 	clear_bit(NCI_UART_SENDING, &nu->tx_state);
+	clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
+	wake_up_all(&nu->tx_wait);
+}
+
+/**
+ * nci_uart_set_ready - admit UART callbacks after transport setup
+ * @nu: NCI UART transport
+ *
+ * Publish fully initialized transport state and schedule any frame queued
+ * while the transport was opening.  The line discipline and transmit locks
+ * must already be initialized.
+ */
+void nci_uart_set_ready(struct nci_uart *nu)
+{
+	/* Publish transport fields before callbacks observe READY. */
+	smp_mb__before_atomic();
+	set_bit(NCI_UART_READY, &nu->flags);
+	nci_uart_tx_wakeup(nu);
 }
+EXPORT_SYMBOL_GPL(nci_uart_set_ready);
+
+/**
+ * nci_uart_rx_clear - discard an incomplete UART receive frame
+ * @nu: NCI UART transport
+ *
+ * Clear parser state without changing callback admission.  The caller may
+ * use this immediately before a framed close-time exchange.
+ */
+void nci_uart_rx_clear(struct nci_uart *nu)
+{
+	spin_lock(&nu->rx_lock);
+	kfree_skb(nu->rx_skb);
+	nu->rx_skb = NULL;
+	nu->rx_packet_len = -1;
+	spin_unlock(&nu->rx_lock);
+}
+EXPORT_SYMBOL_GPL(nci_uart_rx_clear);
+
+/**
+ * nci_uart_rx_stop - stop UART receive callbacks
+ * @nu: NCI UART transport
+ *
+ * Withdraw receive callback admission and discard an incomplete frame before
+ * transport-private state is released.  The caller must keep @nu valid until
+ * any line-discipline callback already holding rx_lock has completed.
+ */
+void nci_uart_rx_stop(struct nci_uart *nu)
+{
+	spin_lock(&nu->rx_lock);
+	clear_bit(NCI_UART_READY, &nu->flags);
+	kfree_skb(nu->rx_skb);
+	nu->rx_skb = NULL;
+	nu->rx_packet_len = -1;
+	spin_unlock(&nu->rx_lock);
+}
+EXPORT_SYMBOL_GPL(nci_uart_rx_stop);
 
 static int nci_uart_set_driver(struct nci_uart *nu, unsigned int driver)
 {
 	struct nci_uart *template;
+	unsigned long flags;
 	int ret;
 
 	if (driver >= NCI_UART_DRIVER_MAX)
@@ -136,21 +397,19 @@ static int nci_uart_set_driver(struct nci_uart *nu, unsigned int driver)
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
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	clear_bit(NCI_UART_CLOSING, &nu->tx_state);
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
 	module_put(nu->owner);
 	nu->owner = NULL;
 	goto err_clear;
@@ -173,6 +432,8 @@ static int nci_uart_tty_alloc(struct tty_struct *tty)
 	nu->tty = tty;
 	skb_queue_head_init(&nu->tx_q);
 	INIT_WORK(&nu->write_work, nci_uart_write_work);
+	init_waitqueue_head(&nu->tx_wait);
+	spin_lock_init(&nu->tx_lock);
 	spin_lock_init(&nu->rx_lock);
 
 	tty->disc_data = nu;
@@ -213,26 +474,25 @@ static void nci_uart_tty_close(struct tty_struct *tty)
 {
 	struct nci_uart *nu = tty->disc_data;
 
-	/* Detach from the tty */
-	tty->disc_data = NULL;
-
 	if (!nu)
 		return;
 
 	if (test_bit(NCI_UART_DRIVER_SET, &nu->flags)) {
-		kfree_skb(nu->tx_skb);
-		kfree_skb(nu->rx_skb);
+		nu->ops.close(nu);
+
+		nci_uart_rx_stop(nu);
+		nci_uart_tx_stop(nu);
 
+		kfree_skb(nu->tx_skb);
+		nu->tx_skb = NULL;
 		skb_queue_purge(&nu->tx_q);
 
-		nu->ops.close(nu);
 		module_put(nu->owner);
 	}
 
+	tty->disc_data = NULL;
 	nu->tty = NULL;
 
-	cancel_work_sync(&nu->write_work);
-
 	kfree(nu);
 }
 
@@ -326,6 +586,17 @@ static int nci_uart_default_recv_buf(struct nci_uart *nu, const u8 *data,
 	return 0;
 }
 
+static bool nci_uart_rx_active(struct nci_uart *nu)
+{
+	if (!nu->ndev)
+		return false;
+
+	/* Firmware and close-time reset responses bypass the normal UP gate. */
+	return READ_ONCE(nu->ndev->nfc_dev->fw_download_in_progress) ||
+	       test_bit(NCI_UP, &nu->ndev->flags) ||
+	       test_bit(NCI_INIT, &nu->ndev->flags);
+}
+
 /* nci_uart_tty_receive()
  *
  *     Called by tty low level driver when receive data is
@@ -345,12 +616,21 @@ static void nci_uart_tty_receive(struct tty_struct *tty, const u8 *data,
 
 	if (!nu || tty != nu->tty ||
 	    !test_bit_acquire(NCI_UART_READY, &nu->flags))
-		return;
+		goto unthrottle;
 
 	spin_lock(&nu->rx_lock);
+	if (!test_bit(NCI_UART_READY, &nu->flags) ||
+	    !nci_uart_rx_active(nu)) {
+		kfree_skb(nu->rx_skb);
+		nu->rx_skb = NULL;
+		nu->rx_packet_len = -1;
+		spin_unlock(&nu->rx_lock);
+		goto unthrottle;
+	}
 	nci_uart_default_recv_buf(nu, data, count);
 	spin_unlock(&nu->rx_lock);
 
+unthrottle:
 	tty_unthrottle(tty);
 }
 
@@ -402,8 +682,21 @@ static ssize_t nci_uart_tty_write(struct tty_struct *tty, struct file *file,
 
 static int nci_uart_send(struct nci_uart *nu, struct sk_buff *skb)
 {
+	unsigned long flags;
+	int ret = 0;
+
 	/* Queue TX packet */
-	skb_queue_tail(&nu->tx_q, skb);
+	spin_lock_irqsave(&nu->tx_lock, flags);
+	if (test_bit(NCI_UART_CLOSING, &nu->tx_state) ||
+	    !test_bit(NCI_UART_READY, &nu->flags))
+		ret = -ESHUTDOWN;
+	else
+		skb_queue_tail(&nu->tx_q, skb);
+	spin_unlock_irqrestore(&nu->tx_lock, flags);
+	if (ret) {
+		kfree_skb(skb);
+		return ret;
+	}
 
 	/* Try to start TX (if possible) */
 	nci_uart_tx_wakeup(nu);
-- 
2.54.0

