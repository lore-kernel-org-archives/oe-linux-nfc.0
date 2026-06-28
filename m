Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23FB3B583B
	for <oe-linux-nfc@lists.linux.dev>; Sun, 28 Jun 2026 21:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782683135; cv=none; b=HBiIA05GJ+Kq1Cph20EPUIiu0Qmw7UyFotA/ylGj5Rasx+iz4JclJIZ8oXNNArtJnDbPOf2ngMeFNbsnEgMzeEs6hpyiShvA6K93R92vRaMHVkYFnYj511VCvhQ3GiPiukuDcS8ZOnQJglqUxVZhrbC8KVOuP5K/ERcpMcL2v+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782683135; c=relaxed/simple;
	bh=4qFHrJ8TjRhzwg9eX6E4uCk78ScEs4rJofH5o2OZmu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lc3Gq1U/3dL2DmY/LIqNUz+XgOLPwIPuPNUFrlM3PMe+mvawkCHJmoing/YY+SuPKu/375jFrc0+9DYPTE6oSjfnELQ9ZCFVoSiLcO87RDqptEkgKn0p7rz5tBWjLGhz8Ta3KZPJbRaA3r9P/uZppXKQf9J+ZBsAUefO6ZmUiKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRfhMSGt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRfhMSGt"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c99672293cso11274915ad.2
        for <oe-linux-nfc@lists.linux.dev>; Sun, 28 Jun 2026 14:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782683132; x=1783287932; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xJeWro39OB82LbHgE7JTjiXJkNJO0xjWGuLEsvgMVw=;
        b=GRfhMSGtgsTamMwiK2V604cC+uVkpG1RRbBuz5DKXzfwZM0NOUGPmLiol7iTV+zjaC
         gtaJ5k0HlEPC5KDq8i9UE0IqpwgnGxMR5Pk2LkX/OR3QJsOhglw3DNP71dGYQciPkKUp
         +0C0kAKMsTXga4nHpopi91LEjFHpnR5Ez0oYe56ldNYnvvxz6LZndAfHVhPyZeiaZCCO
         fTq/VXkF75XP6JH/zODhelnXESzgGni2FpiSR+1o43mvMwckeWsV/9puoare1LTHEwp4
         Y+E4T8UvnveP1iXrOoaS62uo8XDJxxpMyh5WYIfgq+pdUtZCnebKTG+qRSvteZayUpZ3
         dpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782683132; x=1783287932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4xJeWro39OB82LbHgE7JTjiXJkNJO0xjWGuLEsvgMVw=;
        b=VxslYQbX/fsHzfTEOXjHoACKvOWfzo76tW2bxSdUGvgf9rYfxgoqSNKH0vuYBEnWRK
         DZ2SXvi/te7Za7JOkzDvzcBIRPRJmfWXVoYYFe6TZTEtguowFJjXOCRanJMYGn+pPStH
         3XG4cy6auwedfy48IOQiHcxk1i5A7jslsoKbSjj3MjoKmjPg27g7Ezdi8uM4IqosnxcJ
         OErHRlkV+QnX7iTAMTWYVpD6iONeLtJL7NiytbdNdUbvpJ4fTYi3KAMzorXGFEugW7Ow
         ziYY4OIl+fhZxpc3QT2MYcImAT6psbkNs0L7oG4VYtAAf0kyw61zj5P3lOxMcy0/N6jk
         Vmqg==
X-Forwarded-Encrypted: i=1; AFNElJ96RPRSoRIaRaR2AOGO7513l5BWAO/RLpPDqGrJo4oqWOoPOpVbd2+cR+JyzhZkZdBcqb17FjlHus/qALM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGbNFEyDUOFBeErO79nGFvt2DhHlOuvQiOiAvw3kyLjGzwh4MX
	363uwx/I1J9bvnAqjp8+f972sCcR6own9vhNG/qRkiaoVlye0Ay5MrWw
X-Gm-Gg: AfdE7clLTFjH9wSmSQCLI1WV9EdjtPbu9zOI+zXbguj8heva2hjj+oAi9YGnsxWG6Nr
	Az2IGrNWBToD7/ggUCUqbratw9wFd/w9f8Id3bf8yR75WNEjfCD0m2jZ57sSsjnn6rAN/3HPl+z
	kNZq2qPO/G6cTkWcBGu1gt/RtECCmab6NTMblIgjrS/01myQJBHZuxINmzdVUmCkuYq6Bk8VhUD
	+fkz9riz4mx7xIgyJLf66yoP8wKgrVGTnbvcixRZEFdY/N39Zl0VlXPYl1hmCa8cH+q+HQsRUpH
	pRssvf4zW+j1Q1bSD896CMFYvdq8sP8lj8eGqF5Z1CK+Z6QUxXa8m9S9WzTnme+6664SAmR2fhH
	GPhwLzb2IyL6IRgZOmXqKz0zaVPXF4AADG9uwy0pzT/H4iQuBGi/sxQwjs9nws3BzRoH9KuaLma
	iOlWgj7NixdlhZujVMTxL88C83yFN5DrIgeikp6CBrtmA89y85Kqg/qX5nDZDj
X-Received: by 2002:a05:6a21:6f8b:b0:3b4:b276:3650 with SMTP id adf61e73a8af0-3bd4b15313bmr13996540637.26.1782683132169;
        Sun, 28 Jun 2026 14:45:32 -0700 (PDT)
Received: from node ([149.40.62.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bcc91f6dsm6572185a12.27.2026.06.28.14.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 14:45:31 -0700 (PDT)
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
Date: Mon, 29 Jun 2026 02:45:13 +0500
Message-ID: <20260628214513.134855-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628211627.131617-1-meatuni001@gmail.com>
References: <20260628211627.131617-1-meatuni001@gmail.com>
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

