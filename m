Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792967321;
	b=CAKlFNJVhbCpxATQMmqr93pOPxMHf8qWguHJ4We+zWgpB1E40JEZWSeo+yuc1DQvEjy/
	 Vf+4QqSZqglARE8Yo49g6rWM2s/UIr+OyW86V+nhdo5CZNwLR6RJzWOpRU7JYouuwvIt4
	 OLzvgz4n8q85NKdrdBMOjbwcKOT3qiYnZeHEbJe/Jl0eH/xLp7a6++83x+SItjGD0xOXZ
	 hBXzGDivX3in6/QaSvByN34ZDrsQvY1Oows6NoDOInKfvH2kEzJzlgglevROGURuKHZ/5
	 qxerZUcIb7fL3WWpFxN5ItFxFH4S8l3uydr9bo8ZHNX33U4iQR4wcaAzkUIHnbp5oUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792967321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8L/Gu1pYNU3sPwhJxM4LxaVvBFBaLA26Mp5J8JHh3DQ=;
	b=PIJbtoZo+ZZ6ReVrAaniuOnCxKiWQi/l+eodd9CVves/XtViA9IbDMV7/TZITHHNtyAM
	 9D82FZb3vxeG5C+4JPiIkj7dTwSpj52ySB+hQZVhpmPogkA0wmV9F4bYEujo+CVmvIGS+
	 MtCfy3xUBk/nwTd1Am4/otK2BIiGjT1F1EJ2uNzzf7mqTdQdIa0icxUqdVLHaMCFZ7vZ6
	 06OE2XFlWFtKHBuCJ+NxwoS83q6qRhz6aTiM1Z21/2r/RGK5l8cqaU08cr+ZwKSFHrjbr
	 qqaFrhYvsNfntklC+IT+CFZ3R/ITBNY7tb0pPlNkOm7snn1JV6Ay3D6Uh80CEUX5VGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mn14BfxE;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E12606A31D
	for <oe-linux-nfc@lists.linux.dev>; Sun, 25 Oct 2026 22:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08E12606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mn14BfxE
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214af2076so16376815e9.0
        for <oe-linux-nfc@lists.linux.dev>; Sun, 25 Oct 2026 15:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792967319; x=1793572119; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8L/Gu1pYNU3sPwhJxM4LxaVvBFBaLA26Mp5J8JHh3DQ=;
        b=mn14BfxE0sJzHcPqEg48EfIJ4l3AtMuVRHOu6Vy/ZNN1Eb3GagXx6PIjYAfahTFQkP
         xEpFTmuS9tpydA6nd5Hl0jRxN7VZqF0EheuH8QzXZQfHz+eOcYN0vZB/k7Zz+kuAQW4P
         rjgW/+iMJtb2sWmw1MaeW+nILCMR1pFzzfrFzgYXfThacT2a3l3k+bm53X/R9by4aJPg
         3ZGQbXaRsyZIkookjXMpK/njQVYELPuguV15zZ9yZnMaZpq7VqvJ8DamCFtpJxmIAhHC
         79ixcpLlpjbtP5lkfdxdt1lRfMv/xpyryDi3aFLW3B+SUp7w2wrzLrmI2pmNmByM80T4
         m8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792967319; x=1793572119;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8L/Gu1pYNU3sPwhJxM4LxaVvBFBaLA26Mp5J8JHh3DQ=;
        b=FkMQ+04Ud/aUESeNkH9mhS5a/pd4cWrLzbI7qav0603kHxKIvvQlax4DoE4tHO9ML0
         ucqLdp8v5dzq2JC8wzMNczMGe90rGvUk+ZuvUOO9hLPkJB+U9k+Y1/T00rrvf6Av+P7A
         KtElM+ktOkwOeHkniV0xHMmzqVaTTlGNn+YqcK3JUeuSRtKwdKVHUPe+YAIRarrysFLP
         83a+n73Ml3lKeJdKor3rbqr9JZk2ALZA2QfmPYv5UeAk6dS1dYLrFdiDAWUurIT0aWEj
         4AsiMFa2kCJnaDO2Q0rbT+G7mMoPban5v8iy3VmzzyJgd7BHtrcRfjpjz74sdwiKxGz/
         aWqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGe7jwbA0FY1zCs+3a5hE2MKaqTkiFwbPfRJ6Lv8Xs6v6JIYDpnlRTRgwA6WiFYUavg3RkYTFpL/j89V8=@lists.linux.dev
X-Gm-Message-State: AFq9FYIcCN/SoC6QLv17yNw5VBdb7DPSDzbEgocY1MNDXpsMtdQJcdX3
	unHVmtT9HnWGeGkJXFT9Ypb2QjiH+c/AP00Z+YpOkOoutLTPg8/rrps=
X-Gm-Gg: AYBFou2tVJDj+2rCCsW7NPlly1Qknkapgum0LSSKSdNnYWt0ze72TXmNRXpMru1nZqU
	7xjkVDP1JDN+6Bfk6dblI0fC3Z6i63WV5Xew9s3Nkiu5kzXLV7gFBx0wm6oQu5AW9MPvHEPyvvn
	XgYPIv2e1KnbPY0LLocuVqyCqiwKQoxkG95aCG+7l1pIqh9zOl6eS6z8u7lmFNLmDS7LeGuDMHl
	y0ZO5s3e5B+Klsu0dcqf0Vqfy8qT99i5uFuROFnw5+hY0t38oyRFvIAd+MgJqmkqA98n0OusE5i
	Dgn1h6Vd12/L1ZQXCGTQyCMix9miBkrOzUzOJmm/bv2GAcfuD8MRwknjbiT0hDi+kss4yxpeAw7
	5VLJYamrGG5mMehJxvaF228u7HxvYDTyfLIAE4KtLcBneFUJgMVghvfBO0LmfpUj26s0DmgTkGt
	uD5GlCvB1rg4NPINxqQ4CWrpyG2iswBEpy3NzMRVW86OgiPW1i9Fj3X59JU3EPKtA/54sZ1785z
	NJeksMK9P/f12tnP9Y1tWyHJyyO7uwPDaNGew==
X-Received: by 2002:a05:600c:1987:b0:4a1:96cd:2f73 with SMTP id 5b1f17b1804b1-4a35ac3a777mr91598165e9.1.1792967319382;
        Sun, 25 Oct 2026 15:28:39 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a59d998sm156357385e9.15.2026.10.25.15.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 15:28:38 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: netdev-bot+sinfo@kernel.org
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linville@tuxdriver.com,
	sameo@linux.intel.com,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net] nfc: llcp: use timer_shutdown_sync to prevent timer rearm
Date: Sun, 25 Oct 2026 22:28:38 +0000
Message-ID: <20261025222838.1096455-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179278531637.3327.11947058101101849130@kernel.org>
References: <179278531637.3327.11947058101101849130@kernel.org>
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Found by manual code inspection while auditing timer lifecycle
patterns in the NFC LLCP subsystem.  The issue is theoretical --
found by reading the source, not triggered in production.
