Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3138A2EEE71
	for <oe-linux-nfc@lists.linux.dev>; Wed, 24 Jun 2026 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782290816; cv=none; b=SViOAE//4RTn8YeUh13Q/HchvVrZBEkuC6HBLMqLoQoX//E2BtMpVez+KolR5HC4fP4qH2UDurU/lB2qL4w6EAplyWfp4XbCEUK9HQLFcj2QeOkIB7z79KdzbxLD8yHroqvd6pPYNsBrAeMwyt5hLapjpQxakz0M2K0k12X8qC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782290816; c=relaxed/simple;
	bh=JYmu2+JdkqGyZTP1oLieVZekIxSdPrIlArUvGyIdG1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZlCu2KXy3KFMt8aNg3GbLO8KUR333MU5zy2ybGYRGPanKrsQLrMeUGkHRobsOK202/AHIAGXY4H/UQugyLR5lo/LZ+SpHvIx2rICtQz/AAC5G5x8O9kUXV0i5JPsXS4cqTU+SzP9EA19OXGeQ72bQWvvAdlm405yTSxgRwJ7xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=GaJlIEp5; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="GaJlIEp5"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-697b8540279so1214072a12.0
        for <oe-linux-nfc@lists.linux.dev>; Wed, 24 Jun 2026 01:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1782290813; x=1782895613; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EVe3tCAxlFJeaGN50Dp+OHqy135nya+hifIMDSlUhLs=;
        b=GaJlIEp5qwVr2AhG/JWk+hPMO8eXiFA+30GzQUWAhiL7paa1z5TaWcpH6pcYtv/18s
         DQQ9NnVWuOWu+PCG8IdLHgGmyQGtd7l4QCWw32ai7qnlHoFitIZ6FVS+azv1sILNKC9d
         0Jt++HzvPefv6EiYAQ4rdeH/Wdd3S3i+tQmyb/4pahQsBsQLzddKINq1PKGtK1LR9dfX
         ao0f0Xrxuwm5v5tfAIyndeW1VIEYFLV/yfs4RefXkdo63sODDY2/p3+XdbtpGhIAHM9x
         vxEFDNYVJeqtKLD9YetKbijXYlXwIt0z5klVTzFy7kwbm8sblmamvuugIFsWLLmaVZ52
         SAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290813; x=1782895613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EVe3tCAxlFJeaGN50Dp+OHqy135nya+hifIMDSlUhLs=;
        b=S4W67BHhfmTi3duUTKBWdH5pe4hbinOAa2krcb+LaskLMykipIYddYHDiJ697iJ/HJ
         U1Dog5APT6zvEgyjKJCn4JXJbhoTbZsrSBAVR4rUl76cY9G0AUZPKV5WN5Vvzu+OAMNH
         xyqp+oKhSkKVg1dGZUfaqesFtDgkppF6yi5ekMcROQ3HRbH1cdDpLmOjFw0DjRxw5Vvb
         0FZhg8ufa5LPaE3YhxDSbpSbSFVXHTOv3kO8oQATM8heth+33yXrxnEezBDNTGUeXSgO
         FV5I25FBpWH6fcu179ACCFZ2B01LWgEHdF/Cs4CQOMRvYnHWr2tBga+CPKqSKLf5J0CE
         MZwg==
X-Forwarded-Encrypted: i=1; AFNElJ+STGVGHlL+sT1YMgOdrSFkJOox4kO8EaB15MYX2E3OGHH0qC7ejicP2g6NZyO19nXmFc2cts+5VjTgyrc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyR/OwYOwM9KrrnVaiusdcPN1wSSSuWvpW1tgkG7Omws5cMkovN
	G+I2u2zmbkq+4GjoD0S/24MGM0VzDPNg8OdlMt3z8mEUMoKKOrO5NU7zbEqKPqh8uwZy
X-Gm-Gg: AfdE7cnesAHM27WPXg3DiRh1hnDrUHhz2pbq7wGMKOUryVrpChLFSCI+kMkOt51OjXp
	WxtbCDQMuy8T+MWr7pKi7m15CvSEMN+ZPTuKntryMnH9dfi+W6p4GmaY0rlHPORRKnp8PhvAna8
	llm0pXV+PY9z6jaeHgMArUGb0Kf4CbA3OE+TxsyOnlvbUv4dygNA/D3RyRdVguqXFDOkPT2CNo5
	st0qqdB5Vo1AWsIgZLagdfCt+iT8uLwkz2zABQLlxNYMax2CIfbMRMg6naREdk3qfxcbkDpMd7f
	7PfCNAltWvQWjqXElsdAnDVJznVsL2WAQRShQImgoC54zoBzP3ZxAdzUrF1guH2x6bKIt8Nypa8
	vb6uRfDdW5UAlPb0eDxyVeIe9FQQBEb1dQvvBBAZVmGaKtXHVxWnekdOoWi43NJuMuN1mXKV5AH
	QSsmX6TyaR9cvGhKZq90B36IiBWB6VUvdGnlgJoWaV2NDuSg==
X-Received: by 2002:a17:907:a392:b0:c08:417e:3696 with SMTP id a640c23a62f3a-c107d7137b7mr319688366b.20.1782290812994;
        Wed, 24 Jun 2026 01:46:52 -0700 (PDT)
Received: from ?IPV6:2a06:61c2:d427:0:b321:1c7a:b072:326e? ([2a06:61c2:d427:0:b321:1c7a:b072:326e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c61610b2esm640641866b.57.2026.06.24.01.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 01:46:52 -0700 (PDT)
Message-ID: <c9abc633-239c-4562-b1df-5c9d687e70d4@bynar.io>
Date: Wed, 24 Jun 2026 09:46:51 +0100
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot ci] Re: nfc: nci: fix uninit-value in
 nci_core_init_rsp_packet()
To: syzbot ci <syzbot+cie92d4e0088e1c4d0@syzkaller.appspotmail.com>,
 davem@davemloft.net, david@ixit.cz, edumazet@google.com, horms@kernel.org,
 kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 oe-linux-nfc@lists.linux.dev, pabeni@redhat.com, stable@vger.kernel.org
Cc: syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
References: <6a3b838b.c358b6d0.89040.0007.GAE@google.com>
Content-Language: en-GB
From: Sam P <sam@bynar.io>
In-Reply-To: <6a3b838b.c358b6d0.89040.0007.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2026 09:13, syzbot ci wrote:
> syzbot ci has tested the following series
> 
> [v1] nfc: nci: fix uninit-value in nci_core_init_rsp_packet()
> https://lore.kernel.org/all/20260623222402.175798-1-sam@bynar.io
> * [PATCH net] nfc: nci: fix uninit-value in nci_core_init_rsp_packet()
> 
> and found the following issue:
> UBSAN: array-index-out-of-bounds in nci_init_complete_req
> 
> Full report is available here:
> https://ci.syzbot.org/series/2a9a8657-37a3-4dce-8cb5-2035027791dd

Oops, looks like this patch did indeed introduce a regression due to bad
check ordering. I have a v2 prepared, tested against the syzbot repro and
NCI selftest which I will submit after the ~24h patch resend period is up.

Thanks,
Sam

