Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876297;
	b=XMp5UtX3lGx4D6UgiIbdb0muPyjcJLN/a8DkoLmK6ECsGXUN/eaImZW4ORANpsYstej4
	 7cwaBqvCGjoLNV2egs+abshQGMUj53rzz0FihcI0+Ka8x1YCmNqdaJEpmjsKllfP2XxUx
	 7ZBNzb4xs/XXpZdUd7NSEUc9oIJhvB71gyJYE5QSnWXaamN650GngDHM6Ir5XyonS1tP1
	 ym7hBGlKE7zhMke70QVdTVa5Bc/lzpawl3jTg9DnM0EAYjCpWGpp7FudeX7Y7nkuRltg+
	 rWQDllOPv+crOfzEC+loumyFpgkxFnu9OKwEAk3cNTu3YcS4ixf1B3JqYGI70Va/mQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lNM3+b6l7cj+vrA9YlqTwqxAWDbif1TufQothTfjcdI=;
	b=pKWFh8UtTHifdYqkZQlV5QemQ4tzUerVsmsuzmYZyNAG5jZHjVy8hs6n3udbAm6wdhmr
	 BFnfXwVSyfq8QXdzqhZCjLdTyPkIjHn+02Pyi03LM6dnXs6sIcVmvfrNcTSitOkXyy9mY
	 oG1LpJvvDDM9GuiaZES8MQLQvrj5iHwkDhfWr5pGEbGFtvx2je2HTh9DsdXX0P4I+wA3r
	 6LD3cnCDmZDtlJz8doWT8qiyrjQdPEj9GqNlpMgwuoKgc31mORIuy8IoRtGP2R6WQDoMT
	 lfSHoaYiO7CZycIFGwMzgPjfXLvtq0XKES7MKL+gfW+eQbdVF+wQtOIJFZVXYP7JAvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qg5HcgZR;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F091B606A336
	for <oe-linux-nfc@lists.linux.dev>; Thu,  5 Nov 2026 10:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F091B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qg5HcgZR
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so892842a91.3
        for <oe-linux-nfc@lists.linux.dev>; Thu, 05 Nov 2026 02:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876296; x=1794481096; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lNM3+b6l7cj+vrA9YlqTwqxAWDbif1TufQothTfjcdI=;
        b=qg5HcgZRidK4WVQeKJ/8knHAiFD3Exk+1g1yriMc80Fkvy/Sl/M3UbW8zELYXZ+krN
         2z79Qdr8YE4hErZTw0YIJQYuqYGTZhtmQ0bMnoe1N1i0WjeGxbIb3+aKuDqmJXlKGqlp
         ZPrBynYhNeA5KVbiAX7+/ABK/Lhg9S6L18mqBoSulVaTghHsQPnoCm+5PKeVNsJBh9rp
         x0LOzCitSCHruWfvuqyJBUG3QnGhi3GkjrrhRZ1AZw+lwVryPexXPE34eXkUm/0EoKDR
         wAIva4EgTb5yCJQje4siQ1e1eotEQoU2mPHX7YtwazPIcV1HlGo18ZJDvthZgxjABdWJ
         J9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876296; x=1794481096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNM3+b6l7cj+vrA9YlqTwqxAWDbif1TufQothTfjcdI=;
        b=aAKkZhVi5U6sxGuqcC2ieEta9bRr4ZthaYdKs3jr696iwm/iWX/snBDVuiWkKzIdA3
         grgApjplptJCzHus5eNgaIs2e2GYRUdOLB4naNS2G8PiVmJOQifpfDwBagUVZL9ny2Mz
         9m2QdAs/DafCe+5IGK4OUQobfKLLMhwrjkGb7HuXZo51rzeNh7gWmc2tUuuLnAwqRBYV
         RiJpybXGMuexI/FjdnJLv5JptjNLQl10bZ5h42HNCT5PK5jxCD8a+WYxsKQhJ3w4PtT8
         rtgp1yYodz3D+jYLbiflxQ5mcL00d8ViPH8V9CoiCAludkZ+r2RfJfm/hMgv50HtS4Ja
         KhzA==
X-Gm-Message-State: APuU4Z+FfP9jALrTw058MlIJYo8OSFDgfoFUNW8waCZfXRcaGmEvkwDh
	pUdQ3p70gw2rkqxYCXmiuhaYQ566WZfH7pos4UW7I1pPz/gvQZvhaobw
X-Gm-Gg: AYBFou25a259O0570UgEQADk5z2uHQ+p2Uu53Ltx+7X4fzEr0lAEZdmFkQwepvdGhcJ
	ucYtsDxcHIBB6JQRdvUNsVMDhcYwIIapkqUDFbINh+gfK3qr71naA10mXxwzQI2RFbzwevfpLyn
	msuZI/wFSZsGvGLXYmOFPlmBScAQhgJ9BP9/yfCBabzJmzhyZ5CsdKypO4Iw2ESOjIRmL1F3Wsp
	Gp7eB+rD/j+4OE9GpNYpMm4eS8PHVXG4AMoCYEkP8NyLamrgHvD9IxZeZL5YFNElG6dtJqIDEOG
	M/4DklrCBlB6E6hoZYOdaBFPDNAMSGAWo5RgY8LjuVBGJBX+NfKaMdS+ir8hqYYHFPrS3jdYxC8
	frh6OBJSn1J4JXRhb3gLSiLZTLovYQdOXCYRLRVNMximQRBfhAdC1ugWI3r2BgRRxnfK9sowWCm
	v1H8oRj5N7vgaoBFum47v1Cb3Tay2YPKUBVJJyfTit/sq5A+FA5mkWiNVkOXhANo5isL7wUFRHm
	EiFxWuTU5o/D64jWMoNgg+hb91pOLXmxnXcqrF7IEVCOmFwuWrxxjl+7tOdEpjTDmRSPNIxCswZ
	KHvpbqXUZ9Yzl0s749ErrGBlAmUepq+haTEl+9EDHxEfodVm
X-Received: by 2002:a17:90b:518b:b0:3ac:ea3b:f28b with SMTP id 98e67ed59e1d1-3ae897b6653mr14961496a91.24.1793876296249;
        Thu, 05 Nov 2026 02:58:16 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b6507sm3777513a91.16.2026.11.05.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:58:15 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] nfc: pn533: validate response length before parsing DEP ATR_RES
Date: Thu,  5 Nov 2026 19:58:05 +0900
Message-ID: <20261105105805.1450120-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

pn533_poll_dep_complete() and pn533_in_dep_link_up_complete() cast
resp->data to a struct pn533_cmd_jump_dep_response and read its fixed
17-byte header (status, tg, nfcid3t[10], didt, bst, brt, to, ppt)
without first checking that resp->len covers that header.

On a short or truncated response the handlers read bytes beyond the
received frame:

  - rsp->status is dereferenced with no minimum-length check;
  - for a success status, memcpy(nfc_target.nfcid1, rsp->nfcid3t, 10)
    copies 10 bytes from offset 2, so for resp->len < 12 it reads past
    the valid response data. Those bytes are then handed to userspace
    via nfc_targets_found() (netlink), which can disclose stale buffer
    contents.

target_gt_len = resp->len - 17 additionally underflows (it is u8) when
resp->len < 17. That path is mitigated downstream --
nfc_set_remote_general_bytes() -> nfc_llcp_set_remote_gb() rejects the
resulting out-of-range length -- so the subtraction does not by itself
over-read rsp->gt[]; the fixed-field reads above are unguarded
regardless.

A valid ATR_RES always carries the full 17-byte fixed header (the
general bytes, if present, start at offset 17), so reject any response
shorter than sizeof(*rsp) before parsing it. pn533_rf_complete()-style
handlers in this file already length-check resp->len before use (e.g.
the ATR_REQ_GB_OFFSET check in pn533_init_target_complete()).

Found by code review; not reproduced.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/nfc/pn533/pn533.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1309,7 +1309,12 @@ static int pn533_poll_dep_complete(struct pn533 *dev, void *arg,
 	memset(&nfc_target, 0, sizeof(struct nfc_target));

 	rsp = (struct pn533_cmd_jump_dep_response *)resp->data;

+	if (resp->len < sizeof(*rsp)) {
+		rc = -EINVAL;
+		goto error;
+	}
+
 	rc = rsp->status & PN533_CMD_RET_MASK;
 	if (rc != PN533_CMD_RET_SUCCESS) {
 		/* Not target found, turn radio off */
@@ -1929,7 +1929,12 @@ static int pn533_in_dep_link_up_complete(struct pn533 *dev, void *arg,
 	}

 	rsp = (struct pn533_cmd_jump_dep_response *)resp->data;

+	if (resp->len < sizeof(*rsp)) {
+		rc = -EINVAL;
+		goto error;
+	}
+
 	rc = rsp->status & PN533_CMD_RET_MASK;
 	if (rc != PN533_CMD_RET_SUCCESS) {
 		nfc_err(dev->dev,
