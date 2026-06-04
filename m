Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD74230567B
	for <oe-linux-nfc@lists.linux.dev>; Thu,  4 Jun 2026 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586567; cv=none; b=ec5XLUbFZTs7SlHxqb45r+PvK4jTpLI85xHXle93DdRm6tkbviwU6FmZvD6fj5KfInXNNGU6CvDBvnW6Qr3zrbFrnjxsstw0zZlpx+FX63l40bi/3H4Iy2ijs5D1gfuBk+g386Y6B5Hy5frRk9TzXpYlVK+aN6W4GwcSAPbglgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586567; c=relaxed/simple;
	bh=1N2/YBPS0yKsXsmbDL1qepre7J2Bz11f1c9p72hi8do=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hCYP/2+ZTBcJNAj60PI4MXtg+A+D7dFhoxRK9lezaFiW3oTaJzixdfW4Jk7fcL4cnTqNAN3JFOpaaGvIoZEBNJ03wkEBzzX7lLTvBY+SXpgkyBT0zgd3uJIuIMsL3ZNUuobHVPVyTAhbEdzZlAghFJjJab7wKLDZ+MV6Dx8BMHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=mEn+56+w; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="mEn+56+w"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso4757645e9.0
        for <oe-linux-nfc@lists.linux.dev>; Thu, 04 Jun 2026 08:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1780586563; x=1781191363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d57863DyLZ15Xl19eK7AJO9RSKTq1a/9ZBFF5sPg3ZM=;
        b=mEn+56+wyrabmTWQdvNRupOwqlAoHApQuD/T/R2J5oH7aOGIb+Hmn+9PGlCqHLGt2B
         k4XdeKx5TNiVVMmbGSbYvItgGokh/5sL4W6vUs43m98rTd6qM/6KGczH/G36Ii+1G5eU
         QLw2r/Zjat69VuFdT7y6gI9d6xkTgzzGxiVI4wC1KIf0+fyNPExGBSJmw2egGduBuKj8
         KS5HN6LmV+w4oCqqq1fyBRv0I/icY6J8OGWT+Kb/QWNrJ7R3XKYc0BWuF8GKl0UJDfJX
         IJaRIaMhe2b+1BLGXfCVXdwL2CFXffI1dcPGPaBkLbR0xF7ioU083Qo27fFaYRh0M8BG
         eKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780586563; x=1781191363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d57863DyLZ15Xl19eK7AJO9RSKTq1a/9ZBFF5sPg3ZM=;
        b=VEd5V2QnrT1XgZrukQQm6xbzhzFKNJs+YKy0T4SNckr1Es/KCHpdQq6WHOSsz+lD1W
         VHviZvLgDg0d3X5FXFXmE2dwRyZGq+Raj2FVMJlRZHwmWqkbiG0Aa31JM95kr0o450w4
         RiuBVz0ahSjZtvNnK/dMnC2HOU8KxjwG6EeZv3Cg13DNeOidXm1rxe+2G+GJ7vABCfA0
         Z5OZ9Ipo6mfP1e1TT6IFJVsNW5W8KUKxpGMlHS2kMDclJ6hXvWg6081Iyf1XljjUI2AE
         AT2QzifZuFYEhvpPXbeEZY9SD1tnYVuOfAsQBonsBEJnAaCQ/1lgRig0pBAGFDM3X3aB
         l1dQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mDhFxnZcbekJ+IgJCln93dg5IZgvR+a9rl3FjJEu3OE25swFq2aOLAU5x5nJ2rsKP1ijL/8L2Mq4Gv6U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUujVRJcnimYB4NCQTtv0oHE/vi6K4QF3ga1HbeLp0pvhowO/0
	4jTw8TrhyNJ09rAYY1w68lEPTqg6C3F3/+/1FIYMhxfV944Cri2xvHl4NXg5kZl80QfN
X-Gm-Gg: Acq92OHRpPBiqYPPvxCODhWzD+0+c2amB402NTJulSTje7/TILqsPOpTZFSrOYwlAvL
	aBnQA7CXjTG4urZhIWzKovgH+ODS5zDi0T04PfJzoVsF4Bpz7Q96U4jwNEwGZ8txn0LbkT8EVZV
	vhILYYkkwCrLisvyZm2CXJn+bXGT5bS59FH4SASSMH7X2pNQgKgTWmmSvmm8TjqJjs6b4casPwj
	nfmLxIQc2T19+bl5pLlamSdAUnj26uu06gCXvgOmD6jt+CxT/T2bQ4xNqBycX5VVOHSmjSbs+b2
	18ygdbjvTv5I66+GFvdxvi9adV57ty1iE76/CZAg2n/0fYADhIVX2TMZQzdHLC86DCRPKtvBZgr
	meQ8mke/m41TchOA3DC4zZP3VOoZX7r4zefktS0+EJgC9ScvTxhJtjXGQrjBL1t4LBwzoOtUHXR
	OvIGgpXHCqZsG/iqdro6wiXJ0wgmJtzKpnPsI877YjiR2UNk5V8hNn5RhluA4ePsa9O1Npl6PCb
	otL0DTPgRUz+SnKuyoiBd5M887jFSeJD01MnvHTg7wIZVrlcrrpqoU=
X-Received: by 2002:a05:600c:8505:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-490bc4ff20bmr71110015e9.13.1780586562894;
        Thu, 04 Jun 2026 08:22:42 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc140sm95418975e9.9.2026.06.04.08.22.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 04 Jun 2026 08:22:42 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: david@ixit.cz,
	oe-linux-nfc@lists.linux.dev
Cc: david.laight.linux@gmail.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] nfc: llcp: bound SNL TLV parsing to the skb and add length checks
Date: Thu,  4 Jun 2026 17:22:40 +0200
Message-ID: <20260604152240.14162-1-doruk@0sec.ai>
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
    (size_t), driving an out-of-bounds read in the following strncmp() /
    nfc_llcp_sock_from_sn(). The SDRES case likewise read tlv[2]/tlv[3]
    without a length check.

A nearby NFC device can reach this without authentication; LLCP link
activation happens automatically after NFC-DEP.

Walk the TLV list by pointer, bounded by skb_tail_pointer() over the
linear skb data, and validate each TLV declared length before use. Add
explicit length checks for SDREQ (>= 1) and SDRES (exactly 2).

Found by 0sec automated security-research tooling (https://0sec.ai).

Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v3 (review cleanups, no functional change to the fix):
 - Comment that only the linear part of the skb is parsed (David Laight).
 - Use int for service_name_len and print the bounded service name
   directly with %.*s; drop the min_t()/cast (David Laight).
 - Require SDRES length to be exactly 2, not just >= 2 (David Laight).

v2: https://lore.kernel.org/netdev/20260603135935.62647-1-doruk@0sec.ai/
 - Walk by pointer bounded on skb_tail_pointer(); drop the 16-bit
   offset/tlv_len math and fix the short-frame underflow (David Laight).
 - Add an SDRES length check alongside SDREQ length >= 1 (David Laight).
 - Bound the SDREQ service-name pr_debug to the field length.
 - Rebased onto linux-nfc for-next (David Heidelberg).

 net/nfc/llcp_core.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index dc65c719f..aed5fe1af 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1286,10 +1286,9 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
 {
 	struct nfc_llcp_sock *llcp_sock;
 	u8 dsap, ssap, type, length, tid, sap;
-	const u8 *tlv;
-	u16 tlv_len, offset;
+	const u8 *tlv, *tlv_end;
 	const char *service_name;
-	size_t service_name_len;
+	int service_name_len;
 	struct nfc_llcp_sdp_tlv *sdp;
 	HLIST_HEAD(llc_sdres_list);
 	size_t sdres_tlvs_len;
@@ -1305,22 +1304,34 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
 		return;
 	}
 
+	/*
+	 * Walk the SNL TLV list in the linear part of the skb only,
+	 * bounded by skb_tail_pointer(). Each TLV needs a two-byte
+	 * header (type, length) and its declared length must fit before
+	 * the end; this also keeps the walk safe for very short frames.
+	 */
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
+			pr_debug("Looking for %.*s\n", service_name_len,
+				 service_name);
 
 			if (service_name_len == strlen("urn:nfc:sn:sdp") &&
 			    !strncmp(service_name, "urn:nfc:sn:sdp",
@@ -1380,6 +1391,9 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
 			break;
 
 		case LLCP_TLV_SDRES:
+			if (length != 2)
+				break;
+
 			mutex_lock(&local->sdreq_lock);
 
 			pr_debug("LLCP_TLV_SDRES: searching tid %d\n", tlv[2]);
@@ -1408,7 +1422,6 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
 			break;
 		}
 
-		offset += length + 2;
 		tlv += length + 2;
 	}
 
-- 
2.53.0

