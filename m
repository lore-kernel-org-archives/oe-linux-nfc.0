Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67DD310645
	for <oe-linux-nfc@lists.linux.dev>; Mon, 22 Jun 2026 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139992; cv=none; b=jWTmLRcJl3HA3Uu9kTUFGl0E8n6SfUR8MC9Ze1t8YemFQk0MicSTm0B59dwywqt51PRSpIwqy8+DKLCvjWliCpucVHDeIVTzgwUu/jwCBDeMuTzvv3ABBiusqGq98gMV6NgzZc4uAF4h0VZVcqBzBcNCKOsz0WmdCqsUvd5pTc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139992; c=relaxed/simple;
	bh=Xy59s+JNRnmSM6VzrGtWFcxa0uMF9TCT4hk6jnMbGwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AZdWcWv689AZozUmQ9ABlHbsk+dQ3UFzkQDhlk0JStEi3jPPr8p/FusAzoKuOfnHC2cALp4nlfouwRsP2boCSJPTyGD/dXbLIeNhU+JJSFPL07E8JQt2CYHCLnRvwXdBxg/gOi7XCxuyRLaxW9uGViE3MVT1Bc0WSOj0BzxXQsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=eYRdKkxJ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="eYRdKkxJ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69532288224so8629984a12.0
        for <oe-linux-nfc@lists.linux.dev>; Mon, 22 Jun 2026 07:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1782139989; x=1782744789; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a+82Wee9YcYFC/CDtK+GzldKM6pWgg161oAknThGH2Q=;
        b=eYRdKkxJB1Y7xEgZX/tZJds2WFDe7Ko5bxgMsnei/S0fB7FayhiA5LZ19HatUrCAQ2
         nOAS1naHgPyuXtSmNp46MnZmM53eX3VQLIeXHeeMXwfaqxNbF2TCNf46JuixnXOrntb5
         Vm6u77xPCYaSB+UaVLpFhALTzLUXLjSlE/kFCmxkLtrNUgoCbiBJJ3YXOi8cu0N4BV9A
         GC5wOV1wOWRFBcwK6L/+FkpnT9gpBldXnf+p7D7AbTm5JpIQtSJhPLybKze/VYtUBsPJ
         wItgGhlyk36c+RCiShmE6X+8PU4bR6yG9IcXN8N7W7xh8mphOTa3eczWltrXOTpNK4T/
         tyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139989; x=1782744789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+82Wee9YcYFC/CDtK+GzldKM6pWgg161oAknThGH2Q=;
        b=VUXO9vm6i8kPy1OMnFeKLmAb61QF1pXnT2ousvNydtlJpidAnEXQWIZt2azxqoIoPt
         hW3cLbdUZurNTU8D0BWk1BRWJL6daugwZZnsxdy6PwivHcWyKi2O4BQx0J1tx9yeH/Ik
         3lolHIGLuSnZcnMWa0anr6BetjNfh8hrbbhDG7Unp4Fb7MLE4jpLKBsAOrsZrQAdjhgW
         Mge5owJ1dIfcGIsZ+B8E7kBaN6vI8sKeoJOtVJHrZsWuafAERWs8mP24GmFRxe0kzIOf
         DZ7iTOFZtwdGI9JrGSsOYaoGjuIBJeAlOP3HNZdwc0uMOYUZ4Tae+90eoFf9XrNiWPCC
         mXfA==
X-Forwarded-Encrypted: i=1; AFNElJ8sEhnK2pr6ZiBdsO0eUxDPzwGlDxPBotQCmCmBHfq+Rt7z61W9XJxn81NANNV5Q0IyJnihmBh7MtcEL1w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxhOmNpav0v1gZw2Q0uLexE2h24Wct5vVKRkbUnKA/NJ2s2HQC
	uwLi+Bq+9v0TcNYd++NXQHCqAjq1P25tA5xbsv56+teKpGAck6EBc+enap3qZ2Dp4YPn
X-Gm-Gg: AfdE7cmSj0LkGFZcgdd4qNGrGgisL9RiIyYXqvUhO8Y9jHgbBSC2j25bzOWs0GfZl3+
	TVI+p2zAfKOk1fnylkejeXB3zBiRS+M4F1o2G4JMGoh15KqTPOEWq5y5L6JV+j/f/TGbt/CEj4Z
	FYOLNDM47KIs/rDa181YsB6l4drrWGsBglGgMaYE9X/L6ajby2HONCVQyplcA0f9CFfQCJOVJEV
	+eUq1y73ZiDcb1lfpUrCmUqji+2C4wzIEAWVXGXZfIDpzd4afQ9wNn6JdSaa3tZivxC2SCgdt+A
	ufOjUxQkM3WejqEK0pSNJ6kMO0pngrk91naVLlgZ5bh/82MzluybhDeI65vaKcFNnHZNYZwFvFs
	CiWpM5amjlOzkTWHpvYq4BPvoQ1ewmzbzbVB8lgWzWpkIra2WTgm3iU3V+mUNHVvJwSH3GLBU3N
	uW
X-Received: by 2002:a05:6402:2116:b0:662:ac7e:aac9 with SMTP id 4fb4d7f45d1cf-6975678925emr6317263a12.20.1782139989329;
        Mon, 22 Jun 2026 07:53:09 -0700 (PDT)
Received: from localhost ([2a06:61c2:d427:0:b321:1c7a:b072:326e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82fa67sm3680336a12.4.2026.06.22.07.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:53:08 -0700 (PDT)
From: Samuel Page <sam@bynar.io>
To: David Heidelberg <david@ixit.cz>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Samuel Page <sam@bynar.io>
Subject: [PATCH net] nfc: nci: fix out-of-bounds write in nci_target_auto_activated()
Date: Mon, 22 Jun 2026 16:52:43 +0200
Message-ID: <20260622145243.3167276-1-sam@bynar.io>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nci_target_auto_activated() appends a target to the fixed-size array
ndev->targets[NCI_MAX_DISCOVERED_TARGETS] and increments ndev->n_targets
without first checking the array is full; unlike its sibling
nci_add_new_target(), which bails out when n_targets already equals
NCI_MAX_DISCOVERED_TARGETS.

ndev->n_targets is only cleared by nci_clear_target_list(), so an NFCC
that repeatedly re-runs discovery (RF_DISCOVER_RSP, which re-enters
NCI_DISCOVERY without clearing the target list) and reports an
auto-activated target (RF_INTF_ACTIVATED_NTF) drives n_targets past the
limit. The append then writes a struct nfc_target past the end of the
array (a slab out-of-bounds write), and nfc_targets_found() goes on to
walk the array with the inflated count:

  BUG: KASAN: slab-out-of-bounds in nci_add_new_protocol+0x94/0x2ac [nci]
  Write of size 2 at addr ffff0000c7299a18 by task kworker/u8:0/12
  Workqueue: nfc0_nci_rx_wq nci_rx_work [nci]
  Call trace:
   nci_add_new_protocol+0x94/0x2ac [nci]
   nci_ntf_packet+0xddc/0x11a0 [nci]
   nci_rx_work+0x15c/0x1e0 [nci]
   process_one_work+0x2dc/0x500
   worker_thread+0x240/0x460
   kthread+0x1c0/0x1d0
   ret_from_fork+0x10/0x20

  The buggy address belongs to the cache kmalloc-2k of size 2048
  The buggy address is located 1024 bytes to the right of
  allocated 1560-byte region [ffff0000c7299000, ffff0000c7299618)

Guard nci_target_auto_activated() with the same check used by
nci_add_new_target().

Fixes: 019c4fbaa790 ("NFC: Add NCI multiple targets support")
Cc: stable@vger.kernel.org
Assisted-by: Bynario AI
Signed-off-by: Samuel Page <sam@bynar.io>
---
 net/nfc/nci/ntf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index c96512bb8653..566ca839fa48 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -603,6 +603,12 @@ static void nci_target_auto_activated(struct nci_dev *ndev,
 	struct nfc_target *target;
 	int rc;
 
+	/* This is a new target, check if we've enough room */
+	if (ndev->n_targets == NCI_MAX_DISCOVERED_TARGETS) {
+		pr_debug("not enough room, ignoring new target...\n");
+		return;
+	}
+
 	target = &ndev->targets[ndev->n_targets];
 
 	rc = nci_add_new_protocol(ndev, target, ntf->rf_protocol,

base-commit: 47186409c092cd7dd70350999186c700233e854d
-- 
2.54.0

