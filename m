Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA2847127C
	for <oe-linux-nfc@lists.linux.dev>; Wed, 22 Jul 2026 07:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705740; cv=none; b=U8iXhjcQbjbV3Hll81ByrOyFJtsxpoCeIDMBgOX7H6UYB2J2jeW205XfPA8fbAoDv5P4PkfvP3S9d8BRWlLvnveh9heioy5DAT9s9wBg4FNOfR03/bNpw5yRmXj2C/E/fssWll2ezs0kDPDh90DcwHxz7bP68ZLiZPkw7/EOLkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705740; c=relaxed/simple;
	bh=NzaLpCbVr+WpUWdGU1r/uprVlE+cNyid29E0Cpbjtb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WI2u9/FlzP88ZWz5QOurjj5jeAvRZiuOG4vFE80QZoKk51kS9CjTiFmKUvp6ChBpd3zlpb7hvlCYMSf+APMDyalMeuuMVdkyBIzbL+0K4A1zwMdG5VVJcdl9bO9YmLZHpw4ndJQSrON6V1ac4vrgb/hdRGgzSVTe3XDpRFW58LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7GCQ7kp; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7GCQ7kp"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-80bb41f7f3cso85267357b3.2
        for <oe-linux-nfc@lists.linux.dev>; Wed, 22 Jul 2026 00:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784705734; x=1785310534; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjAn08LMgZdcLrgugv1HWMEjLz40TQ45oEq4cOcP7cI=;
        b=S7GCQ7kptyYrrYtWC3hN2WinngZY3uuVUZ4VSSsHL4MfQgmIavghb5AEYAuyNQGSlx
         3aDz2xJGkROuQErjH2or4KuPqKYu1BTmqzryVy8mqfjsHgxIYjgncVwzQuiFUX0wo42l
         t8Ndaqb9R+LY3NYa8P4NmkgaK9TqSUaTZGgTf+ZJUfuQVWPAzNWBiITR8jw5/coNqOqR
         fSLLg+6S8qggc52mOdsdQhV2nqunogll5IoftnisxmJOUpLMo5kLl/Qxm0Ce7ugA5BWK
         2Oj4ePJ7DVLPk0KZE5BX3A85NNZ9G0CAcF6pcElkrmzdGriQO0H27XNi0gDGQTYj1Dc7
         0DzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784705734; x=1785310534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MjAn08LMgZdcLrgugv1HWMEjLz40TQ45oEq4cOcP7cI=;
        b=EQa4SeP3+TceI9R+/rYrONLUCDxcB5ccgMu00rGIXjFA9omit/2loeVITmfDwSR5Pr
         fyO3PXePRntPkER6d87RFsAh6xEkyCVIh9rb8sXDTILBmkzlGmy4qzheWFCmGZNuLUJ/
         gXYrIqACFLj2qwd5RDjn8R0pLreaF5f3y0pApZGSVnT5RfCdTRuJSlwMABaUneJccdZL
         pUVgn8WLNC/ULwOkl2Mo5M5rGRhCMR3Q9JWnuuX/S2do+0GE0UCwT+rKAY2Np2/dS0Tj
         PJhvVeDp2DkiXV59IjK2m8TT9O+NLuxXcHcL2zuG6m8vxbBmaZJqY0JsVI3GBpDpCHAI
         gfdw==
X-Forwarded-Encrypted: i=1; AHgh+RpCOWbUL6l0JD62QZz/F4IdSK0vhlZOFfFmdzXJVfG5LQH++Yf7eioPviW9BAmFvRJ91lRkWKyQlP6DU+U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0oV7VpzBSXDzL++yqgixIwapAHsAigeN5IX8Qb+XtAfLiWC7g
	YvbcHxyn4Y5Eb4bLGSz9wWiq5681MCHYJt/oMnlRrsqRsdTppwm4wOjO
X-Gm-Gg: AR+sD107i9HkIBRqOxPR5++gKZOcJNg9OJIg1ZLSBpcj4XEaJOoPAm3VszZ2a/HsF43
	oyeOilpXLzYs21IkxATa316KcfRYAnyoyHIeNlgBqrvPfhOV6R+0Mwc7MsfRltmcTnz7BsDqLZL
	KqCfKFb/3UTtNh9SML+wp0qjb36sjUWIz56G0H91hUsVZVOichEU7oK7RqVzvkdGzuSAHITHixH
	QmBSYSoFEtECldl7ysHqLX7xwAs9x7ntimyGH/LqnzJ2Ab+4yqnTHsaJ6RM/T4SgwerNk4gPQVU
	KJEnorR+zK0XYflIDcHRiDZJS8Dsq+B65XlHs+dXIjjoGMKj3LFZfeCmr4pyphj2Hxa3ctzeVyM
	utlrp8BaQkRSRTtQgMCyARNN+xCb+Zf6kWhmm9oMJAeaGKo6nGyZiKVeI73LcY7lu8CA6ElcneS
	vBoL2QPYQEobC7XgCbQbeZ
X-Received: by 2002:a05:690c:7408:b0:81e:a471:e893 with SMTP id 00721157ae682-81ef23f6d0fmr69358347b3.24.1784705734677;
        Wed, 22 Jul 2026 00:35:34 -0700 (PDT)
Received: from [141.223.124.60] ([141.223.124.60])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33bf2df0sm9706647b3.6.2026.07.22.00.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 00:35:33 -0700 (PDT)
Message-ID: <f9c6bf99-28df-498e-99d2-efd7d2b303c2@gmail.com>
Date: Wed, 22 Jul 2026 16:35:29 +0900
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] nfc: llcp: race between nfc_llcp_send_ui_frame() and
 llcp_sock_bind() dereferences NULL sock->dev
To: David Heidelberg <david@ixit.cz>
Cc: krzk@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <a89d0419-8bcf-40a2-b52d-3e5d911f11da@gmail.com>
 <93f2ff92-a7d6-4521-9273-2e84fa37337d@ixit.cz>
Content-Language: en-US
From: Junwoong Doh <jdoh.kernel@gmail.com>
In-Reply-To: <93f2ff92-a7d6-4521-9273-2e84fa37337d@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/19/26 23:24, David Heidelberg wrote:
> 
> Hello Junwoong,
> 
> thank you for the report. Would you be willing to try preparing a patch against
> the NFC for-next or for-linus tree to fix the issue?

Yes, I'd be happy to.
Since this is a bug that's already in mainline, I'll base the patch on for-linus.
I'll send it by the end of the week.

Thanks,
Junwoong
