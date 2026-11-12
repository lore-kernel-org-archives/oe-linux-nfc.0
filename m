Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450238;
	b=BJIwuCd0BGxL4Sy2VOS7njqTOo4Z2LS7u54xXPTkq2ruYS9iRq/Yk5xGfudp9BsRWDT/
	 MY5wVkslJkcKMXvwuBT2sWFCjL9jC2s/s4P/eCLbdNU0IkfJxqliEh90KgjNmMhCZjKeb
	 8Msob4Sx6Z5RKY4ua2GX4i/LWrtKNBPu8a4SPk/MCB3/7VkXWhTY+dl7Gv6lowxb+GHRd
	 G3aUVazCVy6yBlGw0Z9QxC+/KgcFqnJlBR7loqIZ8LBfYZtLXquZvAuF7fvTMhndfKAGD
	 gUGmYvxK5i56DRXsBhKiHuGxt13gu7qUA8cR5J2KIVC0ATOG3qCwIwoziSUEoyptTmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450238;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=CMs2hiL6dqSvXmpMCUhFT/HCLWI00jj+E7D9u8d37HY=;
	b=dixnW/76B48jbQvdHKVE0XHcfU1x5SAp/FRppPWSGOO8PFOPigVIrrNiIC2Wpcrwvd+U
	 E1cQyr7hGF+Ca0+Y3Dz33AvD4m4spPLT4fvX21+KJjG+MIFXNEYx/nHcOegVNP40b5vE7
	 2JpsRolkPYi8yXebvEPxkagXCTDyYkVY/B0con/3sNJ0eAIJS2ekSLuDuVIEDZ6n9RXWO
	 zsJoHdfGiNPcc2qdjOh+GeBeIm3fkYv3D4P36S0L3Fe+dvr/70qThxX8HJSxxXDaQy/dw
	 FYVzxeVsbY7AdqZ3by1tQh8vwydqh3kAXq3bevQrHNPwoeSNiD+mR5z+8b/C41lOGyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=ECBexlUT;
	arc=none smtp.remote-ip=220.197.31.8
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B99F606A31C
	for <oe-linux-nfc@lists.linux.dev>; Thu, 12 Nov 2026 02:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B99F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=ECBexlUT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=CMs2hiL6dqSvXmpMCUhFT/HCLWI00jj+E7D9u8d37HY=;
	b=ECBexlUTfMcU0TzeyeHJyBObIRgfVHH9ZR0gINCJCnsug2Cp4UNT/iEyM7AELu
	++HPY/30SbDlpzGBbsnCLK4KAb/5NJYdGt6RNWEHhBFBsd/UnQhfg1jRwcd5pCMN
	5bh6cJCv+0izBRSJr1M5OXFEgLIc2hTdKBEyTIWfsXgQw=
Message-ID: <3b2e263b-6cef-4267-be94-50751dfee494@126.com>
Date: Thu, 12 Nov 2026 10:23:18 +0800
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] nfc: llcp: fix SNL PDU size truncation in
 nfc_llcp_allocate_snl()
To: netdev-bot+sinfo@kernel.org
Cc: david@ixit.cz, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linkui Xiao <xiaolinkui@kylinos.cn>, Guikun Yang <yangguikun19@qq.com>,
 stable@vger.kernel.org
References: <20261111095907.3366028-1-xiaolinkui@126.com>
 <179439136381.2168702.3784011162899965365@kernel.org>
Content-Language: en-US
From: Linkui Xiao <xiaolinkui@126.com>
In-Reply-To: <179439136381.2168702.3784011162899965365@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD33x8WI_VqBr_FDA--.30825S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr4DuF1DJr4DWrWfXFy5Jwb_yoW8WF4Dpa
	yjgrsYy3Z5Jr1xCa18ta1jva4Fq395GFy5Wr45Kr1Y9as8WF1UKrWIgr4Y9a4q9r9Ygw1F
	vr42grs2yw1qvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UZZ2-UUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBlBjmvWr1IxjZqwAA3B

Hi,

Thanks for the reminder.

On 2026/11/11 18:02, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by LLM and not proven at runtime). If it was triggered
>     please include the symptoms, like the stack trace or kernel messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

This patch is a fix for the issue previously reported here:

Link: 
https://lore.kernel.org/netdev/tencent_634C55A23C7CCCA3985283BFED46A69C9E09@qq.com/

The commit message already includes:

Reported-by: Guikun Yang <yangguikun19@qq.com>
Link: 
https://lore.kernel.org/netdev/tencent_634C55A23C7CCCA3985283BFED46A69C9E09@qq.com/

To clarify: I did not reproduce this issue at runtime in my testing.
The problem was identified by code review/static analysis of
nfc_llcp_allocate_snl(), where the SNL PDU size can be truncated.
So this is a code-review/static-analysis finding rather than a
runtime-triggered crash in my environment.

Please let me know if further information is needed. As requested,
I will not repost the series just to add this clarification.

Thanks,
Linkui

