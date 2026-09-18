Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B16A3E44ED
	for <oe-linux-nfc@lists.linux.dev>; Fri, 18 Sep 2026 03:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702776; cv=none; b=PXDo+VlXeOfNRmuulKKgiojIja2f1ev5qXAjhLEiDIcKUGa0AZsp/7Saj6Fvnl6mGqgvCbE06Y1sqRg2NuNFJj4JBnTEm3QBL0SzE0rMASUhDzEj+dRGEeRyvUh3qSQPH2NpJltZ9OS7XePK7xCug8/lts1DbRagU1lXGjcEWVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702776; c=relaxed/simple;
	bh=5DGBMHNqKO8hBWMRpZeiWO/8gLuazINjem6KokRy5sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RwbIrngpd3Vau9AqPuEfEAUNdUYlFr0Oys7g7+BZ/xXffaCsmHidL8OGv33ifPYPR4HirbLjaWTsEWI5qcCfELcNCvGx/aMOe9vu//2miFlg7y9FQhdk55SmeO4Mh4E+74OinfcGQj+xiPIxCqUQjb3KtZUR00NHLXT3N9rdKA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UF4yTWNt; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UF4yTWNt"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39647184c73so1234160a91.1
        for <oe-linux-nfc@lists.linux.dev>; Thu, 17 Sep 2026 20:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702774; x=1790307574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILawRzLN/r3LsyBAHOfYBFFSxWw7SDBmyvoLxd7dlsc=;
        b=UF4yTWNtwKOCJGS79JemdwBC8mV87RSI1yYo50Km4C33BFC6mxqCfgH2FAAkSfYuIj
         uiULQekeWTFx1nJauvs27K1+dXsQonjayu6HIo/RgKAJ6HJNRWxz+NrflhI2Z3lkOlwz
         vtbKhcnsIUki2HDkYp9XX8Ier652baqPK1LRdjit1bsAmfzgaILSLfYgJWRKqqrpGoMo
         0vc7zI3PDddAr6P4kZmGnLTXBAARF7eg+QIxf9EG/2ionkTsOpZCwYxaXrSw+PhtLUKP
         z1/1RBoKt+rL8aFv5mDNRCN2VqlX5+W13iR/3wz4clkQIp+voqvectVN2sb27t2TEnLR
         wmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702774; x=1790307574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ILawRzLN/r3LsyBAHOfYBFFSxWw7SDBmyvoLxd7dlsc=;
        b=ZOMhYN5kJDxZQYp/rhY/F43w8Qi3yf5gQTt4xGQ0TkUDJHdzOnK17bkXZjmv1hs2Jw
         OM0HNE+DummHwwHLRaOq+HrekKdb9y/4wfETYptqVoSIgxjdob5jwSnBvNGStpo/lvI5
         xNMqIjWW7H55TLJIvn1QLcVlu+VVSgDiSwOAvv1+jAs93kt60sVz2lhn2NetJA5EaHfX
         s+kvILpDLjLv2qzTjwabu7nz8ITlc74D5lWZ2nynf3qThCHteucE3tG/f14017Xgh9Qk
         kLSeiif0sKXYFhx+o8wn1ZppA2Wj9ZOsWLMBIwjkoxiovVq1U3v6slGegguq8KRlhyDX
         iHPg==
X-Forwarded-Encrypted: i=1; AKwUvBy9aFSyV1IrLpyJ8MgweQKawN9pVyf0b8Fgvx1DCXvNnZIYs5sCZxPSZgjbnxJt3cIh+Rg1LApSTCzUReo=@lists.linux.dev
X-Gm-Message-State: AFuF++kQ7yhPSapmWZwHtOmGhVvpmzVyc3dpkNtowizc3ydJNGe0YxCC
	ztN/OHa8SdMd7a6j/d5LNc3lmQ9lCPrdavJHhl8Smn9i+SJnxo+rpuT6
X-Gm-Gg: AYBFou1fG0DtQCODjq6Lb1JnJ8FQ5qkKW//bi1jnTwro/nhD00zUz5XhBIwuz2Udmn6
	0OT4b8bLmPKKcKEctvwDPflKt+JuJQ98V9X8BYQxyFa4ejjHYhnI8gS34VgeFCq3ts6tIUm75U9
	kDnHnh99mghT/pR3JSlPb1Wlj6RuNxlzJxQjQF7Y5sgVfrYE0tDddZaY8T6ILq3XIfrm8E+Umyq
	/ec4V4kJ/1rrigjwLBlVUuoY125U4EnLO+3SSPZjM9sCJXOBfUhnb7kPJcuwF4lUczcaNk6BqPf
	87OXC22TTHiBXZ1ZCBrTXZzcrOCbYuEELWQU3+vS6D3ibuz6jvPOGVq0TSzBFZrvWWvp+e6RvtH
	YKAxP7UZaivca0b4vAsUj0SjQxjVuUe8GPBQxCsEv34CiHZrOwdblwv1/NZsUcrLRgWe2XIdU+r
	OD0/Hr5jLTF2OCWBfye6c4ev/ycwE4bTCNh/5Izt+9Xn2qbJO8+vtk2/Kn4hoc7iPuUS/ym6ccm
	xZ1zvNQi0BipNupLdZOgcPhHQ+d7y3ONGSiLcI=
X-Received: by 2002:a17:90b:4b11:b0:39e:4c97:ce0a with SMTP id 98e67ed59e1d1-39e4c97ceebmr3098526a91.43.1789702773711;
        Thu, 17 Sep 2026 20:39:33 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:79da:8b9b:16b2:8431])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cdfe957asm1039280c88.7.2026.09.17.20.39.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 20:39:33 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 1/1] nfc: llcp: reject connect() on sockets not in LLCP_CLOSED state
Date: Fri, 18 Sep 2026 11:39:20 +0800
Message-ID: <20260918033920.85025-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918033920.85025-1-ndaugoing@gmail.com>
References: <20260918033920.85025-1-ndaugoing@gmail.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a socket is bound via llcp_sock_bind(), its state transitions to
LLCP_BOUND and it is linked into the local->sockets hlist via
nfc_llcp_sock_link().

Currently, llcp_sock_connect() only checks if the socket is already
connected (LLCP_CONNECTED) or in progress (LLCP_CONNECTING):

	if (sk->sk_state == LLCP_CONNECTED) {
		ret = -EISCONN;
		goto error;
	}
	if (sk->sk_state == LLCP_CONNECTING) {
		ret = -EINPROGRESS;
		goto error;
	}

Crucially, it does not check for the LLCP_BOUND (or LLCP_LISTEN) state.
Previous fixes addressing CVE-2020-25670 / CVE-2020-25673 added the check
for LLCP_CONNECTING to prevent duplicate in-flight connection attempts
from corrupting the connecting_sockets list. However, they assumed any
other non-connected socket was in LLCP_CLOSED, leaving the LLCP_BOUND
state window unhandled.

If connect() is invoked on a socket that has already been bound:
1. llcp_sock_connect() silently overwrites llcp_sock->dev and
   llcp_sock->local without releasing previous references or freeing the
   bound service_name, leading to refcount and memory leaks.
2. The socket remains linked in local->sockets, while llcp_sock_connect()
   links it again into local->connecting_sockets via nfc_llcp_sock_link().
3. When connection confirmation (CC) arrives, nfc_llcp_recv_cc() executes:

	nfc_llcp_sock_unlink(&local->connecting_sockets, sk);
	nfc_llcp_sock_link(&local->sockets, sk);

   Because sk was never unlinked from local->sockets, the head.first of
   local->sockets still points to &sk->sk_node. The second
   hlist_add_head() sets sk->sk_node.next = sk->sk_node, producing a
   self-referential loop. Subsequent traversals of local->sockets
   (e.g. nfc_llcp_sock_get(), nfc_llcp_socket_release()) enter an
   infinite loop with spinlocks held, resulting in kernel soft-lockups.
4. Furthermore, if connect() specifies a different NFC device index than
   bind(), the socket remains linked on device A's socket list while
   being assigned to device B, causing cross-device socket confusion.

Fix this by ensuring that llcp_sock_connect() only accepts sockets in the
LLCP_CLOSED state, returning -EBADFD otherwise, matching the state check
behavior in llcp_sock_bind().

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
 net/nfc/llcp_sock.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 5558d8a4d48b..66f12e9af2fd 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -689,6 +689,10 @@ static int llcp_sock_connect(struct socket *sock, struct sockaddr_unsized *_addr
 		ret = -EINPROGRESS;
 		goto error;
 	}
+	if (sk->sk_state != LLCP_CLOSED) {
+		ret = -EBADFD;
+		goto error;
+	}
 
 	dev = nfc_get_device(addr->dev_idx);
 	if (dev == NULL) {
-- 
2.53.0

