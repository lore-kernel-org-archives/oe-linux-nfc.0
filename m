Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1A2472797
	for <oe-linux-nfc@lists.linux.dev>; Wed, 13 May 2026 15:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686401; cv=none; b=Q75CXql4kMlN5BFjaOLuO8rryiht0QHWPqHDd9QxjPUWU8N1+rGwrd6nI9C/ENnBwB6+Lf/XYxToIIavyvptfMzT08+xVYzYOe8dY+kzlg8FRmqM+D2bmhGCJDdokHGAeqcOHgh53RH+FnxwIxAqmV9EdF9AUxy3TdxC6y2kCVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686401; c=relaxed/simple;
	bh=ptCC6ECWoq8NwvEdGxDOHxyoOAmU11HMhIDNaeufYn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1yVnKziLM6c03B3guss6QyDdd2xD9SIVCyW64j44XzZE6FMTHVUCNpnICHYbTA17LFmQwkkxm11eGq4HaTBhSemgeWTdj4MoKd+bgEQZAR92i/lcuAA+BtauSopGIsjvkfAKQLwYOAIs01K1hRCsGib1A8Qycr4MUc1bMgwWiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFaX9flo; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFaX9flo"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c801912c903so3267449a12.0
        for <oe-linux-nfc@lists.linux.dev>; Wed, 13 May 2026 08:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778686395; x=1779291195; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r9pfvZX6NILfeGSOJxHfBjON7lRfDPEPyL1FGEyg6nE=;
        b=AFaX9flocs8jYPkeKPec+ksaDj9xeiau+wxqF0k49TMqQN5/kOaJAo84NDxjwcBaSM
         WwdS2DSyNTpnk/ub5F+I/cR3DM6HLQIClpNCEKOW08YR+Lir4SxTYp0JFQEAXBzs5ovK
         vJ2gZqnq7EHyTteMeI1oWoOToA467LYI2qFfbksVR1UQ5JernTcArvuraiFWbKUSateS
         LVzv81OVfns+Flaim5uUXUzsxeHgzTdYOx3qjB10cDO8NksjQ419TfUN7BllxKkdVqJE
         3fmY3H8bBb8jTbbHLw5dMYUiMysrTNCO7e/efRSgtwmc7SpK0z3kKqDBSp7NlM7PY4BY
         R5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686395; x=1779291195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9pfvZX6NILfeGSOJxHfBjON7lRfDPEPyL1FGEyg6nE=;
        b=cSCcW+dRUhiEPUrrV1FHN7aM8NnKyGa6Ty8aAmD+IiUONPxuQfvUWl5vxuZrb0Hhqr
         dLTeKOvO7feueEgAZTSq+T2kWuLPtftHSwbAPooejx8OCsQxwbxl7N6HIV9iAMSOW2AL
         KQYrjOCe5JJJ02cwAO51M8r10xuLbow1RzI5dkJMQBNfAK2J/YcHDIBM/1LT/EZ/JzwF
         JdwYa0kFcnnWqh02Y2DEDTjnBMiCu1tqMlEYNXIG7qrYVtGajwrUf2Al7JwrP9i9C2Qp
         YX24Y1FOs/CvS3OzLhzbCoGNABlYYcizXD4H+bLubo20MhRGd2eW0O6atAqqT53XTvfb
         GsNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9IlzxG1Z/T60q+OxdmOO2I8hcONyVyub9+Nor8Cq2xED1NWSNyqRqJErF/rpYRkal0i0We7t4Y8DeZOU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9v6LAv1585/5gPXlIm0uXAq64Remcy5Qz1Cdj9jj16adK+yFv
	4FYurzaVohsF6QK2/LDuhlVHoPWbWxdqF3Msm3U74HlWCEAUTZXb+wX0
X-Gm-Gg: Acq92OE5yHimejKWznAI/wqciRPiGWvXiFq5PIs48ZOSB3QbEd/qcdo6ee5FfKPUdZg
	HF+KeiaI5/saiTQukSXvuE4llA5VVTcKddLcxUEIMf5Taac20SWOragYrrQNCzEfr8mXxMaOghu
	LlhJ8IAeC/6iCAaihBrymfAsHGKu5v9KnU3Gz1b55IlmabdQw7t6cg4rrzntNgraghphGqSo5S2
	GI7yG3Wz/VDXouZluTiJxZRTtK50VxvvLOOhTXKkiRtx4TpKxD/fVQqFXic8V5Ysav/QK0o2uZO
	w3ii9jGqsJx5XropmzoJ9433awKoQqMjrtQR6Uj77DeQpY+KJ27JC0fFNZkLqcVIQqylv5ZH4xl
	oJ4GAVH4jMca0k2Q/SCzms+aPxVFAnLd2s/XiulPB+G5ZA/hTgggb1EliuAxIX1qwbsq7QjPXGW
	C3JCOYOJEXnGGPuYS/
X-Received: by 2002:a05:6a21:6d8f:b0:398:6bb5:54c4 with SMTP id adf61e73a8af0-3af7ee34f61mr4503273637.5.1778686394884;
        Wed, 13 May 2026 08:33:14 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:55::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82675fb236sm15718164a12.0.2026.05.13.08.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:33:14 -0700 (PDT)
Date: Wed, 13 May 2026 08:33:13 -0700
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
Subject: Re: [PATCH net-next 5/6] rxrpc: convert to getsockopt_iter
Message-ID: <agSZsZGe_MpQzY0L@devvm7509.cco0.facebook.com>
References: <20260513-getsock_four-v1-0-fe7f0e756fac@debian.org>
 <20260513-getsock_four-v1-5-fe7f0e756fac@debian.org>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-getsock_four-v1-5-fe7f0e756fac@debian.org>

On 05/13, Breno Leitao wrote:
> Convert RxRPC socket's getsockopt implementation to use the new
> getsockopt_iter callback with sockopt_t.
> 
> Key changes:
> - Replace (char __user *optval, int __user *optlen) with sockopt_t *opt
> - Use opt->optlen for buffer length (input) and returned size (output)
> - Use copy_to_iter() instead of put_user()/copy_to_user()
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
