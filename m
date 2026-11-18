Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991104;
	b=wsFJLjURkObs9E1RUEJKZaMkUBBs7G1xbjrAeInbM2qUUQd0mdyfT3Tl7UVyzhc9Z57g
	 Yd51AOIxrBSHydHERKlq1C4YCd2Ru5i7yGq8jqrAbpXDATy7AgeNf2hSliUqxwzHHl/3L
	 Ar/fTEKHLBRhXRCqExzOfLqTNk5GNhe+d9jiqfLBxMJbyz421a0oL/l78Pagq5i/jYYqi
	 Z1aHjak6L8WUzqvFO8tEpuIgooblGefiAbgUG7PhL9SyABuCSId2DxtpDhPhtUTMjNFvP
	 1S6OSZJpFxjgkIuFJCXYYYK7VctduvpUDoWWJdGqaKsL0z0wi354kdnykDcXPFsml2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vMKeyOZcK3q18Yw2MNqKYKjsEME0sggs4rjvagocBak=;
	b=ufY3VrpRuqEcEwMuzVViBk26088rkMd9e+OC5pIhskuV0US12Q//5XiQLTbr8o9arIfz
	 uslv7G1E7NOVOdNYiSp8PGq+RlgTSxqI4wNmeCYJYOiz7x/H2DwIuFiRONrQ5dLL9wxtb
	 V5/ElfHNnhns62XK3SD7MGShsPOYvfvEGwOJVJpPYYnsLUzgUeyF4AxRTs3Grm11357TR
	 qU65ZkGFK38jyjhmzQYNoxWHoaq1uEv8PijuQk+JnQqVXDFMqsUTOf2gZRGHp5sVKP5n4
	 1AjFQ73bcKnAtshMrMEspbWbKW1yzvJfyducBATdosYEI5Agxh75S4DUfnbJesxkHFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DFxHh6yL;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91F3606A333
	for <oe-linux-nfc@lists.linux.dev>; Wed, 18 Nov 2026 08:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D91F3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DFxHh6yL
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-862a05abb95so134666a34.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 18 Nov 2026 00:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991103; x=1795595903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMKeyOZcK3q18Yw2MNqKYKjsEME0sggs4rjvagocBak=;
        b=DFxHh6yLm0qKurzIEnTgAeSUfFSNyiY+3/OCobZJjJR60eveZjeVgv/AuNZyW3rlPx
         QPnKnrcbiYHXr8iZIzNIGyTihq2TYrQ3NAh5gS+sDoQk0XcpPzGWFSSq2aaKUnPY3djp
         LjwTradxIEyPA8veIuo0M0EJzdExCJ5sa+TLEZ5WuyOgASZ2I8qfM6orx83A1Nn+hwwg
         GwA3twZaXMP7NbxY1RPTRcHLKneERptVah7ga+t1tzzMH9+99oxHJwWVPCMNWOpEo8wd
         yXQj//yVRQiJZrV0ajqEDh///s1pNWLuatkXFrpK0gOSzp6aNRu84DK5rhZSWRcQGcij
         FSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991103; x=1795595903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMKeyOZcK3q18Yw2MNqKYKjsEME0sggs4rjvagocBak=;
        b=Gf38BmeAds7FxGQfcSUPeiV6v5w1gVjz8wbr5FPlhfibmyeV2UDW50pa0iSbvLfQ0s
         /caJhjp4NxU5howH3LqVe2JWi+iOVJtLzSEn94aT/eX+KXiqgXdSHrDR/dBZttsHQvla
         Z1xJnlZ0U/um2aMDbnTQMrMLTSCb1F163S/bkjv3LS7IV4KNBEyEGCad+M0TTgAwUcra
         HFi4VNDr/lSe7f/781pPAOMHEx/QB+fIsnRSlzDqAAZsVHFLYw1f26uhXiTatR4ytMPV
         lXLP2kPr0gFCSSdstp93bPPeb7I/2oCjle8nsRW+dttj5UYwzD/aCjTPGnf7zBNfrSfT
         CkQQ==
X-Gm-Message-State: APuU4Z8yjG6mKL/4zoEs6eZFWK7dmu6lagy+7lKuG7pP71/yFRcQOaUU
	0xv8EJca9oKXMZOTkwswvdXcYmN14L9IuOl6kiWG1Ihy6c4+A3tncWPv
X-Gm-Gg: AYBFou1SwKciWF3kWY3Bzdvb1paYt/r9YLDlZCH7rpaCnhz97q378AQVPr1rz7qlwXo
	1K5a4PWvS3140WBd0casbKkINmofim23B1grqukV19Opd2Jh0ssloaYKjixUxGzFYlp2HGH7VxH
	gOJWvxeeurN9ZoZrzOkz3Yfj4Tc9stCxXrY+KwnJaHHwz7Bmk9j1sPoNi83C/8lkFT4malN8AQF
	BtdJ+d4E8hB2eCyTt1TzDKp7E/Rg2dzVaKZMaol12+Tn9Ib/1r/tbc/2GX8rSjWJWNIG+4D/YHE
	rEKagPR2CePmQDYdFtemUrBJG0zaJegxFWyBiTsUOiirRRJqtmvUXK4g7UIOSwogKs1K8BwRXot
	7+SVhELkbNtMO1XTHZoieV+3LTOY0Y63QVGAbarXF7Tu0lEUJq5nTMAE0B+fBva448uBnjgHTCK
	O87wuIll03j8QCORS9ydKgePDirj7w7IY3HqjSMKhHQv2YI7/9AH9BkkYihhZw7ySOqAV1x5RF6
	B6CKxThhClKd78nFL2tEBbHnX3gj+aOWHV8sDhqZJUT9P/rZGgKEZ6qs5rMl1mnjR2jRAXLp/Zj
	PlxxVuQI9ebmSjTHTYBc0ibKyy1CfakskCLYexy4E+b7AIE9LkHewPkXzLRRlq6I0YFMpKLy9JY
	IUtBidXeDGZEj
X-Received: by 2002:a05:6820:a70a:20b0:713:da3b:9530 with SMTP id 006d021491bc7-71b187889e8mr789320eaf.44.1794991102733;
        Wed, 18 Nov 2026 00:38:22 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b1945800asm1516812eaf.5.2026.11.18.00.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:38:21 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] nfc: llcp: walk the accept queue under the socket lock
Date: Wed, 18 Nov 2026 16:38:11 +0800
Message-ID: <20261118083811.1721010-1-bsdhenrymartin@gmail.com>
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

llcp_accept_poll() walks parent->accept_queue and reads each child's
sk_state without holding the socket lock.  nfc_llcp_accept_dequeue()
unlinks closed children and drops their creation reference under that
lock, and the last sock_put() frees the child.

A poll() racing with accept() therefore reads a freed child:

  BUG: KASAN: slab-use-after-free in llcp_sock_poll+0x440/0x4e0
  Read of size 1 at addr ffff888112387812 by task poc.bin/528
  Allocated by task 198:
   nfc_llcp_sock_alloc
   nfc_llcp_rx_skb
  Freed by task 529:
   __sk_destruct
   nfc_llcp_accept_dequeue

Take the listener lock around the accept queue walk.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/nfc/llcp_sock.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 1e5ee4bcde68..3503f1a7a7cc 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -584,8 +584,16 @@ static __poll_t llcp_sock_poll(struct file *file, struct socket *sock,
 
 	sock_poll_wait(file, sock, wait);
 
-	if (sk->sk_state == LLCP_LISTEN)
-		return llcp_accept_poll(sk);
+	if (sk->sk_state == LLCP_LISTEN) {
+		/* nfc_llcp_accept_dequeue() unlinks and frees closed children
+		 * under the listener lock, so the queue can only be walked
+		 * with that lock held.
+		 */
+		lock_sock(sk);
+		mask = llcp_accept_poll(sk);
+		release_sock(sk);
+		return mask;
+	}
 
 	if (sk->sk_err || !skb_queue_empty_lockless(&sk->sk_error_queue))
 		mask |= EPOLLERR |
-- 
2.43.7

