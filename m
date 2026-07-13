Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BB430CD9E
	for <oe-linux-nfc@lists.linux.dev>; Mon, 13 Jul 2026 15:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958335; cv=none; b=biuUw5nGSR+cn4WPix8F4n/v1JIRwPTxk6lfPKv8MCm9eTnBK/5a4qaKtSRE+/MOlvnAsXD2lwLj73CJ2/ngRCS83WrTvN+9DxZ8RSBCpMF/XxAqBHrpCBEeK76UsQFosCGMhy8uUCpxMe0eu8tUwKnBAWtDQ/FYeM7MzsSjjOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958335; c=relaxed/simple;
	bh=UPM0BjavTHeN7FjPEDHtX5K0N+psJJcGHmtOEuf1xbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r95YtE7ytS/6oOn2QyNxoU/LJwUJejG+NNRRtQtO4Uecyf30GE0svuP0ObuKvMa4jllCxm2hRsf31srTa7NndK3iA31YCvLbHqek74dfEPfz6aQpIV1brC1jMLEmrBaBk5rn6QlQSQEHsBg8yERHaw7Y8gLinkm3DDoUZB++AQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=W3gYpWqO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="W3gYpWqO"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso13124675e9.1
        for <oe-linux-nfc@lists.linux.dev>; Mon, 13 Jul 2026 08:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1783958332; x=1784563132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fcync883JEMNF+UENDQLMgM7eZIOfrN4gu6gzZ2ECRE=;
        b=W3gYpWqOYt0N9tUDOnP/ORUOm4AY24KxJiw6+6n9viHOdpgfnHcxszVKhsb8BO2wTZ
         iSg28zCSGNvi23RjA2h/M/KILXWz3vFzkLBiinzY8nl3gbVHVACUyy0s10i5Gc+ChB4x
         Nd3kjv0N2WiOq9N55KR3Of+nZEy/Y5/TZLhJna28A8G0Ic1QnZXy6W6P8ec5F4GVVqlN
         rC71xgDPx8FHBg/prUfG7WPs2uWsmblyocfk/Hiw+WNyBW7PsWkXySU3A7WW71xqz9t2
         nQGvLU50/WFBTd7Syi5/5ltmwAeXf2stGqfMNw7z6OiHLFXRHnybWs/jdI3n4kVxEY6x
         H9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958332; x=1784563132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcync883JEMNF+UENDQLMgM7eZIOfrN4gu6gzZ2ECRE=;
        b=i2Nn7ub8DTfz8wVSQh/bf2+AaDU1BQGvDK0K2L8roms0ctO0ZKthrg3Z0Yo3EFHL5g
         zRKBxGTrA6YurBCX6kk/sB5v0iGGSNO6JPi2dNMwCNXR6fwVtH9yIgsoztCRB2XFC8AV
         mCsMhFfEY6ppXyd5rJcdbDyRrRkWcUMzg9HpG7qypSI+48BcBDgbWU4G/i5nkELeyvvA
         jLxzJfR+upWZK+jJAuSndEEFO2AYcmpzioxi2pe4sntkUZHEYi40m2Y/WR9iZ8tKUp+2
         fqDxrnE/Y1b2GuIG3nfTZoGh9ItiP2kH2TpcQNrYoafRhZDideBDFh5jTD/lkz7WGtUc
         UAdw==
X-Forwarded-Encrypted: i=1; AHgh+Rqp+vAC4qyfAvEG2gRLPR1TCF+ciGeVFnu2f4SmwYtLa1zdF3fT3qJzLG1pNTYAP/GNFEtkD8aAdQPvV/o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq2zpG4994qKlBqBLwexL1WlBoNEWe94kKZwOVOFFV4alKadPK
	Xjgo3DwTJzRC/zLteAkkch6i1b6wkk5HY8Xus2vZNSh/GAWSbgSe+JM8N8inTrpz4vuQ70oB1g3
	KofyIAnUT
X-Gm-Gg: AfdE7cn8WtpGDf/WD2t6UCP/ZpNBalrpb23Mi+cszAFL45EOLGKd4wXqVM7hDx2Pu6t
	Q9abngE3breGC3Mc3xrAQo2cJWzNyxdk2hgH0D0EDl/nQAVzBFLWjnkdm+cPQ52Sa7X1/M0otfX
	6nMDiQxz/Hv46YxC++3ZoezhOod60ms9rw1E1mqEGr5fJJsPeFEqbn0hGQKqZ6EdvF+cq6B7m9e
	HuiydXtI5o6ZHkqHIzenRwW4Zm3jklcQgWv8jL25VosktGPC7avcU/F1Q7TdYi+zhJND8R6j8WC
	Mt6zqgeb+a6Oj1lqefbvM9or0oNtnNAGVeZ9POczJF2itcr92v7sWQqA536OxtK59xRrnjLFDz5
	H6fh3apx+byf4Kbnh3C1TrP+2KWhxseI99UPEseYpB5iOy+SJLYElxziu7NuuV87L76uOmnMl7J
	AzGNaZazLiVkDPLeXjqSJsoxIp/v1BgbmTfrrtP14x11XAIwAKcftZloZd4BE4MfEsOFxujOvVM
	FB45NTXcXu44FQUjyCufj9pNzTSI3cpGGYkU+5lusCCMQ==
X-Received: by 2002:a05:600c:4f94:b0:492:3e66:6c84 with SMTP id 5b1f17b1804b1-493f8829926mr95921725e9.30.1783958331815;
        Mon, 13 Jul 2026 08:58:51 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f3a60404sm255840755e9.1.2026.07.13.08.58.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jul 2026 08:58:50 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: david@ixit.cz
Cc: vadim.fedorenko@linux.dev,
	horms@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v2] nfc: llcp: reject PDUs shorter than the LLCP header
Date: Mon, 13 Jul 2026 17:58:48 +0200
Message-ID: <20260713155848.55530-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every LLCP PDU begins with a two-byte header (DSAP/SSAP + PTYPE), but the
receive path never checked that a frame is at least LLCP_HEADER_SIZE bytes
before parsing it.

A peer LLCP PDU travels: NFC-DEP frame -> nfc_tm_data_received() (target /
NCI path) or nfc_llcp_recv() (initiator data-exchange callback) ->
__nfc_llcp_recv() -> rx_work -> nfc_llcp_rx_skb() ->
nfc_llcp_recv_connect(). For a CONNECT (or CC) PDU nfc_llcp_recv_connect()
computes

	tlv_array_len = skb->len - LLCP_HEADER_SIZE;

as a size_t and hands it to the TLV walk. When skb->len is 0 or 1 the
subtraction wraps to a huge value and the walk runs far past the skb,
causing an out-of-bounds read; nfc_llcp_ptype()/nfc_llcp_ssap() likewise
read pdu->data[1] for such a short frame.

A nearby NFC device can reach this without authentication; LLCP link
activation happens automatically after NFC-DEP.

Reject PDUs shorter than the LLCP header in __nfc_llcp_recv(), the common
choke point shared by both the target (nfc_llcp_data_received()) and
initiator (nfc_llcp_recv()) receive paths, so a short skb is freed before
the rx_work worker is scheduled.

Reproduced with a KFENCE out-of-bounds read via /dev/virtual_nci on
linux-next.

Found by 0sec (https://0sec.ai) using automated source analysis.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Assisted-by: 0sec:claude-opus-4-8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2: move the check into __nfc_llcp_recv() so a short skb is dropped
    before the rx_work worker is scheduled (Vadim Fedorenko), which also
    covers the initiator nfc_llcp_recv() path. Reword the commit message
    (drop the "same guard as AGF" wording) and add a KFENCE reproduction
    note.

 net/nfc/llcp_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index aed5fe1afef0..72b6e707ad0c 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1565,6 +1565,11 @@ static void nfc_llcp_rx_work(struct work_struct *work)
 
 static void __nfc_llcp_recv(struct nfc_llcp_local *local, struct sk_buff *skb)
 {
+	if (skb->len < LLCP_HEADER_SIZE) {
+		kfree_skb(skb);
+		return;
+	}
+
 	local->rx_pending = skb;
 	timer_delete(&local->link_timer);
 	schedule_work(&local->rx_work);
-- 
2.43.0

