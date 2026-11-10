Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794290972;
	b=kxQkYx0CpBuooNYFzLUlBsBuMNlacgIbJVpv7wluPtKr5Uk0covflm0nfCBDL1C2xHub
	 0NV245iMbb6vpqKTSAOC50jIT4oRMsvGNOfU50oHXvbdYBpKEKzkGSFu70DvnnMP4B4sV
	 YFC0jyTRQV2KEbHS5HmsVkBdpzFB4Hm5+n44x3xRqyjP5BZ3HfPZelW5ctC9vlc3hyN01
	 Wnh365MPhGhhoU4DDpFzmGw9IufRzbP02R3ZxqU9qJyAmUn4vwgBmkV/m0mr3bAptoNDE
	 3MixVajcWK8PYcZE5bh9wAtRCst1YnvGHkQnufN4kadKdn1oaAFod44YwrYAAn1DWow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794290972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kZjQ59UCRW5R4H/+cRlryoG4wGj0VlSB5hBgqDomyao=;
	b=iOy8jWPnl5bTmeQIeJDr4RZactewsfwj/dojCoYS+4nZvnsnQjfJSmw2kiPZIz3AtFko
	 y9ulnhgFsrzeRLj18X8ir82Z0UPYAISRa9QWJ29iK052VTP4f2/FiII3qgHzSMJL0EVN5
	 XiaUDNb17Lp8tRQlj46KoIQOtrsn+h/YLsZhvxxQqPWb9gQefT0WNhOVORCUbMPzmLgLx
	 MnXoKe6oyZaHDgJRQiNv7Xxyaq06z5UuEkzwNpNQych8wj4I35+eZLrY7PFGGtR481jdz
	 SvkYcWIvjWdmegXdNkBcSy+VlKlK7bJPKIv6p9J2IBDwA6xuF3V4TYz49ta1S3jUmwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=puUf2jjY;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885BA606A31C
	for <oe-linux-nfc@lists.linux.dev>; Tue, 10 Nov 2026 06:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 885BA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=puUf2jjY
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36f8cdd30beso2145931eec.1
        for <oe-linux-nfc@lists.linux.dev>; Mon, 09 Nov 2026 22:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794290972; x=1794895772; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZjQ59UCRW5R4H/+cRlryoG4wGj0VlSB5hBgqDomyao=;
        b=puUf2jjYnOEED0NgiKXvwo5vBQwAAJxn0P3QaLpXC/VJQFFi/mPdOYDQhIkRCMLSE7
         vGmsHAta/E93sFkSwFegenZaj2oaMViDPe6zUxoF5rHvMKyATsG23fNw7YkeGFr4G5rK
         Hi87QJXShz4sdggLTlUfWh1j3YTP+FRQszYc1glpxJGWeHLXTXbAm25YXQnJMMCmGXKj
         UDelqgSq+An9e2L0jQ+/CEonxTvCYoSb/cO3fGQR8nr7anuNLOURDpWEOw16AejayGT4
         varPuOvlCUqk58KZHbuUQkkiJvu6AjJohFA+oB9wh1dfBd5do2YqiGMUne5QN6nPxeRF
         338g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794290972; x=1794895772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZjQ59UCRW5R4H/+cRlryoG4wGj0VlSB5hBgqDomyao=;
        b=NetYdbxMJ3goAfR5DavDqjUv+cvsDBFvDauBxGJ9Ml7Wreeieyky22sSTQGsiuGRd3
         nfXjFOXEy/ko/8ptWKUx7+A2CrbD6vA2qdxabVrAqC+qFQvBXWAd2DVEt1HlBevO0DE0
         /TSwIl1OGDvhBJ8o5uD8TFnVYDnBvrry9YMMNfPpLc9yVNvPZbg3UVusdB3Ex/s3D+or
         v5HM1IOwNiXyiIpJJRbTsh6EnHd/eVJov5VZOrIOshaEUQ4KfJWq+jtQ/mA+V5tNRyDj
         TiQkah8YbcGZLIciVTZAB2xc55mQEppXOsvNmNxNyryauKK1FubyyJa9DtnvyXcjkCxf
         ob5g==
X-Forwarded-Encrypted: i=1; AL+hErGK/zDsTnD0hIB/R8wN3PJ5fqn+Q8tmWU8oxPR2GjT0lSyUmrgYSN3ypipUPbyBYaVwzXHyznAYwZ+QUUs=@lists.linux.dev
X-Gm-Message-State: APuU4Z8dksBQZyD+x1wCXWPSlcndNQwmNyeUqQBaaPrFBVjflj7lGZlG
	hJQKn8rebejJjqeB7lSBpEAQ8KXsYdeK5U8m5l66qVSqu6u9zFWlCqAR
X-Gm-Gg: AYBFou2Oyggbq0Sq2/SslOOsL+vK76Ep5JultJ3NKlb4ixwn30DYmC/ekLMt0LpsWj0
	EOumEwNnvYz+iB64grLBKiH7eASClJQzF3iyHFVN2S6zo+GEVz6gQp52YQL4PFkighD29o1ruXy
	KlG/NCNZftqmLGpUZLQbUkiPGeMzqWwOKtrtETj5L8C2Cr3q82Oj7uv1LLUFM8Ery8EDZDEE3h7
	I1ZEX8fQ73BWQ4jpOSfFbUuzxk/UT1QGat3gDq7CoIl8GJZC1EXaS/qPRiUYyYNhKYjj/v6nRtr
	3XM2d2TAyvLvmKG5nymEqc1cIsjRyEYhDZkr4hAXNKX3kfSn9PYB5W06oyaY+UzXJSiL88AIxu1
	0KEUdRFUhQJkaLhgMjOtqmtx/t2I4jOXUAvdG9Po2P9sMuwlaNoRK6adUAYSCLYB5eMrIgl3o/o
	QW0yuyYhXFOjt1GdeXpZzkAcr8ZoXfk3jrOHEeDB0ZEl8p8LD7nK9VM3/NLlWRT4VT42svrhgxb
	rkee/CEd3XLc3Xq2oUc/gWrcZo24KOrpbNst7x3xAn9fQa8ejwLSv/AwdQZTzVlhrxn5AN0/fl0
	ONWG7cYYlUAx4eFqmI/UcT6KwWZ0IMX2GEdYV/1qIAe28mfxlpr2+u/xpFA=
X-Received: by 2002:a05:7300:ce03:b0:375:b560:a323 with SMTP id 5a478bee46e88-375b560a540mr358953eec.1.1794290971394;
        Mon, 09 Nov 2026 22:09:31 -0800 (PST)
Received: from TheRealOne ([2409:40e1:f:bf46:297:7dc6:50e0:d877])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm3875925eec.11.2026.11.09.22.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:09:30 -0800 (PST)
Date: Tue, 10 Nov 2026 11:39:23 +0530
From: Chandradhar Kumar <chandradhar.2003@gmail.com>
To: Chandradhar Kumar <chandradhar.2003@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Samuel Ortiz <sameo@linux.intel.com>, 
	Michael Thalmeier <michael.thalmeier@hale.at>, syzbot+93f169a8e7d66864f800@syzkaller.appspotmail.com, 
	oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net] nfc: pn533: fix slab-out-of-bounds read in
 pn533_recv_frame()
Message-ID: <avKx-tpX2nBgp57i@TheRealOne>
References: <20261014083239.144506-1-chandradhar.2003@gmail.com>
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014083239.144506-1-chandradhar.2003@gmail.com>

On Wed, Oct 14, 2026 at 02:02:36PM +0530, Chandradhar Kumar wrote:
> pn533_recv_frame() accesses skb->data to check for ACK frames, dump
> the received frame via print_hex_dump_debug(), and validate the frame
> without first verifying that skb->len contains enough bytes for the
> frame header and payload. When a short or truncated USB packet is
> received, this results in a slab-out-of-bounds read in
> hex_dump_to_buffer() or during frame validation.
> 
> Fix this by verifying that skb->len is at least PN533_STD_FRAME_ACK_SIZE
> before checking for an ACK frame, passing skb->len instead of the
> unvalidated rx_frame_size() to print_hex_dump_debug(), and validating
> that skb->len is large enough to hold the frame header and complete
> frame before calling rx_is_frame_valid().
> 
> Fixes: 9815c7cf22da ("NFC: pn533: Separate physical layer from the core implementation")
> Reported-by: syzbot+93f169a8e7d66864f800@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=93f169a8e7d66864f800
Hey the correspondig syzbot bug is opened for about a month would you
like to look into the patch if it is applicable or tell me if anything
is wrong in the patch or there are others way to fix the bug.

Thanks.
> Signed-off-by: Chandradhar Kumar <chandradhar.2003@gmail.com>
> ---
>  drivers/nfc/pn533/pn533.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
> index b0133e51dce9..c730a84f1c62 100644
> --- a/drivers/nfc/pn533/pn533.c
> +++ b/drivers/nfc/pn533/pn533.c
> @@ -2193,6 +2193,13 @@ void pn533_recv_frame(struct pn533 *dev, struct sk_buff *skb, int status)
>  		goto sched_wq;
>  	}
>  
> +	if (skb->len < PN533_STD_FRAME_ACK_SIZE) {
> +		nfc_err(dev->dev, "Received a too short frame\n");
> +		dev->cmd->status = -EIO;
> +		dev_kfree_skb(skb);
> +		goto sched_wq;
> +	}
> +
>  	if (pn533_rx_frame_is_ack(skb->data)) {
>  		dev_dbg(dev->dev, "%s: Received ACK frame\n", __func__);
>  		dev_kfree_skb(skb);
> @@ -2200,9 +2207,12 @@ void pn533_recv_frame(struct pn533 *dev, struct sk_buff *skb, int status)
>  	}
>  
>  	print_hex_dump_debug("PN533 RX: ", DUMP_PREFIX_NONE, 16, 1, skb->data,
> -			     dev->ops->rx_frame_size(skb->data), false);
> +			     skb->len, false);
>  
> -	if (!dev->ops->rx_is_frame_valid(skb->data, dev)) {
> +	if (skb->len < PN533_STD_FRAME_HEADER_LEN + PN533_STD_FRAME_TAIL_LEN ||
> +	    skb->len < dev->ops->rx_header_len ||
> +	    skb->len < dev->ops->rx_frame_size(skb->data) ||
> +	    !dev->ops->rx_is_frame_valid(skb->data, dev)) {
>  		nfc_err(dev->dev, "Received an invalid frame\n");
>  		dev->cmd->status = -EIO;
>  	} else if (!pn533_rx_frame_is_cmd_response(dev, skb->data)) {
> -- 
> 2.56.0
> 
