Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675352;
	b=N8tDJ2NdXwCrkcrdNkn8h/Zc1O3/RELCxdzHb+LF3O0Qd176LhWF5mHuHjcWQ1HXz3P1
	 GhCfT1qPkZlCdWnrFl5NMQZXktnR4lR7i8lwSjxNyO6Uc0p+b5j3bMVMD9LuMxbaUWHeo
	 aXvq9Su8sJG1e4XvzWG/l7Tw75Zi5kEwEsiiT7gniLmxiiLdI/T05jBzqG6wxnyyxFUQk
	 T+4anQ3D3O0H3yJNU7s83KeCk0PqZFz0p4GDMlNNDr043EQq6GU8BJkreRD7McOKGr6Bp
	 C/cl3F/PEIgCjlZ49/kI3x6QTl3hywkqwEBGEohVbsOSJRIKBQdX9moVrIZQ0/i9dNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675352;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=Nr7sUjRmnuj8eV3Jj6/nTzERMRUv0dXcCtfxoD0qSGiemmwXAmFDir4gQxfh9T99vD/h
	 iIMCsfVQi5h+XLtBfapAc6fRSQBPddRedoYASdvAVnUZU7jPTioHnGD4ciV0Lpm5Hxnvt
	 hmdgYhptM8pQj8AkXdqXjVwxYhpGeMEdsQ0zZJbN0XdlaBKbEeS94nAE5o+xGTIZvWEdr
	 CZoGEeq4H1G9E0WGKGuidSmQTPJW9ygEZ6G6wN0xEEn3/hY3synjYuwf+Glr27yVppmQV
	 dy6mgestBjNrS5jU5Y8k3zP7o4NIGb+Hx8A3jHwKj925UoZ21gUvHZWLCIhRODGs3ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lpjVWvCm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D886606A31C;
	Thu, 26 Nov 2026 06:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lpjVWvCm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A671F000CA;
	Thu, 26 Nov 2026 06:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795675352;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lpjVWvCmR/pdUj3UcTmpnaMjZJPx9zHnpYzS44mq04xAdOFevzpvZxp5fwh/1/SSk
	 lz5m/72mvvAAxBkoUCuo0+EUvlycr/ULDCqvyGBbCt+XjFlGqKWbaLUsfsz2ZFjFpS
	 79g96jNWaSPSo/s6KAp/cnd36V3KdPxU4W5JiInjh1jnQOD+OU7nLEVOp3r5mZtGby
	 0DrYVU7LdjjjMFsWQsCR/3yWsHcxPEr1wbTcqF/JX5epPUHvVE98VPSAN55Oi3PFzJ
	 YBcLqiiphRA22UNED3gCk2kzSkoSfpUFIPCSi+0v3EcGzhnB14rakKzfJMVdPRD9dh
	 hv3tMWu7/QYcg==
From: netdev-bot+sinfo@kernel.org
To: "Bin Luo (University of Electronic Science and Technology of China)"
 <luob87709@gmail.com>
Cc: oe-linux-nfc@lists.linux.dev, johan@kernel.org, david@ixit.cz,
 kuba@kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4 0/2] net/nfc: fix skb ownership and NCI status errors
Date: Thu, 26 Nov 2026 06:42:31 +0000
Message-ID: <179567535125.3294.7232513374147715442@kernel.org>
In-Reply-To: <20261126063911.353-1-luob87709@gmail.com>
References: <20261126063911.353-1-luob87709@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
