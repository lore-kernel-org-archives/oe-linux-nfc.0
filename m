Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773311;
	b=cAqVa48y/R2GkhFST4e0YkrXLvEO+kt62A+hKukdieI8pZOS8Hz8stA7bMSru4/45dc3
	 kg3oBer9PgUMFTIUp2oSutZBSp1VroT99fVRSrWVRjr7QLyIuFaoLqJYBjpoV+S8nffYe
	 IAv8iy+zfktE7qMKZeayBu0v9q0xvdh73mZ22LplNa/fHsml0CgA3JKRRukEDM5I9l5iJ
	 WzHRiTpWONA+forE2hQb3LMFdph0ccOxg1O0c2DmR/IHsq5aPb02FSLdhgj6mNkFMNRRk
	 q9QxnKMjadiGEnHsgw40A05OI9Xh8/0v5rmDelgmqbRiUoO4CAAsrRvCsDOVmPnUPeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773311;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=eMIiVgWa+caB7/jAKtbaBsoH4Htb2ujZlHYe8MDTE+PpUxczyUZ811/4HBlVFdEQhw2A
	 nxUVHIYeTfyAfjJFosk09rUkD0hsYwibxS2S7fqwW3P36xo9WQJfA0rtfce+XnhO4uW5h
	 GEefjVMc9KbJIe1Z5sAjMhD2cCpG1u5GISSkCKGrLYmfOGpdIg2hHIOt80NI0SPWrXv/s
	 fZUSBiBZXPz2qhFgnQJ7io4EcUNrZDGcp3pAj7WUjVOBL6hgwKbytbVREgq+XtwlJgdYX
	 10kMnwZ9MWYI6VWd+a9BESY4fQsJQBbVr2d2DanfvbiYdZIOuW1fdvGWfXV+LW9FpGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PUUXU4Uh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3424A606A323;
	Sun, 15 Nov 2026 20:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PUUXU4Uh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1198A1F000C4;
	Sun, 15 Nov 2026 20:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773310;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PUUXU4UhUTpmSfuqQVtkAn3GSkXbAMz4xG9bOorX1wr9N9B4WJwx6oRylV/gqLpKn
	 Hl9llBfrG4JwE1uY65jujAOYNw14YMdT5JTc4OR/l3SbrnIPMS+I3RFD5mh0YNUnYL
	 NjOdsR0DW1EFszeLu5y1Z1IlWkvqbMHiO88o/+kOOGzm5FDf60pSHZNKRVV800igMO
	 1c8+jZP+fGQygoT7hc6eLAXEkur9zOIFeBB22MKaR7OIQEzHOqXpsTgvZ2bGOp1L6k
	 04c9e9ytrq1llwUU78fOF1njGB0XRTXEqEwq0BezEzENk51CBgOCXsFwNmYI3kdkoO
	 k4D3gPhSSPvCA==
From: netdev-bot+sinfo@kernel.org
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
 David Heidelberg <david@ixit.cz>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Thierry Escande <thierry.escande@linux.intel.com>,
 Samuel Ortiz <sameo@linux.intel.com>, Samuel Ortiz <sameo@rivosinc.com>,
 linux-kernel@vger.kernel.org, yana06070@163.com
Subject: Re: [PATCH net-next v2] NFC: digital: fix target leak after Type 1
 Tag discovery
Date: Sun, 15 Nov 2026 20:08:29 +0000
Message-ID: <179477330961.3291.17907063104926717829@kernel.org>
In-Reply-To:
 <1794705795184.22628.49502335540847234602.nfc-t1t-v2@cmss.chinamobile.com>
References:
 <1794705795184.22628.49502335540847234602.nfc-t1t-v2@cmss.chinamobile.com>
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

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
