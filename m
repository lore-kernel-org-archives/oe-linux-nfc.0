Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75583B774D
	for <oe-linux-nfc@lists.linux.dev>; Wed,  8 Jul 2026 05:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783487129; cv=none; b=jxourj5/9gIQNe7H/W1HfbInziluwcjT0SAacqVVviza5wwb0g/MfN93D1LP4VPifivFCB9FllizugJn+Er9ET8XLEDg/I4huU9ayhwvEAVAd0Eyy+j8rxGgbzAPbyB8ZjXF2WXu+PabCqsb3odl6+I6ZBToljDsZelDVK6eKEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783487129; c=relaxed/simple;
	bh=A5EH4vrpCYxkHq9d3wTWMZ1A/AycKXK0ePR/KubP8MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ub28io3Y4UJ1DJ+ZF9XltUuSMO3tW7y9wrNSGfCU/zU/jDaXYQBxAEEpYQp2eZ1zcHLOnj/Wq9BWyn6aCfgro2IhAj1nynhlfxqnyqCTF5DPlfyIMuCVg114np1ITLRVkUPvrIdkE8K4IYhvoSQ3uMSMtqYs9ayXUSw3Ed9Hd3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UPi3gZEz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UPi3gZEz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so991255e9.1
        for <oe-linux-nfc@lists.linux.dev>; Tue, 07 Jul 2026 22:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783487126; x=1784091926; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2bRMxPUxBcXrhb0PApy6D/IVMbVi3E/LkCHcDJDbkO0=;
        b=UPi3gZEzru0hWvZ0tFuWA9mb6ptHf1hFz6Po5oC5CJOTDf8gMwjoKjvG0y+KXxmNsP
         IOonQxmLwV+RLpF1jk/FIk1JcXgBFH+D4dBE+5PpPPnM4H1267/Gp7mVDFvGKmBnMlPM
         H7QoEMVadc6MmSBwWiIiCGW57KH5YcMnwFZOUGS9hklq96gy2XXatc8C2Hv2HCrwSY7v
         afMk5DrcAAhT3l86EZj4X0nqzqAlzPVrUupa2KZJg2iyG9gV5+vHdcZPce6sGk5610W2
         vPoyYrlqFAP/Oa3xHq1w65wGr3AkRiEnx/FIIo7zUEDcu9L/CAGFkyl0jCGTPiNhP6Wt
         jhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783487126; x=1784091926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bRMxPUxBcXrhb0PApy6D/IVMbVi3E/LkCHcDJDbkO0=;
        b=olblOR8u/cdDYB1LsgeH+19NK6+6SFNgvcg9hgzxmswyFK5ZJY63Pd4BUZWAPuuQ+H
         n5t7fNEMQtTtry/piyQBGe985sjIl9uGO6rsJPYch1WizPNsSAqfnP/dF0ORbsjlMEkH
         XWthcumvaNrFKspngWZzo/1vTPJJwoKZokzXHm4X0A/DliART2iaTLPTWxlzyGtTofzP
         e+fWi3r3LONtterh1CJFtODM+XZCSQMxZGJlbcPmToFl3cVZIqXV8a2q1bO5cNBB8Bon
         4m5g0ue4gLGjaLxHuVjYIbdDIihr2FoSZK3gbxfKvH3QHjw9P8F3mRLkK1t68JQnQ6Ml
         03gw==
X-Forwarded-Encrypted: i=1; AHgh+Rrf3Mtl5+U/fiOLVNACU12fuxtAyKTgJJ1lZBAoWsMIMg3ADrh1dRxwCMuEJHr6/IHjAlt8wHPAfYg3BTw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUN9zGdqSiYGN0mjcLU+fls6FBfFqyffK1QHgp6vWs1c98C2nR
	GPZK+3ufg/kkvqteDm4sfdA8n26zMrvULBpwlusIuNEG2Tau7jRC3KacMofXMb1W7SU=
X-Gm-Gg: AfdE7cnzeXsjvwsJ6KgLQr04+AouaJ49FvdXTW8xlIgmrF6ivrZMcd6lcdkD0OPSrqE
	3EAbst8fVnfCkFbisK5wyAjvcLgs+9oxBUrgyyvwNJmvsotlIkFUj0MtwucoJmFyqZ78DOaQ4Bv
	R/C0WtCsYfO0I+2MDFi/An4QnyvlQ+oNYVx7mAH+IUQ6AAFlAI72e+4zFOoFCfYo2luH69KV2gS
	ly7SNfNSfgtQJrSO56jDM4dfTbqUvd7p3rYOudgYtujWsIovFif0CE+YfA7XpbYne0XSfMmq7h3
	CRVALyimNDBhqOszco7rsq7ykoXfT/9xy41t6A76Mhv+yDWy77yVUxH2alNLGZOOCHTUZ68iDtI
	JwKWECXtyHsZSvkl+zkDXSHmafPfCcIWljwW5MJysl2BjWKbRR86Xyoq+m0MkiPo+XXb8SSPBfJ
	DR3QEwNn4RoMlcRGk5Xw==
X-Received: by 2002:a05:600c:4fd4:b0:493:e3ea:b23f with SMTP id 5b1f17b1804b1-493e6861ac2mr6417425e9.10.1783487126073;
        Tue, 07 Jul 2026 22:05:26 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0f5bc78sm131093755e9.14.2026.07.07.22.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:05:25 -0700 (PDT)
Date: Wed, 8 Jul 2026 07:05:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, Mark Greer <mgreer@animalcreek.com>, 
	Simon Horman <horms@kernel.org>, Tomasz Unger <tomasz.unger@yahoo.pl>, 
	oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v1 07/12] nfc: Drop __maybe_unused from of_device_id
 tables
Message-ID: <ak3YSbzhmHi75INN@monoceros>
References: <cover.1783091699.git.u.kleine-koenig@baylibre.com>
 <031ea0ae38838df3261f844eb13e9841769b49a7.1783091699.git.u.kleine-koenig@baylibre.com>
 <c5b1dec1-de39-4359-9cee-86cfac87b358@kernel.org>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="khemwuvx25deahm2"
Content-Disposition: inline
In-Reply-To: <c5b1dec1-de39-4359-9cee-86cfac87b358@kernel.org>


--khemwuvx25deahm2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 07/12] nfc: Drop __maybe_unused from of_device_id
 tables
MIME-Version: 1.0

On Tue, Jul 07, 2026 at 07:28:57PM +0200, Krzysztof Kozlowski wrote:
> On 03/07/2026 17:46, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > Referencing these arrays in MODULE_DEVICE_TABLE() is enough to convince
> > the compiler that they are used even if the drivers are built-in (since
> > 5ab23c7923a1 ("modpost: Create modalias for builtin modules"). So the
> > __maybe_unused marking can be removed without introducing a compiler
> > warning.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
> > ---
> >  drivers/nfc/nfcmrvl/i2c.c  | 2 +-
> >  drivers/nfc/nfcmrvl/spi.c  | 2 +-
> >  drivers/nfc/pn533/i2c.c    | 2 +-
> >  drivers/nfc/pn544/i2c.c    | 2 +-
> >  drivers/nfc/s3fwrn5/i2c.c  | 2 +-
> >  drivers/nfc/st-nci/i2c.c   | 2 +-
> >  drivers/nfc/st-nci/spi.c   | 2 +-
> >  drivers/nfc/st21nfca/i2c.c | 2 +-
> >  drivers/nfc/st95hf/core.c  | 2 +-
> >  drivers/nfc/trf7970a.c     | 2 +-
> >  10 files changed, 10 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
> > index 66877a7d03f2..687d2979b881 100644
> > --- a/drivers/nfc/nfcmrvl/i2c.c
> > +++ b/drivers/nfc/nfcmrvl/i2c.c
> > @@ -245,7 +245,7 @@ static void nfcmrvl_i2c_remove(struct i2c_client *c=
lient)
> >  }
> > =20
> > =20
> > -static const struct of_device_id of_nfcmrvl_i2c_match[] __maybe_unused=
 =3D {
> > +static const struct of_device_id of_nfcmrvl_i2c_match[] =3D {
> >  	{ .compatible =3D "marvell,nfc-i2c", },
> >  	{},
>=20
> This (and probably others) should re-introduce warnings on !MODULE and
> !OF builds (and other cases).

With an x86_64 allnoconfig and just the things enabled to make this
driver build (i.e. I2C and a few NFC related switches, but neither OF
nor MODULES) the driver builds fine even with W=3D1. If I drop
MODULE_DEVICE_TABLE() the warning appears. So unless proven otherwise I
claim the commit log and the patch are correct.

Best regards
Uwe

--khemwuvx25deahm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpN2pEACgkQj4D7WH0S
/k6Lzwf8DSkcD2KNkgrjPQ9dJBBjqHuxUaPDXFNacjjVAgwT6Pwfd+C7HF0KG1bs
BqtoTI9+PXKyjz2yPy6tJFV8pq6GqGUAaDrtvBxhkUd9h4nK3BFWFlO7Z1HyiTgs
syyZLelwtqqHOw74m5y5p2LDyRQj4VwwaFs1HxReBCEuCuVanb28I1/wONclUzMB
+3lIl+0yVrDpvO3PknOzLV5gQo39ZyjaJr61mUr/ef2o5QxGvNE1MI1H/qaseYKI
P0F0uWcnw/aUZxb2XL9+g8DFcSWUsBfx/zqKCivAMmnkgiyGS0GkzEE99yJ5sged
CfYwRmwSUEwwsfH+5kQUm0TAa7CkaQ==
=Jkjp
-----END PGP SIGNATURE-----

--khemwuvx25deahm2--
