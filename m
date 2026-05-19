Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AA93403FF
	for <oe-linux-nfc@lists.linux.dev>; Tue, 19 May 2026 14:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199745; cv=none; b=fznvG3hy+PK6aarR0ZI8kUTUBS3jA6GcELglzSuB5KWd7CB4NK3PGr/OoF/+Pp43Q7Z5LSzYxGNrNeyW+sF3MX/x7Z2c+pqfRyGLQJsU6T70FuLWVPyDJWr4Fzf3fF6W/ofg1a8D/hGUXzXCwaNejRwxjuW9RQbtESxcfMn71M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199745; c=relaxed/simple;
	bh=py1MRqKn7exNdjXsmsX1yh47Z7tsmCUTS6qgb/gwScY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8BS/o71yajdyECaKB+pDXCk5VAxplmvwKtHsE9kQjdwR1rES3Ij6398p1XDtKyjv/GADLq8xWFi/KfUINS0bipnhHumjwPvlkivNUwNmqTFnVEepiFmDfsU713MQejkuuPDRYx8jHiukvTNYvfOUvGU2PUbxEoi3RWi4tyyGYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LIaK4jwz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LIaK4jwz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779199741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ShAj6l51xuzBF/j17UKisc3z8T5wY7lSXY12qKT0nQ=;
	b=LIaK4jwzjrEHH/nlm2xSVyk1E8OGU2T0uJVpGjz6/aA0aYNedSy5EZZHkOJCWGHnDQws+B
	cfB/FqZiYiV8KQVaXJ+/pK0u3V5nA1tuwo0fm4uJg/hYPbC1ftLRDMIM56Al1i2RmwyoQW
	GYjAWILdRcp9N6/0pioZqUmlhZNcGTo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-WrJwtAMAMdeoWL0nHN6DeA-1; Tue, 19 May 2026 10:08:44 -0400
X-MC-Unique: WrJwtAMAMdeoWL0nHN6DeA-1
X-Mimecast-MFC-AGG-ID: WrJwtAMAMdeoWL0nHN6DeA_1779199723
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48fe24773c8so18812685e9.3
        for <oe-linux-nfc@lists.linux.dev>; Tue, 19 May 2026 07:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779199723; x=1779804523;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ShAj6l51xuzBF/j17UKisc3z8T5wY7lSXY12qKT0nQ=;
        b=rbadt0k+Rh6NFCxxTHOV4U0KYYAev9i1okl/L98NLEawl80eEd6l38vDTwIZMnIdDC
         NRlFjmihk1Ge2zmbgtfbBtj73NtrmKENLGsvBPy3UvjQrPG5W5wefn/8hPYkdlUVpdDH
         Psr1cO3YbP22rhKs4j9ijPvKu7M8Y8RQKV2CG+uz9xVz2x0MZcW6Zkqo97MYvZgeoMg4
         PQTIkO+LoUdfu8Kv/pmHDKiKBofAo0rpzeCY/NKLaGJCLZlff6XO/XY78K/TdPT/g/PH
         3slimzLAY+lN+I7uf0085giBJ+T1pEzRkbAwwrey05stAKHnPgYNg6ODU14QtgMYALLl
         XOuA==
X-Forwarded-Encrypted: i=1; AFNElJ9wKuRT8FCHcmChqlgvh9qnrF73A/vSlD7DObEXhrhvFwpR3PYqPqD/Cy4QLyuPsYKCyDFN5vVNCu6xWio=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk8sTu7hRL5HD3SJloe4gWHzaDDSxzwatLuPZQEZ4CzkETGq2W
	6rhzolQ8hwfjEDRLQp5fzKSXsk3L63eX3cyh+6CyMMmxjYwkJiuqXwlC26l4GbrAeStFIP2uivW
	X8EWHis1gMIo9zj3fhWpDDWTC7EfUuvvAGIsLg52yetWChRZCyNDKr7TDH18WiQl+oA==
X-Gm-Gg: Acq92OHdHO40HK/JxBBToKTWLbpz5WMPnAzt5Jpf/ZvAhLk6ymY591RCaK5TIs3j+rS
	AcMiAvwV1UCn6UfUdW5rHCFS+bahVX7QZrb1eEAWncBxh6x/lTZE6AXPjRTfob8dMASY9ojrDDh
	Y4AOLM3YlA29vR0oDXYSzHPBNQHRq7wU92HSYNe+5tsRBa17E5NaQ1BbJhoq0OQn2zwWtsG4PV6
	7CGCTqaWGbtKZiiPC7I/cadK1BUWp7p1zwOwPVML06lE0gaQrvuzVpjhwvlAepm8lHJSBse4byb
	bn3xIiklZHMZah2Nz+uAgpX97urI/+7RRG+7gJqpSrJesDkMUmZmSD+m+cbak/PN+jczgHErezp
	8jmc56u1aHd1RGjRvhogFqr2QguYPdy7uI+j6U+l7oflqnL+kDzUif7T/xT/xVXyjOg==
X-Received: by 2002:a05:600c:5304:b0:490:17da:27f8 with SMTP id 5b1f17b1804b1-49017da2830mr97673425e9.18.1779199722781;
        Tue, 19 May 2026 07:08:42 -0700 (PDT)
X-Received: by 2002:a05:600c:5304:b0:490:17da:27f8 with SMTP id 5b1f17b1804b1-49017da2830mr97672985e9.18.1779199722357;
        Tue, 19 May 2026 07:08:42 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm204874615e9.4.2026.05.19.07.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 07:08:41 -0700 (PDT)
Message-ID: <c05304bd-1c7a-486a-9929-e6947de07adb@redhat.com>
Date: Tue, 19 May 2026 16:08:39 +0200
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 7/7] tipc: convert to getsockopt_iter
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
 <20260515-getsock_four-v2-7-0d8eed952627@debian.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260515-getsock_four-v2-7-0d8eed952627@debian.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PMbJI5SPgXgSVKOn5qkpJsKq66tj9Oh0UTSE4ncNorI_1779199723
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/26 10:32 AM, Breno Leitao wrote:
> @@ -3260,7 +3260,6 @@ static int tipc_getsockopt(struct socket *sock, int lvl, int opt,
>  		break;
>  	case TIPC_CONN_TIMEOUT:
>  		value = tsk->conn_timeout;
> -		/* no need to set "res", since already 0 at this point */

Since you have to repost, there is another obsoleted comment referring
to "res" later on:

		return res;	/* "get" failed */

please strip it, too.

/P

