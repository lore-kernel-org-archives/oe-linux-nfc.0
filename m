Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE5E3A7F51
	for <oe-linux-nfc@lists.linux.dev>; Wed, 14 Oct 2026 05:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791956488; cv=none; b=H+fR0GZPk9ycbQDFJUn39HDUVtVQP1DFum8A/BvvGD1u+1VdXogzA98CZ2haD8aYRr5lsFnQBZUJj/pFyjjZ7gGPUvqcHKkVM0ku0QSMBxSMBCEwLZnHanAK74418o8W+y1P8kEEcyQr31GXXptmlFZE5SnNz9KUA/xxk+9gF+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791956488; c=relaxed/simple;
	bh=UiCMp9/mbXDOv9B80OTIXeVoRdGMfKk6pMvkikdtARs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jBgW9nqSpB+bqL4t/I0wFChkpWi60QNnqVGNPlVIqq8cCTC981RR/7bKhDmvykql8dGUlw41EcQ/IEVTC1o4EINoXhYPAglQriK1ApXsPkjNPpUT3mMlPo9i7hyzcsUVjV9/rxxdVXraS5rGWHtDjOfcKbWyGdKgjpAGdUzI/b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jysLP5LN; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jysLP5LN"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so870254c88.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 13 Oct 2026 22:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791956487; x=1792561287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/zFJfII781OXM3XVdyaHXmQsNX/Uoncqqxm/Oj8RxVE=;
        b=jysLP5LN28jO8fQgHdsersnOWlPKj9zJQXjSSU9y3OyE3MkzcWzpJ6FYqW/TJNE3T5
         xz+hF71ZRnbMtjFYosD1rZ5J3G8LNxK2ruwlWUQ0mvoV1k/TY9GFONreZibu0iLP5Zzm
         ALvzN36tQUOCP6H4NyY2007iQoz4jAdXTGAWkz061Ndzf9Qxutmefr2MuGaLtkzHkNHJ
         aVjqQ1TL7Yl6d54AVO/pZqVC5cahTShyglrZrKXJJBszSxdqB6BUwhi+oENE41247+v3
         zQzzmdHHn+2VLL64HydGqvd0uq4Ic1YpL1+9WEU2Bpllp56JbM27QXhiwCkoPkB3OvLW
         D6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791956487; x=1792561287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/zFJfII781OXM3XVdyaHXmQsNX/Uoncqqxm/Oj8RxVE=;
        b=snx48y/iH4DX4YfMK2c3aUVrYVLkl4AxdOPelFKh2Fbgl2I0sM6wYJ2EUC9GRP7C28
         wbvCcmD89bdj96asDcYVZKYag+w29hvJWP+gWG7gLLhPwlCaCbkeYLixWZi8mOGjogUd
         JD4153BVPRo8b4CbneKFVm2FjXmXiE/mK/SRUK2wf5EdNtsj2loS5hRxOKSEHF6siFGo
         2e6YrqNwv6Ldp2p+d/WTXQjs/HIHlVyyp19H66aslkhKNbU1G1M/Seagqf8yzEHtKzyn
         Cq1uzCdAM1/zJjv9keYMbuqbm8TUMBRVH4+k5teg065rbGKnIa/Uuc0bXa38eJyYh3mm
         3poQ==
X-Gm-Message-State: AFq9FYJ9PYWudWBSb9BQQQOgJGgjCGIxCSu6YqmISOP94rij19kY3oZB
	0liCKhoKG09qG8wxXRLfGDM5GUGuTGw9U7ml9ykymUr9mmfEZK72hLgw
X-Gm-Gg: AYBFou3IjjTC8CWujcjw5tHixI7Zy+O7YpqdlaaoesozwgAfTBoQPOavx9IB6EF4LNO
	06Rn43PbeuQ+swL1Y7HjI67TJETP5fn08gf4Gqtjkd7l1xyqftdz8+xmJ3aMHMG4c+eeGPwNXzP
	P0J69WwbuKJQg829S7ZeDJCAPr0JZe5QriIwum4tokKlBZWMpzt1JAryY4vdJyANqT56okJgC/M
	weddTB5lcNENWv4nd0oiRin0rO9aJnfRs3Vvj78PtYYrFuBGpZYS9Z8aiyjYa1cnCZ0hsGAGf7Q
	8y2FbIAd+3V4cVYFDk3NAr5sWybS7v65XqfQbeSiXY253zzb0izLOYoIvyuXLcppVEvk2bi1Qkw
	z2zA1YYh+w5JqbN0XZJR3xfDbwE1mLOBIoQzcUmMFlcPD93Ic1KhteD6+I6JWI3iDEfftr+9ZWl
	rFA26qIQyVfxw1MHyiMuHVyXLr7RkaGxZvTz15K3dm5Gr822e9ajgwGauWEZKRS5f5vcTNgxC/n
	uW0tqv9
X-Received: by 2002:a05:701b:2091:10b0:143:2968:564c with SMTP id a92af1059eb24-16a6043be98mr21192916c88.26.1791956486625;
        Tue, 13 Oct 2026 22:41:26 -0700 (PDT)
Received: from Hruday.lan ([2409:4091:903b:c404:eaf9:32de:ddb8:3440])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1699718c547sm42313351c88.3.2026.10.13.22.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 22:41:26 -0700 (PDT)
From: Rahul Rao <shreeramrahul94@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+93f169a8e7d66864f800@syzkaller.appspotmail.com,
	Rahul Rao <shreeramrahul94@gmail.com>
Subject: [PATCH] nfc: pn533: fix slab-out-of-bounds read in pn533_recv_frame()
Date: Wed, 14 Oct 2026 11:10:13 +0530
Message-ID: <20261014054013.120482-1-shreeramrahul94@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In pn533_recv_frame(), dev->ops->rx_frame_size(skb->data) calculates
the expected frame length from the frame header, and then
print_hex_dump_debug() dumps the frame payload.

However, if an incoming USB URB delivers a malformed or truncated packet,
skb->len may be smaller than the minimum header size or smaller than the
declared frame length. When inspecting the frame or calling
print_hex_dump_debug(), this leads to an out-of-bounds read beyond the
allocated skb buffer.

Add sanity checks to verify that:
1. skb->len is at least dev->ops->rx_header_len before parsing frame sizes.
2. skb->len is at least frame_size before printing or validating the frame.

Reported-by: syzbot+93f169a8e7d66864f800@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=93f169a8e7d66864f800
Fixes: 9815c7cf22da ("NFC: pn533: Separate physical layer from the core implementation")
Signed-off-by: Rahul Rao <shreeramrahul94@gmail.com>
---
 drivers/nfc/pn533/pn533.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index b0133e51dce9..6b0005395b95 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -2178,6 +2178,8 @@ static int pn533_data_exchange_complete(struct pn533 *dev, void *_arg,
  */
 void pn533_recv_frame(struct pn533 *dev, struct sk_buff *skb, int status)
 {
+	int frame_size;
+
 	if (!dev->cmd)
 		goto sched_wq;
 
@@ -2193,12 +2195,29 @@ void pn533_recv_frame(struct pn533 *dev, struct sk_buff *skb, int status)
 		goto sched_wq;
 	}
 
+	/* Verify skb has enough bytes for the minimum RX header */
+	if (skb->len < dev->ops->rx_header_len) {
+		dev_err(dev->dev, "Frame too small (%d bytes)\n", skb->len);
+		dev->cmd->status = -EIO;
+		dev_kfree_skb(skb);
+		goto sched_wq;
+	}
+
 	if (pn533_rx_frame_is_ack(skb->data)) {
 		dev_dbg(dev->dev, "%s: Received ACK frame\n", __func__);
 		dev_kfree_skb(skb);
 		return;
 	}
 
+	frame_size = dev->ops->rx_frame_size(skb->data);
+	if (frame_size < 0 || skb->len < frame_size) {
+		dev_err(dev->dev, "Invalid or truncated frame (len=%d, expected=%d)\n",
+			skb->len, frame_size);
+		dev->cmd->status = -EIO;
+		dev_kfree_skb(skb);
+		goto sched_wq;
+	}
+
 	print_hex_dump_debug("PN533 RX: ", DUMP_PREFIX_NONE, 16, 1, skb->data,
 			     dev->ops->rx_frame_size(skb->data), false);
 
-- 
2.43.0

