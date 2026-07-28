Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9343C435AA2
	for <oe-linux-nfc@lists.linux.dev>; Tue, 28 Jul 2026 13:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785245330; cv=none; b=AVmo16Pxpce1VojBJvQWTzLJMg6ao05l7CdzScyZ/bHdTjfOGkEmjqEo/jTKrtziK7GMjghM5DFj1CODHZ/Rv+exwioYHBUHfQ0ZmuDUMDtVRInIrQojA5vYfxpJ1gMy6mjTifg6exURZoG7V9m0BFuo+CfHHweTa5wiA4fL8dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785245330; c=relaxed/simple;
	bh=OAPZdRWyQy4q2zNyz4kGEhF+go9N3BGWG6beizQuBmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pX7WxuAwh1d3XDyCHM8yztI9/6VgGg/gRSSswfRBhghBOdI03LuSe5K9hwmKc6XmAJLOHUXpzw758TQ1/FyxDRhZ70j+KOpgtBYgVrB4e1Ac2y++1H8r9r2JWQ0992+++FDtjQ/tbs2cvwJD37bIXXq0gOYn2gwABeTjI86i4uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6YrS3S7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6YrS3S7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-496b7622a83so20139825e9.2
        for <oe-linux-nfc@lists.linux.dev>; Tue, 28 Jul 2026 06:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785245326; x=1785850126; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jpQekUlMBXKHH4ypTl4Zdo+4HRaR5MNGsxg/blhT7gI=;
        b=V6YrS3S7f2hfSxylDqETZtGleHrKNuXssWl62Iy+YvF/MRvolEEYcmiC21DMlZFXmT
         d1I7+bvsVzja9DcB1yEO3eQ+L9SWQvEQuT4zDHTTO1I1NwbtmMzlxWLyJvye3AQfgolC
         3L7aNiK7l/nXGg/GpMpXULClLakUiRCcNqi5ze+syEglLjBDzjBmhz9Y2n+i2vAKUwfq
         MYWl4Zkf7nalP/dXPTP8tDvvmiuE1e084cSv7QcB63hmxWjh+1Ne4eX0cpyzzg54hsSo
         FsM90/dAtkC5r1blZJIJyOnDFpsSBxC+m2fece7oM2dIdb22JeTswbiqPywuAOs59BWZ
         nkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785245326; x=1785850126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpQekUlMBXKHH4ypTl4Zdo+4HRaR5MNGsxg/blhT7gI=;
        b=qBtOuVz7CGm5jy7S3KUw/io8CyFi54SKa6e5y6g0yeaEs5nMsoRjtsWWUyRK3LCJ3F
         fM8wx6bYeEa30V50Jft2UlVt+xrndAyVwE8rieRw6B1WGGSUxFu5nGvuZbCaeDxH4qa8
         ytW1SIl1zLsnlz0B3GaRBHATqkaJF7xvYWwqEnJTLyCPXqU5rDUaAIaBXWPQ6e2O8qpI
         rBZfciaJuoIgh39J9zDaACg+8b/gWZctnK+HrVSa/gZshloU/KU2yTOOfFsJHS2Cjw2f
         u7FrcRNNpsA34XvXfvJv+JJsCjUMVA+Xko+xyflNcHce3ugau7KQnFyf8Kv1YF130ms6
         S9dA==
X-Forwarded-Encrypted: i=1; AHgh+RrnwL593fTgCTQb9xNfqlfE3uLPykDKKRBY5RA/E3Y+nHkD9OOUbCXF9ckpgWxiJKML2on38A6LzQEeUpU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGy8hDMMY4X69sqUj4G7Gmw1bLFHnS6oMNcv2pyvHhjLtfi8i7
	G2Z/4XgfQiqnPctt5CuEWK5pcp7fS/MRDobwBJrvhwDMh26do/a+2Jqv
X-Gm-Gg: AR+sD11bfmPI/sPjkBWwhcDWLCa/pd+Z1mJJXuaHLZKgIDJizmrMoYtx33cVSJ0raTB
	zzLPGD76vX5K+qMqvm3slrPLihkiHSRLLEQlM+LQnxN70bpdtEHK7LPjRruurr/zRmxPywGTjVq
	5geeklgNBngrs7eWK3Sue2VzN0z+qmds3A0BC8asqzG6wixjL5kHm8NSRcYGjOJFbw/Ut2b3TwR
	g4JIZhLkExh8/SKn99PBamN58fzexNsoksvkT509HEIRlVncG2CtZ+RdiucID6kH1CWjpSFltk2
	fe2qH296s2msxup6MFnFjCL/qFQrHVegaeExKc3KAbdSrGVPCZoUjbVXh7Kaa09bZ5Wej5EK/Xa
	PPfgOMiXbYNjoe79KU4+TOKGbUuWLVk1CZ0VwO7/JeQ3pLH/Q5EZ8+22Jws/ZsDPWki1cA0u6do
	jMHzfbWDMYYeKzAlbMezkjL/0spu9bH9y8ACX873CtaysFRUc4zhMfSms=
X-Received: by 2002:a05:600c:19c8:b0:495:4b00:1bab with SMTP id 5b1f17b1804b1-496c6565e12mr28399355e9.21.1785245326303;
        Tue, 28 Jul 2026 06:28:46 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9b8b67sm359163395e9.4.2026.07.28.06.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:28:45 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: david@ixit.cz,
	netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH net v3] nfc: nci: fix use of uninitialized memory in NFC-DEP general bytes
Date: Tue, 28 Jul 2026 18:28:36 +0500
Message-ID: <20260728132836.41868-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
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

It never checks that the ATR is at least that long. When a
RF_INTF_ACTIVATED_NTF reports an ATR shorter than the offset the
subtraction is negative; because min_t() casts its arguments to __u8 the
negative value becomes large and is then capped at
NFC_ATR_RES_GB_MAXSIZE / NFC_ATR_REQ_GB_MAXSIZE. remote_gb_len is thus
set to up to 47/48 even though only atr_res_len/atr_req_len bytes of the
on-stack atr_res/atr_req buffer were copied from the packet, and the
following memcpy() reads the uninitialized remainder into
ndev->remote_gb.

Skip storing the general bytes when the ATR is shorter than the
general-bytes offset. remote_gb_len is already zeroed unconditionally
at the top of the function by commit 9c328f54741b ("net: nfc: nci: Add
parameter validation for packet data"), so the short-ATR case needs no
separate zeroing here anymore, unlike in the v2 posted upstream.

Fixes: a99903ec4566 ("NFC: NCI: Handle Target mode activation")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
v3: Rebased onto current net.git for-next, requested by David
    Heidelberg. The function moved and gained an unconditional
    "remote_gb_len = 0" at entry (from commit 9c328f54741b, landed
    after v2 was posted), which made v2's explicit zeroing inside the
    short-ATR branch redundant, so this version drops it and only adds
    the missing length checks.
v2: Also zero remote_gb_len explicitly in the short-ATR branch so a
    stale value from a previous activation doesn't survive into the
    new session.

 net/nfc/nci/ntf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index c96512bb8653..e0555c90d657 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -631,6 +631,9 @@ static int nci_store_general_bytes_nfc_dep(struct nci_dev *ndev,
 	switch (ntf->activation_rf_tech_and_mode) {
 	case NCI_NFC_A_PASSIVE_POLL_MODE:
 	case NCI_NFC_F_PASSIVE_POLL_MODE:
+		if (ntf->activation_params.poll_nfc_dep.atr_res_len <
+		    NFC_ATR_RES_GT_OFFSET)
+			break;
 		ndev->remote_gb_len = min_t(__u8,
 			(ntf->activation_params.poll_nfc_dep.atr_res_len
 						- NFC_ATR_RES_GT_OFFSET),
@@ -643,6 +646,9 @@ static int nci_store_general_bytes_nfc_dep(struct nci_dev *ndev,
 
 	case NCI_NFC_A_PASSIVE_LISTEN_MODE:
 	case NCI_NFC_F_PASSIVE_LISTEN_MODE:
+		if (ntf->activation_params.listen_nfc_dep.atr_req_len <
+		    NFC_ATR_REQ_GT_OFFSET)
+			break;
 		ndev->remote_gb_len = min_t(__u8,
 			(ntf->activation_params.listen_nfc_dep.atr_req_len
 						- NFC_ATR_REQ_GT_OFFSET),
-- 
2.55.0

