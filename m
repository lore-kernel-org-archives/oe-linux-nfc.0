Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55D63FAE09
	for <oe-linux-nfc@lists.linux.dev>; Tue,  8 Sep 2026 16:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883981; cv=none; b=aDD88x44t8RrKXqB5fdqZJbkSiwpbpxbyY91fIFX2NDF3gNDoj05aCFc+3cqyoyhaUi4kDu0/fHsW3GOZeaIQg/SY7FHZXhHpya2Bxj+pjrxsmPYWsL919gLjmwOE0FjwS9n1tFRFfX9tzmRIOnd8pzmhvtrSYBb2b3XScWLnbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883981; c=relaxed/simple;
	bh=YAG/p2uvViRw+vxyRrhGP803cSs/AcKDMK5dMaKMeyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YLdIsxT1ZzTZog1nrgy4BIiwfSTLSh56zEotsDqCTUGuDcQquUGubt7slVeV9sEyVBCwvhjvA9FpjmicbRXXypX5T3cdRuwksAccn6pOISCnG9N66JAa4UOOE7eDKDrMm63vnOyqaF7KVI0TyDIxwoZ2nxIsSRhNUCYtbQyrXgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJLTFwTo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJLTFwTo"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b9320423cso54757295e9.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 08 Sep 2026 09:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883961; x=1789488761; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbKHtTY9KT87kFPLKh9dpqTp4nN3nypI6GpO1jaX+sE=;
        b=BJLTFwToNVJc+ePBySTTF8d5MGczrR1iupUP0RPmRG3I8j7vEDOu4wQ+WMfBmqBLkx
         t6CDwfSLpLPde4QEdM0Saa8ghC+ej+BJKDI9fVDNkU0Q05l1uVA93ZeaS36qWBFFX6fh
         rC4e4VbNtSVxodPOVaRrIQA5ILQK0lN5NtELIPwzTyKSCsDITsRTCtjPPgeVgtF93TQ5
         z5cBWv8C7KP1WKD/qotvV/yiXarjwYpwqIw/wDTJpVAg2+jfrWMoHeKgIMavni5/I5Q9
         tVcznasRlHNVrlxOjemLlSw5pWWYS3NuIB6BhDQMp51xlDX6jK+uQk+3AFY9mBtQcYEJ
         mE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883961; x=1789488761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbKHtTY9KT87kFPLKh9dpqTp4nN3nypI6GpO1jaX+sE=;
        b=dS9Jzm6b6kqsbZ5TdoKDguszSG8I0oAC7oJJiRtC6qw/WuRIFZbMUhStVpZhZhK7BD
         5OHYFV6iLjdP7rtH7tsU7d3tRNFj6aC4bRMqSW2FSpZ0zhE4ytrku73/0jaEiWZ8xa+k
         voGFfjtQtCranxtlrmeVnbcLSDhDk7f5HUV2W831Fma+lXHi17Ill8sujMkXis1uqSjJ
         x+RqQzRuCITsfW67FCxvtF+y59KvU2kwpP4blTaSMmFCMJ5XI8k8AUc/u015LzxdOhtE
         oSvLXpa102mQNCCrdnwTr+OPyQwgxeb5qjx0XHxhBAxgfVLs5PjU0AycaGxh4ToZdmDA
         TdZA==
X-Forwarded-Encrypted: i=1; AKwUvBwEA7syuNrY+0ZdD3a+b+6lmveoOKgMR/q/Iq6WjosCdNfZmhweL6Sx9ZMiF5v/lY5SRq9aWlKdctOWG8M=@lists.linux.dev
X-Gm-Message-State: AFuF++lsQLUF+qPZMJKy83SJji/zL0mDuBB7s34cKAaJXpzhkQ0PgKbe
	bBqYaxucDIYCms226d5z/hKKX9YG6hEN5mCD2z93bjAU2exOp7CU3jcW
X-Gm-Gg: AYBFou0D7NqOaieZXNbDrWOcryuWohCGX010h0uCeweQfoHC/QlyjDvuCXziQXI6Hvq
	doJDP26eiBtowDGXcrzjlZn0WQ7elUTJLSUDy0FrS+7/P/qRZcJJKg/j4vDLxQ982Q55WFfauIQ
	OtFX2PJrthrIH8Sj7GsTBB0DexURux/IxCN6H+xeKG0VPYuhU9TM/rteNlpwR2koW6cWABGFMOx
	OXw9XmAE6qxojv9jPPvAGOJiMK/eCOs3G32rydsGVlH8GO9yF0xooedQ3ITrnOcM9vqnBYHFhX/
	+Qfd/V1e2CwEwYYA4UCGoEJglJDbnp1mj59Y7aYGo15WDHI9b3lsSEb2uJ0uSWOTHipVCS8+zSb
	1ju9eu8r99GgUlT+px+8WlBK1Krx3sBln3aaGtq4mtqI5On1cdNtvVuesJyppqDbWUVLP8JMYXn
	xUQuH7xILlhgTOIlZq/bP2jE/VjNQ+t6RVFi2QMd3Be1E9mqwPi1W+wRDKVdFH3dhPh8jXJQ==
X-Received: by 2002:a05:600c:4712:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49cf8248cd3mr498749485e9.13.1788883960771;
        Tue, 08 Sep 2026 09:12:40 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883acd33sm36433502f8f.18.2026.09.08.09.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 09:12:40 -0700 (PDT)
Message-ID: <e6cfe188-c4ce-4919-bb16-9c26175e111b@gmail.com>
Date: Tue, 8 Sep 2026 19:12:38 +0300
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] nfc: llcp: fix slab-out-of-bounds reads when
 logging service names
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, david@ixit.cz, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org,
 syzbot+1e3df0852e82c21ca418@syzkaller.appspotmail.com
References: <20260905225211.596366-1-omermetekaya0@gmail.com>
 <20260906003917.627282-1-omermetekaya0@gmail.com>
 <20260908154152.GA40544@horms.kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <20260908154152.GA40544@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/8/26 18:41, Simon Horman wrote:
> On Sun, Sep 06, 2026 at 03:38:08AM +0300, Ömer Mete Kaya wrote:
>> nfc_llcp_wks_sap() and nfc_llcp_build_sdreq_tlv() pass non-null-
>> terminated strings to pr_debug() using the %s format specifier.
>> The buffers are allocated via kmemdup() or come from netlink
>> attributes and are not guaranteed to be null-terminated, causing
>> __dynamic_pr_debug() to read beyond the allocated region:
>>
>>   KASAN: slab-out-of-bounds Read in __dynamic_pr_debug
>>
>> Fix both call sites by using %.*s with the explicit length to limit
>> the output to the actual length of the string.
>>
> 
> As a patch for net, this needs a Fixes tag here
> (no blank line between it and other tags).

Sorry, I know that but I wasnt sure whether to add it since the bug
has been there since the function was introduced. I will add it in v4.
>> @@ -135,7 +135,7 @@ struct nfc_llcp_sdp_tlv *nfc_llcp_build_sdreq_tlv(u8 tid, const char *uri,
>>  {
>>  	struct nfc_llcp_sdp_tlv *sdreq;
>>  
>> -	pr_debug("uri: %s, len: %zu\n", uri, uri_len);
>> +	pr_debug("uri: %.*s, len: %zu\n", (int)uri_len, uri);
> 
> This does not compile because the trailing uri_len argument is now missing.

Sorry, I normally test-build before sending but this
one slipped through.

