Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546D6322C67
	for <oe-linux-nfc@lists.linux.dev>; Sat, 25 Jul 2026 11:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784980583; cv=none; b=UIo1n3dceYYuQyKEqVmHjnTZ6x3NKk8EceAy0SY5mCq1mt35Rkr5UuhyMAlZT07BEnFxH7vPF3Sfcjgk30eFtHRNsNQqDpvZjod1VL9S+BJF23VuQ+ZGk1KZXjzvnWa1In5dilIiQA93PtSa4UtpXbBUwRPIWxzC7Ou13yvAvqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784980583; c=relaxed/simple;
	bh=HoumKy1SZGGYhjHhoiDceuBl9nlvS4cV0Z64vMRnez0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IrfVF2MjqfwzqPeHORb5xqFmqxciQLiLkAtvkZ7lNC0YsKtl0umfDTsXU1q1CyW1KY8Wf/U2EHwnLXJ1nQlz4DndWFpvvF3UdCHcBt+4VkHw3pCNmy4LgZq9riDyu1X2wZdWu5uXZIDfr3+yNYQXYzClk4MSLvHfIm704sRl5b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTi95mlF; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTi95mlF"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81f64e8dfbcso10509227b3.2
        for <oe-linux-nfc@lists.linux.dev>; Sat, 25 Jul 2026 04:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784980581; x=1785585381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8pMX2F7Mtpmm/z0irFwhF72qBFAkYFT3rWJazByM9SY=;
        b=pTi95mlFKeW8mZiDh1+XFKp2V/LwZPjekZeVtOQqIIGdJ4IhEe7wBPuNbP42xD+AT+
         3BjWZSqZnTEHqqiU0GDYRC4VNKV1MsMlFBF/e5k6wAz+rehXGNSVq6+GyAxRaGMlGq1m
         BkIhG31cKbAf+3amAjyFUK4meKZmWV+eg3j7jzmhjssic8llhZdrZmGu3c7o7p5FRYX+
         vJWvec8gQf4kpZDHrdLtVdLlC47AafYPJja7GdoyzpeJe81gg3DRxm++zjyd7/O+YkfD
         4HfkIrAH+Znlb57p9cpYmgdtIUQq+ICkq5adLXE8BXwPc+RdJKk0KByp6+35eyzxpnSF
         ueiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784980581; x=1785585381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8pMX2F7Mtpmm/z0irFwhF72qBFAkYFT3rWJazByM9SY=;
        b=AU+8zBeM1mpxBSa0za4P7KV1IbnecjD3N/DuQLK9apoBr9qoJ+E6pRdlvCpGQm+CvQ
         U3b0Qqutffyfo61Bzs/M5N1ayAma7aUn0U7qcE2Y4uYbFWy7bf8W2C9Qer2P0/NyjwnK
         a7y6BeE/U2yCscePJuzy5SYvVVHMzoql1W9rOMxGbA2JprJB1GAWi4o1Qz8k+ioULVi1
         yPGfPQyJ68i0xEBTiu8T3wMmQSMzFqh5qI7Q11F0uQgiUpOSg/GvKOrenNgJZoZDydQl
         RaCnSabeY0pcKYdW8bjKAYL0+G+vfhFKCCLEOQHZmVGwTwBmlnIOH7g7ESASlNMTuL7K
         myoA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2t/HCEyAEhO0H+SHtTUg2NWEbYENO+oPgvsKjoHUWKKXbpgnAvz6cTJqBDfalCxCMPBgzrMZsjWW88p8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTZ+FGm3P8T5Jfo/dhiR3F9lC93hy5Ob9p2r9tMB9k2dlqCYTI
	+tjxS1dC2HG/JUTb454e8f1uw2vh7hqKNhJwbCpqhNr9mmpBA84Y4s1U
X-Gm-Gg: AR+sD13OvfvzCtTM0EsR4RbARC7fXcuRfG35yMw2iC3FfMBxyOhL1eo44T5PzyDCjKT
	aLXlw2gmvax0hmBo7hT46WtaG+M7gxM537VSxgArFSiKnVIPmrOqD/aX1BfPESGQupZc50bGxDe
	lJ3Gni9ASYFn19AVGtaLySAArK7XRHxJVwzD4bv7ADd6Ua9vN4sZOg0UX4qy2DV3usjiG0iqNXS
	i1FHLwGC2earpH2tGFSTaeAstwIS9EXPom90Z1rl9C9aDRBOtFwG7Mst6/awdYXqBT4aumTUcSH
	Lg98ov+Fe+cGhHVvdlakBiZM38YK2J+RDPNONk1G6pjiXO8ROPOkrLuB/4D+Fsq8oFtW0pZ9YIV
	ukID8c0FWdiChKtYVAFdGTYGBblw0xGIU+hCbmLlscpwtnzwstNdjWQEZ1ywYGvOjxYc1XtoR7u
	iAZigUT/s=
X-Received: by 2002:a05:690c:4483:b0:7cf:f14e:bf5a with SMTP id 00721157ae682-81f69d151b2mr6955017b3.20.1784980581193;
        Sat, 25 Jul 2026 04:56:21 -0700 (PDT)
Received: from jdoh-CompSec.. ([141.223.124.60])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f657a14d9sm11259497b3.13.2026.07.25.04.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 04:56:19 -0700 (PDT)
From: Junwoong Doh <jdoh.kernel@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Junwoong Doh <jdoh.kernel@gmail.com>
Subject: [PATCH net] nfc: llcp: fix NULL pointer dereference race in nfc_llcp_send_ui_frame()
Date: Sat, 25 Jul 2026 20:55:56 +0900
Message-Id: <20260725115556.1250160-1-jdoh.kernel@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfc_llcp_send_ui_frame() checks whether sock->local is NULL, but it is
called by llcp_sock_sendmsg() without the socket lock held, which opens
a window for a race condition. Between the sock->local check and the
sock->dev use in nfc_alloc_send_skb(), llcp_sock_bind() can run
concurrently and set both sock->local and sock->dev to NULL, which can
lead to a NULL pointer dereference in nfc_alloc_send_skb().

Take the socket lock in nfc_llcp_send_ui_frame() so that the sock->local
check and the sock->dev use are performed under it. The message is
copied from user space before the lock is taken, to avoid holding the
lock across a user space access that can block for an unbounded amount
of time.

Fixes: dded08927ca3 ("nfc: llcp: fix NULL error pointer dereference on sendmsg() after failed bind()")
Signed-off-by: Junwoong Doh <jdoh.kernel@gmail.com>
Link: https://lore.kernel.org/all/a89d0419-8bcf-40a2-b52d-3e5d911f11da@gmail.com/
---
 net/nfc/llcp_commands.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index 291f26facbf3..cfd5f6aebf8d 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -730,6 +730,7 @@ int nfc_llcp_send_ui_frame(struct nfc_llcp_sock *sock, u8 ssap, u8 dsap,
 			   struct msghdr *msg, size_t len)
 {
 	struct sk_buff *pdu;
+	struct sock *sk = &sock->sk;
 	struct nfc_llcp_local *local;
 	size_t frag_len = 0, remaining_len;
 	u8 *msg_ptr, *msg_data;
@@ -738,10 +739,6 @@ int nfc_llcp_send_ui_frame(struct nfc_llcp_sock *sock, u8 ssap, u8 dsap,
 
 	pr_debug("Send UI frame len %zd\n", len);
 
-	local = sock->local;
-	if (local == NULL)
-		return -ENODEV;
-
 	msg_data = kmalloc(len, GFP_USER | __GFP_NOWARN);
 	if (msg_data == NULL)
 		return -ENOMEM;
@@ -751,6 +748,15 @@ int nfc_llcp_send_ui_frame(struct nfc_llcp_sock *sock, u8 ssap, u8 dsap,
 		return -EFAULT;
 	}
 
+	lock_sock(sk);
+
+	local = sock->local;
+	if (local == NULL) {
+		release_sock(sk);
+		kfree(msg_data);
+		return -ENODEV;
+	}
+
 	remaining_len = len;
 	msg_ptr = msg_data;
 
@@ -763,7 +769,7 @@ int nfc_llcp_send_ui_frame(struct nfc_llcp_sock *sock, u8 ssap, u8 dsap,
 		pr_debug("Fragment %zd bytes remaining %zd",
 			 frag_len, remaining_len);
 
-		pdu = nfc_alloc_send_skb(sock->dev, &sock->sk, 0,
+		pdu = nfc_alloc_send_skb(sock->dev, sk, 0,
 					 frag_len + LLCP_HEADER_SIZE, &err);
 		if (pdu == NULL) {
 			pr_err("Could not allocate PDU (error=%d)\n", err);
@@ -800,6 +806,7 @@ int nfc_llcp_send_ui_frame(struct nfc_llcp_sock *sock, u8 ssap, u8 dsap,
 		msg_ptr += frag_len;
 	} while (remaining_len > 0);
 
+	release_sock(sk);
 	kfree(msg_data);
 
 	return len;
-- 
2.34.1

