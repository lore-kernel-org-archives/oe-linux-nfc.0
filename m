Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FCF369D6D
	for <oe-linux-nfc@lists.linux.dev>; Mon, 13 Jul 2026 21:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783979983; cv=none; b=JTcNCZOye/P8YUjgTBlmev0a3b4Qx7mZkY7hLuI1ooIB0fyvwFvXsUXwOrYyYKm1LzV9iiW+z3rTtiLO2dRoRFac3tNalPdZoRtRwxZ8OKuoNzCxf/jqctrsZsSmjHNJ3E3jLUEAwjwMAwHX7spX4t1UrIA7vPuSFXZK2XsohJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783979983; c=relaxed/simple;
	bh=CHryohLe/fnBYpOI8e4BvVaoKUdQxQ7HJ+W2ldsPKKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nl+9EvZ+F5msR+7S/4rKkhNJGcEBPrYKSOUv3QmEzLtfRxtCPD0m0CtEcEa9xiIGkjk8aJ2tdHLpXvt1XQA9JAyDqJtj3DIsV00dGmBE92fDZJI4Ioan1rarckKs0/82Heq1IIaSWpaURmcw522/OSfx6QmFvID4V1/2QcJlANQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=NDhmNSIh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="NDhmNSIh"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493f25d47dcso2335675e9.1
        for <oe-linux-nfc@lists.linux.dev>; Mon, 13 Jul 2026 14:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1783979980; x=1784584780; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=37p3VfmrrNMS4akxO403NRH36eKSLE6Wn3AfUCl+4gA=;
        b=NDhmNSIhuWJdT8B8vcOQrkF5wtCk8MbZO6n1rj6aGUWLQszJzPPh51uCpmXHKJcdGd
         +VFv6m3W0pc+agjR+JQxsigQDrlkw7UySaBQ6zV33jalaPqL3NfnHe6g6aooqr0hYfaR
         AZGpi6xufbj/hSxOJYY/Dosr3B1iqyYW/bbL3Tvkv7O9y3IQ7ujMKnnrmqvXTxY0u5bZ
         8PKA4yVmBlfkpv//XI59PF/J04VuFujjI5BmP6B1xainRflwu943mCzVF+5wDnlq1cU2
         IpxAH4CfmR0tT89k7qpbBx++I9CeLpAvq7I8HLQ6xqQh6OeP/pSq3lKwupQCURmLiCHT
         ifyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783979980; x=1784584780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37p3VfmrrNMS4akxO403NRH36eKSLE6Wn3AfUCl+4gA=;
        b=tG+2W7M8b+F9Thn4uvyeCTY53u5Yltnm46O+NbXtFkv2vk70xQKQDtC13unWdxAV+H
         5emY4aZKOopMhYFgBNDV/ggZ2sZn+bJ55eTJiYqKud/YV3YtjZzXWnravvEaxkQIBmV/
         pnMYMr6fjkm8XoKwC4H/7UDCsW6tjof2VSj2k8ACRtrucJgusq6PwgGrGRQSwi6mljh1
         eVbyop3uwuwB2ehGSWORDtwJvq3Fxul1GCw5d/OAWoT5h790L7GMojF++E09SZpNNaEx
         BxzkyuKT+V4ObmPVaFFIVH/VIVKSNij/kV9zrE/IYOVQ2YoPuFq97qL2XqPC7OjVrUpQ
         HTzQ==
X-Gm-Message-State: AOJu0YzotMDnzLjtuxzphNjuhlJW8dFLd0GCSYGUXxopgKIBUzONmfp4
	p/9sDz7UjjtdgkMat+/izJ1pVyecobUlUOFTqtEWL4kmTzYjiV6NhlJJphasQP9EoCrI
X-Gm-Gg: AfdE7cnXJ73sL+O6vxD3mav/PEjgrKQN6qFkZ0hM2F+fZV6OKzHcx1kgiA+LaINYTSM
	l/vb0+58giGhXy38GeMMIj9TohVQuJHyQR9yIV9bCXIwsARTytgK2SwzJFxrOtYzUZR28k6Jo9n
	QAp6hrkA1HdB1xExGpTYoPtxrPL5lU/PBjhmkgKxlu7YIiUMGl7AP3BGW8/y8aHtKHN4UJdf4Xl
	75HOxZ0MifNu+VZZxsHjiW2+t8A4jdEgnuwrijhDoyOSejEokon+1D07ibe3FyW1DOlUEPm+Qy1
	5CA6D5uKZyiiQo3TS+wc5zZxYTN39AjlPWTjLiJAGteoG5GPAlzLPGXeIoJoYNFwcRaFU12Xf2S
	h5L7w+73C0fBanTCQh5FT4wmbmug7u5A1u+G58ih1D8DS6rp4qVNiW+BfmU5M7qYqGsUh4wuh3G
	YcL7p2VlauHAsAccN0+xUXQNEs2Bo742qM8tlVzMKoNt8QmCSwua7UTjQnoid4+HwyNEzxdpGh4
	gLulpUlWFLcXnYlxWVSjvNw1rdrR2XnK30=
X-Received: by 2002:a05:600c:b90:b0:493:b967:178d with SMTP id 5b1f17b1804b1-493f881d05emr112865375e9.19.1783979980087;
        Mon, 13 Jul 2026 14:59:40 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f9402sm28390785e9.13.2026.07.13.14.59.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jul 2026 14:59:39 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net] nfc: microread: validate CARD_FOUND event length before parsing targets
Date: Mon, 13 Jul 2026 23:59:36 +0200
Message-ID: <20260713215936.23137-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

microread_target_discovered() parses a device-supplied MREAD_CARD_FOUND
event into a struct nfc_target, reading fixed offsets and -- for the
ISO-A and ISO-A-3 gates -- a variable-length NFCID1 straight out of the
event skb. The only length check is nfcid1_len vs sizeof(targets->nfcid1);
skb->len itself is never validated, so a short event makes every gate
case read out of bounds past the skb:

  - ISO-A / ISO-A-3: fixed ATQA/SAK/LEN reads plus a memcpy of an
    attacker-controlled nfcid1_len bytes from the NFCID1 offset;
  - ISO-B / NFC-T1 / NFC-T3: a fixed 4- or 8-byte NFCID1 memcpy from a
    fixed offset.

The copied nfcid1 is exported to user space via nfc_targets_found(), so
the over-read is an information leak (and a possible oops on an unmapped
page).

Reject events too short for the fields each gate case reads.

Found by 0sec (https://0sec.ai).

Fixes: cfad1ba87150 ("NFC: Initial support for Inside Secure microread")
Cc: stable@vger.kernel.org
Assisted-by: 0sec
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/nfc/microread/microread.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/microread/microread.c b/drivers/nfc/microread/microread.c
index 4149c5d735bd..9a7a4fd6796b 100644
--- a/drivers/nfc/microread/microread.c
+++ b/drivers/nfc/microread/microread.c
@@ -483,13 +483,19 @@ static void microread_target_discovered(struct nfc_hci_dev *hdev, u8 gate,
 
 	switch (gate) {
 	case MICROREAD_GATE_ID_MREAD_ISO_A:
+		if (skb->len < MICROREAD_EMCF_A_UID) {
+			r = -EINVAL;
+			goto exit_free;
+		}
+
 		targets->supported_protocols =
 		      nfc_hci_sak_to_protocol(skb->data[MICROREAD_EMCF_A_SAK]);
 		targets->sens_res =
 			 be16_to_cpu(*(u16 *)&skb->data[MICROREAD_EMCF_A_ATQA]);
 		targets->sel_res = skb->data[MICROREAD_EMCF_A_SAK];
 		targets->nfcid1_len = skb->data[MICROREAD_EMCF_A_LEN];
-		if (targets->nfcid1_len > sizeof(targets->nfcid1)) {
+		if (targets->nfcid1_len > sizeof(targets->nfcid1) ||
+		    skb->len - MICROREAD_EMCF_A_UID < targets->nfcid1_len) {
 			r = -EINVAL;
 			goto exit_free;
 		}
@@ -497,13 +503,19 @@ static void microread_target_discovered(struct nfc_hci_dev *hdev, u8 gate,
 		       targets->nfcid1_len);
 		break;
 	case MICROREAD_GATE_ID_MREAD_ISO_A_3:
+		if (skb->len < MICROREAD_EMCF_A3_UID) {
+			r = -EINVAL;
+			goto exit_free;
+		}
+
 		targets->supported_protocols =
 		      nfc_hci_sak_to_protocol(skb->data[MICROREAD_EMCF_A3_SAK]);
 		targets->sens_res =
 			 be16_to_cpu(*(u16 *)&skb->data[MICROREAD_EMCF_A3_ATQA]);
 		targets->sel_res = skb->data[MICROREAD_EMCF_A3_SAK];
 		targets->nfcid1_len = skb->data[MICROREAD_EMCF_A3_LEN];
-		if (targets->nfcid1_len > sizeof(targets->nfcid1)) {
+		if (targets->nfcid1_len > sizeof(targets->nfcid1) ||
+		    skb->len - MICROREAD_EMCF_A3_UID < targets->nfcid1_len) {
 			r = -EINVAL;
 			goto exit_free;
 		}
@@ -511,11 +523,21 @@ static void microread_target_discovered(struct nfc_hci_dev *hdev, u8 gate,
 		       targets->nfcid1_len);
 		break;
 	case MICROREAD_GATE_ID_MREAD_ISO_B:
+		if (skb->len < MICROREAD_EMCF_B_UID + 4) {
+			r = -EINVAL;
+			goto exit_free;
+		}
+
 		targets->supported_protocols = NFC_PROTO_ISO14443_B_MASK;
 		memcpy(targets->nfcid1, &skb->data[MICROREAD_EMCF_B_UID], 4);
 		targets->nfcid1_len = 4;
 		break;
 	case MICROREAD_GATE_ID_MREAD_NFC_T1:
+		if (skb->len < MICROREAD_EMCF_T1_UID + 4) {
+			r = -EINVAL;
+			goto exit_free;
+		}
+
 		targets->supported_protocols = NFC_PROTO_JEWEL_MASK;
 		targets->sens_res =
 			le16_to_cpu(*(u16 *)&skb->data[MICROREAD_EMCF_T1_ATQA]);
@@ -523,6 +545,11 @@ static void microread_target_discovered(struct nfc_hci_dev *hdev, u8 gate,
 		targets->nfcid1_len = 4;
 		break;
 	case MICROREAD_GATE_ID_MREAD_NFC_T3:
+		if (skb->len < MICROREAD_EMCF_T3_UID + 8) {
+			r = -EINVAL;
+			goto exit_free;
+		}
+
 		targets->supported_protocols = NFC_PROTO_FELICA_MASK;
 		memcpy(targets->nfcid1, &skb->data[MICROREAD_EMCF_T3_UID], 8);
 		targets->nfcid1_len = 8;
-- 
2.43.0

