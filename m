Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8513334D90C
	for <oe-linux-nfc@lists.linux.dev>; Tue, 11 Aug 2026 16:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467490; cv=none; b=raP1Ngt6nNvRlaZe16I9CAf6nu8UV/Fr4kSgXSmrdHRfbKW2BNLJIcJQySyRNv0TFpjt8ert0KD10sMRODyNqo2Jlz/EfYVkObdfLsqfoyBAvIvuO2JMDUKJDbt9xtqt+VHLxA52z7mOknyP5dfYiwxFL+iV3VJeGjbOGHEWVK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467490; c=relaxed/simple;
	bh=Jp4NDt3+5n+xuScaTWkOybo13j3L5wYYT6UcFrftxEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNI7d7f6qU3/YLPKYkeOiZkYp5OGWJKCnDT520foE3rP0BR6DM0PSziclaIfR7WXftsIIQJuSGvRRfXGcOafbYATCn7vVBr1MVYE/4+iSw9jIM4t9ZTt8F7InIk7McQ1j2Y2G0RU4KYkIzzjTsU4IBO2U1sYQdYbLMiNZzO1RAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2ziuOk7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2ziuOk7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F9E1F000E9;
	Tue, 11 Aug 2026 16:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786467489;
	bh=Jp4NDt3+5n+xuScaTWkOybo13j3L5wYYT6UcFrftxEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T2ziuOk7aekljC/O21R2eLuQG401zO8ZiPggQ472bXyZPE8ptgFxrfMtA9hFkUpjd
	 YOUzdLrfVOxFUJdqoBIS3r6Fu8iqD1wjETTDZqDqZJoUA5xTfL429/Z2Banvs/rYiC
	 LTQ0ydFOksToK/qJZ+Nm3PfF3X4jkOmRrZHubN7TfpaHC6aKhjgb194njcEOYW6NJJ
	 d6GGqEgqP/a+HPwXPLVpPBu+jSyjpWvSB2CuaHnRmzty+BYAmmsmQq3ara55dxvUts
	 J5cXbnuy3rzkc6IHoLGm59Sg0YroLlMEQrkTAH2gK+PKNkiAs/DPTQ+n9dZBKUz1IC
	 Z3/ZOfhosbdYw==
Date: Tue, 11 Aug 2026 17:58:05 +0100
From: Mark Brown <broonie@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Matthieu Baerts <matttbe@kernel.org>, oe-linux-nfc@lists.linux.dev
Subject: Re: Dup commits in NFC trees [Was: Time to call it quits for the
 maintainer summit?]
Message-ID: <b4d94c63-aca9-4f35-9655-940b5d886a4e@sirena.org.uk>
References: <CAPM=9tx7izyUJr_XVQju26fevzepZ-L6vs5vgH2aib9jPPjvRA@mail.gmail.com>
 <anl7CgkKb6tORavG@lucifer>
 <20260810091154.2d3cd6d5@gandalf.local.home>
 <cc6505e586325cd59ba036cef5429039c9c71ba8.camel@HansenPartnership.com>
 <20260810102423.342c4e9d@gandalf.local.home>
 <0a8c1e90-1de1-4a76-b0fa-e367a4bd4f55@sirena.org.uk>
 <0a723972-7be8-453b-8fd1-d934e3c422af@sirena.org.uk>
 <60e73341-ea31-4492-b660-5fd56081b02f@kernel.org>
 <dba6316e-6596-40d5-9f40-79149d8dec9d@sirena.org.uk>
 <03921009-20b1-4af4-bf4d-cb809e6e646f@ixit.cz>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ikBAsdxK5KemAZdU"
Content-Disposition: inline
In-Reply-To: <03921009-20b1-4af4-bf4d-cb809e6e646f@ixit.cz>
X-Cookie: Take me drunk, I'm home again!


--ikBAsdxK5KemAZdU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 11, 2026 at 06:39:33PM +0200, David Heidelberg wrote:
> On 11/08/2026 15:17, Mark Brown wrote:

> > IOW it's possible whatever's going on is something that actually works
> > fine and only results in transient duplications.

> Sorry bout that, the nfc-next and nfc-linus will not going to have any
> duplication in future (at least intended duplication).

Great, thanks - like I say it's not actually been a problem as far as
I've seen, it just came up because the tooling surfaced them and I
mentioned that as part of a discussion of other trees where there are
actually issues.

--ikBAsdxK5KemAZdU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7VJwACgkQJNaLcl1U
h9BajQf6Av/8DMqaEYpsc6/nvShh2WKGtM+cwt3e2ZcaqU4ce+gzWoTGSXtE7dUb
LL4uS4HUB3tICOu7hJWxU4G3vqwC6Ph/pkGYyNQ4cGuJBpcup+9hS6O9Q8WmmgMZ
G0UpWLzRanQI6+R/H2AkICJTV3s8H2nDyu6iKsiXdT/J4K3WiVr0DaBbLtYZf/zn
OWsJkQ0dEzEDvB/U+5BS+gzGuyJzgvergNc4iFtchktEmJQ5FdYF4nZYCL8rD3Q4
LnSI/yagbBsiUsLMfpweX20JsmGIJe4GTVb3rgHFYI8prb5plK7VG+QFsOGSpNiw
ZzPGAkIfngqE2JisH0fsLFnPa2ePsg==
=V3+o
-----END PGP SIGNATURE-----

--ikBAsdxK5KemAZdU--
