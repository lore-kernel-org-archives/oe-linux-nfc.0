Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E966C429831
	for <oe-linux-nfc@lists.linux.dev>; Wed, 13 May 2026 15:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686222; cv=none; b=f/zi8SK/8BGREoRSQQKN8cd5weIZyRx9psxRRf8JShKNysXCihYq/jWONlSDQ+ASTBWtJjqw3hw2QHfMB7yrT9m51tHsAD6zbeMG1ZvdCXOV8jtoTuLwkwHjrpqsw9wNa2s1QJgpL6XgOhxwKJqNHV91WEcKD0RaWyzxZSJ2MOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686222; c=relaxed/simple;
	bh=Rd7C5pIyq6OPAFpxl7D+tvMh9VkGH7FniJDQxl22aEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCzrLo9mxumeT+nUCtTTGeeTGZgNYxPqtL+a4jPnDgcfEQRYDfBokA+q1XE6kT6kksducsOYeUMmfGCM2GiJL4qqdHbJTw2yX9BsUWGlhrXOrESa1nKlrHzAM/SyVnySc9IRhptfBOYv7QB3NWS7ALQensMwHiSx6U1LhGZ6LCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ba9noowi; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ba9noowi"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-8354461da74so3387457b3a.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 13 May 2026 08:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778686219; x=1779291019; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uPiUqnotsQbH12PdnNU+eakW9jTUpN3Bb+mdu+U6uUI=;
        b=ba9noowi4O8YlCqi06minhuEvQdxlWqowqSlO9gOXfP+qnO7OL7poIpuSixm4LB4wi
         pM+jUrwTXPu5bD8/n3sOM5krv5Iv34XBBX4JWXl9zR2pu5E7ae/bizCT2pO2c373+R/j
         CxeQoPEmKJaXl4RqxWkpVfJIrQQq7Plj3I3wgB7D+MU8ulaTDT2/GYfH4715zwVnCkmA
         ooh8BFQ2/gH3+IofEfwMrekBrrYLYaZkHwAfsp3hQke3vbsWkXe5Eohr1TeGN1RKsMMk
         0IgHq5con+RMLqnm+NrisEAlwzDSgBHeX9N/krWK06BZnTE2INQ0uzjMFC2POD+NFUFZ
         GAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686219; x=1779291019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPiUqnotsQbH12PdnNU+eakW9jTUpN3Bb+mdu+U6uUI=;
        b=OARFeaq5UJncx3ubqpmJJl8cvcIf4clhFrbY2/KdZIQvGrK9Qd0U4itBN1jrQd5CIe
         bRC+pX9JcFUCyoRj6r/xtKoVGH1+Ecr3rv+BFyQYG0nhrQn5iYcJT8JLeBWGsZfh++xJ
         U2nleLsSEMKRXlLnDGsGCeSuRtIR2X5lBcADQRh23YRmeHfQKTFMgWKL6T5T7z9Ih5Ww
         gYjvYJgAJJIkN9vo52zRSnpP1FONwpxQ5826CKiYENsPkyyUtXpJr9rYiQkiX095+0qV
         6jFXfjQnXkuiIEX6rjBTIHHXkkhJdHUcFGwSKCd35/CxXYqkIW6QS6f08USmLSVY0s+b
         z8Ew==
X-Forwarded-Encrypted: i=1; AFNElJ8vqnXH3vV25cHSWv94t0///8O5v57mlv8TskqKgmn3hjadhOZemsGp8GswIK6wD2vsm5lBBiArGwYhj8E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUeyiHZIt30Qf3vrvse+JFsfw5ohiKQbhfkZkBGwsZGErd6SGb
	d580ablNlAbfpqPuveXxtQXCvYIbDS/tAMihPprwZr+pejvIzkxcJPU2
X-Gm-Gg: Acq92OHQ/vhMecduizRhEZoHUd5G/rPkKHkMKxliid677g3ugGy4uJA0hFgAmsnAR6O
	1ABXC3IkILMYodIXWmx+R25mqswojq3oUAocQmB5XmlJ8HD9sXOdczaPLDDfgNuOfjvYR2fx+/e
	7hBTVg7e+vYlwm6K46Z4hMEGSHLFgZdx4hq264c7Ur7Ru3zP9sqdKKzZjss3gX/2avXdKZAqQid
	LH2SMM05haUzGQPJZ0AR478WdXHKj0/m0s9cGrzggpzDvVUdHeArR4j4oygwz9cZcLq6GnlXdql
	BotOh10PfOcQd7fhLrzFHgIuZa8pNnETiX8fhJiOp+m1Ra1hqtBkJvUDAnWMFNNjEKMO9zLORXT
	Ghjt0KGHzZ2lUELWO5Seva1dHqitrjviwWrxKKG3jImuG0DOMc2ngRPDtMuObW7aGmQrZxtgViq
	GDKfde6Z/5mdJBf5WZ
X-Received: by 2002:a05:6a00:22c7:b0:835:3730:571e with SMTP id d2e1a72fcca58-83f03e91a86mr3976162b3a.5.1778686218924;
        Wed, 13 May 2026 08:30:18 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:46::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf0cesm33281534b3a.46.2026.05.13.08.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:30:18 -0700 (PDT)
Date: Wed, 13 May 2026 08:30:17 -0700
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
Subject: Re: [PATCH net-next 2/6] xdp: convert to getsockopt_iter
Message-ID: <agSZAkPavoKMEF-K@devvm7509.cco0.facebook.com>
References: <20260513-getsock_four-v1-0-fe7f0e756fac@debian.org>
 <20260513-getsock_four-v1-2-fe7f0e756fac@debian.org>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-getsock_four-v1-2-fe7f0e756fac@debian.org>

On 05/13, Breno Leitao wrote:
> Convert XDP socket's getsockopt implementation to use the new
> getsockopt_iter callback with sockopt_t.
> 
> Key changes:
> - Replace (char __user *optval, int __user *optlen) with sockopt_t *opt
> - Use opt->optlen for buffer length (input) and returned size (output)
> - Use copy_to_iter() instead of put_user()/copy_to_user()
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
