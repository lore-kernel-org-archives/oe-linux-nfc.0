Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401295;
	b=oKHglelVXxj2mwYLTr5qAUOpMyMqQ2yLiFEOm56QiFF19DvcL5HjX0rs+OJrHLDI5UDF
	 qiN/bB048DhGxVg72i4Z+c/qL9C2eE1eOtBYq6oepD+GOE/O2stRzSmpBjgxNZwHiRt5t
	 hAZxGOJvkHh0av+3U8l144kWUl5rL4DdB1ZqEC4JorVS+MFxaim96d9JxJQnp49iQy5Ri
	 iCaE3zRJn6i6bag0yxldrj6xdvFK9oe4TxWUy+qrCvJ2FlGEa05nLWY9/CHfE7Uuh3azw
	 XmtnL0xIdq3cjFuOwtBxkC7NOTc1l6XqrePI8p10VJqzL12IWeqO36jxj2SGQA/E73A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MKus0ZIpKMYnifwBN/xjucnEiMSY0/cmG61Pf4wmF+A=;
	b=U/Z7va/doAKFuAxAtseluk9mtE4IsdLehLQIXPLdUiAT5oAdYNctdqOaJcxSCdTXn6xf
	 6eKeBx3W1VvqbiFkAb7vAKTIshG0s5oK5P9GsLLOstrT7My6DZd93GNhKgChaEl4ncZ37
	 Do3yE5BrYC949TGj2iH7/upiAghwF7oShkW9Asm/UPdrfD2zkGTCRGVaQXsnt97VyZkhx
	 4wh8x0AZjc5X4hp78wFf3JW/sHXQ60ulsufYFTY978FIAxyrDKvzrsj4cQuLsSi7h3Mrb
	 FoOQR+nXvPKFC5MLIG8N7arUiaI5x60JMFkefLq47LOFSI51MbsGdqkWUTMOiJkxlAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=SwgJjOQQ;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466F1606A32A
	for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Nov 2026 02:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 466F1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=SwgJjOQQ
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f066274caeso7198645ad.2
        for <oe-linux-nfc@lists.linux.dev>; Sun, 22 Nov 2026 18:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795401295; x=1796006095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKus0ZIpKMYnifwBN/xjucnEiMSY0/cmG61Pf4wmF+A=;
        b=SwgJjOQQOmm1DypiIknHlwzieBCs8m+n4KusyUPQoUH3dXqQHonG0HcYw6axY5JGTw
         C+XdoZy2V01pUazu8PRqAc4nSGuV4HulRjBkiPjp951cH8F31fhp+DdNX5bJcc5NFVJy
         QcYMaYSPLlkwllkgpmmivFxNOnt2SkIiZBi1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401295; x=1796006095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKus0ZIpKMYnifwBN/xjucnEiMSY0/cmG61Pf4wmF+A=;
        b=lsC0kGuUPzjYKm5kz/hNJ/5db7B3GSYSmP8au1/NX4TlL3meP5zeY5Irm6nZIvrg2/
         rsfTFMVkmY9E4urPFndP5H3HIVCSEbxqy1p2/24R0U3iryb6h/0i/HvyKHeyqrwJ//al
         zVvFnW9Tv56W1LHgeTzj//aoam9/3TJgZFt1wE6u5GLIrLAqvfZgJkuFYnrNYlZAAKQf
         CmUNGN/HtZrC5Xbl6S6spbiLQlRWphPXGBaBqW1wPzGikoZfCmVYQ7QTMw3NuM9tguz9
         ylBpLvecxLyt9bweAhW/m5xpAyu/Ajg0x4z6ylhqUk1FN6mkknF4uRVMujHxAhKIXvtj
         6TRg==
X-Gm-Message-State: APuU4Z+RQEOBgRwL9ww7CWY8SsjVZOi/wS57mawSKNSnHpSGnstc+Lxo
	nD6/Cii8kXsOJUSsTgnjxMX6MGIbxlzlRWqi3fq2A/1lIuL/4EpEraW23Oa8YY0zfE4=
X-Gm-Gg: AZFdTZdrVgvDejh6bb0KBxiAil9vq1dJfXsrpavhOSBF0wmqnZw9kQoi2LEjezWlxd8
	8QA38oz0wzZebKaTJ6d1aR7M3MrQ/1vUhtBQaOKtuXDixEInZFcbvmPxI0dHx/A4CydD8dJr5tm
	nFnkvpaADurd7qP/9QreBL8rjRyU3iTi768kMQm9mj2jbPUActbRkSWhFFazG1hQeYThd2RIAkT
	NYOOWhvgkvD+3BOgfL89PAVnlFwn2AC0rIyjOUOgW2g8n0QIHPVA/etQovmy5vdTyWX3OUDAjXv
	ZqA6ezzTd5k9SMIEzRuxNMVWAtJY9wmYNTkWnaH+sW24VO6z9dixj/rjzpDMwzCnVueRdAnGgH6
	khWP7ZdKX5KTsy0d7pixLS/+4lNufamu/LV02It8hfMTIp/5qjW5/XoQZxxstUGr6ZsAh+nnp6e
	/aedkNkCMQX75FObniC7tMpSi/u+knd2Ok2PxwqMj2CAf3W0oIfB3un6TaI3IfV6cGoHkkB+eku
	Ztj/Twktw6+jgck5b+TTs2oro1hmfpPdBrLj+u/0UedR/CL4idw6Dsk9o+JLGM8hmU3jKLZ32Cq
	ISnT2b5ch6heI3O115FaXF+pZws3UhDkgieZ2QQ2cGoMpPtQ+4ssTMyLIvT9uRus2yvCmDoSEfk
	NGYjH/CWnlJtw5f6hs147xPmcnSf/yAAg5pNPL+YCf72fTc6EOuYWoCo87iECWwsU
X-Received: by 2002:a17:902:e803:b0:2ef:ea94:e04c with SMTP id d9443c01a7336-2f03ef3d413mr102290175ad.3.1795401294648;
        Sun, 22 Nov 2026 18:34:54 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84027sm44590425ad.7.2026.11.22.18.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:34:54 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net 3/3] net/nfc: nci: do not hand a NULL skb to the nfc core
Date: Mon, 23 Nov 2026 08:04:46 +0530
Message-Id: <20261123023446.3350387-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123023446.3350387-1-piyus@iiitd.ac.in>
References: <20261123023446.3350387-1-piyus@iiitd.ac.in>
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

nci_add_rx_data_frag() frees the skb and clears the local pointer when it
cannot make room for the data accumulated so far, then falls through to the
exit path shared with the success case:

		if (skb_cow_head(skb, reassembly_len)) {
			pr_err("error adding room for accumulated rx data\n");

			kfree_skb(skb);
			skb = NULL;
			...
			err = -ENOMEM;
			goto exit;
		}
	...
exit:
	if (ndev->nfc_dev->rf_mode == NFC_RF_TARGET) {
		/* Data received in Target mode, forward to nfc core */
		err = nfc_tm_data_received(ndev->nfc_dev, skb);

In target mode that NULL reaches nfc_llcp_data_received(), whose own NULL
test is on the LLCP local and not on the skb, and __nfc_llcp_recv() then
dereferences it in pskb_may_pull():

  BUG: KASAN: null-ptr-deref in nfc_llcp_data_received
  Read of size 4 at addr 0000000000000070 by task kworker/u8:0/13
   skb_headlen
   pskb_may_pull_reason
   pskb_may_pull
   __nfc_llcp_recv
   nfc_llcp_data_received
   nfc_tm_data_received

Test the skb before forwarding it.  The other branch,
nci_data_exchange_complete(), already accepts a NULL skb and reports the
error to the pending data exchange, so only the target-mode call needs it -
and returning early instead would leave that exchange uncompleted.

A peer reaches the failing branch by growing the reassembly with PBF_CONT
fragments until the GFP_ATOMIC head expansion for the accumulated length
cannot be satisfied.

How this was found: by AI-driven fuzzing built on top of syzkaller.  Its
analysis was then checked by hand against the code, the fault was
reproduced
on net.git main under KASAN, and the patched kernel is clean on the same
reproducer with ordinary NFC LLCP traffic unaffected.

Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/nfc/nci/data.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 4253edea5..d7597fbd2 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -258,10 +258,17 @@ static void nci_add_rx_data_frag(struct nci_dev *ndev,
 
 exit:
 	if (ndev->nfc_dev->rf_mode == NFC_RF_TARGET) {
-		/* Data received in Target mode, forward to nfc core */
-		err = nfc_tm_data_received(ndev->nfc_dev, skb);
-		if (err)
-			pr_err("unable to handle received data\n");
+		/*
+		 * Data received in Target mode, forward to nfc core.  skb is
+		 * NULL when the reassembly above could not make room for the
+		 * accumulated data; there is nothing left to forward and the
+		 * core would dereference it.
+		 */
+		if (skb) {
+			err = nfc_tm_data_received(ndev->nfc_dev, skb);
+			if (err)
+				pr_err("unable to handle received data\n");
+		}
 	} else {
 		nci_data_exchange_complete(ndev, skb, conn_id, err);
 	}
-- 
2.34.1

