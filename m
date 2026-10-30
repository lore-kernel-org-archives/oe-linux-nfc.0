Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358674;
	b=v6fbUSj8bvq9U4JgW/No+KMmjMQG/oFPI/dMb7xH41rc9NDWMMMabJxfobbb834WqzdG
	 YJPCM6bseoN3nJNEz0C0WsVlu4Dy0CixR/0cs3rCMcpBeAlKlj6svNdmJC072oYGg0fg8
	 o01n85Yt9lHfbQrJpOPiZcC8J/ldjgY2rv1vzSaOc5jf9i2NHd0ChhEcDSIrvmhRZY+Ti
	 gWJfbZ4cObIKzldTaPHZjIoHW2I9V7L8hM607nN6Mu9AhhqPaDVmMwSc0umDnu88t4ZwB
	 SKUGhYLWIrJgZuniTt5lljE0duuhmaWma8bbrd1cxsXXRt+BO0rBZNg5fSWtoXdvI5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=KmOrBm1qC65xwrgbyzMtaj27QcC/iPJg0n2kc5knBkY=;
	b=UrO+M2MMuOVO4hOwHG/bhzPkPD9RLbyX4khl5evC5TiFYZ8NJUWHledBnk8wc4/O6tzg
	 Hwp7RkdYy7iutrWuEG+90CS/99ydg7/cLp3B1w+WwOeI9NBaB89XHPE5355er917jKhcY
	 JjjmfqGeObdcQfgTN3ie3z8t8KVGRS51LmrqiCuhSQimZbuSi5jG2cGl9rWSMaRfopokR
	 XDx79VR9PvW+k26USEn4EbnFuqnlp7HrF8ZeQA9KDzY9ioQmqaucG9DUXq0LX744dQsft
	 LENKraCmnBIPReR47mN3tTiCX6UESGJGT7LWwetio6kpOaQTviKra6BDwnot8CXhrbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tt80OJNg;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BADA60A2625
	for <oe-linux-nfc@lists.linux.dev>; Fri, 30 Oct 2026 11:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BADA60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tt80OJNg
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so382589241.0
        for <oe-linux-nfc@lists.linux.dev>; Fri, 30 Oct 2026 04:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793358673; x=1793963473; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmOrBm1qC65xwrgbyzMtaj27QcC/iPJg0n2kc5knBkY=;
        b=Tt80OJNgopZJgOsaJE97xedHYrpaHmLoHOZ+zPwgsPAMCcPJ3JIN5Y1t8Vp6ykfxzl
         x1NrGPXGiQtE0KfevBEtheS+2UgsBJNGy1b4kJKWo6229DscALhpi5lW0/0hAHPzXdAH
         rACsQKz2mRvGTyCBJHOL+wNkeYB+Bk60oSfZmNKO3CYznR73qItDluQIuRV5UY0nZIsY
         aCxOYC4B/QllABwCmfJxwGC1VQtjfUJfbe/0dn/HX1MYW/DvZAyIeVdefQ4iLZhCIIbV
         rG4TkU04GFwRGBc9S/Q/qF+AiaY9zvUU07jyiOqp5r0wQk67Jnt9/bNEOjfPRjPr1ovo
         vQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358673; x=1793963473;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmOrBm1qC65xwrgbyzMtaj27QcC/iPJg0n2kc5knBkY=;
        b=vmc7MytvuNylqfNYf6PknwiUdWr5jTVva5hCT+tAudjhPbLIHx6yGLtYfa3OANOZoW
         reCJ6uNxoArmM2AUGrSnpanfG4eLU7koOEZfrLJ8tI9aR3k3d2ptNPyvq5GXF/iFEZTf
         95G6H+D9pqPe7lOq8Zswe5Nfi5VeyT3ukO2X9XicQdeM/fpdF/RfHkO9UImX745yF+kH
         xhCWo2tLoGO6+kHts5rwuLqMPkzCpaD4FogsR1D+sSMx6goiGI3KoRREy7Kr1O6znO/Q
         WvVdW8umNx4jrEllyV+bmibTRH0KZ9E+UlkEO56GUIXxC5TQtZ7UcyH+0HDjKU56jvRB
         UK4g==
X-Forwarded-Encrypted: i=1; AKwUvBwTpiuppLXuOhPcx5KmHAz94gLRjeErr/UXkNrKZwSyYb1jUZBAxCUA4VPJT2Jg2aP92jSrhNa3OSVsM44=@lists.linux.dev
X-Gm-Message-State: AFq9FYLi+9O93p7f/GJ69ryKJUP8rsnIF0He81Qb2loxiMCLrg78qDBQ
	CMSiKfO5FOsKmgAyhF+AAme0E3hC0OvseIm7J/WHGU6wek1Q8r0pphmipz8dmmxZ
X-Gm-Gg: AYBFou0J3BXTn9mKfEJKwpKZ/rx6BRGze4QpKr9oUFDD7uFC6qw4i/XbpP8v080+qaX
	m6wlO3GLce+CnWFMfah9MKwkK7GXw6vMExRTZTD0HYSnPjPhCJ2djZJMBbJZSDHr70CL05E06UG
	F56MatqbfzVokZtB3S3hKyQQBzGVUcih9dRTJS2Pz3IcBM5Ql0Gg9WnDuU2Ua5sNw8h8r6VD+aM
	76Jk41ONFWRwczjqNI8kCeifHOfHap3sNkcTpF7T5shpQT2iWKIn4qbNHRZPzze1mWUW1rvIoVB
	bZBwV02RTvjRkwVzDCdhO9A8QQ+lLxiYIh/6M46Hh+/6Kvg1nMA5f/0ZYVHS1lZ85185ioJWZ3J
	sey7Xm619RUdfDVO3w+1GQLfiVg7WKkToS4VeO8C5BfKMT42fCqzvyEIt+LSizKLaZSRMUbOfDo
	Q6gmEgvWOFE/0dY6eVPDcxIRHw7jrnWj8PICiwajptsy5scpbCkADBaxSzOOc3l0wYnP/fVppXy
	rJ5GulCohdA2ImXLqOFTM4eExmRA2f+TLB2Q+PZoujCkuO+oWFLdTasgg1+C3vfN+LEaqa37cVO
	pEcCygjtwZ7KGf/1h9bBCvestAD8Mzw3bkUasI8frZzPqh5YuoBsZqcY1ad5esM+SbNQ64T3kS5
	BXvqelUhRlm3pLHg3VtQ=
X-Received: by 2002:a05:6102:3588:b0:7cc:2c52:47aa with SMTP id ada2fe7eead31-7d071f2ec61mr1143935137.0.1793358672919;
        Fri, 30 Oct 2026 04:11:12 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([191.34.116.20])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1b4sm1841044137.4.2026.10.30.04.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:11:12 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH net 3/3] nfc: llcp: free the response skb when the data exchange fails
Date: Fri, 30 Oct 2026 08:10:42 -0300
Message-ID: <179335864272.64596.2156668877648051796@gmail.com>
In-Reply-To: <179335864271.64596.805818095553030218@gmail.com>
References: <179335864271.64596.805818095553030218@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

nfc_llcp_recv() is the data exchange callback for LLCP PDUs sent in
initiator mode, and it returns without freeing the skb when err is set.
Like for raw sockets, the skb can carry the response even when err is
set: the HCI core passes it on with the error derived from the
controller's result code, and NCI does the same for a frame interface
data packet with a non-zero status byte.  So each failed exchange leaks
an skb.

This was found by LLM-assisted code review.

Free the skb on the error path; it is NULL when the error does not come
with a response, and kfree_skb() handles that.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 net/nfc/llcp_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf81700..f0632a0b9 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1638,6 +1638,8 @@ void nfc_llcp_recv(void *data, struct sk_buff *skb, int err)
 
 	if (err < 0) {
 		pr_err("LLCP PDU receive err %d\n", err);
+		/* skb may carry the response even when the exchange failed */
+		kfree_skb(skb);
 		return;
 	}
 
-- 
2.43.0

