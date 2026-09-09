Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6F613959D
	for <oe-linux-nfc@lists.linux.dev>; Wed,  9 Sep 2026 05:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788931223; cv=none; b=JtfelXqbpw5ZGFJVaCCGabIf7eEaI3/a4o2wZ4N8x4Oy4eOQmRv3eyA4aU1ViA5PTFVrJRfiRB3Ooe2vdK2Xh+Q4ZG/PvP6KtzHrSmPYsZ6Q3ZDKF3PfX3UFaIXaD3VlSBURSqaeIee57sPtyzsRqljBXXJ5Gc42GobtCYXO1jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788931223; c=relaxed/simple;
	bh=6GRgVD5TlHUcB4Yfs3UD57oj6nYQ5AAP1lZaClmnwuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RSXRGqcj8Eu+h7lKTIFXCS0L55kUPCyBt//wA/EAjkrWpYm1Cydu825ATHO1Y7Bw3QcHJnggERtyCTMKcS5z7TXS6PbS89aEwvHguHDcHlKW59Vnero0M/yEolV0VPuheosQSg2RrFDfmM3sQIhhbMz6YdfA5GqE2BIbLqBEgLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=OQqvu2DL; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="OQqvu2DL"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d944747d41so59298005ad.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 08 Sep 2026 22:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788931220; x=1789536020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFArgWxamKhfPZe43+V+EkvskIUCY9GoJkM/i4cqerY=;
        b=OQqvu2DLbD/SGABMDd1OL0XaMZT7wG1Z8APvlWBTgOv3h092bctBJ7YUhznMqJks/9
         J8ids4Wj++A/rtLky2k3LBav/uQ8JXQB95PY8Ril5P1E52KWcFoPxrpe3B0EsBskiyFi
         to3VN8XJrWSERNgqJhfTCIDOXLTjb836hdCWvJn9XvsA+BAVU7Firw/mSn9Rd5DU5HSF
         jEXUDSxHujwWAz5513m+8SW6Uxdnio2CyK+qiuAwrAgoAhYBy8TfDpcTW0zlyi8V9+cR
         8BgtO+EOeljtDpG0PzR9RnmRtjMhCWsS2dCwiHY0fxe3zxJ3UrDj1PuiV1T0MwVIZsQO
         db9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788931220; x=1789536020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFArgWxamKhfPZe43+V+EkvskIUCY9GoJkM/i4cqerY=;
        b=PFLK29Jw8b6eAuMI/cOb2Oltle/agWCCxIB3+tfP9LjL49Wse+At6rrYpmhiu0SUXM
         3EMO6c49LsxapJKA4T/jfUCeJiyyPo1w1jcgK3wUM1yfnI8UC9+/UTcJVo7wwT0lC5me
         TqJXhrBc7CisdaLN1t4FmihDsp2lVa3gRBxxIRcQ/XiKFMA7lFpJBn9b6h4QaaDevoCN
         ijvPFogSsDdFCJKoLp05GxHrywray6NNR5ImwVcCPPI1RnXlWT29HkbYcHyKhyt9wN8z
         vn7UtOU9gUhU9xz7bhf6pCGTiiuILswsuFta/EweZmkEO6VHCfTRqsN+s00bXKJJQQLP
         lTaw==
X-Gm-Message-State: AFuF++mwlp6YnDoRq3bKCDDjFxRRxXB4RjRbIQWWnmGgtDWIxvCW5FJ3
	OFGwWKaTuJy3M8Stim8bJp6LxAmfK9lKAAYvWajIoRWGf0ILhqnrBWKg8FJMTqSYdldzKVDJfs4
	UOh16wCenjF8=
X-Gm-Gg: AYBFou2DR4zfT6hWGaI93wvWqTffJKe1nYlL1xFNeak9ppWkEr1YNx2y6jihU1gdQds
	bB0GhHnwFyHWfYHsshGUSTPEodm/WftbL7cImKQN3sJGlW755TMuaEvjF50vvD4uUCUpimq5/Yf
	MXgaO45axSFTg4jVrbBBMGGTaBEVACt6TKoVSk+bKRgiGfTat6+cs1YcO6ssD5U7WPyL/YsFWKF
	z74PjSVM8V/zNQFfQZ/zv7SATkmOs2mXkOa/qFcBtN/zxN5e8QtLL68Oxa8AxUzTp6iRO1rYHZ9
	xYT6aZIsEBjoNip4FJ1kjWCzRngN0bqJoSIHOHRyFALLV3fUcMuxCiAppUkeH2F8Ypxs1zHQYp4
	TmmkyBbAxw1zdHHGnNg23FbwGn0RRQhrjcgHFgPbMvazodaZ+OBRwA6RT+s2dScbFwMi6LLxNRG
	o6wvyGs9vKP9mqnZAA3XrRPhaTIEaexPm+nPzATKAwKSg/fTKyG0xxfrHvWPUdJ9TRmnLoImB0c
	DUzzmBP
X-Received: by 2002:a17:90b:5106:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-39b260feb03mr48275601a91.4.1788931219655;
        Tue, 08 Sep 2026 22:20:19 -0700 (PDT)
Received: from enjou-Legion-Y7000P-2019 ([165.232.167.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm40920142eec.19.2026.09.08.22.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 22:20:19 -0700 (PDT)
From: Ren Wei <weir@nebusec.ai>
To: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	horms@kernel.org
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	kees@kernel.org,
	pengpeng@iscas.ac.cn,
	raoxu@uniontech.com,
	rosenp@gmail.com,
	dddddd@hust.edu.cn,
	joe@dama.to,
	ian.ray@gehealthcare.com,
	kuniyu@google.com,
	linma@zju.edu.cn,
	vega@nebusec.ai,
	rakukuip@gmail.com,
	weir@nebusec.ai
Subject: [PATCH v3 0/1] net: nfc: fix use-after-free in nfc_get_local_general_bytes
Date: Wed,  9 Sep 2026 13:19:23 +0800
Message-ID: <cover.1788841682.git.rakukuip@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luxiao Xu <rakukuip@gmail.com>

This series addresses a use-after-free (UAF) regression introduced by
commit 6709d4b7bc2e ("net: nfc: Fix use-after-free caused by
nfc_llcp_find_local").

In commit 6709d4b7bc2e, nfc_llcp_local_put(local) was added right before
returning local->gb. However, if the reference count drops to zero, the
object is immediately freed, causing callers accessing the returned
pointer to trigger a use-after-free.

Using dynamic allocation (e.g. kmemdup) to copy the buffer was evaluated
in v1, but it led to memory leaks because all callers consistently treat
the returned buffer as borrowed memory and do not free it.

To solve this properly without lifetime issues or leaks, this patch
refactors nfc_llcp_general_bytes() and nfc_get_local_general_bytes() to
take a caller-provided destination buffer and maximum length. The bytes
are safely copied before dropping the reference via nfc_llcp_local_put().
All callers in core and drivers (microread, pn533, pn544, st21nfca,
digital_dep, and nci) are updated accordingly.

---
v3:
 - Include <net/nfc/nfc.h> in pn533.h to fix build error in uart.c
   caused by undefined NFC_MAX_GT_LEN.
 - Restore nci_request() in nci_set_local_general_bytes() to preserve
   ndev->req_lock synchronization (avoid unlocked __nci_request() via
   nci_set_config()).
v2 Link: https://lore.kernel.org/all/cover.1788157545.git.rakukuip@gmail.com/
v2:
 - Use caller-provided output buffers to fix UAF instead of dynamic
   allocation (kmemdup), avoiding memory leaks.

Luxiao Xu (1):
  net: nfc: fix use-after-free in nfc_get_local_general_bytes

 drivers/nfc/microread/microread.c |  6 +++---
 drivers/nfc/pn533/pn533.c         | 14 ++++++++------
 drivers/nfc/pn533/pn533.h         |  4 +++-
 drivers/nfc/pn544/pn544.c         |  7 +++----
 drivers/nfc/st21nfca/core.c       |  8 ++++----
 include/net/nfc/hci.h             |  2 +-
 include/net/nfc/nfc.h             |  3 ++-
 net/nfc/core.c                    | 15 +++++++--------
 net/nfc/digital_dep.c             |  8 ++++----
 net/nfc/llcp_core.c               | 17 +++++++++++++----
 net/nfc/nci/core.c                | 10 +++++-----
 net/nfc/nfc.h                     |  3 ++-
 12 files changed, 55 insertions(+), 42 deletions(-)

-- 
2.43.0
