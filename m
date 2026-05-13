Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEFE30675A
	for <oe-linux-nfc@lists.linux.dev>; Wed, 13 May 2026 15:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686488; cv=none; b=ZAvf2H46cPmQbWGWPDIRcDtVhZEZfmyU42yZ0X3LmGGr0rsFVPh/zZ51VEc11weZgUpwvGHb46ba9xomkWT3rfCz3yPBiGl8aW1rQES/67+KYr1hfRdC0hcJJzWkUWr/FCG2DUczdXFLTt0HpeSTiZ5AgZ59Tca6/aBEMW3SP8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686488; c=relaxed/simple;
	bh=juof8ClPWBcdbohM1aei0MyS3Zb/FxQ4cYPoANkh300=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLZHhRnztV3Ihg0LYEKJrUAjnscCYkBoF4g5F2eaXleIiGLLMRmSmWJd9yaWlTAJ9K010Sa3ZiugS5XMw/Tl6MBrA/bRXWnNtKkGgvcCtq8iui3vVR5CxYJLUsARkJ6tFX/0EZmkVYgJ0+ys6vMvcoFopnm0zd7IxsoNd0zVjmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AT+Lgcki; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AT+Lgcki"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2bc7b311e77so18586865ad.0
        for <oe-linux-nfc@lists.linux.dev>; Wed, 13 May 2026 08:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778686484; x=1779291284; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sULJalq8qpR0SDmRCBfWcTtKyEat46ygMheSeQ0h0XQ=;
        b=AT+Lgcki9dzPLbMRdayNibZU7mhd3fzrYGYSA9tdU5rvIo/OjFlK4hhaDrvsuPtW8Z
         /GEjJ6h66TqImNsRyq3SK5RGzFZvkXCkAEREgaPvfgmnvIKMfTR4MucGQO9dD5roBuCN
         QkIPFKrcQwSH/I+4zG/l406G3cU6h5kk5zbHxXv8PaY8XGrwfcBzb8UoBYGIUIQEcXUj
         UZn59XgZMn0CHBKGld9mkPIWPG01yNaYSGxL7OQtbECIlKaJZ9+GadOIh6av80AUCpQC
         dmvCJQqrYW6V0m5U0618NrfCgq7mT4hFOo/hRqmNLW+imbHQFuvrRA3VNOuLBUu+xibu
         YapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686484; x=1779291284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sULJalq8qpR0SDmRCBfWcTtKyEat46ygMheSeQ0h0XQ=;
        b=IL0SLAg3bPfSD0Oo8Poto9yeBEzx9tqK3jAoQkOKSxCr1kLXx8sEwhhMdKUMHu7NBf
         Uc97mRO84ai1qQVMFIO6wv/VLyLzIZQ4iiva4GHiUdFK/ANiiHdNM1Hk82y07oGMtq3M
         TlsoZchPFyNdIXjdzEXctCq/WleiYcQ8lj9YeLiomASU5CQqJPCbEwrCYwgKCXovzH52
         AAHQz4i7el6u6Yzvz1VxIdB1HqMMFrYquLv6p2Q1DJZEPhcsiklRGl7MT2GoubwYqd0P
         0S61/xXBl3mzhbAKTQvokNtAf4fIVHYGP9fdSifpbY+WTi6B+K3fkyNeVAEtIr8rdibj
         nwAg==
X-Forwarded-Encrypted: i=1; AFNElJ/j3Y0mH+reEWAyIqphodSVL3DZl0bZ2bgtyJybK1GtDais9aHQKw14NVZr730bjrcoK1FwgyaPTIXJ71c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAQuIrbq9iZfdluJYYwitlASVizIYMNOkx2Z80zz/uoOGvBGic
	FffBV4c4xD4jxobI7lVkjDKiS4kR71UnWng0WHQABRu1nGeki2mslADz
X-Gm-Gg: Acq92OHI4AsM7MVAAGlvR+F2wtjonUXWp4WKdI2Aa/5OiYX0T3QyPu/fIe6Xo2pBiag
	jUgR8SyV0bsw9qa8avq9Cqs80/6Sfpzf4OMfkpwHZVYpzr51PFfwYfT8aWD7RpZLFvKwVNDetI8
	SXEsBWQ5Tiy/hY9zzHDSdXCBeaKsybmTeA9fVxrC/VX4sNBBWCwriSonouKpv8lxnZcUAntixro
	YT3Fh16kPow2p7FWcSSr1PtK6Q7gBKVCP1tr0Ra3pmoWsr2CUaGPeE0vTCdt3UjSGW4CSRuk2+R
	ro6aYbFwB50qjsGBQVTCsvYP+4ldiya15zkhVUtI3NSTgZirzx/NZ0+TKUPgQhflxYHFG0NU8e3
	8zpQIL8ihG54TvbeS9gS1P4rOAq93b3PENjxsl+H+O2jSuh81WIskY8TgZXRTcQAvjSeDc2NLwv
	ju7xZNBuVGy+8hpJyA
X-Received: by 2002:a17:903:1aef:b0:2b9:cabe:ce37 with SMTP id d9443c01a7336-2bd526ce2dfmr298035ad.1.1778686484215;
        Wed, 13 May 2026 08:34:44 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4e::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ebea72sm174932375ad.77.2026.05.13.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:34:43 -0700 (PDT)
Date: Wed, 13 May 2026 08:34:43 -0700
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
Subject: Re: [PATCH net-next 6/6] tipc: convert to getsockopt_iter
Message-ID: <agSaDOAx1HBSDoCQ@devvm7509.cco0.facebook.com>
References: <20260513-getsock_four-v1-0-fe7f0e756fac@debian.org>
 <20260513-getsock_four-v1-6-fe7f0e756fac@debian.org>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-getsock_four-v1-6-fe7f0e756fac@debian.org>

On 05/13, Breno Leitao wrote:
> Convert TIPC sockets (msg, packet, stream proto_ops) to use the new
> getsockopt_iter callback with sockopt_t.
> 
> Key changes:
> - Replace (char __user *optval, int __user *optlen) with sockopt_t *sopt
> - Use sopt->optlen for buffer length (input) and returned size (output)
> - Use copy_to_iter() instead of put_user()/copy_to_user()
> 
> The sockopt_t parameter is named sopt to avoid collision with the
> existing optname parameter named opt.
> 
> Note: Dropped the unnecessary parentheses to make checkpatch happier.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
