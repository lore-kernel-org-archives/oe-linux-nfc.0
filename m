Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38EA3EFD1F
	for <oe-linux-nfc@lists.linux.dev>; Sun, 27 Sep 2026 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790515767; cv=none; b=B5RvekHlW+E82p+ozKGRsy9nbnNk945SZ5XCwZ6g6csy3cFDVyRZ7fa/IQGFEgwQzI2uWakJcecrcIFjl4L7+SkFlRczlpi9q0kUfsj9t2luiwRjKESiacCpUlyUswqQFVixlRbKuGQLSro76Hp2bWUyQ0OW+vLLgtgwHVsnzcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790515767; c=relaxed/simple;
	bh=xZjVjFUsRAoAyEig84ujyLNULbs3BHWp05sZ+Ix3PEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YFZKzplHGd67/pDj/f9yWz95hEnb0cUCj+S0ovSyROYQX3/8LsRbZSgt7EcEC3FPQRoXG/NK58hM/0yQ+1Qs7w23rzSfAl+F/P8Ky+LAlJRTEOVfk665N85Nf80CMY7zhygKdvsRiVHVxCHfwWACHGYmuAeiEs0B38QNOC77LDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOCUXH54; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOCUXH54"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-880fcd3790bso557239b3a.1
        for <oe-linux-nfc@lists.linux.dev>; Sun, 27 Sep 2026 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790515765; x=1791120565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QjnjoNM8uOqXSXpGRfVdaY1vT+2XluyhaDrsPcm/knA=;
        b=rOCUXH54wxjt9BivjEqsKYnelmfm9/X93riqUIqjAGGo3PA93dhtxKCSunxDF+YFyp
         W+YWGAcGPqjtKcOqKpMrGALrqoi0XLLxr20Eg8HCtYVGtQYkNSM4zjBLprCFwjskrpHz
         UoaLDOWgQ45cQy/eXPvBU2moK+5eVFp4aA1HFGip0wXzR5DZbge6xFq3VREAJJzSge79
         5L+HlAMArYdtN0Ar1VBIUX7UKw/pY9Nx1Bb6UHmSVtMdWteykc8gaqQkcg0QyQZ+QYB8
         xdybwhkI7wgg5OJ+AVJ+pxDUEtlOsGLRrlmF1AybQrTELP6RVmqdJpXkXQOrmSDVAOuK
         UmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790515765; x=1791120565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QjnjoNM8uOqXSXpGRfVdaY1vT+2XluyhaDrsPcm/knA=;
        b=sRDv4RUwdkJohaABEY6TswWkWPF68WUnUZiICETxQhfHvzgycFHE6Myp5MlROTHXTr
         lf/fsaFvXeCnFuM38eTN0xKsRM+KZ14F0OA+zC/pvZayUXbMPFOBbaPa3u2WoNz9hi3E
         YwbRtH9mNbjLtSynX5yR7FV3O8AAtTXwEDJei6eoaFfRgs49b+iToDN8LJnmdKob3dFE
         +HDS1VaDrIetMGQ+6jIWgwsh4pNYkj8McBMUi3HjhPJGQTQIlI6STgXO7dM51HRMui31
         Pk7zLlRCE+016VMqqaCRJq3OV2xItAB7fF3c03FJLutH8qfFtArRVJmtRLM0daZNMMC8
         uEqw==
X-Forwarded-Encrypted: i=1; AKwUvByRjWrHaRJ5oEL5XWKTNWv2g0dMPY0i6mNlMwjYUJUP6+o+NIn88fb3A7CXqfUqdRWidlMOetgJhKYWpNA=@lists.linux.dev
X-Gm-Message-State: AFuF++nWxyAbeLfFSjC98pTqnQZCHDR5m4sYqYAeTO4xNOR1sJJI+NR9
	asc1/9BrRITCDYp5ph/qJtFutdlNWcs5AN0lncGwMtAwarwKiVDseTK/
X-Gm-Gg: AYBFou1EMhNgB8lkZREc27fz86Ls48Wz5TBhUrtnnYM2kQNeRs2CECmFvlRge51lnDk
	OllyeZYPR/HEjyYyipTf3ymDov+HC7oBDlRXHzBIb9iZ0DcW+f0EW/6vSK4NdSqNs0qMo+fNcvL
	gRt7uKuXjRw5m0juza0zCe1hduEpfssQyVtP2OJ+cmwssdoJGMqyS9PLEvQpQeZRof/VoAEQAm7
	CZswfyvkHuhgBmNbbiOND7iLegUyC7+MaNSSAJbTwTyOG+04+STOLDbtK3y4ocn6epYAM86fa0S
	ldflWvik3I2/sXxtswiRdJLD8Lw0iVI/GpnO7fNKHTv/djBeHULRP0oNvftf+uazr571DJrDT09
	lCqeuRgW/7UJzw/KZ1+We8j3zuv4VRocXW32Y8lCnBeV6GZ5IORpA4sfHL1DQdbFmJ6IOZgLKFO
	nFnX7hQUP8pCoddHRUUF9CGVIVTvJA/WU/JrC3oM0ShbysxOif5w+snzzyFUfrY4iRUWY+3iAb/
	M8XX4uOrh5+8OnALvxYjhkm+2nvfk5HVNfigyQWA1jYoI2PMg==
X-Received: by 2002:a05:6a00:390b:b0:874:705d:f659 with SMTP id d2e1a72fcca58-87e9b3b6543mr7973250b3a.39.1790515765121;
        Sun, 27 Sep 2026 06:29:25 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:b0c3:3f9c:4dbd:e098])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feb57a5a6sm2985845b3a.47.2026.09.27.06.29.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 06:29:24 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH v3] nfc: nci: ignore unexpected CORE_RESET_NTF and CORE_RESET_RSP
Date: Sun, 27 Sep 2026 21:29:14 +0800
Message-ID: <20260927132914.24648-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

A similar issue exists in nci_core_reset_rsp_packet(): an unexpected or
delayed response packet can prematurely complete an unrelated in-flight
request.

Fix this by ensuring CORE_RESET_NTF and CORE_RESET_RSP are only processed
by the core layer when a reset command is actively awaiting them:
- Set NCI_RESET_PENDING in nci_reset_req() when sending CORE_RESET_CMD.
- In nci_core_reset_rsp_packet(), ignore the response if NCI_RESET_PENDING
  is not set. If set, atomically clear the flag and complete the request
  on failure or for NCI 1.x (checking skb->len >= sizeof(*rsp)).
- In __nci_request(), ensure NCI_RESET_PENDING is cleared upon request
  completion, cancellation, or timeout.
- In nci_core_reset_ntf_packet(), fail any in-flight reset request if the
  controller reports an unrecoverable error (0x00), and only process
  command-triggered notifications (0x02). Non-command triggers (e.g.
  power-on 0x01 or proprietary triggers) and unexpected notifications
  return 0 without modifying core state, ensuring driver-specific
  notification handlers (such as fdp firmware patch handling) still
  receive them.
- In nci_core_reset_ntf_packet(), support notifications shorter than 9
  bytes (e.g. NCI 2.0 frames with manufacturer_specific_len == 0),
  validating the fixed header length and safely bounding
  manufact_specific_info reads.

Fixes: bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
Cc: stable@vger.kernel.org
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
v3:
 - In nci_core_reset_ntf_packet(), do not reject notifications shorter than
   9 bytes with -EINVAL; instead allow valid short frames (e.g. 2-byte NCI 1.x
   or 5-byte NCI 2.0 with manufacturer_specific_len == 0), safely cap field
   reads, and return 0 so driver-registered hooks (such as fdp firmware
   patching) are not skipped (per Sashiko AI).
 - Fix trigger semantics: in NCI, CORE_RESET_CMD trigger is 0x02
   (NCI_RESET_TRIGGER_RESET_CMD). If controller reports an unrecoverable error
   (0x00, NCI_RESET_TRIGGER_ERROR) while reset is pending, fail the request
   instead of completing with OK; ignore power-on (0x01) and proprietary
   triggers at core layer (per Sashiko AI).
 - In nci_core_reset_rsp_packet(), use test_and_clear_bit(NCI_RESET_PENDING)
   upon completing the request to consume the flag atomically (per Sashiko AI).
 - Link to v2: https://lore.kernel.org/netdev/20260922102144.39689-1-ndaugoing@gmail.com/

v2:
 - Do not abort the notification pipeline on unexpected CORE_RESET_NTF (return 0
   instead of -EINVAL), preserving driver-level hooks (e.g. fdp firmware
   patching) per Simon Horman.
 - Skip power-on notifications (trigger 0x01, identical in NCI 1.0 and 2.0)
   while gating both NCI 1.0 (0x00) and NCI 2.0 (0x02) command-triggered resets
   on NCI_RESET_PENDING alone.
 - Check NCI_RESET_PENDING in nci_core_reset_rsp_packet() to avoid completing
   unrelated requests on unexpected responses.
 - Explicitly check skb->len >= sizeof(*rsp) in nci_core_reset_rsp_packet()
   for NCI 1.x handling.
 - Link to v1: https://lore.kernel.org/netdev/20260918013337.82214-1-ndaugoing@gmail.com/

 include/net/nfc/nci.h      |  5 ++++
 include/net/nfc/nci_core.h |  1 +
 net/nfc/nci/core.c         |  3 +++
 net/nfc/nci/ntf.c          | 48 +++++++++++++++++++++++++++++++++-----
 net/nfc/nci/rsp.c          | 30 ++++++++++++++++++------
 5 files changed, 74 insertions(+), 13 deletions(-)

diff --git a/include/net/nfc/nci.h b/include/net/nfc/nci.h
index 09efcaed7c3f..2ac45adba088 100644
--- a/include/net/nfc/nci.h
+++ b/include/net/nfc/nci.h
@@ -140,6 +140,11 @@
 #define NCI_RESET_TYPE_KEEP_CONFIG				0x00
 #define NCI_RESET_TYPE_RESET_CONFIG				0x01
 
+/* NCI Reset Triggers */
+#define NCI_RESET_TRIGGER_ERROR					0x00
+#define NCI_RESET_TRIGGER_POWER_ON				0x01
+#define NCI_RESET_TRIGGER_RESET_CMD				0x02
+
 /* NCI Static RF connection ID */
 #define NCI_STATIC_RF_CONN_ID					0x00
 
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
index f5c9a8ab7ec1..81ba6011c027 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -30,21 +30,57 @@
 static int nci_core_reset_ntf_packet(struct nci_dev *ndev,
 				     const struct sk_buff *skb)
 {
-	/* Handle NCI 2.x core reset notification */
 	const struct nci_core_reset_ntf *ntf;
 
-	if (skb->len < sizeof(struct nci_core_reset_ntf))
-		return -EINVAL;
+	/*
+	 * Return 0 on short or unhandled packets so driver-specific
+	 * notification hooks (such as fdp firmware patching) can still run.
+	 */
+	if (skb->len < 2)
+		return 0;
 
-	ntf = (struct nci_core_reset_ntf *)skb->data;
+	ntf = (const struct nci_core_reset_ntf *)skb->data;
+
+	/*
+	 * If the controller reports an unrecoverable error while a reset is
+	 * pending, fail the in-flight reset request.
+	 */
+	if (ntf->reset_trigger == NCI_RESET_TRIGGER_ERROR) {
+		if (test_and_clear_bit(NCI_RESET_PENDING, &ndev->flags))
+			nci_req_complete(ndev, NCI_STATUS_FAILED);
+		return 0;
+	}
+
+	/*
+	 * Only CORE_RESET_CMD-triggered notifications (0x02) complete a
+	 * pending reset request in NCI 2.0. Power-on (0x01) and proprietary
+	 * triggers (>= 0xA0) must not update core protocol state.
+	 */
+	if (ntf->reset_trigger != NCI_RESET_TRIGGER_RESET_CMD)
+		return 0;
+
+	if (!test_and_clear_bit(NCI_RESET_PENDING, &ndev->flags)) {
+		pr_warn_ratelimited("unexpected CORE_RESET_NTF\n");
+		return 0;
+	}
+
+	if (skb->len < offsetofend(struct nci_core_reset_ntf,
+				   manufacturer_specific_len)) {
+		nci_req_complete(ndev, NCI_STATUS_FAILED);
+		return 0;
+	}
 
 	ndev->nci_ver = ntf->nci_ver;
 	pr_debug("nci_ver 0x%x, config_status 0x%x\n",
 		 ntf->nci_ver, ntf->config_status);
 
 	ndev->manufact_id = ntf->manufact_id;
-	ndev->manufact_specific_info =
-		__le32_to_cpu(ntf->manufact_specific_info);
+	if (ntf->manufacturer_specific_len >= sizeof(__le32) &&
+	    skb->len >= sizeof(struct nci_core_reset_ntf))
+		ndev->manufact_specific_info =
+			__le32_to_cpu(ntf->manufact_specific_info);
+	else
+		ndev->manufact_specific_info = 0;
 
 	nci_req_complete(ndev, NCI_STATUS_OK);
 
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index b0ab4f5acbce..7a3c6bc1a0da 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -32,16 +32,32 @@ static void nci_core_reset_rsp_packet(struct nci_dev *ndev,
 
 	pr_debug("status 0x%x\n", rsp->status);
 
-	/* Handle NCI 1.x ver */
-	if (skb->len != 1) {
-		if (rsp->status == NCI_STATUS_OK) {
-			ndev->nci_ver = rsp->nci_ver;
-			pr_debug("nci_ver 0x%x, config_status 0x%x\n",
-				 rsp->nci_ver, rsp->config_status);
-		}
+	/*
+	 * If no reset request is pending, ignore unexpected responses to avoid
+	 * prematurely completing an unrelated request.
+	 */
+	if (!test_bit(NCI_RESET_PENDING, &ndev->flags))
+		return;
+
+	if (rsp->status != NCI_STATUS_OK) {
+		if (test_and_clear_bit(NCI_RESET_PENDING, &ndev->flags))
+			nci_req_complete(ndev, rsp->status);
+		return;
+	}
+
+	/* Handle NCI 1.x ver: completed by RSP */
+	if (skb->len >= sizeof(*rsp)) {
+		if (!test_and_clear_bit(NCI_RESET_PENDING, &ndev->flags))
+			return;
+
+		ndev->nci_ver = rsp->nci_ver;
+		pr_debug("nci_ver 0x%x, config_status 0x%x\n",
+			 rsp->nci_ver, rsp->config_status);
 
 		nci_req_complete(ndev, rsp->status);
 	}
+
+	/* NCI 2.x ver: status is OK, wait for CORE_RESET_NTF to complete */
 }
 
 static u8 nci_core_init_rsp_packet_v1(struct nci_dev *ndev,
-- 
2.53.0

