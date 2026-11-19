Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060992;
	b=So1e/x9w3+A6ik722MML8qYbJTXXrdNviA9iRTWa8nZCqFWC1gTB1pjB2psZgCqICxJ1
	 qirVQ2/AZbUVPGljHjGYZzXuPynDztwHwISEWDybO29PjEhIz6lwlUqV9zuYjx0x1y++9
	 ZuCrH29YvbWAsrcjG8TzotZqRFBOjHRvzHrObzGb27dOP1FLlhOEVaXlsidzlfwHiiGmw
	 D2f69dEp2wj3kw3nHf/rG3iOAdM19a2swNkaaa1kheKTuW6AcozSi4XYtk0FLbDzFMx1T
	 PlzFf4aBfw5s37kTxfu/kjxDLZJiPba3xkcf4+Kiuu4plIx11y9T9iaM+xuCbsoD4Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x8b/DcFOyfPKjihBDXQ59A1bbFhIl6l18k1Hj3kWNPQ=;
	b=amAC7lTEO1y1usVjGILiScADkssN/ygmVeQq91mejq8D6W18tlOE5q/Hdqu2Kanrxdmx
	 KoPqEkAW88NuXspc0atFx/RU5r+j+HAxk4pC6BclkuuL5wtdFPQ/IYA7rlX3/ShsUwLnt
	 9tV2sVDC2QeIOZgWMX0Ao40qSILUlWR41ebDiLqJ+2doXxrpOKwUFpYupl62mtUeGizI5
	 dxMl+7RSWEL9FHIrqRvsDh7S1XAus6iwmtp9Npp+Sff9UTEF0jLJEAnPPUCMxKS19x90P
	 mxXNhiVe2srpno/miF+HYgyb5PqN98ErKQl54zySbg8gjnfpGzU14f1fsYqTPZuPbxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=octane.security;
	spf=pass smtp.mailfrom=octane.security;
	dkim=pass header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=EyERfCjI;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34190606A326
	for <oe-linux-nfc@lists.linux.dev>; Thu, 19 Nov 2026 04:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34190606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=EyERfCjI
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so982673a91.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 18 Nov 2026 20:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1795060990; x=1795665790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x8b/DcFOyfPKjihBDXQ59A1bbFhIl6l18k1Hj3kWNPQ=;
        b=EyERfCjI0LawTvTrs9qzjKc9czBFYxo+nGrMlUiyThnxbl6ay6MThIbpJdxcL9rJmj
         i+0yAskYLnf44L05JcFTr1pg1/9FSzbC7Kv13O5Y4hjKj/MdG7Frh2cFPgGT7cVmdZMI
         gdvA+SbqkaZ6MxMD/qtvPM2f8O565nP6SpmLalvGKtzzTSvqC9eKh8esRGVHBUq9JU3Q
         WQbh7b+vYe66olJ875HVonspMBr9KGkQ+lSkPSGtOuifc3S/TofNuSSDzpWhmqTW+0om
         L1ffD3Zn6jpOPy1NUFrtCPj0T+q+dUVrQLYk9pW8almzLjp+N/X7d+2yEDgoXMq4tmSi
         eQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060990; x=1795665790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x8b/DcFOyfPKjihBDXQ59A1bbFhIl6l18k1Hj3kWNPQ=;
        b=0Ybx8XhFwjVzUqdNicItfWCTbY+7sJloe2F/ABSK/zmNzk1dirxu/dJwBpih5B5kL3
         928fDVTMT/6VDWVDGOfnFs8C43WHYBglvAfuwGz22t7YU4AshxDvu5MHQ1Z0BqPRn2Ds
         GpVUH5mqcTtF6ZGFwcjS5pNTWWSS/nsJnzsTGdJrovstglaDHlk0qwhO9LSDx4UFn+xZ
         7rSd7mhCCSSZ1yQ8W1+MiUxrLgoZPQLaeSLrNPIrUCMymhAgzNCSMT8lIALkaw+vdoem
         7FLa8SnOg2m6D1jApyiLeoLLMYjR7UHP5KtH443omVsYWKXiXjJw6ZJR9fUzZEYZ7EY3
         /jYQ==
X-Gm-Message-State: APuU4Z9rm0kX/JZXp2NJdlQcduHP2IEmQtRvrQHqQRcqQFzwf3Y5+QyI
	3fV+Ib1RQ3wiZ/T6T6z6vXyvZbBGGbRh/Ua2346NqEDwl+miC50ehYF26Sd4qneNDPM=
X-Gm-Gg: AZFdTZcHSQ9SlCF2hFumsNMe1F3KFv4ckEdn8NPkbalI5z4oY8y5KB50XyFZmY6PIwk
	VenxNGwpVxvL6BPRvxXSVmgERWhOqQ/PfImX45Um8NGjYVIjHXCObLhRtyhrXKUI8u2N6LQ9UOf
	jKmxSk/6iyxfIelhFUZk69j4vlKcH4V2Z8GB1xI4XeQml+6khS4jsYRIcUB1KSjn8i46iN28jpi
	xO0I1FSdCqKaR0bk2KRRc9lgx8JFlv3++JkwufHrYKIDuvwop6pwf0PCZa2RpR0VWK2gmaXXTOt
	SeJhYrxBsjkOoLUOMBMxjS0qZ7p0w4GfWsyOVUHLkHvoXJHAernk0mwMs0D8jn6xdqqM38PvFqS
	Tthp0CNgJaXqK5GIqou20DDuuRkMsRu3LFCoHRY9d6MK0ursr9BMTydz0Gjaouy1kUAyplNQqw8
	fO3/6ekw1rVU7/o9UX89wEA6ZTl1xIlES2WEujbjDZK60P4y6rUTdYQmgWsLQPRmr+fYGdTfERq
	7tleCmVvEyb+P6qUAYyW5VQvPFd3vml3M9dq2h3Sagw3lkTM3pWRs1ItBs3yCKtJy5YBw3t0oIi
	NWkddKjsC9nk91WTFT6g4ecRjx8Flr+zcmOD2oZ4aX9mUzYAhXZnu+0e1VePtxyMlCmrXUr7P4J
	kyxJJ52fgrOxY1KARlm/LTpqXWKw/tc52GMXQFyI3rE4pkgNvCHlFFgUdACzjHnSM3RNjm5Zk
X-Received: by 2002:a17:90b:2ec7:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b3d07a85e6mr4937698a91.29.1795060990111;
        Wed, 18 Nov 2026 20:03:10 -0800 (PST)
Received: from localhost.localdomain ([103.207.175.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4057af4e2sm406863a91.7.2026.11.18.20.03.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 20:03:08 -0800 (PST)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	david@ixit.cz,
	horms@kernel.org,
	gio@octane.security
Subject: [PATCH net v8 4/4] nfc: nfcmrvl: stop firmware work before unregistering
Date: Thu, 19 Nov 2026 09:32:53 +0530
Message-ID: <20261119040253.15986-5-shubham@octane.security>
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

nfcmrvl_nci_unregister_dev() destroys the NCI workqueues before draining
the firmware receive worker.  That worker can still submit NCI commands,
while the later abort can release firmware state that it is processing.
The firmware timeout can also complete the same download in parallel with
the receive worker.

Add active and stopping states protected by the firmware receive lock.
Once completion or teardown starts, reject new firmware receives and wait
for active receive entry points.  Shut down the firmware timer, cancel the
receive and timeout workers, and purge their queue before releasing
firmware state.

Add an NCI shutdown callback which runs after core admission has closed and
before the NCI workqueues are torn down.  Abort the Marvell download from
that callback, so the driver does not duplicate the core shutdown flag or
depend on unregister ordering outside the NCI core.  Document that the
callback may sleep, runs without req_lock, and may drain the still-live
core workqueues but must not leave new command producers behind.

Provide a core helper which drains the NCI command timer, command worker,
and command queue as one dependency chain.  Delete the timer before and
after cancelling command work so a detached timer callback cannot queue
work which rearms the timer.  This also removes command skbs which cannot
run after command admission is closed.  Use the same helper in normal NCI
close and firmware completion instead of duplicating those internals in the
driver.

Queue timeout completion on the firmware workqueue and claim completion
under the receive lock so firmware state is released once.  Hold received
frames until the initial reset pulse has finished, and make the worker
recheck that state before dequeuing a frame.  Cancel any pending instance
of both firmware work items during completion; non-synchronous cancellation
is required because completion can run from either work item itself.

Clear the driver completion gate before the core reports completion.  The
core still blocks another download until nfc_fw_download_done() clears its
own state, so a request triggered by the completion event observes both
layers as idle.  Keep final workqueue destruction separate from abort so
unregister does not run the abort path twice.

Discovered during an AI-assisted source audit using OpenAI Codex,
gpt-5.6-sol.  Patch development and test planning used the same assistant.
Confirmed with an unmodified kernel and a pty-backed user-space controller
exercising firmware start, timeout, completion, and device teardown; no
error injection was used.

With the fix applied, the final v8 reproducer passed 100 firmware teardown
cycles and all five timer-boundary modes under KASAN, UBSAN, and lockdep,
and the same 100 cycles and five boundary modes under strict-mode KCSAN.
No physical Marvell controller was available, and no in-tree selftest
covers this firmware path.

Fixes: 3194c6870158 ("NFC: nfcmrvl: add firmware download support")
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 drivers/nfc/nfcmrvl/fw_dnld.c | 237 +++++++++++++++++++++++++---------
 drivers/nfc/nfcmrvl/fw_dnld.h |  11 ++
 drivers/nfc/nfcmrvl/main.c    |  12 +-
 include/net/nfc/nci_core.h    |   8 ++
 net/nfc/nci/core.c            |  37 +++---
 5 files changed, 223 insertions(+), 82 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/fw_dnld.c b/drivers/nfc/nfcmrvl/fw_dnld.c
index 8b9d52573..6f110d041 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.c
+++ b/drivers/nfc/nfcmrvl/fw_dnld.c
@@ -90,22 +90,36 @@ static struct sk_buff *alloc_lc_skb(struct nfcmrvl_private *priv, uint8_t plen)
 	return skb;
 }
 
-static void fw_dnld_over(struct nfcmrvl_private *priv, u32 error)
+static void fw_dnld_over(struct nfcmrvl_private *priv, int error)
 {
-	if (priv->fw_dnld.fw) {
-		release_firmware(priv->fw_dnld.fw);
-		priv->fw_dnld.fw = NULL;
-		priv->fw_dnld.header = NULL;
-		priv->fw_dnld.binary_config = NULL;
-	}
-
-	atomic_set(&priv->ndev->cmd_cnt, 0);
-
-	if (timer_pending(&priv->ndev->cmd_timer))
-		timer_delete_sync(&priv->ndev->cmd_timer);
+	struct nfcmrvl_fw_dnld *fw_dnld = &priv->fw_dnld;
+	char name[NFC_FIRMWARE_NAME_MAXSIZE + 1];
+	unsigned long flags;
 
-	if (timer_pending(&priv->fw_dnld.timer))
-		timer_delete_sync(&priv->fw_dnld.timer);
+	spin_lock_irqsave(&fw_dnld->rx_lock, flags);
+	if (!fw_dnld->active) {
+		spin_unlock_irqrestore(&fw_dnld->rx_lock, flags);
+		return;
+	}
+	fw_dnld->active = false;
+	fw_dnld->completing = true;
+	spin_unlock_irqrestore(&fw_dnld->rx_lock, flags);
+
+	strscpy(name, fw_dnld->name);
+	wait_event(fw_dnld->rx_wait, !READ_ONCE(fw_dnld->rx_active));
+	timer_delete_sync(&fw_dnld->timer);
+	/* Completion can run from either work item itself. */
+	cancel_work(&fw_dnld->rx_work);
+	cancel_work(&fw_dnld->timeout_work);
+	nci_cancel_pending_cmds(priv->ndev);
+	skb_queue_purge(&fw_dnld->rx_q);
+
+	if (fw_dnld->fw) {
+		release_firmware(fw_dnld->fw);
+		fw_dnld->fw = NULL;
+		fw_dnld->header = NULL;
+		fw_dnld->binary_config = NULL;
+	}
 
 	nfc_info(priv->dev, "FW loading over (%d)]\n", error);
 
@@ -114,7 +128,11 @@ static void fw_dnld_over(struct nfcmrvl_private *priv, u32 error)
 		nfcmrvl_chip_halt(priv);
 	}
 
-	nfc_fw_download_done(priv->ndev->nfc_dev, priv->fw_dnld.name, error);
+	spin_lock_irqsave(&fw_dnld->rx_lock, flags);
+	fw_dnld->completing = false;
+	spin_unlock_irqrestore(&fw_dnld->rx_lock, flags);
+
+	nfc_fw_download_done(priv->ndev->nfc_dev, name, (u32)error);
 }
 
 static void fw_dnld_timeout(struct timer_list *t)
@@ -122,6 +140,18 @@ static void fw_dnld_timeout(struct timer_list *t)
 	struct nfcmrvl_private *priv = timer_container_of(priv, t,
 							  fw_dnld.timer);
 
+	queue_work(priv->fw_dnld.rx_wq, &priv->fw_dnld.timeout_work);
+}
+
+static void fw_dnld_timeout_work(struct work_struct *work)
+{
+	struct nfcmrvl_fw_dnld *fw_dnld = container_of(work,
+						       struct nfcmrvl_fw_dnld,
+						       timeout_work);
+	struct nfcmrvl_private *priv = container_of(fw_dnld,
+						    struct nfcmrvl_private,
+						    fw_dnld);
+
 	nfc_err(priv->dev, "FW loading timeout");
 	priv->fw_dnld.state = STATE_RESET;
 	fw_dnld_over(priv, -ETIMEDOUT);
@@ -395,62 +425,80 @@ static int process_state_boot(struct nfcmrvl_private *priv,
 
 static void fw_dnld_rx_work(struct work_struct *work)
 {
-	int ret;
-	struct sk_buff *skb;
 	struct nfcmrvl_fw_dnld *fw_dnld = container_of(work,
 						       struct nfcmrvl_fw_dnld,
 						       rx_work);
 	struct nfcmrvl_private *priv = container_of(fw_dnld,
 						    struct nfcmrvl_private,
 						    fw_dnld);
+	struct sk_buff *skb;
+	unsigned long flags;
+	int ret;
 
-	while ((skb = skb_dequeue(&fw_dnld->rx_q))) {
-		nfc_send_to_raw_sock(priv->ndev->nfc_dev, skb,
-				     RAW_PAYLOAD_NCI, NFC_DIRECTION_RX);
-		switch (fw_dnld->state) {
-		case STATE_RESET:
-			ret = process_state_reset(priv, skb);
-			break;
-		case STATE_INIT:
-			ret = process_state_init(priv, skb);
-			break;
-		case STATE_SET_REF_CLOCK:
-			ret = process_state_set_ref_clock(priv, skb);
-			break;
-		case STATE_SET_HI_CONFIG:
-			ret = process_state_set_hi_config(priv, skb);
-			break;
-		case STATE_OPEN_LC:
-			ret = process_state_open_lc(priv, skb);
-			break;
-		case STATE_FW_DNLD:
-			ret = process_state_fw_dnld(priv, skb);
-			break;
-		case STATE_CLOSE_LC:
-			ret = process_state_close_lc(priv, skb);
-			break;
-		case STATE_BOOT:
-			ret = process_state_boot(priv, skb);
-			break;
-		default:
-			ret = -EFAULT;
-		}
+	spin_lock_irqsave(&fw_dnld->rx_lock, flags);
+	if (fw_dnld->stopping || fw_dnld->starting || !fw_dnld->active) {
+		spin_unlock_irqrestore(&fw_dnld->rx_lock, flags);
+		return;
+	}
+	skb = skb_dequeue(&fw_dnld->rx_q);
+	spin_unlock_irqrestore(&fw_dnld->rx_lock, flags);
+	if (!skb)
+		return;
 
-		kfree_skb(skb);
+	nfc_send_to_raw_sock(priv->ndev->nfc_dev, skb,
+			     RAW_PAYLOAD_NCI, NFC_DIRECTION_RX);
+	switch (fw_dnld->state) {
+	case STATE_RESET:
+		ret = process_state_reset(priv, skb);
+		break;
+	case STATE_INIT:
+		ret = process_state_init(priv, skb);
+		break;
+	case STATE_SET_REF_CLOCK:
+		ret = process_state_set_ref_clock(priv, skb);
+		break;
+	case STATE_SET_HI_CONFIG:
+		ret = process_state_set_hi_config(priv, skb);
+		break;
+	case STATE_OPEN_LC:
+		ret = process_state_open_lc(priv, skb);
+		break;
+	case STATE_FW_DNLD:
+		ret = process_state_fw_dnld(priv, skb);
+		break;
+	case STATE_CLOSE_LC:
+		ret = process_state_close_lc(priv, skb);
+		break;
+	case STATE_BOOT:
+		ret = process_state_boot(priv, skb);
+		break;
+	default:
+		ret = -EFAULT;
+	}
 
-		if (ret != 0) {
-			nfc_err(priv->dev, "FW loading error");
-			fw_dnld_over(priv, ret);
-			break;
-		}
+	kfree_skb(skb);
+
+	if (ret) {
+		nfc_err(priv->dev, "FW loading error");
+		fw_dnld_over(priv, ret);
 	}
+
+	spin_lock_irqsave(&fw_dnld->rx_lock, flags);
+	if (!fw_dnld->stopping && !fw_dnld->starting && fw_dnld->active &&
+	    !skb_queue_empty(&fw_dnld->rx_q))
+		queue_work(fw_dnld->rx_wq, &fw_dnld->rx_work);
+	spin_unlock_irqrestore(&fw_dnld->rx_lock, flags);
 }
 
 int nfcmrvl_fw_dnld_init(struct nfcmrvl_private *priv)
 {
 	char name[32];
 
+	spin_lock_init(&priv->fw_dnld.rx_lock);
+	init_waitqueue_head(&priv->fw_dnld.rx_wait);
 	INIT_WORK(&priv->fw_dnld.rx_work, fw_dnld_rx_work);
+	INIT_WORK(&priv->fw_dnld.timeout_work, fw_dnld_timeout_work);
+	timer_setup(&priv->fw_dnld.timer, fw_dnld_timeout, 0);
 	snprintf(name, sizeof(name), "%s_nfcmrvl_fw_dnld_rx_wq",
 		 dev_name(&priv->ndev->nfc_dev->dev));
 	priv->fw_dnld.rx_wq = create_singlethread_workqueue(name);
@@ -462,26 +510,67 @@ int nfcmrvl_fw_dnld_init(struct nfcmrvl_private *priv)
 
 void nfcmrvl_fw_dnld_deinit(struct nfcmrvl_private *priv)
 {
+	timer_shutdown_sync(&priv->fw_dnld.timer);
+	cancel_work_sync(&priv->fw_dnld.rx_work);
+	cancel_work_sync(&priv->fw_dnld.timeout_work);
+	skb_queue_purge(&priv->fw_dnld.rx_q);
 	destroy_workqueue(priv->fw_dnld.rx_wq);
 }
 
 void nfcmrvl_fw_dnld_recv_frame(struct nfcmrvl_private *priv,
 				struct sk_buff *skb)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->fw_dnld.rx_lock, flags);
+	if (priv->fw_dnld.stopping || !priv->fw_dnld.active) {
+		spin_unlock_irqrestore(&priv->fw_dnld.rx_lock, flags);
+		kfree_skb(skb);
+		return;
+	}
+	priv->fw_dnld.rx_active++;
+	spin_unlock_irqrestore(&priv->fw_dnld.rx_lock, flags);
+
 	/* Discard command timer */
-	if (timer_pending(&priv->ndev->cmd_timer))
-		timer_delete_sync(&priv->ndev->cmd_timer);
+	timer_delete_sync(&priv->ndev->cmd_timer);
 
 	/* Allow next command */
 	atomic_set(&priv->ndev->cmd_cnt, 1);
 
-	/* Queue and trigger rx work */
-	skb_queue_tail(&priv->fw_dnld.rx_q, skb);
-	queue_work(priv->fw_dnld.rx_wq, &priv->fw_dnld.rx_work);
+	spin_lock_irqsave(&priv->fw_dnld.rx_lock, flags);
+	if (!priv->fw_dnld.stopping && priv->fw_dnld.active) {
+		/* Queue the frame, but do not process it during the reset pulse. */
+		skb_queue_tail(&priv->fw_dnld.rx_q, skb);
+		if (!priv->fw_dnld.starting)
+			queue_work(priv->fw_dnld.rx_wq,
+				   &priv->fw_dnld.rx_work);
+		skb = NULL;
+	}
+	priv->fw_dnld.rx_active--;
+	if (!priv->fw_dnld.rx_active &&
+	    (priv->fw_dnld.stopping || !priv->fw_dnld.active))
+		wake_up_all(&priv->fw_dnld.rx_wait);
+	spin_unlock_irqrestore(&priv->fw_dnld.rx_lock, flags);
+	kfree_skb(skb);
 }
 
 void nfcmrvl_fw_dnld_abort(struct nfcmrvl_private *priv)
 {
+	struct nfcmrvl_fw_dnld *fw_dnld = &priv->fw_dnld;
+	unsigned long flags;
+
+	device_lock(&priv->ndev->nfc_dev->dev);
+	spin_lock_irqsave(&fw_dnld->rx_lock, flags);
+	fw_dnld->stopping = true;
+	spin_unlock_irqrestore(&fw_dnld->rx_lock, flags);
+	device_unlock(&priv->ndev->nfc_dev->dev);
+
+	wait_event(fw_dnld->rx_wait, !READ_ONCE(fw_dnld->rx_active));
+	timer_shutdown_sync(&fw_dnld->timer);
+	cancel_work_sync(&fw_dnld->rx_work);
+	cancel_work_sync(&fw_dnld->timeout_work);
+	skb_queue_purge(&fw_dnld->rx_q);
+
 	fw_dnld_over(priv, -EHOSTDOWN);
 }
 
@@ -489,6 +578,7 @@ int nfcmrvl_fw_dnld_start(struct nci_dev *ndev, const char *firmware_name)
 {
 	struct nfcmrvl_private *priv = nci_get_drvdata(ndev);
 	struct nfcmrvl_fw_dnld *fw_dnld = &priv->fw_dnld;
+	unsigned long flags;
 	int res;
 
 	if (!priv->support_fw_dnld)
@@ -497,6 +587,14 @@ int nfcmrvl_fw_dnld_start(struct nci_dev *ndev, const char *firmware_name)
 	if (!firmware_name || !firmware_name[0])
 		return -EINVAL;
 
+	spin_lock_irqsave(&fw_dnld->rx_lock, flags);
+	if (fw_dnld->stopping || fw_dnld->active || fw_dnld->completing) {
+		res = fw_dnld->stopping ? -ENODEV : -EBUSY;
+		spin_unlock_irqrestore(&fw_dnld->rx_lock, flags);
+		return res;
+	}
+	spin_unlock_irqrestore(&fw_dnld->rx_lock, flags);
+
 	strscpy(fw_dnld->name, firmware_name);
 
 	/*
@@ -532,11 +630,6 @@ int nfcmrvl_fw_dnld_start(struct nci_dev *ndev, const char *firmware_name)
 		fw_dnld->binary_config = &fw_dnld->header->firmware;
 	}
 
-	/* Configure a timer for timeout */
-	timer_setup(&priv->fw_dnld.timer, fw_dnld_timeout, 0);
-	mod_timer(&priv->fw_dnld.timer,
-		  jiffies + msecs_to_jiffies(FW_DNLD_TIMEOUT));
-
 	/* Ronfigure HI to be sure that it is the bootrom values */
 	priv->if_ops->nci_update_config(priv,
 					&fw_dnld->header->bootrom.config);
@@ -546,8 +639,24 @@ int nfcmrvl_fw_dnld_start(struct nci_dev *ndev, const char *firmware_name)
 
 	/* First, reset the chip */
 	priv->fw_dnld.state = STATE_RESET;
+
+	spin_lock_irqsave(&fw_dnld->rx_lock, flags);
+	fw_dnld->active = true;
+	fw_dnld->starting = true;
+	spin_unlock_irqrestore(&fw_dnld->rx_lock, flags);
+
 	nfcmrvl_chip_reset(priv);
 
+	spin_lock_irqsave(&fw_dnld->rx_lock, flags);
+	fw_dnld->starting = false;
+	if (fw_dnld->active) {
+		mod_timer(&fw_dnld->timer,
+			  jiffies + msecs_to_jiffies(FW_DNLD_TIMEOUT));
+		if (!skb_queue_empty(&fw_dnld->rx_q))
+			queue_work(fw_dnld->rx_wq, &fw_dnld->rx_work);
+	}
+	spin_unlock_irqrestore(&fw_dnld->rx_lock, flags);
+
 	/* Now wait for CORE_RESET_NTF or timeout */
 
 	return 0;
diff --git a/drivers/nfc/nfcmrvl/fw_dnld.h b/drivers/nfc/nfcmrvl/fw_dnld.h
index 7c4d91b01..a8ed7bfcc 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.h
+++ b/drivers/nfc/nfcmrvl/fw_dnld.h
@@ -8,6 +8,8 @@
 #ifndef __NFCMRVL_FW_DNLD_H__
 #define __NFCMRVL_FW_DNLD_H__
 
+#include <linux/spinlock.h>
+#include <linux/wait.h>
 #include <linux/workqueue.h>
 
 #define NFCMRVL_FW_MAGIC		0x88888888
@@ -72,7 +74,16 @@ struct nfcmrvl_fw_dnld {
 
 	struct workqueue_struct	*rx_wq;
 	struct work_struct rx_work;
+	struct work_struct timeout_work;
 	struct sk_buff_head rx_q;
+	/* Protects stopping, starting, active, completing, and rx_active. */
+	spinlock_t rx_lock;
+	wait_queue_head_t rx_wait;
+	unsigned int rx_active;
+	bool stopping;
+	bool starting;
+	bool active;
+	bool completing;
 
 	struct timer_list timer;
 };
diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index a721d97a8..cfa5c6659 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -84,6 +84,13 @@ static int nfcmrvl_nci_flush(struct nci_dev *ndev)
 	return 0;
 }
 
+static void nfcmrvl_nci_shutdown(struct nci_dev *ndev)
+{
+	struct nfcmrvl_private *priv = nci_get_drvdata(ndev);
+
+	nfcmrvl_fw_dnld_abort(priv);
+}
+
 static int nfcmrvl_nci_setup(struct nci_dev *ndev)
 {
 	__u8 val = 1;
@@ -104,6 +111,7 @@ static const struct nci_ops nfcmrvl_nci_ops = {
 	.send = nfcmrvl_nci_send,
 	.ready = nfcmrvl_nci_ready,
 	.flush = nfcmrvl_nci_flush,
+	.shutdown = nfcmrvl_nci_shutdown,
 	.setup = nfcmrvl_nci_setup,
 	.fw_download = nfcmrvl_nci_fw_download,
 };
@@ -205,12 +213,10 @@ void nfcmrvl_nci_unregister_dev(struct nfcmrvl_private *priv)
 	struct nci_dev *ndev = priv->ndev;
 
 	nci_unregister_device(ndev);
+
 	if (priv->if_ops->nci_quiesce)
 		priv->if_ops->nci_quiesce(priv);
 
-	if (priv->ndev->nfc_dev->fw_download_in_progress)
-		nfcmrvl_fw_dnld_abort(priv);
-
 	nfcmrvl_fw_dnld_deinit(priv);
 
 	nci_free_device(ndev);
diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 8ada44f9f..2912a9e6c 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -78,6 +78,13 @@ struct nci_ops {
 	 * will then skip the reset exchange.
 	 */
 	int   (*flush)(struct nci_dev *ndev);
+	/*
+	 * Stop driver-private asynchronous activity after NFC admission has
+	 * closed and before core queues are destroyed.  This callback may sleep,
+	 * runs without req_lock held, and may use the still-live core workqueues
+	 * while draining.  It must not leave work which can submit new commands.
+	 */
+	void  (*shutdown)(struct nci_dev *ndev);
 	int   (*setup)(struct nci_dev *ndev);
 	int   (*post_setup)(struct nci_dev *ndev);
 	int   (*fw_download)(struct nci_dev *ndev, const char *firmware_name);
@@ -303,6 +310,7 @@ int nci_core_init(struct nci_dev *ndev);
 
 int nci_recv_frame(struct nci_dev *ndev, struct sk_buff *skb);
 int nci_send_frame(struct nci_dev *ndev, struct sk_buff *skb);
+void nci_cancel_pending_cmds(struct nci_dev *ndev);
 int nci_set_config(struct nci_dev *ndev, __u8 id, size_t len, const __u8 *val);
 
 int nci_nfcee_discover(struct nci_dev *ndev, u8 action);
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 4df6b1f7a..1469d2b59 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -159,6 +159,23 @@ inline int nci_request(struct nci_dev *ndev,
 	return rc;
 }
 
+/**
+ * nci_cancel_pending_cmds - stop and discard queued NCI commands
+ * @ndev: NCI device
+ *
+ * The caller must first prevent command producers from submitting new work.
+ * This helper may sleep and must not be called from cmd_work.
+ */
+void nci_cancel_pending_cmds(struct nci_dev *ndev)
+{
+	timer_delete_sync(&ndev->cmd_timer);
+	atomic_set(&ndev->cmd_cnt, 0);
+	cancel_work_sync(&ndev->cmd_work);
+	timer_delete_sync(&ndev->cmd_timer);
+	skb_queue_purge(&ndev->cmd_q);
+}
+EXPORT_SYMBOL(nci_cancel_pending_cmds);
+
 static void nci_reset_req(struct nci_dev *ndev, const void *opt)
 {
 	struct nci_core_reset_cmd cmd;
@@ -596,11 +613,7 @@ static int nci_close_device(struct nci_dev *ndev)
 	flush_workqueue(ndev->tx_wq);
 
 	/* Stop command producers before flushing the transport backlog. */
-	timer_delete_sync(&ndev->cmd_timer);
-	skb_queue_purge(&ndev->cmd_q);
-	flush_workqueue(ndev->cmd_wq);
-	timer_delete_sync(&ndev->cmd_timer);
-	flush_workqueue(ndev->cmd_wq);
+	nci_cancel_pending_cmds(ndev);
 	if (ndev->ops->flush)
 		flush_rc = ndev->ops->flush(ndev);
 
@@ -619,11 +632,7 @@ static int nci_close_device(struct nci_dev *ndev)
 		 * Remove that command before admitting a driver close callback,
 		 * some of which issue their own synchronous NCI command.
 		 */
-		timer_delete_sync(&ndev->cmd_timer);
-		atomic_set(&ndev->cmd_cnt, 0);
-		cancel_work_sync(&ndev->cmd_work);
-		timer_delete_sync(&ndev->cmd_timer);
-		skb_queue_purge(&ndev->cmd_q);
+		nci_cancel_pending_cmds(ndev);
 		atomic_set(&ndev->cmd_cnt, 1);
 		clear_bit(NCI_CLOSING, &ndev->flags);
 	}
@@ -633,11 +642,7 @@ static int nci_close_device(struct nci_dev *ndev)
 
 	set_bit(NCI_CLOSING, &ndev->flags);
 	clear_bit(NCI_INIT, &ndev->flags);
-	timer_delete_sync(&ndev->cmd_timer);
-	atomic_set(&ndev->cmd_cnt, 0);
-	cancel_work_sync(&ndev->cmd_work);
-	timer_delete_sync(&ndev->cmd_timer);
-	skb_queue_purge(&ndev->cmd_q);
+	nci_cancel_pending_cmds(ndev);
 
 	timer_delete_sync(&ndev->data_timer);
 
@@ -1358,6 +1363,8 @@ void nci_unregister_device(struct nci_dev *ndev)
 	struct nci_conn_info *conn_info, *n;
 
 	nfc_unregister_rfkill(ndev->nfc_dev);
+	if (ndev->ops->shutdown)
+		ndev->ops->shutdown(ndev);
 	/* This set_bit is not protected with specialized barrier,
 	 * However, it is fine because the mutex_lock(&ndev->req_lock);
 	 * in nci_close_device() will help to emit one.
-- 
2.54.0

