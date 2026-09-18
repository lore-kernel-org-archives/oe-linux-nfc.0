Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAE836195A
	for <oe-linux-nfc@lists.linux.dev>; Fri, 18 Sep 2026 01:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695227; cv=none; b=QQRuF6iytMxaLqjOjYWWjE19fV5SpcMznoDeYRyVcoAGQ71cY11C7P7jBjWiKEJSrrdQSKHCaR1uWay3u6YvtYSlYfQyfA9Y/WVPG4op1qc40WLtRL3P7+R7fY0KVi8KJdBuYdgM9na2QVo1KS4PKbmDFgN6OT9cfyqHFP/668o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695227; c=relaxed/simple;
	bh=vQ71nP81xJIGLGl+WldFcoeRSyjZOcokzca2ie96Obs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aU1avLHsKKxzpBFWodB43t/UKITcjb+by4fj5EZEdqtY3J2ZNyRvMzZLU/MYATWchxC8Jl/X+t8IsZBEN7uq9eXL4sCK9U5gHktxfty2nJAwc/TLgGV0mNzwQCf0DT499bG4AbIuusvSvZaHm0nA2F+xBfy0zwRUj/VQWlRMTfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pAO8HBnN; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pAO8HBnN"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db22383fe8so1112495ad.2
        for <oe-linux-nfc@lists.linux.dev>; Thu, 17 Sep 2026 18:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789695225; x=1790300025; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3eHLQ4W/b80X19nrEr9wAXnZ5B6H1Ytyc3QQvQncgw=;
        b=pAO8HBnNvECNfpisAnIU2yjrzn2/sXYI5UgVIEzdVtdzj56kz9pmYCyKetizl+nd4X
         5jYrYhy8uzE7xjm6Eg2CSbgOKq5XRsJUTO37v+IlI/hEIjMBF9RN+sC3iuCxY0Pceh3B
         AqwsdqtyMobGvR/K4KKAgakVvhCj+JiUzBa80I1hTNErTmHzlazYyYovXfYxBr4hzU7n
         12wgTaaBnbS64QqplS4nQ7P4Y3gsSUS1IhqoVPKaaok8ZPDq9FdLwSGUY95AiUQrqx6N
         BIFmz5lOqErvQHZqSgOZbE+8F7pNrIRf0muimiPu6w8GHPhLpDkNMVAt0WK0MGroV/hl
         juZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695225; x=1790300025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3eHLQ4W/b80X19nrEr9wAXnZ5B6H1Ytyc3QQvQncgw=;
        b=ecmGHvidboBVSXhpReOj4suQ68b/Co88I9RnV/2IrHYmttjDlJGKYyW0vaAMIfHLew
         gqdutSQkIhjOJR2k5pNaQqNocLJoPGR/BH+sd/z1ZsMzIj2BUvC8sBLhCvapAW4iFATy
         RFUsc5RJ5SG2RxX1b7u4jnW5eZPoRZKOFhz0Q52zxf7pmSavVxqEyal3NciQUCeWlAhh
         SEycTy9Ikd3iIrn5mZu0AkQMZlM9KjxE84KuCXy+kgWXXuG53Z9pkf/A6Z2kBqd25aWn
         v75NT2qNqsGKtEc3G4lU1in15h1+6wEGqCe/gz/I2vUAFUaSUJbX8hdzoXyRP4NRXaLa
         EuLA==
X-Forwarded-Encrypted: i=1; AKwUvBx4LfO2G/WM4mRbKRovR9XccdT0moTSeKilu+4ysWbUf2eNqyjxelfYBqeb8bgPLA8MpZyewbD1hRt147A=@lists.linux.dev
X-Gm-Message-State: AFuF++mazrs3d+iPiDZfgu2f427aiBD9DOQTIGGLchFVsE7o7En3c2ne
	KhqcExCcHqu9vHXwZYxrXr7/JVIKWm3SSPkhOVsDkuVNpriOqsAdRBqc
X-Gm-Gg: AYBFou3xMGVXDLSi8wNU3ECZqSRxyKBsp2rqQ95LPXBp4PMWAIYu63wdZ1nN4BM6zi3
	ze8IyjKnq63tGbeyOvpdI9p1Ok+bYveuCC49YlllzD+QHZO6H73NS/ZnY7sw+uX2AWCX48kzgRO
	8e1ZcWm39fUJ016SIJUVOG9yEwW5gAT+GQ/ZjnuBEVuIR45uBIMnHB1+IwqbIYFMIYK0Qa4Kzly
	YQdlSu7dy7OA7b45JfUWf0Z1/h+1ADyCsfj9h9Sad2yif7pozCK0ckFZb4XpRxGmz/XelmVBezn
	qb32W4HXHHlgfRSFcIBiBfok/14Box3tVEXZJ3dn9Iah44zV3TqO8+k4Kfci8PoLODouw8c9LPN
	fTqd3rdIetg9MEdmQ4/k/6NHtTuFpbUFWPXKFsOP3mHZ9Yki9DjgcRViY0QdK3MaNFDNudqcRes
	JPaCTHl9MMclau2xMnJoh2MRQHXcIWm0DxUfO86a/ciA/fiodSPFRig4wtzHg+TDwKKeKdq542u
	NUOPlo/u0YtCJclpE6C18e53PqYObNEftW/EcY=
X-Received: by 2002:a17:903:2f84:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2ddb1af51a9mr17366565ad.13.1789695225346;
        Thu, 17 Sep 2026 18:33:45 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:e17f:a362:fc0a:a2ab])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2872052fsm40520eec.11.2026.09.17.18.33.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 18:33:44 -0700 (PDT)
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
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 0/1] nfc: nci: ignore unexpected CORE_RESET_NTF
Date: Fri, 18 Sep 2026 09:33:36 +0800
Message-ID: <20260918013337.82214-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuchao Zhang <ndaugoing@gmail.com>

Hello,

This patch addresses an issue in the NCI core stack where an unexpected
or unsolicited CORE_RESET_NTF packet can prematurely complete unrelated
in-flight requests with NCI_STATUS_OK and corrupt protocol version state.

Problem Overview:
=================
Commit bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
added nci_core_reset_ntf_packet() to handle NCI 2.x CORE_RESET
notifications. When received, it updates ndev->nci_ver and manufacturer
information, and calls nci_req_complete(ndev, NCI_STATUS_OK).

Unlike other notification handlers in ntf.c (which validate ndev->state
before acting), nci_core_reset_ntf_packet() does not verify whether a
core reset request is actually pending.

If an unsolicited or delayed CORE_RESET_NTF is received:
1. If another request is currently in-flight (such as CORE_INIT,
   RF_DISCOVER, or CONN_CREATE), it prematurely completes that request
   with NCI_STATUS_OK, leading to state desynchronization.
2. Even when no request is in-flight, it unconditionally overwrites
   ndev->nci_ver and manufacturer info. Because ndev->nci_ver acts as
   a parser and packet format selector (e.g., in nci_open_device() and
   nci_core_init_rsp_packet()), unexpectedly modifying it can cause
   protocol format confusion.

Solution:
=========
Introduce an NCI_RESET_PENDING flag in enum nci_flag to ensure
CORE_RESET_NTF is only accepted while a reset command is actively
awaiting it.

Testing:
========
Verified with module compilation and checkpatch.pl (0 errors, 0 warnings).
Empirically confirmed that unsolicited CORE_RESET_NTF packets are safely
rejected with a warning while legitimate reset sequences continue to
complete normally.

Thanks,
Yuchao Zhang

Yuchao Zhang (1):
  nfc: nci: ignore unexpected CORE_RESET_NTF

 include/net/nfc/nci_core.h |  1 +
 net/nfc/nci/core.c         |  3 +++
 net/nfc/nci/ntf.c          |  5 +++++
 net/nfc/nci/rsp.c          | 15 ++++++++++-----
 4 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.53.0
