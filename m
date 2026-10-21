Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553092;
	b=PW877KsLPsxuj8lW9Mi0D/S82HiqJNyCJ04XW3yfSLkmfS7js+hqLgP+1AzPqaQQmV1I
	 hhWM5ICFrWEGXjEX28N5X4z7VEiJjBrpSmJi966W+A+9GbtjimDyhHRAIysFbuVHlAIjI
	 rgMnWbl9FUPv7ow9AIY8PTvqAZdYeiDA+pavm264wfn0xH2CXtwH5/Pth2E7qgqp84Vws
	 O1D9/ZXMM4o+t6fT/B2S7WzJrodTJwS0oY4VRJgIV4zg8HAHfM2nuZjTRInpOVo1YyrnD
	 x2nfnvmqazZRoQz3n62W0rq8tOQpRN5g85T2knKwqZGWIrjQKNbU4NKw1n5QUDaSHWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZFVAKQGsMgdgNfkXAN9sULjMGSL2i7oHnvsLeDRjk+s=;
	b=v5uWK2CwWfjg2n07zfGiVSgj7gk/Gn2mVtIOv8A5Z0uDLxBtWGK5pHbDfjG7hN/SdTLM
	 0D4uP6Rzzv28KqMXth//N7yFWw1l0T8ZXihTT0u6fqkRHPRX2jNukj3QWg5k4aXkDURs0
	 gHkJ2IA/VGTUpjh/D85FKUL9LEmTeAUSQ5w2t08ABh9N4qCIBd1pXWPjBJABgpyk9Z8Nc
	 GZTQhyiEV6mhkpanOw4t3bcws2qP03f8edSxSyQyvOO/T8xjwlMfC79mwNmcweG0RVfLo
	 kteyCKD2lhe478Cx8PhzfaE5g35GupTyt2gKqaXFO7gZsT3FjWpI9FESNLG5nqx/29A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=octane.security;
	spf=pass smtp.mailfrom=octane.security;
	dkim=pass header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=gAMewqBJ;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F96A606A320
	for <oe-linux-nfc@lists.linux.dev>; Wed, 21 Oct 2026 03:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F96A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=gAMewqBJ
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so43007a12.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 20 Oct 2026 20:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1792553092; x=1793157892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZFVAKQGsMgdgNfkXAN9sULjMGSL2i7oHnvsLeDRjk+s=;
        b=gAMewqBJzeOB4Gc1RTwMVRSjXFUS/RzOrTPlw+gODjouIRFPb1hRY0fxH9U9vZKN3k
         8nqLTUg3DWThPn0zFiL0I3n1SaYrtmrKUIV7LA76UsZmvqrNzRO3ehIXrxz3UGVwM3He
         cwVyI87hJPX8ehdEj+yXWwcSW2C5BpiVaqR2cWanBXvlzyYTqdHIvGtaDQAinP+m49Rp
         aJ+1Qk2J8Z3+ghyIqAKFKrtOodPwt9dMWkymMG5mVjawHjvfQEeFNeeLKU18O1PrY71B
         IHHh2ds76/XdeN4NRuiN0dm3c45KcLqsWDy4BaulcU4m6UeQthHCYZbRQx99opbNt+bx
         yrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792553092; x=1793157892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZFVAKQGsMgdgNfkXAN9sULjMGSL2i7oHnvsLeDRjk+s=;
        b=JP3MDwsbNk/7tXIqTKrOOmX7mCNQoaXfUDO/60rl2S/BWsoPqKjQABNu7U5ujjccmm
         z9HVIwud5seiGsHuaj4t9GYTPV4E/WJBuq7QMH3hPzpvxQ/jz7vOO/6cZLzk3axPbqFm
         0RheBEpgeAUOL9KIDhqgoSGzOURo8/B7MrV+1nLW3mQJTA+UYQoK3AzMhUSUmOuq3Mjf
         +qewpRNn2sKcDmHn9PN5FRCs/SEqjqIWCqclglfQt2sS3/KJmpn9w8zshoiBmNZZZfoI
         97HciNaKwXY3j7AeuT1gZ9OBfbJNS3yClh6CvggucUnLX7Rs5VGV6wXMz62nuGJ5B/oT
         DqLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxu8VwkHgzVnmv0BFT9P0ydcpr0GAbFkhYuR5PsBslp0nben8bcb5eNmojElf5RSrrD5Ykvi496LJr5XKw=@lists.linux.dev
X-Gm-Message-State: AFq9FYJhLpICeD4iwzqymizICVH/CL030FrhX5D8zFhjG9L50DEiIcTt
	K5uofpj+sWRWEpxNwA+cw4+SGP8QgWPiULMaDJ5f1RvwXjjHHZN9DYGm7ar9+Ts8IPo=
X-Gm-Gg: AYBFou2c2DB8K/k2OXBo+d2aPuD8syh75KcEaMuQn79yvgLA+gTI+My4tMj1TbrV9sE
	Ls8cKFR7gTgUri/a8qbLNVTLSjM4BKzHH12iN2ZT1H98khY6QaxsEoZ/fXuJVl7D3R2ul0c7oGt
	5om+xDVTtd6xI+Ta3CO5lwHndgjelkkL0q1O/07dkM0ZkuUJhNC+BrBIH9+7km+jPkCzIQ1wjOI
	BvFnqj8gpfJziEID/CW+lT4XJf2qK5+Nsg1UxxnWW1JS3w1iiQNjBr0DD4QEF0AeYZHAR4PqNlm
	2zjSfjNn8Y2L/oBjRK4fdRaygUNzM9bBIavmvfgdbHclSWvWdZlxygz8VZcaKrzXCB2u/ZJ5VE+
	/yb6/7aUAoaRLxioDxMe9VexdJJD+FqRJwJjO+3KBM4bAMznE6aplPFI0FUtXYwBBHKeR8UHJMi
	+OyAfR3CSkcKWmfcndrX11uzv4Oc1RFZN9c0za5hoCuHxlJoBfmuEP+c4vlrtAPkizXFitL2lzK
	RJfHdYQvDgjHQ8pHsmHgYDVzVrrT3RId7jh3IKCaBX/To14jKApyinnd6L6EfMLq0Pf6gSnph53
	B3hcM3V9CNGrj+KaMoLzwCfK0Fc1ou54GlgVbgNpU3KqnSvl1lvJqsYazmH7J4Xk4eIxH2a2bu2
	wSA==
X-Received: by 2002:a17:90b:390e:b0:3ac:9706:7735 with SMTP id 98e67ed59e1d1-3ad86b0c35cmr794388a91.5.1792553091800;
        Tue, 20 Oct 2026 20:24:51 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8030226csm2155285a91.12.2026.10.20.20.24.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 20:24:51 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>,
	oe-linux-nfc@lists.linux.dev,
	gio@octane.security,
	stable@vger.kernel.org
Subject: [PATCH net v6 1/6] nfc: nci: skip controller reset while unregistering
Date: Wed, 21 Oct 2026 08:54:38 +0530
Message-ID: <20261021032443.44412-2-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021032443.44412-1-shubham@octane.security>
References: <20261021032443.44412-1-shubham@octane.security>
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

nci_unregister_device() marks a device as unregistering before closing it,
but nci_close_device() still sends CORE_RESET and waits for a response.  A
transport may already be detaching at this point.  In particular, line
discipline close holds the TTY line discipline lock for writing, so receive
callbacks cannot deliver the response and close waits for the full timeout.

Skip the reset request when NCI_UNREG is set.  Keep the reset for a normal
device-down operation, where the transport remains attached and can deliver
the response.

Found during a source audit assisted by OpenAI Codex, gpt-5.6-sol, and
reproduced by closing a pty-backed NCI UART while its NCI device was up.

Fixes: 6a2968aaf50c ("NFC: basic NCI protocol implementation")
Cc: stable@vger.kernel.org
Assisted-by: LLM KASAN
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 net/nfc/nci/core.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 73e3a96470ac..8ee33505e93a 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -582,13 +582,15 @@ static int nci_close_device(struct nci_dev *ndev)
 	/* Flush TX wq, RX wq flush can't be under the lock */
 	flush_workqueue(ndev->tx_wq);
 
-	/* Reset device */
+	/* Reset device unless it is being unregistered */
 	skb_queue_purge(&ndev->cmd_q);
-	atomic_set(&ndev->cmd_cnt, 1);
 
-	set_bit(NCI_INIT, &ndev->flags);
-	__nci_request(ndev, nci_reset_req, (void *)0,
-		      msecs_to_jiffies(NCI_RESET_TIMEOUT));
+	if (!test_bit(NCI_UNREG, &ndev->flags)) {
+		atomic_set(&ndev->cmd_cnt, 1);
+		set_bit(NCI_INIT, &ndev->flags);
+		__nci_request(ndev, nci_reset_req, (void *)0,
+			      msecs_to_jiffies(NCI_RESET_TIMEOUT));
+	}
 
 	/* After this point our queues are empty
 	 * rx work may be running but will see that NCI_UP was cleared
-- 
2.43.0

