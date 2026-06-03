Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEC8492194
	for <oe-linux-nfc@lists.linux.dev>; Wed,  3 Jun 2026 21:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780521059; cv=none; b=e2iJ+K7btB7xQb81bfkcdWLu7x2giHki33fzW8FlLQRSeaktR1h4P2xSj3ZmLoFVlLSRLMyJPWxsTnm3J6a40NFzz8BI8j2r/kwuoy6xcafADDpOPZkNZn7qyhrsdGuCZy0CRG7IX70fdJ011mapfHUtS2Q1CRcqG/L6UHW1Z1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780521059; c=relaxed/simple;
	bh=/MW/dfW1QSmsbNoYa2vK+Skz7iz1xYiFhdjNaclOh9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sc4U/Rck9pHLk+MWFjovW2iS2bnFNsoh7xfft8gRKswGJbAeHok/AuDsH3DYAmxHPE3bGZsJN4uakb0pZZ4qsv/n07qpNzxZN6/0AIonYukhfDh5lSfersCmE9pWrb/7IqF1vi+456cwU3WiMh8ZZQDM8vlceCxQrRqkTelip5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIdgCqZh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIdgCqZh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso124205e9.3
        for <oe-linux-nfc@lists.linux.dev>; Wed, 03 Jun 2026 14:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780521056; x=1781125856; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ld+uPuSR3PL9BaAhx0L74UA2kQhY22n7gtMWcYpbbc8=;
        b=jIdgCqZhb0a9Mlgje5zmr3y59xc6XP8kXVqn3NMFYAwIV7Kuzbv/onz7ezjmWmcCup
         2aUoLZcFw0ElqEGIZnzdLIHxXIsRQ0u9nHzS476Msoxv/4zO8U1ckMj7U+4EoPsC3vVH
         kbi69bZlCeYthF+kwlnphbqj/0ftZqi6fAyy9RkSQADLdSoBSLuLG8Isd03ndZrL0tf+
         j8dka56WbdKDGofkKPOqNNVxM/6RodeLprOxLUdOBWy6qOpcBFDeWWxof1kr30uatf7N
         hZi5wtiBPjs+emLg/8U+S4Wvay8/YOWBdc5t3sohNLoh3soW/gKGK5G2XxI4TqfpA15D
         2yMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780521056; x=1781125856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ld+uPuSR3PL9BaAhx0L74UA2kQhY22n7gtMWcYpbbc8=;
        b=lUwt2uWTm38miFT9ajhMiGaow1wf60dzvgQQs3blspxZNhKctTdcWYtduLyE3bhXhn
         PBaHTgsoMdxTsjcVOZtlmgCkpSAOOGq4L/OeD7gfgbiCJOMZHUC0lMWviPumofI38+eF
         iUBgLCDD2e6w09UAIAOZ1U/bPivE4qfJosFH45jBV+jNUG3In+MrzK0nuaAZvH+d3n7R
         jS/WEgy8O007fpAJx1ewCvoeDomuEhThrBLGvSg32RINhnUKKuIGnRasBmA8CQ6Q5I6P
         wf1Y3r+bz4fh8F3BGzHXvy6O4Xne+dea//fnx0YFPBvAign1gqKQitUfsAjdChaqBqkm
         ngdg==
X-Forwarded-Encrypted: i=1; AFNElJ+i1r17vzq6bek/8cI262iXcUD5TwN43fmdz/YFkDXJlq0DyILBSVj+Fe02mf+Ty1Cog7RWOhDUR5cpppM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb1mEA5tK7ccn4gaT4vbKKv2JAONWhYv4ZpA9Vl4Oh7fS6Fyqc
	tExObQMSS295Dl4IvojWybIedwG+2yXeHVyFk7HuuLDJ2VST4WBN+0od
X-Gm-Gg: Acq92OGaInPdjxvSqsiJb/5M6r9tPvDHdtGIVfWG1EQdlzuHvqscNQytTM3dy0PLP6C
	D8tPtL0f/7szMbdO8yai3y+sxaVibqOUn0Z0k28yBa4jKEUYr/lsmmCo83SPy6lg0ORjYMpv/AU
	oVucSY8k8gkYOzvfYha3NmhItllYxSIHfqb1R1GlevyQUcMXJnmaw1DWzWKcRtOqH+wRaoxvq55
	rt9eczqYn46/KafbQODI/33aCMzFsnMXvz9Hyu1gSr/fXgr/i40T51oRh/8H5vOW+TLYPMizpxs
	2ULkiRnVulTkvOA3va51jKRTR4HppUw1b//1xGgtsRgOiHpasnsOKCSPCiavLjJtXY21QOjWVWv
	ULL0NvZd/eWAqYTCYDT5xqZBM09mEwLjn5VwruIV93ekkmjeE4aAuwEtAItyZnvOPgFIsVu1Dti
	pg8hMtV/6+ItdrYcrcJ8NP3sjmOBNOenuJacvcpwYoaFCmi9iNOVHn+SenNwWLnqre2oCo7pY=
X-Received: by 2002:a05:600c:4e87:b0:490:3890:605b with SMTP id 5b1f17b1804b1-490b60de6d0mr84037795e9.31.1780521055640;
        Wed, 03 Jun 2026 14:10:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7e6c6a4sm41801545e9.2.2026.06.03.14.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 14:10:55 -0700 (PDT)
Date: Wed, 3 Jun 2026 22:10:54 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: David Heidelberg <david@ixit.cz>, oe-linux-nfc@lists.linux.dev, Simon
 Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] nfc: llcp: bound SNL TLV parsing to the skb and
 add length checks
Message-ID: <20260603221054.316f15fa@pumpkin>
In-Reply-To: <20260603135935.62647-1-doruk@0sec.ai>
References: <20260603135935.62647-1-doruk@0sec.ai>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  3 Jun 2026 15:59:35 +0200
Doruk Tan Ozturk <doruk@0sec.ai> wrote:

> nfc_llcp_recv_snl() walked the SNL TLV list using a u16 offset/length
> pair derived from skb->len, without bounding reads to the actual skb
> data. Three problems followed:
> 
>   - For a short frame (skb->len < LLCP_HEADER_SIZE), tlv_len underflowed.
>   - The per-TLV header (type, length) was read without checking that two
>     bytes remained.
>   - A declared TLV length could run past the end of the buffer, and an
>     SDREQ with length == 0 made "service_name_len = length - 1" underflow
>     to SIZE_MAX, driving an out-of-bounds read in the following strncmp()
>     / nfc_llcp_sock_from_sn(). The SDRES case likewise read tlv[2]/tlv[3]
>     without a length check.
> 
> A nearby NFC device can reach this without authentication; LLCP link
> activation happens automatically after NFC-DEP.
> 
> Walk the TLV list by pointer, bounded by skb_tail_pointer(), and validate
> each TLV declared length before use. Add explicit length checks for
> SDREQ (>= 1) and SDRES (>= 2).
> 
> Found by 0sec automated security-research tooling (https://0sec.ai).
> 
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
> ---
> v2:
>  - Walk by pointer bounded on skb_tail_pointer(); drop the 16-bit
>    offset/tlv_len math and fix the short-frame underflow (David Laight).
>  - Add an SDRES length >= 2 check alongside SDREQ length >= 1 (David Laight).
>  - Bound the SDREQ service-name pr_debug to the field length (no over-read).
>  - Rebased onto linux-nfc for-next (David Heidelberg).
>  net/nfc/llcp_core.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
> index dc65c719f..d23ca815a 100644
> --- a/net/nfc/llcp_core.c
> +++ b/net/nfc/llcp_core.c
> @@ -1286,8 +1286,7 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
>  {
>  	struct nfc_llcp_sock *llcp_sock;
>  	u8 dsap, ssap, type, length, tid, sap;
> -	const u8 *tlv;
> -	u16 tlv_len, offset;
> +	const u8 *tlv, *tlv_end;
>  	const char *service_name;
>  	size_t service_name_len;
>  	struct nfc_llcp_sdp_tlv *sdp;
> @@ -1306,21 +1305,28 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
>  	}
>  
>  	tlv = &skb->data[LLCP_HEADER_SIZE];
> -	tlv_len = skb->len - LLCP_HEADER_SIZE;
> -	offset = 0;
> +	tlv_end = skb_tail_pointer(skb);

Only processing the linear part of the skb deserves a comment.

>  	sdres_tlvs_len = 0;
>  
> -	while (offset < tlv_len) {
> +	while (tlv + 2 < tlv_end) {
>  		type = tlv[0];
>  		length = tlv[1];
>  
> +		if (tlv + 2 + length > tlv_end)
> +			break;
> +
>  		switch (type) {
>  		case LLCP_TLV_SDREQ:
> +			if (length < 1)
> +				break;

I'm pretty sure a zero length 'service_name' makes no sense.

> +
>  			tid = tlv[2];
>  			service_name = (char *) &tlv[3];
>  			service_name_len = length - 1;
>  
> -			pr_debug("Looking for %.16s\n", service_name);
> +			pr_debug("Looking for %.*s\n",
> +				 (int)min_t(size_t, service_name_len, 16),
> +				 service_name);

I'm sure you don't need min_t() here.
In fact if you change the type of service_name_len to int you don't need
the outer cast either.
The domain of the value is [0..254] it isn't going to overflow.

>  
>  			if (service_name_len == strlen("urn:nfc:sn:sdp") &&
>  			    !strncmp(service_name, "urn:nfc:sn:sdp",
> @@ -1380,6 +1386,9 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
>  			break;
>  
>  		case LLCP_TLV_SDRES:
> +			if (length < 2)
> +				break;

Someone with knowledge of the protocol can probably tell you that the
length should be exactly 2.

-- David

> +
>  			mutex_lock(&local->sdreq_lock);
>  
>  			pr_debug("LLCP_TLV_SDRES: searching tid %d\n", tlv[2]);
> @@ -1408,7 +1417,6 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
>  			break;
>  		}
>  
> -		offset += length + 2;
>  		tlv += length + 2;
>  	}
>  

