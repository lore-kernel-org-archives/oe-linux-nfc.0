Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2F835DA7F
	for <oe-linux-nfc@lists.linux.dev>; Wed,  3 Jun 2026 13:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495185; cv=none; b=V3fvTLmX0rhaJbG3hLFKH2lwASXWEoQn4k8JMCOQBSrfnQ2Dw49Z/habJR4FyUL9Mp+h6250LICD9dqHJRh0xzb0Ji+ZdSUWWruWxSuWWfu2cVp9uY2uLxSG5eyHGtzX4h3Imn9NUT4olRmpGI2WcaoTwhas5pw45EsaNMj8QwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495185; c=relaxed/simple;
	bh=yUcITEvuG4jog3LZnNkxt0FkhnQ5MYylhkYJGr0OQPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pmdBQkw5l2vodfetO1gwrWOYKz96t8w27hguDewK2Glq/aRQfUaxwylwa7SDuiGm71Xp9I3VAznCsOTgFLGtYuSdqPluGfDoIFaT3kZvhXsYrDUxmyFio9w5FDv61xRJIND0Qv4XBkZgevGiELJdVTwqDdXlkgaQa2YwMzzU0xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=GSVjxgj8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="GSVjxgj8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso4295445e9.0
        for <oe-linux-nfc@lists.linux.dev>; Wed, 03 Jun 2026 06:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1780495178; x=1781099978; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1p4OnpYDXMpkwZDQAdqQJhqxfh5Hb6QqekAS/cW1P68=;
        b=GSVjxgj8axgLWJOsXpkUFobVVKX8OlSIqYukFkdAhIRCGxqjxnlLIULkkC3iUWo4Xt
         TNzxDBVbBaOcI4kLdcb1bryzmiAF9R7qKjgnD/U03jdJgUazzOiHzWPQuRkjtHH7pUB/
         E2BUZwCoLZAAZqTLMdY3qEJqs9LohNsBPr0FKDpFF6gENJGde7MvjrrApXh9QaRP1xl1
         Xib12dBGqk4kWPI5dcQjbnj4ZhenKf3gm4PPlbE91ynWwW2aESUhDAwoQlPQXksEXdiQ
         ZrMEc9fOXoV+TswL4mzg7FhzH7DGg3VHPXakYZVNcufQa+SEwSb3FfZnGa57fkwcBiI9
         1mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495178; x=1781099978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1p4OnpYDXMpkwZDQAdqQJhqxfh5Hb6QqekAS/cW1P68=;
        b=lhsCuIqY4gXVk/Kx3RwtpTMuWGT39mmqfZsHr3Ue8Xxgche6AgKl+lV3SC4cY+D2ns
         8x3hHZpJTzV62w/Yvvv32YTQhSOREY3y64DUjWdbmDrXSiHGN7kdpD5STBSW8w+jk/yv
         cz2tQ51liVNnnKikszjL47A5Jmb0Qu1b1PVmn8Pdt4J1VRfSKzJWXjkgW0T5CxvwDKdm
         +0VykRDr7q5aeRMC80bn9JN9YPmbIICanA2+aO0iiWJZf6EdrRzQ8fUhunVnD+gAqbYz
         hRXFNL7IStug05tEFDagTKHSWRx3+L8EopkD8aBGtJtF2j8iH82KcvzefYH3YtBixTld
         N4YQ==
X-Forwarded-Encrypted: i=1; AFNElJ+B5QOqk/b2r1RZrKANiFu2/65Wf6fWTpaP07lh7Tmkn2teuL6JeaEoygC2XIQqA1vG1ofmbLEJBxXdm8I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIUfbHQPWoqrkNhU94YgORGo2H5LfNfDvIbOyAKW35TTdQ5GsR
	Ujr9qdvz1AlH0pLOJxW9JAQljHqQ/qwSkHq4On6MSuB2ykko1eqFauKJLTRaCSKxjkIJ
X-Gm-Gg: Acq92OGiVXlF9wAvgQIN2bjjYziQjkG8W0eIxtyP+QoFoc4rHiwe4+hcya+eFi0+Lpj
	/H9VnlNBbjf7uZZUPGUmxr4Mt41rI6yIrcy/UDvcPRU2NRtLlrB7b7OIYpfKlo/mVkT2g7gDn85
	boavWBlaERoKABos9n82xaNJwYEVxc4zCJDFGGkd1MivwkfW4sNeBD4BooImZb0Jjdxi67bMYnj
	uzP7bztqk5unNk/LV9CkmMoPFNk1byKxhHCsr4VkrSYW55j5bemkZ5NTaBvJ3bzSALcP52NFHue
	YWn7WSP7JJJU9YgLIVUw87sItA8u7gYPODqN2xrpE5Aaundhb3H9WwRiV4vdh3hNH8ILjshkK4L
	bfGhMR+4ss2GojfPJCiIIDQtiEM0hlj2n/8UTRQT94/7sqjB3CtVZZdx5TW8mDyptIeR1WYNjTs
	DUjEKahfTTKJolkVGhsoKfd0J3i9K0xtgKkXgFyCv92fAEEtZIQlnsGGKrkHw+EyzbiZncGe6IY
	2/FZwoOkFfxv0PsKLJVnxfsD/+aFL4DA5akjqvNWnp4aPJKzb2TZirysPqwg90IGQ==
X-Received: by 2002:a05:600c:3e19:b0:490:8b0b:d3b1 with SMTP id 5b1f17b1804b1-490b614c9demr55616715e9.12.1780495177808;
        Wed, 03 Jun 2026 06:59:37 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7a7cb85sm59455345e9.1.2026.06.03.06.59.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 03 Jun 2026 06:59:37 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: David Heidelberg <david@ixit.cz>,
	oe-linux-nfc@lists.linux.dev
Cc: David Laight <david.laight.linux@gmail.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH net v2] nfc: llcp: bound SNL TLV parsing to the skb and add length checks
Date: Wed,  3 Jun 2026 15:59:35 +0200
Message-ID: <20260603135935.62647-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfc_llcp_recv_snl() walked the SNL TLV list using a u16 offset/length
pair derived from skb->len, without bounding reads to the actual skb
data. Three problems followed:

  - For a short frame (skb->len < LLCP_HEADER_SIZE), tlv_len underflowed.
  - The per-TLV header (type, length) was read without checking that two
    bytes remained.
  - A declared TLV length could run past the end of the buffer, and an
    SDREQ with length == 0 made "service_name_len = length - 1" underflow
    to SIZE_MAX, driving an out-of-bounds read in the following strncmp()
    / nfc_llcp_sock_from_sn(). The SDRES case likewise read tlv[2]/tlv[3]
    without a length check.

A nearby NFC device can reach this without authentication; LLCP link
activation happens automatically after NFC-DEP.

Walk the TLV list by pointer, bounded by skb_tail_pointer(), and validate
each TLV declared length before use. Add explicit length checks for
SDREQ (>= 1) and SDRES (>= 2).

Found by 0sec automated security-research tooling (https://0sec.ai).

Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2:
 - Walk by pointer bounded on skb_tail_pointer(); drop the 16-bit
   offset/tlv_len math and fix the short-frame underflow (David Laight).
 - Add an SDRES length >= 2 check alongside SDREQ length >= 1 (David Laight).
 - Bound the SDREQ service-name pr_debug to the field length (no over-read).
 - Rebased onto linux-nfc for-next (David Heidelberg).
 net/nfc/llcp_core.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index dc65c719f..d23ca815a 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1286,8 +1286,7 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
 {
 	struct nfc_llcp_sock *llcp_sock;
 	u8 dsap, ssap, type, length, tid, sap;
-	const u8 *tlv;
-	u16 tlv_len, offset;
+	const u8 *tlv, *tlv_end;
 	const char *service_name;
 	size_t service_name_len;
 	struct nfc_llcp_sdp_tlv *sdp;
@@ -1306,21 +1305,28 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
 	}
 
 	tlv = &skb->data[LLCP_HEADER_SIZE];
-	tlv_len = skb->len - LLCP_HEADER_SIZE;
-	offset = 0;
+	tlv_end = skb_tail_pointer(skb);
 	sdres_tlvs_len = 0;
 
-	while (offset < tlv_len) {
+	while (tlv + 2 < tlv_end) {
 		type = tlv[0];
 		length = tlv[1];
 
+		if (tlv + 2 + length > tlv_end)
+			break;
+
 		switch (type) {
 		case LLCP_TLV_SDREQ:
+			if (length < 1)
+				break;
+
 			tid = tlv[2];
 			service_name = (char *) &tlv[3];
 			service_name_len = length - 1;
 
-			pr_debug("Looking for %.16s\n", service_name);
+			pr_debug("Looking for %.*s\n",
+				 (int)min_t(size_t, service_name_len, 16),
+				 service_name);
 
 			if (service_name_len == strlen("urn:nfc:sn:sdp") &&
 			    !strncmp(service_name, "urn:nfc:sn:sdp",
@@ -1380,6 +1386,9 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
 			break;
 
 		case LLCP_TLV_SDRES:
+			if (length < 2)
+				break;
+
 			mutex_lock(&local->sdreq_lock);
 
 			pr_debug("LLCP_TLV_SDRES: searching tid %d\n", tlv[2]);
@@ -1408,7 +1417,6 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
 			break;
 		}
 
-		offset += length + 2;
 		tlv += length + 2;
 	}
 
-- 
2.53.0

