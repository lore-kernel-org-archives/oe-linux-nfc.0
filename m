Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBF73BBA1D
	for <oe-linux-nfc@lists.linux.dev>; Fri, 18 Sep 2026 02:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789697074; cv=none; b=hK7A6KZ2Io5B8skl1V1WMAbVHgEyl78pUgnYkzzdpft7PQWdzYMfxfnzwtrDuPqOgFWUcQ/eVfRckn3X4GYQIZiUSdiRwx/1i5z3CwzlqMQCv5sTvtPQk+vpECO6CLk/erwf5FeZpSVd98vgulFkUWWrkE8R6rILNU4lxg30tj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789697074; c=relaxed/simple;
	bh=GqEmDjbmlD43nKcKkz3682LJMrGqtTA7m5Mhi4U8TjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tPT/MgbhflSYGfKFkCULdnQbEklgiCuIa9Bmrk3tR2V2KMx4FgHOiHvslW6/Srf4AqgsYA4cKuZeuojaktphlZ1j/GfPEGz5PZpLgl+wZmGHUJcdtHTWsRm43UjLCIPflk/bakzGF/zCYnQ9q5aEpmPOM7cgzq4GndXsLvJH7h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3qiyMy9; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3qiyMy9"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so299149b3a.3
        for <oe-linux-nfc@lists.linux.dev>; Thu, 17 Sep 2026 19:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789697061; x=1790301861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y8IHVPQTh4E48RsfYHS1AOxQ6DrEMP7aqWgbccraUDI=;
        b=L3qiyMy92hv60QxBVYUICW3KePWRtt1E8KX4ybLDZpSz4sHCdpmB9sMkMLaTNLalsL
         5n/geVCs7QV/sKghHrXZwmnw6IBMaaQs6iTizW2+4WyFzg0eJkWlpbtVK6ATp2Y79RMr
         d80E5zhN341oAzlVgCUgn9Mn0i29fBQuE23x1R6+LgPDaPyWSSEGqqhlRmOd/A6YBNoJ
         KDI41twySVN44YGnFScbVOVhT5t2Rz5rZNZWx3igTK1q1Cu1KB3IGC3hJKBR3F4tZ19k
         Y3uzcgLdn2/IA7P0z2Ukt6cVIkU1kr4mURbDJRhbuhSiPG+izEiTtjz3vO2xuxTGsOa6
         t8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789697061; x=1790301861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8IHVPQTh4E48RsfYHS1AOxQ6DrEMP7aqWgbccraUDI=;
        b=wC8MK2rOoRvleXAXyIZMwNtSR9gisXzLqMtu/PWr4ggGEGZM2N301IZ2PNuuoWq8fI
         KWAtf2A9qM+Cz2hZwmFJ2T4iUV/uc+zIx3zsyrMa9czltzLdXm2btdEeNJYQmH4a/cnP
         iCw5aObOxEelGC9OHiQ4XpVS3KTDcK/kr4t6lSYxTMZv0+CkY89yNxlx2ZwmxgM/pXht
         h63N+O4c4p0ixUJIq2gVlqj9obK0XvkoI3YBdASRUlvKC0qCd1n4wSMO5IyGniuEQ7XR
         NsofhwXMxgVySoYRXXjnHBXqT8t8Xe7BHSgnhlaO+0SgTAoc7UGenq1DRjBQY1ceZc3J
         odOg==
X-Forwarded-Encrypted: i=1; AKwUvBxwBWZW7aREjEP7WgJkGsxCxSZU1y5iH6/3Rl1ABBYywuLyvDbpwmtwHmMCZ7d045GqXKI9R6ptqB7XJc0=@lists.linux.dev
X-Gm-Message-State: AFuF++mS/xjFpVQjVcD8jgmPpJz8e6611CeWY5N5NsKjECqDMoGdU53L
	RqBoyi8TccdRHKp3GY3KQB/rkIK3EQnEPBtTluo5kN2RNENzeaeO5WVw
X-Gm-Gg: AYBFou2KcEoeJxqS9RuC6spe1HEtoZuxe3S2NkS0vmJNmamMB/3EECUke/6wLWIw6AX
	K91SlBO295vF0qUKly7TF8CfXw088UrLGSoTTcgeelLUl1N35v7D83oepUjdPlXV4T3vDj3q+2V
	bpwV+SfiRqfNsCEvykzJ9dHjFVZGt7aIEfHtXxXwBGdyAHRwNB7CZd6TyHz0DWc4CH72Tk8Q9Yq
	jw2gnRTTq0jIm2tCSFQckDwWIDT08hf7DwbaXJ+T1EKNvRuGUsklFOW10SEOGvRVZj0v04qWdft
	lc59ZV3adsh2NbT1RsB76XheBOLpIwwgO/tOhu5VFmKY30ZUSos5aH5jIa/PYtvbgbso0fERLQy
	vlBNNIumXpjW5E47hjLiGN+X/O8FbqcKK6PX41spCXpMF1C6+OPHrOzzzc4yfQfUtBMTCnMxSOw
	H2fu4PQbh0mh9sqAaQmh1oNiEIKClqi1ybn/m1nfIRsrLTNGL0PnADzbpZDl+twqp7geagbl5qy
	19qse7ZvUwBpdc4Nh8PlSQ7BtXPGsSKv8QkNyg=
X-Received: by 2002:a05:6a20:a11d:b0:3d0:ba81:79b9 with SMTP id adf61e73a8af0-3dd8c41fd70mr1660945637.12.1789697061119;
        Thu, 17 Sep 2026 19:04:21 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:79ca:7a54:4576:24ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2890b915sm136049eec.30.2026.09.17.19.04.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 19:04:20 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Christophe Ricard <christophe.ricard@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 0/1] nfc: nci: do not process unexpected or invalid CORE_CONN_CREATE_RSP
Date: Fri, 18 Sep 2026 10:04:11 +0800
Message-ID: <20260918020412.82878-1-ndaugoing@gmail.com>
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

This patch addresses several issues in the NCI core logical connection
handling where an unsolicited or malformed CORE_CONN_CREATE_RSP packet
can corrupt connection tracking, shadow the static RF connection, and
cause TX queue stalls or hung waiters.

Problem Overview:
=================
In the NCI core stack, logical connections can be created by sending
NCI_OP_CORE_CONN_CREATE_CMD to the NFCC, which answers with
NCI_OP_CORE_CONN_CREATE_RSP. nci_core_conn_create_rsp_packet() parses
this response and adds a new struct nci_conn_info to ndev->conn_info_list.

However, nci_core_conn_create_rsp_packet() had several vulnerabilities:
1. No Pending Command Check:
   It did not check whether a connection creation command was actually
   pending. An unsolicited or delayed CORE_CONN_CREATE_RSP packet
   unconditionally allocated and inserted a connection into
   ndev->conn_info_list, and called nci_req_complete(ndev, status),
   prematurely completing whatever unrelated request was in-flight.
2. Connection ID Collision & Shadowing:
   Dynamic logical connections allocated by the NFCC must not use
   NCI_STATIC_RF_CONN_ID (0x00) or collide with existing connections.
   Furthermore, nci_core_conn_create_rsp_packet() used list_add() to
   prepend the new connection to ndev->conn_info_list. Because
   connection lookups (e.g. in nci_tx_work() and
   nci_data_exchange_complete()) use first-match semantics, prepending
   allowed an injected connection with conn_id = 0 to shadow
   ndev->rf_conn_info. This caused:
   - Cross-connection credit accounting in nci_tx_work().
   - TX queue stall when credits == 0 (frame wedged without timer).
   - Dropped RX completion (cb == NULL on the rogue connection, hanging
     the real waiter registered by nci_transceive()).
3. Missing Length Validation:
   The handler accessed payload fields without checking whether
   skb->len >= sizeof(struct nci_core_conn_create_rsp), risking
   out-of-bounds reads.
4. Spurious HCI conn_info Assignment:
   ndev->hci_dev->conn_info was updated whenever cur_params.id matched
   hci_dev->nfcee_id. Because both default to 0, non-NFCEE connections
   (such as loopback) erroneously updated ndev->hci_dev->conn_info.

Solution:
=========
- Add an NCI_CONN_CREATE_PENDING flag in enum nci_flag to track
  in-flight connection creation commands, and reject unsolicited or
  delayed responses.
- Validate packet length before reading payload fields.
- Reject responses that allocate NCI_STATIC_RF_CONN_ID or duplicate
  existing connection IDs.
- Append new connections with list_add_tail() instead of list_add().
- Restrict ndev->hci_dev->conn_info assignment to NFCEE destination
  types.

Non-overlap with adjacent fixes:
================================
This issue does not overlap with the adjacent upstream fixes in this
area: Lin Ma's commit 1b1499a817c9 ("nfc: nci: fix the UAF of
rf_conn_info object") addresses a use-after-free in the conn_close
path, and Yun Zhou's commit d56575a2595e ("nfc: nci: fix use of
uninitialized memory in CORE_INIT_RSP parsing") addresses a different
packet. The problem fixed here is the list_add() head-insertion
combined with first-match lookup semantics (core.c:43-54), which lets
a forged connection shadow the real one.

Testing:
========
Verified with QEMU arm64 empirical test harness. Unsolicited
CORE_CONN_CREATE_RSP frames were rejected with a rate-limited warning;
conn_count remained 1, and the static RF connection was not shadowed.
Verified with module compilation and checkpatch.pl (0 errors, 0 warnings).

Thanks,
Yuchao Zhang

Yuchao Zhang (1):
  nfc: nci: do not process unexpected or invalid CORE_CONN_CREATE_RSP

 include/net/nfc/nci_core.h |  1 +
 net/nfc/nci/core.c         |  2 ++
 net/nfc/nci/rsp.c          | 37 ++++++++++++++++++++++++++++++-------
 3 files changed, 33 insertions(+), 7 deletions(-)

-- 
2.53.0
