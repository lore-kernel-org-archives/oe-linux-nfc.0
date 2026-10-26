Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999504;
	b=WvYp0ZxttMgF1zFcI+VilHRMRsqzRtoUeTTaR/TRceXzhaAht4inxLPozl0BjfvXD81P
	 3ObUK7qxdRdRJZdscPEK/+pj4dNTK62c4c/YjQhFJBfN2/9iu83FgBxE5U1AFl+5wDlMZ
	 HWKzX1hAqZeae7iKQ94gzOLyb4CV8Uv6RAVDTDasj1+LI5ICWtRHpQoFDEEjc4q12L/Ul
	 KUeXmb8a5EuuChUPddUAVksbC7h8f2bAzK/Td+xX11yVcc5393EGZkHUAooKXBlAJHrnK
	 yDpJalEiqtpHxBnb2bCpjPDoNCD4P0GZrojfDXmLzITu53UPRgERaC4YNUc5CmWhh3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=sx3lWDVnR64JFWojROwlNESi0RwJ9liq+5x38VAAbKg=;
	b=P9PGK46btAT9vYgnwymA2fzGuACWba7HCl2bigTOob8TQuBFVVeD/Nik9cvig2fO8XXB
	 JdpN9shsf/4dHnVsy2sTJDXcHq5j/I1m7r7SWG5gVxBF3/HRE8YWBWKFfAhScl1dhfaiA
	 6jzTitLA07qtk2BgvVGHEqOXkdT1df22G8KqyZVjZfTyp/ppEIqtF4CM4Hvjiirpicu98
	 +Igi0gvhDkVVjhCODesVOqWfKayZrlUzzev0oWZC5wYKODfwsEjW8MrGeu9NWVbXvpvwd
	 L9xG6H0Pti0TThAh1eUetUyncP37GUug0LwzDRelkZV5A1ubtTQzm/BQf10e5CJHCqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LX79GW6z;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 31171606A31B
	for <oe-linux-nfc@lists.linux.dev>; Mon, 26 Oct 2026 07:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31171606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LX79GW6z
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1425810a91.3
        for <oe-linux-nfc@lists.linux.dev>; Mon, 26 Oct 2026 00:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792999503; x=1793604303; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sx3lWDVnR64JFWojROwlNESi0RwJ9liq+5x38VAAbKg=;
        b=LX79GW6zw4hYNYRuti83borNM4ykR8ImMwH1vhzXm8x9d1qxmtCuHhc254l/KTxoVi
         rqXOMNy8p6u25L2f8ipsmOrrEgK+fmtgvZNkgHhHqh7hC9t+uL8+zHidaVX3jlULKym9
         RLDvbVjnpF1yn8ozR+J2Bnn0lK2psKqprciyxdl/eteRWqYwkR1piv5LnACUrvwPC6tB
         sImyEQKeC2tubBdrRObWdMamekgJY09Geu/E5kJrgLZwnuaDryMJwfG/rSINQLREeUN9
         rVrXqs8p8GpNs9uV7BL8FjY2xcW9agkGtgxRe0jqO1n/r2+87dK7/yPvyosoZ1j1vk71
         STZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792999503; x=1793604303;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sx3lWDVnR64JFWojROwlNESi0RwJ9liq+5x38VAAbKg=;
        b=FIZI6J2oN+JyBYi9erbVqlxqDZqk7CcPxMeYLv3aqkWqZ/c47QVnVIwSiXrezBnpYZ
         2UiBpdoBoH3fegsF0dZThlSMEp2l6hv0zQiYuC25u2T4R3pUcKE2Aa+tkL1F+OTHPpXJ
         O5bHc7kSTGZ3azP2BOZ1a6NQwWgdpMr3ZRC6o96SdpaGqJ1Z1fJKmH/Ld+JSICOV11IT
         E7F2Px4NENVdWOMOqRvh9/WLeWlgpOJ857zAArzfZUuXsC4yAWjYIhAtfGCSD6H9Eema
         tCFqdHaARYfuOuyzVcM3DWDEaI78xICSJ5BbU1Qcg2xumu9mqAUqo8fN283JI1SKGD8F
         dJOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzbaWONDx7pguPeRwBGib8hr/OrV/fOmaRLBJvrloSCcXwvDwVHFFJmMaumOeKLu2onvUkz/FAgBXpQyo=@lists.linux.dev
X-Gm-Message-State: AFq9FYKTVNHQidlHHe6Pn1TMIOdPJtKO2D/lG5ySUu+OrRsDDjPf1PyI
	/gsNoqHfLbLKLifmt1mOYlZhb76UqVez0UASRuZhVQWtsdv+iou1Nu/n
X-Gm-Gg: AYBFou1Mv1VcUdV+ZAmQc7vJ6aFbUYxOjKIFQSHj4vBeZWnFe+P6CAi1DVuZKStBpTf
	voZFwmURR5m5AEjD/K2LOzHQYoWP1kZjOIC2e3tKJZNVf+ZJ6eE0Op9uOVXRGp7Fe5glVylqnNt
	Hn+utPDttFxZxWYEIJaohh/DfVXIRkbZ1wS3mA6ZY8fRH45ZX24GGtNBiXSWT3mZpTxUEwcy/Vk
	K9zgXKXLoySmsv3dofza8XxDZ3uB/msKzFaeZrCfCQt+DGlQZgXx6b20Hk6hmMk6W9cWM89bsdT
	eGwSshOVwLay2KpNuwtcg9N78tRunuqczMRu7201P6s7a8Ratr8a2ZBwQ4QWFZqdNVWbungnlHB
	jYvsGClx2+3pCWK7O5DNvw9jKZfAdLMNXtAgy2LKauseqVIndLwsP0R6lDlSCDwE+zXHVByjisI
	6PDah+syBZyVh00Zm7KsVagVqU6ioXfNJFrFKTbKH6FBeEgwJ32VWEbUXJctU2zHyG2QP71MnE6
	mPKr1Xy2CHDmxqjDg5vEe7iSqe4nRE+uTUAJt8lTAvVxaAPVJRwi1afVKk+YuA0DUitJ/VVPnF/
	I2zKo20Lf6ioguzhdkalrPvyjtK/H1e4pFpWhubd/wjd8+IUtd134ZARxPoH
X-Received: by 2002:a17:90b:4ac5:b0:3ac:9717:afd1 with SMTP id 98e67ed59e1d1-3adeafaeb88mr4810570a91.63.1792999503501;
        Mon, 26 Oct 2026 00:25:03 -0700 (PDT)
Received: from 822-patch.eml (awork078078.netvigator.com. [203.198.250.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b11f48dsm12911345ad.17.2026.10.26.00.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:25:03 -0700 (PDT)
From: Yuqi Xu <xuyuqiabc@gmail.com>
To: netdev@vger.kernel.org, oe-linux-nfc@lists.linux.dev
Cc: David Heidelberg <david@ixit.cz>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, stable@vger.kernel.org, Vega <vega@nebusec.ai>, Ren Wei <weir@nebusec.ai>, xuyq21@lenovo.com, Mark Greer <mgreer@animalcreek.com>, "Uwe Kleine-König (The Capable Hub)" <u.kleine-koenig@baylibre.com>, Ian Ray <ian.ray@gehealthcare.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Thierry Escande <thierry.escande@linux.intel.com>, Samuel Ortiz <sameo@linux.intel.com>
Subject: [PATCH net 1/1] nfc: digital: fix use-after-free in unregister
Date: Mon, 26 Oct 2026 15:24:07 +0800
Message-ID: <1792999448.107874-2-xuyuqiabc@gmail.com>
In-Reply-To: <cover.1791172164.git.xuyuqiabc@gmail.com>
References: <cover.1791172164.git.xuyuqiabc@gmail.com>
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.56.0

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

Port100 and nfcsim invoke the digital completion from a private work
item, so flush that work before abort returns. trf7970a completes from
a delayed timeout work and from its IRQ thread; handle its MD listening
state in abort and shutdown, and stop the timer before the device is
released. st95hf's IRQ thread can observe that remove already ran and
must not call back into the freed command.

Fixes: 59ee2361c924 ("NFC Digital: Implement driver commands mechanism")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Signed-off-by: Yuqi Xu <xuyuqiabc@gmail.com>
Reviewed-by: Ren Wei <weir@nebusec.ai>
---
 drivers/nfc/nfcsim.c      |  8 +++++++-
 drivers/nfc/port100.c     |  7 +++++++
 drivers/nfc/st95hf/core.c | 13 ++++++++++---
 drivers/nfc/trf7970a.c    |  5 +++++
 net/nfc/digital_core.c    | 22 +++++++++++++++++++++-
 5 files changed, 50 insertions(+), 5 deletions(-)

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
index ddfc58c29964..962a5e08bcd0 100644
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
@@ -2223,6 +2226,8 @@ static void trf7970a_remove(struct spi_device *spi)
 {
 	struct trf7970a *trf = spi_get_drvdata(spi);
 
+	cancel_delayed_work_sync(&trf->timeout_work);
+
 	mutex_lock(&trf->lock);
 
 	trf7970a_shutdown(trf);
diff --git a/net/nfc/digital_core.c b/net/nfc/digital_core.c
index 18236221d898..51d826c7325f 100644
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
+	if (ddev->nfc_dev->shutting_down || !cmd || cmd->pending) {
 		mutex_unlock(&ddev->cmd_lock);
 		return;
 	}
@@ -244,6 +248,11 @@ int digital_send_cmd(struct nfc_digital_dev *ddev, u8 cmd_type,
 	INIT_LIST_HEAD(&cmd->queue);
 
 	mutex_lock(&ddev->cmd_lock);
+	if (ddev->nfc_dev->shutting_down) {
+		mutex_unlock(&ddev->cmd_lock);
+		kfree(cmd);
+		return -ENODEV;
+	}
 	list_add_tail(&cmd->queue, &ddev->cmd_queue);
 	mutex_unlock(&ddev->cmd_lock);
 
@@ -846,6 +855,17 @@ void nfc_digital_unregister_device(struct nfc_digital_dev *ddev)
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
 
-- 
2.56.0

