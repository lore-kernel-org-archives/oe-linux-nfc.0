Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794032393;
	b=HgHNheDBwx2DgQiYQcfhgpo//irE1PxWQSb3hcdFL4Qhn8mEo7Mg5dT3F9jhwAB8ITwI
	 6eIfZv6CY8AYJcHMopivRJmgVHdWPpDGU703/VoQTwtASIb8RRTW1skuJTAjKd2bBrQHL
	 H1J1BSuXBj+t2FAYfT3EDu6QZB5LBbw6tkX8UpzBehoSzNSv8Ag+m6JFvyMuJw9P4KXdE
	 /S9rXt8VBBh1GEn/7F9sRuhB6rKpFmg2+VeoyGmXKSPnJjknXCtOyMeKAVAlcI+gIwC1w
	 eBCKYyZzDO4RkYGytE2jej9xkS9TqSe/aljBb0EOC4LYg2Eb6iTLRTz4NkCBbXf+tiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794032393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Message-ID:In-Reply-To:References:To:Cc:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Xd/Rrz6G4skAqcLMMbmw+5Mcc5fzjjR69xjLDlk4KFE=;
	b=KrbzppuhzuUjVip2iGFnwRkDesET6Vvo2eUM+tlS3B/qAw683AxP/Om0sGPzakEr3k73
	 qSnKd37MCTxxnTakoFsig8vlxKfLYPOKEID+yWQ6LY4uFyv6Dgxj39zsbPWOdv5kjK9nE
	 5Q8otNVHRm4rnDBIe4z3MVC93PiI2Wm7zVYzOuGwSvABReyDgTxn9RYaTHNCV0dPT2VCI
	 NFHPYbUG1OxCEqv/tN/b8k7IsIigE1CdRYLjcUM51XFN+++nIjTHYE1rwk1LpT5XNgwOt
	 Y88wFjqzHv/676Ke9kgtia6KXVuAXdIsXDm8L4XBJwwo1WuHTi3WsFHIalXH0DV4J7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bLd6TbwN;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79583606A32D
	for <oe-linux-nfc@lists.linux.dev>; Sat,  7 Nov 2026 06:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79583606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bLd6TbwN
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1117050a91.3
        for <oe-linux-nfc@lists.linux.dev>; Fri, 06 Nov 2026 22:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794032393; x=1794637193; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:date:cc:to
         :references:in-reply-to:message-id:subject:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xd/Rrz6G4skAqcLMMbmw+5Mcc5fzjjR69xjLDlk4KFE=;
        b=bLd6TbwNjlUUz8DQKA1bxjc/f1dQtt2u448bTubVbXOXP+x+Uc1Sn5VvnzPYQjslSC
         cJkDhGDlFpobBJImIm+MBibplm0EU66PcuXjfy+pxbf6y/0WZvNHDDPBnSsb6Xv7r1TJ
         ljkQI6poV6b4tVCpdHkpRhxGCVAoDXY5MQA6OwbEBiPXsdomDVi2PrHtMVsZ+wW1cuo4
         kCkHlvrv8440FUS4c9jnXJlC47CtQe9rCut4xFjswW457HXvCO6Fv8yFqdjaJvbDTQ3F
         dZQ7IbfPX2yXRWF0Pxzj/V3Xda1YsYpoJSpKrhPpTVNP0SWm1eo80/xMZM6bug0j1pIR
         U6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794032393; x=1794637193;
        h=content-transfer-encoding:content-type:mime-version:date:cc:to
         :references:in-reply-to:message-id:subject:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xd/Rrz6G4skAqcLMMbmw+5Mcc5fzjjR69xjLDlk4KFE=;
        b=znkY/UqPdEhRVl95/PFOVs7O3BGTZM31OXifgxEr1s1uDW6X9+KTmDzB1qeBpALZrV
         2zvCAUO4nxTjeiE3kTir5Y+BEFSmi8Cbs2c8KMuUh0TzURAaWPr14ZhOO33SeLjE1Nwj
         Dsb0DzfnccWBVWibPuC5NjTdTs2kXUo4dti/RY2jJaL61wjaGpZM3GdGi96Vu608Z2OO
         u7f0o6T9/ZOzquenPO2pLTMK6T/TarTnTWH4UTGo4L5mdQ+E18S3sOA+/Ab/2TU4QeMP
         ozEIf8zWdYh9LrtmYD36A52dDdKiSkjSvd83RAKQk5sQihsjPvXEqPM4nDhNz8quMxRx
         iphA==
X-Forwarded-Encrypted: i=1; AL+hErFXlWIql9UK1bb98ZVmb1CuhjcU8zf1XUlStIfzFD44DArNWv+gGFAWM+vGY8nGvjr/sdQ1ExIXlrGniyw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+BX2QYz020fT+WDTZqvJQ4BkxN19k0EGS3bN3X+hGAd1vvlpn7
	vjveoCCAGqc/ZgibUpDRRmAxj3RnqQdMKXQidfr4kVOApo+9G1DGkWv2
X-Gm-Gg: AYBFou335nh3uG1ipawAnf6LsKc2sG6/hwIt+ToR7qQ4H6kBEyHKjJaRjgNg8G59WgU
	d6AgdSURSGLIwoKA5wOoOQ+I766Aw/o3L39TunGKdVZLT21YFjC3a917+3dhxpVa70Rc+lYiMVP
	fEhLSlGAWrzctypfUr3WoGY0G1zHB5he8tLhj3w/TvyPc932YPjOUXNR+FVk4WkBF1wKY6jj6Ec
	/1CFNaWpFnro8nO3LgF0gSsC8hCE9Ly3WJVo060Hikwva7yH3W7aFOowQz6clgbvG9yV4QG03HK
	6L0PTwaPq9g0uoVOujtzZy1YfpGSHu5sKsHb9tZjXRiLI1t5pumaWGXMVp0+qUeFxGIBHykKUXI
	06GwqQnp9pC4Pymbufi2oDpPK3sK68zJCaJlIgzlNNJ68O+JsEML2OHffs+egp3UV54ppoOgDdd
	gs0/r8UJN4F1idCxrx9LI6JmqoTT0cJX6Eowk0Spxd7b9bEYyvowi4xX+3Jfp4q1AJoLlcRGBZz
	WIO58qQ7bjSpkWGsHAhBxfC+Dufs9VCgclaF2m/8Drc2hvf2v1UMEWogm/41suvnbvxsgNKi3oh
	SXuqJoGHLaBb3ZBj1+eILKl/dPtltDYOwiUvKJc14grJrrJsUTvZWT5aFHuerhLa9VKtLnPMBko
	O1MAt/DU=
X-Received: by 2002:a17:90b:540c:b0:3ad:adfe:5854 with SMTP id 98e67ed59e1d1-3b0db6e4757mr4779195a91.40.1794032392625;
        Fri, 06 Nov 2026 22:19:52 -0800 (PST)
Received: from patch.eml (awork078078.netvigator.com. [203.198.250.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058a7b29sm1965794a91.10.2026.11.06.22.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:19:52 -0800 (PST)
From: Yuqi Xu <xuyuqiabc@gmail.com>
Subject: [PATCH net v2 1/1] nfc: digital: fix use-after-free in unregister
Message-ID: <20261107141910.549465-1-xuyuqiabc@gmail.com>
In-Reply-To: <cover.1793112510.git.xuyuqiabc@gmail.com>
References: <cover.1793112510.git.xuyuqiabc@gmail.com>
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
Date: Sat, 07 Nov 2026 14:19:10 +0800
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

Abort the in-flight driver command before reclaiming the queue, and
drain the completion work the driver may schedule from abort. Once
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
a delayed timeout work and from its IRQ thread; handle its MD listening
state in abort and shutdown, and cancel the timer only after unregister,
so no submission or IRQ path can arm it again before the device is
freed. st95hf's IRQ thread can observe that remove already ran and must
not call back into the freed command.

shutting_down is read under cmd_lock but written under the device lock,
so mark the accesses with READ_ONCE() and WRITE_ONCE(). Document the
unregister-time requirement that abort_cmd() must not leave a completion
callback armed or running.

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
 drivers/nfc/trf7970a.c    | 11 +++++++++++
 include/net/nfc/digital.h |  6 +++++-
 net/nfc/core.c            |  4 ++--
 net/nfc/digital_core.c    | 33 ++++++++++++++++++++++++++++++++-
 7 files changed, 74 insertions(+), 8 deletions(-)

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
index ddfc58c29964..87c833abb36a 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -1903,6 +1903,7 @@ static void trf7970a_abort_cmd(struct nfc_digital_dev *ddev)
 		trf->aborting = true;
 		break;
 	case TRF7970A_ST_LISTENING:
+	case TRF7970A_ST_LISTENING_MD:
 		trf->ignore_timeout = !cancel_delayed_work(&trf->timeout_work);
 		trf7970a_send_err_upstream(trf, -ECANCELED);
 		dev_dbg(trf->dev, "Abort process complete\n");
@@ -2017,6 +2018,8 @@ static void trf7970a_shutdown(struct trf7970a *trf)
 	case TRF7970A_ST_WAIT_FOR_RX_DATA_CONT:
 	case TRF7970A_ST_WAIT_TO_ISSUE_EOF:
 	case TRF7970A_ST_LISTENING:
+	case TRF7970A_ST_LISTENING_MD:
+		trf->ignore_timeout = !cancel_delayed_work(&trf->timeout_work);
 		trf7970a_send_err_upstream(trf, -ECANCELED);
 		fallthrough;
 	case TRF7970A_ST_IDLE:
@@ -2230,6 +2233,14 @@ static void trf7970a_remove(struct spi_device *spi)
 	mutex_unlock(&trf->lock);
 
 	nfc_digital_unregister_device(trf->ddev);
+
+	/*
+	 * shutdown() leaves the chip powered off, so no IRQ or command path
+	 * can arm the timeout again and unregister has cancelled cmd_work.
+	 * Wait for a handler that was already running before freeing trf.
+	 */
+	cancel_delayed_work_sync(&trf->timeout_work);
+
 	nfc_digital_free_device(trf->ddev);
 
 	regulator_disable(trf->vddio_regulator);
diff --git a/include/net/nfc/digital.h b/include/net/nfc/digital.h
index bb3e8fdc0692..d5ae45da5a33 100644
--- a/include/net/nfc/digital.h
+++ b/include/net/nfc/digital.h
@@ -131,7 +131,11 @@ typedef void (*nfc_digital_cmd_complete_t)(struct nfc_digital_dev *ddev,
  * @switch_rf: Turns device radio on or off. The stack does not call explicitly
  *	switch_rf to turn the radio on. A call to in|tg_configure_hw must turn
  *	the device radio on.
- * @abort_cmd: Discard the last sent command.
+ * @abort_cmd: Discard the last sent command. When called from
+ *	nfc_digital_unregister_device(), the command is freed after this
+ *	returns, so the driver must ensure that its completion callback
+ *	cannot run afterwards. Completions delivered from work items, IRQ
+ *	handlers or timers must be cancelled or flushed before returning.
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
2.56.0


