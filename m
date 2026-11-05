Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875158;
	b=eLU7FoHrxXjWXIgzN7ndytmyl+CIkyaUUKyHyvQ/xmIGazHbCsuj3R0CTuaEBn6eYdSR
	 5598d5h2kIstk61+aJ6iT8tKQhmSvcX5QNxvgDkVR17zsGY+Z5vroCr/0Q/P57UYOtAYn
	 lABE8s6lAJ5CsgiVaMl7Bing612zeW7yHkjVSI+t5Q+L6sI5UCEpcA8Gmr8z3FuMa4waz
	 Wuyhm0W7FhnGE3DzbK79n/B7xY4TPAidqKiMHJHV+yUt8tb6kMzWPWCJJTxxnpL/kY65z
	 f6YarDLq07sTT/Te3LO4VX2FaGYv7vZi2DxvVwuyzaQcDrvCyemfRDywqyT1/jcY+nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lNM3+b6l7cj+vrA9YlqTwqxAWDbif1TufQothTfjcdI=;
	b=yUGl+js6bNztyhYAlTcCr1uywBcM4ZYbmGS3h/xmvUyMJX3/YFkregfEvufvUt4EtZR4
	 WXzxpLYbUe5kLpG7L987kAK/wGiribGyPSi0FWZuVknsD74w8vcjm200uyEobXFxh7KPr
	 8zl7XbdLEm23q9Oo2DtWg9dEr40KTXzYHLciu0lbcpGPJkVqOi1Xblw3jLuiSL77MhXby
	 4hlOTCbnMRKjLexFIcZ4wMDosgMavaweqJKrjI7T1lXBG3/ofnekhhBOJJ28w1NByUant
	 UDQFXO72/4VfWMNtBwqIyBJxrWnnbeWlbSPbO+8pdVL1eA/RdciGzUfmdJDJFW9URsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BQXsr2X3;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A6A606A326
	for <oe-linux-nfc@lists.linux.dev>; Thu,  5 Nov 2026 10:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A6A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BQXsr2X3
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso286615a91.0
        for <oe-linux-nfc@lists.linux.dev>; Thu, 05 Nov 2026 02:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875157; x=1794479957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lNM3+b6l7cj+vrA9YlqTwqxAWDbif1TufQothTfjcdI=;
        b=BQXsr2X3Pr7rAMsgYQOxh24Xj7tM3BbS8n4eOeWHyWQsrxV54qbtLuDEXtFvQ4bp9W
         D3Ud91cRkrDs1OTxVCagKIopYs1jRxbBG8/bpfO8RPU7EfdNnzqrt09NUHPhlzbu6VsW
         odpCEnWLejcxCc3eL/0yzlT3WfMn3P7+PjXfqXDSp/1JYz/nFDKN4zFVCd+jtAk5KiGs
         0EWhDxREcZrYA3SV4e8OBmBRuqPddRinia3t97QMaKK+h9SP98LKo9ugAa5KTqNSu20b
         zaDCJfMWXLs4p43jSu8uHlWgeFI3e/cajhUIHN/JoBZlbgs6ZJh8A9LUAsfzwyM5pf2Z
         uwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875157; x=1794479957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNM3+b6l7cj+vrA9YlqTwqxAWDbif1TufQothTfjcdI=;
        b=kyF41xIH8aHlohPJ2L8fDkN6Sgmzt9X+tmprqe5YkkSr+D/ZIU6CFBmpa2tcvb6r1p
         Z5TO+K4Flr8dzjznvq/c9eOiluU0HLencMF74uxtYfcgF5Lh9htjexXDpdwrmlY+3P5k
         XCwHpW/Rn5Vp1mIhZFcy11acyrZmbEhOidYW0DvPK69DGerI0WT+7IMhTV1aL5hm7kTR
         QnC2khp0ig4wpcw75h/PM4hRCtsdVYi7YFIOKtynjuHxns20ABTunoO2cWbsPbV1NA+1
         4fwkf9amjak2gOaAY2WlU63sNuiLyNCfyEZIoHPE5GDKmUAFwwqXhYsvxqN29zfzvIQR
         n2jg==
X-Gm-Message-State: APuU4Z9qbV+ZZqAMl850b+7unHr8Qom4Xl/EZLN9MQGzTW7FODX2eb5X
	2Ea1wEJJVCs3rNZscdKZ5Tjxg/m1jKXyM/k7lY7AAnkg62AwCnxIY/zopBqFh5wT
X-Gm-Gg: AYBFou0Oy2CVWM25Vhs6WCSwAYtQOljrnvCP2gk6utDYzsLSULQ4ir/anvqLHeP2sKP
	NwOcD3sA4mBTr9YKAGiHT4F/I07IGw6jD0qe6JVkzsckw9ftF6fvQaLKrYOXTWaD2xRrAnzGAvf
	Ad9+n02us24rYvjdK4psgbVcaiehL77swImqQeHsmzNpDQUTPUUqqQjK09cDVV4qSjje/EthAbo
	DRs4X0BBqz4wfOqJZI2rgOnYpa/NqOLIYzAuWLhC71ZHrjb3HHE2aVArWoXXMwj8wrimKkOmXZc
	9psCx56xQRbqEfcKhP361lj5U4tqox+jjGJTQ5K4MGTP6xIvMRruBzxo3Wj7VyQ1sjwo9S6OdU6
	tuGTowZe7y75q/6WU5Vfllc7xLCH/KjJkPW+j3DKmiMDPk0RZ8EpdW99MntLFFowieUy2cFrs/o
	acE5/OiDmen0MyA/rLDYu1Wm3orjwJQ4WMJwqt8dp2SvdHrq115p6s02yHhkqEthuZMvPisyYK8
	j/fSHREQYYy+Ln3RoX7AAANMbALQpTNleQyd8X6kpM6xqM+7JnqEslYUotGSz608ZD2OZlrvhMo
	6/JmHP1NFDDZ9Lzd24giCt72E0EQNxwE0fvVJxW214XXtzm9kSA8u7nWxdcHNDqE7aPiOQ==
X-Received: by 2002:a17:90b:5590:b0:3ac:9098:f602 with SMTP id 98e67ed59e1d1-3b0afbedfe6mr1784736a91.6.1793875156797;
        Thu, 05 Nov 2026 02:39:16 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb4694a0e0sm2150791a12.20.2026.11.05.02.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:39:16 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] nfc: pn533: validate response length before parsing DEP ATR_RES
Date: Thu,  5 Nov 2026 19:39:03 +0900
Message-ID: <20261105103903.1440114-1-hj351016@gmail.com>
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
