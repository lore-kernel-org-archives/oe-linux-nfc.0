Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A633AD51C
	for <oe-linux-nfc@lists.linux.dev>; Wed, 14 Oct 2026 08:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966779; cv=none; b=c2AW4TNJq93a/4DOzPwNTN9C5xFwyAudjfJf6VICafpBO4GeXnSjd7BRlaW1uyaKQkVUADK2StDZLyLZVJzVm+9ntBC+lkQh0fZRksU1HUfF9jZlBQYgLXvfq+ejtuH9J6N9XzDnIFIWfq05nW3u5GTZ8UdRff0sBt92sqAiJHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966779; c=relaxed/simple;
	bh=QXfv7oHLhUhY9C5cnazY56Fw9rjVwnTel2t+VYCmWpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e6q+RTSiaYAoiee/x97sbfhP+Y0qIVEXeyzRhobqCDe6x91NQSaJrPDKzHcGgV+nTP0IxGTJI1pMREKD57fm2HRwKjZafa2rWzen9RKwaPmgrhEeZN7jmWwDebcCTzWBmGIRySpsPzuQFkYI++OInkA/xQxju/tw/oeCTtvOFc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rn+Upm6D; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rn+Upm6D"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab98332238so2090714a91.3
        for <oe-linux-nfc@lists.linux.dev>; Wed, 14 Oct 2026 01:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791966776; x=1792571576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYPI7OWeVGXSmmHTKBEjUpdac/OQBSSeGCeQqh4Sbw4=;
        b=Rn+Upm6DPgqh7HWxBUba5bcoL1akUBbB+gMgf1QpmPsww47rA3vLfJVacsmyBtX/7Z
         rfPsfEN5m0cELG6en9EuZZ5rfONLEMTSiGGTbDgNXE8aAtlVHAnzyhM7JrZq6In2zHJ/
         0xLasiH3vEQCFsFvxMTHq8aYfqNMOqFWfEaEjYGlwbF+uTRrmbnAN3y+p3dOp0125Xxu
         RFpJK+sURXm8AAfYlBXizix/1DE6xAnK+XSfpNmGB1GRpeoy+nChBX2JMTZ2/bCI8WKw
         t4wX/0F3grQhI/oAlcPNTgcysnUm5iNOT5jAyCjG57q4goqm3UNR6zDhdbcGkirneGsm
         0/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966776; x=1792571576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYPI7OWeVGXSmmHTKBEjUpdac/OQBSSeGCeQqh4Sbw4=;
        b=BKY940VaOx4A9to0t6JoOnJ2T10fg83gfTxhFmuQ9VihCMrpi0u5b01VYjdESTxINK
         gAVklmY2R6nQzRgd0c0zIDPtUMj9fnm/tI1Pou/7ZVQq0G8vyLm+7HuNCMXrRdxv3nSg
         l+1yGdre41N9WPVOHYy/24sF8xi3GEmCnp4Gm1WlaZPY+RAebkaYTFJXPbRX3QGbyXdF
         oJ87VCQZicIafvPlkVNC3Orqk5V8AZwllpmJfP26Mx5DUEI1BvQyxNfAAWoOj4dgRfSU
         K43Lyd5obpfVTiDgGx6d6X4FETAA8d0K3/8wL8XF0tUlR+RdN/fNAj1RdGUNAu7JO7RK
         o0SA==
X-Forwarded-Encrypted: i=1; AKwUvBy1biVpgw5Ov3QZ5Mt9YgAA9R3AlcuxzcKJOa2s3UpF/7gTV8vBHukSdc590DycsoxMqsPVzC+m5iCdPx0=@lists.linux.dev
X-Gm-Message-State: AFq9FYLSQsPaMBdLujIemaVQaHOOLxOckQPDFldegmnym903yAdWOZat
	y+s8XMyj8Ds9zKkJnoqUt4lP5NWWa6VsyH/DBFjLLtFFa3YTAyg8uAc8
X-Gm-Gg: AYBFou04IrIm2RbuLRNXG40g0rmLjWtZGAGsuBU2HxuJHkeVfZ2oX6ursmjr+g0S858
	v/EYO7g69S6XYGEUFvVNnIF505H4mhtD8x6Kk0NTSsbtpIu+uVoGtgwP88MHjKaSWwhqbrj1+zY
	RVO82Cpm9j5tnxVMz4Vvkf8uCnrIKJllCgL2DtIY89mSMNFJnbnxfJd6DARibw+6MbRwe/+gKrP
	GNAkwqNtzpNBTiPKntlj9GLsRnYj4u+hmEnCiYam56CLoXaKlIgIuSL7z9Ht1YqrQYzl+dF5jLX
	Wmz4dsaij2er+e+9avoIzoK8ys9T50FQUvRpG2iAsFs2G0Shz6SfkOEFyAkFDmETms5XNR6njkq
	5+F3zFlUSGUJcQnDy23qfvp3xe9k+ZiEgLCl/xnMeVhpxJyK9m+0VGH3erdfRjB0/X6N1c8meW4
	9oCcd36hxVdHDk2o75bWRsbVx4iZo+lZOIhYdObV4yaEsZ+YCQ+uWZAW2PSWDuI/qg1dBhA3c7o
	Ox/4iVdwg==
X-Received: by 2002:a17:90a:5184:b0:3ac:17c:6e82 with SMTP id 98e67ed59e1d1-3ac15d46137mr3909722a91.45.1791966775821;
        Wed, 14 Oct 2026 01:32:55 -0700 (PDT)
Received: from TheRealOne ([2409:40e1:cc:590c:6073:1121:77d0:14c1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac84dd4907sm61671a91.9.2026.10.14.01.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:32:55 -0700 (PDT)
From: Chandradhar Kumar <chandradhar.2003@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Michael Thalmeier <michael.thalmeier@hale.at>
Cc: syzbot+93f169a8e7d66864f800@syzkaller.appspotmail.com,
	Chandradhar Kumar <chandradhar.2003@gmail.com>,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] nfc: pn533: fix slab-out-of-bounds read in pn533_recv_frame()
Date: Wed, 14 Oct 2026 14:02:36 +0530
Message-ID: <20261014083239.144506-1-chandradhar.2003@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pn533_recv_frame() accesses skb->data to check for ACK frames, dump
the received frame via print_hex_dump_debug(), and validate the frame
without first verifying that skb->len contains enough bytes for the
frame header and payload. When a short or truncated USB packet is
received, this results in a slab-out-of-bounds read in
hex_dump_to_buffer() or during frame validation.

Fix this by verifying that skb->len is at least PN533_STD_FRAME_ACK_SIZE
before checking for an ACK frame, passing skb->len instead of the
unvalidated rx_frame_size() to print_hex_dump_debug(), and validating
that skb->len is large enough to hold the frame header and complete
frame before calling rx_is_frame_valid().

Fixes: 9815c7cf22da ("NFC: pn533: Separate physical layer from the core implementation")
Reported-by: syzbot+93f169a8e7d66864f800@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=93f169a8e7d66864f800
Signed-off-by: Chandradhar Kumar <chandradhar.2003@gmail.com>
---
 drivers/nfc/pn533/pn533.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index b0133e51dce9..c730a84f1c62 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -2193,6 +2193,13 @@ void pn533_recv_frame(struct pn533 *dev, struct sk_buff *skb, int status)
 		goto sched_wq;
 	}
 
+	if (skb->len < PN533_STD_FRAME_ACK_SIZE) {
+		nfc_err(dev->dev, "Received a too short frame\n");
+		dev->cmd->status = -EIO;
+		dev_kfree_skb(skb);
+		goto sched_wq;
+	}
+
 	if (pn533_rx_frame_is_ack(skb->data)) {
 		dev_dbg(dev->dev, "%s: Received ACK frame\n", __func__);
 		dev_kfree_skb(skb);
@@ -2200,9 +2207,12 @@ void pn533_recv_frame(struct pn533 *dev, struct sk_buff *skb, int status)
 	}
 
 	print_hex_dump_debug("PN533 RX: ", DUMP_PREFIX_NONE, 16, 1, skb->data,
-			     dev->ops->rx_frame_size(skb->data), false);
+			     skb->len, false);
 
-	if (!dev->ops->rx_is_frame_valid(skb->data, dev)) {
+	if (skb->len < PN533_STD_FRAME_HEADER_LEN + PN533_STD_FRAME_TAIL_LEN ||
+	    skb->len < dev->ops->rx_header_len ||
+	    skb->len < dev->ops->rx_frame_size(skb->data) ||
+	    !dev->ops->rx_is_frame_valid(skb->data, dev)) {
 		nfc_err(dev->dev, "Received an invalid frame\n");
 		dev->cmd->status = -EIO;
 	} else if (!pn533_rx_frame_is_cmd_response(dev, skb->data)) {
-- 
2.56.0

