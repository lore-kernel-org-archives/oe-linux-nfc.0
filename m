Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A160438E8D6
	for <oe-linux-nfc@lists.linux.dev>; Sun, 19 Jul 2026 12:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784464036; cv=none; b=oSbyg5vQonmoeUVHX5YYOOndgat0mVAMd4w36cVnTE3CKGRYxmG8yoEvOAg4UBY3PScUbt8flOvcmDj9qYxeoijLfPOvPieiDIdd15wuqMSJVlNZk2ER88gLQ3ytSCtSbQJfNAdt3jBvM0v2L683Twg3FYG65daPp91Cl4VW214=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784464036; c=relaxed/simple;
	bh=3eglMVdgdWWdenNEAhrSEkVduYzC8PtbeGucl2PMEqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vCxPn/k9TW2SoQso65Ox0xPgk5wemSLt00eGB2ngOqIlUJaeEpteOP23uUN0v5rWLFJYxzyGVqY6vMMzka359PgssIoOa1WW8XmlspU/O9yi1Om6EVqxUALzPRhkFnZw5b3kBQ1am5SjboLQglzI0GEWc8htYFbfKBQEPgGiP/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=G4U3/Izf; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="G4U3/Izf"
Received: from [192.168.1.182] (ip-62-24-73-79.bb.vodafone.cz [62.24.73.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 5FE9B53402FF;
	Sun, 19 Jul 2026 14:27:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1784464030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZHXfROMSBlFSvpeFf5wgBQr9uiTnUBDsfLX4DClzKhY=;
	b=G4U3/IzfoQ0bgp2zHMO0LGI1Z/ursvGhoBWgaB9rW9HkJcmPSct1/np3q4mrejFcT7QT6O
	uajIZvsrNrNxdSkqkAbgjyQnpEd0Teaj15eKrK7vPThxpM47hLz/BVfy86aG8GtY60QzFT
	G6A8MtWErrnHnSogFQeER1TfeNr58O4=
Message-ID: <4909379b-fed6-4636-bfff-cea94f1cfcce@ixit.cz>
Date: Sun, 19 Jul 2026 14:27:09 +0200
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nfc: st-nci: Add error handling to IRQ handlers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 oe-linux-nfc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Griffin Kroah-Hartman <griffin@kroah.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <2026070726-wiring-yield-ceca@gregkh>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <2026070726-wiring-yield-ceca@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/07/2026 16:21, Greg Kroah-Hartman wrote:
> From: Griffin Kroah-Hartman <griffin@kroah.com>
> 
> Add ndlc_remove() to st_nci_i2c_probe() and st_nci_spi_probe() if the
> devm_request_threaded_irq() function fails.  This is to properly unwind
> after ndlc_probe() was called prior to this.
> 
> Assisted-by: gkh_clanker_2000
> Cc: David Heidelberg <david@ixit.cz>
> Cc: "Uwe Kleine-König (The Capable Hub)" <u.kleine-koenig@baylibre.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>   drivers/nfc/st-nci/i2c.c | 4 +++-
>   drivers/nfc/st-nci/spi.c | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
Heya,

the Sashiko review look reasonable here, check?

Thanks
David

--- Patch [1]: [PATCH] nfc: st-nci: Add error handling to IRQ handlers ---
commit ae7497e7a0338b16d82e7783afc2835614c291c1
Author: Griffin Kroah-Hartman <griffin@kroah.com>

nfc: st-nci: Add error handling to IRQ handlers

Add ndlc_remove() to st_nci_i2c_probe() and st_nci_spi_probe() if the
devm_request_threaded_irq() function fails.  This is to properly unwind
after ndlc_probe() was called prior to this.

 > diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
 > index 9ae839a6f5cc0..7f727d9b97ba8 100644
 > --- a/drivers/nfc/st-nci/i2c.c
 > +++ b/drivers/nfc/st-nci/i2c.c
 > @@ -243,8 +243,10 @@ static int st_nci_i2c_probe(struct i2c_client *client)
 >  				st_nci_irq_thread_fn,
 >  				IRQF_ONESHOT,
 >  				ST_NCI_DRIVER_NAME, phy);

This is a pre-existing issue, but is there a race condition here?

In st_nci_i2c_probe(), the driver calls ndlc_probe() which synchronously
registers the device to the netlink subsystem, exposing it to userspace.
The IRQ handler is requested immediately after.

If userspace opens the device in the brief window between ndlc_probe()
and devm_request_threaded_irq(), could st_nci_open() attempt to enable
an unrequested IRQ and cause communication timeouts?

 > -	if (r < 0)
 > +	if (r < 0) {
 >  		nfc_err(&client->dev, "Unable to register IRQ handler\n");
 > +		ndlc_remove(phy->ndlc);

Does calling ndlc_remove() here lead to an unbalanced IRQ disable?

When devm_request_threaded_irq() fails, this new error path calls
ndlc_remove(). This function eventually calls st_nci_i2c_disable(),
which unconditionally executes disable_irq_nosync().

Since the IRQ registration just failed, would disabling this unrequested
shared IRQ line break other devices and trigger an unbalanced IRQ disable
warning?

Will this error path also cause a blocking wait and memory leak?

When ndlc_remove() cascades to ndlc_close(), it sends a synchronous NCI
mode-set command via nci_prop_cmd().

Since the device was never opened by userspace during this failed probe,
the ST_NCI_RUNNING flag is not set. This causes st_nci_send() to return
-EBUSY and drop the transmission without freeing the sk_buff.

Because nci_prop_cmd() waits synchronously for a response that will never
arrive, won't this block the probe failure path for the full 2-second
timeout?

This is a pre-existing issue, but does the teardown order in ndlc_remove()
allow work items to be re-armed after cancellation?

In ndlc_remove(), background work is cancelled before deregistration:

drivers/nfc/st-nci/ndlc.c:ndlc_remove() {
     ...
     cancel_work_sync(&ndlc->sm_work);
     st_nci_remove(ndlc->ndev);
     ...
}

However, st_nci_remove() delegates to ndlc_close(), which queues a
mode-set command. If the interface was running, this command flows to
ndlc_send(), which calls schedule_work(&ndlc->sm_work).

Could this re-arm the work item after the cancellation sync, allowing it
to outlive the device's managed memory and cause a use-after-free?

This is a pre-existing issue, but are the Secure Element timers leaking
during device removal?

The timers bwi_timer and se_active_timer are initialized in
st_nci_se_init() using managed memory, but st_nci_remove() orchestrates
teardown without ever calling the designated st_nci_se_deinit() cleanup
function:

drivers/nfc/st-nci/core.c:st_nci_remove() {
     struct st_nci_info *info = nci_get_drvdata(ndev);

     ndlc_close(info->ndlc);

     nci_unregister_device(ndev);
     nci_free_device(ndev);
}

If a timer is running when the module unbinds, could it survive the
devres cleanup and cause a use-after-free when it fires?

This is a pre-existing issue, but is there a missing cleanup step if
st_nci_se_init() fails?

In st_nci_probe(), the device is registered to the core, but if the
subsequent Secure Element initialization fails, it returns early:

drivers/nfc/st-nci/core.c:st_nci_probe() {
     ...
     r = nci_register_device(ndlc->ndev);
     if (r) {
         pr_err("Cannot register nfc device to nci core\n");
         goto err_reg_dev;
     }

     return st_nci_se_init(ndlc->ndev, se_status);
}

If st_nci_se_init() returns an error, the devres cleanup will free the
driver-private objects, but the NCI interface is never unregistered.
Would this leave a dangling interface accessible to userspace, leading
to a use-after-free?

 > +	}
 >
 >  	return r;
 >  }

[ ... ]
