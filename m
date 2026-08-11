Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5250E30C37A
	for <oe-linux-nfc@lists.linux.dev>; Tue, 11 Aug 2026 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786435965; cv=none; b=E+FyxUTMW+/5TvWFx6dg6V2bxJ7k6c7zNd3qjIfhmSU1wvDHSWdEAgTexnapNT11hOEPIQCMvHMwgBjewZQdjLr6534q2Cv70Yro2806M/HXJleNmWyv/ha2Bz8fM4TC3XgE+nhsHz4FKU7eXnBC9xcDHzqpXhmu7sBZmoWEKLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786435965; c=relaxed/simple;
	bh=eUR+Fbm4kc2eMQ/Bs+k7R+eUjcDVVUmYLNH6JdRJa6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=NNqtrJ7mhu/5ebGUzrubrzuJv8F3KM3EIxq3C5HN+l1e2eJ4yS6ykm3/5wl0f64zSCDUcfbbNZtoLQsHeq4O/1Q/k1FIrZrvThB7KZ3dI/QwkYPSOdR6xiU/2K2d1q75oca2ZbiKOvdnreHqrySNZFkc3JE65SE6q5QN3FugljM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l50KwkfS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l50KwkfS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0401F00A3A;
	Tue, 11 Aug 2026 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786435964;
	bh=TTOWvunkqTAQICfGq97q4uiL/iKu57M+twSpqbOXD+w=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To;
	b=l50KwkfSS/AqjOugvlZgmLXhCAOMCJCGTKJaYU/iefNnXDN3nKszz3YJJymevUh6v
	 PA3HywEprB51JNp9yfi+dnHmy1diA+Bgxjkjm4PWr2HN17E7EYrjZUAwXx8Znllj+V
	 7ySb8ku+/ewFXVfiSPN2btYa0Uq7pycGphLvr6vmRDOyrEpCce/l2wUu798kD7hQQy
	 rbZAb8TF8uqEg3ShxGbu9rhi2cVg6SnDnyditrDMZwQQyuKbSm+/uskn1Pd2Uwd/jm
	 NE9PdYmhoxfITijDCYNcyoy91QsRNWG+GzU9BDjHoDfqd9uQC5C4XKaY7ZYJCX9M5g
	 uRf4AJJWrBxGQ==
Message-ID: <60e73341-ea31-4492-b660-5fd56081b02f@kernel.org>
Date: Tue, 11 Aug 2026 10:12:40 +0200
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Dup commits in NFC trees [Was: Time to call it quits for the
 maintainer summit?]
Content-Language: fr
To: Mark Brown <broonie@kernel.org>
References: <8ae41b73983eee6ba716a61b8701df6522a02baa.camel@HansenPartnership.com>
 <20260806194153.6443a3ba@gandalf.local.home>
 <CAHk-=wi734UD_CKkmRwZJHnNXAPTzYASXFh_XR092BsgWs8Qng@mail.gmail.com>
 <anii3u-87kSrB9K3@lucifer>
 <CAPM=9tx7izyUJr_XVQju26fevzepZ-L6vs5vgH2aib9jPPjvRA@mail.gmail.com>
 <anl7CgkKb6tORavG@lucifer> <20260810091154.2d3cd6d5@gandalf.local.home>
 <cc6505e586325cd59ba036cef5429039c9c71ba8.camel@HansenPartnership.com>
 <20260810102423.342c4e9d@gandalf.local.home>
 <0a8c1e90-1de1-4a76-b0fa-e367a4bd4f55@sirena.org.uk>
 <0a723972-7be8-453b-8fd1-d934e3c422af@sirena.org.uk>
From: Matthieu Baerts <matttbe@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev, David Heidelberg <david@ixit.cz>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <0a723972-7be8-453b-8fd1-d934e3c422af@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mark,

Moving the discussion to the NFC ML.

On 11/08/2026 00:47, Mark Brown wrote:
> On Mon, Aug 10, 2026 at 04:23:41PM +0100, Mark Brown wrote:
> 
>> I don't think any of that stuff is really what's causing issues with DRM
>> externally - for -next the issues I see are the constant cherry picking
>> (which I gather is also an issue for stable), and outside of that the
> 
> For some numbers on the cherry picking: I'm currently seeing 111 dups in
> drm (we also have 6 more in subtrees), out of 1739 total non-merge
> commits.  That's about 6% which seems like a lot, and they generate
> almost all of the frequent conflicts that DRM generates.  Next on the
> list is nfc with 17/35 which is a much larger percentage, and all of the
> 8 commits in the hyperv-fixes tree are duplicates.
I'm not sure whether you have been aware of this, but NFC has a new
maintainer: David [1]. I see that the new tree is listed in linux-next.

Maybe David doesn't know he is not supposed to cherry-pick commits
between his "for-linus" and "for-next" branches, but he should merge
"for-linux" into "for-next" instead.

[1]
https://lore.kernel.org/20260428-nfc-maintainer-v1-1-4cb9d9e121f3@ixit.cz

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

