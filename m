Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9D93CC7F1
	for <oe-linux-nfc@lists.linux.dev>; Thu, 25 Jun 2026 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782381883; cv=none; b=OZBUGlu3fnrZSnqF2zg4N53gfNhASrnEl4A3Qg89KgB3SBqWUQmI9LdXTgv/1Kqav5uQWyBipWcrZBMDCAJkko9T4sCRi0QI3cyGxfJfmHUVbUVRJ9tIhdrlhfofsR6PsluND50+ubgBUTb4GGm0mrgAorvgXPrCQ0P+8Zb/WoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782381883; c=relaxed/simple;
	bh=QDzsnUqwF537r9M0E1hQPClNIzZvDM04Y5WP6j505Wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GA451PGu20HHVEVzv9kmOdN/yqKjfS29LFyyRI8DWFSjCvWgAHMXzMa4hrjDk8B21G0DUfBNLhBKitYaCRmBzxNgeYf+CADglzprY1fJ3er3tduQbKIhzV/NG8fd3E6Rp3TKs/HqZw+EstcNBb8Qzw50+qpgNUve4Fet1pHGx3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=gXdrEWyc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="gXdrEWyc"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bdb3fd39045so366955466b.3
        for <oe-linux-nfc@lists.linux.dev>; Thu, 25 Jun 2026 03:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1782381880; x=1782986680; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJYAU8T0dbhlhhmhVee2XR5nvnk6dSr8CYdyAa40XFg=;
        b=gXdrEWycV/x3E7XKnkecE4TAH9TigOgI849nL3vA6/J1wLALmmCC1RQg57c174UxzR
         c+bVxPXUxPlijzbIEF9J/JJk9tJbar/wssqYwjuriN7vhfNeXuYpw7bPH9erzyvut7vo
         ZaOuc/CQapkoHR8vyZWunSbXEwr/Mo0CsLhd6nFLandvfkAHcFngreoFcChp4zMnEWtz
         q+NP1CSRDv9LJAIZPX1XgdfvSwqoyq8iwKVseSfiKru2NFbXi+CzNU0IRlgke87Pg3pC
         +NrZ45RuZMN6uBRVr2hJKXLH+j52VKlAIgKyIpj6PsedfW7AL4F/mYBFmCIaZ88DV9ef
         wTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782381880; x=1782986680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJYAU8T0dbhlhhmhVee2XR5nvnk6dSr8CYdyAa40XFg=;
        b=tHWWNP+vXXQ0eku1irgZ1N1wkjHma2joBv64XK5ICf4AP4Y0mt+1dekyccRqAyL8AK
         hIirFMLYvbAaRI578SXC623enhASEEYg8EZmbbiPwXupbK5eErIC9Vnu618utXX4FeVY
         gkut4ThlDWuLcwOVq2EDsxNzSBTv1/UCg38JcRcKW8HEQaXiP0L6hJDGWKkDBaUREVLu
         2XGZBePqZAttVdjtntbqZknyrYh0le0lEqApOwK2IehM92p8fIgHhCiUph0myEeRjYP+
         chXaCFjyHD3IUoQ6TqsG3aqKpHJxKP6yh7wXaqvOSJ0mZF7DfMHKwyzAKVEsr9foFr6W
         cThQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7GQcZTQEgPYE3kKEvgO/AUpKAahsw8ooqHydpbYGVkzPHsNiVoGg8xIgG/hz35BYq3e8oP/nHJj4f9Uk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGqaFXZS7WBmdzSUP8BidSTogbVnnOrZbm4jUPRxIpfTCnxbxx
	wIxrnvEb2yS7o/Msa4ytpI5Fd9hT7fWnqY+PGJn6bRSWI5ze6cBcCOqOm4N0s7Zs6crs
X-Gm-Gg: AfdE7ckxyCYUFBcYF+4bPGqASXC1xJ+0sG+t9lwnqdMsDAcTSmBluAoovB93wEvOTbP
	R4nv6SWpM3FTnwUYn/Hhz9CWbuc0iwy0CRr4YGL4xTVpuiM3fFpB80ibU/txQK8OgOsD3vC687A
	3W6sRr3q6E3a+ifcybx+iHMWsASusH5T2upi3mI2tuUonP+qcHbKTu1G873Z1nZK11MLXDWhJ/w
	E/LR7kQzz5GWDK4E26Iba5ASSmC0aF0QMmaI0WDZRw1n1c0/bmADoC+OPqQeTM98qLgZ4MYWlWY
	Qf8XvjFlvkF+DrcxDoedqpUD86ffUCSj5p8TfzoJRSUvQk76Vf4asc2J2evrWMhUxZIRktV5lz7
	IKsoK3GmdrOqVTCdcfV1auzUCCv3ttzCXj0sLl6FPWzl4Tkr3D9ATHYA5T0jga0aDHevSgj44ol
	CVftd5ifh7dKyKGFJFddNlpw5TOJZdLSGWZWgbmi+AkriwMQ==
X-Received: by 2002:a17:906:f5a2:b0:c0e:840a:79a3 with SMTP id a640c23a62f3a-c12061eb76dmr128400266b.52.1782381879743;
        Thu, 25 Jun 2026 03:04:39 -0700 (PDT)
Received: from ?IPV6:2a06:61c2:d427:0:b321:1c7a:b072:326e? ([2a06:61c2:d427:0:b321:1c7a:b072:326e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05cb3sm150309966b.35.2026.06.25.03.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 03:04:39 -0700 (PDT)
Message-ID: <ea447873-9222-4b75-8090-68d08e53097a@bynar.io>
Date: Thu, 25 Jun 2026 11:04:38 +0100
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] nfc: nci: fix uninit-value in the RF
 discover/activated NTF handlers
To: Simon Horman <horms@kernel.org>
Cc: david@ixit.cz, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260623234126.214667-1-sam@bynar.io>
 <20260625091828.1170615-2-horms@kernel.org>
Content-Language: en-GB
From: Sam P <sam@bynar.io>
In-Reply-To: <20260625091828.1170615-2-horms@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2026 10:18, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://netdev-ai.bots.linux.dev/sashiko/
> ---
> nfc: nci: fix uninit-value in the RF discover/activated NTF handlers
> 
> This zero-initialises the on-stack nci_rf_discover_ntf and
> nci_rf_intf_activated_ntf structs in the RF discover and interface
> activated NTF handlers so that the technology- and activation-specific
> unions read back as zero when the corresponding length fields are zero.
> 
> Link: https://lore.kernel.org/netdev/20260623172109.1105965-2-horms@kernel.org/
> 
>>   - activated: with rf_tech_specific_params_len == 0 the same union is read
>>     via nci_target_auto_activated(); with activation_params_len == 0 the
>>     activation_params union is read by nci_store_ats_nfc_iso_dep() into
>>     ndev->target_ats.
> 
> [Low]
> Does the third scenario in this paragraph match the code?
> 
> Looking at nci_store_ats_nfc_iso_dep():
> 
>      static int nci_store_ats_nfc_iso_dep(struct nci_dev *ndev,
>                           const struct nci_rf_intf_activated_ntf *ntf)
>      {
>          ndev->target_ats_len = 0;
> 
>          if (ntf->activation_params_len <= 0)
>              return NCI_STATUS_OK;
> 
>          if (ntf->activation_params.nfca_poll_iso_dep.rats_res_len > NFC_ATS_MAXSIZE) {
>          ...
> 
> The function returns NCI_STATUS_OK before any access to the
> activation_params union when activation_params_len is 0, so the union
> is not read in that case.
> 
> The sibling nci_store_general_bytes_nfc_dep() has the same early return
> on activation_params_len <= 0.
> 
> The two rf_tech_specific_params_len == 0 cases listed earlier in the
> commit message do match the code (nci_add_new_protocol() and
> nci_target_auto_activated() unconditionally pass
> &ntf.rf_tech_specific_params even when rf_tech_specific_params_len is
> 0), and the KMSAN trace quoted in the commit message only mentions the
> nci_add_new_protocol() path.
> 
> The ntf = {} change still looks correct and necessary for the
> rf_tech_specific_params union. Could the third bullet be dropped or
> adjusted so the commit message reflects only the paths that actually
> read uninitialised bytes?

Thanks for sharing the review.

This is valid feedback, I'll fix up the commit message in a v2.
