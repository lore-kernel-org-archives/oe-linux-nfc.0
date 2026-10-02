Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DC04D6C4A
	for <oe-linux-nfc@lists.linux.dev>; Fri,  2 Oct 2026 18:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965616; cv=none; b=mrWQof5z4hYY2ga/MW5mIv7NE97n1QXIEpyxn1e0CDP8DQq7FanpjELmVPQeF7JjPcSgTXRDcJjVWSU1tdrSc7WVWzrgLB8aLRIdLQDGZSwb/a2a2Qd+UVM8/SgHa5v6eOBluAoJp7LxdmTMFHPE7PROhmp1i2wLhHa2jjkzuds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965616; c=relaxed/simple;
	bh=B9d/kmm3izPtvmFc11chF3VEeYuL/uSaRibIHmGk8O4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXMiMjVNRuNG1bq2dZu+a1SWoc0mIXcFk1lPH8wDq54yAOqzuMEYj9dAXDQMbqIDX+/+PkF+vZ14026OxU72pn/HZiovKrY1dQ158WMuRFLT1k4l211oneNSaKriVVpycOg9ari/BJxF55PdLht1EG9o+FwSxWBbCCY052qmdcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyzvYfRW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyzvYfRW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so1188495e9.1
        for <oe-linux-nfc@lists.linux.dev>; Fri, 02 Oct 2026 11:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790965612; x=1791570412; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tor4k7A1qPaAWjZB5/5Oa+wy8r9Vmav0GNMyiCPqDnE=;
        b=PyzvYfRWDBnlFFNUZHK8He3mhCefLbmQPrMJxZysCXm6Shsg36cxkqcKfCYWrUr4eI
         xmARzRlM2KjNpCXU+gCKTp1sro3lxwXX0M9L7577LzDuZi20xRWhG2/rQnfGFvFExXV0
         DxqLxdP/pfLwM4hFaOZHPEr+xNgcgeAwnkLbK5uLgz8HroIrMozRMowK0y8CrFHuKah3
         Yzng2JXdNcdOGf9Zog/LbonG+4u4/BfOHBF0aLtGyYomNP1Dh3e+42d5DNjS4cWmSqH2
         YMo7/8ixUY8E8oXFzEoSMzZrWMSusz6NqergxC9uBW9IkhGSWdgILayy7TYvtpxqfPws
         5djQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965612; x=1791570412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tor4k7A1qPaAWjZB5/5Oa+wy8r9Vmav0GNMyiCPqDnE=;
        b=Bzko/g2spf/3r25vxzChSf/UvCJmwWsTDY/BFYahIOmHg+bBQa3QSOQ5L/5jXl3OhA
         kPvQuyaHsPemwLSHuL4F/MPXMB2KVNvsgtJFQjIsnNyX2IDm2Dfh79Qfxg6ziUvuBTkk
         93P2XKFZbnqvZMo3yP7DXnMfkpC29IGio5mhWVeK9teJ7uMuIghQ96ODWFXbMkK8oRZ/
         kg9DT4Q8XaBK03H3WgEQxVWvt5Y1c8TfFODBSc9hH5QtVRPkss96TGAi2JDruCCR74GG
         vLzHbXMlMjtvTpODCtFmYIxReX4XStnP/ThMuJVjq6G61Us71aNZu/SBccaKvtK4mzfG
         h4qw==
X-Gm-Message-State: AFuF++nsjdgEeifX8m7mPHVgJ7XQdV57FfGEKN427M1rh5HnDkPHQBJ/
	Vu/N7haSFqkHiKoQpH+jfqvV4SjR6ZoSf6/v4JmBuQ0YorNQiQM2Ta74
X-Gm-Gg: AYBFou2HM4Lmzh+JTqMYrAHUgm9ZBAZKHUaRK3BsJ/zNyvWUZ2Wdjzisw+9uOHuCLbC
	GScwkTEDdVj5gb1SXeNG9EvrCEKq2vwTcwZjbWH+tGsQx9lR7x1AP9QogUfAyjeQRQkgr9VRwby
	pIUbYfpZwyzaqJSVDmNX7x6ZHrw+kvC3O8moKgXHMRnmJKnVy76tfcmYJR8PDHYdyRyFVuY/IgA
	BowsPMDCJ0I5QlyNdA3O2yJJIgBBkKyYoxtU+r9vnVD1JHXwPZZsdUr+77uebygjJWUVUOmo7Op
	R0fLF+WibRPXAPt9t06N918aOmJo1SRTNzx4M3iRVLiNshHmKaCUbJWGWv4Eq/6TjsltZ0uvqNT
	yDdkSxh8lPdC+2Bhx8tKjpUU9KMdGqyN4kl5tVfnzALQbZKVrcd4ErYmJarDZQyU+gkTjTc0yiH
	M3CmCOYS3sF1GDWyOKaAUbHzZIBzp8kyGykQUARJgttEOh3b2a8BHhgNseUCtUVD73Dovmammw8
	vh2fbgA
X-Received: by 2002:a05:600c:3e05:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-4a0276a0e94mr60145295e9.26.1790965612096;
        Fri, 02 Oct 2026 11:26:52 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm101502055e9.14.2026.10.02.11.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 11:26:51 -0700 (PDT)
Message-ID: <802f1969-f548-434d-8b8d-39f9df6f033e@gmail.com>
Date: Fri, 2 Oct 2026 21:26:49 +0300
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] nfc: nci: fix out-of-bounds read in
 nci_core_reset_rsp_packet()
To: netdev-bot+sinfo@kernel.org
Cc: oe-linux-nfc@lists.linux.dev, david@ixit.cz, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930224940.725976-1-omermetekaya0@gmail.com>
 <179080888379.31693.9678596349950606516@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <179080888379.31693.9678596349950606516@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/1/26 01:54, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

manual code inspection.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

theoretical/found by code inspection.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

