Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09963749E1
	for <oe-linux-nfc@lists.linux.dev>; Fri, 21 Aug 2026 10:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308396; cv=none; b=uqL5gkygjNeieEOOr7NYEf5Ax/GPhM4y1dLiKu7X/GzfK/VZfmxbW/yWmNPgKjLGBHBQFPYIVyjsPWJ4polBwoDxzE+4++huJmxgH47q1k+5wHLiaqRBHokIgyGmH5ph/ES5Men6KomLGeSS3pVS4Xj1K2qW6PiiQHH/s/Nc83M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308396; c=relaxed/simple;
	bh=P9LNGp4ErkxhdCsTUyDwbamdFttHanhpRzoX604x2UI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PGet9+ZRRqGZHUxrenGQKmwVh+NKUYMNXVtpaHxS1Gc55kB/XXNrQGX+7zqByylY8hXj9HgwdOdfQ8QgKafJrMe7cchYSETrgig9e2KWl2Ic77x47yZWcdwDnYIndXicNz5W2jRjXQPdIv4V8p/XQ/7HVuKgbhDxYFqap0pJIio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWKiaP9I; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWKiaP9I"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-836c43641baso16790377b3.0
        for <oe-linux-nfc@lists.linux.dev>; Fri, 21 Aug 2026 03:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787308384; x=1787913184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZJG1RQ6i/ZR/FqUkuEQhANL+pwQMNfsxmBOMfyZT2Bc=;
        b=aWKiaP9IybGziqxXHXOn1uANo9Z+rZ9TpXRNRAHDjHXmDG8zrv07NejPN/sh3gXv6D
         9KH1Ul5h7sXBF7cP5P5BK87WAgQWXHDF05vpEFZ8rPe4DUcvCHNrnaG4/W6PXZN47H84
         yUlewkUHamtQIH/YzdZz6aHbta9HlfzRNh6nqEOyHvBk8LbTCuZMuOunV7aGwXvfUxIr
         bRFmUiHyov16p/ujSJzspeFnh/gcb31iK5H64PZWjP2XWRoDV8Hl5eLe5uabGokBMudt
         wYmA/dx3dWpWDuPNdq4cNmRkTcgO2s5kLSC55dQ4m/EpKo83iHwJyrV2DR968lHkzmYB
         hqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308384; x=1787913184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJG1RQ6i/ZR/FqUkuEQhANL+pwQMNfsxmBOMfyZT2Bc=;
        b=L4i9mZx1uCcJoWR+5eWZyaGFEb/9SF0GXrQFU6+9/d37nPUN/At9YSJPg/SmmL5RJw
         PnetB76NTM7GI1HlykOBD/cPwJuD8jugp/is93r1BZPM0JBJ+BdkcBU3jlL1KyqcHGi6
         oWU7Yumk04q8fj0Xp/fEuxGucIoC7bzv881uOr8XbFjfLwjIYCbKXHJX1i4a2lqkMj5T
         +A2DW8hwt5t3dtta1NWndjgqph1Jn6LV15FA3NBU5dbhXoiB0H6cRR9ApbB0SNFobwla
         8SeKvUb2cYt0YxqgF8+qSAy4/fY1C6CrsrX6zsgu5McKvRknBdHSak6T4md5fnpQhZso
         4H3w==
X-Forwarded-Encrypted: i=1; AHgh+RqZCLO0EquKS12xkTcLFMVxKDKW1pWS/7XhCN60NVgCCzfK7uWYgAybJcrb/uTTzk7HsJFF4npXCLF/6JA=@lists.linux.dev
X-Gm-Message-State: AFuF++kRQPO2CxReVGOp2q/XVnsMmGUQzNqn2cocsqwAIMD7dBW71/X8
	qZJN4QBQ2li5q0f6L46GBT1TDSqrrP9QI3gCJBfbswO13Di3f+x3PyMR
X-Gm-Gg: AR+sD108kpVY+J616yGKe0nvNqSmJjx6Lqyv8FQ9anfoUYhHvvOWEZS8qlNKMrXUblX
	LJgPSke31ZKg8svQz6e80Zb8vdkMsrjkVZ5LEBrPBsmAdxCHzBRBPiFs3pppJgd91SWrkc1BbUI
	ShBwcX2F3zX7SB89a/PdqE6qUT/gmJWxjXaMCWjo8uIwRRdzY4FjZrloGp+c+cLMIbMPZX3eAdR
	fSz8CEQ3z3lqJ0OXqPqK+TDF9iovlYnJcDEfRPIY+s/ohzRoc6EWoqZDoiC8VrXIc0ZOBHy8azu
	0+z7iqwjex4YpXHkWZVi6nzH9PM/lDVYVVu8jI50BJyuH09B+GMlG1CKc4TaNYEDBQ3yPzihGmU
	UfnFIt7L2egDH6yaSYpEbWJ2ieC685ZTw4i7Hc8fxHBIoOOrmiT0l2zse25a9yOIVINEd4Vj3MI
	Jg7yAG83XsUuqdjf4H+SyQLAM1gSvWsRYQ2t2Y8yLpgrnIk3NxD5w7OAY2MuYJ2xGi2WPNw2Xdf
	Y/b
X-Received: by 2002:a05:690c:e68d:10b0:81e:eb11:6e5f with SMTP id 00721157ae682-849f6c946edmr17102527b3.34.1787308383954;
        Fri, 21 Aug 2026 03:33:03 -0700 (PDT)
Received: from jdoh-CompSec.. ([141.223.124.60])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84512c408a3sm37632227b3.18.2026.08.21.03.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:33:03 -0700 (PDT)
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
Subject: [PATCH net v2] nfc: llcp: fix NULL pointer dereference race in nfc_llcp_send_ui_frame()
Date: Fri, 21 Aug 2026 19:32:44 +0900
Message-Id: <20260821103244.72313-1-jdoh.kernel@gmail.com>
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

Take a reference to sock->local under the socket lock and pass it to
nfc_llcp_send_ui_frame(), which now uses the pinned local->dev instead
of re-reading sock->dev. nfc_llcp_local_get() also pins the nfc_dev, so
both stay valid against a concurrent llcp_sock_bind().

Fixes: dded08927ca3 ("nfc: llcp: fix NULL error pointer dereference on sendmsg() after failed bind()")
Signed-off-by: Junwoong Doh <jdoh.kernel@gmail.com>
Link: https://lore.kernel.org/all/a89d0419-8bcf-40a2-b52d-3e5d911f11da@gmail.com/
---
v2:
  - Changed locking to refcounting to avoid holding the socket lock
    across the blocking send.

v1: https://lore.kernel.org/all/20260725115556.1250160-1-jdoh.kernel@gmail.com/

 net/nfc/llcp.h          |  4 +++-
 net/nfc/llcp_commands.c | 10 +++-------
 net/nfc/llcp_core.c     |  2 +-
 net/nfc/llcp_sock.c     | 10 ++++++++--
 4 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/net/nfc/llcp.h b/net/nfc/llcp.h
index d8345ed57c95..3ff9729daf63 100644
--- a/net/nfc/llcp.h
+++ b/net/nfc/llcp.h
@@ -201,6 +201,7 @@ void nfc_llcp_sock_link(struct llcp_sock_list *l, struct sock *s);
 void nfc_llcp_sock_unlink(struct llcp_sock_list *l, struct sock *s);
 void nfc_llcp_socket_remote_param_init(struct nfc_llcp_sock *sock);
 struct nfc_llcp_local *nfc_llcp_find_local(struct nfc_dev *dev);
+struct nfc_llcp_local *nfc_llcp_local_get(struct nfc_llcp_local *local);
 int nfc_llcp_local_put(struct nfc_llcp_local *local);
 u8 nfc_llcp_get_sdp_ssap(struct nfc_llcp_local *local,
 			 struct nfc_llcp_sock *sock);
@@ -243,7 +244,8 @@ int nfc_llcp_send_dm(struct nfc_llcp_local *local, u8 ssap, u8 dsap, u8 reason);
 int nfc_llcp_send_disconnect(struct nfc_llcp_sock *sock);
 int nfc_llcp_send_i_frame(struct nfc_llcp_sock *sock,
 			  struct msghdr *msg, size_t len);
-int nfc_llcp_send_ui_frame(struct nfc_llcp_sock *sock, u8 ssap, u8 dsap,
+int nfc_llcp_send_ui_frame(struct nfc_llcp_sock *sock,
+			   struct nfc_llcp_local *local, u8 ssap, u8 dsap,
 			   struct msghdr *msg, size_t len);
 int nfc_llcp_send_rr(struct nfc_llcp_sock *sock);
 
diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index ca89fe967d6a..1549ed2631f5 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -740,11 +740,11 @@ int nfc_llcp_send_i_frame(struct nfc_llcp_sock *sock,
 	return len;
 }
 
-int nfc_llcp_send_ui_frame(struct nfc_llcp_sock *sock, u8 ssap, u8 dsap,
+int nfc_llcp_send_ui_frame(struct nfc_llcp_sock *sock,
+			   struct nfc_llcp_local *local, u8 ssap, u8 dsap,
 			   struct msghdr *msg, size_t len)
 {
 	struct sk_buff *pdu;
-	struct nfc_llcp_local *local;
 	size_t frag_len = 0, remaining_len;
 	u8 *msg_ptr, *msg_data;
 	u16 remote_miu;
@@ -752,10 +752,6 @@ int nfc_llcp_send_ui_frame(struct nfc_llcp_sock *sock, u8 ssap, u8 dsap,
 
 	pr_debug("Send UI frame len %zd\n", len);
 
-	local = sock->local;
-	if (local == NULL)
-		return -ENODEV;
-
 	msg_data = kmalloc(len, GFP_USER | __GFP_NOWARN);
 	if (msg_data == NULL)
 		return -ENOMEM;
@@ -777,7 +773,7 @@ int nfc_llcp_send_ui_frame(struct nfc_llcp_sock *sock, u8 ssap, u8 dsap,
 		pr_debug("Fragment %zd bytes remaining %zd",
 			 frag_len, remaining_len);
 
-		pdu = nfc_alloc_send_skb(sock->dev, &sock->sk, 0,
+		pdu = nfc_alloc_send_skb(local->dev, &sock->sk, 0,
 					 frag_len + LLCP_HEADER_SIZE, &err);
 		if (pdu == NULL) {
 			pr_err("Could not allocate PDU (error=%d)\n", err);
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index cac1b5487064..52e72399d731 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -143,7 +143,7 @@ static void nfc_llcp_socket_release(struct nfc_llcp_local *local, bool device,
 	write_unlock(&local->raw_sockets.lock);
 }
 
-static struct nfc_llcp_local *nfc_llcp_local_get(struct nfc_llcp_local *local)
+struct nfc_llcp_local *nfc_llcp_local_get(struct nfc_llcp_local *local)
 {
 	/* Since using nfc_llcp_local may result in usage of nfc_dev, whenever
 	 * we hold a reference to local, we also need to hold a reference to
diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 5558d8a4d48b..4d38025e8213 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -787,6 +787,7 @@ static int llcp_sock_sendmsg(struct socket *sock, struct msghdr *msg,
 {
 	struct sock *sk = sock->sk;
 	struct nfc_llcp_sock *llcp_sock = nfc_llcp_sock(sk);
+	struct nfc_llcp_local *local;
 	int ret;
 
 	pr_debug("sock %p sk %p", sock, sk);
@@ -819,10 +820,15 @@ static int llcp_sock_sendmsg(struct socket *sock, struct msghdr *msg,
 			return -EINVAL;
 		}
 
+		local = nfc_llcp_local_get(llcp_sock->local);
 		release_sock(sk);
+		if (!local)
+			return -ENODEV;
 
-		return nfc_llcp_send_ui_frame(llcp_sock, addr->dsap, addr->ssap,
-					      msg, len);
+		ret = nfc_llcp_send_ui_frame(llcp_sock, local, addr->dsap,
+					     addr->ssap, msg, len);
+		nfc_llcp_local_put(local);
+		return ret;
 	}
 
 	if (sk->sk_state != LLCP_CONNECTED) {
-- 
2.34.1

