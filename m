Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A213C140E
	for <oe-linux-nfc@lists.linux.dev>; Tue, 23 Jun 2026 22:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782253472; cv=none; b=SwC/3H79LBSt57hHx0slQdZwb5QHnbm+HPTBrZaUGHhA1lgBd0+czDwrlc1jAXCZTjKe3AsTvn96FKZCvM9ud+RWniA/baHgdToI4kQj0xJAAhtVeA8spz8uh92u4v4i7rN0GJFpjZASnHdTTYwJ+BHsB77gBkZ+Z6NbIA00evQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782253472; c=relaxed/simple;
	bh=1YhKA2IR2noap56s+wFYYMoqh9rUzZYHvDIQPXPdHYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tX/OIAPgcrEwtXsDpgaHTBVHvaM8eRpLSoDQJ/QXSTI0ZEt9ekTXEu0x2e6/aUi9B8vpoDqUXBK9YbpMlyGaY9hez22JglAh/MVsH309BxqmaRg8fRUCCnpSTb8KdzA8WNO6nuUJ5culwetJ0zOfqFH8e02Izj2KX+eXGZJUGtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=mI9rERwM; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="mI9rERwM"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-697f3af8749so176718a12.2
        for <oe-linux-nfc@lists.linux.dev>; Tue, 23 Jun 2026 15:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1782253468; x=1782858268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9EL/E+9kbwK4PLUI4WhiNWopf73sV8df3AbcMljHGbw=;
        b=mI9rERwMyFIBJktnrafMEFDvHwMK8erv2lAGFaOYytyDHM1DHyE4ztA0NfWJl2NAoE
         CfXWlRfJbqakLqMXzUYKK2ltGve8RfyOJHq1oLbWTb5SCfKz9nIlbThKf82dWPNkSO3h
         oW9EALnE5lgc0pmyGh7eGf8RVyuVxvjlVbGFe+LLJ7aMDp2+LntbJAGiQ+/g2p9jfC+C
         ELpeG9+MwCnkFTPqe0B5sWZswrDaBgTNvYBUlwNbkzN9daafWRUUmEULkH0STlZ42NKj
         2hxPKa3JZFf3o/3yOiPzKHz/1CqNschb0g/ZDOgN24ovrDJYodrHAAvf44NikVfzSnD0
         xUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253468; x=1782858268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EL/E+9kbwK4PLUI4WhiNWopf73sV8df3AbcMljHGbw=;
        b=cfrpMzohtpqJBwcwMPyZuVe2C+Hw6UX1bfL+HibTtaqo7ZFCQ29K8toH9l6eh/t9Je
         eRjFbSx8ebq9R1ZIKsWTmbXl6bQpIYyg0H69oJ/Hini/gHFtdkapgjYNOidnYQ61vdnu
         AtYktV+6YoLwQ2ytDzSdch4RWAcD4unX9Zl/yln18uFDCiJIUCLI80Qm8qiT9z79wOfm
         14zG1vR5fXuENgYDm74z6pxGITpRz8LrDyXCBHXhqBrac5RxiJBcW3bpqBU26jVul2lt
         xoL3LuOQU11Zv/ZKYJ52wZt2Td79f+rOjaIGX5lWUnaZr0lss+ehCPnxfcbRlTipow+u
         6e1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+giE6kwzdgacB769u8XpJJjfWm3OyRHIbqZCBwziXlgP5TUxGOwgPZ665kiI/EuizQC02aOvs2CH8+G7g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTMkz+xD604tRtQsTZDS+WPlvv9ydIYYWZ1kBQHd+V+hVNTeZ7
	ZSiuHFO6+dg9yolCGiwcq6K8TaHNojLyr6OI0kZ8GdVpA5Hc55dSejYFDRJyOyGHwI3z1y66PNW
	03fKlUqVT
X-Gm-Gg: AfdE7clckevwPMqRzEB0OOp3BKoeadZekDfLcxDzgCNLUfnNRHVZuI5ju0Gb45AZX3i
	yMM2oOZ+XhXmrhU05jULbnIzf4LgqmzylwGnH8a5q/VRK3NK9f+6mVK+QguFpnNWVeEstKAik42
	/oW8CrF4TDvgRzsmtYRCQSxPlBhAoazDn+tA+TPUcQd/n3hlf0sO/XKFL9yL4ZB7yLXwV63zcSb
	R0wcxssI+nST/7Mum2h/BTBvmspHc/xwz+Z9YFPPiNVPtcfZ3Tz4bdNrjpF6AG/SSwwHYT6Bujo
	xeBS26XIiovaQXBtP2JpZzxy9rRwc/TQc7/F2jcX9GQkQHVxcEK8ny5mYByGW2vByEqTmfZmW1d
	nqapegRJkFD2XxgmkK+dztt/ZrahjL6dUObDUWqHUYK6+qC8HVLiwOtRwdjpMezl3eU/gleWWKh
	6X
X-Received: by 2002:a17:907:96a8:b0:bec:687f:6603 with SMTP id a640c23a62f3a-c119e45a11fmr20199066b.28.1782253467082;
        Tue, 23 Jun 2026 15:24:27 -0700 (PDT)
Received: from localhost ([2a06:61c2:d427:0:b321:1c7a:b072:326e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e5280sm579916966b.53.2026.06.23.15.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:24:26 -0700 (PDT)
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
	stable@vger.kernel.org
Subject: [PATCH net] nfc: nci: fix uninit-value in nci_core_init_rsp_packet()
Date: Wed, 24 Jun 2026 00:24:02 +0200
Message-ID: <20260623222402.175798-1-sam@bynar.io>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CORE_INIT_RSP handlers walk the response using length fields taken
from the packet itself, without checking they stay within skb->len:

 - v1 computes
	rsp_2 = skb->data + 6 + rsp_1->num_supported_rf_interfaces;
   from the on-wire (unclamped) interface count and then dereferences
   rsp_2, and memcpy()s the advertised interfaces - both can run past the
   received data;
 - v2 walks supported_rf_interfaces[], advancing the cursor by an
   in-packet rf_extension_cnt with no bound.

A short CORE_INIT_RSP therefore makes the parser read past the packet
(into the uninitialised tail of the RX skb); the values are stored into
struct nci_dev and consumed while bringing the device up:

  BUG: KMSAN: uninit-value in nci_dev_up+0x10f3/0x1720
   nci_dev_up+0x10f3/0x1720
   nfc_dev_up+0x187/0x380
   nfc_genl_dev_up+0xdc/0x1a0
   genl_rcv_msg+0x5d4/0x9e0
   netlink_rcv_skb+0x28f/0x530
  Uninit was stored to memory at:
   nci_rsp_packet+0x68f/0x2310
   nci_rx_work+0x25f/0x5d0
  Uninit was created at:
   __alloc_skb+0x540/0xd40
   virtual_ncidev_write+0x65/0x210

Bound both parsers to skb->len before dereferencing the variable-length
parts, rejecting truncated responses with NCI_STATUS_SYNTAX_ERROR.

Fixes: 6a2968aaf50c ("NFC: basic NCI protocol implementation")
Fixes: bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
Cc: stable@vger.kernel.org
Assisted-by: Bynario AI
Signed-off-by: Samuel Page <sam@bynar.io>
---
 net/nfc/nci/rsp.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index 9eeb862825c5..cdcd23c8ca95 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -50,6 +50,9 @@ static u8 nci_core_init_rsp_packet_v1(struct nci_dev *ndev,
 	const struct nci_core_init_rsp_1 *rsp_1 = (void *)skb->data;
 	const struct nci_core_init_rsp_2 *rsp_2;
 
+	if (skb->len < sizeof(*rsp_1))
+		return NCI_STATUS_SYNTAX_ERROR;
+
 	pr_debug("status 0x%x\n", rsp_1->status);
 
 	if (rsp_1->status != NCI_STATUS_OK)
@@ -58,6 +61,15 @@ static u8 nci_core_init_rsp_packet_v1(struct nci_dev *ndev,
 	ndev->nfcc_features = __le32_to_cpu(rsp_1->nfcc_features);
 	ndev->num_supported_rf_interfaces = rsp_1->num_supported_rf_interfaces;
 
+	/*
+	 * supported_rf_interfaces[] and the trailing nci_core_init_rsp_2 are
+	 * addressed using the on-wire (unclamped) interface count, so the
+	 * response must be long enough for both before they are dereferenced.
+	 */
+	if (skb->len < sizeof(*rsp_1) +
+	    rsp_1->num_supported_rf_interfaces + sizeof(*rsp_2))
+		return NCI_STATUS_SYNTAX_ERROR;
+
 	ndev->num_supported_rf_interfaces =
 		min((int)ndev->num_supported_rf_interfaces,
 		    NCI_MAX_SUPPORTED_RF_INTERFACES);
@@ -88,9 +100,13 @@ static u8 nci_core_init_rsp_packet_v2(struct nci_dev *ndev,
 {
 	const struct nci_core_init_rsp_nci_ver2 *rsp = (void *)skb->data;
 	const u8 *supported_rf_interface = rsp->supported_rf_interfaces;
+	const u8 *end = skb->data + skb->len;
 	u8 rf_interface_idx = 0;
 	u8 rf_extension_cnt = 0;
 
+	if (skb->len < sizeof(*rsp))
+		return NCI_STATUS_SYNTAX_ERROR;
+
 	pr_debug("status %x\n", rsp->status);
 
 	if (rsp->status != NCI_STATUS_OK)
@@ -104,10 +120,16 @@ static u8 nci_core_init_rsp_packet_v2(struct nci_dev *ndev,
 		    NCI_MAX_SUPPORTED_RF_INTERFACES);
 
 	while (rf_interface_idx < ndev->num_supported_rf_interfaces) {
-		ndev->supported_rf_interfaces[rf_interface_idx++] = *supported_rf_interface++;
+		/* one interface byte + one extension-count byte must be present */
+		if (end - supported_rf_interface < 2)
+			return NCI_STATUS_SYNTAX_ERROR;
+		ndev->supported_rf_interfaces[rf_interface_idx++] =
+			*supported_rf_interface++;
 
-		/* skip rf extension parameters */
+		/* skip rf extension parameters, bounded by the packet */
 		rf_extension_cnt = *supported_rf_interface++;
+		if (rf_extension_cnt > end - supported_rf_interface)
+			return NCI_STATUS_SYNTAX_ERROR;
 		supported_rf_interface += rf_extension_cnt;
 	}
 

base-commit: a986fde914d88af47eb78fd29c5d1af7952c3500
-- 
2.54.0

