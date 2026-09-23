Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FF9477E37
	for <oe-linux-nfc@lists.linux.dev>; Wed, 23 Sep 2026 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.42.129.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157387; cv=none; b=AgbLH4rk6ff+GdwgBFhBJ36139FQkbTy+FTOi1xqoufVd3NwSfMFkm9hsz4GEIjT+biifUotaPkVTQZoG2Ac3eEK7HktvEq76NTalAzn2RnOPyRFCw+i5Ds4XwGzhOmInu4dRVcwB9GZ7JI8KSJdrHV3JbCfaHv0fiyiPayhlJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157387; c=relaxed/simple;
	bh=QeDdiTMtwUesbn82AMBLpIPVwRVTf/YQzaPCmJaM1Jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VlxJtMuvGJ14k+lW+tThPsnjD/Iwgo3tns0JrMvwX7eC8Wkt+Hf/KLUJojQ9tRRrIY/CumXKI7lhyVU4T+rFjLlepgvx3qHXRHGqQzSUW16m1DKI0Zassv+id3cx6CouBu3iluGIxTbkgVCbegUeSN8nOm1hqWj4HSomqYfw9/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=RxC1VWu2; arc=none smtp.client-ip=84.42.129.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="RxC1VWu2"
Received: from [IPV6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e] (unknown [IPv6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id B86525340660;
	Wed, 23 Sep 2026 11:56:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1790157382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yHwD2yK/eBmxEJX5iEQJpYIdMNbUey1YwWOC0yzq6vQ=;
	b=RxC1VWu2mKzgGzfLxfoEkmAaegn+i/P8+NepiufV6bPuBPHg03eCT3qKHw3zaJhXhMSfHI
	IVw+swc0VAJAck2fcCwh3V5WVMnof8ao70+chFFPI8d/6Y6rNYA3HhcG3vi1J9igQSDP2M
	FqVekT3DC/0OYjEgNbDvjVKc05U3k5o=
Message-ID: <a2910a0d-06d4-4f7d-ac7f-145633ffec5b@ixit.cz>
Date: Wed, 23 Sep 2026 11:56:22 +0200
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nfc: st95hf: validate device-reported response length
 before reading
To: Tianchu Chen <tianchu.chen@linux.dev>, sameo@linux.intel.com,
 shikha.singh@st.com
Cc: oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org
References: <91f49a98dd42655829b7206f0d64cc31ef9c0e95@linux.dev>
 <fe549eb46f9f666f2778e7c50198528028cf9528@linux.dev>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <fe549eb46f9f666f2778e7c50198528028cf9528@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/09/2026 10:18, Tianchu Chen wrote:
> From: Tianchu Chen <flynnnchen@tencent.com>
> 
> st95hf_spi_recv_response() reads a 2-byte header from the device,
> derives the total response length from it (up to 1025 bytes via the
> long-frame encoding) and then blindly reads len - 2 more bytes into
> the caller's buffer, whose size it knows nothing about.
> 
> Call sites can be overflowed by a device reporting a large length,
> for example, st95hf_irq_thread_handler() passes the data area of a
> 280-byte skb.
> 
> ST95HF datasheet states "In Reader mode it is possible to receive up to
> 528 bytes of frame data from VICC and TypeB cards", so technically a bogus
> NFC tag may trigger the OOB-write if the card-reader's firmware allows
> large packets.
> 
> Add a buff_len parameter and clamp the device-reported length that does
> not fit into the caller's buffer, Also modify callers to pass their
> real buffer sizes.
> 
> Note that the clamped transfer must still run rather than bailing
> out early: the header transfer keeps chip select asserted via
> cs_change, and only completing a follow-up message lets the SPI
> core deassert it. The device simply discards the unread bytes
> at the chip select rising edge, then report the overflow with -E2BIG
> after the transfer completes.
> 
> Discovered by Atuin - Automated Vulnerability Discovery Engine.
> 
> Fixes: cab47333f0f75 ("NFC: Add STMicroelectronics ST95HF driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
> ---
> v2: clamp the payload read to the caller's buffer and let the second
> SPI transfer complete instead of returning early, so chip select (kept
> asserted by the header transfer's cs_change) is deasserted by the SPI
> core; report the overflow with -E2BIG after the transfer completes.

Hello Tianchu,

please never send follow-ups as part of the thread. Always send them as a 
separate message (otherwise they may get lost and we already have patchwork wich 
can track the submissions.

Even better, try to use tools such as b4 to submit patches (easier for you, sent 
in expected format for us).

Thanks
David

> 
>   drivers/nfc/st95hf/core.c |  6 ++++--
>   drivers/nfc/st95hf/spi.c  | 16 +++++++++++++---
>   drivers/nfc/st95hf/spi.h  |  2 +-
>   3 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
> index 4d772a308bfff..0fbb60deada23 100644
> --- a/drivers/nfc/st95hf/core.c
> +++ b/drivers/nfc/st95hf/core.c
> @@ -283,7 +283,8 @@ static int st95hf_send_recv_cmd(struct st95hf_context *st95context,
>   		unsigned char st95hf_response_arr[2];
>   
>   		ret = st95hf_spi_recv_response(&st95context->spicontext,
> -					       st95hf_response_arr);
> +					       st95hf_response_arr,
> +					       sizeof(st95hf_response_arr));
>   		if (ret < 0) {
>   			dev_err(dev, "spi error from st95hf_spi_recv_response(), err = 0x%x\n",
>   				ret);
> @@ -800,7 +801,8 @@ static irqreturn_t st95hf_irq_thread_handler(int irq, void  *st95hfcontext)
>   
>   	mutex_lock(&stcontext->rm_lock);
>   	res_len = st95hf_spi_recv_response(&stcontext->spicontext,
> -					   skb_resp->data);
> +					   skb_resp->data,
> +					   skb_tailroom(skb_resp));
>   	if (res_len < 0) {
>   		dev_err(spidevice, "TISR spi response err = 0x%x\n", res_len);
>   		result = res_len;
> diff --git a/drivers/nfc/st95hf/spi.c b/drivers/nfc/st95hf/spi.c
> index ffaf2789c4069..a69f7c5e3695e 100644
> --- a/drivers/nfc/st95hf/spi.c
> +++ b/drivers/nfc/st95hf/spi.c
> @@ -66,7 +66,7 @@ EXPORT_SYMBOL_GPL(st95hf_spi_send);
>   
>   /* Function to Receive command Response */
>   int st95hf_spi_recv_response(struct st95hf_spi_context *spicontext,
> -			     unsigned char *receivebuff)
> +			     unsigned char *receivebuff, int buff_len)
>   {
>   	int len = 0;
>   	struct spi_transfer tx_takedata;
> @@ -106,9 +106,16 @@ int st95hf_spi_recv_response(struct st95hf_spi_context *spicontext,
>   	else
>   		len += receivebuff[1];
>   
> -	/* Now make a transfer to read only relevant bytes */
> +	/*
> +	 * Now make a transfer to read only relevant bytes, clamped to
> +	 * the caller's buffer.  The transfer must run even when the
> +	 * device overreports the length: the header transfer above kept
> +	 * chip select asserted via cs_change, and only completing this
> +	 * message lets the SPI core deassert it.  The device discards
> +	 * the unread bytes at the chip select rising edge.
> +	 */
>   	tx_takedata.rx_buf = &receivebuff[2];
> -	tx_takedata.len = len - 2;
> +	tx_takedata.len = min(len, buff_len) - 2;
>   
>   	spi_message_init(&m);
>   	spi_message_add_tail(&tx_takedata, &m);
> @@ -122,6 +129,9 @@ int st95hf_spi_recv_response(struct st95hf_spi_context *spicontext,
>   		return ret;
>   	}
>   
> +	if (len > buff_len)
> +		return -E2BIG;
> +
>   	return len;
>   }
>   EXPORT_SYMBOL_GPL(st95hf_spi_recv_response);
> diff --git a/drivers/nfc/st95hf/spi.h b/drivers/nfc/st95hf/spi.h
> index 3ab678734c174..443a5053c0128 100644
> --- a/drivers/nfc/st95hf/spi.h
> +++ b/drivers/nfc/st95hf/spi.h
> @@ -45,7 +45,7 @@ int st95hf_spi_send(struct st95hf_spi_context *spicontext,
>   		    enum req_type reqtype);
>   
>   int st95hf_spi_recv_response(struct st95hf_spi_context *spicontext,
> -			     unsigned char *receivebuff);
> +			     unsigned char *receivebuff, int buff_len);
>   
>   int st95hf_spi_recv_echo_res(struct st95hf_spi_context *spicontext,
>   			     unsigned char *receivebuff);

