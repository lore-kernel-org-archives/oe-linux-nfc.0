Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786854;
	b=MxzMYuYhnWeil11mzTySz2DgRv+wcBWZ99fkFTmINEDJ/RgMckeNzOe303q8zwk21ocz
	 +ZD3sVUX9dn4s6nkfDRXSJnWqrlIfcLc3ZUnG0LuYGihufHlydRv15S/7KUq4SufIxuwg
	 CDYLi0kwtLPANek7eK/b05un5cG4xp795JvBAXN0qHNF9+VJ7bD9LocvO8UvVNbcfki/d
	 u1qmeO5Nabk/rlVikPSbvsccoK57R8oBHzTvNnvi76XCdo9o5fUxVrsxZOL1qZ9JqL9JG
	 ivAKrlI+9AP/sRxhS6wJqbYlX+MuuCr7add/RgBL9iHKVIfX9/CyP0iNyZ+H3WMOBdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pdEAarPZNKEUfPhFhzlR8v9qpw9OvFlO1VgxWcD8/G0=;
	b=l1x8m+d9BiplYiKsLtP8cKmc1KL1nrd0aW/LBTtf/OXnVfSreANtMP/bn2YuqL0ZVyKM
	 h2v7qBRDiQ8cj7NZogWjDGoTobaJ3rOKKtOSOJddlLkZCUKe+bEHwKA6nx9NO6Jc0uZ8g
	 azn87r6wdecjA0oNrO7ytxyXFHaPKxl3l6Bxyxrs5+ugYUOGM5bP0/veM7pM4ZVnelaiN
	 JENAcB/UFBvtla7Fn+POSvqpdk1ARYg/UriYODkrppajxOjRaj471jDGTYjJqjrhEEk8l
	 GTER/t7c3zEuYElhd6XkAsLn5klBJ7/qEJpioiDFz0So1zURjsakSnncWpRNL8NW5NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JETb24PD;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A09A606A32A
	for <oe-linux-nfc@lists.linux.dev>; Fri, 27 Nov 2026 13:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A09A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JETb24PD
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so2898549b3a.1
        for <oe-linux-nfc@lists.linux.dev>; Fri, 27 Nov 2026 05:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786854; x=1796391654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdEAarPZNKEUfPhFhzlR8v9qpw9OvFlO1VgxWcD8/G0=;
        b=JETb24PDdPNrusYCPY4cavqkDrWrmWVLDsyprkjhYv1YarKEmpXDeNiXRFtrW25mM8
         V5ti279VI8OWy61fDX3KeKgXa7UWutEiFrfQhNwVFtD6d7pB7oN2aAR3iPtQ5TUgCYne
         lbZWXn+f9pgYnzL4FXhVpdX1Hz0VCIQtIesNgTtoeuve4pfur/C4bOAANZME13sT7tJL
         jxBl6WWGDdXd8qoz1gQJppWoPVccxjj2gLFKemyBJbyN6TbZiGCD3B05TSWyxh+2DpCD
         0FlAuMHWsbUQc+bM2lVvwsgucvxO8OAyutEMjZsNrT/xyEPDbtQ3XIlzn241DSTGqF4I
         Ok1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786854; x=1796391654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdEAarPZNKEUfPhFhzlR8v9qpw9OvFlO1VgxWcD8/G0=;
        b=l0Dfs6r3/5404d4XVDqLdobsH3m79JNW6t8jqjC0Aw28UXAf3Z16GF6RDg2oMs7ztD
         BlKmLIVshtw4aPj7WVmJQRIHdyUdnpWn1ymWSF+je/+ysxtR4Fkh3g75fBnus6rCzWhU
         CymXtxmNbzf1i7suWVI5WPYVgScVRFXknzcymBUtoapE3aFXG4vGzbgSgx/8h37ck8Vx
         bzRBbBL5C1ZhJNY7VO5KNX/Xst/mnSZXsAm1v74as9mvXhUkyg945gWK+OMJUpuIQ0g9
         SQH/snck88KrcK3rw+ZmfwL1y2AwsrZAE7puDfbaGonzRUy8cMkCGW+xC8nOg6PxWqF2
         1Dnw==
X-Gm-Message-State: APuU4Z+l0yLHb9OnPyEJCMpCryNSx3KhC2UPHnqzKz1Dqy0kMYK/Sc37
	ISTFelhwfs88W0znlxdA57mr6eP8y2/dm1z11VKCzIxvdA0+v84vmHPAOxeIp2qGSmi/aoYf
X-Gm-Gg: AZFdTZdVyapHriADpQvDfAYcXQFZpawTgMe+zTRP9O8A4J0fByZ9RvhnR2GsnY+zbiu
	g/TL+oLBp+Q+3MIMffUp4U3giNt/kdYvdYNOfTLB2oaI+6jETW/dsLeFvkDHwCGACfLecZwBxDG
	oKTvHI8/PorFB/fMVXnQ1XwLwaefOmX5VaN61khNhhsqasTW/SYgnyMcwQ019XgYyWEqoKOtMZm
	zcYZXfzjQat6mvlXJKtGA+n1divAjja3kw3i/AM8LqYMmHIEvSW/IDZ3eZRy9Yj8cG5XA934AzA
	h8hN1bKyMkHL8oo4cPnleLwEXsm933k8PWCQl1nGZxkc8zwYk+cs2YOGMtPRwOVO2Zv4p3vbIFx
	MW8NJ+X0f8vy9joOVsVlX+BUTnCXBOy5IX5Gsw2EZrDZ7APJT8EAJYGVNV+TvlFARMZU34story
	Er0vZpHjCSW4sqx5AtHZvTNSnaxI7m9vy4sGPDlDkqWXF6wX0bFFsz/2cbe+B1iEfBodvVVk21Z
	WmimZYfjknh3CsmpeyKGJJW9gy+I+zFTJ06z6dvDIm402v0FOIWZusLldQgVDuJi2NmGqClxyFl
	lgh1fBYXWpV8p+0+RL8Z56sJa+Ez79/bWQmjae2O1uErqBRbsC8j0qetiOMuzlpkt5iJf8dzZpa
	2xJsu0MfNm0XxXCpAfFbBJeVOfKiLbSv+8iLCTasbD3ViE0jIi0rCOIB0Dd7OIUBjaZY+s76fje
	MTzNZuy64TlL8zv3ItirCS04xvbaF5CaeZ8mf4edk=
X-Received: by 2002:a05:6a00:928c:b0:8a0:20e0:b131 with SMTP id d2e1a72fcca58-8c87bac50eamr22456811b3a.19.1795786853961;
        Fri, 27 Nov 2026 05:40:53 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285b60csm12705838b3a.9.2026.11.27.05.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:40:53 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 5/5] nfc: preserve NCI data status error codes
Date: Fri, 27 Nov 2026 21:40:29 +0800
Message-ID: <20261127134029.1813-6-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261127134029.1813-1-luob87709@gmail.com>
References: <20261127134029.1813-1-luob87709@gmail.com>
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

nci_to_errno() returns negative errno values for nonzero data-status
bytes. Passing that value to nci_add_rx_data_frag() through a __u8
parameter truncates the signed errno into an unrelated positive value
before the completion callback receives it.

For userspace AF_NFC raw sockets, this corrupts the reported error: for
example, an NCI status error mapped to -EBUSY (-16) is truncated to
240 and negated to SO_ERROR=-240 instead of reporting EBUSY (16).

Keep the error parameter as int so the original errno reaches the
completion path and userspace unchanged.

Found by static call-chain audit and reproduced under QEMU with
virtual_ncidev and KASAN/kmemleak.

Fixes: 98ff416f97c5 ("NFC: nci: Add status byte management in case of error.")
Cc: stable@vger.kernel.org
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
 net/nfc/nci/data.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 3bbebb9..4a2326a 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -213,13 +213,11 @@ EXPORT_SYMBOL(nci_send_data);
 
 static void nci_add_rx_data_frag(struct nci_dev *ndev,
 				 struct sk_buff *skb,
-				 __u8 pbf, __u8 conn_id, __u8 status)
+				 __u8 pbf, __u8 conn_id, int err)
 {
 	int reassembly_len;
-	int err = 0;
 
-	if (status) {
-		err = status;
+	if (err) {
 		kfree_skb(ndev->rx_data_reassembly);
 		ndev->rx_data_reassembly = NULL;
 		goto exit;
-- 
2.51.0.windows.1

