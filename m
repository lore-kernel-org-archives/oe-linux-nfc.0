Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1CB25C818
	for <oe-linux-nfc@lists.linux.dev>; Tue,  6 Oct 2026 11:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287751; cv=none; b=qGhgI4ScSefYMh7OcmIaQdqcXJCvWEfRWK4V9igZsT2LiY2T3Eq+xnMyB7uLTpK7eBhWSkpWQNkNvje6vx+PIfKn+NocjOUvFMvcbYhvzmr7emOwYnbwR6udHYYPzLYQzZVgAj/J2sXrfBMuy5zF3KEEkxaTVoglOsxDOgR4n90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287751; c=relaxed/simple;
	bh=esBU1+hjpFXEROwNxA4JmBuC5GYIDSizXcT6XgYdscY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VeJvUjiSQkV7zHP+O4atj95Ub0VVaXKQ+BpxWlJinWuqHIXIY1pqXUKH/PeCNEJf4WLYi2bFb3i3I1ndH8GVoPUmzPthv20QsllkGTkkLZ+8fQZKEV1CTkiNp30DZvZUAkOKwFzIgK2ZuyzKV7C1JJreJTOcJ6/lyyYrMK7GF7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=NCt/f+ik; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="NCt/f+ik"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-31490970b97so766407eec.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 06 Oct 2026 04:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791287749; x=1791892549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=090CEinLWtA8ss+plFjMgdVk0E87uATP7NkIB4N/6gM=;
        b=NCt/f+ikhP3EK4Hwz3HegbO/bnl7JFdNmsVMbF3HJyvWWu5+8Ye0h23Grr3wpJl3QW
         ooWM/VKAl2eceW3lFq7hIUi4TdowGKUW2ehpYFdXuOdUfNeQsmzrjVGG0ug+QzndeT2J
         nl5b7Uk7DIKYFOU4jCNmPOihV73BXIOepB/zXFdE/8UpwbaHYlguUgju5NyI4h2Clr1d
         B3iKGoyTkHigIy3UJPNCf60IhVj/2hAxux2T/JL/oOTWpsaDovpY8015Kkru0nwOxpoW
         +tNc2BVYGPMH2bJYpIr5scPVOAr0fWQ6DGqW9/4ehWNIl3V8g5i+GIQsVmWcNCnTcnAP
         5bUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791287749; x=1791892549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=090CEinLWtA8ss+plFjMgdVk0E87uATP7NkIB4N/6gM=;
        b=fqM04r48v+mJbUfDjLEK1yz6kwUxBU/C6MqfHTU1nDejr6MvlNXLYLmu4tvfXAY8F3
         TwHtvF20dDY3Nfn7FZJzXf8rnnJ9qLSRYB4S2qnL1G/I23HmQUFcZ/3Tnl0313q2Vb3A
         pctCkb3vagIFdjMfQhJ6qJAdPItOD+jCxj0Wj+ycYQoYegDGN0YPWL4Bevu6MHG3LTMw
         jHtzS75DPWUuSaZ+mKY5bU1dUt0+yxvsBgKtuvNFY4Qbx4QeZAaAIQsEoSobVcu7of8i
         5HEJS98C3R+msZGlJOqVVFZrvoAtusVVgPm1+TKNrZrXgBDnx17AaLRPXheCi3494vlR
         lPeA==
X-Gm-Message-State: AFuF++nRLqemWVZVgcYJa20REuHZ75pTYAlqAHZUKsKzfyyJb5joHNGM
	rKk/2jZfuDGU5lUY/54CCt0Ac3xZvSRxdQr4eTfJmCuOQ/W0S0if8JuRvOpsuiK7364=
X-Gm-Gg: AYBFou3gapAaH/BxOSrhxW/C3QbTyMrONAYM/LL5YiLxNXyAnG7JJf+xM0sjWiqGCOD
	tesOQTG9nJNaQLDRHNcvO/iVBFmC1oANkmMqjfCfWVUJhMs+3Zlp9J2y9A35/V8CVlVtGZB8Xap
	3L0LDmXA0seWbHlyM2hX4ST607cBJTjr8eXE5fRiFbuqBpZnhXxeaxtaRsHO/27h+nwN83+yqmZ
	gcln37a+kwcU3JOu7LSXtzLXqjD3yDe9rA/uAbe/PcQYaaOUnbw3ceq23yb6KY/ygyNr8UYw74K
	0st+zNADshgU370PT149skEpnKeyafePSgIJfLnvmUuemQC1qIER6PwIuPXyVLo1f1nZ0njbvvT
	nfIqNWkDJqui7cfHUrrcZ+VG5cPycW1RHdqZz/93ISC70Sb/l4RavP1wGaeyISbAmes3KxOeU8t
	VgRv7y4PSfAI06kJ4sY+rYz1wPGJXdq5zRXtbSA2nlKEKMddtcWfd5/dI1KhKZsJw1uFZFqiGOj
	VI+jpU/x+T+7BvtIz1W0ppeW0rFP0JTOPzPnO4mxV8XzEvyVwFR3I1oGpi8uK/dUhqTb2aZ84f6
	bKAO6zh9ffIA2od9fNI=
X-Received: by 2002:a05:693c:2410:b0:33b:fc17:e786 with SMTP id 5a478bee46e88-3514e2e62a0mr1112407eec.16.1791287748244;
        Tue, 06 Oct 2026 04:55:48 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469f75fesm8638511eec.5.2026.10.06.04.55.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 04:55:47 -0700 (PDT)
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
Subject: [PATCH v4 2/2] nfc: nci: uart: fix use-after-free of write_work on ldisc teardown
Date: Tue,  6 Oct 2026 17:25:31 +0530
Message-ID: <20261006115532.72100-3-shubham@octane.security>
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

nci_uart_tty_close() frees nu->tx_skb and purges nu->tx_q before it
cancels nu->write_work, and the NCI device is still registered at that
point.  Two paths can therefore (re)queue the write worker after the
skbs are freed and run it against freed memory:

 - a tty hangup invokes the ldisc ->write_wakeup() (nci_uart_tty_wakeup
   -> nci_uart_tx_wakeup -> schedule_work), and
 - the NCI core keeps sending via the driver (nci_uart_send() ->
   nci_uart_tx_wakeup -> schedule_work) until the device is unregistered
   by nu->ops.close().

nci_uart_write_work() then dereferences the freed nu->tx_skb -- a
use-after-free.  nu->ops.close() also frees driver state that the worker
dereferences via nu->ops.tx_start()/tx_done(), so the worker has to be
stopped before ops.close() runs.

Fix this the way the Bluetooth hci_uart ldisc does: gate
nci_uart_tx_wakeup() on a new NCI_UART_READY bit taken under a
per-connection rwsem.  nci_uart_tty_close() clears NCI_UART_READY under
the write lock -- draining any in-flight nci_uart_tx_wakeup() -- so that
neither the tty nor the internal send path can requeue write_work once it
is cancelled; only then is the device closed and the skbs freed.

NCI_UART_READY is set, and the module reference taken, before
nu->ops.open() registers the device: the driver may transmit (e.g.
download firmware) from within registration and user space can use the
interface as soon as it is registered, so gating those transmits off
would drop or leak them.  The open path uses shared error labels and, on
a failed open, drains the worker the same way the close path does.

Runtime-tested under KASAN with a line-discipline hangup reproducer: the
unfixed ldisc reports

  BUG: KASAN: slab-use-after-free in nci_uart_write_work

within the first iterations, while the fixed ldisc runs the same race for
56000+ register/hangup cycles without any KASAN report.

Fixes: 9961127d4bce ("NFC: nci: add generic uart support")
Assisted-by: LLM Claude
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 include/net/nfc/nci_core.h |  2 +
 net/nfc/nci/uart.c         | 80 +++++++++++++++++++++++++++++++-------
 2 files changed, 68 insertions(+), 14 deletions(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 664d5058e..c71648ab5 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -18,6 +18,7 @@
 #define __NCI_CORE_H
 
 #include <linux/interrupt.h>
+#include <linux/percpu-rwsem.h>
 #include <linux/skbuff.h>
 #include <linux/tty.h>
 
@@ -455,6 +456,7 @@ struct nci_uart {
 	struct work_struct	write_work;
 	struct tty_struct	*tty;
 	unsigned long		tx_state;
+	struct percpu_rw_semaphore tx_lock;
 	struct sk_buff_head	tx_q;
 	struct sk_buff		*tx_skb;
 	struct sk_buff		*rx_skb;
diff --git a/net/nfc/nci/uart.c b/net/nfc/nci/uart.c
index aa20e8603..a971fb3b1 100644
--- a/net/nfc/nci/uart.c
+++ b/net/nfc/nci/uart.c
@@ -33,6 +33,7 @@
 /* TX states  */
 #define NCI_UART_SENDING	1
 #define NCI_UART_TX_WAKEUP	2
+#define NCI_UART_READY		3
 
 static struct nci_uart *nci_uart_drivers[NCI_UART_DRIVER_MAX];
 
@@ -58,13 +59,28 @@ static inline int nci_uart_queue_empty(struct nci_uart *nu)
 
 static int nci_uart_tx_wakeup(struct nci_uart *nu)
 {
+	/* This may be called in an IRQ context, so we can't sleep.  Therefore
+	 * we try to acquire the read lock only, and if that fails we assume
+	 * the tty is being closed, because that is the only time the write
+	 * lock is taken (nci_uart_tty_close()).  If the write lock is ever
+	 * taken elsewhere, this must be revisited.
+	 */
+	if (!percpu_down_read_trylock(&nu->tx_lock))
+		return 0;
+
+	if (!test_bit(NCI_UART_READY, &nu->tx_state))
+		goto out;
+
 	if (test_and_set_bit(NCI_UART_SENDING, &nu->tx_state)) {
 		set_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
-		return 0;
+		goto out;
 	}
 
 	schedule_work(&nu->write_work);
 
+out:
+	percpu_up_read(&nu->tx_lock);
+
 	return 0;
 }
 
@@ -123,18 +139,46 @@ static int nci_uart_set_driver(struct tty_struct *tty, unsigned int driver)
 	INIT_WORK(&nu->write_work, nci_uart_write_work);
 	spin_lock_init(&nu->rx_lock);
 
-	ret = nu->ops.open(nu);
-	if (ret) {
-		kfree(nu);
-		return ret;
-	} else if (!try_module_get(nu->owner)) {
-		nu->ops.close(nu);
-		kfree(nu);
-		return -ENOENT;
+	ret = percpu_init_rwsem(&nu->tx_lock);
+	if (ret)
+		goto err_free;
+
+	/* Take the module reference and enable the write worker before the
+	 * device is registered: ops.open() may already transmit (e.g. download
+	 * firmware), and user space can use the interface as soon as it is
+	 * registered.
+	 */
+	if (!try_module_get(nu->owner)) {
+		ret = -ENOENT;
+		goto err_rwsem;
 	}
+
+	set_bit(NCI_UART_READY, &nu->tx_state);
+
+	ret = nu->ops.open(nu);
+	if (ret)
+		goto err_ready;
+
 	tty->disc_data = nu;
 
 	return 0;
+
+err_ready:
+	/* ops.open() may already have scheduled write_work; stop it before
+	 * freeing, the same way nci_uart_tty_close() does.
+	 */
+	percpu_down_write(&nu->tx_lock);
+	clear_bit(NCI_UART_READY, &nu->tx_state);
+	percpu_up_write(&nu->tx_lock);
+	cancel_work_sync(&nu->write_work);
+	kfree_skb(nu->tx_skb);
+	skb_queue_purge(&nu->tx_q);
+	module_put(nu->owner);
+err_rwsem:
+	percpu_free_rwsem(&nu->tx_lock);
+err_free:
+	kfree(nu);
+	return ret;
 }
 
 /* ------ LDISC part ------ */
@@ -180,16 +224,24 @@ static void nci_uart_tty_close(struct tty_struct *tty)
 	if (!nu)
 		return;
 
-	kfree_skb(nu->tx_skb);
-	kfree_skb(nu->rx_skb);
+	/* Drain in-flight tx_wakeups and block new ones, so write_work cannot
+	 * be requeued once it is cancelled below.
+	 */
+	percpu_down_write(&nu->tx_lock);
+	clear_bit(NCI_UART_READY, &nu->tx_state);
+	percpu_up_write(&nu->tx_lock);
 
-	skb_queue_purge(&nu->tx_q);
+	cancel_work_sync(&nu->write_work);
 
 	nu->ops.close(nu);
 	nu->tty = NULL;
-	module_put(nu->owner);
 
-	cancel_work_sync(&nu->write_work);
+	kfree_skb(nu->tx_skb);
+	kfree_skb(nu->rx_skb);
+	skb_queue_purge(&nu->tx_q);
+
+	module_put(nu->owner);
+	percpu_free_rwsem(&nu->tx_lock);
 
 	kfree(nu);
 }
-- 
2.43.0

