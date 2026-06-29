Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BF63FFADA
	for <oe-linux-nfc@lists.linux.dev>; Mon, 29 Jun 2026 12:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735832; cv=none; b=MI2AM87m/7rKiccxzionYAgwqWLvU0IwvFAY5nVMGoThtySL5DvTLfIjD0LIq2fNUcPNElbdbjrQdhCZtr1KFkTPTD8uixR1HF0j4m0u3EUYKF/gmduLZxywd2SWS3IzJJi1reh6H4pCGkzlH9xxqtNIrc1MTJT8L/0u6jQctus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735832; c=relaxed/simple;
	bh=JiweOcpD2gpG/D1UI6s63Lm84Lx/AQcHh2xZgunNp4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DhG+L1VEyhOJD3RxDueG9A/mdg13XtGb8leu/uj+7r0hgi1FtTz3mXwJ8ctjuBqw31hz6fgbFSxAXWFJ9MkDI2cc/uvD13G6bGvG4woC51pxtgXiUHfqtd3JhyN6ApxEsl9Utk3v43dYV4BqpcWZHUFnfsSzDhgDe1RmLXIAUoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=TEGgoVZn; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="TEGgoVZn"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-697de335c18so6386016a12.2
        for <oe-linux-nfc@lists.linux.dev>; Mon, 29 Jun 2026 05:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1782735829; x=1783340629; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c42ikaiQsX4R+I2gt7m3Uhxc5QLT/t1/qPY6OMkStPw=;
        b=TEGgoVZnk8vSLW8IhQOv0Eo9cY7HIYGCvYbt+oVhhKfqCOgIKWEuuBXalK7qCpAYfn
         Tx4lr2h8DD6oj0CbIJ/4xR0UPt0jGriWQwNt0wUCdMPlsvzMeDHNdkWw2NB3zZNSBd9c
         qOb1glgsUcgMdJ8thZe3st1uk56GacXVGzISEOWGVUzKi7gXu1XZe9oklf+JmfstF9aJ
         S/rrq1Io0dNbo05sFFneD5f7IdA+NIHhmqCGnuPV71jxp23MAtanmwHB7Mzfb4ezjXS5
         IS2ZTRhUUpXEacp/7B7ofOjaZJplXxCLItqVg4lft1puzKhT5kOh7vJUsP8L+A4hngmZ
         MinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735829; x=1783340629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c42ikaiQsX4R+I2gt7m3Uhxc5QLT/t1/qPY6OMkStPw=;
        b=GyU5YwLUx8FpMtHRbX+ck6AZVYRjsFmcDtLIUmJn96Zg9Uv1ZE/FGTzbcyIjN6D7dn
         Fuu+bSx4+CVPm5q2M2O8rG6fHTy1WOptIrrheyVWCeC9+iGNAB+pt0ZJeXyZ3IkUb1Y5
         wsLqM2Cl6Vg+q+c0DyHIv9bJ+bSE89si755QCpq8FWnJiib6kxXzMk1ITrJiM5AMa1fD
         n5fZr0wLV+jANGxNseb9B6xBVgaLXAVpSdnLxCy1uWjaXx0VzyfBRvj4YVePZNHMmbUF
         HW1m+MPu9wUQi8LLaqVNgYTjgOhOGabvoFEj3zAQ2r4Is6k++zOSabdQbMDigFEJXO9C
         06vQ==
X-Forwarded-Encrypted: i=1; AHgh+RolbpqsulTpsTNXrS1I+eNuToEHP0ut9UALtqzp6LBJMV2EG5cLCmA3P2ns8MEyNk7yGbHM4Pv65ZcxIv8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMPo4xjuKRJEQjHk0tGtBQ0NKIBTtxTVQy4hnk8v7vq9/7urb/
	pp/0iTqwUPNLGSfm0qQcSn6v33RCuiMKh+MZAHI3CNheicgXB71VbGlG+ClFFQALh2M5
X-Gm-Gg: AfdE7cnRNkyPgdIKl4cDgjgfM7alNFFM5i+YnlTVYi6N/YnAPzvjrRgGPjoQ/Y5KWeX
	5k4V7NzxQ0DsBVNLUDB5N9GSkw0NfRPHWh8tXY+dPIC8G107yialFf1F57eB6Vc6MBYx3/dcum0
	RTi6oEbCr4sF8ydAddWk04mnspZyHCIPk730/TxOhWNAHM2hm/EpB/9HIH9fAZhRZfhkvE5Wy5n
	BIbFXLApKfSwVX0LelcSm9GuiBpq4HIDjPCalYcMWpED2AiOhFENGueNODOb5khdT+J7fVwl+RS
	pu1hOjJ8kQDm7Md/ZDEd9zJ3V3R63d0OcP7WAryn4Ss02p99nUFnYZK9TSqi13qtkB5ak+D7Uw+
	vmr0eIJxmi+U/jfAz/gO0AyS2Nvn54wrd3FzS3+fg63158Y5ZbOvIwcXJoeATmkwo/eiwdtF/Ki
	QjnXaKrl+xP/VpeUQElKsfOyPkdmvZ6uzmwhBGE+rpfe80pA==
X-Received: by 2002:a17:907:d26:b0:c12:45fc:c25 with SMTP id a640c23a62f3a-c1245fc3060mr292629466b.17.1782735828774;
        Mon, 29 Jun 2026 05:23:48 -0700 (PDT)
Received: from ?IPV6:2a06:61c2:d427:0:b321:1c7a:b072:326e? ([2a06:61c2:d427:0:b321:1c7a:b072:326e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1256c8c643sm233359466b.52.2026.06.29.05.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:23:48 -0700 (PDT)
Message-ID: <edfa1b87-a28c-40ca-85ca-e11ac3482518@bynar.io>
Date: Mon, 29 Jun 2026 13:23:45 +0100
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] nfc: nci: fix uninit-value in the RF
 discover/activated NTF handlers
To: David Heidelberg <david@ixit.cz>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260626090301.2139500-1-sam@bynar.io>
 <9f73948f-7045-4ef3-bc8c-731fde943c1e@ixit.cz>
Content-Language: en-GB
From: Sam P <sam@bynar.io>
In-Reply-To: <9f73948f-7045-4ef3-bc8c-731fde943c1e@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2026 19:41, David Heidelberg wrote:
>> Assisted-by: Bynario AI
> 
> Hello Samuel,
> 
> the fix look good, may I ask you to follow the Assisted-by syntax as requested in [1]?
> 
> Thank you
> David
> 
> [1] https://docs.kernel.org/process/coding-assistants.html

Hey David,

The :MODEL_VERSION was omitted as we use a range of different models and versions in our pipeline, making it hard to attribute to a single model/version. As for the AGENT_NAME, in this instance, would the correct syntax be to remove the spacing here (e.g. Bynario-AI)?

Once clarified, I'll submit a new patch with the correct syntax.

Thanks,
Sam


