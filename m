Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08303FDBFC
	for <oe-linux-nfc@lists.linux.dev>; Tue, 26 May 2026 18:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820064; cv=none; b=ZQOahdTAVM1uzoLTj1FpAmu1NF/teQ6L95b0vguR3w3GH+sg1KPNodUJ68sC7K6+vaPta/0fcyymAg3VjddjKiHeQS6b+c5M+/XZMjygDPoePxQNbqBXM8b0X5AlFSiPlU5nvRnsA+6Zrl6A8YfRWzw36+aBarhFtLjamoASy4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820064; c=relaxed/simple;
	bh=qnEyiN5u94/41O9QO9WxqSZ7r8D6BDUT3NnBsTYeLmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuyxRmA8dCz/o4XARjUdGcwdosczHJH9k6cO0n02aevUvL+Z8pIQhd/3NM3JRPTYtwBAIcbdNrx5KvJL6t9V4owPpbLhPkI1008uhiu/dMTkmgWc57o63swX2V62D/Jtw951N2hx6SZXucIEVdv8zDxMvCqV3PQmvyfvPJ6E7Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d77f6092eso6242485f8f.2
        for <oe-linux-nfc@lists.linux.dev>; Tue, 26 May 2026 11:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779820060; x=1780424860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0Xjm65d4RA9kC6fH+CTvtbYudzgt6xtf0Gx9rb/6JI=;
        b=q6Q44080WPS5RRxiACWTa3qaRO8r2kRbVTpcjeV8AmfbKJySWD+3N35v7+FKiNgQmS
         VUvZQIqLWhmltvZ4TzaErMJthQQJwygbx0lM3qcf5OzJsxexxoNQXZIPs5rOc/6UVZYg
         bThTPFLdb8IaBb0t8ktW+rVPuhkDBSi+DnYKbskoNEvZn6tQWErBjAY0k/vN2h34Rltg
         oKbfamLD5FhQdYulu8+uJhxp5fUnC6fSaGI3VUsCd0pV9K+dU745j8nFNpdjcKss9b0J
         bHsDT8Sf2eb/Y3fuzxF1VBV8npkEzeNh/2rCp4XClrne8jqek9IdoWX9NCL09eAhR6Ku
         FJ1w==
X-Forwarded-Encrypted: i=1; AFNElJ9KBpMZqpPLLzQyD43BUc3dws8dZ80xqGutMot2vgpIOoBpl7Li7b2VXQZjRE19pzjsB/Ozx/7kRx7Jfqk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqAaBZLirjXoj2FeVS8EPoKWwMPw1J08K2FkSdLdcXsimtJXQW
	fywqoFdhTnp7JZJDhvsmTKvA5f49f00icFS1YObFbNPLZeN0uTaXpRWu
X-Gm-Gg: Acq92OEeDj/UwFEFQFNLlVIu+uS7cJMTdXgzjItJ5VvwJTVA07BxTjjImCe1eFGQRDq
	39IGn+dwW1P6oYFXxIFd+fuLQb7fcXC0eD4ehG/hgmPSUKawaiJua1RWBfJtlDv8a/Hit1zqYtj
	hX7hMVpuOQjRhOORCpJkzU8jvnqj5b9NkDrhAuxiygtGjyzBGQM/+Sligrj4DPeBD6miBHhNMAN
	Ddo+VHIfZsoaVi3sV8557wlPwSU2IymZviXL5o6wx6JI6JhV2Gbj64WUur097K2y7hKVL/GSRSr
	1wBn5bvh+hgPHFvKoLvkEWS6KwTGXsSxHlKSe3PMhqJ2qxuDuMM3BVmoC3kMuqmpiyUc81S9f0p
	y28w29z8rFgdkDCpmbrglxBDE4zktur8Kx94rJxqzQysZLXQamDGZd8u4/Avmd2/n8jGWq8ZIUG
	fK/Terem+9BGsEbPJaN6g8CbcWLH7oucQL5D1H
X-Received: by 2002:a05:6000:470a:b0:43d:3004:5fef with SMTP id ffacd0b85a97d-45eb367fb4dmr26397188f8f.7.1779820060171;
        Tue, 26 May 2026 11:27:40 -0700 (PDT)
Received: from gmail.com ([62.197.47.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb557545sm91361f8f.12.2026.05.26.11.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:27:39 -0700 (PDT)
Date: Tue, 26 May 2026 19:27:39 +0100
From: Breno Leitao <leitao@debian.org>
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	David Heidelberg <david+nfc@ixit.cz>, Samuel Ortiz <sameo@linux.intel.com>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	oe-linux-nfc@lists.linux.dev, kernel-team@meta.com
Subject: Re: [PATCH net v2 0/2] nfc: llcp: two fixes for nfc_llcp_getsockopt()
Message-ID: <ahXlNRH6Bzv_4_gq@gmail.com>
References: <20260521-fix_llc-v2-0-ab44cc09179c@debian.org>
 <20260526173351.GB2256768@horms.kernel.org>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526173351.GB2256768@horms.kernel.org>

Hello Simon,

On Tue, May 26, 2026 at 06:33:51PM +0000, Simon Horman wrote:
> > Changes in v2:
> > - Guard the length check against negative optlen (Simon Horman / sashiko).
> > - Add patch 2: move llcp_sock->local read inside lock_sock(sk) to close
> >   a UAF race with llcp_sock_bind() (Simon Horman / sashiko).
> > - Link to v1: https://patch.msgid.link/20260513-fix_llc-v1-1-33c76f931ff6@debian.org
> 
> Thanks for the update.
> 
> There is an AI-generated review of this patch on sashiko.dev.
> It looks like it flags pre-existing issue that doesn't directly
> impact the intent of this patch-set. So I don't believe it should delay
> progress of this patch-set.

Agree, and looking at what sashiko raised, it seems reasonable, I would
say the state check in llcp_sock_connect() is incomplete, and
llcp_sock_connect() should refuse non-LLCP_CLOSED states.

I will send an independent patch later, if we don't hear any concern
from anyone else.

Thanks for the review,
--breno
