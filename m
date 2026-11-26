Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675160;
	b=b1GpRM8P3wfcMHipMkMmVe5pZAgsphs/A4V1vkqlXWyAh8enLCwSDLsi+kt0AjS6OaY/
	 bj3fCRPg++YZ4uqRxW/RxfNTWrP7NDBYzeRdFJu/9KHCbP2owSB8PKjxcikZCjZH/Hqf5
	 OBSJ4vox3iL576RIfnB88hGURBDgZDa896RrKP4iib8f1RlFUSRK7im5Q4zVj8HHZInwZ
	 ngKT0nTSu9t0UybLQznMH060/wE/SiQVIzkf5NjJTzAnCd23tuLQIdhDVohQ64m8H0beB
	 gs3/0YRBABYJ6KnNk3ym7cbhLgNnkELIL5pOH6h5TT1Av6rm0mldFVU0Z3IjDkqDbAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=xkmGAxq189flBILjAvyg9STXPHJ6o5FCln03UiNQz+Q=;
	b=diekwLXeHzzyE95miieR4sZ5yREOZ9UV8AEomjTPDIbgXixx0mvAgyACBQjIo8sE8TQQ
	 tSYsxH3PVmGcCimSZzjb9l6c0faqc2GIvs4DiS2SbFg0Azzkmjs0hirhA5hAAdwEGMEOL
	 j9uBzqPkpfkxTgBtiLjQNjCmXBIqf8MOK3UyfX+fvUDfc+pZdUCSQypHthz/SMygiFIXD
	 O4TOruSXVmfbZ6JNNa70o5yFhEQRek/bsBP7rU63EIrZmoEWr79E4xryo6z6qlMbYdq2h
	 xNXE7JQtH9GNkl/3cTuKwt2orxjtJ91T88AS8UEyUyk1TqB+fnosCoP83aKiOO3u5Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KGy4+23m;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6EF606A31C
	for <oe-linux-nfc@lists.linux.dev>; Thu, 26 Nov 2026 06:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE6EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KGy4+23m
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so1835710eec.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Nov 2026 22:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675159; x=1796279959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkmGAxq189flBILjAvyg9STXPHJ6o5FCln03UiNQz+Q=;
        b=KGy4+23mHBCr2BYkLjOQPut3x/g8B/BRplV8M+PnsnJZ/0EF0ZkoKhju8iWR4ZGObs
         7GFeqWS6rgLidfSCMgf0fHUuMLPRgbamig4bMOtZqBAAuk1x9NhOkTmrdoWG2VFkkikA
         vfRVwo/Y877T0yji45QiFbNCsPUIX1r3gX3OksOeVEGcXw7T3Xt0qHritlAYvHpTj5zJ
         6GLnvL6OMB+P9D+UtNP+l0RnmUx3jm7Q6gsLLVXgmwlOKIAGnPINmPTfK/x6VEpobCWb
         2yYOVHojll3hN7EmyLhhdVDoRY81TqupNhkHupVS6nxFeE9BybSn5Yy0B8fDJ+F3zSAq
         jK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675159; x=1796279959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkmGAxq189flBILjAvyg9STXPHJ6o5FCln03UiNQz+Q=;
        b=BqvutQWzZWEU3HkGww+IEGk+Ar45fWxVzNwm5gHktZQ7gVC4xdUDLKcipzdvz5R6cu
         j7qkgf3rIqdyQQvdVpPT9NXFo7Dt5TGxblFubECuLh6gzenUj/zezl4CAf5kfLmDf8fY
         tZHCw+XnK8c9AIr6Gc75ESwLO8gMSa9Z5jqyic/1/fjlAxDTvf/+5e/Resr+c1S2kRf7
         eSW7aZaUMmg2yPeUu8IlfPuuGiq2rKK+i2nVv2+OJjq/HJdWc4FbqrtDDGvZ5qNiPNXv
         eKB2IpJylFo91/1D0vzlaE49Rf/clLzCk2oiAwueLYAhoRWeH7o/5TY0wcxfvQpnzmem
         S2vA==
X-Gm-Message-State: APuU4Z9WlrnOxUIE7DR8eoHXOYnGadLP0cxysXXLEN9UBx0S2JDyxdrd
	s+39KI0FROU505UMXYJBd1UYKFRhHfTKQMOeHc5/aJRLPCtRHcUORwCP2S4NSeZQRa/r5JaFax4
	=
X-Gm-Gg: AZFdTZeyBxQxYhWEZHcfbcIZZYrSNXN3ZImiOhT0ui2TJoliZHypJew/u1XE/XGACOI
	JQERhKSnlPjvDf/b17pKyfU+Zo5AbDLhQeXTL71INZg/d1N21A6DSKyGW/nWOktltf28dxfwejF
	Tra0Y5H4BiZhlRv8XQ5yF9cPzuWr5yTuiV54zU5Jb5Ln4cCBEU8/I2XlQs2lqtCbBzAjjWRFRLr
	pYyrabO84K+A+cuDmMjAC3/7YeEInXRK2E2sF1piubzxMGTd5IKgwTdsKZpLR2rfEIJJIKf2G6E
	2LR+lGFyHAc5YHyUHCSKdMcNV9QBx7sBUPImKrVBaVzEZViARmYc11FfceizXl5bSPZnmr12emk
	N85egFVGkhvT9/8xGj4t5F8qEavwzZLDt/5+USpbxpPP34O1gRbMTf6hx1tAGIC2UcpiyxEl8lj
	KoZZPkNFPB1LzzO+k7THojp7ym0ustirbn6kGFmFn51QTxQjyLadslQU6r8VVF4b2dTdXsbs4Hm
	jLp+GrYKY/M/hngHivvrXqEFL5qvU4USNgUrRAA0DdMmJbT4AL2Y7lDsba22s6NtpOMhabjNDXv
	CsyGi1nbUeLXAHbsk4ZkLfTzxNes+3YdQ1VNGya2OVk27EzvgXz2RhuLXKEn3mZqGSXQ2WQlG6Y
	frHg9xM5lOkPN/vYhWbbiJDfkHqcfkx6i4cCGUBwG9KrKUHZA+WpHX7Eb77wKIojh3QoGnY3oo6
	h9APWiDoum6OkugFmBG7YTXoKiu32wf6dCiA2HOUvvVjLRRW9B6cPRVc1HVpsCeQ==
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr14457931eec.31.1795675158864;
        Wed, 25 Nov 2026 22:39:18 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-3-38-183-164.ap-northeast-2.compute.amazonaws.com. [3.38.183.164])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm55404015eec.13.2026.11.25.22.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:39:18 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v4 0/2] net/nfc: fix skb ownership and NCI status errors
Date: Thu, 26 Nov 2026 14:39:09 +0800
Message-ID: <20261126063911.353-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

Hi,

This v4 series addresses the review findings on the v3 NFC callback
ownership and NCI status-error patches:

Changes in v4:
- Patch 1 (net/nfc/hci/core.c, net/nfc/nci/hci.c): synchronize fragment
  purging with fragment reassembly by splicing queued rx_hcp_frags onto
  a local sk_buff_head under rx_hcp_frags.lock before walking and
  allocating the reassembled skb, preventing concurrent purges from
  racing with skb_queue_walk().
- Patch 1 (net/nfc/nci/core.c): handle nonzero err in
  nci_nfcc_loopback_cb() by freeing skb and failing the pending NCI
  request instead of reporting NCI_STATUS_OK.
- Patch 1 (net/nfc/nci/core.c, net/nfc/nci/ntf.c): free and clear
  stale ndev->rx_data_reassembly on NCI data-exchange timeouts and
  interface error notifications (serialized on ndev->rx_wq).
- Patch 1 & 2: expand commit messages (including user-visible SO_ERROR
  impact in Patch 2), add Fixes: tags covering loopback and NCI timer
  paths, and place Fixes:/Cc:/Signed-off-by: in a single trailer block.

Validation:
- Both patches apply cleanly with git am on v7.4-rc1 (6628e7d4c6b2) and
  pass full-tree scripts/checkpatch.pl --strict with 0 errors, 0 warnings,
  and 0 checks.
- Full x86_64 KASAN + kmemleak bzImage build passed with all modified NFC
  drivers built in (NFC, Digital, NCI, HCI/SHDLC, NFC-SIM, virtual NCI,
  PN533, PN544, Microread, ST21NFCA), and W=1 compilation of all 13
  modified NFC object files produced 0 warnings and 0 errors.
- Real QEMU TCG verification ran 32 NCI 1.0 MIFARE status-error (0x01)
  exchanges as euid 65534: unfixed baseline returned SO_ERROR=-240 with
  47 kmemleak unreferenced objects; v4 returned SO_ERROR=16 on all 32
  iterations with SELFTEST_STATUS=0 and 0 kmemleak / KASAN reports.
- Real PN533/PN544/Microread/ST21NFCA hardware was not exercised.

Best regards,
Bin Luo

Bin Luo (University of Electronic Science and Technology of China) (2):
  net/nfc: fix skb ownership on data exchange errors
  nfc: preserve NCI data status error codes

 drivers/nfc/microread/microread.c |  3 +--
 drivers/nfc/pn533/pn533.c         |  1 +
 drivers/nfc/pn544/pn544.c         |  3 +--
 drivers/nfc/st21nfca/core.c       |  3 +--
 drivers/nfc/st21nfca/dep.c        | 26 ++++++++++++-------------
 include/net/nfc/nfc.h             |  5 ++++-
 net/nfc/digital_dep.c             | 32 ++++++++++++++-----------------
 net/nfc/hci/core.c                | 27 +++++++++++++++++---------
 net/nfc/llcp_core.c               |  4 +++-
 net/nfc/nci/core.c                | 18 +++++++++++++++---
 net/nfc/nci/data.c                |  8 ++++----
 net/nfc/nci/hci.c                 | 25 ++++++++++++++++--------
 net/nfc/nci/ntf.c                 |  5 ++++-
 net/nfc/rawsock.c                 |  5 ++++-
 14 files changed, 102 insertions(+), 63 deletions(-)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
