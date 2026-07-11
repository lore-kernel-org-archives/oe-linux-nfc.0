Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5E12DCC1C
	for <oe-linux-nfc@lists.linux.dev>; Sat, 11 Jul 2026 07:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783753988; cv=none; b=dBAotPHmzdHrh/AupDlGySP6uVClagDQFIDZQCx24dMz0Rkc56Ujmtz/AqJMar4FimLbSPLEK1f2rGeTcasXDgSLPhqj8qJaMh03ixMCU57HGoBkdZ+bK+ckksOJulL0/YvTSe6OPG6AYH91lcgHvqAEvSKK3lsbJA7ie/rDt5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783753988; c=relaxed/simple;
	bh=tteEXFBN4+2wOzmiU/i/Ti+DuESNyUk6Z2sZdVGq9Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g+WSMgFwxVJzuGX/ZrH5yyP4cqXkfEIX43tHwwVS8AboyfXBsjUPg0sUskK9DRUQcJ3MR/aIdZs0iFxHYWPW2TvW4iE2fo6oS4q1fxuuo7Lnn8rUkrK0k0nqRsyeEqa0ciKshOE38ziXfWQJdUDlB58HtfB3uNk/VzcgB43lxJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=mDsP9bzM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="mDsP9bzM"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c19bad03so13550725e9.2
        for <oe-linux-nfc@lists.linux.dev>; Sat, 11 Jul 2026 00:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1783753985; x=1784358785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQOzeXV8phwSUt0xHK7ZAorIIAoHjVqQrsau28MhLzE=;
        b=mDsP9bzMNhA5hnpOYgfYRX3xCNBmVITnyKt7MOpHtKFxmoWAEDC0lAV1cA3fN4k9oE
         gQnOouK7zQul9crrZQz474qbR8dW/S6pxXweb1jFPS/tZGtbP9tnPhYtEDFGMyENDGHw
         lvoQHFLNDPiC0S1P8oVYyNT25Lu747mVOkr40mU3ydC0zfrtN9r3VIgMbI5XgCbr9EoS
         9MB48Vfxwdu4xrioqlVpL1E/P+uvoiNEDQ4uyidYlmqegjf/4fsDc2JqfW7C9OiHKHvZ
         R4XDdZK6ojcJnwKuN0DZr/4F2iwcVKnNk9vS7UPpNDKMNOp17GHBgYESMzwSkjJN623F
         7ijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783753985; x=1784358785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQOzeXV8phwSUt0xHK7ZAorIIAoHjVqQrsau28MhLzE=;
        b=iqFlWnFFyuG0Kthvne0sboWz4gxI2EpTVZQ1HkubV+lnrFSGKoBhTTGsa+WsXfNFYM
         QrVk0+xyJXJL8d0hYreh6AcycCKXEZTLZ1ZJF3ynr0ZgJEIYbg3DdmiYRIFKhJd43aQ+
         MZX1qfeTEDcAsdFq9hGgH3uzQIhR1yUVNxejqf1jmHvMWXWFsIJz9TjEbPi7IIKxhViD
         7F/C0eMjwHyBL1+nqD4I16WI4qVK0IVE13li7pwl0XB0Ywz9yM5PcEhXJ10XCVwu/XnG
         94fEuVVlXwd0GuQUyPGd7j53s8eO2+txGlmgt3pI+AIbc1KsWeT1QaniHnbTYVuxQy7X
         eYtQ==
X-Gm-Message-State: AOJu0Yz3uXBAZprSTFrb/J5syOzgB3BRDtTb7d+OIRQa/7BVytRI4p5B
	JON/sGR5y+cAOElKlMGWwWAhjCPWbed6mdh55tUtjLhc0ETRJgzFBxQCd67mYaG1mmZX
X-Gm-Gg: AfdE7ck6bbJj8CQd3ygOvGpjn+IyOq+RQHxrCh/wjJRWv315ExLHausDzBRbykFn1Li
	phGatIkTXi6cyTqtd3DoMHXq+6wzqsY48p4pMOYaTTvQMjwnekGvdsQ+GkSoUv0yfOgNg73grDm
	lh3x2oKyfxKxTy9Fr9za7R+NXxjVG5R3LT5koJJoEJzVCKbJK4WitLZERTeu4wmJ3ie84W+8J2b
	dmTdh5LLYREZ7BaB0Pr9anlDHfgDA6lpRW1GqHehEDFK8Cwmwlc9/HAwQn8j5riXRfmQspxVIom
	O/rv0KPejAkQIDjRbVdFlY3bJjZ8LAvEd9AaHbLpeUvcZYUiaCT5GUJYbJ47mBxtWaLPMol6vcZ
	baWUk71kAz46w7r9Vh+5c2y94k9Z20hlLgFpSPQcCH4fz7A39ydkD8X7RT07vZmTn9UitCOAGNK
	Mi7PhdNLmmjXWeKaT+uGqSzGIfuLPCbYXuOjDLQlSWhcUtcukMUTMwfH2lWAPjdn1rxjdsQNurN
	TYZDe3zyr0xdoAjInhCmO54TPCjIuXKLgg=
X-Received: by 2002:a05:600c:4f8a:b0:492:43d2:9e6e with SMTP id 5b1f17b1804b1-493f87e9bd4mr15077835e9.9.1783753985154;
        Sat, 11 Jul 2026 00:13:05 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2e77c2esm87910115e9.2.2026.07.11.00.13.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 11 Jul 2026 00:13:04 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net] nfc: st21nfca: validate ATR_REQ length against the received frame
Date: Sat, 11 Jul 2026 09:13:01 +0200
Message-ID: <20260711071301.58071-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

st21nfca_tm_recv_atr_req() checks that the received ATR_REQ frame is at
least ST21NFCA_ATR_REQ_MIN_SIZE and that the self-declared atr_req->length
is at least sizeof(struct st21nfca_atr_req), but never checks that
atr_req->length does not exceed the actual received length (skb->len).

st21nfca_tm_send_atr_res() then trusts the declared length:

	gb_len = atr_req->length - sizeof(struct st21nfca_atr_req);
	...
	memcpy(atr_res->gbi, atr_req->gbi, gb_len);

so an RF peer that sends a short frame but sets atr_req->length larger
than the frame makes gb_len exceed the general bytes actually present,
and the memcpy reads out of bounds past the received skb. Those bytes are
placed in the ATR_RES and sent back to the peer (kernel-memory disclosure
to a proximity attacker); a larger declared length is an out-of-bounds
read (DoS).

Reject frames whose declared length exceeds the received length. The
adjacent nfc_tm_activated() path in the same function already derives its
general-bytes length from skb->len rather than the declared field.

Found by 0sec (https://0sec.ai) using automated source analysis; the
missing bound is evident from source. Compile-tested.

Fixes: 1892bf844ea0 ("NFC: st21nfca: Adding P2P support to st21nfca in Initiator & Target mode")
Cc: stable@vger.kernel.org
Assisted-by: 0sec:claude-opus-4-8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/nfc/st21nfca/dep.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/nfc/st21nfca/dep.c b/drivers/nfc/st21nfca/dep.c
index 3425b68f0ddc..a5fab4fd5129 100644
--- a/drivers/nfc/st21nfca/dep.c
+++ b/drivers/nfc/st21nfca/dep.c
@@ -205,6 +205,9 @@ static int st21nfca_tm_recv_atr_req(struct nfc_hci_dev *hdev,
 	if (atr_req->length < sizeof(struct st21nfca_atr_req))
 		return -EPROTO;
 
+	if (atr_req->length > skb->len)
+		return -EPROTO;
+
 	r = st21nfca_tm_send_atr_res(hdev, atr_req);
 	if (r)
 		return r;
-- 
2.43.0

