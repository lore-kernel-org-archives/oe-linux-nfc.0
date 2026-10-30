Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358667;
	b=Zo4GstGugDkGPEhykvQyMumL6U/Jt6tLTsXWT5lWPWsdMa/lLYYSQLdJwliS1401g0+l
	 4Hf5bHhkGUYx63Wo1rgdCHF3kEFIsKWqA0nlQ0JSQx1QKTZq20SK8BId/lIEKUlSKXD0f
	 KXr0SPLpOJYjos0AOs58TMLQ6QVNuHXRH01sKvEQBYdLB7bbfcYZL+BE/n3y3fMxfqDM7
	 TMBU62r6Suqh8zHfvDtsCls/rMx+lRuMFH5ZeGYjpJ3Kjr7bfvF/mr+ZBRZx3aK7/L+b2
	 hSJVPqTtezBEETZIyvFcKyTsR/Y077xu2BMfTT40A2LdiFs2WC5RdfNzKMEESGA3UDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=+WghCCVj/g7O1H6Bv64tZFo0L+kNuS7zgljqJhCtvfE=;
	b=Pi2cQoRqQiYcXua1OFwZJ/ZaaL7h9OgDo0shlLEe+H3SbBrW/r3bvnlaYM2zWZ8uaCg4
	 xH5rUGYQ/KG2cxwpa6lc+Gb5TVc/HGFGoQUV2lJHhuGYR+Tii+kTXrczJXcIpuClWNF3U
	 41uhiMOakACJtV1bQ+DmDoZltYZnZQumXuh/GoQJnOrYGYK+ZabDxpsN8eWGLef73CwZB
	 PaNLFunlUWN08utUymxJWqkhTrPZ4ZrGxW+I7JFQaAy3WR/HxD4qrA7rAGdpkqxerqFrQ
	 tx8DfqTEFt6D/4XZYnhcyCupS/LhnZX/dyrEhcoI6hFPF7VIXVLBuG9Kl7l+hAKBWMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VtVDAVkB;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A815760A260B
	for <oe-linux-nfc@lists.linux.dev>; Fri, 30 Oct 2026 11:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A815760A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VtVDAVkB
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9912c61b8b8so303934241.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 30 Oct 2026 04:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793358665; x=1793963465; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+WghCCVj/g7O1H6Bv64tZFo0L+kNuS7zgljqJhCtvfE=;
        b=VtVDAVkBHvTs0ijFftWCeXXeMgSl3RQ731prGld7EnYwBJGOQGZfOw38m0ohgqDiu5
         b6KAEAYeCcW8yXAEsiN6S/VxhCltSc8MCfrhC75hYKwbRF2uWBhXZRjmGiXAzmFS2uHt
         /cc9CzRoQCltH8Kru9lcQrhMO4QEf67IXPSXLIUpnDj4UI4Oe37QI5dKTgliCwJ/UAhf
         x5qtP3RvUeCBSvoNjbOu8iFCJiowuP40Ox5kqSniRWK9qzKbStR7hulkVBD7aD3QOei8
         gW+/mBclPhhIwZmRqAIPsrYBwd7w5VBUaDRayOPfrlmRFLNVj4zdx6iTIIL9JQIIz0Tn
         1nTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358665; x=1793963465;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WghCCVj/g7O1H6Bv64tZFo0L+kNuS7zgljqJhCtvfE=;
        b=nd2We6MAQpOyyyitFBPKkcHhhjYhw0lmiF+Tyvu6WlTZe3sD52lMOeCtrPzigFmCkz
         S1jp7G4SX6xmv3glY5esJnZFmsmwl0i7OBR+y04gg+u5WmFfpf0Dhuwtkd3cEAtXyor9
         OeCJyv2AMQKPNO94d0c9AnNiFOXGBMo0N/om4oOsDNVT0AjjT0E5bKAIiqSpfRXcdM68
         9sWU25aiN5Wixv7OeyEak7BnSg66PalmbWYP0ShlHKOAk6PJcPF/Dbjdf7uQAC1rd6mr
         r8fehDA7+86ANHX4ESzPbBQagU+PWImlAgbT9Vwj6Z++HQCWK//32zqPtlLe/W24kzJL
         ew9A==
X-Forwarded-Encrypted: i=1; AKwUvBzbf7YrFEHskLV6ike+i/BF5aj9740qMClD1eFoRe9aJ6M8j8TGjfB8K8lWTm1r45+oBBKGlO1nNicSUbc=@lists.linux.dev
X-Gm-Message-State: AFq9FYLDZnBYBMHQwN8mEIohgtgdZYHFK6+3y3/AZe/atwaR9eXGAlqJ
	3TAhSTC3WyTMcy6c+CKGHS98pKrG48SihK7jnEVAed9JEvEI1gjUjLr8
X-Gm-Gg: AYBFou3IlRSa9PRcnzMwmVPHKo0zrusTe7d0Dype8w7A95qLp8DJt4LWGSHxaOccnzs
	cLIxnCUlx7Ooi8UUK56vvDTGpSqpTEHPinunIT/usgHLAoMyC8Q6DhK6ic1zmti8siYcatESyM/
	9qfTuI93rnVWwU6kd4wDdwG4sbz7XJXLF5yeSS8YJEyNgE3nWN87vIPjWWHakLf8mLFfUmuqvxP
	FRy1qecKkmE35eXk3To9QlkMql/8Vu5e1QVjkmZnCuBUoJeRBjlcMrcvq2XUMn6bAqy6tzu4brf
	uXLEPwigiAAK08RigkiOI/CJ3pAEO6TkA8mcejLmqkhae1MTEq131XzQAV3SW17oOIyySoJEONC
	emrcOsYXP1bANHhlZvu0VKtLNG92muGLU7HqHIyh1X+wr6Z8Leqg60R0bRMZodzkJQGM8irZ1Z1
	6s5VyjghSwLnQQP1LGzTHR6gAmkKBZUKDHHA2WziWeqR8iJ++0F8il775ovVyu6CwAU7CJWDUnO
	LFfp6Wij+1k9ncsmc/8CFl7JokbmaFkTJt/wtc75VtNID0j4qaIvzXDZousF6ZQ7kkC1fCIo6f0
	u2rrfXS4p7A9TfMm88eEX29/zL3BFMinseopB+qIQBCKLuNstll0sjPQRlAha0yb+sQocCCh146
	GA1Sa4ASlEgs/OUoCVRuroaSNJcHyyipqSkEQBeez
X-Received: by 2002:a05:6102:2b85:b0:79e:373e:8216 with SMTP id ada2fe7eead31-7d0723d2480mr1002923137.0.1793358665428;
        Fri, 30 Oct 2026 04:11:05 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([191.34.116.20])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1b4sm1841044137.4.2026.10.30.04.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:11:05 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 2/3] nfc: rawsock: free the response skb when the data
 exchange fails
Date: Fri, 30 Oct 2026 08:10:42 -0300
Message-ID: <179335864272.64596.4931238314416806197@gmail.com>
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

rawsock_data_exchange_complete() only frees the skb it is given when
the exchange succeeded.  But the skb can carry the response even when
err is set: the HCI core passes it on with the error derived from the
controller's result code (__nfc_hci_cmd_completion() gives it to the
callback and does not free it, and hci_transceive_cb() and the pn544,
st21nfca and microread data exchange callbacks forward it as is), and
NCI does the same for a frame interface data packet with a non-zero
status byte.  So each failed exchange on a raw socket leaks an skb, and
a controller or tag that keeps failing exchanges leaks memory without
bound.

This was found by LLM-assisted code review.

Free the skb on the error path too; it is NULL when the error does not
come with a response (digital, timeouts, device close), and
kfree_skb() handles that.

Fixes: 23b7869c0fd0 ("NFC: add the NFC socket raw protocol")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 net/nfc/rawsock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/nfc/rawsock.c b/net/nfc/rawsock.c
index f7d7a599f..74ef3906c 100644
--- a/net/nfc/rawsock.c
+++ b/net/nfc/rawsock.c
@@ -156,8 +156,9 @@ static void rawsock_data_exchange_complete(void *context, struct sk_buff *skb,
 
 	pr_debug("sk=%p err=%d\n", sk, err);
 
+	/* skb may carry the response even when the exchange failed */
 	if (err)
-		goto error;
+		goto error_skb;
 
 	err = rawsock_add_header(skb);
 	if (err)
@@ -180,7 +181,6 @@ static void rawsock_data_exchange_complete(void *context, struct sk_buff *skb,
 error_skb:
 	kfree_skb(skb);
 
-error:
 	rawsock_report_error(sk, err);
 	sock_put(sk);
 }
-- 
2.43.0

