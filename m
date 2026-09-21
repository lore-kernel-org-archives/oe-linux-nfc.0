Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC942494D8
	for <oe-linux-nfc@lists.linux.dev>; Mon, 21 Sep 2026 00:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950160; cv=pass; b=PyzV9Ifn0/J6XX9GMnKVLpJd9CFFdx+iK9B7EHiTr7sqRdMrZaWRckfTxJkE60agwf9ThvG9VdJ5XFlaDQoRnSATRQfawkYDY0nyamLb+0S1U9a6qD+FJyfCY5aI8PR08t9z9stEHVci14umqG7iDBmA+ZmSrIShGcnQlEXV850=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950160; c=relaxed/simple;
	bh=NQS8MYcijvVS4vCIWBQ8Q7bc8fKE4LuS2H2clNR6NXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kI1uQvwpA5XtoIm899+P0+FP7mRRr2tDNOwzskdX1TjRC4OE/5INJMV21bGB+a7bS/JrTSBhdGvyG7bSnTY1xYLJ6SK6+xx3YDI2Cn0Unj4QuJ4gP3NO5Y+fyWKjpNQTwt+b4RQwwq5EtKRO1KkWTUnLCJ5YUxgh3Ha4Nd8vi/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESfNejHf; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESfNejHf"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6729ca45e37so892756d50.2
        for <oe-linux-nfc@lists.linux.dev>; Sun, 20 Sep 2026 17:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789950158; cv=none;
        d=google.com; s=arc-20260327;
        b=CPiovzMNusGXGe50x51Kpewn/kllXISYyl3cVKgYYcYZjMYZwq6REYkpLMKZ+aNtN1
         taO6VJtJk9ECs8tH4nwphoBUc1Tv4n6/2CTSZWIgDhTBlALWYBNXH5P+bQ+HR6ksNKCS
         3hwgDNBkYTUAzD1nOAIeX23yt/qrQiKXKTwFGsbJ3LYsYDxaWCnWKF2ryOwLZQLzgFQu
         5MDkXtJavZG+g/mRQoorLURdVlO3kafT889/hsI+PJ7d6127NfacyKu0As6AmxNjaPbT
         xggO0uPovdrP/DYG2cw+Iw2mbuczRs5wbkYjSzxXTA1i3kdD2vvdpSiFyei6DFbPmuEQ
         +wmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NQS8MYcijvVS4vCIWBQ8Q7bc8fKE4LuS2H2clNR6NXA=;
        fh=XOSFDbL+6QL+RJZFFFwHbgg/TNWyg1WBAn3Zo0dAByA=;
        b=P/J1smM4VGpDIwkYIoRlm0VEFMDtybEYCNS+ZnLH19d1pcMgezNzMkASev5cGkUtSx
         tUGmTZiZSYE3rDY4t5NiD62L8wiZXVPH0JD2h9cYTcDX1cZnOvMhMN3+0VmJ7cSE20fe
         dGMjiY3ImLtf+Y2gPBIhQN6pJ/uspKhnXJM6Gs4jPJGlPkhxrrYSJePLwmirshA6X60o
         iEKxBUH9Taw/pP/4oTz6HSnfU28b6SqeuzyppDAVgBVIHfQXZu37CW5Exo6IQm/1x2xW
         pd/hah1mgmI7i9eSJqTqxVZAFXLKnJaaZdYVLhbVwX8Zr2MrSQtCXbelf+BMUWY3k4MZ
         fBHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950158; x=1790554958; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NQS8MYcijvVS4vCIWBQ8Q7bc8fKE4LuS2H2clNR6NXA=;
        b=ESfNejHfp0lWbp13Tdyj6UXFC6N5KM8tbBUSHr82ByE6m0KgOoYpWNvR1UZz9beI5n
         t6uMYMPqV8nDECQ97Z7IaumJpJXQISljbCQN6HsX5Pak+Fywf26EMQ2BUs5ZebZw2SCy
         0SoyalxNJBBSNRSd6IxBEkXUU9iNqq6h5y5SWYUyb20dT+SDB5UoArnF2IMAODC3cBcz
         7SwOBtM0WQuP+y2tW9aJ1UJ9B8nrXVGnAUVPnYjw6UN4HH92rY5VZ5LwTiwfLi9X8YEU
         qBqLJFfqrT7wmdJlE9tpqgINW+Lqt1iV9obGFguNy33b91eeWdmhHVjWAB4ESkM1cVHn
         xUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950158; x=1790554958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQS8MYcijvVS4vCIWBQ8Q7bc8fKE4LuS2H2clNR6NXA=;
        b=XJYWJDhMg2IpER71wsQCz6JNt/kmlPqWt9dD8zk/tiSW03O339WuKVCkpG1iN3odyb
         BvsJa0c+9NbmFE6hNboYccdkyb7HJwGuOHIV0DeFlXzoQxu+etJce0eKmyjdBLaOogRh
         cyJcj7oNRZG4KvTLrG5EUYPY56zVuLFsXerihicHCaJKvzcrhAD2GGThfY2itSKsWp9f
         6+s2S7dFUhmRp+BsEBt3L0Ad4/tb1aAwNaynJRQSfAlNxd0dMlQyBaPJ4YNBPBcqtfGh
         pi8i7x/Ya3XFAa0C0b98YiAxo0QVF++a6DlBJenGU15cvtSEddGctKpY7GHAWh0V7Jhq
         dYiw==
X-Forwarded-Encrypted: i=1; AKwUvByQA2q/v6Bx/6SJ1GQYv1rKvJqqkAk9wHOVbljZzBAG16JhYqWx9l0w5SuDcUyVprWnxfeN0ESSlnsTDFA=@lists.linux.dev
X-Gm-Message-State: AFuF++l95cupppmS1WzYv0RfprbvF/gnpHckUJXrojB5iyXuovru+P0o
	79g7UmilRKHFiUwqk69D5QytyBLCtf+RoObcdHXyVHP3JNCfZiaJ7wtHJP6GK4li2C9YZC5nScH
	hGTrVhQcFQgTaNiedKkQE6QJ7Cm1xTmU=
X-Gm-Gg: AYBFou1YF0NVMo44nZJxPD0C9kFuV/JjNR9B+rh/zzOx3PFIfLnoUGdBcexEEHf3LXZ
	PYSqD8h0+sxZq5h4S91T/RhRhTHG0pfqveKatHdniXi70TlTQtc0cw4MerpqGCE75RkHUknS1UL
	4CBcHH+KEvm7Na8ZOd1FKKzBmEj9K/4/O82Dk3J3D679reIGqO4AsyMKAfciDfPiwzi2+Hf5OWw
	zMOgVkyGZTUHF+rKmGBN9E1RK5g49GQkuJbusHelLS4XPiGR9D0DViP1segFda8HEJ0oacD3a+G
	esPBWRgZ5jKyQ/J4d2oCliD09pvC7z1fD7nRHQIiPUbNxhtl/KawD74M+g2vMbnQb/GMis27O9x
	77nTv/YqSPuENweS6gnlpLiaDsGB0I5ge7uAZ3oObGdNB
X-Received: by 2002:a05:690e:441b:b0:66f:c8e4:f013 with SMTP id
 956f58d0204a3-6717fdb19dcmr2344214d50.50.1789950157931; Sun, 20 Sep 2026
 17:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260912040351.15056-1-kartikey406@gmail.com> <11725791-f4c5-4b8e-b17f-bedc679adbf8@ixit.cz>
In-Reply-To: <11725791-f4c5-4b8e-b17f-bedc679adbf8@ixit.cz>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Mon, 21 Sep 2026 05:52:26 +0530
X-Gm-Features: AcwNN1UaCBqh7KC0hnIxyrjD4Zfm4eEEWAHyMCrNMPFJZrk729tRA0ipclL_saE
Message-ID: <CADhLXY7adgWc9EbUJJrzt7djijBQSn_24EfrAovAD=Mos=E8kg@mail.gmail.com>
Subject: Re: [PATCH v2] nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()
To: David Heidelberg <david@ixit.cz>
Cc: johan@kernel.org, kuba@kernel.org, error27@gmail.com, 
	gregkh@linuxfoundation.org, sameo@linux.intel.com, michael.thalmeier@hale.at, 
	oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 4:41=E2=80=AFAM David Heidelberg <david@ixit.cz> wr=
ote:
>
> On 12/09/2026 06:03, Deepanshu Kartikey wrote:
> > frame->ccid.datalen is read directly from the USB response frame
> > and used, unchecked, as an index into frame->data[]. A malicious or
> > malfunctioning device can set this field to an arbitrary value,
> > causing the driver to read far outside the received buffer.
> >
> > Bound ccid.datalen against the maximum possible ACR122 frame size
> > before using it. This replaces the existing datalen =3D=3D 0 check,
> > since datalen < 2 already covers that case and additionally
> > rejects datalen =3D=3D 1, which would still underflow the
> > "datalen - 2" offset used below.
> >
> > Fixes: 9815c7cf22da ("NFC: pn533: Separate physical layer from the core=
 implementation")
> > Reported-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D1853daab1a47603d4678
> > Tested-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
> > Assisted-by: Claude (Anthropic)
>
> Hello Deepanshu,
>
> thank you for the patch, could you please correct the Assisted-by tag?
>
> See: https://docs.kernel.org/process/coding-assistants.html
>
> Thanks
> David
>

Sure, I will send patch v3 shortly.

Thanks
