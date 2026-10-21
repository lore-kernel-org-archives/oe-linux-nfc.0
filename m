Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553096;
	b=qChpUJnBsvBSI9BNSw0weBlXBbOHW9RQspYw+blbEcfcrrS1IOI3iGsGRppkiPegREUG
	 VTPtmi/K6f+aP0pekEsAagKWUtGpd8FudHzWP72TjjYVVbcx3LAYlG7K1SiyGHkAQx6Ar
	 aJNKggFtNUXSFxIvKXyzTmeWsKhEyE64SQV6AqkKv+L4qO+bgho9bN2/UsNdOCb20CPtS
	 vzAiYjpaNl1+Eh4pRsCE3LXYPn+U4jciJrsSr6+DK/nx0s9R3S+2CGJJvyaZgCkA/afbq
	 OBXhy1y3q2Zffq/Vg/s0F6c+IBv7y32B1SbIaM5t3v+tXvKgWgFosoC1FbDEQLFT9Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A5FwLktz5PtvprNXjwoy8hFZGED8+fDvEmX7G7td2Lc=;
	b=D6CkCk7Fkl2U0rBpg828buechOQGM0TSb+SQC9K43FAlVuJE841jUCqMD/FVIzlStRxa
	 MCgsPm8+Bt94jrSXDRVTMCD5c2GqWj11cnawvmInkzZk1x7riTGNrpxzn+6rpXDRfdZGJ
	 Oxo56Ufh9sUI8Uc5WNYKmHhuTmgytksmTS399OGZRkXIEHl+04JDU8eT3NVH3qBgcTjkd
	 2H4i/ZJpDGolKi1c+h9VaQo5N5qDRA48SPhZ4hA+92SyQ5XBvetxIBoYVC1Jya7THNkpV
	 2yvhmFqVE1rf8OlXvmOZuMl2pldq5h5VlSGB0DpJuoSI9rK2gIrmTZ8+AK0BplLhROA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=octane.security;
	spf=pass smtp.mailfrom=octane.security;
	dkim=pass header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b="BB4R6h/D";
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68977606E844
	for <oe-linux-nfc@lists.linux.dev>; Wed, 21 Oct 2026 03:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68977606E844
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=BB4R6h/D
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e985106c0cso2078145ad.2
        for <oe-linux-nfc@lists.linux.dev>; Tue, 20 Oct 2026 20:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1792553095; x=1793157895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5FwLktz5PtvprNXjwoy8hFZGED8+fDvEmX7G7td2Lc=;
        b=BB4R6h/DIkp7VvG3DaatUIPihGcX8ab2L3I3fH+bVIpEl/hVvt/KXDpnTda5r+fBY3
         4vnbvK/p5KakHwq1lQC1KyRG9EvoBs053zn0bH+UeJGHsyrFJwr30uYVL8xV4MsuhzK8
         WjSB1vk09Z1/x4nHaa+8zbvc9K6d4GS5ZOZZqUS2Wwp6sPcixR+AiZE9wQwF5iijFPxY
         vBks9o4eekjdZ7HfrnUXH0R5bhXbxJQXsFXgpZN1flPJI+F64aZJm7EuDU3oaI6xtCnX
         mJouii7NBda00JLQ6TK0vp1J6+SMj4/WT/5v5BQVn2tgfEcgv+ehWTN0TZ7qJwlPK+hN
         zemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792553095; x=1793157895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5FwLktz5PtvprNXjwoy8hFZGED8+fDvEmX7G7td2Lc=;
        b=B8n0ai8epK4ysuVVRLmmDIAcNb7qYDjfffJIoEh0SnlY04K6FgCoy9q7bqD8rNL1no
         5VISYbqAMmVhH8P2pn8Uh6+Mi5iXT2XUc3NPvVH5fHTXDIyd8P0MPRK1NO8x4963wUvY
         qdEsf4sLRO/jKfxH8GSNP2JYmWd0w1MIsaJahxJMeF0apWzE8IgqGheNdM2goAisgwms
         AwqcDGfI76WTOXckf/A5cDy2JwUbhMwh8uwW7YGaHsFyFjG/ed/Bm0mcmutonJxobh9N
         KWwqvxJn+Ki6NdsImjgoTplSNuwp5AgoYuyM3O8kE+Dcj4zX/6W8LBK+eYr7YVA4/Wqo
         BuVA==
X-Forwarded-Encrypted: i=1; AKwUvByxzEYejMFzvU+oQVqLArkDxrOwTSWny39+Ewha2fsczvobZa1GmZhVR54Q3ezX/7KfC2cPtxg01nkCZyE=@lists.linux.dev
X-Gm-Message-State: AFq9FYLIZbX58Mo4/Yf0zzVso44cYuwLtoFW8JjBKzbtds3I4xbqeCSV
	mEnXOa/xJeGzvtqBq9+DXzfxLdwr9vxY/SGsoAlAe/vqbzqt0R8rGPju/VwFSpfLSAk=
X-Gm-Gg: AYBFou2uVNVMZtC1KvmJu5roZkpdFPcIrMRoWVxq+gIzYl/tA8+QDygB8NVBOC+rh5z
	h4Hv18VFcPBPuCevhwwSYyooaZwMxx2HjGhRXeX3y5ujadz4cmsV/tHBkpMxQtK4E1r7JyQziaC
	O5PTimWCVTL0XADQNsEZ8t+xv/pePyAritrTsaptBT8Bpe6gyHua5IZn8N2kaAPPdLrW6wsIOUm
	XL/ZlKkZM/OxY45GBwPo3CYLheVgxPUq+TzIkiMAsEmPLzyoAmRl3OFpg03R4qZHEprUmqEZ3Ao
	eqVWjuQZXekgIy8sCRN+Ri/BwLEfT0Wl4BAekQpmtgdfhEzm2gR9zVegFZTPoU4oOkCSF2JBny6
	3VXCe1ho0tYiVy4JThh9nhxRawbhQ09eQuSLEBgGMmkJ10hS3kHZYaPvL7y6NTRzGqnrpJq4JlM
	/LgwNOCWS4ef3cyCB7rnpht1Hi+T5Sqk3KKO2qPEdspjl6AF+4Icdq9zoHPWOWFkR8f5lqkcIdb
	2RVqI1W0CfQqHIGhG45QPFsFe4/cYeJKVt9ep44a2oHeUYi8XnH+MpQLm77wDtZBD+DJYSHLJMJ
	Nwu+nHujlTGca0ui7ZzjeG0AB0Ye1UmLyZMEn3+7pM5UApbtuTpGTEfEIpWFfjH5YpAJWnSFD9F
	w
X-Received: by 2002:a17:90b:5645:b0:3ac:b7b9:6471 with SMTP id 98e67ed59e1d1-3ad8707b58bmr634341a91.65.1792553094582;
        Tue, 20 Oct 2026 20:24:54 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8030226csm2155285a91.12.2026.10.20.20.24.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 20:24:54 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>,
	oe-linux-nfc@lists.linux.dev,
	gio@octane.security,
	stable@vger.kernel.org
Subject: [PATCH net v6 2/6] nfc: nci: uart: serialize driver selection
Date: Wed, 21 Oct 2026 08:54:39 +0530
Message-ID: <20261021032443.44412-3-shubham@octane.security>
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

NCIUARTSETDRIVER assumes that tty->disc_data remains NULL until a
transport has been selected.  Two concurrent callers can therefore both
allocate and register an NCI device for the same line discipline.

The transport registry can also be changed while a caller is copying a
template from it, before the transport module has been pinned.

Allocate one UART context when the line discipline is opened and claim it
atomically during driver selection.  Protect the transport registry with a
mutex, take the module reference while holding that mutex, and copy only
the immutable template fields.  Keep TTY callbacks disabled until the
transport has finished opening, and unwind the context so a failed
selection can be retried.  Use acquire/release bit operations for the
selection claim so a retry observes the completed unwind.  Treat the driver
number as unsigned before using it to index the registry.

Found during a source audit assisted by OpenAI Codex, gpt-5.6-sol, and
reproduced with two concurrent NCIUARTSETDRIVER ioctls on a pty-backed NCI
UART.

Fixes: 9961127d4bce ("NFC: nci: add generic uart support")
Cc: stable@vger.kernel.org
Assisted-by: LLM KASAN
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 include/net/nfc/nci_core.h |   1 +
 net/nfc/nci/uart.c         | 133 +++++++++++++++++++++++++------------
 2 files changed, 93 insertions(+), 41 deletions(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 664d5058e66e..2f542f5c9496 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -454,6 +454,7 @@ struct nci_uart {
 	spinlock_t		rx_lock;
 	struct work_struct	write_work;
 	struct tty_struct	*tty;
+	unsigned long		flags;
 	unsigned long		tx_state;
 	struct sk_buff_head	tx_q;
 	struct sk_buff		*tx_skb;
diff --git a/net/nfc/nci/uart.c b/net/nfc/nci/uart.c
index aa20e8603f32..fb9ed281f62c 100644
--- a/net/nfc/nci/uart.c
+++ b/net/nfc/nci/uart.c
@@ -13,6 +13,7 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/fcntl.h>
 #include <linux/interrupt.h>
@@ -34,7 +35,12 @@
 #define NCI_UART_SENDING	1
 #define NCI_UART_TX_WAKEUP	2
 
+/* UART flags */
+#define NCI_UART_DRIVER_SET	0
+#define NCI_UART_READY		1
+
 static struct nci_uart *nci_uart_drivers[NCI_UART_DRIVER_MAX];
+static DEFINE_MUTEX(nci_uart_drivers_lock);
 
 static inline struct sk_buff *nci_uart_dequeue(struct nci_uart *nu)
 {
@@ -102,39 +108,57 @@ restart:
 	clear_bit(NCI_UART_SENDING, &nu->tx_state);
 }
 
-static int nci_uart_set_driver(struct tty_struct *tty, unsigned int driver)
+static int nci_uart_set_driver(struct nci_uart *nu, unsigned int driver)
 {
-	struct nci_uart *nu = NULL;
+	struct nci_uart *template;
 	int ret;
 
 	if (driver >= NCI_UART_DRIVER_MAX)
 		return -EINVAL;
 
-	if (!nci_uart_drivers[driver])
-		return -ENOENT;
+	if (test_and_set_bit_lock(NCI_UART_DRIVER_SET, &nu->flags))
+		return -EBUSY;
 
-	nu = kzalloc_obj(*nu);
-	if (!nu)
-		return -ENOMEM;
+	mutex_lock(&nci_uart_drivers_lock);
+	template = nci_uart_drivers[driver];
+	if (!template || !try_module_get(template->owner)) {
+		ret = -ENOENT;
+		goto err_unlock;
+	}
 
-	memcpy(nu, nci_uart_drivers[driver], sizeof(struct nci_uart));
-	nu->tty = tty;
-	skb_queue_head_init(&nu->tx_q);
-	INIT_WORK(&nu->write_work, nci_uart_write_work);
-	spin_lock_init(&nu->rx_lock);
+	nu->owner = template->owner;
+	nu->ops = template->ops;
+	nu->name = template->name;
+	nu->driver = template->driver;
+	mutex_unlock(&nci_uart_drivers_lock);
 
 	ret = nu->ops.open(nu);
-	if (ret) {
-		kfree(nu);
-		return ret;
-	} else if (!try_module_get(nu->owner)) {
-		nu->ops.close(nu);
-		kfree(nu);
-		return -ENOENT;
-	}
-	tty->disc_data = nu;
+	if (ret)
+		goto err_module;
+
+	/* Publish transport fields before callbacks observe READY. */
+	smp_mb__before_atomic();
+	set_bit(NCI_UART_READY, &nu->flags);
 
 	return 0;
+
+err_module:
+	cancel_work_sync(&nu->write_work);
+	kfree_skb(nu->tx_skb);
+	nu->tx_skb = NULL;
+	kfree_skb(nu->rx_skb);
+	nu->rx_skb = NULL;
+	skb_queue_purge(&nu->tx_q);
+	clear_bit(NCI_UART_SENDING, &nu->tx_state);
+	clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
+	module_put(nu->owner);
+	nu->owner = NULL;
+	goto err_clear;
+err_unlock:
+	mutex_unlock(&nci_uart_drivers_lock);
+err_clear:
+	clear_bit_unlock(NCI_UART_DRIVER_SET, &nu->flags);
+	return ret;
 }
 
 /* ------ LDISC part ------ */
@@ -156,7 +180,17 @@ static int nci_uart_tty_open(struct tty_struct *tty)
 	if (!tty->ops->write)
 		return -EOPNOTSUPP;
 
-	tty->disc_data = NULL;
+	struct nci_uart *nu = kzalloc_obj(*nu);
+
+	if (!nu)
+		return -ENOMEM;
+
+	nu->tty = tty;
+	skb_queue_head_init(&nu->tx_q);
+	INIT_WORK(&nu->write_work, nci_uart_write_work);
+	spin_lock_init(&nu->rx_lock);
+
+	tty->disc_data = nu;
 	tty->receive_room = 65536;
 
 	/* Flush any pending characters in the driver */
@@ -180,14 +214,17 @@ static void nci_uart_tty_close(struct tty_struct *tty)
 	if (!nu)
 		return;
 
-	kfree_skb(nu->tx_skb);
-	kfree_skb(nu->rx_skb);
+	if (test_bit(NCI_UART_DRIVER_SET, &nu->flags)) {
+		kfree_skb(nu->tx_skb);
+		kfree_skb(nu->rx_skb);
 
-	skb_queue_purge(&nu->tx_q);
+		skb_queue_purge(&nu->tx_q);
+
+		nu->ops.close(nu);
+		module_put(nu->owner);
+	}
 
-	nu->ops.close(nu);
 	nu->tty = NULL;
-	module_put(nu->owner);
 
 	cancel_work_sync(&nu->write_work);
 
@@ -211,7 +248,8 @@ static void nci_uart_tty_wakeup(struct tty_struct *tty)
 
 	clear_bit(TTY_DO_WRITE_WAKEUP, &tty->flags);
 
-	if (tty != nu->tty)
+	if (tty != nu->tty ||
+	    !test_bit_acquire(NCI_UART_READY, &nu->flags))
 		return;
 
 	nci_uart_tx_wakeup(nu);
@@ -300,7 +338,8 @@ static void nci_uart_tty_receive(struct tty_struct *tty, const u8 *data,
 {
 	struct nci_uart *nu = tty->disc_data;
 
-	if (!nu || tty != nu->tty)
+	if (!nu || tty != nu->tty ||
+	    !test_bit_acquire(NCI_UART_READY, &nu->flags))
 		return;
 
 	spin_lock(&nu->rx_lock);
@@ -328,13 +367,12 @@ static int nci_uart_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 	struct nci_uart *nu = tty->disc_data;
 	int err = 0;
 
+	if (!nu)
+		return -EBADF;
+
 	switch (cmd) {
 	case NCIUARTSETDRIVER:
-		if (!nu)
-			return nci_uart_set_driver(tty, (unsigned int)arg);
-		else
-			return -EBUSY;
-		break;
+		return nci_uart_set_driver(nu, (unsigned int)arg);
 	default:
 		err = n_tty_ioctl_helper(tty, cmd, arg);
 		break;
@@ -370,33 +408,46 @@ static int nci_uart_send(struct nci_uart *nu, struct sk_buff *skb)
 
 int nci_uart_register(struct nci_uart *nu)
 {
+	int ret = 0;
+
 	if (!nu || !nu->ops.open ||
-	    !nu->ops.recv || !nu->ops.close)
+	    !nu->ops.recv || !nu->ops.close ||
+	    (unsigned int)nu->driver >= NCI_UART_DRIVER_MAX)
 		return -EINVAL;
 
-	/* Set the send callback */
-	nu->ops.send = nci_uart_send;
-
 	/* Add this driver in the driver list */
+	mutex_lock(&nci_uart_drivers_lock);
 	if (nci_uart_drivers[nu->driver]) {
 		pr_err("driver %d is already registered\n", nu->driver);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto unlock;
 	}
+
+	/* Set the send callback */
+	nu->ops.send = nci_uart_send;
 	nci_uart_drivers[nu->driver] = nu;
 
 	pr_info("NCI uart driver '%s [%d]' registered\n", nu->name, nu->driver);
 
-	return 0;
+unlock:
+	mutex_unlock(&nci_uart_drivers_lock);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(nci_uart_register);
 
 void nci_uart_unregister(struct nci_uart *nu)
 {
+	mutex_lock(&nci_uart_drivers_lock);
+
 	pr_info("NCI uart driver '%s [%d]' unregistered\n", nu->name,
 		nu->driver);
 
 	/* Remove this driver from the driver list */
-	nci_uart_drivers[nu->driver] = NULL;
+	if ((unsigned int)nu->driver < NCI_UART_DRIVER_MAX &&
+	    nci_uart_drivers[nu->driver] == nu)
+		nci_uart_drivers[nu->driver] = NULL;
+
+	mutex_unlock(&nci_uart_drivers_lock);
 }
 EXPORT_SYMBOL_GPL(nci_uart_unregister);
 
-- 
2.43.0

