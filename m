Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34632D12F3
	for <oe-linux-nfc@lists.linux.dev>; Wed, 24 Jun 2026 22:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782341122; cv=none; b=Gc/d1kvLYLpdt704rywTAPplCrY5gkwW3ECKrerEqZMlqRf/d/FxAS9sylzriCM6hqJJ/I+tjk2TmiyYeXNlJliqb9FYQMjyg5ucza1t6vnZrbNG410IcOuj3LILrwiYkl67FzVSNXCE7H8qKf+CIk6kcm+LVw5Kcnw+bbcCb4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782341122; c=relaxed/simple;
	bh=F9Kyj9psFA3CcUgAE4ZqMqWA0H5hu/8LTdI7oKfL23g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zd5f3OZFb6HVp8TK6FRTws/noFXcIEhXRwlLCkSI8vthJvgjQZ8EWow4OLdDLoNR91GPYamCzAqQ9KPu48McVey6KodfcP8p7A313njhXYZQrjS87JRbF3zAUOJJBx2vKBj9Xeavs+VPKko5zBL36eL6fDCRvEIB2qcP+DBK7GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=WUao3Nuc; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="WUao3Nuc"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c11ff0c5e43so35792566b.0
        for <oe-linux-nfc@lists.linux.dev>; Wed, 24 Jun 2026 15:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1782341119; x=1782945919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OIv0SNIrWvan8AixNggFQO+S0jupCa7X1WRFdoPzAug=;
        b=WUao3NucB9NT7brdouap35YOMW8j/V5qXTNp2CXufFhLjH/ARwE02lxlUgZnG7L1kG
         Ou9Ym7tTiTHSXQNYqTqjR9TWcRzihSsKsXGe9FD7coKu8XkPB1Qlc1jZyKknC+2vL7NJ
         +RLik9PE46zwmM1iBD1ZPFRY1Als5XRRig2mq/txC3ni08+IsWs2BCPf3WObp6fxyDqV
         0JC05v1hzQFk7dbQGqUxhvzdATDBLsUe0gvjJmB0ytBPIM5AHYlIBvlV7ne2Eqib6Y1f
         LxbvJfJm4p1PXWfo/j/D/oA/yOdn5LSsP2aYmqGcyor60hD62jruCuiYH42H+9Faa6Sd
         hnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782341119; x=1782945919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIv0SNIrWvan8AixNggFQO+S0jupCa7X1WRFdoPzAug=;
        b=Iv7kvcjqRMF6lXeQL14FFnl+30J4VfVJta87XpTjdgQeHn0oeJCfTICKr+Y1IXchAL
         QG3fWYXhqdrh75J1+J9UjlbykvqhwBC5N7fztZBoHtYxi1RgtS39MjZKATVYse1Wu47x
         +6zQI35GQcC5hsnyG6Dht0x6LpBEW6+0dTZhI0tz+89cxALcDPaLBXvsH0ssJwRC2Rs5
         SPn6PRxgrZ6WjIDnga32kV1jVB6YnC9UDWiToHThpOSTkaLo0RO22AG4Q+kNDXq3v7Cf
         r4z8UnupvftRXRxqLCa8frCltsIsQyJbcOSZB1T2fwBY4XOXaeLR6Gak07m3VEWlILif
         qydg==
X-Forwarded-Encrypted: i=1; AFNElJ/jMDaouJtvbtkyTxk68hNouFUcZEBP+1VvVWXHOB02v72DEenlkPTaaUMqIUfJKD+6Z/yY+tMmocxt5V8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsgdthU1r7zVn8Ty5bqzPqFgb2Ilzb/DlHw/KG/nI9AMcwxCqu
	VeT9lwpUNhAiEGanmwpRNfndlR9eyqZEMcKhIqlD53rY53xNOkG7E9l6qYfItwPU7yKI
X-Gm-Gg: AfdE7ckSCT5w41kNFTVcRrOhm5AnYMXnaTVznKgtZ7DMED0ytTPdTalYV/xqxbSKg7i
	dYbugJZRX+6zj4mSZaDZzd3XkW7m0jd4tdsyhKDnC2F0gQF8bQ41acVkMIu+TFajm735QGF1t8o
	mQI/bmbEnGAPmWDN9CPDAfFd26k9zgZKcNqGOHD/FnaAajx7K4mgcslVNh+3E0AX2MNZy4TYPd0
	Kj6GGEG7yuC659qXXSsxDcSDnW1W+zTFu7u8/DdVnw567sng1IVGC3Cu2N7VXlDGIHoy1UlZHwt
	p2hLZ2vNVhaSoBiRf+ASOiY65JG50ZpgBjAXtPYJu4Pmj/dmkegkG8qz2fcyFNYH981ZFPzev18
	bPbv0h5aX9UFI7kZCHfQ4JAWbKlPBPGJJ2Vim6CLGh63nbtiHgzb3sLHwVfOGkxTknt1NQKQ3TE
	Mb9r3TQ/mO700=
X-Received: by 2002:a17:907:6d07:b0:c02:6fbc:203b with SMTP id a640c23a62f3a-c10801b77fbmr541038366b.46.1782341119093;
        Wed, 24 Jun 2026 15:45:19 -0700 (PDT)
Received: from localhost ([2a06:61c2:d427:0:b321:1c7a:b072:326e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe6220esm51310366b.45.2026.06.24.15.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 15:45:18 -0700 (PDT)
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
Subject: [PATCH net v2] nfc: nci: fix uninit-value in nci_core_init_rsp_packet()
Date: Wed, 24 Jun 2026 23:44:55 +0100
Message-ID: <20260624224455.999374-1-sam@bynar.io>
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

Validate the response length before parsing or storing the
variable-length parts, rejecting truncated responses with
NCI_STATUS_SYNTAX_ERROR.  In v1 the check is done before
num_supported_rf_interfaces is stored into ndev, so a truncated response
cannot leave ndev->num_supported_rf_interfaces holding the unclamped
on-wire count, which nci_init_complete_req() would otherwise use as a
bound for the fixed-size supported_rf_interfaces[] array.

Fixes: 6a2968aaf50c ("NFC: basic NCI protocol implementation")
Fixes: bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
Cc: stable@vger.kernel.org
Tested-by: syzbot@syzkaller.appspotmail.com
Assisted-by: Bynario AI
Signed-off-by: Samuel Page <sam@bynar.io>
---
v2: validate the response length before storing num_supported_rf_interfaces
    into @ndev.  In v1 the unclamped on-wire count was stored first and the
    length check returned early on a truncated response, leaving
    ndev->num_supported_rf_interfaces > NCI_MAX_SUPPORTED_RF_INTERFACES; a
    subsequent CORE_INIT completion then walked it in nci_init_complete_req(),
    which the syzbot CI run on v1 flagged as a UBSAN array-index-out-of-bounds.
    https://ci.syzbot.org/series/2a9a8657-37a3-4dce-8cb5-2035027791dd
    v1: https://lore.kernel.org/all/20260623222402.175798-1-sam@bynar.io

 net/nfc/nci/rsp.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index 9eeb862825c5..6b2fa6bdbd14 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -50,11 +50,25 @@ static u8 nci_core_init_rsp_packet_v1(struct nci_dev *ndev,
 	const struct nci_core_init_rsp_1 *rsp_1 = (void *)skb->data;
 	const struct nci_core_init_rsp_2 *rsp_2;
 
+	if (skb->len < sizeof(*rsp_1))
+		return NCI_STATUS_SYNTAX_ERROR;
+
 	pr_debug("status 0x%x\n", rsp_1->status);
 
 	if (rsp_1->status != NCI_STATUS_OK)
 		return rsp_1->status;
 
+	/*
+	 * supported_rf_interfaces[] and the trailing nci_core_init_rsp_2 are
+	 * addressed using the on-wire (unclamped) interface count, so the
+	 * response must be long enough for both before any of it is parsed or
+	 * stored into @ndev - otherwise a truncated response would leave
+	 * ndev->num_supported_rf_interfaces holding the unclamped count.
+	 */
+	if (skb->len < sizeof(*rsp_1) +
+	    rsp_1->num_supported_rf_interfaces + sizeof(*rsp_2))
+		return NCI_STATUS_SYNTAX_ERROR;
+
 	ndev->nfcc_features = __le32_to_cpu(rsp_1->nfcc_features);
 	ndev->num_supported_rf_interfaces = rsp_1->num_supported_rf_interfaces;
 
@@ -88,9 +102,13 @@ static u8 nci_core_init_rsp_packet_v2(struct nci_dev *ndev,
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
@@ -104,10 +122,16 @@ static u8 nci_core_init_rsp_packet_v2(struct nci_dev *ndev,
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

