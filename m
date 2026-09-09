Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF7D1397
	for <oe-linux-nfc@lists.linux.dev>; Wed,  9 Sep 2026 03:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788926238; cv=pass; b=QQbvxWSuArFrwbZb3WWj52M0YmuORTH3LEcwNW54jLOcYiy8VozrN3iH3s/ghhQcJssXxpP+Go3oGKts9KPGmWJAOSYo/8+C9czst5zpZb9PmQ9N5x+ImLWiIYtJI/COK1u/ynEkPg7tufsuZNSx7TzeKOgKy5XQBqxws7n5ENQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788926238; c=relaxed/simple;
	bh=x21Fq+BMWsHXEBP0FNYN937Cc3gZGsVjLTugOGsEAA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=la/EvvHlX0zwJ1BxRanLNUVdXmJDIIvgLWO8l4b4HWtKKZFa/Hhv39hsRR3iTFDXU04JbObKNTdYP6Y5mMISAtz0tfxaa7OOWoxXL6POBZfp8MUHAwvO5f/75wKdU2Wr2U3fHOMfjY+qejOoXk0AxCtrF0OtoiKJl5Kne9S6Qq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/NvDq+L; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/NvDq+L"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66e64e6e3fbso4748934d50.2
        for <oe-linux-nfc@lists.linux.dev>; Tue, 08 Sep 2026 20:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788926236; cv=none;
        d=google.com; s=arc-20260327;
        b=rCuVoEzZ4cDr7Kd7aA0ISXDvxnXrVx/TJZ1LPwsDS3aWQPyHsXkXv5GM76LAIcyTmF
         l8P2UEAQ4s6trujAUVUtHSs3A6GQFCjrDSKQ9NT1K+LxTyZTeSljpy5c/CBr40bNcyzq
         2imw3bSjTKgk7UwBmmeZ9BufjtcQwS5507d2h3sXeiGgUWPTrpOuK4URm0n/IZVKd8qZ
         9TG66LoBVX8yG/e9w3Sf7a5gE6U4/9pdgZSmfQ+BIJP2cBBthwwH6wLyK54T+XUNLRSf
         aMfgomlnOrd83NGacgh8o5941+IRBhOxuKpXV6mqEjTohNx2LY2LHzBgvjUB5Xdk3cWj
         lz5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Od0mHSJulGCnv5qFieBy+atRCSjt7BOnlfDxonrmf8=;
        fh=18HAyVI5XTx/2tJ2HAI8227dM2fRcx5oqPoiGBt4sOA=;
        b=VKviI2G7BiC4KEgAqxCwy89lbOcY3kzqzzQhUJRZuIvn2UMQNuWrDkhV7Zg8xaLUB9
         ZALXMNL/xKJ1HjNayOU8WU3bskvJVTcpEr7EZwRT2uLlYOk46/7q573ky53B6mTYh23b
         lu2GbpzO7JJ17gRqfPiKiWbw/KeHpGXxL1zotJqNVTPT9Jsr0qO2s72ORe9u6Q258x/B
         jWJNTnvbqv/yMLgoJw+e8KSm8eddYtLxWfVQ4ijVfLsBzpv2IcprAhrtd0GkgrxL6cGY
         57sNZrcXKhRsO/J0U1dAwphmYRIHceojdpirUBDIiEnosPBbHny0iuptryehklWdjKqY
         +HRg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788926236; x=1789531036; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Od0mHSJulGCnv5qFieBy+atRCSjt7BOnlfDxonrmf8=;
        b=V/NvDq+L/h1mAw7NQQaU6l+suEZdH9PMewMuqHUt4EmS0kO3iaVjB5ab6FUBtkOTJU
         MV5H79Hl77be2GsCiUmjDCNRXWZx5NbnEu9UJyx0Cn03lTD7EE6tqYiEyR3Q/zqPKk0Y
         ZtKr6uYCr+l+yWWJ75zS+EkRLIcGjDG4lyopyUwLSliSWJDPF0LiWBDp7xxTp9zqJ/VG
         EV/+Nz2eO7lTOqpL0vvIObgs2LDIQvsLZX6zFK7pOi91w17HOAQGQIFhtPHOG7ELxaW8
         MfGrHwR1gSIse9FrtgAhbOzTZjQC4yoWHGBQJ+yGMmlKvBb8cT9CHH1hCGLNZSnHrPYC
         4LXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788926236; x=1789531036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Od0mHSJulGCnv5qFieBy+atRCSjt7BOnlfDxonrmf8=;
        b=n1f9SfCX4mMYQNJYuQKbwNg1CD7U/C7pHaDZohiTXbiZS12FZYARgAsH1jdL34X6v/
         yyITjY+haG6y31JA1sp0rewhXeHd6icekqLfTxzx5y0wK5fFdSFVhttT860KDXKK+VZ+
         /6O4IS9FAyrPqCIMaDtl0vDckjF3l6RpRvEey7C3Lwo00oqCW3A+Ttj6VRf9aC61KUhR
         OTurEsmNPaT/gHTyKhSPKkcn/uypku62/iQIdVC5FMjxxvTpW2J4isl43eDaM26v7tsH
         vMUwwZIEQauDBJvnZxjQ6AVLfZaLfDsK/OBpdpEiEyF2FJ40sjFRdHgi7BaovSlKaqO6
         zwFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSxXVDp6UOT/pgI+NjGq3BT6NwQ1d72Uju8GEz7wkVvzfgNVNOxl3RnuCGZ+ZMkaZP6P/nMA1GBubFkQM=@lists.linux.dev
X-Gm-Message-State: AFuF++l4yZIwt/xgdsy90NPa938WFpZPPs4MBiC0zZEXNAPzqJu51F1E
	pM2sySA60HKmucD1eMwSj3b6c6lc4UgRx3dNoai4oYAWxHt8ZNzuOiKDE9UQGMVoWh72rmIhM0F
	o1Raxc/c0Y52YPbmGJLagcjdcoir9CJU=
X-Gm-Gg: AYBFou3l5bQWzCICJU+7UFIIZ+t6NDfJ1UoRSDqQPghnt0G1BxUCFoBLhH1mKZtIn88
	4l7YXQxVchTmwNUh4p4wAue/kgpF5u24uXFXmjyvb0qFQeLSaSpDrN7PIzIW7gztQvC5HqTrazl
	6fT9kJiWi8m1mIIUb1Ad5BZSP4NtsIl7xvDDS1HWs1KWggtcqDAzrmJnKkUZ/ur8USAbT9vDi2i
	VLFwxx/2anP8fXsKWZcrGWTBRvzBoXYurkaOgpq/H2XKyJ5swszXWDeCHkZvJleYruUb8USl5XZ
	rA6ozuDqDx9esN54Os5I3qnDK6PUwcpoYIfuU1FiCMAC+eqxZl552LRm+3nY7owWYUl/yCOBFtM
	j4noq3AOFwqy9x5nasggpuyY3Yj9JOtCyiAgOHV6EO9MI
X-Received: by 2002:a05:690e:c46:b0:668:9230:e269 with SMTP id
 956f58d0204a3-66fc1bdd0edmr9162300d50.41.1788926236014; Tue, 08 Sep 2026
 20:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260906054336.20187-1-kartikey406@gmail.com> <ap_S2eIZW6bYqZFU@hovoldconsulting.com>
In-Reply-To: <ap_S2eIZW6bYqZFU@hovoldconsulting.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 9 Sep 2026 09:27:04 +0530
X-Gm-Features: AcwNN1U9v-STXCm9TBNQNcZXEwsKruqtT516HWo-HvVQbqB54_1fWY9NUQ7MIsw
Message-ID: <CADhLXY5uybqOzB7iec4YhwrALAAXgt_67RNAua+kRVkCt0JD9Q@mail.gmail.com>
Subject: Re: [PATCH] nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()
To: Johan Hovold <johan@kernel.org>
Cc: david@ixit.cz, kuba@kernel.org, horms@kernel.org, error27@gmail.com, 
	gregkh@linuxfoundation.org, michael.thalmeier@hale.at, sameo@linux.intel.com, 
	oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 2:48=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
>

> Are you missing an Assisted-by tag here?
>

Sure , I will add assisted-by tag .

> Just a drive-by comment, but should this not replace the existing
> datalen =3D=3D 0 check?
>
> >       if (frame->data[frame->ccid.datalen - 2] =3D=3D 0x63)
> >               return false;
>
> Johan

I will remove the older if (!frame->ccid.datalen)   check.

I will send patch v2 shortly

Thanks

Deepanshu
