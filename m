Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F53358B8
	for <oe-linux-nfc@lists.linux.dev>; Tue, 19 May 2026 14:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199471; cv=none; b=I1AZxtzF2WhC5Vv0huVkhk5c9IwQwGd/s5np1PA1zQD31VQMeggxPCdNfPeWSotFem1jJlCGQbmjE+UZIhGsc0Dnc9r4hZNNTk66LEojQmpwWC/aMDTtaVd6mljeBZoE3KYWQER+DbNVDyPtCVcT85RdPws8JDByJE/J1fjS+RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199471; c=relaxed/simple;
	bh=FMaMUKz/x8QbjfR3g5V6+iL3OxM0o0sNRaKeIldoQQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=STBTsl5qxPW8tA/+0446Ze6s307DyBXUJCU2VfWrLQLyNav3J9i0LzAu+SskUI1dP2VZDziWZ55gV2KGlGTyWxj1Wn9MgdFhsK1Z4xMomXAjvGJflG+LVDhCZ91U1InEMwCz57pQm29cDDCynaZZkMRZFL6PfNsmOO6d4dDxs+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZvGRfBnl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZvGRfBnl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779199468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JyK79IEx4ySepGt4cTN7KOjcr0GF19I7WDCAu3CkGGI=;
	b=ZvGRfBnl8lmDtNQZ7qJ4w7NMc7Ikeky4Nshpfqf546e2Vk6ploUnV0Bn8GXhonyN7xiE7F
	WQKShDGqrJ8OTsofZjdsAQScISmtw9+qRw7W+QRt9GREVpcDwfEM+LWJ4258NuXSLauZ99
	LASdyW972oZgedN+nWmZCI96kBQCC0c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-if1llBuUNki0bPCwwpiVQA-1; Tue, 19 May 2026 10:04:22 -0400
X-MC-Unique: if1llBuUNki0bPCwwpiVQA-1
X-Mimecast-MFC-AGG-ID: if1llBuUNki0bPCwwpiVQA_1779199461
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-45b7ff2140eso3180070f8f.3
        for <oe-linux-nfc@lists.linux.dev>; Tue, 19 May 2026 07:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779199456; x=1779804256;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyK79IEx4ySepGt4cTN7KOjcr0GF19I7WDCAu3CkGGI=;
        b=ClPqWVXAr505siIg901DVBD9p2wfNHpd+4mermvU5LJTnx3QbWaDMnC0HvZrez0IOQ
         edICN/N91cyXxFlLpTnyDpDcOC2Iwro1gYBcfcd9JKHGC0bPhZnCncqlP8lqBqAldLx+
         mbUEVDhj2dQX+D7XBcHXPfrvxfwwQERBgQLtfqvhxXJQELnd3w1PQ4ImzbXjJwZ+gviL
         8IJHWXMAB2fO308H2TqTvjAZ9RnKbgDq3rWlYlsS9dxm7OpqamkvHbrksw6cIjT/tKeZ
         fGSbNWOx2Qa6HDBEnfzuGR0QIVlQawXWigaS9p2REvEUejl8+eGqOQRQYNZ3MRlQNt+n
         UW8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9CvYTCPgJjNvU8NTD/rc3x4Lb4XOVA7bSVkY/9unLeYSuWxqUjPHuiK/eV48xHMJcSaQk5WVN5qi0vCnU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuGVd2DSpFuLUoONEAjz6eiTSfqPBKejUsEK7yyy6YLjVLkYha
	CxgTn759NrZHMN8RPZ5oZywPiKOpqJuy2meuToQ36z1PLWDB+DQb6lsekzATw7OSJKiQdN67t0v
	12Fo/T0wStwHfD0iBxcLyiZ5hMGeTBx5lFu/jzeziX9Gpgy8UwjCSNnTR7TsoeCTDZA==
X-Gm-Gg: Acq92OEKS1aTdWCI7DgC2gd4m5j8qpNvtAo/zg93Gx02Y+zDHVBULGBXf8rMZ61pjOv
	TJ+FRW2wRFR6SyBFcJScbVU1+bYdZansfgPbRnOfcolldxyLPP4Azf0rW4SfTuCyoRw9QAdpMGD
	0dDuaCuxYIir2Bd5Ag/tlr2tYGql7JLqhS8/ngy0p/0QLw9f+Y0xAwISoX2YgdClHaKv6WWdxZc
	07mYP9VRaOPgI+fjHvRD3RwfOFqM9X8J6fkysLSUsmcNpl5QYY05pkz+sI3ntveAw6D4nnU3I8k
	QGhC6k60yXOioU4jAxybrvthML8xYDErJn4hNDRKVbQlLS0fd3/cLp1y95cx5tk/LCpB6g42Fdn
	N7uyOUNCmH9dDl1opqvn09waZXQDIE4H459bzqkZkb+eGUfR3aB5/STM=
X-Received: by 2002:a05:600c:34cd:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-48fe61f2c03mr335533585e9.21.1779199456387;
        Tue, 19 May 2026 07:04:16 -0700 (PDT)
X-Received: by 2002:a05:600c:34cd:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-48fe61f2c03mr335532795e9.21.1779199455912;
        Tue, 19 May 2026 07:04:15 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe57943b2sm337222105e9.8.2026.05.19.07.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 07:04:15 -0700 (PDT)
Message-ID: <eada2df3-7e3f-46a5-b290-fe0e8975a1bb@redhat.com>
Date: Tue, 19 May 2026 16:04:12 +0200
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 3/7] atm: convert to getsockopt_iter
To: Breno Leitao <leitao@debian.org>, Chas Williams <3chas3@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Jon Maloy <jmaloy@redhat.com>,
 Alexandra Winter <wintera@linux.ibm.com>,
 Thorsten Winkler <twinkler@linux.ibm.com>,
 James Chapman <jchapman@katalix.com>, David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, David Heidelberg
 <david+nfc@ixit.cz>, Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-s390@vger.kernel.org,
 linux-afs@lists.infradead.org, oe-linux-nfc@lists.linux.dev,
 kernel-team@meta.com
References: <20260515-getsock_four-v2-0-0d8eed952627@debian.org>
 <20260515-getsock_four-v2-3-0d8eed952627@debian.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260515-getsock_four-v2-3-0d8eed952627@debian.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K4Ebpr6y_ODNDB93UByEqXpQi2Dt6KfugnA-hMszuhg_1779199461
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/26 10:32 AM, Breno Leitao wrote:
> @@ -797,13 +798,13 @@ int vcc_setsockopt(struct socket *sock, int level, int optname,
>  }
>  
>  int vcc_getsockopt(struct socket *sock, int level, int optname,
> -		   char __user *optval, int __user *optlen)
> +		   sockopt_t *opt)
>  {
>  	struct atm_vcc *vcc;
> +	int val;

I *think* you should use 'unsigned long' here to avoid user-visible
changes due to put_user() replacement.

/P

