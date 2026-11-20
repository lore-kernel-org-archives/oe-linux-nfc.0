Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795161562;
	b=x4JvQsi+jxA6rZBc+VR1RYqDuRiqNRPB5CgYhI3s4aTy5YsCOZDKKtPOJKnZHzXOE5+P
	 w0JJk4uXXvTxNg7VWfjxVBJd0MQ+LbrnQiPcattsC0o/tqs/Xn9xZ2oGMjr1HCKCJYOb9
	 xjBPmmo4xXA2Y5Sb/k54jkoc88Xx7tsasYWPgL50AXf5pTA3TxpiY/kDe+xelg41q7U7q
	 lsV46/yeP6jSZhCYREqU52UDA2WfbsT54BevQ1Tv3UCiZAaMr4cdumRGUQrdEHj882jDY
	 zwTXV8qkShsMz5Ov1aeAFy0cZ+unziQboqDtqx6HYxWZXCyCIdj54HMg+F/o1usrCcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=g+lR9KHvf51yvBoxd1/pkP2EXf3oWyK5p2AAAkTsaaU=;
	b=cgk7YDzEnr784oRCovqRYR9bcP7HPHlVV0w0I5s52A66YMTfyTYl+RPshHHAkwXb9Znz
	 eXlcN65Two7k4Z+DAVwbVZiz/W5Fvmran2xNGOoYDc68dWENiiVfcRl99U+CyBkRNe5Ib
	 FVItN4Z4OXFRSeS7S4NztBbT+aSyKG9pycPx9FZRpT2iG5Jz6YlRHPGdvlTTwVs/4yS/e
	 PtmzeoV4/q8209kQvC81BTs9jui87LgI8u1/yJiy486+pg2dBykoaZKJbdCj7gBU2pHrK
	 U7FhEk0cXnX6mgiYNERkNkuDbbIp2F67kPizibCJLCe+KiLDYGHvWlSG+ZyHcTLUJHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uDiPWeQT;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7406C606A325
	for <oe-linux-nfc@lists.linux.dev>; Fri, 20 Nov 2026 07:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7406C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uDiPWeQT
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-849c2965b9eso153212a34.1
        for <oe-linux-nfc@lists.linux.dev>; Thu, 19 Nov 2026 23:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795161561; x=1795766361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+lR9KHvf51yvBoxd1/pkP2EXf3oWyK5p2AAAkTsaaU=;
        b=uDiPWeQTUiSG8L9fbI0Xgx5xg1KsWhgPvXG0R7SFqHhXBk5aY7Q0oF5YW0m+DQPp5O
         BydgEzm+nVB0LpuIKlvZNhznihsQZzuS8aVaKeVJ3K+G8ycOj+K93Af60KaKqVYSv8jB
         bI8xKRq5tsoTH/HQKxOnOQa4ARPgBpQVI7p0HxcvbUroGeVqMHMWW83E5wN2oa1fLXtn
         qSc9QnqY/t3rBSTdKvi5OhSJSpv1E7s57i/8EWkxTZiPP6JJA/i03Kfi4Cx7sghJbmcz
         DlrURcnG6E8BusY0MNZ3+5bbk5UBVOEyH+2OVueJSojgA82VRYrkzlNGjTKAT4IlVO6w
         IiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161561; x=1795766361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+lR9KHvf51yvBoxd1/pkP2EXf3oWyK5p2AAAkTsaaU=;
        b=PtCzc/95cvNUQmMwpCiHVwOQ1/rkn8Ao5Xq9FKqEt8RH+rLAKd0fIrQRaNYfCQ2OX4
         GAQ8KJUq+nWR11uhKwtt8DQrvGUiilQtqESiQq7FUxDQT9sFCa78cow1PMi0Z8dlF06T
         UHWlxheCwCVWHirIJ8+6ajccNr423LJd0AQJLf7rxxEIH9GURA13gX+bWTyORuyaf0Rq
         0zttAVCfT4AMo7lxGDaJSHz2Ekv9/1apEbZfguGjTrB/j6I9mkEI2p3ar+R9MNPKDQvu
         WTw2d/HzGnFIXfJBKKV/LyGDHd1aHmrZgyl6vA9yjqdk4uKv/0zt/uaGtGcY5tzyAl3K
         YEfg==
X-Gm-Message-State: APuU4Z/jAi9n3rybon+fE2Y1fvUl+tHzl4Ops5cCbpd24bzVt53lIQi7
	mlefg52dOLTB5U9ngT94eYxaf0fx0V9mD5Hy/LzvQ1J8sh4YRuPr7Ios
X-Gm-Gg: AYBFou37qesmXJ4Mfl64qGDmyzWlAjPBP/JSYV4dV4FleN4+AcoqEoy5DDGSFz8i9LR
	sOpiVeJzqyHGpnVa9T4GIkFwnG/qZBEcpQjgMT9T1I02KFVUeWwIMeoUmK6NmZY67m5QLrqjly8
	ZVaZXo45/5suYXW/XKi//E77YFbjwc1E4xli1VA/BqaIfi5wEhOCWahXejzthXx+yR8b+WtF20B
	KgU0XSB4azeCG6jQroPMHJPZy2eydm5BVf+JhlySYsZlSIiE1EEdnm8pML7utcvj7XYjanMYhe5
	GI0hi28Cxd1KIKybpTaifhDcEwJP9vTWFbe/oiG4UE4Pydnhy1tMuauTzPC+fy1vXb5lo5I3H3e
	9IDbEcY4i3FGs+DEX2SbJ2OixJeuxj56lPXwfeap5CmPoGEtvUdl6Vht0Yjfhqi4PsjWxoAAJwp
	/I93i9Lh8FJZHG/5kMFnrxXFDOB0HiGRkdtqF3bPAN8EL4Nsv1L4Hb71fnHAzsuhSN7uF3DjTKW
	iuoRujx51dOU+oYCOXi7kRuMul+aLq+L4jza4tMeznDaamVi3eSVJeyssA8kmLB8Ir17Y1fOURG
	f8X1BJ+TM8WaehrkKV1xB5ZeL50kiyl5OLBddVv/9HTNx13NNgHvSdY0m/UBKQAY6Wdt
X-Received: by 2002:a05:6830:2692:b0:862:c6cb:2e25 with SMTP id 46e09a7af769-863152f8ef7mr2846379a34.2.1795161561258;
        Thu, 19 Nov 2026 23:59:21 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6d8sm1550823a34.10.2026.11.19.23.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:59:18 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: david@ixit.cz,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2] nfc: llcp: fix socket list self-loop on connect of a linked socket
Date: Fri, 20 Nov 2026 15:59:08 +0800
Message-ID: <20261120075908.4064155-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

llcp_sock_connect() only rejects LLCP_CONNECTED and LLCP_CONNECTING, so a
socket that is still linked in local->sockets can be linked a second time
into local->connecting_sockets.  That covers bound and listening sockets,
and sockets that a peer moved to LLCP_CLOSED with DISC or DM.

Both lists use sk->sk_node.  When the peer answers with CC,
nfc_llcp_recv_cc() removes the node from the connecting list and links it
back into local->sockets, where the stale bind-time entry makes the node
point to itself.  Every later sk_for_each() over local->sockets then spins
forever with the read lock held, which pins the CPU and stalls RCU, and
the socket is never freed.

Reject the connection while sk_node is still linked.  A socket has to be
closed before it can be connected.

Reproduced on v7.4-rc3 as uid 1000: a soft lockup / RCU stall in
nfc_llcp_sock_from_sn() while walking local->sockets.

This issue was discovered by Tencent CodeBuddy Security.

Link: https://lore.kernel.org/all/20261009092338.3146149-1-bsdhenrymartin@gmail.com/
Fixes: a69f32af86e3 ("NFC: Socket linked list")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
v1 -> v2: reject any socket that is still hashed (sk_hashed) instead of only
          LLCP_BOUND, covering bind()+listen()+connect() and sockets left
          linked after DISC/DM.
 net/nfc/llcp_sock.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 1e5ee4bcde68..01b311d5adda 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -714,6 +714,15 @@ static int llcp_sock_connect(struct socket *sock, struct sockaddr_unsized *_addr
 		ret = -EINPROGRESS;
 		goto error;
 	}
+	/* A socket that is still linked in local->sockets must not be linked
+	 * into local->connecting_sockets as well: both lists use sk_node, and
+	 * the CC handler links the node back into local->sockets, which turns
+	 * the stale entry into a self-loop.
+	 */
+	if (sk_hashed(sk)) {
+		ret = -EISCONN;
+		goto error;
+	}
 
 	dev = nfc_get_device(addr->dev_idx);
 	if (dev == NULL) {
-- 
2.43.7

