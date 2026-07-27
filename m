Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB05A3E7BBD
	for <oe-linux-nfc@lists.linux.dev>; Mon, 27 Jul 2026 09:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143254; cv=none; b=ANo9DKVza0kv8Nf/se3pc5SKmL3FQZUixZhb8uJIWTS4WZOQHn3nPo8Qe9hWT5fBVxdqEPmC/d8tf/ZFIZHq19kMe6eOIn320WrqR/vnw0Ox3/4nvr+do/ZHMYyZSnn62iJARD3UkUvA3H5hKlrMg0hnDa50rdImHJECBKGE3DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143254; c=relaxed/simple;
	bh=1ZAQHcP/rZjRYOHz4mnkrgSaIgju6m7GZWbsrsSqHTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3q4bcZbcie2QlWxfAy02SL9PM275IpEuwbEhWH3gegbdIobTxeD+TQ0tD1FTYt6xg3hduIBG7ZUi0X0RkN/ca/txSr/swpju7y6GqjhviKOnEuoVTPpTHp3YOIJ2L9FssaaWSnySJm8rebMrkhyw6KkbuCgwhEDLgEbcjHrDvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=WV1I+Ju9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NTgNUMCY; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="WV1I+Ju9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NTgNUMCY"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 158727A0466;
	Mon, 27 Jul 2026 05:07:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Mon, 27 Jul 2026 05:07:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785143251;
	 x=1785229651; bh=AGOgShQXgGOvUMp+qjwLCaMSbgTbSApAvhCupXXfoKQ=; b=
	WV1I+Ju9jgvxlGYgkgiGZNBM8qmdiVGYBtmbgCfnfiNqlLGeIgcznA75rLAQz0L+
	bstrvmCGKsSk5HR97VZNMZzaeDaX/jMvu26tq//6Vju9OAPIY03GqHDl0X42sA2B
	aEOT2S/11ju3JPkLCub3wKD5aBD/2cFwmbmAdUz/hb4cwpBQ+rmaMSH70/Hydnfn
	1QT0l9+niiPBk/jkiO8BYcTI7dUclrW6KRMO8oMAMKBNuFNP9w664wBid3yFs/Tv
	Em9+8y/yZzwScQpqH3VEX6eGmpRehoK+dsnszTO4NqFycp6nW+jtdESdB5XOOW1j
	ruXEuxbuS3ddafIr/56Tgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785143251; x=
	1785229651; bh=AGOgShQXgGOvUMp+qjwLCaMSbgTbSApAvhCupXXfoKQ=; b=N
	TgNUMCYNSt0AFhg/NOnys/twX70FdygHKZmwK6nJxArcWMvByzvbM0cmwwjq0GXN
	c9MTOBJNndgVeOaLrCcfJw0qAtr1XKXIvj+b5PktQja1hEdXJds+yP+JQbLuVJ6n
	Wm7I3g2W9hu0XM9mr2a+6ybsFcTfGgWfZK7iPBUI3ACl6Xc7HE+kO/WJYXALHgQH
	HfueCMOQXIe0QAOIeTeTMnqe4Fii1ieR8zJ8BOn2GJBI4kRYAAV//4mu8aMeFg5B
	2gbtIWuQrNRAi2dC+dQYnVNmS12O2X3ssv0yTxTpT9p19a0pCSMou50zQXaLHBOv
	Alk9fIlICMD2UjgKTFV1Q==
X-ME-Sender: <xms:0x9nard_GQ3_aQZrcBydkQcW8AV1Oms_lHOoRYjHFxRIt1sl4IGs7A>
    <xme:0x9nasLpfXrhycTXK_kXh_0S92HlajjSfsnnaJJlE8_C61dlAyDfYmGupM6icKXDE
    cUQkaQ6ObILqelZGCEiNDsoGe6t7fhEbNBIX4C9U2uqgb4ypQ4>
X-ME-Received: <xmr:0x9najhKgRCjPBC32chakRMlTNlV-F499FThNCJcfVf5zc8obVZWtlEzJSY48Cowb5vfCzDGWAKYRBqhwRADt0LVK6s2w4If1w>
X-ME-Proxy-Cause: dmFkZTECebrDEeSYir/DuEzS0DvfHXnSd16jaoBPR26nMbwatmgf0pn2BgwsUtACSRC47r
    DymSMe+bmHsXrTCqLfPn88ie/76VPUg+8It0g0NkhJfCVYBdmRCB0bx7nIg6z2wTGy4kEj
    j9DXw3hsZlVnQODex/jTbQh/pPkTIV3zKQ8RxpA9ShHF7Ev+dsOhmkAjJgwdHm8xlyDL4J
    bwVFpHSvTZ8gdW6WZbmkr0vT1E04/jY7yS6wvWeWHAE3VAukYrn3uXPGOQeycm3MaCeTy5
    oUuB5WY11roGkmNsscEIKX10lh4Fw9KuXsBSIukBW/XBs/LYUAtbmk47O2iKqQTB6jQwmH
    c/h2ekKDuP8gr1XPTp09kIE15LWBPuFhBhA5AY0upWaNHHo/2HaIGGOnF03MZvNUKuYXgz
    UyTs3LfL3U9o17NmJkEItGkj3aKSOABu+Wjk6rFBQA4BdvKQi8B7oKFQLsRRoqiAKLyKLO
    zWCxbc8+0YsRRWi6US6Fld58dBcCaOh7SN7rQmJvWRkIATQCtN4zEpvc9Oww0rw7ZhSpXW
    BDbtl7fch4b1D5plvRZkOHqTfoHaVeF9gpW1xl4nURBGvFndXlvWsO6kBjtUm2DqqUbx1T
    1htLP29icOyzFlaipH+Ig/VbWZ51wM/m6BmJb7LDdEJ8drfgBwLzW8U/G/WA
X-ME-Proxy: <xmx:0x9naiTuKCrOhVbPhHWnXryG9IuhTI2TbFpQK6XzgZuKUINTS2NT_g>
    <xmx:0x9nalWZ1WWMnkAkZSeVCpNLb8zhL9kgpKM677uNE058uiPw6Ao71g>
    <xmx:0x9namQVwOJypt5FzUYt-oDM-Qtpm6KJm8cRLyq1EVs2dvrzlupWJA>
    <xmx:0x9navnH5dbOHeg2edhQ2leUMT8Fy9vKt6WfqPjGVEre9-U2ic2eHw>
    <xmx:0x9narmpAx9dczg7Vao0yJ_rj0hVhcBEFhke8lymS8BE5-3xy0FREG6a>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jul 2026 05:07:30 -0400 (EDT)
Message-ID: <7e5dab28-e672-4dfd-9082-7fc3cfc226d8@kroah.com>
Date: Mon, 27 Jul 2026 11:07:27 +0200
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nfc: st-nci: Add error handling to IRQ handlers
To: David Heidelberg <david@ixit.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, oe-linux-nfc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <2026070726-wiring-yield-ceca@gregkh>
 <4909379b-fed6-4636-bfff-cea94f1cfcce@ixit.cz>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin@kroah.com>
In-Reply-To: <4909379b-fed6-4636-bfff-cea94f1cfcce@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/19/26 2:27 PM, David Heidelberg wrote:
> On 07/07/2026 16:21, Greg Kroah-Hartman wrote:
>> From: Griffin Kroah-Hartman <griffin@kroah.com>
>>
>> Add ndlc_remove() to st_nci_i2c_probe() and st_nci_spi_probe() if the
>> devm_request_threaded_irq() function fails.  This is to properly unwind
>> after ndlc_probe() was called prior to this.
>>
>> Assisted-by: gkh_clanker_2000
>> Cc: David Heidelberg <david@ixit.cz>
>> Cc: "Uwe Kleine-König (The Capable Hub)" <u.kleine-koenig@baylibre.com>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> ---
>>   drivers/nfc/st-nci/i2c.c | 4 +++-
>>   drivers/nfc/st-nci/spi.c | 4 +++-
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
> Heya,
>
> the Sashiko review look reasonable here, check?
>
> > diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
> > index 9ae839a6f5cc0..7f727d9b97ba8 100644
> > --- a/drivers/nfc/st-nci/i2c.c
> > +++ b/drivers/nfc/st-nci/i2c.c
> > @@ -243,8 +243,10 @@ static int st_nci_i2c_probe(struct i2c_client 
> *client)
> >                  st_nci_irq_thread_fn,
> >                  IRQF_ONESHOT,
> >                  ST_NCI_DRIVER_NAME, phy);
>
> If userspace opens the device in the brief window between ndlc_probe()
> and devm_request_threaded_irq(), could st_nci_open() attempt to enable
> an unrequested IRQ and cause communication timeouts?
>
> > -    if (r < 0)
> > +    if (r < 0) {
> >          nfc_err(&client->dev, "Unable to register IRQ handler\n");
> > +        ndlc_remove(phy->ndlc);
>
> Does calling ndlc_remove() here lead to an unbalanced IRQ disable?
>
> When devm_request_threaded_irq() fails, this new error path calls
> ndlc_remove(). This function eventually calls st_nci_i2c_disable(),
> which unconditionally executes disable_irq_nosync().
>
> Since the IRQ registration just failed, would disabling this unrequested
> shared IRQ line break other devices and trigger an unbalanced IRQ disable
> warning?
>
> Will this error path also cause a blocking wait and memory leak?
>
> When ndlc_remove() cascades to ndlc_close(), it sends a synchronous NCI
> mode-set command via nci_prop_cmd().
>
> Since the device was never opened by userspace during this failed probe,
> the ST_NCI_RUNNING flag is not set. This causes st_nci_send() to return
> -EBUSY and drop the transmission without freeing the sk_buff.
>
> Because nci_prop_cmd() waits synchronously for a response that will never
> arrive, won't this block the probe failure path for the full 2-second
> timeout? 

I agree, unwinding this error tree was much more complicated than I had 
assumed,

these warning messages look reasonable to me as well.


I will forgo this patch and ignore this change for now, Thanks for the 
catch!


Griffin

