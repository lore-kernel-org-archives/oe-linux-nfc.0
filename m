Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6BA285CA2
	for <oe-linux-nfc@lists.linux.dev>; Tue, 14 Jul 2026 16:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047594; cv=none; b=Do/Xt+M+3IhsaQRaCpGushPVJ42L6eUSMGDzMgTDU/1btDMjnTctLfgKsOak645iU8N50ZFt8GMs4Bzd3r9vhr5ge6VshaPiQ4rXiz9q5aS/qJA/+Lw8XI2p6DLHyej4bTp/g02aplnyyhNUViKKMwdal+CyCJ3e7RO8WCMItgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047594; c=relaxed/simple;
	bh=VzArmT7nUp//GvC7u1Ew+TKOM8ByFP4IkQWLiZaejoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocBYzTz65kpHDOG0d2X/gWYS0sqIy2Z1DTrHS7EAeryREqquzHJ3cIwNHIfmmjfbjjxbZx6dAEJVzg9gaIXRnfEau4ph08WnHHHBVyBwERh2xWI74o/v3lR9AzEJmMkyHDGnp/iBbXRYwgkeJakAf7J/lOFDmqz+HCt4ObDlsUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=FQ0PbQrN; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="FQ0PbQrN"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47de0093c42so1000485f8f.3
        for <oe-linux-nfc@lists.linux.dev>; Tue, 14 Jul 2026 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1784047592; x=1784652392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGZqGZVOotZvIfQ16pDrwhVFuI0Zyt/cSEfsEhB0qUo=;
        b=FQ0PbQrNMhPFws9PyG5n3YRDv+QDASFRAs7jUe0N4cquegMdTDNjXlh7uVnBDAn3pF
         NRbkr7XM8Wj3vp2PmpZ1qCmYkPFU9IdFsbHmK/+rNTCbboPQuPct2Qoo+/3pGPklDNMl
         lK2nlBvnrxQZqFwBp7XY44QpuPINFmFNTTgcrYd5oMSGAIiJKDrqCTr/hh8wEnZzXOll
         i7RQKIFd/oyQ/RG/dxQ5yEUXHExcizfsaofCg4GHewlgGk6wpQ+6+s4bAezii2Ea5uMp
         aPLj0ezn5VWmWbspBejXOxnMsyJTsz5baarXdv073V+EF0CCYBWy00EVUtmf3XlUkKKX
         evJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784047592; x=1784652392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGZqGZVOotZvIfQ16pDrwhVFuI0Zyt/cSEfsEhB0qUo=;
        b=GqUI/dTyJf8HX78+9ySyx+kNPQiNN2nMwqojQ8L8gawc3aKDY3KrtOB5jxJf0PUsdZ
         upMdsyV6hJ60y7uGxFV3GtQh4MI+VqJd1fZ2KpT646tleEEmW6REe66pNAHEWJ0060gX
         Ohj5yQhHknpVG24NaayripEPducgoYHMMt+/FK/efezWibviT0nEMDkWqZ3IOJ3s9GJZ
         Cp89u9NjCKU1hyLaUF6q9JS72nOdq0EacGdPtglPwRj9NY031lU1Qd/0P8EHhBa2RJ0Q
         WnstS/c5Dmg7Kw4tpGp68ArBfYROrmtwHvrwWaI0xmrglwFaYLwzX4kjXt+Gb4aubTIO
         dALw==
X-Forwarded-Encrypted: i=1; AHgh+RpBhwQctqdofP3WHaRTDsYQLhBCQHSbKIDTnjDkqA+3idmyR9CMrK/wrIGpehRkC5S9gfXSoJ7PwqoN6MI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrbH3s268LoaHOY8Ajg5AkrDtSy5hTiB0hOZbBZC8E93eCsQOq
	HTsFhsy45KkAOqBcLU3VJXrW99qzyyB7KFslOoOdVwf6Sy9OOl1OIpkY8CCuLAJTBrkj
X-Gm-Gg: AfdE7cmzJimDHSiu/8dMLNFST2YRUuaCOAo5sH44w/WRNFNoafvViNjReg4M6vlwFjP
	E584bRdZlUy/SLDhEbRvdZ36Q1PgK5qX9mnVQV9gESZ1IYW5i4QzYxxTbrxpUP6BqdObXpjy5Ku
	6o6C3bqtFKNC3yFjv2ZISgzF39EXCfy7G53mHmGZ79JsEkI455+47BZRn49mKv+3Ci04sH0RxnQ
	+03DTapgHEQJo4aFfBO5FlWyxSuC/3exTiiFOyI3oiQ9azS99zZjMRJ8jUNf+pBTH9EQWLXKkSl
	vV24NtsZ2FPvsiUDju8Qb4IulRRy47x2bIdbZsh+xUsd0GdMVITPbZ6qjNEe0jlsqXwAoXJN4xl
	ohDC0MdjPVEqTaVrLfqKXbD/EON1Gv4z3yaN+3KkVxD16j8snQ2SV7IZF2T2i0jAtWM7WZjOM8P
	0dsxvaiw/+Vu2AcCOeW7G7dKrAmGfahgn9jeyD/ktkhT6gVMwp4k9I7zrdVHG+AUbR+qxTd5xm+
	8Wz1sayaMAx0oqHW1IzLNOkPKAIBHJNOwp/40y5Q0yo+g==
X-Received: by 2002:a05:6000:470a:b0:475:f0d1:eb61 with SMTP id ffacd0b85a97d-47f2dd1ec66mr16303746f8f.60.1784047591553;
        Tue, 14 Jul 2026 09:46:31 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f84sm9164956f8f.27.2026.07.14.09.46.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 09:46:31 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: david.laight.linux@gmail.com
Cc: david@ixit.cz,
	vadim.fedorenko@linux.dev,
	horms@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net v2] nfc: llcp: reject PDUs shorter than the LLCP header
Date: Tue, 14 Jul 2026 18:46:29 +0200
Message-ID: <20260714164629.75051-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713221556.13a830b8@pumpkin>
References: <20260713221556.13a830b8@pumpkin>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Is there a similar problem with non-linear skb?
> Maybe they can't get into this code, but who knows what can happen
> with unusual configs.

Good question. Today every skb that reaches __nfc_llcp_recv() is
linear: the target path (nci_rx_data_packet -> nci_add_rx_data_frag ->
nfc_tm_data_received) and the initiator path (nfc_data_exchange ->
nfc_llcp_recv) both build the frame with alloc_skb()/nci_skb_alloc()
plus skb_put()/skb_put_data(), and NCI reassembly uses skb_cow_head()
and skb_push() into the linear area. Nothing on the NFC receive side
attaches page frags or a frag_list, so skb->len == skb_headlen() and the
v2 skb->len test was in fact sufficient for the in-tree drivers.

But relying on that is fragile: the parser reads the header out of the
linear area (pdu->data[0]/data[1]) while skb->len is the total length,
so a non-linear skb with a short linear head would slip past a skb->len
test and still over-read the linear buffer. pskb_may_pull() is the
right guard here -- it also covers the non-linear case, and it matches
how the sibling NCI and HCI receive paths already validate their
headers.

I will send a v3 that uses:

	if (!pskb_may_pull(skb, LLCP_HEADER_SIZE)) {
		kfree_skb(skb);
		return;
	}

That is strictly stronger than the v2 check and does not reject any
valid frame -- pskb_may_pull() pulls the two header bytes into the
linear area when needed.

Thanks,
Doruk
