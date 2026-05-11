Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5A13D891D
	for <oe-linux-nfc@lists.linux.dev>; Mon, 11 May 2026 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496254; cv=none; b=qArmYlJCqKB5/nAM6QdFo5nA21ID/yElqfoIREhMMlP5aLClpT0gGB/ba17yZeDlw580xgKFVmQmypwFO8iEWz+z3Ux90SJdQzZr0Gn2EtoEUKbnt0A5W1LXMW49T0p1B34QSRir21lT1nXbBoZjdVYW/UqsNco9/7ONjZuYmAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496254; c=relaxed/simple;
	bh=kcJ9aMR022H0xLEoMibETFRjOtPHp4AblypC0I7Y8z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BdJKu3+X4+TYgc9u+mQ3/a6WpT4Mz1qSsOYFPmfkwpMSpsWnuoyy4zMw3mR+GfK+BzoBWcW6GncIVfB5T1QPBDq8l67U+mwAIoLX/jlsRG3dPT+l0JbnMelbgDazPDlv6ZTTu+Eu076PNUDPWz6POKRCVz0wCuUeLnme2ar6dhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7W0fRql; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7W0fRql"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso34775945e9.2
        for <oe-linux-nfc@lists.linux.dev>; Mon, 11 May 2026 03:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496251; x=1779101051; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcj/ah2Qr0zOfJsIJp0MzzxDrHgIa5JutYsmfmVPFZg=;
        b=a7W0fRqljyEn1q21Ufokru2VBrgnF3I02cY6/UMjqMR7p66LhEdpeWLWL+4ZLCaB63
         cZi0yqU9kC6lqNZ9qKyNdX9BobQtvaJOWwf2p7Khn9LHON6Rqy+UOeWH6ALz3sq2yj/G
         EWLrwqjzaBLwJqsgUlpWyfCR+utD9IuajNT9agv5noSsYl6ujrJwG1bMezS+zVREZXFk
         unCGVgMXzBJUF/FjNKHQ/mH/JUGB0yu++Blj7+crsEemg1YvX7mlZ3LrYoV0+XiXOWmq
         tzxRc134r/iBBU9P3AKWdB6eIViVOIQii5CJz0XFvvh+BZ38mAfEwfWJkbpKBtlDU6yc
         1zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496251; x=1779101051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcj/ah2Qr0zOfJsIJp0MzzxDrHgIa5JutYsmfmVPFZg=;
        b=VpNUm9DU7YD83gusbM3/eQBSJqCtTb50NawoetZ1hoK/BcG8+/c3KJRLUBdaHkpWxb
         RbS656TR5LhqSXueBUA35+qLDPhIHN5s6CIjRbfuJYmTf5U5nFVsZPEX06gIXQnWE1l+
         GgvFvhCwHtpb6Txh08zqgD3mYFmRQNMro0tNoThEozrKuIA6MRVUGPMPF/VMm9g6sJA8
         kEWaIwhXh25QjlLiF+OFWOmXfI6J1XVxiPx4zkTYDnoktutW1h2oO42VzJcYi+wmUaD0
         e1mVAL/j2qzeyFCw7OqeEtNLEf8hcH/nC00h7jSwXdfUu7GV3m1t7zDd1nA6n6MntgxD
         YBoA==
X-Forwarded-Encrypted: i=1; AFNElJ/RxxMlKtPgu0wmEODlx8YTkn78cNhCsstoaLv6H+yAM/3vn45jv1mg+2c9kKx2iZyUMZvW9RvxE2R7LQM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfw2QdKulzOcKTXeu+ZBgXX75T8je7W57Z4G74cXMgKzK+XO3R
	DXnAZu69Vjeu7uax3uMeDrlnqyx7kckOQQoqUjioufK7/Ugyj/8UaPHT
X-Gm-Gg: Acq92OGf0TScywj5bjYLs/LNoejW4KDmLvLgdtViESMEl1dqHcWIHbCtv8ZR6Rcve+t
	MRH8/KjwnnvYU5eIAUoO+g3BsrfVyxSOjjmf0Oy0sXeWta7MigHot4vn+nZkTxqyBmS+4kHkmVv
	mGoT/SLa66v5yRDRWwdAzmTR5Wz/sogBRWE619Nf2XRpDuk7fhUa8SzivMPNqJQEFsDbjBGK3PS
	ykHudia8cf2GmIPT7aPXCGyrfCZdgbehXeTLcgC0mmOYj4ps5L5SEM0BwY3rXLSgpitS3skyEBW
	HSWkdwwHyK0OPIMz/JdmADSq1HxzOSintR8OlWL8xjyiEctV3q/ebF1NXIlEYoyv1DP+ZKZ9MsD
	s1A0s8cRt8web791n+iIgy5iKbZrxotYgoNRaPZ043olapj41+P/HDCMT1FPbeEWEUWVBL7k8Hz
	5nuBqbsSUOx6JpNjV5vGhq7Z7w1zsPqi4s6U+dZugCGBhlmLdlKOCYDV814DyVr2K5UFhIEzZdh
	zuNN1uSCaA=
X-Received: by 2002:a05:600c:8115:b0:48a:53ea:1408 with SMTP id 5b1f17b1804b1-48e51e1804amr361769305e9.8.1778496251052;
        Mon, 11 May 2026 03:44:11 -0700 (PDT)
Received: from [192.168.50.249] (host-82-48-74-166.retail.telecomitalia.it. [82.48.74.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6fff9ab8sm186358945e9.2.2026.05.11.03.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 03:44:10 -0700 (PDT)
Message-ID: <f176bf40-a5c8-4f6f-86db-ebdbff639da9@gmail.com>
Date: Mon, 11 May 2026 12:44:09 +0200
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nfc: nxp-nci: i2c: restore IRQ trigger fallback
To: David Heidelberg <david@ixit.cz>, Carl Lee <carl.lee@amd.com>,
 netdev@vger.kernel.org, krzk@kernel.org, peter.shen@amd.com,
 colin.huang2@amd.com
Cc: linux-kernel@vger.kernel.org, oe-linux-nfc@lists.linux.dev
References: <20260311-nfc-nxp-nci-i2c-restore-irq-trigger-fallback-v1-1-9e20714411d7@amd.com>
 <824cb117-1676-4a82-b77c-8908efdffa0e@gmail.com>
 <862b37a1-a25b-49d0-902d-cbb082e2822d@ixit.cz>
Content-Language: en-US
From: Luca Stefani <luca.stefani.ge1@gmail.com>
In-Reply-To: <862b37a1-a25b-49d0-902d-cbb082e2822d@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/05/2026 12:11, David Heidelberg wrote:
> On 11/03/2026 12:08, Luca Stefani wrote:
>>
>> On 11/03/2026 10:26, Carl Lee wrote:
>>> The driver previously relied on IRQF_TRIGGER_RISING when requesting
>>> the interrupt. This was removed to rely on the trigger type provided
>>> by firmware.
>>>
>>> However, some platforms do not propagate the interrupt trigger type
>>> to the IRQ descriptor, resulting in interrupts not being triggered.
>>>
>>> Use the trigger type provided by firmware when available and fall
>>> back to the historically used rising-edge trigger otherwise.
>>>
>>> Signed-off-by: Carl Lee<carl.lee@amd.com>
>>> ---
>>>   drivers/nfc/nxp-nci/i2c.c | 11 ++++++++++-
>>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
>>> index 6a5ce8ff91f0..6339586a6a1b 100644
>>> --- a/drivers/nfc/nxp-nci/i2c.c
>>> +++ b/drivers/nfc/nxp-nci/i2c.c
>>> @@ -268,6 +268,7 @@ static int nxp_nci_i2c_probe(struct i2c_client 
>>> *client)
>>>       struct device *dev = &client->dev;
>>>       struct nxp_nci_i2c_phy *phy;
>>>       int r;
>>> +    unsigned long irqflags;
>>>       if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>>>           nfc_err(&client->dev, "Need I2C_FUNC_I2C\n");
>>> @@ -303,9 +304,17 @@ static int nxp_nci_i2c_probe(struct i2c_client 
>>> *client)
>>>       if (r < 0)
>>>           return r;
>>> +    /* Prefer the trigger type configured by firmware.
>>> +     * Some platforms do not provide it, so fall back to the
>>> +     * historically used rising-edge trigger.
>>> +     */
>>> +    irqflags = irq_get_trigger_type(client->irq);
>> Doesn't build, needs #include <linux/irq.h>
>>> +    if (!irqflags)
>>> +        irqflags = IRQF_TRIGGER_RISING;
>>> +
>>>       r = request_threaded_irq(client->irq, NULL,
>>>                    nxp_nci_i2c_irq_thread_fn,
>>> -                 IRQF_ONESHOT,
>>> +                 irqflags | IRQF_ONESHOT,
>>>                    NXP_NCI_I2C_DRIVER_NAME, phy);
>>>       if (r < 0)
>>>           nfc_err(&client->dev, "Unable to register IRQ handler\n");
>>>
>>> ---
>>> base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
>>> change-id: 
>>> 20260311-nfc-nxp-nci-i2c-restore-irq-trigger-fallback-cda942530c60
>>>
>>> Best regards,
>>
>> My ACPI NXP1001 table specifies ActiveHigh that properly gets 
>> translated into IRQF_TRIGGER_HIGH.
>
> Hello Luca,
>
> I'm looking into the issue, I wonder
> would make sense to provide ACPI quirk then?

The old driver didn't really work for me as far as I remember, so if you 
just want to fix the storm, that's fine by me, but it's more a bandaid 
than anything else.

Ideally we'd make the driver work but I didn't get much further compared 
to the diff I sent above.

>
> David
>>
>> Sadly this seems to just show the same storm as before, I played a 
>> bit with the driver and noticed that it is simply broken on my 
>> device, all I get are timeouts if I read the NCI device.
>>
>> I could get it working (reading tags) by hacking the driver a bit, 
>> first of all I disable the irq as soon as I get it, otherwise I keep 
>> getting interrupts when the device is in MODE_COLD that would end up 
>> setting hard_fault to EREMOTEIO. With that in place I re-implemented 
>> the enable/disable routine in nxp_nci_i2c_set_mode, and that seems to 
>> be enough to make it working.
>
