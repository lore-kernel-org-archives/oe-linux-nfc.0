Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C141A23A4
	for <oe-linux-nfc@lists.linux.dev>; Sat, 11 Jul 2026 07:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755018; cv=none; b=Suz55uO42tFexZkMdwo5NlQq2AuR5wrRaD51m1XaPc8H5SEBVKkkctufEdOvRFprDek7aeOaxkFKN3p+eJwErTkOI//oGtgqgge0OvJfc4y5C/VNVLAmO6956LRgIR+wmWPP7jQPl8d3mYWHS+WnzOqyxh2X1DU2wkIx9hhkrnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755018; c=relaxed/simple;
	bh=GXjcU39QWcSzGAd3hgO5Q4UtPpQ/TQXwXEGgMc1w11M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AZ2RW/F6/YaNPPVdk/rvLZtgbIvL2m2TWiMZzedAW7hKNGDttjNDtOZ1VlicLAD5GFlyZl7LHpNlTCnvmQvn5IsnzKKFwJowe6ZcsTrZcqgglVuvUG3dBbydIrA+HsovdsN9+4jZdwE1OvcqAFYW0gNwHTOoq1gUmDKLCDZUlJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=OIVQJDho; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="OIVQJDho"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so1212162f8f.2
        for <oe-linux-nfc@lists.linux.dev>; Sat, 11 Jul 2026 00:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1783755015; x=1784359815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0XIBIITeNYjqyCVK5ZSVvlqGN7ycrHDwBqsn43mkLj4=;
        b=OIVQJDhowLjFKVuZ4LzoMTs3K++Vkx/9vgYGfkVH+Yj/1J1D1A+pkKYTeh5yAUhTl2
         S039DosnK6oF5EIRAOa4u5PgzOePEm10s5IRR2r+GZ/7dal9T1jcyjmP/ap0e41nLI+B
         +4hmTs9TKtjfXXKSorLHmowDX4yEcbzM1+JuAfJK1z5ITYyfPl9eP9SrWoKOW115/J8/
         MAJHQJfxHju4NsSI1DLAdeEQWhhDwc7Pr+FRQsn3yxXxo7W3J4FhlNfGpnJF5D/b3W5b
         HrrHctXUBBCYXUHSsHHiHtyAIxqpKNPhwxRAPzuw1qgA7PxToKynup91hTWctg+imQ4h
         AyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783755015; x=1784359815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XIBIITeNYjqyCVK5ZSVvlqGN7ycrHDwBqsn43mkLj4=;
        b=Bav9CN2yb/jLYPt1MY99kfDdImvTdnlt7R+/u29Pzlfv24uGJxUNFdos6rGwAcgUnh
         28NFCxE6k+lQv24f5ZLFQ5tHBXBGPUdudNPSpLPboZpnugYdJirbCkjdHMkicXc0lWSo
         l5JsSuUgrdzIoHYWNKiu0Q9zEgGZ/1oynXgSqg/gc4z8sb9VHiDIi8U4X36V0K0dGo1w
         m3+ZdeFHoKT0QmK/5glvu4w70sfgnu76qfYAArP06FDe1i7hm13qyZjwLQq6yapQUWR6
         do2uK2Pkq0GgvAXIlXlxkR26Pl79mGXySI6lu9UPE0aTwpIFh0LxkJnOeca/6waiXP0H
         xoIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUxsqqA3v5KijzuByRtGdfoecmLQdMW/6W+Of9pXhwnWd/ftmiWUfKSfBmOMo+K7j6nnbRB7WaaE/gHnI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk9gro1M50nMRoLgj5tZRjNSDhuabV97YoqWyY9rQ1Zm0Exzzh
	bduGs4L27t8LR/gwUNV3LfGZp2fqDolhj409E9OjuwIZ/1EfXapXuRSRYlpQIMjMCIHg
X-Gm-Gg: AfdE7clu37wK4fwfMjq/ftc6mhO9UBdXqThDO4RerG7WNvF9RUoi2ZW8JqwJtedIfm0
	XNUHtqw/3SpwoCFX/Y++G2zswz1IUNnq+rKlprPmZ4A1eiy5TunUoDNsMJJv6jn/dBUqB0XdOxQ
	gQgMFKYnX3+lSKcC1+oU5skoTm8Xut57GCGk7dU478rJQm4ZZBAWF8E8n9bkloM4ZAd9FDNpIa/
	J2e/MJQWg+G2sLK6EYJqNMmklCbmU8MbJZ/paHiacensgf/Yj+aoNITDRQgHj81lopwW8Kfioxf
	MGlqGOIywT8SXsOirUkdSWIiG4fdn5K4TIYaX3658jCsniILHhrhdi2WGLeaV8cY5RBEtQPBXsK
	P0YVD5969x0RB96/aSVUtSQ8NPfwoTmFJEye/jJwp4UdkxRl5Om25V1rMkNCeac1ifuWYYjND37
	S+BLC7J1gU46KD9g25lRKhCIitqh1GDECiLysWxR36bx4sBKYBRwKJuTO6OpKBEFxTnegjauVhd
	6nSArEEdQHuH/c121sB/hyro16s19Ko2CM=
X-Received: by 2002:a05:6000:1885:b0:474:13ac:a91b with SMTP id ffacd0b85a97d-47f2dce7c33mr1900118f8f.32.1783755014528;
        Sat, 11 Jul 2026 00:30:14 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm71148700f8f.37.2026.07.11.00.30.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 11 Jul 2026 00:30:14 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH net] nfc: llcp: guard against short PDUs in nfc_llcp_rx_skb()
Date: Sat, 11 Jul 2026 09:30:12 +0200
Message-ID: <20260711073012.71066-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfc_llcp_recv_connect() and nfc_llcp_recv_cc() pass
skb->len - LLCP_HEADER_SIZE to nfc_llcp_parse_connection_tlv() as a
size_t. When skb->len < LLCP_HEADER_SIZE the subtraction wraps around
to a huge value and the TLV walk runs past the skb.

nfc_llcp_rx_skb() applied no minimum-length check before dispatching,
so a PDU shorter than the 2-byte LLCP header reached these call sites.
Drop such PDUs up front; every LLCP PDU carries the header, so no valid
frame is shorter (a SYMM PDU is exactly LLCP_HEADER_SIZE bytes).

Found by 0sec (https://0sec.ai) using automated source analysis.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Assisted-by: 0sec:claude-opus-4-8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 net/nfc/llcp_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index aed5fe1afef0..e3b3077e0e83 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1481,6 +1481,9 @@ static void nfc_llcp_rx_skb(struct nfc_llcp_local *local, struct sk_buff *skb)
 {
 	u8 dsap, ssap, ptype;
 
+	if (skb->len < LLCP_HEADER_SIZE)
+		return;
+
 	ptype = nfc_llcp_ptype(skb);
 	dsap = nfc_llcp_dsap(skb);
 	ssap = nfc_llcp_ssap(skb);
-- 
2.43.0

