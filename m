Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401329;
	b=oU91tBBTXqs1K/GDwyz3RTuiN7NpHPTBYwyaJ7rbL9gpNBqzHirJsapdMxev20yuEdCr
	 hYaSDARPNJ4eydMwSVuM5agNR63ayJRxlBc1m+YMdM/6jxqSJVKKmSp3gymsfU4lHWenz
	 Mw+9gZuLgaaC70jR6XD2SH5pd1hYTh9k6a7OxMxElT2AoM14+pJv+HZ4pbAkTH5F6szcz
	 FOro+WRrhL8pKabC9O8jlajUF2YL2sKcua4Yu6Db0qLoLPpnl/3UyW4EeN3x4xB+YnyLX
	 QVC/jD3N7CIsmbgQ6M7uBboTE1+Tqsq6Pmk1GPmdEvnMx4d57Oh1ny18WbV7NNEW8lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V9tZJEHgi9zuzkPjoAHZgtifbl5VP5I7TzEdZTDXpvA=;
	b=yG/btqMKlx1NAquySFPm0Z3Ry8pjhiShJohjA1LEF12MFIxVCiIxLXK6h5WvnQd7PZHe
	 jeSAJXggYTdS89IUig87HbHl/BI/7qWAtw3MDIusLYA89iWWYje/3B1ySxzoSiZtiB9fs
	 b0Hwt1yckn0KoCJum1O9G30c4LAwKs7Ui93AKvuxB/+6KrDrXlEfL72tdspji/WoXYWc8
	 qgwflPhV0VoYue2YyBNT5mPKVsWLNoj0wP7upkiCLhWNd6JTLBmXYTTEuv4Sdju9SZdmP
	 pAsqikyMzCNV0LGDZaRgGAL1JA2XgaGqfpiWvI+ofSwCAvjceSlFlP+JI6mgz0ANWDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b="RZ/9vS2K";
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF098606A330
	for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Nov 2026 02:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF098606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=RZ/9vS2K
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f045b921caso14368875ad.3
        for <oe-linux-nfc@lists.linux.dev>; Sun, 22 Nov 2026 18:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795401328; x=1796006128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V9tZJEHgi9zuzkPjoAHZgtifbl5VP5I7TzEdZTDXpvA=;
        b=RZ/9vS2KP+9RfUIlXtyVOcc/QQbO5spRI28V9yoEw3a1A9bzXAyk6Bd0oK0bh9uHuD
         cX/tPjMzwWQmkC6cn5HD42rBOh9Xv+Z+FJpWGQsKeDTi6ZBiep7VDikqarPpRaHUi+Iu
         F2/3xhz77IN11GZXN3hSmL7UNAH/FPCn63lUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401328; x=1796006128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V9tZJEHgi9zuzkPjoAHZgtifbl5VP5I7TzEdZTDXpvA=;
        b=dJ0u1E9+EuLXIomiWIAFJAhSV/VTWqF82S5KD4txA3qbzCyYVmHm01NJFdOTiA7nkp
         Vn6bwkvtoC+CPMWjULa75rXXZUqm3tYYbENmUN+4emAeD6R6T7GDBbY4I2pFzHIyPh3E
         aH/BtPIg/XfszCGiWvtZs6e+WZefBTxzq0lOApokatCIeEv7qxkIAoH2khDiGAUBubWg
         X2X1IeXMTAXogZ9Qk6sQubr/himI2ReZQ4cwZRQ5fEYcEoYxvyl4Q3UyM+CNw5H9ag0u
         PQPj0h+pVMVc9CUihvJI/rGPAYHRQWCZjmTN6lPW8VA3gZ8F4JV8eP6FOlCDC5CBHCvu
         4Dwg==
X-Gm-Message-State: APuU4Z8B42doMgnadAQV9dH2Tk9Vg/4vrcYAudJ66UxaK4gC5FLJyKwL
	mirv3C0DcKygcnz3VNOKtMyvjKmQLcPagVAqyeXu6Qet0g4XP/RHHrvJnKC1zLpHmtk=
X-Gm-Gg: AZFdTZfXsqRb3zQhMuw2hvDOyKpAaH3v/F6gGLgiBFqDLNhFi0t8ninTUiVBKc5L/E/
	eR3hN+8fzJABQhYeJ2o5MWz0eZ4jfKPYbMAo2cpHDTtA2/p09+VtjoM/wfzbYJpu4eacNW1DID2
	Yn8M1GZ+Tpix77wdyh6sfcLgZLV/GIKfugT14lfci91/WDOQ16yU+n7VDpQJLKLf710WN/QhP/+
	v4OiNg7qSUSjCl/ogbtJXsjqy42qL4jlR0JaVRCiHNSC8LCDkT7aCN3oh+TVY0odLrVkHdeBS0B
	GYmm2hBYucuibKidEWr4Z5cNkggl9xLwLnYielXESkKJ4G+44kYjIiQ6mVedSqw1M8XisUD0EE/
	tHJmaXYwsZhFkJimkM5UakL6stIOyYXlDafu34BM72cI+dfS2aTpg2yXCxc97EhgBVQt8Ib6jhU
	w+Hy3PPifkhNOqMqmIJxKuYIG3FECkWFOYa9XIXqILhPdOLFgotZ8b8LnKPiJxiCUHUlVo3gx+M
	st96lQ8jjodwMX1y8jZOH9vwmdIKlTYJ3FMzRT7sb6QRURxSaMtS+RGIKwBqOueusEmVf5KEorQ
	sOKM6koffa3fpkAy2ebZiW1Ft6Rjs3tQKT3TgtCTQmj8UKxlSc1yPmEOnV1gyEAEG5vQj0YD4a3
	uQpxDKhlAbwwfGvDrjm0xlCHPh0zESufFz+DfBAU896REcWfXGB6GO+EMvJF7T5/Z5ixzAl0/1X
	bkvoiKboyGpA==
X-Received: by 2002:a17:902:d2c6:b0:2ef:f312:b842 with SMTP id d9443c01a7336-2f03f1b426emr100861095ad.46.1795401328203;
        Sun, 22 Nov 2026 18:35:28 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm44320685ad.63.2026.11.22.18.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:35:27 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net 2/3] net/nfc: llcp: take the skb reference before queueing it to the socket
Date: Mon, 23 Nov 2026 08:05:19 +0530
Message-Id: <20261123023519.3350997-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123023519.3350997-1-piyus@iiitd.ac.in>
References: <20261123023519.3350997-1-piyus@iiitd.ac.in>
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

nfc_llcp_recv_ui() and nfc_llcp_recv_hdlc() queue a received frame to an
LLCP socket and only then take the reference meant to keep it alive:

	if (!sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
		/*
		 * UI frames will be freed from the socket layer, so we
		 * need to keep them alive until someone receives them.
		 */
		skb_get(skb);
	} else {
		pr_err("Receive queue is full\n");
	}

sock_queue_rcv_skb() takes over the caller's reference and publishes the
skb on sk_receive_queue at refcount one, so a concurrent recvmsg() - or
the socket's own teardown - can dequeue and free it before the skb_get()
runs.
The increment then lands in freed memory:

  refcount_t: addition on 0; use-after-free.
   __refcount_add
   skb_get
   nfc_llcp_recv_hdlc
   nfc_llcp_rx_skb
   nfc_llcp_recv_agf
   nfc_llcp_rx_skb
   nfc_llcp_rx_work

  BUG: KASAN: slab-use-after-free in nfc_llcp_rx_skb
  Write of size 4 at addr ffff888055abe5e4 by task kworker/1:2/56

Both handlers are reached from nfc_llcp_rx_skb(), and the aggregated-frame
path widens the window by dispatching sub-frames through it in a loop.

Take the reference before queueing and release it again when the queueing
fails.  That is the ownership rule the rest of the tree follows, including
the raw-socket copy in this same file:

	if (sock_queue_rcv_skb(sk, nskb))
		kfree_skb(nskb);

sock_queue_rcv_skb() does not free the skb on any of its failure paths, so
the explicit kfree_skb() balances only the reference taken here.

How this was found: by AI-driven fuzzing built on top of syzkaller.  Its
analysis was then checked by hand against the code, the fault was
reproduced
on net.git main under KASAN, and the patched kernel is clean on the same
reproducer with ordinary NFC LLCP traffic unaffected.

Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/nfc/llcp_core.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf81700..e988c95cc 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -922,14 +922,16 @@ static void nfc_llcp_recv_ui(struct nfc_llcp_local *local,
 
 	/* There is no sequence with UI frames */
 	skb_pull(skb, LLCP_HEADER_SIZE);
-	if (!sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
-		/*
-		 * UI frames will be freed from the socket layer, so we
-		 * need to keep them alive until someone receives them.
-		 */
-		skb_get(skb);
-	} else {
+	/*
+	 * UI frames will be freed from the socket layer, so we need to keep
+	 * them alive until someone receives them.  Take the reference before
+	 * the skb is queued: once it is on the receive queue a concurrent
+	 * recvmsg() may already have freed it.
+	 */
+	skb_get(skb);
+	if (sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
 		pr_err("Receive queue is full\n");
+		kfree_skb(skb);
 	}
 
 	nfc_llcp_sock_put(llcp_sock);
@@ -1136,14 +1138,17 @@ static void nfc_llcp_recv_hdlc(struct nfc_llcp_local *local,
 			pr_err("Received out of sequence I PDU\n");
 
 		skb_pull(skb, LLCP_HEADER_SIZE + LLCP_SEQUENCE_SIZE);
-		if (!sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
-			/*
-			 * I frames will be freed from the socket layer, so we
-			 * need to keep them alive until someone receives them.
-			 */
-			skb_get(skb);
-		} else {
+		/*
+		 * I frames will be freed from the socket layer, so we need to
+		 * keep them alive until someone receives them.  Take the
+		 * reference before the skb is queued: once it is on the
+		 * receive queue a concurrent recvmsg() may already have freed
+		 * it.
+		 */
+		skb_get(skb);
+		if (sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
 			pr_err("Receive queue is full\n");
+			kfree_skb(skb);
 		}
 	}
 
-- 
2.34.1

