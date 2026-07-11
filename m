Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3CF2DCC1C
	for <oe-linux-nfc@lists.linux.dev>; Sat, 11 Jul 2026 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783754828; cv=none; b=c31sj2BQCGdVXr830bj4Ee5r1g6LuhPScw4SpnwP4yFsxAbKTgXakz1V1F3VhDbf+QM/QpLud7AolMMxnL162rtW661JFVPNZyqvpkTfs0b2HC5U+q816PBESJsodoU7waUyZqU9wDO9W0ei9PlEYQJMU5sm7wpJC57OX4MnmhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783754828; c=relaxed/simple;
	bh=6/vKUtPPzvuNE52W1vzgh44bVwcsydD2eMshQV62Re0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ipJz4kLz3/5Xy+1bvq1c1SZlxc/1cepCuQ4ZbAQHeglU1YA6XFfZidkyjoX5Hn3vf8WSpa+Rv65u8Y8d21JJSLcxxZZfhPozAFn3Jt7aUrnlFobz1Obx5D5EOblkb8Zjp7VX1Z2xHBn5va06dmn5Yl7sYxhBuLwRTUNwq5han4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=W2arLyKn; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="W2arLyKn"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so1078996f8f.3
        for <oe-linux-nfc@lists.linux.dev>; Sat, 11 Jul 2026 00:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1783754825; x=1784359625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x1XGKV32BMtMot+0VfEXaCXl+nOm+R140hzMoZufQh0=;
        b=W2arLyKnZlQSDyctuatvT9xxay9a+hGKQNfA6/xOHjLDNBzD3pGo8mkLiADZxdYQ1o
         woNIYO9EpJE5u43SgmjIN+rQRK4e75rUfvcTEnRB3rBF3JgpH/9ns41fFiBeelApgXcx
         Yw2nsC6IEWAMKoXQz/JrmPuLaPlF4yAc+7guBQAvfHi4yRkcyrmYXr7/mKU8ZU5AqU2j
         cdRE2ng0isVL/SuhzpdXB0/EYfDIA1ZuqIcdOkwV/+1NvMhhasRifQhFyChZ+A+1CPQ+
         CP1vduiCsG5MP1MtTyMACqx9mdETfCXsJJNrHsuEQAiSv96mdZ26GKpJUd3CVvZAl/35
         TPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783754825; x=1784359625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x1XGKV32BMtMot+0VfEXaCXl+nOm+R140hzMoZufQh0=;
        b=k+i6Rgb/hh9RUUxCTXnNdlg9bLTzCS/nGf4RdUFZecNNfQkWp+CN47q0aLGEWR74hO
         j3tIv/l6tBk0D0OJgZJOGAfpjfR/X9dATkvFHh8aoVShgxOWcbuwTySwaAHkWdKgQqIY
         2UCV5BgzLeeDfa2P3H6SEY7KiNBu6W56B2yOssmHar+gLyhVr2uQnDy5TfL2X7xbrVji
         ZeJszUGdizmEASRh4dKp6Uo8oUFKb9yp8S8skauRrXZg90vqMx0CNi8wCciXsNCjqoY5
         cEVHySREgWsi3s0P3BrYpXdkNogdaxdFWX7m7welDln8pvNBCIKpha/FMggDcznCJbOX
         ll7g==
X-Forwarded-Encrypted: i=1; AHgh+RqXiKyo+VEo0Levc8nX8u9IlQG4n1uyxArpon1cIUgws30L49LbNBy2eIIHPmpsgk4KGZ9E8GDqMBjrYZg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPtn2nOt8N3qdPR48umalyLcTr6G/zhu75VM82O41jGXvWGZmJ
	0jJWMcLIYXqOfpry1i5SGJLGGN9ywEHcqfQm7ClqOMU5cN+QfxdZxOC+gm0oPU20+UzG
X-Gm-Gg: AfdE7ckCUFIb8ZuIyIm66K93vy1vWPuKa0iOuBS076fUiHHH+fd02VbVVRQkiRsR9Qw
	q2d2XG9dRRt8J3sEcypWneEMFs6+EvGv4OGmAiULkTvgQMdkzcppCsEuhrlgItlVDC6QYqtplk1
	0PDCSxNv4MVMjDxqY30zyNQHABkBVfo48D9pJgquNUWGM2cYSqkjMvWNp72mhL2zIeNJOrtaVl7
	pM5j9Yancqoh1TfkKvN8NmshEDGxYg19jsV3MLimERNSDHW648Wb9jXyRteh+dXSbcLqX0kHoZz
	h2G5KGCLaTBprCzwohkLRM/fTwGchTMnkAtOzM/011G8yCuLutI0RTYTsXGxXe4UsKiBg2L4UhF
	Jm8Bs3dtRfdPxYrRTpAocz5SSVzn1NLi6/Yy+wHBKfOmORA1MAHlN30hz/adYn+VbpfkT7lPGLv
	flhVhLpYRBRaTgFzzUjE9ymkpbcf55frFzZFYMjYeQrD4kO1pzKcisk2xFc34zNTlqq+rxv6z83
	Ci8oVlTaTjwGghc35uUTfFczpGjTfmvQXQ=
X-Received: by 2002:a05:6000:2004:b0:47a:c103:8a2e with SMTP id ffacd0b85a97d-47f2dce3062mr1867745f8f.45.1783754824681;
        Sat, 11 Jul 2026 00:27:04 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm66844821f8f.28.2026.07.11.00.27.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 11 Jul 2026 00:27:04 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: David Heidelberg <david@ixit.cz>
Cc: Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net] nfc: llcp: reject PDUs shorter than the LLCP header
Date: Sat, 11 Jul 2026 09:27:02 +0200
Message-ID: <20260711072702.70231-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfc_llcp_rx_skb() reads the two-byte LLCP header (DSAP/SSAP/PTYPE) and
dispatches by PDU type; several handlers then derive a TLV-array length as
skb->len - LLCP_HEADER_SIZE. Neither nfc_llcp_rx_skb() nor its callers
guarantee the frame is at least LLCP_HEADER_SIZE bytes, and a sub-header
PDU does reach it: digital_in_recv_dep_res() and digital_tg_recv_dep_req()
strip the DEP header with skb_pull() after only checking the DEP header
size, so a DEP I-PDU carrying a 0- or 1-byte LLCP payload is handed up as
a sub-2-byte skb.

For a CONNECT or CC PDU, nfc_llcp_recv_connect() and nfc_llcp_recv_cc()
then pass skb->len - LLCP_HEADER_SIZE to nfc_llcp_parse_connection_tlv().
For skb->len < 2 that subtraction underflows: truncated into the u16
tlv_array_len parameter it becomes ~0xFFFE, and for a CONNECT to the SDP
SAP, nfc_llcp_connect_sn() uses a size_t and underflows to SIZE_MAX. The
TLV parsers bound their walk relative to that length, so they read far
past the end of the skb.

The aggregated-frame path (nfc_llcp_recv_agf()) already drops sub-PDUs
shorter than the header. Apply the same guard once, in the dispatcher, so
every PDU type is covered.

Found by 0sec (https://0sec.ai) using automated source analysis; the
missing guard is evident from source. Compile-tested.

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

