Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1F639DBD7
	for <oe-linux-nfc@lists.linux.dev>; Fri, 18 Sep 2026 01:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695232; cv=none; b=Dzja3u0Fv38qMwF10NOZSM1KsqzWOWddSOgd5kbPZPTGlBhkEz4eo4Pq+u3YArULqwyLhLzxDeGgmyCUXdvsGeUbfJdPVXHytEn25unzgLT68p/+nVdFhUNJ2l+jutQd4IC8KW6YlK3/tkX8Mi//h+5pAeHX4dqtQrMGUkR7G2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695232; c=relaxed/simple;
	bh=r6wg1fxuHJV5fVthhBMAQtpw90GcHVHZyZLGN4yf8h0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dhFzkr2h020vbDoXVOIT6pcBeuw3cLChtCYfV7k/aUN02067ujCThzNYN3T2ZE3N1EQRrQDm7nNiY9Y5WxTolnF4TxKjUFHDyMNvNJPsEusCMD2Z/yclCfZhBIcJsu/2fp84+yKPym1Bmgos94N2HUefGzttpt4oNULqt4HY3xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QESJ/Vrl; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QESJ/Vrl"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so2374775ad.3
        for <oe-linux-nfc@lists.linux.dev>; Thu, 17 Sep 2026 18:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789695229; x=1790300029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkXkRtAByi7EwmQiCmqbYZQrF7WUF4/7cAMEO1mUpMw=;
        b=QESJ/VrlZfwDYpitROUHLlJenhoneHB+8kaitYeMyaw8LcGDHUp4TccSGA6Ra2EjnC
         U8RizDV01dd6+tm1eUO+77esgg7QZU2gbyR2JPn3rBD/X0l0AXtP17vGJaMPyXCjPVDV
         qzTN0m9h6TV9mmNN9fIKVY9oQbekPbOBkd2AxtLfwavj/mtdynnHZU9ltHP+5Zvsu+Lb
         YmXLSE9g2Vb79pmCKM6WdLt6aoERLPQWVRIK9l+uKfqKH3MKF55yaQckm/7iionPy/hx
         PUQQwwEkazzfWYXRFZllKFiSwvr9oSLrO8C9yy7H1GjtcQO4O2dVWo7gqzPzZ50kFQ9/
         cuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695229; x=1790300029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkXkRtAByi7EwmQiCmqbYZQrF7WUF4/7cAMEO1mUpMw=;
        b=o6DYmZcklhnkPmLjMqxAuYexAEfY3vpyk5vp+JGlAmEhX42lGQ15xts4/JZVkXX4In
         giKZNCKsLs8MUNSxgSATcV6XIy9FSleQ77PtG/myLREDuXKWQlNOSZvxXJcBRb7UZGkG
         9hyL2c6qhNKANeMMRj4sNbNHPVZ70C5gbs2mF96bgj/wTOx/4qpWn9kMKlAjefkQo5uB
         57urKFGTbQAcYIl6txPAk1+m8nJOeC+2PSNlu9pnzqIyzD/fAg+6wEQAE1P4kjEuyMdm
         zVML29BZNkXheoBAXV4Svnhtrh9dDdmZk4nsB0tR3zoHL+7UIzThc2jeKxHZSn6gEjZK
         IY2w==
X-Forwarded-Encrypted: i=1; AKwUvByhwXIZnVt/y9Za7ZjZ5sirfZdQ9nTiCtNd+6AdVebAZ/nfp+XX087pTxBNCZB2f9kuUYtVV8kXdJwuoHQ=@lists.linux.dev
X-Gm-Message-State: AFuF++nQGulBGgZooksup8Yg3L848xPmNbk+1q2UBLVKvy4/TFOIB+1H
	KJTkKR1ZBURHtvAXCVPck8ay0K3PMtA3L3lkZ7pdCxuPxj/5ICtdTOXK
X-Gm-Gg: AYBFou2vM9TZjgtAQEujV5qcKczxU79OF1DU/Ljkw4AYzf6bIlHsttrpCEGFYoIbSK8
	r9mkX+iS/Zs7xNJiuYy1modRwLF0eAWIiWsf3QyaolV0LJghLRNJVOzBTyKtezlkiiVLhgNyXC7
	YkbV1LPzK1uDp/zSUC5r3u7kWfqD/2XYa9iuWuUkJUBFNB8hhC78X0unYbQsodAC0GAcc5PZKcB
	TXgOaqpB7ZACrgxumt26+OLJpzErqcYceqOZq/W79u4V7P5OGMsmZjeGRGBGQzzCMbyvdHQCxne
	RhJj01nDpYwqIXpBXhF6/cjvA+5g1Njv3+SiOSLFjGEI2bzrTlgDEVz2bEJpB/NHZz5x9r0Q367
	RzBLwX2TSAsx0nmfT1AWEGVvRELC4DiDz9Frtl1Ohrr3jJ0Ss2al0jj3l47VFRiTCezv+bRVupJ
	FFcFlOZ9ljLXWXOKhQfkeir34qMFinDwg4LF7LKSMZUFTKPn/WuKMb2yldVMlM6evWnniUOy5cs
	3g2Yy3eLj5swWbqBuw/GOQGWOBNcyB1vQB3QtEAGyoP7/4zbQ==
X-Received: by 2002:a17:90b:5885:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-39e54cb0e29mr2306656a91.3.1789695228974;
        Thu, 17 Sep 2026 18:33:48 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:e17f:a362:fc0a:a2ab])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2872052fsm40520eec.11.2026.09.17.18.33.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 18:33:48 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/1] nfc: nci: ignore unexpected CORE_RESET_NTF
Date: Fri, 18 Sep 2026 09:33:37 +0800
Message-ID: <20260918013337.82214-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918013337.82214-1-ndaugoing@gmail.com>
References: <20260918013337.82214-1-ndaugoing@gmail.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuchao Zhang <ndaugoing@gmail.com>

Commit bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
added handling of CORE_RESET_NTF in nci_core_reset_ntf_packet(). When
received, it updates ndev->nci_ver, ndev->manufact_id, and
ndev->manufact_specific_info, and calls nci_req_complete(ndev,
NCI_STATUS_OK) to finish the pending reset request.

However, unlike other notification handlers in ntf.c (which validate
ndev->state before completing requests), nci_core_reset_ntf_packet()
does not check whether a core reset request is actually pending.
If an unsolicited or delayed CORE_RESET_NTF arrives (e.g. after a reset
command times out or from a misbehaving NFCC), it unconditionally:
1. Completes whatever request is currently in-flight (such as CORE_INIT,
   RF_DISCOVER, or CONN_CREATE) with NCI_STATUS_OK, leading to kernel
   state desynchronization.
2. Overwrites ndev->nci_ver and manufacturer info. Because
   ndev->nci_ver is used as a selector for subsequent packet formats
   and parsers (e.g., in nci_open_device() and nci_core_init_rsp_packet()),
   unexpectedly modifying it can cause protocol format confusion.

Introduce an NCI_RESET_PENDING flag to ensure CORE_RESET_NTF is only
processed when a reset command is actively awaiting it:
- Set NCI_RESET_PENDING in nci_reset_req() when sending CORE_RESET_CMD.
- In nci_core_reset_rsp_packet(), if the reset failed or if handling
  NCI 1.x (where no notification is expected), clear NCI_RESET_PENDING
  and complete the request immediately.
- In __nci_request(), ensure NCI_RESET_PENDING is cleared upon request
  completion, cancellation, or timeout.
- In nci_core_reset_ntf_packet(), check and clear NCI_RESET_PENDING
  before updating device fields and completing the request. If the flag
  is not set, log a warning and drop the packet.

Fixes: bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
Cc: stable@vger.kernel.org
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
 include/net/nfc/nci_core.h |  1 +
 net/nfc/nci/core.c         |  3 +++
 net/nfc/nci/ntf.c          |  5 +++++
 net/nfc/nci/rsp.c          | 15 ++++++++++-----
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 664d5058e66e..504ea91ddf27 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -31,6 +31,7 @@ enum nci_flag {
 	NCI_DATA_EXCHANGE,
 	NCI_DATA_EXCHANGE_TO,
 	NCI_UNREG,
+	NCI_RESET_PENDING,
 };
 
 /* NCI device states */
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 5f46c4b5720f..5a90591cd9af 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -134,6 +134,7 @@ static int __nci_request(struct nci_dev *ndev,
 	}
 
 	ndev->req_status = ndev->req_result = 0;
+	clear_bit(NCI_RESET_PENDING, &ndev->flags);
 
 	return rc;
 }
@@ -163,6 +164,8 @@ static void nci_reset_req(struct nci_dev *ndev, const void *opt)
 {
 	struct nci_core_reset_cmd cmd;
 
+	set_bit(NCI_RESET_PENDING, &ndev->flags);
+
 	cmd.reset_type = NCI_RESET_TYPE_RESET_CONFIG;
 	nci_send_cmd(ndev, NCI_OP_CORE_RESET_CMD, 1, &cmd);
 }
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index f5c9a8ab7ec1..69bc9047f057 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -36,6 +36,11 @@ static int nci_core_reset_ntf_packet(struct nci_dev *ndev,
 	if (skb->len < sizeof(struct nci_core_reset_ntf))
 		return -EINVAL;
 
+	if (!test_and_clear_bit(NCI_RESET_PENDING, &ndev->flags)) {
+		pr_warn_ratelimited("unexpected CORE_RESET_NTF\n");
+		return -EINVAL;
+	}
+
 	ntf = (struct nci_core_reset_ntf *)skb->data;
 
 	ndev->nci_ver = ntf->nci_ver;
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index b0ab4f5acbce..a4bfe14372a8 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -32,14 +32,19 @@ static void nci_core_reset_rsp_packet(struct nci_dev *ndev,
 
 	pr_debug("status 0x%x\n", rsp->status);
 
+	if (rsp->status != NCI_STATUS_OK) {
+		clear_bit(NCI_RESET_PENDING, &ndev->flags);
+		nci_req_complete(ndev, rsp->status);
+		return;
+	}
+
 	/* Handle NCI 1.x ver */
 	if (skb->len != 1) {
-		if (rsp->status == NCI_STATUS_OK) {
-			ndev->nci_ver = rsp->nci_ver;
-			pr_debug("nci_ver 0x%x, config_status 0x%x\n",
-				 rsp->nci_ver, rsp->config_status);
-		}
+		ndev->nci_ver = rsp->nci_ver;
+		pr_debug("nci_ver 0x%x, config_status 0x%x\n",
+			 rsp->nci_ver, rsp->config_status);
 
+		clear_bit(NCI_RESET_PENDING, &ndev->flags);
 		nci_req_complete(ndev, rsp->status);
 	}
 }
-- 
2.53.0

