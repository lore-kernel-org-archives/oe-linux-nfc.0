Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792652148;
	b=kcZXjIrldD8rSpK5u5nlwhvWiad36u4P3q3WBwYYWqgcagVLDim6VfPVqgnWZoOZW1+S
	 g0KQ44KUj6rdNFBQ534+oF15YH1zdOj1/DoQZUS15SG0ICi8gkeSuWyQJEvTfBg/ExdcM
	 5wPh/3f+YzGfxo2Rl52g38jksBINaxiLIcIOpYaJmVzAlnl/yA/IqkVEh4tRulpB2TRsx
	 Kdmqim4qP6s+cuW4dIQ8L9Ufri7ujvfKnzKkHd2/eAWhb5ES7ZAqtYY3VV5CzF1w/AG+i
	 wdSIjF+9xuDfJZx/sosQgg2ZInh9c6t6zWOaW8+3pGI2behIMBWQbYgK9w+l0dD+xww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792652148;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bqNUu0jRd80QgPEWJFK+RA/FXRLecFpkP484Ee8+UgE=;
	b=y5x7scNsASQ1SeqFuO8t6PBRxCPxCloSYmB9zqhSTPoLxEUg7eta7xpN6yfg2eXa2Bzb
	 bB9UkUQU0Zcn80gzhK7j2sHVm7tWaXl/+Segv0YExhvAD9+v/aQyMEZImFVBYv5/7VpGZ
	 Q6n+dy5fQHAq4RdBSIogzkAXLGt2Ind+ZOLIcqLEAgtCYDyka1Qo+Vyvs48xFVPT1RC0K
	 7QZ8XJy330+I16jN74K+mULXM+lFhPCVKpYfD23EeS1MtXliAfNT4m/iUd/zXuityJoXO
	 Zthh6bMaY85qy5nxY0Gfl2QUcxhNzGwNjjs8TLbZ0QAyPbFRqS8NHGGuU7AbPCUqNfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0b9MNXl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2127E606A319
	for <oe-linux-nfc@lists.linux.dev>; Thu, 22 Oct 2026 06:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0b9MNXl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FD31F000C1;
	Thu, 22 Oct 2026 06:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792652147;
	bh=bqNUu0jRd80QgPEWJFK+RA/FXRLecFpkP484Ee8+UgE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=P0b9MNXl1EwcQ1KcBRjbb6PcebEfJgUU+71DLE7DqaRbIJHpWa7Q6BKQA9cpTchnG
	 sG/w6DjH2Mlz2NYiY5bwcJ38jOWtybTTuzcyeH8Ax4O1jpP13IM+AUpCE1Ud2MZoRo
	 ptihClmngufcQhj4UBBgTPexEiHFlzuy89INKQRU9Bm4xFtPKL9XqV3Dcn+i09D0cp
	 QM1CXNKE7GFkaPirI9vCpc57cid4pbtfhQ5GnlY4vL7Iuh36XC8hYF/zUscjnSSAoF
	 KACc/xEHrlBnyimHSvC7CXxjcFlm0+r7hODw7c/9/OKNlQohyFbAQ6iyihI8TrIg01
	 wT0zFsaWRLDsQ==
Message-ID: <639e54b3-1fdd-4b07-80c0-29307251c9d0@kernel.org>
Date: Thu, 22 Oct 2026 08:55:45 +0200
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
To: Mark Greer <mgreer@animalcreek.com>
Cc: oe-linux-nfc@lists.linux.dev
References: <38eb16ab-4715-4f6d-9b4b-1e2cf6cfac33@kernel.org>
 <d13f08f1-535d-4750-acd1-623d094b4201@animalcreek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <d13f08f1-535d-4750-acd1-623d094b4201@animalcreek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/2026 07:22, Mark Greer wrote:
> On 10/21/26 12:54 PM, Krzysztof Kozlowski wrote:
>> I am not an admin of linux-nfc organisation so I cannot create it,
>> therefore maybe you could create it? Or also make me some semi-admin of
>> linux-nfc organisation, so I would do it myself.
>>
>> The new repo would look like:
>> https://github.com/krzk/neard-workflow/
>> (I split the history of CI commits)
>>
>> and it seems this approach works correctly:
>> https://github.com/krzk/neard/actions/runs/39664604766
>>
>> Best regards,
>> Krzysztof
> 
> Hi Krzysztof.
> 
> Sure. I have invited you to be a member of the org as an owner.
> Let me know if you have any issues or I did something wrong.

Hey, worked great, I have the access, thank you!

Best regards,
Krzysztof
