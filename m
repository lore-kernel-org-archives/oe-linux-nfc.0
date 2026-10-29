Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297228;
	b=YusLfTNnP3vvcFfUMHhPzVPfvW9IyrNqLtaI9DnStKuc9npi5dfe5DM05OHe/+1vcUJ5
	 ZGjKOZ8UIGyvsQDcG+6aFGJXUyeEfdQVXFdQ3x4rc/Tok0sEkcxDb4tExjg3mEz45nA1p
	 KMjZC7asHOths8iDIaHO4EJ7XHmsvq2aaI7OnVbNCcXNggGDcY+oJ34yCj8VIU0apa1HC
	 JLXKAQS6ypqsYhCe36GiF+cOXAGVeNyOwKCR9/seOna4/Z5ApjdDTtCXMdGu5Xcc6ruSr
	 yOg0iyv52/MRnFzzCWHvom8ygHeicU43Ea3WXnxWcKMEtpknHGawaVJ3YT3o0gJUmuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Content-Type:MIME-Version:Content-Transfer-Encoding:From:
	 To:Cc:Subject:In-Reply-To:References:Date;
	bh=mdl2q7bYgyRiGGu1Nd8Y8m4pgXUNb+bUSGq/DaAvAic=;
	b=bbupsqjlKgsKMDWnKxaeb//4bfYUpyL+ZOmDbwkF66pp3dodelBBG8kw9hwdQeGYp3Cg
	 Fxbq5+fORMohp0UfOju4rbL1QGs881LuE1CFj11T3mUgcv4r5zFC+Uih8m0aiRP4VsO+o
	 jM+bRN8haPz76Er5utwiN1tUyTMGEUpDjmnIKywX4MbvOYXTDclQeaCVlGjNDawDvthhS
	 EPd0Q2cq8EKguN2NvAwf+uAda6GW7ZhnKJRoPDMzBZ1Ecxm8fbdBmqeANrAbp/1VvTndf
	 WcE/s3uHKLH3ZA6yMTKhj/kMNYvFcWZUmEAbR8QbvHJ8GhcUkdDOn6HGS1GdRVvdUdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6sk5SO4;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A76606A31C
	for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 18:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A76606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6sk5SO4
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1439246f8f.2
        for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 11:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793297226; x=1793902026; darn=lists.linux.dev;
        h=date:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:message-id:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mdl2q7bYgyRiGGu1Nd8Y8m4pgXUNb+bUSGq/DaAvAic=;
        b=Q6sk5SO4t1ZbJkFVMrHGKf8/Q6af+eeIIbMJrJSNwJd3L5xUaALQq2O4iHgseQ1Z8x
         IdlKsQuYwPkxzd7eRuH6d7ILcd4VfS2s0HK5lepEsDx3YRTim3rbEn2r7b4iAQpeFCgy
         SZJUMKoarJ44nMPNheN0fDTLzG+KFG2KhfQIQz+FGHtrP9kFKXilz1rXHfombnDHDgpi
         nugqW476Yl8FpHfqe633HQvrsrLHUHRcLq8SZm8x0Wf7ldhnbMsBJrPdf/Xr0IUg3J6K
         +yzK9whpygdysg7UhC2jpVE9QYO2i3d3whQwusWFcbKxZworw5CqwrV7JI3vLqdK+3Bl
         bl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297226; x=1793902026;
        h=date:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mdl2q7bYgyRiGGu1Nd8Y8m4pgXUNb+bUSGq/DaAvAic=;
        b=bJX2/GyGrRCGpLZmAO0YeDFGIPrcoEInQeGJEwBGBvixRbXScy5OhXDnDn5FPGaBXt
         qfstyrI4kBKujQw/N+dqKkU+N/U22vDuQeynjynuSvbJcu71MBDEXhQWKUK8mXSkZW8L
         nnzTSGgF2H7UrdIv507xf/ovSbIzqeIOhJCrf4ZXBSQL5CvugNgHOezq2kt/7xX4zMHT
         2qBZKXHi2H+4e4hsln00Z+nn4TwdLpaJEjgH1m/FJZJVShln4ATFbQLeqTH6uWjAyXwq
         UeChVmIuOMJ2NWwdqpi+0mssnbZKZ/H5AXIg8sFC/YLhXcIGAzu4CHcXHkZyfWVmNZba
         HV0w==
X-Forwarded-Encrypted: i=1; AKwUvByZAHR5mwdGGuwntU3NgAButBtNMLzZl+DXiq3slBuIC+/05Obotfn9BNm81tA62CWNEQ5pfuXkNCIfyBc=@lists.linux.dev
X-Gm-Message-State: AFq9FYJKZ4Sw0zAyww1veDlUo3Syu9zXNkzbggI7aI1RSzBTtERCkO52
	SM3Wu0YFdvVkpo+bzBfzBqRp8qv2iA8FGJqQnVEuN+x/M50FM7PdP3E=
X-Gm-Gg: AYBFou0v1Z86/OJvEUwEjWc1HNtiWRnabYThgpdHodhXXdUpESBi4Rna/av3DH7Qod9
	Pp1KybWzKB4tIx/P8w+RB7AG35FwWTdTisj1E70JVChnpe1/HwCapmE0eJSkTJ2QHrRuQNlHBYB
	yHMmnFdESSJXX1sGt66f5vwzmPTkI3sUIDjfKZligPxFxCxHPCAi6ydV+Cf+jxyGM/Wivluz1v8
	nPcdfoW+X9NcWXJLn08lNyTrWHO8N7bOR7DOMr3eFjpnrI3wHbYduTQskhObHhflaABoYU6ehj6
	6AWGCG+cgAPvP+A4FSVN1bZ9wag0z75hAQUHwqDLSPbIjaRKOqipy1g8OLMnWp3tPmKI/3g/NwA
	8ij74Cu1GYjMkn20pTTHTRz67qfUc1YbaRclii+JVs82hsSVXkHWPDoGPIO3uDEiWRqpP2j8yTU
	chP4Qlk1IyzY/P9oHwqalk4PQt//XzcnIqlcpYdfPMNcVARocxBSKU3bN8ytuOt/t5riqwikNxf
	JjLS5JUDaqorvW9C4X46fcUi/EioqZwmQzesNnxU6+btyuX2BzeJhRoHgQe9kXLyFFpITydoQZ9
	gg==
X-Received: by 2002:a05:6000:26c8:b0:48b:677:f80d with SMTP id ffacd0b85a97d-48e6e2ff7demr405585f8f.26.1793297225850;
        Thu, 29 Oct 2026 11:07:05 -0700 (PDT)
Received: from [127.0.1.1] ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eb8bc12sm9433f8f.34.2026.10.29.11.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:07:04 -0700 (PDT)
Message-ID: <6ae38b48.a6a2e554.2bec60.2370@mx.google.com>
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Tristan Madani <tristmd@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: David Heidelberg <david@ixit.cz>, David S. Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 John W. Linville <linville@tuxdriver.com>,
 Samuel Ortiz <sameo@linux.intel.com>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH v2 net] nfc: llcp: use disable_work_sync and
 timer_shutdown_sync in local_cleanup
In-Reply-To: <179329133392.3327.1911358623600296609@kernel.org>
References: <179329133392.3327.1911358623600296609@kernel.org>
Date: Thu, 29 Oct 2026 18:07:03 +0000

VGhlIGlzc3VlIHdhcyBmb3VuZCBieSBtYW51YWwgY29kZSBpbnNwZWN0aW9uIG9mIHRoZSBORkMg
TExDUCB0ZWFyZG93bgpwYXRoIGluIGxvY2FsX2NsZWFudXAoKS4gY2FuY2VsX3dvcmtfc3luYygp
IGRvZXMgbm90IHByZXZlbnQgdGhlIHdvcmsKZnJvbSBiZWluZyByZS1xdWV1ZWQsIGFuZCB0aW1l
cl9kZWxldGVfc3luYygpIGRvZXMgbm90IHByZXZlbnQgdGhlIHRpbWVyCmZyb20gYmVpbmcgcmUt
YXJtZWQgLS0gYm90aCBjYW4gcmFjZSB3aXRoIGFuIGluY29taW5nIExMQ1AgZnJhbWUgdGhhdApz
Y2hlZHVsZXMgdGhlbSBhZ2FpbiBhZnRlciBjYW5jZWxsYXRpb24uCgpUaGUgaXNzdWUgaXMgdGhl
b3JldGljYWwgKGZvdW5kIGJ5IGNvZGUgcmV2aWV3LCBub3QgdHJpZ2dlcmVkKSwgYnV0IHRoZQpy
YWNlIHdpbmRvdyBpcyByZWFsOiBhbnkgTExDUCBmcmFtZSBhcnJpdmluZyBiZXR3ZWVuIHRoZSBj
YW5jZWwvZGVsZXRlCmNhbGxzIGFuZCBrZnJlZShsb2NhbCkgY2FuIHJlLXF1ZXVlIHRoZSB3b3Jr
IG9yIHJlLWFybSB0aGUgdGltZXIsCmxlYWRpbmcgdG8gdGhlIGNhbGxiYWNrIHJ1bm5pbmcgYWZ0
ZXIgdGhlIGxvY2FsIHN0cnVjdHVyZSBpcyBmcmVlZC4K
