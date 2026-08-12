Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1264052B1
	for <oe-linux-nfc@lists.linux.dev>; Wed, 12 Aug 2026 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526691; cv=none; b=rnSTuim2fr70bGFJLfp86m8PUOT3HFVugL/mCfDwW/YxyEsnIwhv4ufNIcKiBdKzmnk3QND0Xw5OpFnbqr1S+9czjMmuCNLM7Sv/s65SeHGVqrpN5pT1eOVkkmoZphPKyUX8DiUJXxbDgqRjzIw6seQHMzLlVephFlHdw5YFNpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526691; c=relaxed/simple;
	bh=xMZ9LKd7Y4IqdZ/gTTx7waSmUHvUp6ONCJSsGWAPp3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FONzWujpy8nNH1Ag77ep2UQOyHuAuIxiqjTzOZNGs5FW1TsZuVNeIkNVpMuTx6TrTIUSvCSjhepMqfYj1WSHoWlGiamtCZV6EgeRL+5/333QTACcFGpwkxyfYENXTPYhj7JhgIDaC0IUlHEtDyVHrAu5Id5gleqb3GlKGLCKGNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvD+JndU; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvD+JndU"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so576177f8f.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 12 Aug 2026 02:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786526688; x=1787131488; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLJ77/vbQiJHKcovBSZ6qUF923u9W7YbSMMe93GKMVQ=;
        b=AvD+JndUxz3TEYLnDYbMQPnNWyGC47Z6xtTDqDOLbXtj0qi8lkIJxsc0w1KmxwcSER
         cBWkfIqPX2rbKpNUVtmz2IIOfGGEOqiwFyBec5FuvpxwX/p/b/Tr4LoJoel7Msp4dRAI
         71tJSDyZI2fQ+9lYGY07EsEGyruoLOI3/Dq+6Q65QeGTl9987UTkszFhusz4fkqUH6aX
         uN8BJvJ9pNTqJPLelNriHT2sjYhtBqiDIVsvANuQqWghLcXPJobziJIBS3Cky2QGb1Ft
         DvSk2F2XQKeca8VOHmyTfoNvG3fm3MgvnCUafUzuAwbFPNjxmS6VL/I1ieWcA8fDRKqm
         fEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786526688; x=1787131488;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SLJ77/vbQiJHKcovBSZ6qUF923u9W7YbSMMe93GKMVQ=;
        b=WfqioLsuvYJk52wu/YbE1Wl6t/y333qCLgn6vryiIhalOEfLIBo5MF5gKZyzsOKjOp
         hiacVavLQLhhd/1mCBv5qIcHwBhwzInYyopkeQp6iBKLE/5ofQO8dsrPPYtuow1A6kaj
         WiqJSC6tfga5nI0tm3gVM6/8EJ7l1G5aUlQ74y8cGiSAobw2qrPS9cJwcfOB+l9ioWpD
         95uPo7uaulROXVzCzm5Xp90I3P+EMuNwoBif6hpmaS8yVk1hxDmNWN1PmY/SJ/HM6KZ+
         zFNK1jlzYp6rBFsGRO4r/OxtFlPCMMIuXkJgxN13nIPhv8gqbRZA7TvL2j0H4bWru6zB
         Lpqw==
X-Forwarded-Encrypted: i=1; AHgh+Rpurhd1eL0E85+5xeNZSepOT4CRB5Cntcwudf8k1g27DEWuD84shgEC5Teogljt+fI2Q9D2mYC/FaBeutU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyxHwym0m+7XauUbQU1DS3DVbjSpS2w5Ngl0SxFH11OYZn8KOT
	o6SL99tPDh8zTdPTr1iQZVTQtBf0S600KfNqWEBOVcId5QSFYp1BVovA
X-Gm-Gg: AR+sD120c28AAQXG+PILfWzsyWz3RHM5uHbSSMGP3MMLtHnyTimQgCSV1BCPlED5Ws1
	bZkK46uKMrhU5PWWnxQ4OhK1199MMkdcx8deiytv9C39V9+Eio+efeO/019cs2O8vJ9CtsMbGV/
	BR19u8Ilcxs7Wm8SRnBfSZPYZrsg7pSRiBox6AP9q6H8Qwp9WJ6yznU4EkvSNpmWs5dUt+A7nOP
	2XiykNCxFWp/R7msQSq6oWvzCK7aCY5uTdfv37bnui9JN+retV+opqutZZmdZSxomcYQAT7eddg
	GMb2CLMFUMhXCkln/WZL6P5BoBHxDSsjqyWkfNPvlywkOsOrduOa4JacPctStxwm7AigZBQVg11
	UdGJ6+IAvQYjcNHeKNS8LpbIZwsTF4pdHiQ2Ewmujq3Ibdq8D/yf1++DB7WEX7U3C/N5i9S7d9e
	sLQ7S6tYr08qeVLaURYJid0C4mQlB9hnM6j9XB4Qtsz5lfJxMwLooUXNmvhMmPkDigkHzgOb2rp
	68BgbPVpfg5RzwaoI14fVvEmZ/+kwXFXMxMaJYbdA==
X-Received: by 2002:a05:6000:400e:b0:47f:7964:9887 with SMTP id ffacd0b85a97d-4815290c662mr4271585f8f.25.1786526687523;
        Wed, 12 Aug 2026 02:24:47 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815231c308sm5152338f8f.11.2026.08.12.02.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 02:24:46 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	david@ixit.cz,
	snowwlake@icloud.com,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH net v4] nfc: nci: fix use of uninitialized memory in NFC-DEP general bytes
Date: Wed, 12 Aug 2026 14:24:23 +0500
Message-ID: <20260812092423.161497-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nci_store_general_bytes_nfc_dep() derives the length of the NFC-DEP
general bytes by subtracting the fixed general-bytes offset from the
ATR length:

  atr_res_len - NFC_ATR_RES_GT_OFFSET   (poll, offset 15)
  atr_req_len - NFC_ATR_REQ_GT_OFFSET   (listen, offset 14)

It never checks that the ATR is at least that long. When a
RF_INTF_ACTIVATED_NTF reports an ATR shorter than the offset the
subtraction is negative; because min_t() casts its arguments to __u8
the negative value becomes large and is then capped at
NFC_ATR_RES_GB_MAXSIZE / NFC_ATR_REQ_GB_MAXSIZE. remote_gb_len is thus
set to up to 47/48 even though only atr_res_len/atr_req_len bytes of
the on-stack atr_res/atr_req buffer were copied from the packet, and
the following memcpy() reads the uninitialized remainder into
ndev->remote_gb.

Reject the notification with NCI_STATUS_RF_PROTOCOL_ERROR when the ATR
is shorter than the general-bytes offset, rather than silently
continuing. The return value is not decorative: in
nci_rf_intf_activated_ntf_packet(), a non-OK status here skips
nci_target_auto_activated(), is propagated as the completion status by
nci_req_complete(), and skips nfc_tm_activated(). Silently continuing
with remote_gb_len left at 0 would report the malformed activation as
a successful one with empty general bytes quietly substituted in,
rather than as the failure it is.

This bug has two independent points of origin. The POLL-mode
subtraction was introduced in commit 767f19ae698e ("NFC: Implement
NCI dep_link_up and dep_link_down"), which is where remote_gb and
remote_gb_len were first added. The LISTEN-mode subtraction did not
exist until commit a99903ec4566 ("NFC: NCI: Handle Target mode
activation"), which refactored the POLL-only code into the current
nci_store_general_bytes_nfc_dep() and added LISTEN-mode support fresh.
Both are tagged below.

Fixes: 767f19ae698e ("NFC: Implement NCI dep_link_up and dep_link_down")
Fixes: a99903ec4566 ("NFC: NCI: Handle Target mode activation")
Cc: stable@vger.kernel.org
Suggested-by: Lekë Hapçiu <snowwlake@icloud.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
v4: Return NCI_STATUS_RF_PROTOCOL_ERROR instead of silently breaking
    out of the switch, matching the behavior independently proposed
    by Lekë Hapçiu. The break left remote_gb_len at 0 but still fell
    through to the function's final "return NCI_STATUS_OK", so a
    malformed ATR was reported up the stack as a successful
    activation instead of a failed one. Added a second Fixes tag:
    767f19ae698e is where the POLL-mode subtraction was first
    introduced in 2012, predating a99903ec4566 (2014), which only
    introduced the LISTEN-mode branch.
v3: Rebased onto current net.git for-next, requested by David
    Heidelberg. The function moved and gained an unconditional
    "remote_gb_len = 0" at entry (from commit 9c328f54741b, landed
    after v2 was posted), which made v2's explicit zeroing inside the
    short-ATR branch redundant, so this version drops it and only
    adds the missing length checks.
v2: Also zero remote_gb_len explicitly in the short-ATR branch so a
    stale value from a previous activation doesn't survive into the
    new session.

 net/nfc/nci/ntf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index c96512b..c2352ea 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -631,6 +631,9 @@ static int nci_store_general_bytes_nfc_dep(struct nci_dev *ndev,
 	switch (ntf->activation_rf_tech_and_mode) {
 	case NCI_NFC_A_PASSIVE_POLL_MODE:
 	case NCI_NFC_F_PASSIVE_POLL_MODE:
+		if (ntf->activation_params.poll_nfc_dep.atr_res_len <
+		    NFC_ATR_RES_GT_OFFSET)
+			return NCI_STATUS_RF_PROTOCOL_ERROR;
 		ndev->remote_gb_len = min_t(__u8,
 			(ntf->activation_params.poll_nfc_dep.atr_res_len
 						- NFC_ATR_RES_GT_OFFSET),
@@ -643,6 +646,9 @@ static int nci_store_general_bytes_nfc_dep(struct nci_dev *ndev,
 
 	case NCI_NFC_A_PASSIVE_LISTEN_MODE:
 	case NCI_NFC_F_PASSIVE_LISTEN_MODE:
+		if (ntf->activation_params.listen_nfc_dep.atr_req_len <
+		    NFC_ATR_REQ_GT_OFFSET)
+			return NCI_STATUS_RF_PROTOCOL_ERROR;
 		ndev->remote_gb_len = min_t(__u8,
 			(ntf->activation_params.listen_nfc_dep.atr_req_len
 						- NFC_ATR_REQ_GT_OFFSET),
-- 
2.55.0

