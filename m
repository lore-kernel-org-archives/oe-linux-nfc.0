Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00292DF6E6
	for <oe-linux-nfc@lists.linux.dev>; Tue, 11 Aug 2026 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786454248; cv=none; b=uOfp1c2peqbyTA9ZcBE4qBZ3cqxH4zH71GcSMNCvIR+JRThAvdWxnvYiirD6lqEm7cPolTxpJJyJuFC1dnqSpZzEayaeMNT6CZHVZydgksKp7gbf/8cxBr9nAVsf0glFKxPqDCzqmbN5ubpN4N+Saq464S9aOMG4xrtzLgEU7+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786454248; c=relaxed/simple;
	bh=2MBIHJPa/Rxs5pNOk0dBnOQ8T+GTufNTLF6pXaqQ+6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/8Djc1SPZkfkKMsGZRWhXvGeEUR4YWALWq7nyPAfxXvSbGL3uEl1DE1E69Qic/51UEEDNoq2KUv0v68HSyTp9O6p6+8y4l2tfwIaYHB4gdbu7xP92y4MvMh9S4yuOtgRCHqB7Dl4ARytVWBmyZhts8OTMeTgRUsdIjJYL0+opg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTwivVUA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTwivVUA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E4F1F000E9;
	Tue, 11 Aug 2026 13:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786454247;
	bh=v9QXODzG3sdBTHSxPYg2gsDR3KqVHIPXHJc6IxAS9QE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bTwivVUApYbFXOV+j3bNS3sVmWhdJz5C//wA995bcRvNUd80Cw4rDOG9orfuhd7Eu
	 6rJsZo59+iUUZpgiME5Xfw3DG0QndsovHG8GgqT5aYC5QrGZbAJZ068V+ofSgfDobP
	 YOfosLmV3dcftz6bZ2cuZeXxLMYiGcAkBV7Nt/1ZUOh6E1PCiamScAXvvVqaTnUEYz
	 B49T24tPUerTIszwR7mp+B9TcGgz8KBwimQVpZRzjrSMVfsCkROId/8D+SfpJbmKsi
	 NrdJkViwEcFCCumm6rlO0Lj7pGwYHmNvVS95Ox8XYJHFfqMcHvY3oS+CqG4T6t8sol
	 p80zw4vVv2lEA==
Date: Tue, 11 Aug 2026 14:17:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev, David Heidelberg <david@ixit.cz>
Subject: Re: Dup commits in NFC trees [Was: Time to call it quits for the
 maintainer summit?]
Message-ID: <dba6316e-6596-40d5-9f40-79149d8dec9d@sirena.org.uk>
References: <CAHk-=wi734UD_CKkmRwZJHnNXAPTzYASXFh_XR092BsgWs8Qng@mail.gmail.com>
 <anii3u-87kSrB9K3@lucifer>
 <CAPM=9tx7izyUJr_XVQju26fevzepZ-L6vs5vgH2aib9jPPjvRA@mail.gmail.com>
 <anl7CgkKb6tORavG@lucifer>
 <20260810091154.2d3cd6d5@gandalf.local.home>
 <cc6505e586325cd59ba036cef5429039c9c71ba8.camel@HansenPartnership.com>
 <20260810102423.342c4e9d@gandalf.local.home>
 <0a8c1e90-1de1-4a76-b0fa-e367a4bd4f55@sirena.org.uk>
 <0a723972-7be8-453b-8fd1-d934e3c422af@sirena.org.uk>
 <60e73341-ea31-4492-b660-5fd56081b02f@kernel.org>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K9tcXXWnzsUdWcPh"
Content-Disposition: inline
In-Reply-To: <60e73341-ea31-4492-b660-5fd56081b02f@kernel.org>
X-Cookie: Take me drunk, I'm home again!


--K9tcXXWnzsUdWcPh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 11, 2026 at 10:12:40AM +0200, Matthieu Baerts wrote:
> On 11/08/2026 00:47, Mark Brown wrote:

> > For some numbers on the cherry picking: I'm currently seeing 111 dups in
> > drm (we also have 6 more in subtrees), out of 1739 total non-merge
> > commits.  That's about 6% which seems like a lot, and they generate
> > almost all of the frequent conflicts that DRM generates.  Next on the
> > list is nfc with 17/35 which is a much larger percentage, and all of the
> > 8 commits in the hyperv-fixes tree are duplicates.

> I'm not sure whether you have been aware of this, but NFC has a new
> maintainer: David [1]. I see that the new tree is listed in linux-next.

Yes, and he's the contact for those trees.

> Maybe David doesn't know he is not supposed to cherry-pick commits
> between his "for-linus" and "for-next" branches, but he should merge
> "for-linux" into "for-next" instead.

Or just not merge them, or wait for Linus to merge things and merge
Linus' tags (that means you also get other bugfixes which can help
people with platform support).  TBH I've not looked at what nfc is doing
since it doesn't really cause any problems for me - I can only see one
conflict I've noticed in the tree and that doesn't look like it was the
result of cherry picking.  I only saw the duplication due to generating
a report.  We don't seem to have ended up with any duplication in
mainline either from a quick check.

IOW it's possible whatever's going on is something that actually works
fine and only results in transient duplications.

--K9tcXXWnzsUdWcPh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7IOMACgkQJNaLcl1U
h9DZ2gf/SSpusbEIqoY26gsNojt1B4BTJniYhuJ25DhEdO1yOJ54JFUeaS+CizSg
3RpQXnc4sHgspYwGoNVcbc10Le2oBsRoyRTiEsGjJzTUDQnFxQLVDzvOkrGzvDX7
kYI8E+wqKb2X27nDk6SO3/kKnILjnR8ZdM/k4/6f+ukE8TfeUTeZtPA4gBUL20dC
PIH/m43tpW8xv4kMVeDDM3EG1KsF/GB2xCv8GJhoZpZef++q5cgTRInW0Q/kZU/5
4GkCY5eDV6gdCUPkMk2Po2X+WjGYJz/tkCjHA2eLjHHWAiTfhuRlJjaN9Da4aLXD
ObAW65y8d31/WCmkOQlUP6NC3Ek0og==
=mgvV
-----END PGP SIGNATURE-----

--K9tcXXWnzsUdWcPh--
