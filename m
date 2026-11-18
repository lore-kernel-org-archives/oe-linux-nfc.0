Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989936;
	b=p8mW8KKSdLAPI1POcwxNvxJm0HNKA52M0kNNx4e6F2xiCbRF1I2T/degLZVOZsb4JpSX
	 xZXE0sAp2Hpl6eeexppK0f7z9U/qTOb2B9NCYXEIpboqOcJVp5i3k6mOanBRkUj81nwUb
	 ncVcSGi1kBkM+fZkWp+L/l08ztalKIS11gijUjZVPIqKUg2HVoitVlJ+aSUM2on2lckv3
	 Pe2xtnTs7Ew80XaxUsKKAL/edaCENaU9nWpo2raG5KaXd3J0kuDAcMZDh44pxOt5vMd5M
	 MddeUfV+NCnZrcd7id2neJxQRIaVXE2j0oQ0GXawZMY3324vcX/393USn7cYJV0dWCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989936;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=foG+PI9Aawtfbl7gDOwnPd1zeAvUj0nauzmmOBRh9X6NYcDfz+ZLogj8DE1RbzgXKtGV
	 bYNSmLqrNmhHjn8wqpV1QfgKIGhdnDVLysdDZ/1qLBixvNzfReExZMxjXDXB9gcwY7uOO
	 lEMDhponwljUrbEj+J/JmjuwBfWG4I0Cz/h+IRnPaex3nPaZZpoBm+nFezXMiA4uD1eNX
	 RxowyVW+vzWvpR1rtIDGzzjtrPC/898NxYxmtj5XtYbzWaENhXAuS5FFPl7omGN9D2Nfr
	 cSj/g/eNs/tl7W76a+/KUr6MlIwZgWsrWD/9okUU+PjcJ5aJv23Y1thef3zgNp9Q6rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZwL/PfEF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F704606A335;
	Wed, 18 Nov 2026 08:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZwL/PfEF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45E21F000C4;
	Wed, 18 Nov 2026 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794989935;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZwL/PfEFFPWYgqPQiUhVaOPkdj2ofz5bFcHs2SMmpsuQMUNKZNorDDDs+hzTtdBua
	 FeFRWkpcfuBAV62D6ki9EDF/GOdSgY0amWIQ8QkNIx3tHYjQqqcbQQgZQJp8Dc05nX
	 xoZbSPLclt+1HtaGW4gnDbIPmO8D7u/C4lBTt7AxfjNZVEyfS5bOKTP/eGGLjuK+d5
	 yU08JDTumpMWHqrncIOUCbRFtYdndki3fYrPpRAj72+hS4atF7BePJt/cQ+qApyUGw
	 pYBKyfKpwBUvwj9cYGoYTgcqcbvj0N28QGIytZ7z+B7QPLvxwuw6xF96WMlK8N3QQM
	 Q/hvJUxP4wONA==
From: netdev-bot+sinfo@kernel.org
To: Bin Luo <luob87709@gmail.com>
Cc: oe-linux-nfc@lists.linux.dev, johan@kernel.org, david+nfc@ixit.cz,
 netdev@vger.kernel.org
Subject: Re: [PATCH v2] net/nfc: fix skb ownership on data exchange errors
Date: Wed, 18 Nov 2026 08:18:55 +0000
Message-ID: <179498993525.3291.5601341761915431183@kernel.org>
In-Reply-To: <20261118081530.32-1-luob87709@gmail.com>
References: <20261118081530.32-1-luob87709@gmail.com>
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
