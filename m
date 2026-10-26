Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999481;
	b=uG/GxquajQAAQPjQb2HMKUqXtHpzmwhmXOz+2krceB8swmSG9ytd9+zOvGOIs5pX2Xid
	 mZIrnYMEThqYGJkwTpJ4RozVh8prp2rJNGfa/nZ4YwZpUPQbon+ltCKusoN7Ecjwn61+k
	 Gmtl4agLwz26laZ2vMF1X8M+7zuOP7SxlK01+jwACMuXR/w9g7ZM9M6zLP8CeRKibhIdv
	 xNHrOCKX/2Ii4t6u/YYmMRmQVBc66g/xOm31bQy7+NWO0+9Bph1hP9Bdbm/JGa0I1JcLu
	 iPSjm3+3YIZEitw//9nJi7kIuByRHk6WQSQhJ52GFgYL72sxcMCixMZRGb/tS9ZWOxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=UDszjkP3e6J/ldj/IovXua14w3FrBtTVVtfldVBDnUA=;
	b=4z9OgStVK6dFaK1byFPRhtDZZencOdtQaClPnhj95wrzDlNu0aSl12nSdX54JczIJ5cN
	 fbke6EY3gZo43MDG95kwQCxC6Q08n4w32OAVO0xGbKovxXVBbum3uYz84DAkAMIWbeZXz
	 fnV7kaxg6sgjf6hnSCzHjA69veir8L4WDw7Jo3llcgLesEZvezPIvRuj1506c3nDGgvMY
	 VtXMAU5IUL0RGJESPXUSHgp0YTIad87dMMMHyjdDiFncZ5C7FbUlkq2UQw9rzVxv/zJu9
	 AkplpyOE6etfwWwmuUjcWTSVeMXQ6yz/42YThNrI1Li8xNA4cA9+mXi6zMYmcBkuajA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lhZfktFY;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27240606A335
	for <oe-linux-nfc@lists.linux.dev>; Mon, 26 Oct 2026 07:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27240606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lhZfktFY
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e96502e447so23019005ad.1
        for <oe-linux-nfc@lists.linux.dev>; Mon, 26 Oct 2026 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792999479; x=1793604279; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDszjkP3e6J/ldj/IovXua14w3FrBtTVVtfldVBDnUA=;
        b=lhZfktFYBzEp5DDjP7u4QHokNM4t/2z1y6nf8VAO9QXZVD4/RnVFYDikLX/aUeiyHs
         g1tT+tNb+Z8+mdt9p2PQG/wq44Nfh4NtZmxhpa1N+jp1D6xvWJRWR0ZB8hwkHP3gRigH
         KrDIrcOWsabfF2WybhBmWF1MPOFMvWJvnjXu8oGJm7ApPjjwF8KEzWy8ZKhW++DcPEBa
         nKNrXtucRKv0s5p5WBGPaU75N6jBb+0kVaVRz0/lnQgNIW81q8bifA1zyViD+qwnUSzX
         gUq/ijVnKfSYAyhka483vLku7oQpvpeOaBNToaxO3pxJg0b81v96juA5SzqJEmsSe5TE
         mAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792999479; x=1793604279;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDszjkP3e6J/ldj/IovXua14w3FrBtTVVtfldVBDnUA=;
        b=clAtU7XhRIZ8qcNBLrIG3UBTBDtDyC4bVrbIxeYmOkxkworvxX05AtqnUerooRHsSU
         PdzUwdhewQGWuiSaeCjfoPNLcByAG5goZ7Igg4CBl7cTq8w6FLObcHmIbwCzrVWdb6gC
         9O9Fp5pMSk9kX6P/mRszjApB72J/I4OyHhTYaiwx/oPFLRl+aWusGOevr092V5OQuNbS
         Den4LfSOVuQ+yt3+wyp7qYiXu2tBDlps+HI4yR/My5Mc6qguJnG/jO3EPgo16LF2lR7O
         iqSU/VBQl8fLhCXuAJ0g0DrnU0KItG+7ddte/yys61CV6nv9PLl9xrtSdsMoWBatC7Di
         4sWA==
X-Forwarded-Encrypted: i=1; AKwUvBxBsj38BZJR8H64due5h4jb4g30H1lc2iNrE1z20IJmB+AMfPuGstSSXDSBiborKELOKpfpp1m3S71Z0Rg=@lists.linux.dev
X-Gm-Message-State: AFq9FYI9X9KrpMyXTaC8XEl7ycSh8hV4dbOxVkLSauzOTjDIoXnqk53m
	I5VllhcKM3xeRtDhkPl+zqt2osyhLFoXmYqCzLW12hRIdwNGLC+twPh9Px+V0qHGmf0=
X-Gm-Gg: AYBFou1T87b9o6BW7eSEUrSVrjFx7H8TJoUfG8GOVIdIxv3kmZzSzO5cYxRCiwwJZjQ
	m5yjNQ8ueZbTSVoEt5y7AOHkWvnixAWOZnsvBrHewMHDGZz+oKjBYugakMyT7PP/hwR6V6I7awJ
	eosUw4E3s63CJIOhowRZLCWMp38jWohvwmJFqPWvV5vRl2W2uwZylU7HikUrVkFrRnA/4XrSG0m
	lavQlLZhHP17eV0+gR2i/Xkdoahr/zsuBUwA5229b068uxrXF/04Jr8d5wILDn8Zw4/blFM/G5K
	QjcVl3tX/KDXTgrwJrVRtEVhBU6cQKzyCFkC4GmxL1IY8G0v9XVDcYBxPShxAVE9eS5ZEVklndi
	xxBimeKOlJQ6gBb9QyKLMN3fLjxx8mX8BDcTlvwNqCh5ourDgUnXSwwtivOmXd4IgzVJCLjiUtH
	/OnEOgPnMuqaLgE0ofrDm/qK1xHseD8pv54gBR1o/il4groGE0x5BDsG02K3VqIA8LXKUB/ist/
	Gbcq4CODoR9TyveCtys/VBbIXLJQKlkJWd4s9LuJOmHkFaAKz8PnIvX8yL2hk2RwKUSKgIIuqF1
	6KK/b0zA0kLZlOpyxpwnWiR+ylcJt3iCZlktBR3G
X-Received: by 2002:a17:903:144f:b0:2e9:a16b:c251 with SMTP id d9443c01a7336-2ea9c03ed20mr54617845ad.3.1792999478994;
        Mon, 26 Oct 2026 00:24:38 -0700 (PDT)
Received: from 1137-patch.eml (awork078078.netvigator.com. [203.198.250.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1210f0sm12617335ad.25.2026.10.26.00.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:24:38 -0700 (PDT)
From: Yuqi Xu <xuyuqiabc@gmail.com>
To: netdev@vger.kernel.org, oe-linux-nfc@lists.linux.dev
Cc: David Heidelberg <david@ixit.cz>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, stable@vger.kernel.org, Vega <vega@nebusec.ai>, Ren Wei <weir@nebusec.ai>, xuyq21@lenovo.com
Subject: [PATCH net 1/1] nfc: llcp: fix use-after-free when purging local
Date: Mon, 26 Oct 2026 15:24:07 +0800
Message-ID: <1792999447.107874-1-xuyuqiabc@gmail.com>
In-Reply-To: <cover.1791171477.git.xuyuqiabc@gmail.com>
References: <cover.1791171477.git.xuyuqiabc@gmail.com>
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

nfc_llcp_socket_purge() walks local->tx_queue with
skb_queue_walk_safe() and unlinks matching skbs. The walk does not
hold local->tx_queue.lock. tx_work, the LLCP send path, and other
purge or dequeue sites mutate that queue under the lock, so the
walker can follow an skb that another CPU has already freed. That
is a use-after-free and can corrupt the list.

Hold the queue lock across the walk, unlink with __skb_unlink(), and
free the detached skbs only after the lock is dropped.

Fixes: f31652a58bee ("NFC: Purge LLCP socket Tx queues when being disconnected")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Signed-off-by: Yuqi Xu <xuyuqiabc@gmail.com>
Reviewed-by: Ren Wei <weir@nebusec.ai>
---
 net/nfc/llcp_core.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf817007cf..500c65e2a90f 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -47,7 +47,9 @@ void nfc_llcp_socket_remote_param_init(struct nfc_llcp_sock *sock)
 static void nfc_llcp_socket_purge(struct nfc_llcp_sock *sock)
 {
 	struct nfc_llcp_local *local = sock->local;
+	struct sk_buff_head to_free;
 	struct sk_buff *s, *tmp;
+	unsigned long flags;
 
 	skb_queue_purge(&sock->tx_queue);
 	skb_queue_purge(&sock->tx_pending_queue);
@@ -55,14 +57,20 @@ static void nfc_llcp_socket_purge(struct nfc_llcp_sock *sock)
 	if (local == NULL)
 		return;
 
+	__skb_queue_head_init(&to_free);
+
 	/* Search for local pending SKBs that are related to this socket */
+	spin_lock_irqsave(&local->tx_queue.lock, flags);
 	skb_queue_walk_safe(&local->tx_queue, s, tmp) {
 		if (s->sk != &sock->sk)
 			continue;
 
-		skb_unlink(s, &local->tx_queue);
-		kfree_skb(s);
+		__skb_unlink(s, &local->tx_queue);
+		__skb_queue_tail(&to_free, s);
 	}
+	spin_unlock_irqrestore(&local->tx_queue.lock, flags);
+
+	__skb_queue_purge(&to_free);
 }
 
 static struct sock *nfc_llcp_sock_list_pop(struct llcp_sock_list *l)
-- 
2.56.0

