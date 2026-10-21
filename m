Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612498;
	b=SV16j4F++lGC/hUk1FmIheQA9TtkABAx1NODACcY6jWxJcR+fEVLtKi6iikfokl7eBUa
	 L3aAU/pQQ+zUJXfdp3uQELy5jIjuG7d4R2p9+XNT1d4wIhnfJUZG2ntsz9NhOgd8KGD0D
	 bOsBMBQnrrhFUbvUFpyDuADhuNkQpFlPLidCyhQMQ3zijglOThQGRl7UHaRQanmEYYyXj
	 +EivVfPdFH2pOxIBbLJ3sS06dV51bus2e/y9ZLFIBrUqs0Ud9sHBhR5qHnvuxw1wSMcfU
	 BctZu2fz6R/2WIi+03iwfoGMiHMVUD/zs6jzKtsTe1+HQiiGij23yFZm97+B7wPr7xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612498;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Content-Language:To:Cc:Subject:Autocrypt:Content-Type:
	 Content-Transfer-Encoding;
	bh=oqrOMXr9bxZT6OG+a1XDltt6ny3rlYOpwuSpVrnbS8Y=;
	b=5SuDDusM1DqIhDjOQFSZQWXHPytx0BTIWptqTqjzPd/5HTR5F5tENxtqJC9JPpztG1Gd
	 +G2OLoz1iNhRGfUcO0wzo48o/cH/2O4Jmu8rYmSwyv5DwpaPjs1C1trI2/XtMQqLqN4oh
	 vFFlCkJGIGMFPVVMgy1eGfo9eYsyAys9nAV9DAa0AhkNvZLAXvFPluEVL+Xq0ljI6y4fF
	 r7nMucCYF3D8SY568A6X4QpMX6xNI82LIzPDyNP2fpenYn3O8NcTydPzN+5oZliFx0srg
	 3O62iqZerfholYyA5eejdwEOcs21Y+md6QYR7Ha81f372CLEcO04JicG7Z04sl3YnJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CjTsaNtE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28E4606A31D
	for <oe-linux-nfc@lists.linux.dev>; Wed, 21 Oct 2026 19:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CjTsaNtE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518281F000C4;
	Wed, 21 Oct 2026 19:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612497;
	bh=oqrOMXr9bxZT6OG+a1XDltt6ny3rlYOpwuSpVrnbS8Y=;
	h=Date:From:To:Cc:Subject;
	b=CjTsaNtE3jtfQ19tuOrjXRh5VNEeJoXWJ619HN6BYlm7eeOLLS4vhpceGHpt2p8zE
	 Dz35A0qfMKdw3BsBlizFx4xddmvCEQWfGkEgnN3eiYLxUKIRz89o8iQh7XdIxenj44
	 ljtwm/SmlAsrWJYjkFh3XkvqNgaaPmv1t2A/PfCGLlZxDg5pJqx54NMox8d7PjrR3X
	 tgrFpYnVVfmwD7+o/43j9wCYSEWbPdvTveXMObOzqtOWJazMYjLYYiUl4fiAQORQF7
	 gCbP3N0+HY+jrdVl4cK3lMy2s1oX4TaKbwn2tlGtPezdB2MN42EMyJaM7AehEcMx1e
	 JxiggkrJo/q4A==
Message-ID: <38eb16ab-4715-4f6d-9b4b-1e2cf6cfac33@kernel.org>
Date: Wed, 21 Oct 2026 21:54:53 +0200
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
To: Mark Greer <mgreer@animalcreek.com>
Cc: oe-linux-nfc@lists.linux.dev
Subject: linux-nfc new repo for workflows
Autocrypt: addr=krzk@kernel.org; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hey Mark,

I want to move the Github CI workflows from neard main branch to
separate repository, because CI just pollutes git history. neard does
not have much of commits on its own, so more than half of recent changes
are just "ci" updates.

It's also logically to have CI development independent of actual code
releases.

That's why I need new repo in linux-nfc: neard-workflow:
https://github.com/linux-nfc/neard-workflow

I am not an admin of linux-nfc organisation so I cannot create it,
therefore maybe you could create it? Or also make me some semi-admin of
linux-nfc organisation, so I would do it myself.

The new repo would look like:
https://github.com/krzk/neard-workflow/
(I split the history of CI commits)

and it seems this approach works correctly:
https://github.com/krzk/neard/actions/runs/39664604766

Best regards,
Krzysztof

