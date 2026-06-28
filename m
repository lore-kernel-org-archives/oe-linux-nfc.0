Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82F93B42CE
	for <oe-linux-nfc@lists.linux.dev>; Sun, 28 Jun 2026 21:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782683429; cv=none; b=uPraY15ASAxdwgFNyo3XodQO40wPNDZMFo4sJfsv7NUKrIDnuHgc/M/Fla0JZfM8QLfTnWrqjUODi7g/p6mIVRv/soPZ2fJ6jHrtZdV79DZQpUbkyQDU3qXPlZZSYl+FS4YyDyvQ/OWqeHxUrDBHaRRYpkNKd6WItnNjj/qbGYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782683429; c=relaxed/simple;
	bh=4qFHrJ8TjRhzwg9eX6E4uCk78ScEs4rJofH5o2OZmu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eh7/zTylh4Mf8LtAdfhgm2tz1CMEOCvZevilCnEXUFNLR9L1gNOcWOZxPDGDd73L4nd53UU13hyLDxylP3y6Id3+iVQFJt03lDxK0hH9gESLt2uXNObrIQoHBL9LF/iNJEQM0f4HNq1JUQczG+nv1JVgGpb3kkug4Jbg/qXzOSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3D4gua7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3D4gua7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c9b42be8feso10374745ad.2
        for <oe-linux-nfc@lists.linux.dev>; Sun, 28 Jun 2026 14:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782683426; x=1783288226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4xJeWro39OB82LbHgE7JTjiXJkNJO0xjWGuLEsvgMVw=;
        b=B3D4gua7/scyJtHDfg+PMPc70OaHlSu4LnUeRD8xNF1i5iT5e1lCLa3ZirUL4hYiF6
         5Ht1BYkIbnwMY0W86OF67QaQouMEuhdzp0yYZX9nuESEd5w4nKw8c4QrejgbmnNiIN7I
         W4wP4seE5IInHQdY57lbola+wGMrKzxzHTw7SdZkdN/o6TLP+AXnTs25wIyMmzsTfrNu
         5BfObxACNslnpCQA+P3avVcTEkGih7YQ1uDJDzcOna/uZiMVOjyp8cKJm2L9GdO0Q+T9
         rgKRjB4s/Hr/aoCO5EPpHzARjTqaSSv1b3kP0QTUFSBvfdkdjdn5NzGf7AgC4QTVKs6z
         mvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782683426; x=1783288226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xJeWro39OB82LbHgE7JTjiXJkNJO0xjWGuLEsvgMVw=;
        b=K68Oy81iRb4sIfKWLMULCk56k3FP6oBeze9+MxK9Htn57eQQUK8Pe+wkx2oGWqqYb/
         cpNAvZsEsAZRH1ylxKDmNMEiyNwJaYYLWQKRhrj+RM1RKL4qKeOLQAZ//38fNAddrd4j
         1GmTQckfUosWFYrIQFZWJQiazGMLbFpUx5x6vkY5LXOeyQPV1QtEUxKhnCIrHVx3iIjk
         6AzNSicYeohX2mzV+rM/95Dka2YXpgPhiMPPq4ew7uWdvjGV02SDvMcH4cLgoHRm32++
         JKuv16u/6/zQNLwLNGhFX4NyZV/1rnJpT8Ht3aF/xpT0cUm7OkK7BslXLr02NGl2oM6Y
         RkJg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9cV7kpc7sb4U7h4q1dLxGnk5CqGW4qG95F0iHx8HxnfD4cdyYnI6CDH4O+h/QXzE5fhH8PzRsap9tzhY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrWPzdZ/tuPqlBH3rKHRz9Vgn+F0Rg0WwIWliiXPMeZ4NZqAwF
	VSQ/P/ybrWxJIR0TX4YuNeiGcoPXWHSHDVKIlILkf9dW6iNeYqz8mvYS
X-Gm-Gg: AfdE7clVgAF0/dV9FVoGXAyyAcjy5pTH4G2EtkBLnhWVzPhzL016u0Qs7H756AcwNm+
	XvWYHr4oTVwrp9Ezh5DTrfif7hP2leL18rtELjzOvKf+ZyHkYuH+47Q+RYzOUaxJqm88JxWgqj1
	vA8F46gsDsuiwgFGmGh22MM3GlvKsggjv7PI3hZGOIMZv9dE2VmcwwYmY//GHkKYAffqHIVA/HH
	SQrcbuOgNgeg4p0uEATWqOUjx+J/KMa21rkrb12EnGjNw2+y+zY7wL+IWXbTd+r2fTe0hIjVuKs
	kAp9MYVwZXyJZnekTg9Q5JeI6SzNgeWiCimpmliAftLi6qWg2wws5FFYRsG6r9VIjgcIi5NboAf
	hdcmCtjpQtMHn6nxZK9ve9iXelrWcvEtuukk+yJKk8Vu6CEt2Ju/WrydwgCCGShzF6b29L11qjh
	K/AwxdFFNRUM8zkg76msKtrU8XjBRHayUF0Q2HStpocDHe0j+eDFYv2bfxk27fMw==
X-Received: by 2002:a17:903:1cc:b0:2ca:281:27fa with SMTP id d9443c01a7336-2ca02812986mr8901775ad.37.1782683426051;
        Sun, 28 Jun 2026 14:50:26 -0700 (PDT)
Received: from node ([149.40.62.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9e95e49efsm14044425ad.52.2026.06.28.14.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 14:50:25 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: david@ixit.cz
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH net v2] nfc: nci: fix use of uninitialized memory in NFC-DEP general bytes
Date: Mon, 29 Jun 2026 02:49:29 +0500
Message-ID: <20260628214929.135152-1-meatuni001@gmail.com>
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

Zero remote_gb_len and skip storing the general bytes when the ATR is
shorter than the general-bytes offset, so that a stale remote_gb_len
from a previous activation does not survive into the new session.

Fixes: a99903ec4566 ("NFC: NCI: Handle Target mode activation")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 net/nfc/nci/ntf.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index 802928ca4d51e..b72545daa2051 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -654,8 +654,10 @@ static int nci_store_general_bytes_nfc_dep(struct nci_dev *ndev,
 	case NCI_NFC_A_PASSIVE_POLL_MODE:
 	case NCI_NFC_F_PASSIVE_POLL_MODE:
 		if (ntf->activation_params.poll_nfc_dep.atr_res_len <
-		    NFC_ATR_RES_GT_OFFSET)
+		    NFC_ATR_RES_GT_OFFSET) {
+			ndev->remote_gb_len = 0;
 			break;
+		}
 		ndev->remote_gb_len = min_t(__u8,
 			(ntf->activation_params.poll_nfc_dep.atr_res_len
 						- NFC_ATR_RES_GT_OFFSET),
@@ -669,8 +671,10 @@ static int nci_store_general_bytes_nfc_dep(struct nci_dev *ndev,
 	case NCI_NFC_A_PASSIVE_LISTEN_MODE:
 	case NCI_NFC_F_PASSIVE_LISTEN_MODE:
 		if (ntf->activation_params.listen_nfc_dep.atr_req_len <
-		    NFC_ATR_REQ_GT_OFFSET)
+		    NFC_ATR_REQ_GT_OFFSET) {
+			ndev->remote_gb_len = 0;
 			break;
+		}
 		ndev->remote_gb_len = min_t(__u8,
 			(ntf->activation_params.listen_nfc_dep.atr_req_len
 						- NFC_ATR_REQ_GT_OFFSET),
-- 
2.54.0

