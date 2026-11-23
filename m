Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401358;
	b=AT/GL7Ng5f146GLxtjyUA0oyM/SMv/vjqWEzWPMbzpt3YuotjbFvmDTFimclbyBHgrsX
	 KYzxR5aHxTt8gxwlMYmUU0kCU3iWp5FBF/by5ZMrUyBxoecqEB3mLdaxFeae8ttQw18s+
	 iCoL8VdY9qSAIu9hoU70dfuMVHLud0dIPCEUtk+5XOeok8W6hqhjaW3ztpE1ABk5KnbrS
	 30yfGgLX96SvohXdXSoqFcyWgcq4Y0/UvSPsaRXC08P0ANm7TUAD2t9dUaT5iUS0MiQpZ
	 JE4eC8LxueFJjnxdT79fl31acV7KjvEtjsnqXUxKTt1kFNBqX0r3FiumltQ7+2IXYOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=st5pGIMSSsdG331Dh3ZbAxiLCbZswNCMENZiPvwdzYI=;
	b=HsZzZfx1CQJjsiiV1H4lVutMvsWdQmnHCBbZh1jtevWd++f6mUFGUN/XxmQ0JynSs7I+
	 DRbDvQxrxSBKTAjrndqghbe/d056Uu3DEDRvAcPlKdsw2GSyCy4835rioz1n64IGjefPc
	 FR3v8+x9WOjVN98GlfU8TBNPIXjkW4hWpeiAjbX+0KtBnmVJsJRsJMpn5cRwTZYsGvbgq
	 IfjsZd2/edq34PQ5YpbYQXAelmf/05waqvlZhALUwgGmYHFP0Uo2ky6i1n1NAS62Fsql5
	 IXYH6vL+janjusT/u7N5s63vzCx6AAAATsMrl4He7mO8vp2k4AgqwMn4YhdUqNJ5vfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=jDYEkvck;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984A8606A327
	for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Nov 2026 02:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984A8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=jDYEkvck
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f04bea9a93so22802825ad.3
        for <oe-linux-nfc@lists.linux.dev>; Sun, 22 Nov 2026 18:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795401357; x=1796006157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=st5pGIMSSsdG331Dh3ZbAxiLCbZswNCMENZiPvwdzYI=;
        b=jDYEkvckuGVdemJFAqA01zXMa2zHIcmGpDfuVLo9OJUttYLcFG0ArIvIvR1vRb2Yg9
         leO9cndc2MITygiDGnKx9dIlbWg99bxS6aMH3J4em27HEV2h0z1O7SAm/XFC0G8tyfdR
         l4ywsLTA3cbABHdfWKV+fPb7ygOgoJysNZP8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401357; x=1796006157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=st5pGIMSSsdG331Dh3ZbAxiLCbZswNCMENZiPvwdzYI=;
        b=XBKqi1w1Vf2NB9TcZV0iXaZng1U9LdYZZeDoZDYmpDrztVoMf874LRIcZr+Lgc+sYS
         OWGrAI3e/GRMVyDHj7Altpqyo7s1Ss7HScq42IYcB6KNA4VZ7aZl8B7z496XWpuscBda
         /eC/DMy79QuI/FkyVWSVi3ahtn7cokEW6S966cvXjJ7br0okdSHIg0Mz/DO63rMjysIz
         //tlKvaDPq1ly8EfyS/13uapR/TzbutomHWiGSwxMTnIswy7ZPxkyMoVwbmgYfY7QIu3
         Tqnr+Rg2QnEpcKlY6lTLPe+TeBhU2/zTl9eB82g8yMrDNzQmdDPZM8dovioJ6DvGTfjY
         3TAg==
X-Gm-Message-State: APuU4Z8HZpCkSm/t8vFi246LE8gBtZ+0ucB5xG7Dw4Un80lMUZCdWS+B
	1zBgJMuAPMYtEUJgCEu5a884w6HA/J6fHrcdp+YeMv7JCn/hxxakjmNuVaq0eGXRXpo=
X-Gm-Gg: AZFdTZf6xthxRloBPK2W69jNP6hZqX+RmmSbhYG24bfe8WVUJ4PsppLWWw7yifwNX/R
	JpexIZWUIzV/wlJmx4NckWlFDS0N9V+JMpyGBXZqazGT0lOqDcGWt93PqtCjh14zYUsPgNB9I1C
	9mJLDHJiDzNZ7qxxnNgA8ySSRNnCm9l+Sm7CxqyjnpsB41/f542CdGHpFxgT92UGN71g33maxCz
	qZjIymMFi7ycAyXw/lvpZhwFRwCCZphWOnxVQLgDKbS5//1gQP11kqPcAkdYSBoDvWnDJTt0/Jo
	ajyk0Re1XgW0g4o0aVMcrses+4dI0MIW9eqtogQu6zYFHKDf37IGqzxlUAyEcsWy7ZvrAoeWZd1
	bYQjdK+wr0jSGT7Qecxiz8nvLcKqJF3LR9ZiEixWSggAZGVpXIW84PvJh71uC08LkxFuZl395zN
	YalD2pxJLMtl477+tlMZHij+yeThcLVit8cuXCCtVcvBiiJYS8/GSwDHrkBt62U2v+GOrjxf8X/
	goKS2W1HpSyBBb0Z+pcrNGIx0z3Ww4DzjOla5PU+pOH0x41Y46Gx2AEQqR2uGj+3nQPi79X3leY
	KBJGNmJbkvrrpxHI9F6hl+GGYZbikvg2KuCLGYxW7KFzAYcHdCJGJHVc7HRrRLKtgowvTUfWtQ0
	vk63x4mZomGmoz+X7Pl9bgUI+Qg40XDPYaW1JA0OShEjI2dYWQvYsBrOPtKVImFzg
X-Received: by 2002:a17:903:32cc:b0:2e9:4175:3079 with SMTP id d9443c01a7336-2f03f1cf4b6mr119824125ad.21.1795401357008;
        Sun, 22 Nov 2026 18:35:57 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm43609925ad.59.2026.11.22.18.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:35:56 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net 1/3] net/nfc: llcp: fix the 16-bit truncation that overruns the SNL response skb
Date: Mon, 23 Nov 2026 08:05:48 +0530
Message-Id: <20261123023548.3351531-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123023548.3351531-1-piyus@iiitd.ac.in>
References: <20261123023548.3351531-1-piyus@iiitd.ac.in>
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

nfc_llcp_allocate_snl() accumulates the allocation size in a u16 while the
length it is given is a size_t:

	u16 size = 0;
	...
	size += tlv_length;

	skb = alloc_skb(size, GFP_KERNEL);

nfc_llcp_recv_snl() builds one SDRES TLV for every SDREQ TLV of a received
SNL PDU and passes the total as tlv_length.  Each inbound SDREQ costs three
bytes - type, length, tid - and each SDRES it produces is four, so the
total
is four thirds of the PDU and about 48 KiB of SDREQs drives it past 65535.
The sum then wraps, alloc_skb() reserves a fraction of what is needed, and
nfc_llcp_send_snl_sdres() puts every entry of the list into it anyway:

	hlist_for_each_entry_safe(sdp, n, tlv_list, node) {
		skb_put_data(skb, sdp->tlv, sdp->tlv_len);

skb_put() runs out of tailroom and trips skb_over_panic().  With 16400
SDREQs the accumulated length is 65600, which truncates to 64:

  skbuff: skb_over_panic: text:... len:382 put:4 head:... data:... tail:0
  kernel BUG at net/core/skbuff.c:215!
  RIP: 0010:skb_over_panic+0xcd/0xd0
   skb_put
   skb_put_data
   nfc_llcp_send_snl_sdres
   nfc_llcp_recv_snl
   nfc_llcp_rx_skb
   nfc_llcp_rx_work
   process_scheduled_works

Hold the size in a size_t so the value that reaches alloc_skb() is the one
the caller computed.  A request that large may now fail the allocation
instead, which the existing IS_ERR() path in both callers already handles.

How this was found: by AI-driven fuzzing built on top of syzkaller.  Its
analysis was then checked by hand against the code, the fault was
reproduced
on net.git main under KASAN, and the patched kernel is clean on the same
reproducer with ordinary NFC LLCP traffic unaffected.

Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/nfc/llcp_commands.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index 80a00938c..0a3d66e6c 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -542,7 +542,7 @@ static struct sk_buff *nfc_llcp_allocate_snl(struct nfc_llcp_local *local,
 {
 	struct sk_buff *skb;
 	struct nfc_dev *dev;
-	u16 size = 0;
+	size_t size = 0;
 
 	if (local == NULL)
 		return ERR_PTR(-ENODEV);
-- 
2.34.1

