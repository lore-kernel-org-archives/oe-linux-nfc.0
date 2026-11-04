Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785924;
	b=cbedu7GDqqU/gBYk6F4wQK3IAIUF6+u6nhGdZKJN8/oeEhJCLVowDViCr96+6hFdU9ZR
	 ggsB3MXv68Q/V/NEc6ai1dFduJqr7Sre1QNtQB7SONX48+MCwW6ciidAS948lH5nIR/Mq
	 LzTV0yFw0bogzkWD6x/OmmaQRgrBkqWiahIoOXJ7clvJyjtvxUql8AzDBx2ZNyvBJCP5W
	 yhagou8y2vNuvw2Oj8cmQJQXu6UwPHRfsOHaol0AvjqbzrQeqed5vk1JUv8WDpkizaJ1z
	 PRrW7pPfgH4RSej4/dJdIUSssKoxZbjaDg4TizlE35Y8KgpzMx+glIx6zKIFy/sRSSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=sjjoNU4OK/n7KURPKe/oyQb00JhQCh4KxXbD2x391nA=;
	b=B257MYL/hAq4tYvZNmSlcEkZNgRfDuzJoiPOHB8ZEK3zWJgf7CjBiylRKy0MpzPi2w6N
	 aRTo02pEvgnJsRxUwd7D0ZfeUGP1M9FRAyey/1gngq2M+wJEFCHzMmdgHzIjZm/35QFAY
	 3gt0ZKky5o9H8WbR6rXe40oUHrSTiMTTu5O9O9eS4RG2cmRpaFLODWBLM+a4SXhnO3N3D
	 odI5NdJDQz39COzxUBVxFstrpKFpzfy+e6nD2OEzncFGdGuWzfyjzHRJtGr6Pxw/6+SBT
	 LFERJOHK4FoO3qZsIoKFHwVW+oVNnVoT5nlzNfyj2Ptn7SmzNuCiSlrkWYdjIDgURMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APf2uJEm;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABB7606A32C
	for <oe-linux-nfc@lists.linux.dev>; Wed,  4 Nov 2026 09:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ABB7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APf2uJEm
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514b90bb89so929036eec.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 04 Nov 2026 01:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785923; x=1794390723; darn=lists.linux.dev;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjjoNU4OK/n7KURPKe/oyQb00JhQCh4KxXbD2x391nA=;
        b=APf2uJEmoQa55+NTve/PYA5j9LeP9xEx0e7XSzkFEGA78mnmCenpnoagGC2v2/w3y4
         GwrjMD7YKLxpiurq6lhcY1dP0CWqIzGGAa7zYf0nSPhd0PkQXgI31o+cldx19H1+MdeR
         Gs+FxKtKJaprv6EMFeF8i7emYAZnN+g5TbOQnyz3jM4wLyiJq+jYWuJhf2OS62wv5RsB
         7LDh3gKmLTFBIJpSs3fol20P5ONCZXQMaS7/IlIOB513gfPXCXl9FDVJ3pYW6Ku9psyI
         ZHxnqskIdhszVFlpN9Lb7YVfkZt0gggQxwQ3pqG0LuEMCXyZ9JbgWOixuWCGfHq+GiJK
         0wPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785923; x=1794390723;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sjjoNU4OK/n7KURPKe/oyQb00JhQCh4KxXbD2x391nA=;
        b=DLxEB/vJYgyPW8AuBPTwwJd/3ID5DSL75MtRK6EwmWhM8G5dpX2HMrT8SdxfPUZ8rx
         fpB70S0TR3hhRcjTizxpO3V1XdfdNZgAMhMfRWG3/qf2W9AzUcHffD+UiErZaTL7QIk+
         dAI0JOjhiyOeORhSfL0flTI9gjYLCFfdKv/ThXW3BkSOc16N4xuGxv+zgT09QdaJoelr
         xsiuHiQ3XOpinFLFxNKZfygGn1gDhP+LfVJ7xiA82422t3qouzcRFfXO/zOcJrKtKrh1
         8S3B3596eePuq7rlr6YUxbcnQgksGT2eV9bj5VE0FP4l3J/Why/KXXgTbkD29gEIcfpM
         6oCA==
X-Forwarded-Encrypted: i=1; AKwUvByT3pQoSAlOhn4h9fzvf/kYMTRktxFnoU15C2AKHE3uJWlEAPRFO6FeeW6DebRZ+hXQWYXSdryupKOxPPM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+53O3lDVmqrFjNy8R7jF29FXnelTYASUvHnS1u/lZn1nIt9FOv
	hlcWvFvokOrpE4/sA23+MLSY6NwQm8Zb0Qal1T3nK29ZhEv609I8M7/j
X-Gm-Gg: AYBFou1ONsk3hy32aZQtH7wt0YesCShEBbxqklNuU72jXvPcapVLGzLLZW6tOZv67dY
	y/J5t8HPYC087mgR7yL1suBtSTSY4ujK58f4li+WP8BlJNaB3Dh2zapTvnZwowPkCZmK2VooqD0
	bGDBrIlxQRQf/XDuy/owqkiCXGJduTCe21X/uVueRhVj5fUaa2EpBHxzgtJrCqO5fC4yTBbwieH
	dEuZ4MBmRKy7ySU0h8fzuw69bzw6i3q/Troe/T3wda3Iqz7w9pByma7sGagD32SL2J92AB+xXMA
	xZNIRpF9ScU3oW7O/yrhihDG2S6PqDItLQmS60loGssCHlPy1If8kvlwCTsyyYHWGzOnwsZunok
	pJt9ifDAgY6jSCrNkz/mvTo4z8Y3/Bvu0lOsadqBaVSzHL0gNe7JcwCnYUaCVea3dtgegBDCe0O
	kNegt1Ttd61pcJh/oDzIvJ3RxpCedxzliuiShwko1DoDjVbj/da1o6N16bOnJlwSdyljdFzostm
	+YC0RUl9pgKoZP61VjwN8UWUUGbm2xIzYbJjXyXRAMWcq4H52GPefOQ4rxa6d5/yd3ZwJUb4f5Y
	e9LuzWZydZPACEvFMxgEGm5W3ZDyz/GuMLWKoyrDjHuuuTKUjBtk4uIRqb2oTX3S4qBv9C5PRZF
	ZPzdJf63e1a/x
X-Received: by 2002:a05:693c:62ce:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-36a42362451mr22493017eec.11.1793785922864;
        Wed, 04 Nov 2026 01:52:02 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3966daasm7911411eec.23.2026.11.04.01.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:52:02 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:51:49 +0800
Subject: [PATCH] nfc: rawsock: prevent TX work requeue after socket shutdown
Message-ID: <179378590950.74297.14503648624087894519@gmail.com>
To: david@ixit.cz, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com
Cc: horms@kernel.org, lauro.venancio@openbossa.org, sameo@linux.intel.com,
 linville@tuxdriver.com, aloisio.almeida@openbossa.org,
 oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list

rawsock_release() marks the socket for shutdown and cancels tx_work,
but a delayed data-exchange completion can still queue tx_work again
before the socket is finally freed. The new worker can then access
freed socket state.

Check SEND_SHUTDOWN under the write-queue lock before requeueing
transmit work in rawsock_data_exchange_complete(). Allow the completion
to clear the scheduling state without scheduling new work after the
release path has begun.

A KASAN test with a deferred NFC completion callback reproduced the
use-after-free on the unmodified kernel. The same injection-assisted
sequence completed without a report after the change.

Fixes: 23b7869c0fd08 ("NFC: add the NFC socket raw protocol")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 net/nfc/rawsock.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/nfc/rawsock.c b/net/nfc/rawsock.c
index f7d7a599fade7..efdbd512d4600 100644
--- a/net/nfc/rawsock.c
+++ b/net/nfc/rawsock.c
@@ -168,7 +168,13 @@ static void rawsock_data_exchange_complete(void *context, struct sk_buff *skb,
 		goto error_skb;
 
 	spin_lock_bh(&sk->sk_write_queue.lock);
-	if (!skb_queue_empty(&sk->sk_write_queue))
+	/*
+	 * The release path sets SEND_SHUTDOWN before cancel_work_sync():
+	 * once it is set, do not requeue tx_work - the socket may be freed
+	 * right after the cancel returns.
+	 */
+	if (!skb_queue_empty(&sk->sk_write_queue) &&
+	    !(sk->sk_shutdown & SEND_SHUTDOWN))
 		schedule_work(&nfc_rawsock(sk)->tx_work);
 	else
 		nfc_rawsock(sk)->tx_work_scheduled = false;
-- 
2.34.1

