Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942E830D3F0
	for <oe-linux-nfc@lists.linux.dev>; Sun, 28 Jun 2026 21:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782681399; cv=none; b=siDw+Mi/R1TCF7gtLjpGjRPnPBoP45RFjZ3oZ0ncK4S1fXWVg2xaq4IglCac1g5atZp+zcgTbyyPKZDlsIKREuY7rp/zhI7ot8QiISB7LzUgPs8RLIuIehDtfFkr21fW2RaSBnBAs8sEzlPL6l51ZJlrNP3vtzG2ami3vUzL/Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782681399; c=relaxed/simple;
	bh=wq9vbsRd4z1aEUNzFLhJHF4nnkcAgJGHkCTxiXCvGUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PqXb24ApclgJ6zUpmBiYp/fOIXHUrZCoEci9oNZEazr2fCPyYgFdLTZ7/xw6KW20gKzHFEVeHw9fwc0qqRx6zYW1HB6NadKALAnT/4yRGqAUEG00/lXLQXaK3LA8pU4WnvPL5yVjJtTEfvTgy9UXVMoizGKY+LAQGGoOXS7gryM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iB1PbD2f; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iB1PbD2f"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37fa53bc22dso1596774a91.3
        for <oe-linux-nfc@lists.linux.dev>; Sun, 28 Jun 2026 14:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782681398; x=1783286198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=52R9zl6QfbAW5HIolSvFCYHUPFuJm6lr9c2cx/FRyQM=;
        b=iB1PbD2fF380CRGcE3nh7f7TCtyWflKuqgK+7yqtj6q78Z43YSafGwMZ5fOzOtWNIr
         w0R8HT2QqXMB7LaivINbCyXVdu1ZFyBcjHoYbpWG7JBrs4S+jku2knr11F+LmH3Yk225
         N+69aaJodsuz0hcRd6fkj+0Q8tId7ThqZ0O/dc5hmeQNc6dMZR3FpoNICz12Sg8NR7bm
         6xPz2NwbTLxAcxcP9liDiAb/q90gw5WUN8HChTh5djjX9qsepH36tZ1lIbOWLYYkLBpv
         cSp+mGlIUVrB+zLUkFYDVu8UFoczUoLlzc4Xf2jBq4JhlmwgtJ4wlWIQUK3qwaBVI4LG
         0Axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782681398; x=1783286198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52R9zl6QfbAW5HIolSvFCYHUPFuJm6lr9c2cx/FRyQM=;
        b=snRbO6iRFh9mB1KG8PGs1FActJauxHNSarc+AuZKLCe0Sr/RFtIU8eDr0exDo7B7i8
         XQAlOhk4pOZXHk3fC0EtueE6SURE9dsb2o1qe/JAZnScmIZ41C7gqV78Af4ATEOKdLWu
         dihavBkcZMEvmPXP6LuVmpEOJP8CRPSI/l4EF/65xvURu054q7lEB6rJO8Uhrs+JATm+
         jkYIzzwmCU37vv/fz9zWbmhQWZfyyWZZg/2b0TznSCnPQAiPcmeZo/4p0PJDYYOjVAUm
         ujPbibZLEM5jCN2gDe4JDQmr41xP3eBVpz2jHcrbVvWfLyJjXsroWt5Y81C0Xo5NXQD8
         cKJw==
X-Forwarded-Encrypted: i=1; AHgh+Rpje5SMPPbuboq9H8jM58dDmmzBufsRn7yOjejuy3DTk9/CShMYpsdUChDoD+o7xRmMgL0MLU+xx9SPhIY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2w9NVfhZ0ai57ADCIQVqYFNzanu0iJjLXWStti7IYPNwzG4n7
	ZA5FECXWGnh5QKQ5n8WrG7GodJwnWE0X/sPf6JbR6YekZjHb+KZtYKcV
X-Gm-Gg: AfdE7cnE0yUP0SrazlVzWuuIasgkC6/gC+qwBNHQp0Fi+sPLOFwhLlYz5LRgqpGe2KV
	mHyX88tfPMgBb1HVzopec9ezsAgpzmxLX8Nir9P/nzpHukkTWxfvODTUCTJJlwHs6nM9mwU14YZ
	IvHWjOGnlONxein++dWe9iP0XGRrxiyEfHcB5BsWCXdEds4HadJ1jkn8i2Af2kMdrutBSoIPnRq
	oAsRL8uKkDnu7q5UuFBOVe8FG955K+4QTKYf8h4CVVFdRxm1VLvHZL+uuaY/fznvzYMbHGFrW7d
	qgve0EMbSi0G0JQT1Nz62HbFqq8QgQ1CyFJLjQMWRA+zjpIReKlFarT6kuUxuExhK20ig/p9WJm
	zVJmfArSr6Qtt5ROFfeUPOUfjvoAmy+pbn0epi+p9qxm7tO0lvkW4S+VX6tZOQyvGFfORGm3P8k
	BPBIavYdPqc2gf6SNE1ZXd6SRa8c6fT7M91imUVVtJewNbI+X7go3HRobHjH/AMg==
X-Received: by 2002:a17:90b:5548:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-37fed7e7f5emr2136383a91.14.1782681397840;
        Sun, 28 Jun 2026 14:16:37 -0700 (PDT)
Received: from node ([149.40.62.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37fd2bd0e49sm2403592a91.0.2026.06.28.14.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 14:16:36 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] nfc: nci: fix use of uninitialized memory in NFC-DEP general bytes
Date: Mon, 29 Jun 2026 02:16:27 +0500
Message-ID: <20260628211627.131617-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nci_store_general_bytes_nfc_dep() derives the length of the NFC-DEP
general bytes by subtracting the fixed general-bytes offset from the ATR
length:

  atr_res_len - NFC_ATR_RES_GT_OFFSET   (poll, offset 15)
  atr_req_len - NFC_ATR_REQ_GT_OFFSET   (listen, offset 14)

It never checks that the ATR is at least that long.  When a
RF_INTF_ACTIVATED_NTF reports an ATR shorter than the offset the
subtraction is negative; because min_t() casts its arguments to __u8 the
negative value becomes large and is then capped at
NFC_ATR_RES_GB_MAXSIZE / NFC_ATR_REQ_GB_MAXSIZE.  remote_gb_len is thus
set to up to 47/48 even though only atr_res_len/atr_req_len bytes of the
on-stack atr_res/atr_req buffer were copied from the packet, and the
following memcpy() reads the uninitialized remainder into
ndev->remote_gb.

Skip storing the general bytes (leaving remote_gb_len at 0) when the ATR
is shorter than the general-bytes offset.

Fixes: a99903ec4566 ("NFC: NCI: Handle Target mode activation")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 net/nfc/nci/ntf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index 63aa0a78472b1..802928ca4d51e 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -653,6 +653,9 @@ static int nci_store_general_bytes_nfc_dep(struct nci_dev *ndev,
 	switch (ntf->activation_rf_tech_and_mode) {
 	case NCI_NFC_A_PASSIVE_POLL_MODE:
 	case NCI_NFC_F_PASSIVE_POLL_MODE:
+		if (ntf->activation_params.poll_nfc_dep.atr_res_len <
+		    NFC_ATR_RES_GT_OFFSET)
+			break;
 		ndev->remote_gb_len = min_t(__u8,
 			(ntf->activation_params.poll_nfc_dep.atr_res_len
 						- NFC_ATR_RES_GT_OFFSET),
@@ -665,6 +668,9 @@ static int nci_store_general_bytes_nfc_dep(struct nci_dev *ndev,
 
 	case NCI_NFC_A_PASSIVE_LISTEN_MODE:
 	case NCI_NFC_F_PASSIVE_LISTEN_MODE:
+		if (ntf->activation_params.listen_nfc_dep.atr_req_len <
+		    NFC_ATR_REQ_GT_OFFSET)
+			break;
 		ndev->remote_gb_len = min_t(__u8,
 			(ntf->activation_params.listen_nfc_dep.atr_req_len
 						- NFC_ATR_REQ_GT_OFFSET),
-- 
2.54.0

