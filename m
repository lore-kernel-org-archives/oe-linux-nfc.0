Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786851;
	b=2/AKeoTQpwj3vJH/PzI1U0RLPAaSZ0DMcOOF9I5PJ5r1QfkO0ZNLeUiVAuwPLTzX3jGM
	 gdgQtJAOIDWMnuAw9wKCQPyfABjAgpcUVmCveZ34lmHMP6vK+0X7/pOpClvJXbQKGgE0h
	 cPd4LUjgXJGs3xjF4lEr10bx1yi2/r19npbJhYgu9a/BI2sdoBTunRszo255cX3udmekL
	 aBH0cyevK8oqSL4f1s3kE0ISIcdNh+IXQjh8kjqknWD5ECiuHdAEKJbLQUe7WAhrLn13a
	 OKWTetBeXiCpPaMb8kKUZVV35VuR/dN/IygEtQlW6cKJBlJaknm6GxkL+kTGOZEOPKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0AJWIA7czH9GdbmE5y7jSRhzHXqcVcwTzc1B62BZZmE=;
	b=dQrocjwK0UY9iODSpKgWoz5StFZSPYNTUDXYL/YWElrY5srPdToP6g/JlDZOm4zjrYXT
	 5Wh2gbC0gtsjMyBxJ5TUfCWon/RPDqKem0ln3aNHfJXnQC17823LZkPF8Zvc9p4v6OnS6
	 9PBNutmVhPu/RJNYuN6xuev4758Ftrqg0USwLOTJnk02uAOWfm8tWDfRIx49JQKqXLPHB
	 uzkB9HNcQwGb1PoPtT/3NSfoGU/FrblyT/dq80P7UcJswOZRKEyvgCgxLaMPj897W0MSt
	 fXUiPKCuybRhrkJEWCcH4rIuwZXsTzu6KiH2WoAEp2Ni7xCQ7fQRd81tmQ/5VimrVwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAp76nUY;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92074606A321
	for <oe-linux-nfc@lists.linux.dev>; Fri, 27 Nov 2026 13:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92074606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAp76nUY
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so5955216b3a.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 27 Nov 2026 05:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786851; x=1796391651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0AJWIA7czH9GdbmE5y7jSRhzHXqcVcwTzc1B62BZZmE=;
        b=DAp76nUYPvJBn8sE/3AK8CShsb8Ly1P0qMoiDIcOYW7cWRQdox+jhlwA4BKl0Uses1
         DtLk3I+tNF6W4ym9nyLWwsCQKyTfkkHp5w0SpOJxmpdlSa/cZg8W5PAsziO0hYDn4D6o
         JQg33qhhEoVE8O4eg20MvgEQD2tFyIoQTcP5cupzxpRMVEvJ/ux0UydvzxREVcv7lChs
         LUoumRT3zGMTrhehJXG4p83kaqUYco/ZmWDQfkYtrjMwI2rW++LHEttp1Hx0cvrUqczC
         4/Y+eoUCueuiRlDoYHZq8TMND5qYDcIrJks3ok1caQ5os95LC1OQgzYI0GrCIfJzn3Qh
         6ACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786851; x=1796391651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0AJWIA7czH9GdbmE5y7jSRhzHXqcVcwTzc1B62BZZmE=;
        b=ZsePrwYas6j9zKTh5ZvxXW53p6n6BcXwOWtYpqIMjlzAgeHDdB+gQ2tC4DhmfmHfRr
         w7PD5plpMqmhVvM8zsWFrEYT+SqxTGAL506Mv1ZP053PFRMTF7cZXA862pAgAzK18odO
         XvVE84Lddn2MKxwidx+7rJUl/8T6QmEdO6bTL+103J6zoRTS5UuTyva94Y9N3XF4cQ97
         eMcrXycM/nvzTd9CzLyEmshzhk3HoRAo7wq8RUHwHPfM9HYKJ2EimugmXPTdlGcObHGh
         FcLKeTicbZ4FN9y5rFdP1GYDFlzk4Sc4rglcvGlidKnS6i9SJLcSnCUjH5xl1RWL6NUk
         llAQ==
X-Gm-Message-State: APuU4Z+kBku6bEK2/pwaKXRfPFDbjpyflAM/OT2PvfRWKidAls2HaXd+
	15hgsBfg11hnpVNSsD/e8jos1c6qNpeI/5saQk5s5PtmYpsoXVYBiyvZkUrvml28S5vAuNCE
X-Gm-Gg: AZFdTZeMwfAVKAofJcntrCURnwqOe7T8lE24FwXnilf3rE7yG8icPSE6N8mtm7pmfgn
	7ZJLn15Viiq//QcDhWbnTCpCR9nL5WiQe6/CDQAgnBXsXYcsixaYvG4dvWHOtEyZIqMdHhRK3Wr
	kXtKttHA1NMOqzphRZb3eUvmT3zcppkl1aLbrwihWLVGt27D0rwVgU1td2/sUG4oNh/QsZAJk/m
	A0Hfw7RTOYPo0EoKvGQLnw+pOcxcd7K5wxjfRWkc+RzF90riQeR2yW3HKuHRcCoJMFkKLP4vllu
	hPnghuU40G/137XffblkUS0pWMrgZGCwOPkN8LZCUoHXuGmHNPQbfA+WGTzdHBmoUTo9woYBBHm
	Cv6PQERcptIJWg+fmZVAM3MU7+izVorQvLEuxn7eAD0i7tTGhCwoSYALJ8Dnn+jQYdlZ2A/YmnL
	S31fnMy2HZkJZpL4w2iNz+XXaFpGK6QgYHEoFMNa0LH1dAA4JHoBpsYgfubCWk9k8F37EByxA/Q
	KBEEr7TkvzLvgljbQqP1ah/exexYgd4d62IqNgXs5IbYykAIw0skPswGdsHVKCn3E5joMLANU0N
	lo/dbWDETq3CXjIFAi1DPMQT0H+FW1kdzSxCltgl020uzQJiRrklqmGYg2qnSXfhCw5pf+LuJpy
	V5SpG3UTseqOIRKsPLGu7aoRYwVvbej2myZniyDQvsknpCxA+xzUjSmILjbgkeSyfpDKN4oDes4
	hKok6mg8p8KtDHMi/S5L8MsluPgD7QwOxKapNYi7Q=
X-Received: by 2002:a05:6a00:414e:b0:8bd:281a:5cb0 with SMTP id d2e1a72fcca58-8c8796a7bb0mr21771676b3a.6.1795786850971;
        Fri, 27 Nov 2026 05:40:50 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285b60csm12705838b3a.9.2026.11.27.05.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:40:50 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 4/5] nfc: nci: drop stale rx_data_reassembly on errors, timeout, and close
Date: Fri, 27 Nov 2026 21:40:28 +0800
Message-ID: <20261127134029.1813-5-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261127134029.1813-1-luob87709@gmail.com>
References: <20261127134029.1813-1-luob87709@gmail.com>
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

When an NCI data exchange receives a partial NCI_PBF_CONT fragment into
ndev->rx_data_reassembly and then terminates due to a data-status error,
CORE_INTERFACE_ERROR_NTF, data-exchange timeout, or device close, the
buffered fragment is left behind. On subsequent packets or after a
close/reopen cycle (including listen/target mode, where
NCI_DATA_EXCHANGE is never set), stale bytes are prepended to later
responses or leaked until device free.

Drop and clear ndev->rx_data_reassembly on all four paths:
- In nci_add_rx_data_frag() when a nonzero data status is received.
- Unconditionally in nci_core_conn_intf_error_ntf_packet() before the
  NCI_DATA_EXCHANGE check, matching nci_rf_deactivate_ntf_packet() so
  target mode is covered too.
- In nci_rx_work() when handling a data-exchange timeout.
- In nci_close_device() after flush_workqueue(ndev->rx_wq) on both
  close paths, guarded by req_lock and !NCI_UP.

Found by static call-chain audit and code inspection.

Fixes: 6a2968aaf50c ("NFC: basic NCI protocol implementation")
Fixes: 004161cb52ac ("NFC: Handle error during NCI data exchange")
Fixes: c4bf98b220cb ("NFC: Add NCI data exchange timer")
Fixes: 98ff416f97c5 ("NFC: nci: Add status byte management in case of error.")
Cc: stable@vger.kernel.org
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
 net/nfc/nci/core.c | 15 +++++++++++++--
 net/nfc/nci/data.c |  2 ++
 net/nfc/nci/ntf.c  |  4 ++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index efd4e5e..f832251 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -582,7 +582,7 @@ static int nci_close_device(struct nci_dev *ndev)
 						   ndev->cur_conn_id,
 						   -ENODEV);
 		mutex_unlock(&ndev->req_lock);
-		return 0;
+		goto flush_rx;
 	}
 
 	/* Drop RX and TX queues */
@@ -622,9 +622,17 @@ static int nci_close_device(struct nci_dev *ndev)
 
 	mutex_unlock(&ndev->req_lock);
 
+flush_rx:
 	/* rx_work may take req_lock via nci_deactivate_target */
 	flush_workqueue(ndev->rx_wq);
 
+	mutex_lock(&ndev->req_lock);
+	if (!test_bit(NCI_UP, &ndev->flags)) {
+		kfree_skb(ndev->rx_data_reassembly);
+		ndev->rx_data_reassembly = NULL;
+	}
+	mutex_unlock(&ndev->req_lock);
+
 	return 0;
 }
 
@@ -1607,10 +1615,13 @@ static void nci_rx_work(struct work_struct *work)
 	/* check if a data exchange timeout has occurred */
 	if (test_bit(NCI_DATA_EXCHANGE_TO, &ndev->flags)) {
 		/* complete the data exchange transaction, if exists */
-		if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags))
+		if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags)) {
+			kfree_skb(ndev->rx_data_reassembly);
+			ndev->rx_data_reassembly = NULL;
 			nci_data_exchange_complete(ndev, NULL,
 						   ndev->cur_conn_id,
 						   -ETIMEDOUT);
+		}
 
 		clear_bit(NCI_DATA_EXCHANGE_TO, &ndev->flags);
 	}
diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 4253ede..3bbebb9 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -220,6 +220,8 @@ static void nci_add_rx_data_frag(struct nci_dev *ndev,
 
 	if (status) {
 		err = status;
+		kfree_skb(ndev->rx_data_reassembly);
+		ndev->rx_data_reassembly = NULL;
 		goto exit;
 	}
 
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index f5c9a8a..3ca1009 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -132,6 +132,10 @@ static int nci_core_conn_intf_error_ntf_packet(struct nci_dev *ndev,
 
 	pr_debug("status 0x%x, conn_id %d\n", ntf->status, ntf->conn_id);
 
+	/* drop partial rx data packet */
+	kfree_skb(ndev->rx_data_reassembly);
+	ndev->rx_data_reassembly = NULL;
+
 	/* complete the data exchange transaction, if exists */
 	if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags))
 		nci_data_exchange_complete(ndev, NULL, ntf->conn_id, -EIO);
-- 
2.51.0.windows.1

