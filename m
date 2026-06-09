Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A4433C18B
	for <oe-linux-nfc@lists.linux.dev>; Tue,  9 Jun 2026 20:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781036749; cv=none; b=TTPO///7ehaaaT8FDdPY5kOcEu+WaHi2bjvr1F3+JGTb9yCL7JrNzG4+UcSeatTuqWQ4N90ULaacPEN8+9EpdpmJN904LaT+kJuY/wXzHgkBQFfncySvtJnGJ11469CUtGX87mPQ1Tz2IlYjwVhQl0F33i8IK01NAAKArElQ0Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781036749; c=relaxed/simple;
	bh=oKkSVxT/Y4XKV2ObqYnE31wJmdQaPrWWo7tQBqtLFbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P1f8nR2qHrKEaViUxsB/fyhMpmCimYBNzeubsG8xUTboQ1Gpf/ImAFLNeme2FNr9WuYxrFb4aVt2m667JLav8Hxy3uKmrXlba6u7mwZf0DvTmyelKHQRasns+15T20UrV/oemK5D7vrWdKTVFfXgWiEi4PnYvFyVtArBBxUnSBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=oYHHiXXR; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="oYHHiXXR"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso2841497f8f.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 09 Jun 2026 13:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781036746; x=1781641546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mQGRPMu1kxL0yXF36zCXENzLxRFFn1aJOYE1MvTj2ac=;
        b=oYHHiXXR6gBfCsNfizk2Y+UGzoT1MHSZixLGhghxQ5sXe1mhqz85xtxnJy+iwOoFbB
         nc1SG1j89uTLRbJncW2tsuSgVezELnfgnaxTQvoZPa6KCzL8oxdOUX5vgf8JRu48lIVO
         RemvQSE5528vHUcnsjVR+Lz0dSjpry9RuTLhzL2crfl5n3s69G8G7/DSV+JrWfykmcck
         n6VLru7r/wJD9PloTmfkE8hx+W4FbQDjWdCmIxftAg6wmhNNQh1mfMM2zdr7LoF0Xnom
         Cr+GL9/l+YLQp6CX8EefOg7VMTdxr5QyLIYI7FDgH+f170eg8Rua0dHSSGBmLbvRTlSr
         HpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781036746; x=1781641546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQGRPMu1kxL0yXF36zCXENzLxRFFn1aJOYE1MvTj2ac=;
        b=Al0ylSJ2bClhdlYp4hF/4r4cgRiWpl8C45b6Hshqt3sE/mb1ocTWtfz694vbanfWvc
         D8qJx+G9OamzQIPiUexl0TakA+itDcY523mnbhGZZYpHQYSP1QTfYLLZ5IQo6g8qpb9h
         5y9/YM5sUgb1RvTVp7Wjy4KfGQXpkjQ5KXCp2S7u2uNLoZ/yTSknWaFvRslD6fnUvEdD
         yrFXYEkABCsCvzSewLFOthj7gN1pbZQEc7UGoFmIHFNsVdjsEsdAeW21V15LkwPUfBkZ
         Cix2jyDmjOQQnVQQYT9aOS/Xw8G4G2X2bI+XUgNTTu0MTeGWW2ilU7L+PLX/RKePNRgq
         JrRA==
X-Forwarded-Encrypted: i=1; AFNElJ/G/TqomHG+10QVNK3LGDMAGwKX/nahv7AnxjgNr+lPu06CZVP+KlZLo+2NTHq2RTFvUscV+4FdOr3/q40=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYZ949MT49IbLnW1H3Ccjc92CfyDeAW0iXjZDz4ATlViaKa9Op
	A0dwSvD8s1LACU5VV9ndR1nyX15N3LeDhQPqLHTyIAmGQOHkRTCeqRAcwG9cip3W6KIX
X-Gm-Gg: Acq92OHnsEvyrKR6V4K1nV+Lit3ZolAKHYBnHJ1hOc7R3b3TXtPdhR4F2Q5I/WmtaTW
	DnHZmeLCBis40stJ68odUnq5JMAVBPaeicCgo/ZfIDJSDwfKgqdspuVE6QN5QXnvz1c1eXpD9ax
	yRJ8TeFCcgRTdeHrgEUuG8rjGUhxge7orxJrQAmlitQxzZy5h0CrNZmFjdHoxXrPZWBS4KDZYhf
	VldcFRXp3WWu7UmhF0ZyUv+skHFlLbuiiX6FUksdWwGFqmMqcgYXRhvt0PV5fMnXmvH5M9cvKBr
	x27S1sjBi/Eb6Chp817bwA9oEwdU4LnZoDCDdvvVDEV3dzZpdsUPvhsnH7axVtlAO9VI7Zu0cvt
	BA90ZWlJVnGi3txttNUILmKXayTFZqN9Zvk672pLYVcwxoJ7s661OtQLtl/1dC0inSB8gaqnr/U
	4ETrPyNraqqC9bKUUwlDAf8ZX9GmHQK5ddV3D2uxNS/X4EmggHjSbSdqB79xPxHfpFeLu85JUTF
	i8ZPO6rhlyRsHI///VcpaRSShkRLzVUJg51M6gNEiDv1d4s1e5PvbY=
X-Received: by 2002:a05:6000:4022:b0:44a:b931:f32a with SMTP id ffacd0b85a97d-460566beef3mr6351288f8f.27.1781036746040;
        Tue, 09 Jun 2026 13:25:46 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm53432272f8f.7.2026.06.09.13.25.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jun 2026 13:25:45 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: david@ixit.cz,
	oe-linux-nfc@lists.linux.dev
Cc: david.laight.linux@gmail.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4] nfc: llcp: bound SNL TLV parsing to the skb and add length checks
Date: Tue,  9 Jun 2026 22:25:43 +0200
Message-ID: <20260609202543.42282-1-doruk@0sec.ai>
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

Fixes: 19cfe5843e86 ("NFC: Initial SNL support")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v4:
 - Add Fixes: tag pointing at the commit that introduced the unbounded
   SNL TLV walk and the SDREQ service_name_len underflow (David Heidelberg).

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

