Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B9147F76F
	for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 15:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152252; cv=none; b=Zu+hWn0YY7/uoKqUDXa+GLpF5QjvTOTiKuMZ6kSQ5aQLSeF8QGCgZKK0fUXhc5u5B4n4yC63nH54OaNCfsWepE7pFQR8pwJLOcK4b/O/H5Tni1Oykpbnr14okCJI9DvWSmCXsxP0rAH5V3z1pG0o6abegcSjKJzXHNZ4WoJSZ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152252; c=relaxed/simple;
	bh=F3lvj/4K46bjW1es84GGKG+07YgBbrH+81rQje8Z1Fw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kjWsLDK3FDC0IuP0O123i1HGpy80+kfKOShoZgE8CpuDL1mVEn3e1Jbvhw499e4us5/ucx/gvMkuJXss6gaTkwQR09BLO3cLIN+gJ/e9z31k0rBRaRlAIq9dOuNAy+It9TJm7ChEXnEm2onXmzieqPiKl/JukyAAnmvjpOZtoRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=R76WDfXA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="R76WDfXA"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49978908b35so8148785e9.0
        for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 08:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787152247; x=1787757047; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TxPC8vpecxGJhj++hKRNkt6aU+0imcHu8gQy6A/MCx8=;
        b=R76WDfXA8ABlsi2qaiHvJ9QWyErZHRZEvbTK7m9xJWwGg4ZsR1hTpSupF2jqO8AVX/
         sNVZWSivzZ+XNrtr9sblR939qCvZUVE1fHBzgEkgB+uMnV+xp+BUkf3d7dMgy0rNGvlj
         B72Jw6sw9x2GbXFUZ+zykq77O4lo05K5knv3ilap52jwthTcqe5GT0c4fKfS5+POPZPv
         Y+AKc+7A3FZp6kl5ziH0VCbzbXSpJDRUKc0ehmKA2h1zgp12Ml8a9WFVhm/rY/poQ7sL
         g+9jsiaYx3gnvs0HF2GNjr9EM82Q+vAypBsk3BPmgrga9QQXMPOcWJMtZesmPXMwh9kq
         OfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152247; x=1787757047;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxPC8vpecxGJhj++hKRNkt6aU+0imcHu8gQy6A/MCx8=;
        b=sUJjJCkawFVCymiaVoaOA4lSP8YJiKoZBJb7Iq8i7La8CUnI9cahC9piZ6TY1DK+/g
         ZcZisHyC9uK+ZJOleStcuSQFYptkv35I3DTWDtywweVkX7fkl8oECOay4JDBZaPKPvnM
         JRPn9ls0RRFoxfQOhyoLN5Qboo6KjpDJISXm3Mo2yLqSJ+agrXQTcCnrkHkiS1lFIS3T
         vJIDiKGj5g27zgw7UxkSSreRgXTgCRPsr1OJhlheF0mP0pAdFdCtIbjoNs6JUKeGezwj
         OGNwngmZLR9J/UkfZS8bzrRjC2DFZF3HjO/s4ADbDBL+tf6Ul1Urgw2ZoSpD4Os7LiPy
         N2AQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2gsjB5AexopVQFFBWQdSFK5eaMufBiBWK3LNv9ncELnkOeEvDbmwT9oINgWq97v0gSnOkG+q0KTHzOnA=@lists.linux.dev
X-Gm-Message-State: AOJu0YySHqpqJLePAWcq8ep1EQfwaeI53qOBONDc3CJSWnE/BtnGgll6
	1Vco6oMY18cFxrCgLpXyeZUE4Et63zPJqMOM6hoyesx9AE3gHJLiIy40zNuV30LaRtk=
X-Gm-Gg: AR+sD12Bn7VfOmv20JqcRJsHm8+F4KkVk/HKQgmc3Pfbrt39sA4bynMj6CJUOFWtGjN
	x6nMiITPTA32i12B2PZyURCL05O0SVNR4gBHl54rmw3356XHXm2uBInMZPCQ9iX9Nh37ZwomJrR
	7yf5szVgyRXJbfM/Iktiz0aKzUft28zutnRGErMNe3/z9CKHf1VFkRQjzwYfJzRc9g/lj/WIMWm
	qKbJCcxo3ZsNBGla4HIX6q+m1nEhptedTJ89tQ2jwOaznR/BpHV7ytEkEyIWIJZu6wBQAz2XyCJ
	w/kFZnFSbkS2Z7d5hXruYn2xjJuhVohVzTjeY2jABPo1V0ahzj85IkxWrwnShMyyW2SME5leSyG
	/e2sh5PUUKhwauFBU3Y48In2vVO4GkF28e5RnqRRJXEydc7mWNkgaxzPW/KjFr2s1CXXT/htOS6
	mwdx9kmx23oVNiWyxhh0TqfILRDvTCGahAIugxON2rF3LHCzOukcAftLB2PBibWi6PzpC4A7yWD
	Y7Gtf7N30M9IbgdJw==
X-Received: by 2002:a05:600c:4e94:b0:499:78b3:7b36 with SMTP id 5b1f17b1804b1-499aa1b549cmr97313725e9.11.1787152246988;
        Wed, 19 Aug 2026 08:10:46 -0700 (PDT)
Received: from localhost (pekko.lucaweiss.eu. [5.180.148.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e784a4sm68071005e9.1.2026.08.19.08.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 17:10:45 +0200
Message-Id: <DKT0LJOID8PS.2NZUSIK66M1NR@fairphone.com>
Cc: <david+nfc@ixit.cz>, <krzysztof.kozlowski@linaro.org>,
 <luca.weiss@fairphone.com>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add
 ST21NFCD NFC
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Kristian Brox" <isyourbrainfoss@proton.me>,
 <oe-linux-nfc@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
 <20260818205940.1973944-4-isyourbrainfoss@proton.me>
In-Reply-To: <20260818205940.1973944-4-isyourbrainfoss@proton.me>

Hi Kristian,

Thanks for the patch!

On Tue Aug 18, 2026 at 11:00 PM CEST, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-high. Compatible is st,st21nfcd-i2c (raw NCI). ese-present and
> uicc-present are unset; those links are unproven on this board.
>
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/ar=
m64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index d48cf38b7..a485edd24 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -1006,7 +1006,14 @@ redriver_ss_in: endpoint {
>  &i2c9 {
>  	status =3D "okay";
> =20
> -	/* ST21NFC NFC @ 28 */
> +	nfc@8 {
> +		compatible =3D "st,st21nfcd-i2c";
> +		reg =3D <0x08>;
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <41 IRQ_TYPE_LEVEL_HIGH>;
> +		reset-gpios =3D <&tlmm 38 GPIO_ACTIVE_HIGH>;

GPIO 38 and 41 look correct.

Some more things that probably should be described here:

LN_BB_CLK2 from the SoC is connected to SYS_CLK from the chip, which is
the reference clock input (clocks =3D <&rpmhcc RPMH_LN_BB_CLK2> ?).

GPIO 39 is NFC_CLK_REQ, the External reference clock request signal
Honestly not sure what it's for exactly. But if it's similar to [0],
maybe it's irrelevant.

For power supplies, L18B is VPS_IO (digital IO power supply) and L4C for
VCC_UICC_IN (power supply for the UICC). I think at least VPS_IO should
be modelled.

VBAT and VDD_TX power inputs also exist, but they're both connected to
VPH_PWR on FP5, not sure how much sense it makes to add them?

And yes, as Konrad said, SWP_SE and SWP_UICC are connected to SIM1 and
SIM2 respectively.

[0] https://lore.kernel.org/all/20260811220135.472380-1-jorijnvdgraaf@catcr=
afts.net/t/

Regards
Luca

> +	};
> +
>  	/* VL53L3 ToF @ 29 */
>  };
> =20

