Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989916;
	b=wlyOvLhSwXWgMegy84EYCDrvTZiiLcLPsdKYBxcexn93QoP+fGqCSZVJt8ZdhKDPA1RR
	 JNwx2HxaQ4dCi5GIzuuZ31kphVdkR04hliyB9JF8FjlZLvlIXe113SqMIxNZK3ZVwtS6w
	 FAd66sctSDZDdEj8KKWB99l/wGO2EEtlaNjzGkFhA8sS76weshVo32iQbA6yoG+qRE8YZ
	 +2txETVF/Owg5I3aqP7Ks3LU2uiRtYV8HcNLAAwscgu0Dj/zVCjIfWzLTDRZYZQuT31KR
	 87lzNFuFPEvW44QirEIcj49GbCRbrIMnNeSdWFTofNM9D61VHoYOwKjtsNyH5V8Y2Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989916;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=H9xLzacw9O3Ae6IPS6OvDsKe5aOdvS28cPSDtBJ+zWhAiWVao0dk6d2YPMgXkM7nAvAw
	 PDqWLONWmWAf544RIy3tHEwGzamoDu50j6zhClAZu+l6m4MIGH/FCow4vi8pwIkMhwoVP
	 T7rqcXv/c848bWAXCoSBPE0JArbtaNSVVlTSpMsw2Eq2syAbVBk0IRyTQRMtwr9ZgJyVF
	 7xkPklLWVJvt/B3xb+iZP2uoAljMlFdXRnMvTVcDWdJB8c99X/pIjxNFF38cCVgeSNq6+
	 AaqNxtJBNhxbqBTS+Xk1IScf7zCqnEHuzYOmPiCVQK0sSMoC9a5niJcLbsO884jTVvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h5t31y31;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0FE606A33A;
	Wed, 18 Nov 2026 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h5t31y31
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE601F000C4;
	Wed, 18 Nov 2026 08:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794989916;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h5t31y31eDy76OU/2JA4Ex2sy11WvLdedcIKjHhsgaoDV5xMnNMuMFSmxmfCkn4AO
	 HqD+Wb9V/zvQKvc+o3rcKV1rTV2z17Ae71Uujy2nq+/TiTrQM+zcpkGaIMoW0svRGf
	 P5Aan6Rysw7FksbQyejQJAVvu2NwlK3ugBDlsOcziarF/dcVP+3b2z8LDqUujZWL2q
	 EIj+byzFBW2/QQ3mQc0HkllBn0Q5mcGGNDX/1k7HJeY+SPL0UElcDPFNYoQh3SS0z0
	 yZ95DGY2SXh+gRm3KTnexgthatvsCQse/szeYopCcQvKDyt4wGpHrwmZPRdw9fF62G
	 tqswsnJD/0x0A==
From: netdev-bot+sinfo@kernel.org
To: Bin Luo <luob87709@gmail.com>
Cc: oe-linux-nfc@lists.linux.dev, johan@kernel.org, david+nfc@ixit.cz,
 netdev@vger.kernel.org
Subject: Re: [PATCH] net/nfc: fix skb ownership on data exchange errors
Date: Wed, 18 Nov 2026 08:18:35 +0000
Message-ID: <179498991526.3291.17359550581304539436@kernel.org>
In-Reply-To: <20261118081341.1514-1-luob87709@gmail.com>
References: <20261118081341.1514-1-luob87709@gmail.com>
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
