Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795256230;
	b=qkgePyzA05DwbImCBaoeDtbJ1b0IGfMStQFfYJlRjvCFeX5ucX8gBvVrgmBx+I75A3Qd
	 dbIGlB34eB6fYBDgiLtgGLitnk2hg4mmY75Ar9fFfWKG48Ta//3FfOjL9yxYIbmLevq4z
	 qizUOREl/RlfGy6XDAbHdhHV9B3Z+nJIlDLcyK+VkAt8ebp5L0BxUU+KTYonUinfeM+ju
	 jWk8xy42LqWbaPh+d/g1hSstZVsRP0Pq65AOqsOn1o6vrVr7EYxwMnVGugtn2ZeCVImsS
	 73S/xvFxWCEluTxYxGzMWqh5wHb6dJlw+ewpDHJv4dFeRt62hUr6VHwZ86WHhwat1Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795256230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Message-ID:In-Reply-To:References:To:Cc:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hA7B4cbt4BNXho5wCS9RDojNDzVWfmS9/OZPPdNbQV0=;
	b=AHeizmbb4s/f7Hzns8CDsbi3QNm9Y+C4DA07KfyqRC27D7+ps/Gx14JpjkoSHeTwbr4Z
	 rSo9g8SHYl10wYIt14RmY3uLHN5TOu0fV81Us3GAKzj1pRpd1siqeaoHuH2Zh8MkkaahO
	 3/lrx+CiNhF1DHWOlpTKxHLZ68XCnKu7IV/pn1VLAG0YUfh8YV4AuVPbLTWpt57440af9
	 pMT/dtVEIaDXnQmS3oyZPEnI5wosatoYoCf1qZjlcOAYSuGGLGYstYEtzXWC6Pgx+OClY
	 evbkumN/roOEoJvwbvupGYf0EYC0bATeX233i8A5r7PHFzq8gU4xvMNrxwawVp/eY2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR1wJxGp;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBFE606A320
	for <oe-linux-nfc@lists.linux.dev>; Sat, 21 Nov 2026 10:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CBFE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR1wJxGp
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so921588a91.0
        for <oe-linux-nfc@lists.linux.dev>; Sat, 21 Nov 2026 02:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795256229; x=1795861029; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:date:cc:to
         :references:in-reply-to:message-id:subject:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hA7B4cbt4BNXho5wCS9RDojNDzVWfmS9/OZPPdNbQV0=;
        b=TR1wJxGptsC65O1xY+I8YRf22rhrNZWCFpkPJpMTwZmjSUBBAckijL3lKyQcWrqbFQ
         sDCvGxpG2fQZTHblBiVfZu/q8evoWL1uMn81k0pKbCMMeEPDsVfQm2CeCnpyqQywESP3
         Evr2n8OejLmWtnDQFzmQnKZn5GSpvfGXqyfbsrowR0YttIsyw3DGKQcRDHBBj967+aDR
         hID3fv+YJWrN/dgL5tfj3YJJBk5T03mr0vPsnHjHVtLMB6oZCR8wMCS7M4M0lImuUlY6
         D75jsF2miIiFIGtbZXMtVxtZOamvOLw8kl/6EQEJ1RJeGnt6/cADZFAxtxc2iPxOAoEi
         feqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795256229; x=1795861029;
        h=content-transfer-encoding:content-type:mime-version:date:cc:to
         :references:in-reply-to:message-id:subject:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hA7B4cbt4BNXho5wCS9RDojNDzVWfmS9/OZPPdNbQV0=;
        b=bDIkkIEGfiqsUpOQfKvyLPN0FX0nPuJ9SRT0mrcJzEc5M9FjHjHoyO065w/7GDXnKR
         TX2tLQwWQfXAaRD/ZpSoxhEAISxz9hEMwMUHYqIxHm71Wpv/V0YiiuTId7iTpIXMFwOM
         2xeyKdSdeMPt0DNA0Be+7B8MQ7JD8fKxD3Y+xeuZIfWvCfYismVKwbRhCG8tGzAKLkEm
         np/iqzpUT0PyalGizDSYf4eCox2vGWt8V0zJHC9j4NgmmC1Ia1/17eM+5M2yg7aMZQes
         68hRmSFIiEVRF2sasbSo1GkCKrWpsAEIua5TVTAnmcKcvUhRe6fGco2hjHpM2uReiD8x
         nLQQ==
X-Forwarded-Encrypted: i=1; AL+hErEYl6vsetO2W7C0/XdNGJo4xH4/vDNOrJuvLSZHx9eLee8m0Uez/EM8+qd+s+lzu01qlWF9n+VtdYn56Hg=@lists.linux.dev
X-Gm-Message-State: APuU4Z94IQACAc844DnXgQsRc/++/1rbjbC0PUBqkVUxnRnOk5EB0hgj
	S/ZHKF8ImZgvgbheF+lVa9Jk8bAxnWYcY8t5PUmQYzZpIANgWf5oFmka
X-Gm-Gg: AZFdTZeuw8hSnOfjXCfaDFlw43/yzk5X5VKGBbe4/JrBE9NDw3XhbqW6F8APsl9xkFx
	RqRPgPRi9ZMrXWU6qXNBs1gy6BBmu8lv0E5wkamNqBp4dI2xPkGJQIXUSaxdoKtMemj3Mcs1NM7
	wlebiK2XPTTVe4FbV/g4A6rg37jfj9usWA9AEIdev9qVcxHAtQbmiiLnfXYeoD1NamLQsjvaHj6
	Xh5kGFLlOUOvsS86fEIBepvBCyZP78D+VdCoeb1edHFNVQpHvwVSFmmWOFQPdCbpL7HXs1Xeppj
	i2r+t/gE50Yt/gQkL+D9gNs1Dr9rtAB0xF+SBDwrmgsW31aqJyuidCdqCiVgvr6YznyUJehaFg7
	Pdw7F7BecfcLXI09a5GQS2Agd57LorRLjA2GnEgLjR+ln86c0I1H9yNrLBHL7J/XE5iH6aD3M3Q
	t1KB9g8eejkYfYmLOqelsIrKJgYpbzp98I/U4MYL+7mxKUFxr9yIz2Tkv5MCPUONV1+d4IxEMI+
	+u2iFBNqFSkFIy3cop3hgQBh2rLOpg4J8bF2GecXn2JFKJxqHhgc+CspsV5kR/CpmLAjGjvdsi1
	1NThjs9dvlWnMoUPicnrmp9YgdLJYKyoSAgPSHjw2CHQouPIuYJGPa3owb9wS9D+1ZrquZar7LM
	56uJfSVxt
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr4906255a91.7.1795256228674;
        Sat, 21 Nov 2026 02:17:08 -0800 (PST)
Received: from patch.eml (awork078078.netvigator.com. [203.198.250.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7a8c64sm1643858a91.3.2026.11.21.02.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 02:17:08 -0800 (PST)
From: Yuqi Xu <xuyuqiabc@gmail.com>
Subject: [PATCH net v3 1/1] nfc: digital: fix use-after-free in unregister
Message-ID: <20261121181620.57904-1-xuyuqiabc@gmail.com>
In-Reply-To: <cover.1795253714.git.xuyuqiabc@gmail.com>
References: <cover.1795253714.git.xuyuqiabc@gmail.com>
To: netdev@vger.kernel.org, oe-linux-nfc@lists.linux.dev
Cc: David Heidelberg <david@ixit.cz>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 stable@vger.kernel.org, Vega <vega@nebusec.ai>, Ren Wei <weir@nebusec.ai>,
 xuyq21@lenovo.com, Mark Greer <mgreer@animalcreek.com>, Uwe =?utf-8?q?Klein?=
 =?utf-8?q?e-K=C3=B6nig?= (The Capable Hub) <u.kleine-koenig@baylibre.com>,
 Ian Ray <ian.ray@gehealthcare.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thierry Escande <thierry.escande@linux.intel.com>,
 Samuel Ortiz <sameo@linux.intel.com>
Date: Sat, 21 Nov 2026 18:16:20 +0800
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

nfc_digital_unregister_device() cancels its own workqueue items and
then frees every queued digital_cmd. A command already submitted to
the driver remains the argument of the async completion.
digital_send_cmd_complete() can still assign cmd->resp after that
object has been freed, which is a use-after-free.

Abort or quiesce the in-flight driver command before reclaiming the
queue, and drain the completion work the driver may schedule from it. Once
the nfc device is shutting down, do not queue or submit another
command: finishing the aborted one would otherwise hand the next
queued command to the driver while it is being freed.

Cancelling cmd_complete_work does not run it, so a response the driver
already reported can be left without a consumer. Free cmd->resp in the
cleanup loop, and free cmd->req for a command that is still queued and
was never handed to the driver, which is the only case where the stack
still owns it.

Port100 and nfcsim invoke the digital completion from a private work
item, so flush that work before abort returns. trf7970a completes from
a delayed timeout work and from its IRQ thread. Mark the command
complete before invoking its callback, so a timeout handler that is
already running cannot complete the same command again. Preserve an
ignore_timeout already set by the IRQ path, and cancel the timeout work
synchronously after shutdown and before unregister, so a running
handler is drained while the command and device are still alive.
Handle the MD listening state in abort and shutdown as well. st95hf's
IRQ thread can observe that remove already ran and must not call back
into the freed command.

Adding the MD listening state to abort and shutdown also changes the
normal stop-poll and suspend paths: an MD listen now returns -ECANCELED
immediately instead of running until its timeout, and suspend powers
the chip down instead of leaving it powered. This state handling is
required so an MD listen cannot outlive the device; stable backports
should not treat the normal-path behavior change as unrelated cleanup.

shutting_down is read under cmd_lock but written under the device lock,
so mark the accesses with READ_ONCE() and WRITE_ONCE(). Document that
abort_cmd() must leave no completion callback running after the command
is freed, either in abort_cmd() itself or through the driver's removal
serialization.

Fixes: 59ee2361c924 ("NFC Digital: Implement driver commands mechanism")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Signed-off-by: Yuqi Xu <xuyuqiabc@gmail.com>
Reviewed-by: Ren Wei <weir@nebusec.ai>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/nfc/nfcsim.c      |  8 +++++++-
 drivers/nfc/port100.c     |  7 +++++++
 drivers/nfc/st95hf/core.c | 13 ++++++++++---
 drivers/nfc/trf7970a.c    | 20 +++++++++++++++++++-
 include/net/nfc/digital.h | 10 +++++++++-
 net/nfc/core.c            |  4 ++--
 net/nfc/digital_core.c    | 33 ++++++++++++++++++++++++++++++++-
 7 files changed, 86 insertions(+), 9 deletions(-)

diff --git a/drivers/nfc/nfcsim.c b/drivers/nfc/nfcsim.c
index f8e5c4da3b13..52d1fbf8e532 100644
--- a/drivers/nfc/nfcsim.c
+++ b/drivers/nfc/nfcsim.c
@@ -239,9 +239,15 @@ static int nfcsim_send(struct nfc_digital_dev *ddev, struct sk_buff *skb,
 
 static void nfcsim_abort_cmd(struct nfc_digital_dev *ddev)
 {
-	const struct nfcsim *dev = nfc_digital_get_drvdata(ddev);
+	struct nfcsim *dev = nfc_digital_get_drvdata(ddev);
 
 	nfcsim_link_recv_cancel(dev->link_in);
+	/*
+	 * recv_work blocks in the link wait and then calls the digital
+	 * completion. Wake it and wait so the callback cannot run after
+	 * abort_cmd() returns.
+	 */
+	flush_work(&dev->recv_work);
 }
 
 static int nfcsim_switch_rf(struct nfc_digital_dev *ddev, bool on)
diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index e769a30b8b5c..738acb87f19b 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -968,6 +968,13 @@ static void port100_abort_cmd(struct nfc_digital_dev *ddev)
 
 	/* cancel the urb request */
 	usb_kill_urb(dev->in_urb);
+
+	/*
+	 * The URB completion handler only queues cmd_complete_work, which
+	 * is what calls back into the digital stack. Run it before
+	 * returning so that callback cannot outlive abort_cmd().
+	 */
+	flush_work(&dev->cmd_complete_work);
 }
 
 static struct sk_buff *port100_alloc_skb(const struct port100 *dev, unsigned int size)
diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 4d772a308bff..b39a5215dad7 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -856,9 +856,16 @@ static irqreturn_t st95hf_irq_thread_handler(int irq, void  *st95hfcontext)
 	kfree_skb(skb_resp);
 	wtx = false;
 	cb_arg->rats = false;
-	skb_resp = ERR_PTR(result);
-	/* call of callback with error */
-	cb_arg->complete_cb(stcontext->ddev, cb_arg->cb_usrarg, skb_resp);
+	/*
+	 * remove() frees the digital command before dropping rm_lock.
+	 * The completion argument is then gone; do not write it.
+	 */
+	if (!stcontext->nfcdev_free) {
+		skb_resp = ERR_PTR(result);
+		/* call of callback with error */
+		cb_arg->complete_cb(stcontext->ddev, cb_arg->cb_usrarg,
+				    skb_resp);
+	}
 	/* up the semaphore before returning */
 	up(&stcontext->exchange_lock);
 	mutex_unlock(&stcontext->rm_lock);
diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index ddfc58c29964..9b440997a2e8 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -652,6 +652,12 @@ static void trf7970a_send_upstream(struct trf7970a *trf)
 	dev_kfree_skb_any(trf->tx_skb);
 	trf->tx_skb = NULL;
 
+	/*
+	 * A timeout handler may already be running and waiting for trf->lock.
+	 * It must not deliver another completion after this one.
+	 */
+	trf->ignore_timeout = true;
+
 	if (trf->rx_skb && !IS_ERR(trf->rx_skb) && !trf->aborting)
 		print_hex_dump_debug("trf7970a rx data: ", DUMP_PREFIX_NONE,
 				     16, 1, trf->rx_skb->data, trf->rx_skb->len,
@@ -1903,7 +1909,9 @@ static void trf7970a_abort_cmd(struct nfc_digital_dev *ddev)
 		trf->aborting = true;
 		break;
 	case TRF7970A_ST_LISTENING:
-		trf->ignore_timeout = !cancel_delayed_work(&trf->timeout_work);
+	case TRF7970A_ST_LISTENING_MD:
+		if (!cancel_delayed_work(&trf->timeout_work))
+			trf->ignore_timeout = true;
 		trf7970a_send_err_upstream(trf, -ECANCELED);
 		dev_dbg(trf->dev, "Abort process complete\n");
 		break;
@@ -2017,6 +2025,9 @@ static void trf7970a_shutdown(struct trf7970a *trf)
 	case TRF7970A_ST_WAIT_FOR_RX_DATA_CONT:
 	case TRF7970A_ST_WAIT_TO_ISSUE_EOF:
 	case TRF7970A_ST_LISTENING:
+	case TRF7970A_ST_LISTENING_MD:
+		if (!cancel_delayed_work(&trf->timeout_work))
+			trf->ignore_timeout = true;
 		trf7970a_send_err_upstream(trf, -ECANCELED);
 		fallthrough;
 	case TRF7970A_ST_IDLE:
@@ -2229,6 +2240,13 @@ static void trf7970a_remove(struct spi_device *spi)
 
 	mutex_unlock(&trf->lock);
 
+	/*
+	 * shutdown() leaves the chip powered off, so no IRQ or command path
+	 * can arm the timeout again.  Wait for a handler that was already
+	 * running before unregister frees the commands it may complete.
+	 */
+	cancel_delayed_work_sync(&trf->timeout_work);
+
 	nfc_digital_unregister_device(trf->ddev);
 	nfc_digital_free_device(trf->ddev);
 
diff --git a/include/net/nfc/digital.h b/include/net/nfc/digital.h
index bb3e8fdc0692..ca6b96571a51 100644
--- a/include/net/nfc/digital.h
+++ b/include/net/nfc/digital.h
@@ -131,7 +131,15 @@ typedef void (*nfc_digital_cmd_complete_t)(struct nfc_digital_dev *ddev,
  * @switch_rf: Turns device radio on or off. The stack does not call explicitly
  *	switch_rf to turn the radio on. A call to in|tg_configure_hw must turn
  *	the device radio on.
- * @abort_cmd: Discard the last sent command.
+ * @abort_cmd: Discard the last sent command. When called from
+ *	nfc_digital_unregister_device(), the command is freed after this
+ *	returns, so the driver must ensure that no completion callback for
+ *	that command can run afterwards. The driver may do this in
+ *	abort_cmd() itself, or by serializing removal before calling
+ *	nfc_digital_unregister_device() (for example, by shutting the
+ *	device down and flushing its completion paths). Any completion
+ *	path started before that point must have finished before the
+ *	command is freed.
  *
  * Notes: Asynchronous functions have a timeout parameter. It is the driver
  *	responsibility to call the digital stack back through the
diff --git a/net/nfc/core.c b/net/nfc/core.c
index f521669293f0..af2c9bd1fadb 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -1133,7 +1133,7 @@ int nfc_register_device(struct nfc_dev *dev)
 			dev->rfkill = NULL;
 		}
 	}
-	dev->shutting_down = false;
+	WRITE_ONCE(dev->shutting_down, false);
 	device_unlock(&dev->dev);
 
 	rc = nfc_genl_device_added(dev);
@@ -1167,7 +1167,7 @@ void nfc_unregister_rfkill(struct nfc_dev *dev)
 		rfk = dev->rfkill;
 		dev->rfkill = NULL;
 	}
-	dev->shutting_down = true;
+	WRITE_ONCE(dev->shutting_down, true);
 	device_unlock(&dev->dev);
 
 	if (rfk) {
diff --git a/net/nfc/digital_core.c b/net/nfc/digital_core.c
index 18236221d898..376dc78b5b19 100644
--- a/net/nfc/digital_core.c
+++ b/net/nfc/digital_core.c
@@ -162,7 +162,11 @@ static void digital_wq_cmd(struct work_struct *work)
 
 	cmd = list_first_entry_or_null(&ddev->cmd_queue, struct digital_cmd,
 				       queue);
-	if (!cmd || cmd->pending) {
+	/*
+	 * Unregister has already handed an in-flight command to the driver
+	 * and will free whatever is still queued. Do not submit another one.
+	 */
+	if (READ_ONCE(ddev->nfc_dev->shutting_down) || !cmd || cmd->pending) {
 		mutex_unlock(&ddev->cmd_lock);
 		return;
 	}
@@ -244,6 +248,11 @@ int digital_send_cmd(struct nfc_digital_dev *ddev, u8 cmd_type,
 	INIT_LIST_HEAD(&cmd->queue);
 
 	mutex_lock(&ddev->cmd_lock);
+	if (READ_ONCE(ddev->nfc_dev->shutting_down)) {
+		mutex_unlock(&ddev->cmd_lock);
+		kfree(cmd);
+		return -ENODEV;
+	}
 	list_add_tail(&cmd->queue, &ddev->cmd_queue);
 	mutex_unlock(&ddev->cmd_lock);
 
@@ -846,9 +855,31 @@ void nfc_digital_unregister_device(struct nfc_digital_dev *ddev)
 	cancel_work_sync(&ddev->cmd_work);
 	cancel_work_sync(&ddev->cmd_complete_work);
 
+	/*
+	 * A command with pending set has been given to the driver as the
+	 * completion argument. Freeing it here lets a late
+	 * digital_send_cmd_complete() write cmd->resp into freed memory.
+	 * abort_cmd() drops that exchange; the driver may schedule
+	 * cmd_complete_work before it returns, so drain both works again.
+	 */
+	digital_abort_cmd(ddev);
+	cancel_work_sync(&ddev->cmd_complete_work);
+	cancel_work_sync(&ddev->cmd_work);
+
 	list_for_each_entry_safe(cmd, n, &ddev->cmd_queue, queue) {
 		list_del(&cmd->queue);
 
+		/*
+		 * A command that was never submitted still owns its request.
+		 * A command whose completion work was cancelled above may
+		 * have a response that nobody consumed.
+		 */
+		if (!cmd->pending)
+			kfree_skb(cmd->req);
+
+		if (!IS_ERR_OR_NULL(cmd->resp))
+			kfree_skb(cmd->resp);
+
 		/* Call the command callback if any and pass it a ENODEV error.
 		 * This gives a chance to the command issuer to free any
 		 * allocated buffer.
-- 
2.56.1


