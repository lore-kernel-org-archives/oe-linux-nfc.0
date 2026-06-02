Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0F630E82D
	for <oe-linux-nfc@lists.linux.dev>; Tue,  2 Jun 2026 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405140; cv=none; b=WOe995WhCZQfnfrDoN1SBwVB0HCYue7hcVKtZj9GcYKDamsNR/a+MMOnmv9U35FfYrA7FOpnPA/QBZK9fF3qEVRRBlkTnGdKheeWrU0gTbXAAHCnAVSQRLvvZ67YqG7xHMde9IHwd5EASZeZdKN9oMjds/hX4j9hZokyyuYySAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405140; c=relaxed/simple;
	bh=KjFmdNHzoOXwt5tqyf0PhWE/7QYxAsDnyIENzYF/v3M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NOB0t1bqjGBWY+6bvZZUEBm6EXFEGSyvbMGoas1CKZ4q38V8YvsicpFwwS5YeYLS2bWuu+szUubXFDEJTnx8V3WZ7D+uSLwWeua3kXbLLEUE08MeUR5mg8bnYA+ynJyis6Yay1Dg5P/aKq7C47zOz0n5JpzACKPMHFi5uV3iK+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6DTdr8i; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6DTdr8i"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490a76757e5so19406285e9.2
        for <oe-linux-nfc@lists.linux.dev>; Tue, 02 Jun 2026 05:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780405137; x=1781009937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7bRWpujkv4VvgAMdATj8kshXPGj41t4CDDKVHeGBhU=;
        b=p6DTdr8i0db4iyGjNsOoZNne7xux9zrNMRVGUCQplEbkvPd+P20gNIbUhoJz5zjh71
         KisHifNo9aaJuq4pMj+Ol4CAWtWBKLhC1JpJ7dBKZipKbyOOFKtFmSCLoGjAWLY254w7
         1aMmTBmX0RAuoVo9z8OrHerRDFOIksY6OuK2kbiw0V6QR+loUVY+bOdeE9P8Z2JMWjiG
         knqQ1A68qVZAafM0pVUNU3Rd67Gb5bQy1XLqzRLSbuaFaq+QhfQMVhM92RKYfEgDNI/5
         PJM6hIWMHhflWsgY2VnRT3v+8A2KbdV9m7wpXT3/DJI2fOktNkj6gTLfEsXnmWnizMEl
         ABcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405137; x=1781009937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G7bRWpujkv4VvgAMdATj8kshXPGj41t4CDDKVHeGBhU=;
        b=YgiLZgupuVrPKSUw0b+7eE1Fmm/vjKoqmLqrPWjULGcG9llHAqkOoEkJOD2bSDHZ3L
         HsXBAVP04C4TOzs7x00xP3TVT3u5pWKqeBJ9Dxwh6rhB8oNWuN0WTkG7KSvBJE3opSTT
         82hhymIB4dEIMuPz74elgRWBm42fW7sziOvNso30TGKkTC6KJ2fnaRTnGaJPdSPGOM5K
         pYaKgwIR59lW9tLm+Bfw1H17kAjrZU1iOpuBn6XNQCWogC27XdYfbJPu+Qkvi0Zt2MA/
         0Et9JDb/AGtcJnpRkSvjNWelFCp3L0c9CqK6IsQdCKR+4wdLewk/5ga6HWCh5WHEutpe
         Dxeg==
X-Gm-Message-State: AOJu0YwBjwPWkL4FDsHnLQz3XQfUbTeCQVBXRse45gKsrRocvYKbhtdi
	h5BOW1a09EpAuUfWy8NwNArXjJf5ZYeU66BrJYLoL5/Z42HTF8jIlHjX
X-Gm-Gg: Acq92OEto0PaxEAlyiiOr3qH24i3PXLARIQPA82SRqehcGsuBQOixbyz3AE3qaK2dgk
	PNXGIkuBbtg7tfcNTiHQffIZLKUGKnx0yoPfGlE4SkUyd9nFw2PoL9P9Qxg57HiYK3MudrXjnT4
	aWQqhTzKPmi/tJE8uePcQvxPMWPCeYfbqytSJ32z2HQ5jopcyeTxuplVa2G9Us31yH6qJV1biER
	YFYTUnVlq1nFGc2OGcb2Lr7ZFeHr7aXqqha0VguL9DQ6VbypI/V374tavfbRZl7B4r7Y8hbWayJ
	w35c//XRStWl8qJ+eUT2rf5P26PCNk86+KaCYUGYTUUFm92RNnn6p3grqZjoSW+y6Ji9dIOlMsH
	MWTWcFbNMAWBc1ztiZB9T+TkbtFCYE2ENG5L/ukInwUvC2Lgme8T04q1Tkd8SSLPoeFu2Owk1GX
	EdVjbi5Ngy6n62rmXXpSmeqGGqFtRflVkcARoUCM7imVxoutjXSFxUcoS43+H5UIx4YjKqmVQ=
X-Received: by 2002:a05:600c:c0d2:10b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-490a2938f7cmr205884365e9.25.1780405136821;
        Tue, 02 Jun 2026 05:58:56 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0daefbbsm112673735e9.0.2026.06.02.05.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 05:58:56 -0700 (PDT)
Date: Tue, 2 Jun 2026 13:58:55 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: oe-linux-nfc@lists.linux.dev, david+nfc@ixit.cz, security@kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH] nfc: llcp: fix integer underflow and missing bounds
 checks in TLV parsing
Message-ID: <20260602135610.5f79ed10@pumpkin>
In-Reply-To: <20260525202427.67768-1-doruk@0sec.ai>
References: <20260525202427.67768-1-doruk@0sec.ai>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 25 May 2026 22:24:27 +0200
Doruk Tan Ozturk <doruk@0sec.ai> wrote:

> Multiple out-of-bounds read vulnerabilities exist in the NFC LLCP TLV
> parsers:
> 
> 1. In nfc_llcp_recv_snl(), when an SDREQ TLV has length == 0,
>    service_name_len = length - 1 underflows to SIZE_MAX (size_t is
>    unsigned). The subsequent strncmp() and nfc_llcp_sock_from_sn()
>    calls then read unbounded kernel heap memory.
> 
> 2. All LLCP TLV parsing loops (nfc_llcp_recv_snl, nfc_llcp_connect_sn,
>    nfc_llcp_parse_gb_tlv, nfc_llcp_parse_connection_tlv) read tlv[0]
>    and tlv[1] without first verifying that at least 2 bytes remain in
>    the buffer.
> 
> A nearby malicious NFC device can trigger these without authentication --
> LLCP link activation happens automatically after NFC-DEP.
> 
> Fix by adding a minimum length check before the subtraction in the
> SDREQ case, and adding bounds validation at the top of each TLV loop
> iteration.

Why not fix it properly so that it doesn't read beyond the end of the skb.
1) Change offset and tlv_len to be 32bit - no point trying to do 16bit mathx.
2) Worry about non-linear skb - perhaps just process skb_header_len() bytes.
3) Allow for very short frames.
4) Don't read beyond the end of the skb data.

Something like:
	tlv = skb->data + LLCP_HEADER_SIZE;
	tlv_end = skb_tail_pointer(skb);
	for (; tlv + 2 < tlv_end; tlv += 2 + length) {
		type = tlv[0];
		length = tlv[1];
		if (tlv + 2 + length > tlv_end)
			break;

Then as well as the check for length >= 1 in SDREQ (even 1 doesn't make sense),
the SDRES path is missing a check for length >= 2.

-- David

> 
> Found by pwnkit (https://github.com/0sec-labs/pwnkit), an automated
> kernel source review tool by 0sec (https://0sec.ai).
> 
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
> ---
>  net/nfc/llcp_core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
> index XXXXXXX..YYYYYYY 100644
> --- a/net/nfc/llcp_core.c
> +++ b/net/nfc/llcp_core.c
> @@ -1300,6 +1300,9 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
>  
>  	while (offset < tlv_len) {
> +		if (offset + 2 > tlv_len)
> +			break;
> +
>  		type = tlv[0];
>  		length = tlv[1];
>  
> @@ -1307,6 +1310,9 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
>  		switch (type) {
>  		case LLCP_TLV_SDREQ:
> +			if (length < 1)
> +				break;
> +
>  			tid = tlv[2];
>  			service_name = (char *) &tlv[3];
>  			service_name_len = length - 1;
> 

