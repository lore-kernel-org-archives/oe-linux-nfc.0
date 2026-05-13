Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C4138E8DA
	for <oe-linux-nfc@lists.linux.dev>; Wed, 13 May 2026 15:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686173; cv=none; b=JVtBZXQrD81JNXImb87e9VGTd6gBYTNi1PacY8xeapdwBnU2LKkmreihSwiFoP5OOPjt/ouThz7uTA4axszPlnIjNSw8hZCbiZN7uLbYA/oxkrU+/S3h/322a3dgfbht9c3xkUV+cTTmRLwpYdEqAcwifp4rlYpU8DtndhGhqiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686173; c=relaxed/simple;
	bh=M1hEq7CvxLU6On8D8G12Fmu9StcYyNPtR454jTWVVws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJr1uFTe8nI0EbBUsDsMT8QlBpdKv73VvEZ6xSDJjN+G1v7NaTzAQTq4o0XlxgRxG1+No4YApM7uJqOpKRxFNtfC9tsXw02iOCF+qUWf2vEMdQNmx2EQyyF8WIrKSMVkMP9aDxXIFs7J+9dUlukiThrFfmQx9S3PWbUac+wd1Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aS+jTbVP; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aS+jTbVP"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2b941cd869cso44162505ad.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 13 May 2026 08:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778686171; x=1779290971; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVg3X9kh4YDCRW/k5ke7n61nVYb/5/0InQTRe/5tw20=;
        b=aS+jTbVPJtQRSDwQ3rQDMZYNDTpvaZsEH4XdQ24mvFjG0+Qp95Or10DmwFkA3JeKXu
         Mfhj2EXq47SvKcbVhKWpFRkZKrp1egH+2s2+AHlRBw+mJGhAk7jFRkbqMAlg00RydJlg
         2Ii++4OZrDDbI6RYaK4yuCJm9l+RJ5iPTU94+NYvttafjmfQTIYHvj5Lk+aglCvGV2qB
         EL4zIJReF3wKymohaze8Vy51Wzmm0/ANginXmR2I8McD0lTzhR6wOmTVbTbUwL8Dx2EN
         CZy+rCjjG3aiEV2vpwDsrRYW1RwZr8NCsHvQoRTk3iUz9ZktMobphvT2/sbdmPvij9VR
         596w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686171; x=1779290971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVg3X9kh4YDCRW/k5ke7n61nVYb/5/0InQTRe/5tw20=;
        b=ouTvHYgy7YEidNQhgRWmmCBXhAF9horyRIK1gkVtBZnOOf1M72K4ZSyEnNr8oKF/9W
         I4O9X2IFOKdz4lTbVIZaMwW7NxNYJ6j4O26YKKkjsHFoAdTKawxNBebCPXsrMD8BfXjO
         TKzXzWyi/hJw6pkh6GRJMiF318qywwT2fmWYSHtI3GV7UynERVV5ha75oonacnfG4QXN
         z0PtiGcC125Czdu1yHGtdDox3z0OxiFOE5N5la/9gHRfqcgLoq31HZ0YUsfmmPh5dxEm
         du6rue6/wJZSofzOJT08TzLqwqjYH/yIR8q1FByjnNqXm/yexpbhby6rqAsW9bT0cPha
         3beQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jSeXS5lfSJABU4pOIm6QhoMqR2hdbuXxzREcG8wPl162dE9xnEleoMErEoR0B3OswC/XWmC7ENPwMmZQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtaMsaap97fcV8fR0cbILq+R5oQVqiYr+xCy/OsswkyV2E2DWD
	FmHdASM6Ui0hjD0dzL7SRyLysufHiqXIEzkjzqlYiQviktBtDEqH2Zv/
X-Gm-Gg: Acq92OHotC5JevTd3pbBKuz6jAoQHrbJ2HAveI7hb9aRXwsFq3ZxNStUhtSK9RL8+Dq
	ac5ZmuV0jnLoAnkHGsAOzw59gCbtmf1KTvevnoKaE2E4A3qhNGDj8shq3x05Ex+bkOUx87bFJ5W
	LCk150M++dTep6FBTGMS86WKe3t8RyfK2vF1Euy56aWacjQdMlwa8sQC75uYNxYTXK2i15FASZO
	WWZxT3LYakxriIxGbBxzcY4VlYjpo5TMZnjETWXB0VvzcHWn+Gt4slBhpmlWyEleH4qCifo/zG/
	UGccLZFeVTHCHY0NTWaQI7g36RXlBoiUWn01FLotgCZ9/MLp9qv/dvBwaYbdysE8aQLkArSZpMK
	z1rX7F3ckqIkXf6sNSWgJHdiMwL718KgePJDyAQfXxQ+Xsz0UqgUtZIy+2AHLtlSE83mx/OYgbl
	aLHYb7M8eplv6B5ZEM
X-Received: by 2002:a17:903:388d:b0:2ba:1c8e:256a with SMTP id d9443c01a7336-2bd30222968mr34932515ad.33.1778686170670;
        Wed, 13 May 2026 08:29:30 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5f::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ebe0e8sm182921245ad.76.2026.05.13.08.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:29:30 -0700 (PDT)
Date: Wed, 13 May 2026 08:29:29 -0700
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
Subject: Re: [PATCH net-next 1/6] atm: convert to getsockopt_iter
Message-ID: <agSYw5V5Z6Jbtjb1@devvm7509.cco0.facebook.com>
References: <20260513-getsock_four-v1-0-fe7f0e756fac@debian.org>
 <20260513-getsock_four-v1-1-fe7f0e756fac@debian.org>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-getsock_four-v1-1-fe7f0e756fac@debian.org>

On 05/13, Breno Leitao wrote:
> Convert the ATM SVC and PVC sockets, along with the shared
> vcc_getsockopt() helper, to use the new getsockopt_iter callback with
> sockopt_t.
> 
> Key changes:
> - Replace (char __user *optval, int __user *optlen) with sockopt_t *opt
> - Use opt->optlen for buffer length (input)
> - Use copy_to_iter() instead of put_user()/copy_to_user()
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
