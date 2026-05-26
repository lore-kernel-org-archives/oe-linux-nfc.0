Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA142C326F
	for <oe-linux-nfc@lists.linux.dev>; Tue, 26 May 2026 10:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791489; cv=none; b=DqAtVSTRIkhM5ypeInOm3ZUR4deMJdsoBg5DOtmeeyCFU+LGIC3Mb9pOZm7c640FJ+fSvYgRqroUVklj+LUCfk+hm2ajKiBsjgWmFhT3Sneu+7/eUYTgXljzJqhS3BpNvtnuhkU38q8POLsohQO/ly6MewyzszB9+KyFdKQqZNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791489; c=relaxed/simple;
	bh=eCUSq0yXcaXdss2t/OeDizEGW7NgwIY3Wb6Ip4WJApU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YdMLU1MG9B5DA98adJSRV/+6vLZDmLDBR2+KFyhUZ5sb0vpdZfisNBU+HQNaauKSMrxCoha4GHYlloZ0ccgQKAhJYKQbVQbTu9HsfWmaOhzt8MTro6ykHsDxzzqQE5fkirEBGaZcNP+9HS1ysaSY9gq5KBzimgTIoyu24ZNrQn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0dntxOb; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0dntxOb"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-8413ac3d82fso4776230b3a.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 26 May 2026 03:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779791488; x=1780396288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cfqSqHtgE1ylnsRBAV2SrbX9MosYsTB5633n9D4BIkU=;
        b=X0dntxOb6ywtQoWRgJi1M/onNMbSBhbSs91L+Yy8yP9AsZ/SMAHX1WPuipXnYcRw0P
         po9G6pZZdFnIEgU5c+t6CyupcqtYdDLej5CXNg4vBN80amZIMkOqTWVNiiQHD2XBTLOQ
         nbFhd8lcP9v/85YZHuW20BSc2GRRzVEMpHoWBIPRPjFPkIBh6SZmTCP+DTdB479EN9ag
         KRh+FsJYBGd7HZyWVZgycwCch0GcPiHWTid3rglO4BB4pVow4vvx9Na4MCRU67+sHmVp
         UCgT0PGg0QaHHpscN2q4ay59wItTKONmubRK1LzoYyV+lfg5AzM/DDcD/J4Bj4FW04mm
         VQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779791488; x=1780396288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfqSqHtgE1ylnsRBAV2SrbX9MosYsTB5633n9D4BIkU=;
        b=lZYLj6/e/fQK0DstQK4i2ixUkqH/fnA8ExWChpE43nlonmA8wYIpUh3yztUwN5y7tL
         JND6uXut8keU+jpLv1ksHOLVb9sV8OzPp8C+5TnIpA/2B6VQvL+hiAMOTb94ouC1+RLK
         sJdav52emh/68p2y5cXfDsSH+wMytsdjr0Y+DGlmpyyM6EP5LGLFGNwCippZjM1OtpaO
         ND7SfFYCbl4SKeJRM72njXyr30ROXJeRCMAKMc8HxJztmoiJti4wsS/SoPgxwUsXFs3h
         kJU6C7vqDWHVb81PekhUaW4NwY5RfQrMX8s4mo7xCP0aqMWyfkRy2R575rCkc1+unfjc
         Ddtw==
X-Gm-Message-State: AOJu0YwSb+xrRCSse9ysRraEsTtaaLyuLUEpcuJtZBp3iHT/6jq79Lek
	njYGQC/XDebmKtqO+DbI30s9zTnKxCOPQnYdja0CQ/oCh1oSv1GAeRaA
X-Gm-Gg: Acq92OHUCEsYzriGXcD6tiz+r36uSCQCPgURTOa0jDQL31ToVq/Q5UbqPYiEccTRrHu
	HSQVRND8qzBSNtxZs+6FEL22CjYcJnNWZmBUq3X0HoNZciAh3/iCSKAUU2DRaks0f625ttf4dfw
	M2GTn7Vxs60myR8GGE/JMPt4YvFwTABBMs2bYK/4Utnu9FXBQNL1AgQi7Y6hD+uqsDF7u7JF8ix
	gjnniDaxioNTT2kKFMI4bSSGQ/z63TFBlprsdx54ry+VuxtJJBtNcvXUrzea4Ec4tS1xeNcFhdY
	mUmh9IU+US4l6FIvNOct8mXZoKfQ4XkQEx352eKeRUfHIV/rFk/d8LvLkT447eB7CmZbqOpaA7I
	wtKMwiXgbDDGXBHy0mNOfZ1/3C4Hbc5+C9yAH/X1PhyY8XzeiTbpN2DqOEF1njNxpb0bC24DdRO
	i/yu2/Gk1mucKuueQT0AvW82vPGZh/8Y/OaxrH8WdNteGqRRdBgkl0PDA4Jz05jxdsKmQx+oCtW
	niVTLE84g==
X-Received: by 2002:a05:6a00:1822:b0:835:4776:7d69 with SMTP id d2e1a72fcca58-8415f38fd64mr17301068b3a.41.1779791487608;
        Tue, 26 May 2026 03:31:27 -0700 (PDT)
Received: from KIPREYXIAO-MC2.tencent.com ([43.132.141.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fd80cdsm14276188b3a.49.2026.05.26.03.31.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 May 2026 03:31:26 -0700 (PDT)
From: Zhenghang Xiao <kipreyyy@gmail.com>
To: David Heidelberg <david+nfc@ixit.cz>,
	Jakub Kicinski <kuba@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	Zhenghang Xiao <kipreyyy@gmail.com>
Subject: [PATCH nfc] nfc: nci: fix double completion race in nci_data_exchange_complete
Date: Tue, 26 May 2026 18:31:21 +0800
Message-ID: <20260526103121.47957-1-kipreyyy@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nci_close_device() and nci_rx_work can both call
nci_data_exchange_complete() concurrently.  After commit 4527025d440ce8
("nfc: nci: fix circular locking dependency in nci_close_device") moved
flush_workqueue(ndev->rx_wq) after mutex_unlock(&ndev->req_lock),
rx_work is no longer serialized with the explicit completion call in the
close path.  Both callers read the non-NULL callback pointer and invoke
rawsock_data_exchange_complete(), which calls sock_put() -- but only one
sock_hold() was taken, so the second sock_put() underflows the refcount
and frees the socket while it is still in use.

Replace the bare clear_bit(NCI_DATA_EXCHANGE) with
test_and_clear_bit() so that only the first caller proceeds to invoke
the callback.

Fixes: 4527025d440c ("nfc: nci: fix circular locking dependency in nci_close_device")
Signed-off-by: Zhenghang Xiao <kipreyyy@gmail.com>
---
 net/nfc/nci/data.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 5f98c73db5af..4253edea5c8d 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -46,11 +46,11 @@ void nci_data_exchange_complete(struct nci_dev *ndev, struct sk_buff *skb,
 	timer_delete_sync(&ndev->data_timer);
 	clear_bit(NCI_DATA_EXCHANGE_TO, &ndev->flags);
 
-	/* Mark the exchange as done before calling the callback.
-	 * The callback (e.g. rawsock_data_exchange_complete) may
-	 * want to immediately queue another data exchange.
-	 */
-	clear_bit(NCI_DATA_EXCHANGE, &ndev->flags);
+	/* Claim completion atomically -- both close and rx_work may race here */
+	if (!test_and_clear_bit(NCI_DATA_EXCHANGE, &ndev->flags)) {
+		kfree_skb(skb);
+		return;
+	}
 
 	if (cb) {
 		/* forward skb to nfc core */
-- 
2.50.1 (Apple Git-155)

