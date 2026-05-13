Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700F647D95B
	for <oe-linux-nfc@lists.linux.dev>; Wed, 13 May 2026 15:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686254; cv=none; b=vB1BV1ax03/vUrrER/GdPgrPSrIisBz8xdgcA9y2T5QEG+q16+Dbuwphb2nbB5WUE+k9fv1k7Hv+KbSADwBuxSahChYHiLv2lAWqJOkjGpyNEt5K7Zli3oq4/84+frU7JSzFMiZDQCuDKbgaScLvIJKGubuT304VmsFF0EqS1qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686254; c=relaxed/simple;
	bh=mbuD0JF9KaUEuPIUs6xAsmmDkMJ/Km6xGJoIuowhhZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEs3FfN6INkhvJiYgQEBGfNf9UV9YAIaQMD51IiJi6S9SEipCy6zZq6+SrtGV1VpYdFcEQhuBfpqU7F3nJ4S7KaDUUy3NKP9qErDRXEnM5tTsH0Mfx32l59kbdUNMh1p5646eyQ3n7aAI66LzDu5t8YNHAD2OB7Z3x+NIqPRsgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JreidFWk; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JreidFWk"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-3664df30f53so3466259a91.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 13 May 2026 08:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778686253; x=1779291053; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WEkxdb5zhixaN862xcykga1EtiV0FhFLsCrfHJvXPCk=;
        b=JreidFWkY2ikSl1KaH9AL9xuikexZbp1i8Gy+LlCq0hvo59jIvg6pWxZEQ2FsUzbmT
         ycVFRmKOKNi8Q0vZeG6fE11OimsJIMmSvoSPCu7+Pzpm9nYXod/jjAxj/JmPMM6cJ/KO
         iy51RdirCc+ERlS0PQCivxK+EkmBtxot5YpF3+2D2kD7qXVj0k8xwJY6JSahKcE4Bvfk
         Vkz3h59BPHv1kRbJfDhHWD3qj5cdhXpEbcPdcbvQTRd0kwsXuPrfI+rcHPC2NNB8SycV
         O8oCcT1MFjLZH4g0og3hEFod5Xve/u6sEmnv2EWydEd/CRxhngs6NIR+cC7iQOJHcvGE
         zF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686253; x=1779291053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEkxdb5zhixaN862xcykga1EtiV0FhFLsCrfHJvXPCk=;
        b=cuIkVbEbqcC0GzcPD+aMRtbhIpeNrAFRVcZQ9/g/T3LGtYIRkuZH9ubv7escpvnRLl
         Fv7Kd6ouU9nz8wWZzyPeN/MLqHVEgdvCjNyCwBAMr5pSAF9Gxw83rnfe2huOE6CSQj8e
         u+/A/07WzOCUkTZHvkhphwZwW9s7WTqPnAQfaAdGLxl9CVpIp8qbTYJ6WFnjgJyid9N/
         OOCDKdusmJoBo0xRdlEE7cTvIqxNCrFx697eOjqVz8imyd0+SCHEqFWBU4HdqAuUiHXq
         Po8RbndlaJNnQcGoyWY4QyrDp4fImoLTpxDPWcXfQNcR/jO7NckAN+xHFI6OC7vuP7/C
         uwMw==
X-Forwarded-Encrypted: i=1; AFNElJ+8TblLkpM3Fms4Nv25T9GVIuOU5y7t4oH/YgSIJWoHfZBE7L2pAGOXPwz+PuPA8zCqXutD4vMSNFXtdKk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkoubcUrS3aGaGmAGciRZdzqovOWBAf4XaY2EbUB4VFFgSil6A
	n3w1gkLWEq5TILZRbDInWNNaTeHMARMDVUPW4p936kOwOGtjx0uOKqj7
X-Gm-Gg: Acq92OElO07Rn16kW8XXEVZq/fTQf12ZttKdOU4ScPIdkW1xtys9vMXMleJZWyjKC5D
	t88GmEbrjI9p37xDgaZyybOYGjqzYX21cI39oSVVfIjguBoX+HL2czF3wgha5bfz2DWqfdAhsRw
	cbtuSrKd7HO94eLptpn8vkR/D0277zfgRBz+06A2+prP7jiSOiibSvJHn/pd8LutP3YBbTooP4l
	ydqkIQfqbeTjcA+ARoY2apDtrwduWMn+lbxUDaMEYPo84TamlEQzsQVPmMMF0hlPFFAqXZdRi1O
	LHZavkUoW2dfG12OP2YaUk5VuAqFm5io2vrzT5fd0zL0lgRV+id/sdOOcCeXL2Sz4V58GYk5M4T
	rlVOsQHV9R/fYHD9YGkndY1GyEBajXkypFLCpTT+EONfSvhTE02KC+dKCGSnNSC0eKpATTu7KPh
	X59h5fIsPp00Ps7iG+
X-Received: by 2002:a17:90a:f946:b0:364:e97f:64e7 with SMTP id 98e67ed59e1d1-368f3e69a23mr4490008a91.27.1778686252746;
        Wed, 13 May 2026 08:30:52 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:71::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368edf4d95bsm4782439a91.6.2026.05.13.08.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:30:52 -0700 (PDT)
Date: Wed, 13 May 2026 08:30:51 -0700
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
Subject: Re: [PATCH net-next 3/6] af_iucv: convert to getsockopt_iter
Message-ID: <agSZI50mjW_1q5ia@devvm7509.cco0.facebook.com>
References: <20260513-getsock_four-v1-0-fe7f0e756fac@debian.org>
 <20260513-getsock_four-v1-3-fe7f0e756fac@debian.org>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-getsock_four-v1-3-fe7f0e756fac@debian.org>

On 05/13, Breno Leitao wrote:
> Convert IUCV socket's getsockopt implementation to use the new
> getsockopt_iter callback with sockopt_t.
> 
> Key changes:
> - Replace (char __user *optval, int __user *optlen) with sockopt_t *opt
> - Use opt->optlen for buffer length (input) and returned size (output)
> - Use copy_to_iter() instead of put_user()/copy_to_user()
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
