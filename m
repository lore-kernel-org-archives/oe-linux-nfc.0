Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4124D90C9
	for <oe-linux-nfc@lists.linux.dev>; Tue, 14 Jul 2026 16:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047597; cv=none; b=j6yKwe3gGR4kxMRgp8pw1O7pSf9yxpRjJntdSQKe9KllBr+cpAWhaF9eAgTHBO/wslycUlXFp2MjVG55XeoBzUk0Se/+MDHtsc9O/cgIVKfjiDwNQhk6P66BQTy/TtDGYKKGY/+uOglAEjVJOMvBUW7CgaGBylPdnZ3YTfVxg8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047597; c=relaxed/simple;
	bh=Frw282+aHQ3ZxDrx8czE2RBlkQDSjmruTH68jMfrBuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jrs4g+Q4Z7xaTDzpGusnaAJsl0zFqw9APAjTj7EJzcW9noZoU3Qy7pmNgIa6y1HeU3Rvnw2r2m12Gotqt9p+zFqXQ5kvMb5thw3LiG99cbHZrGF5yG1XZ4cBE/tHgPHd6XqvP57fy/QdEGySdq6hFxKqG0Cv8dFp75yKHXqtJ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=LpYQz2qJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="LpYQz2qJ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so29107415e9.2
        for <oe-linux-nfc@lists.linux.dev>; Tue, 14 Jul 2026 09:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1784047594; x=1784652394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IPpnQyB5O61CilIt8FpW4+VW+Z5EVEM70y97AViA5k0=;
        b=LpYQz2qJGAGC1s41UNv0801jBTEKTJvaQ4UlKDMZsqMxRN6k+pm2p+BS1hKyJxKKKS
         RkCPyJYQTKJ54VdpikA+gdt+JDyMWRnY5Som4MdFDoQ/k3eqJfRp95XxbU+ArxHv2O9u
         /VFwirgT0IebkMelSpCcsR3KTUjKUB5hJkRsTyz+HUcXaKZyzd96gK6CUnOMm0sg06I7
         oPLD7l9KnCvQ6hADqgv09sqOl3hU/e7PMV3XBkh9L6wdd0yQwSCjjZVIijyqtNKK8cK5
         FhB3NS9Nch00320swKW0nBxNxHfXdQUiDWLElFrMRvoD6QO3tRMgPbT/6iFhb1Fnlu+N
         3ViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784047594; x=1784652394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPpnQyB5O61CilIt8FpW4+VW+Z5EVEM70y97AViA5k0=;
        b=stArax8gYhObjdAB0gqcUlvysEUUZ6v9o9u4LsSzQsHqkBGG/FeC1clX0b/uvsbQuR
         KZF1Wv+49Bx4pZCxGMeZJez8VTsnsSCZjWn9ySyyO8J0aUZJQ0Bc7eOcYi7hT0cBGY6d
         r7NNkXUGA1t7zSuD8MVoFNWXvmAJjt1xqMZ0mc2n4FvCXWhpSuEy6ZFjXzzSFFI/Rb10
         NkOMGXxNHTzWeCpe8E+wZAFR/wegAJs4E0IKkJv/Wfm+ILtLJ49ZViB9hmEGPhakSjnD
         ydEdi/veHc5lxHHdp3Vo+1aesvt402jHvcZrxkOUY6GaIFjge+7LYEB9pF0Iq7MRGwJt
         fIrg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/XMzUfSYM4AXCN33hJSSv7RlbNoQx0nnCg62ZRks2rv7JpcLMw5nC3vTtEWaKxZUExpK1nToUrxCpfmw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxH63oMwqdkVYAvc8LcjKZF3Ujvx/+Ql6D/dmGYVeGY9VLtogtU
	IaUofu/0P60QEPMdzTGkvFFycF93YqOIEvMNnYDylGMVQ4GH59nJS0407E36Uo/K8m6S
X-Gm-Gg: AfdE7cltQqcWCo8CfPPW9P0Ju9MPfE1DqlAXQZns+bfP5g1WIiPDXOo+9bigq2vyRZ+
	qwDzfFsYmWhVPxQfeV7w5G5jTS315TbRQoyNpm+vOWL/xr4u2TebdAJliRoNxvR2lrRN3EJXLZS
	F3bwYrizVbwrhwz/fwrJlrq3cFrZKtXQXo30b1J0SsczWNypx2AAm7sslT9ZDd+zFlWEXJUsLqL
	+lt3mnFs8dlDmOS9xF/AiyxjgRHe7NuP4g/p1aflYHpfg/GfqBkxJSjzCWtfuFJOCYvlodGs46G
	pZNa+2YHEmq1G/8RlEJ3J2rqplkTUmVmBK2GtGQCbVWgB4muXybmCOkkxEMG+jhNlszjmuW2E39
	tGwIqmSJ2zAkkZCqiVoCrIxCoBdk2miO+hAGzGj2uqdM9+uCC8cXrABfpwOKdy3dnUgXO7nW+yY
	QE9jFpV+Ty5PBvWKdFW5NJEEFQHM5W+i5j6zFirBhSB3OOn6ObG4CeauqoS75wrMfiu/Hjrrm+i
	NRhHJjGOWBEMFbtDsfMdCCsmcHs3ETY7eI=
X-Received: by 2002:a05:600c:34d6:b0:492:58d6:2565 with SMTP id 5b1f17b1804b1-495389c5f8cmr36811105e9.25.1784047593529;
        Tue, 14 Jul 2026 09:46:33 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953b8d0f9dsm1989895e9.0.2026.07.14.09.46.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 09:46:33 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: david@ixit.cz
Cc: vadim.fedorenko@linux.dev,
	horms@kernel.org,
	david.laight.linux@gmail.com,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v3] nfc: llcp: reject PDUs shorter than the LLCP header
Date: Tue, 14 Jul 2026 18:46:31 +0200
Message-ID: <20260714164631.75068-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every LLCP PDU begins with a two-byte header (DSAP/SSAP + PTYPE), but the
receive path never checked that a frame is at least LLCP_HEADER_SIZE bytes
before parsing it.

nfc_llcp_rx_skb() reads the header via nfc_llcp_ptype()/nfc_llcp_dsap()/
nfc_llcp_ssap(), which dereference pdu->data[0] and pdu->data[1], and a
CONNECT or CC PDU then computes

	tlv_array_len = skb->len - LLCP_HEADER_SIZE;

as a size_t and hands it to the TLV walk. When the frame is shorter than
the header the subtraction wraps to a huge value and the walk runs far
past the buffer, an out-of-bounds read.

A nearby NFC device can reach this without authentication; LLCP link
activation happens automatically after NFC-DEP.

Guard the common receive choke point __nfc_llcp_recv(), shared by both the
target (nfc_llcp_data_received()) and initiator (nfc_llcp_recv()) paths, so
a short skb is dropped before the rx_work worker parses it. Use
pskb_may_pull() rather than a skb->len test so the two header bytes are
guaranteed to sit in the skb linear area even for a non-linear skb,
matching how the sibling NCI and HCI receive paths validate their headers.

Reproduced with a KFENCE out-of-bounds read via /dev/virtual_nci on
linux-next.

Found by 0sec automated security-research tooling (https://0sec.ai).

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v3: use pskb_may_pull() so the guard also covers non-linear skbs and
    guarantees the header bytes are in the linear area (David Laight).
v2: move the guard into __nfc_llcp_recv() so both the target and
    initiator receive paths are covered by a single check.

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index aed5fe1afef0..e3b2627cb089 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1565,6 +1565,11 @@ static void nfc_llcp_rx_work(struct work_struct *work)
 
 static void __nfc_llcp_recv(struct nfc_llcp_local *local, struct sk_buff *skb)
 {
+	if (!pskb_may_pull(skb, LLCP_HEADER_SIZE)) {
+		kfree_skb(skb);
+		return;
+	}
+
 	local->rx_pending = skb;
 	timer_delete(&local->link_timer);
 	schedule_work(&local->rx_work);
-- 
2.43.0
