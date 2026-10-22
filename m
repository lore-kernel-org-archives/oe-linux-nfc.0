Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646582;
	b=lLVSbll/qAOmujez7GRJIBPce6ET67YYx1pQaTB6eJ4vjgg+63ym4hCZLr1yWvxFk+vL
	 FBSEGh0Fg+UEV6GyygAq67xYzgnFifLPt9fSrwqGXPUKmREFHo0l6yE10f80oCIrnhgmp
	 kc0R4c/Db/zFrcubq79A7inesJKM8uHXMzZxPp7fG7dH/Xt/mtdmMJdRT4/0KMwS572eN
	 TVfsx5sDS7L77l8VTxxu5so4m3uaddBe6Vj3SB4TR+QMCLmi6KXuRBECZEj+j2D80Wlg/
	 a78NhMdnuBuylMnqvfh7YXzeWDziVEuqb2D26d0ggaSjG4lsQrUuMqE/FKjXX0MocYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646582;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Wh/6asWmSKGdi3c26R5mElDj5bZ90BlIKoUMSONgZRs=;
	b=zMXM0wtHtejQ//X7QT+ebCODjxJ4CsJvWOte33m4WCl9N9cDLTp3KdPI3uP+AIVTpEZO
	 0/yHijkTqPTD7NuQFzEhh7rkx5kBp9+zmQiJbz/IAWg70dkqEOaSrFjCKZ23R5vYrBPDA
	 2Zj3cxG//pyUAso6z9GGrUsdt6h3mKcdJ2uaGYrgMWUwrCMxwt0AV/0yScM0LuM2lNg3x
	 WDSDPBoV4BnUVMuJslTy0xtSCefQ/ei6QiOAsPvc927ZxzEAwlhy5P5uvjdOxesuQU9mu
	 SLHFVq9xUbzwuN2rVrJ96R8BjB427ZTXX2eQzLO25TPDrqcvRpqEeWovuoWRp9kpUZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=animalcreek.com;
	spf=pass smtp.mailfrom=animalcreek.com;
	dkim=pass header.d=animalcreek.com header.i=@animalcreek.com header.a=rsa-sha256 header.s=fm3 header.b=bjLU7gse;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gBbCg4b6;
	arc=none smtp.remote-ip=202.12.124.154
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9121606A319
	for <oe-linux-nfc@lists.linux.dev>; Thu, 22 Oct 2026 05:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9121606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=animalcreek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=animalcreek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=animalcreek.com header.i=@animalcreek.com header.a=rsa-sha256 header.s=fm3 header.b=bjLU7gse;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gBbCg4b6
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 207927A00C6
	for <oe-linux-nfc@lists.linux.dev>; Thu, 22 Oct 2026 01:23:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 22 Oct 2026 01:23:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1792646580; x=1792732980; bh=Wh/6asWmSKGdi3c26R5mElDj5bZ90BlI
	KoUMSONgZRs=; b=bjLU7gses3ZE3+nojXjqCp+wL8fPWkDL9MwrABmf24ErtZCP
	8dEZ+91wqlMcBLNnCDYbjDUMFZ5x9LmXO+6kVtL7HKV126gH9Bu5xa4kUx1eZcoT
	pmYB813XF6kydgPOEJ6lo7Sp5tiE9g188f0Qr1bmR2dutWigWjXs98YwyOkJDdnv
	sPa0vla9srEdc++RoJQs5S326ganzVHrCKfm0Z6a/iezPKJmpGdugOzgBcNnO4YP
	OfrC6VpBbIXJN3R0NQkKpTFw2oET5Qv5M4KIjLPNFb16L73/dBRkiRBOx4kBC66u
	ExC0pJ7qZ9KgOuZ/c94ZabMiVN4MBPSvFTrRBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792646580; x=
	1792732980; bh=Wh/6asWmSKGdi3c26R5mElDj5bZ90BlIKoUMSONgZRs=; b=g
	BbCg4b6wATyg4HNmk9mLDZbO0SUBCpjxw25rvs2fmbYOTED7tVeNPC0gzHYkpqpx
	AlnDHmlVQEEv7gJkZ9hEskHD9bvaIJxeymc6PN9qZ8CFHnGPmusNYiGzyRSKuD84
	g84G1frZJUGVBqkjleODYONzeoYFb9z83V0f7mxBrtnJA0EmOtFHLluOvwFhNM0z
	agRdunc+lFoT1Jx6lrhP44o4iFg169aS1Di6DxwLvUADau4qHFTcwh/w1Yv+lumt
	+dUqxzhlafro7gsj6TKylnBkYvjIcKrFYIXoocy3//ocIbE9u7LhfBfuNxHcmd2/
	FYRVBfyZXOuH7is+ZcdgA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=animalcreek.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792646580; d=animalcreek.com;
	mf=PG1ncmVlckBhbmltYWxjcmVlay5jb20+;
	rt=PG9lLWxpbnV4LW5mY0BsaXN0cy5saW51eC5kZXY+;
	s=fm3:rsa-sha256:YZIUmX6ulCKICJHtLN0WJip+Uk+lha+hIMIT8ErU4E2DYJZ
	Ej2jeU/O1t9RyR/wOJYE/IEz4TK4MQKY2DtNwf1uyeJ7/yZKqui1tlHU4wW13dEc
	VZLUbrRvbCBbDT0YvWo0NgPfx44kvBrMsO7XsXlRu2ZEj0hDbRcRC+ADxKLzarPn
	GVl/frKn7WUTkMtXv3gOL8skCUcggqGKaxAuTOtdbYta4bgHuvqNSuh7VqF9KY1S
	hGQYkTzfxLp/8uwLK2nMpqlydKEAqTCYDcl+y/bIK2uBbza0Uvc3GQaiXyRLrahQ
	oLiD6yhtqbBW6yhU6y90P0MsEB7EwkLruVgCczg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=15;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	organization,references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:BJCe62fD6KCaNdGEcIag0EnBglKiot99b/dzZcYAiiU=:G+048sOnAuNj7kmrxzMghYYazA3WTgAlIw013wseLII=;
X-ME-Sender: <xms:tJ3Zam9PPeUbitWtodzXdtePINo3Oq_kqY4S40BOSy-KFtPuMWXz0A>
    <xme:tJ3ZauKDnt7EQh754mfJvSKvnrzGJNTMweZPalAxsqOYFrnjYiOoJ_boEYz9j7wjx
    3_N7pdpzWgUf6QnSjZwki4TuL_rYe3T24rOwzmzooOiKPnuXlI53ng>
X-ME-Received: <xmr:tJ3ZapY70figuADtYYBlFTWVeQuly1lwnU6aEg1FSlQElKH33vuapK2eedUQQlkCLeDNs1NlKDyPvTSBL2vOZnZXdFaL>
X-ME-Proxy-Cause: dmFkZTGKPW+t4Tb7eQ+Ewfz4XcNb1brutNGFZ7WxD9xIq8CBVbswlwLcJvzIYG7JHX1A3c
    zhkVz3EtuaW83M2JekjhxTYFw9pfPIDAf+sddiDcxDarzHqw/M4O8v9PxljsCZVz6GlC4Z
    iLCiMhTfQmtNFc17I8vlab36LC7xAs5xW05B22wIaUL1/IAQa1XnGWLyS4yON2tJ1cxTf1
    VvKyBx4PNFfcINfRQ3+uKwQP4lfDQfZRk9SYopPFUxoxX/tgZJ4nN7aMxA8RukfUZzwuJd
    OvXpFPyriUuBLa326iEBtK2gAYziW4I97NP0yXvq9J5G9TtYLUPp4i+Cy+HPxOGRjtBIY7
    0uQT66O8ffgE5Nz4xvDfotmRaDyfRxOmgwrnKRKqcq8Gfrz/jnK/cly9UiR6diTjSGYJnt
    Amp3ZxPYBRvEuaFDTMBAKLVRe8NPQjsbC81+OukhNkyZT/kJknirmvLlbWTKFea1fkqDL8
    2Rl1DPsIWwbGuLTG7WN1KKrVNwCWrURgdzqmqNv0jp8/Vbf5zjZgcSnHeT2nOXFq6nekEp
    vlLEi7iUMIg76yDyfWm+oIQtb/xLk5OL7jLXXCp2F0SOujiXRfFj8pyLYrMNhmkYEyo6jF
    2TanmtyCD6dG0rB069X9ntq9pzEFLc/EbZEitoFjHrgL+EePMGnlCRTvQiDw
X-ME-Proxy: <xmx:tJ3ZaoKmsdfrEibYiUblLWLN2QqfWsrQkMKElEkIZ9ajwj8oybFKBA>
    <xmx:tJ3ZavAsdhiiCYZi9Tr8mYG1qwVziEyRRQKM9a1cs4q4kZ47Dsg1xQ>
    <xmx:tJ3ZalpDgi4FmpHDo3qznNpQa_O8Ol8aGCfbPMG2C_8jpxpkTPtC1Q>
    <xmx:tJ3ZaiiTxGbcoUhhtF3MgpzeP-iXYMcDvJ4zn3MMEavL-tIHIeUydA>
    <xmx:tJ3Zana8x2-Mvbzwa1VozCYbzPnY9rD8jSuSr4DoZXSaJyebHlCj29Ft>
Feedback-ID: i9cc843c7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Oct 2026 01:23:00 -0400 (EDT)
Message-ID: <d13f08f1-535d-4750-acd1-623d094b4201@animalcreek.com>
Date: Wed, 21 Oct 2026 22:22:59 -0700
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-nfc new repo for workflows
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev
References: <38eb16ab-4715-4f6d-9b4b-1e2cf6cfac33@kernel.org>
Content-Language: en-US
From: Mark Greer <mgreer@animalcreek.com>
Organization: Animal Creek Technologies, Inc.
In-Reply-To: <38eb16ab-4715-4f6d-9b4b-1e2cf6cfac33@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 12:54 PM, Krzysztof Kozlowski wrote:
> Hey Mark,
> 
> I want to move the Github CI workflows from neard main branch to
> separate repository, because CI just pollutes git history. neard does
> not have much of commits on its own, so more than half of recent changes
> are just "ci" updates.
> 
> It's also logically to have CI development independent of actual code
> releases.
> 
> That's why I need new repo in linux-nfc: neard-workflow:
> https://github.com/linux-nfc/neard-workflow
> 
> I am not an admin of linux-nfc organisation so I cannot create it,
> therefore maybe you could create it? Or also make me some semi-admin of
> linux-nfc organisation, so I would do it myself.
> 
> The new repo would look like:
> https://github.com/krzk/neard-workflow/
> (I split the history of CI commits)
> 
> and it seems this approach works correctly:
> https://github.com/krzk/neard/actions/runs/39664604766
> 
> Best regards,
> Krzysztof

Hi Krzysztof.

Sure. I have invited you to be a member of the org as an owner.
Let me know if you have any issues or I did something wrong.

Mark
--
