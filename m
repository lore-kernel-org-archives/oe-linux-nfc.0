Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594037;
	b=KnKT57U1zvtbKaBd743nF4+z0aa1f1kwpG8Xr04DQSWhtdzL9lrBvoRpwt4Jw4KSz20r
	 N0/8n/YQrhdh6ALk9qscYvjs2KaYOs+zck0x4uZMTF/g43KEF4EFNKbX6edyVW7U6W1a2
	 EAPdoRlLySu5zSTSY0A7p3e3yFkUqp9WeFH5lxjXwZnGHAMty5/hiaHoGh8gIAo/w12EE
	 O8h0nK8gXABemjM57TLXAL2/H8d8S/C717CgoI7bzHpVuVfcSOjRc6u3Ia6Ez/jGi46w8
	 VpiQ4ghJUQ3vzMxMae/YRasom19P1ImtQYIwakJoo5zo92KI1yOshqDk3m/rEgRv/Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gGgY/g42kXiEi9hKkVOcPMTngxVYNDDV66irTK01U44=;
	b=strLPkZlOhSTDu+Z1uiXDFgM/CEleuPlcVII7F13mB2nzbkpfg+zW3W0ucM07KBBZV2v
	 tcmnwwUo6Us6AUPW4H0ystFqUU/TeHwvDfTBBDYjkH7pEtkYQwRhWWP3/2oqx/2j5FzeI
	 9IHC4W1aRFakOGi+l6jQczDpa6A/YrT/ntgVcMS3v+R25BHZxGDJqPrdJvIKM9ekPBz+O
	 HfFNA89Zr+KzrMDiSnAnI8D7lAA5+XLh70g/+eMeAolO9jXZ4SDuKJg04fUE+7pWWpmKK
	 nCIVnSlbV6SWjqZghtroaMk5szsKwh4LQCyvcnbYKUWdJPFyKHwVyh2XS76x63Apw2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMXcVlN2;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94279606A31E
	for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Nov 2026 08:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94279606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMXcVlN2
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2efd15c7545so19319975ad.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Nov 2026 00:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594036; x=1796198836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gGgY/g42kXiEi9hKkVOcPMTngxVYNDDV66irTK01U44=;
        b=fMXcVlN2FD18H6ppE7yoxdkgLcUgmpB3Fq9ZfXj0I+y1eHhGzVPgAPGhnhINc81J70
         aeCjdxESy11FbvIxjhBoITqovKxPgV3CO5vpghNMjicCQWiTFoOh1evuo6vi7gf3lGdw
         rkcTUEkBTrv5Tllqb5cuqlhbEBMXwG9NKTWbSy2/5TweyNW90WfDVsyFChePE+bV2zqj
         DhzU5sM1R9HLOTmmYevBg6TeA15pCD6oaL9UTWpFNXEDhyta/5JedSAUg2PZTp44NKs7
         K8ybUzjCCJsksFZWrZBPJyWhmAArdS6oKlz9QwI5oWssfXTw6mGkATk2+TOWvGeaqPN7
         HPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594036; x=1796198836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGgY/g42kXiEi9hKkVOcPMTngxVYNDDV66irTK01U44=;
        b=i/24NPtCz3A5wb5/bfIuZC5+mVRzO/2iinEkVqvOgHxwqoMESPzTrm7D2nyl3G+qyD
         BZ4k07JEVfH+dtZNrCFOQ8rwi4jFsT7P521G+1PZdDOFG22TfDJgV9kwT3DJP8WbMo7u
         wK+fGgQQ17wRUWwK3cLFQ5NYuSIDzhmnsoI+/0hfdHxLACBaf/5ysjOsH4Ehmq1HkAqN
         s0u/14V4ot0pddQuJKjmnYng4bUNVu1I2iNcwT+Rrx0HJgpU5cU2b7Z0w6jXGxLrLxH9
         D5j8f2vS6qpv9QL9SZGZjcqskd1BzXv7p2e0PZuGERd1LJMjaCplzFHYLUwV1CKfJ53R
         PBvg==
X-Gm-Message-State: APuU4Z9jeE9TVMmSNzFhemKES3XTgYF3MGkNMAKOEJ0gwpbtOoZCAI5L
	RXvZA8CZL/+AM/aN0zwVPqjR3frRaZ3IJkVxX09lRVlRQyHajvS8qAFi
X-Gm-Gg: AZFdTZfxWKHwo5wms6sui7abcSd6CKka0WBxHK2+MIFuAOtElBiyIisDt7RU+N3G0Em
	Y9FBc/kfS3CaizkE5Eg0oKJKyVdam8DzHEtJLdgSgkmQbAfkZeZxaqucll3Gyi/o4PJvTqCmKJ5
	JfDyn/HFqdYLyl69Mweg5NOos6K9JLAX3MQerFuerdzyDDqZCMe9RgC27vKLNn46vn+VSXsRiYL
	mfExk8oUaRbFptSzmDVUXMR/Ocuv3AFEZmuh9WNgvlSfiGVCc7WpEvcGW9ALEEZSKJt6fP4nyRi
	4McFwXiRaWjlTftVVFxZvxQ4Z7cZGs/KOw2TRRTqUEkcPZ7IwfkUntCy3hgkg/WXPLLDgSCnGXI
	QX1fx6b882UZziUYKxgz16JDJsniR1iR1QJoLJdlynLCaoaIDgX+xkyEn8q9nSw+nhHY0SkWZg9
	BdNS6yVSI6g1JE/iiiRsN8Ntt2zp519XkjO65nBaZKT3lQ3+smekSDJcFFEUif65ivaIF1fJz40
	s97KfMHyvqEUt86isCpO/F0PpkGikC8fxKYL46xP6zoRyD8j/kC2iwan0qhsYSqJUFbgNPmqVYU
	u9krirQCGd4upzadv90o7vArb1tS1efAP83AOyNQ4vCaT5WoxoSKRfI84Jp1npFUnHAvv/OkVxA
	H
X-Received: by 2002:a17:902:ef4e:b0:2f0:4ebf:84e5 with SMTP id d9443c01a7336-2f04ebf8708mr162770625ad.45.1795594035760;
        Wed, 25 Nov 2026 00:07:15 -0800 (PST)
Received: from BSDHENRYMA-PC1.localdomain ([43.132.141.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a74sm83444005ad.12.2026.11.25.00.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:14 -0800 (PST)
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
Subject: [PATCH nfc v3] nfc: llcp: reject bind and connect while the socket is still linked
Date: Wed, 25 Nov 2026 16:07:06 +0800
Message-ID: <20261125080706.648722-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The same stale-link case reaches llcp_sock_bind(): nfc_llcp_recv_disc()
and the non-connecting branch of nfc_llcp_recv_dm() move a socket to
LLCP_CLOSED without unlinking it, and bind() only checked sk_state, so
it would link sk_node into local->sockets a second time.

Reject connect() and bind() while sk_node is still linked.  A socket
has to be closed before it can be connected or bound again.

Reproduced on v7.4-rc3 as uid 1000: a soft lockup / RCU stall in
nfc_llcp_sock_from_sn() while walking local->sockets.

This issue was discovered by Tencent CodeBuddy Security.

Link: https://lore.kernel.org/all/20261009092338.3146149-1-bsdhenrymartin@gmail.com/
Fixes: a69f32af86e3 ("NFC: Socket linked list")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
v2 -> v3: apply the same sk_hashed() guard to llcp_sock_bind(): a socket
          that a peer moved to LLCP_CLOSED with DISC or DM stays linked
          in local->sockets, and bind() only checked sk_state, so it
          could link sk_node a second time (reported by sashiko's
          review of v2).
v1 -> v2: reject any socket that is still hashed (sk_hashed) instead of only
          LLCP_BOUND, covering bind()+listen()+connect() and sockets left
          linked after DISC/DM.
---
 net/nfc/llcp_sock.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 1e5ee4bcde684..c12170dde8401 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -86,6 +86,15 @@ static int llcp_sock_bind(struct socket *sock, struct sockaddr_unsized *addr, in
 		goto error;
 	}
 
+	/* A peer can move a connected socket to LLCP_CLOSED with DISC or
+	 * DM while it stays linked in local->sockets.  Binding such a
+	 * socket would link sk_node a second time and corrupt the list.
+	 */
+	if (sk_hashed(sk)) {
+		ret = -EBADFD;
+		goto error;
+	}
+
 	dev = nfc_get_device(llcp_addr.dev_idx);
 	if (dev == NULL) {
 		ret = -ENODEV;
@@ -714,6 +723,15 @@ static int llcp_sock_connect(struct socket *sock, struct sockaddr_unsized *_addr
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
2.53.0

