Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B923E9C10
	for <oe-linux-nfc@lists.linux.dev>; Fri, 15 May 2026 20:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778877931; cv=none; b=eQriA/YryYn59qko4Jq9bl1x1/PFBkTJ/tdsiqfdRopGtz5FKyXOIti2UPA8UQAqvEckxt1IuRevmVufEZ66MN3ZYXtF7HQQzDXSxD8M5VGlkYxQbHivIGzB5Gd8agETum5oILpT/JIrbP8WxOZVL/HgHgcp8Y3ZdL7SXPbqgp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778877931; c=relaxed/simple;
	bh=jYFCW0q2oH14t/Tdq68TImEf4QAJ0L7oEU4dKSkZpjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwQkVpktDjBYaaSlbHgvF45iG+Ld5lmyfy9SSFxmma3rWxRxpv122B+tIyijZUM9fW3+n5LI9B+y8H4Xh5TshvEPdr/TUg2QXAguppv5QiS9fs38Prq/2NgwZZvgOEHNCH/mwK037Xp31Qtn33syTAxBnMivgq+vOzBtNyYRbag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Owqn6iJc; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Owqn6iJc"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-368763a1bdfso114809a91.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 15 May 2026 13:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778877929; x=1779482729; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Jp3G/+8nHauE/XI0omIm5SsO4BbcTyQ1cU6IXSGwNU=;
        b=Owqn6iJc9lEATr4yb8LXDCD8pg126lB8DdUPBx9SW97APiBuzS23w69N/+lwJixaHx
         AVm+G/THhvGHsxTR3/mUd1DAr6crSsSqC53A6F/dkBuLlSbhVVuElDPtcAOiO3gLXB+f
         muH+md7pV92NsyUW3j1zxG579o1VMQvcAQ6VYmhw2vIFik+IUASG6OPXS0c9B9RYS3tn
         768xfxm0a41CCuOuYI/NkSoyJ7S3h39jJb5dlQUkvxxB8bchRkjt1WLHcS3voWjxIwEQ
         Vi+8LoF+a2JUfkJ63+fNwV+PTq0/Is0AiM496uZbcBoRITYYUKRnUo18Yj643fOPdbNq
         3nGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778877929; x=1779482729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Jp3G/+8nHauE/XI0omIm5SsO4BbcTyQ1cU6IXSGwNU=;
        b=LLBJdxw40xG6crksZ2GzcpKEMcsHPar39F6D3jBlI+DPcGxXf8CibSLZ/v4EzW09w5
         ymxYWUQS7rcDFa2YxgXi3n3y43UZsxN8GYuE4I9CiwI+FcgYf4hpg1WlY+jMM7fPI4R0
         txOlcfoYT3ihbjZqbNaGhVtb7t4WoSNv7OK6X0z5NQ9Gw55QrWT95Rc6/veY+9KOToOT
         i4asaL5OJoXEGM4EjbuXxN3Dq3mj4aCuWFlWDOX3h6KwaFMpAiiYA6GYkZ074FalATvl
         eUQQL/nLa+f3YCuXX+n8CggXyY+ziwRQkxAoB7mkkRjDCnida5Q60G9Liaq3UJivWf+V
         KjqA==
X-Forwarded-Encrypted: i=1; AFNElJ8DB/TbjZzYIiMUNue9+QCH/Vl/3hklcglL81mXFvpmzvQViPorm+TzheMy7rzfepfhHk+5cPcSEb7sBCI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3Jkh7148wcot/C9bfltnGHmi5Obh6jKh4qlFt2lhfohAKdOX2
	leX6yQmLKSbVtyXb3W3ZkHn7c5LC9hGbOZU8IWjLQXfLakaY764/hjI5
X-Gm-Gg: Acq92OFYZxmsj9FiaD82M7umYtrXbXe49LW49wmvQqILgGRkTam97NVQcfjYSDTmQed
	CYzr6Cc5nu2uz8GFDXFvcq6LAhjVFWVo7eJgZDmsDm/WZ7/U8Pmx3DTj/bZxfmwED7uLGfHuNyc
	9EAoBQZYIgYb9p5Dpoxz83L0wxUfFDkzlGkl4tqVL+HAQ6LpQomd7cc8BruUoywxd/k4K5X1TSi
	DWjiEp5zPCB75zB4RjgYUNnHeDC4ZkTu2zED5OQgxTpmtr1rwnSCvR+ljkHUqzBVfv8Cc2k3lb8
	7kTHvf0daWee7ixv3NxoPlzGD2FteuIn5Wj58N4yoAVe8mGdfvXe1cypy6xjy1eTUHxjlPzyEsT
	Ut3XodrdfYObEDLW/clQTEBR3W3w7xDNTjs2RaqXAIbfW4NUb2bnwIueq9Zr8Z5VXBmGu5gIsp8
	IJZijNPe/C6OcI068U
X-Received: by 2002:a17:90b:1810:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-36951ca602amr5899046a91.22.1778877928785;
        Fri, 15 May 2026 13:45:28 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5f::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369703bcc91sm167683a91.3.2026.05.15.13.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 13:45:28 -0700 (PDT)
Date: Fri, 15 May 2026 13:45:27 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: Chas Williams <3chas3@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Jon Maloy <jmaloy@redhat.com>, 
	Alexandra Winter <wintera@linux.ibm.com>, Thorsten Winkler <twinkler@linux.ibm.com>, 
	James Chapman <jchapman@katalix.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, David Heidelberg <david+nfc@ixit.cz>, 
	Samuel Ortiz <sameo@linux.intel.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	linux-s390@vger.kernel.org, linux-afs@lists.infradead.org, oe-linux-nfc@lists.linux.dev, 
	kernel-team@meta.com
Subject: Re: [PATCH net-next v2 1/7] af_iucv: take socket lock around
 SO_MSGSIZE getsockopt
Message-ID: <ageFn6UV-c-pOPBW@devvm7509.cco0.facebook.com>
References: <20260515-getsock_four-v2-0-0d8eed952627@debian.org>
 <20260515-getsock_four-v2-1-0d8eed952627@debian.org>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515-getsock_four-v2-1-0d8eed952627@debian.org>

On 05/15, Breno Leitao wrote:
> Mirror the locking used by the SO_MSGLIMIT case directly above: take
> lock_sock() before reading iucv->hs_dev and dereferencing hs_dev->mtu,
> and release it afterwards. This keeps the two adjacent getsockopt arms
> consistent and matches the lock held by iucv_sock_close() when it
> clears hs_dev.
> 
> This is not an exploitable bug. iucv_sock_close() is the only writer
> of iucv->hs_dev and only runs from the protocol release callback,
> which the socket layer invokes after the last file reference drops.
> The getsockopt() syscall holds an fd reference for its entire
> duration via fdget()/fdput(), so iucv_sock_close() cannot run
> concurrently with the SO_MSGSIZE read on the same socket. There is
> no other writer of hs_dev, and the aligned pointer load cannot tear
> on any architecture Linux supports, so the existing code cannot
> observe a NULL dereference or use-after-free in practice.
> 
> The change is purely defensive: making the locking pattern uniform
> across the function avoids surprising the next reader and removes a
> foot-gun should the close path ever grow a new caller that does not
> hold the fd reference.
> 
> Note: For the reason above, it doesn't contain a "Fixes" tag, and is
> aiming at net-next instead of net.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  net/iucv/af_iucv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/net/iucv/af_iucv.c b/net/iucv/af_iucv.c
> index 72dfccd4e3d58..3dd11d7a967c8 100644
> --- a/net/iucv/af_iucv.c
> +++ b/net/iucv/af_iucv.c
> @@ -1566,9 +1566,11 @@ static int iucv_sock_getsockopt(struct socket *sock, int level, int optname,
>  	case SO_MSGSIZE:
>  		if (sk->sk_state == IUCV_OPEN)
>  			return -EBADFD;
> +		lock_sock(sk);
>  		val = (iucv->hs_dev) ? iucv->hs_dev->mtu -
>  				sizeof(struct af_iucv_trans_hdr) - ETH_HLEN :
>  				0x7fffffff;
> +		release_sock(sk);
>  		break;
>  	default:
>  		return -ENOPROTOOPT;
> 

SO_IPRMDATA_MSG also seems to be only reading the value set via setsockopt,
so maybe it's ok to just cover the whole switch with lock/unlock? (will
mirror what setsockopt does)
