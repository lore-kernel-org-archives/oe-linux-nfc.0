Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794490773;
	b=mL4ImXqe51Rzc7X0qwmLp0j7sf8f5Gr1Jc+OeFdegun82KTjOkjI1rEzqMkZwEKYqIdj
	 sybEaQGaihXFZzX3l3m43mXRcIXOBC+ANgAl4uCfdsav089WDMR9g8xeLfWBxffSbmNgx
	 34hnWCvV9DWgR48uejZSsSo79hje0vFftc0zGGGhjtuYzZDKmgV2lOdu97LfpHF0DSY7c
	 zkSeEFH6rdkMH4Hd7TIG7Y9XXfiSRe+nI20qgauRY7pgXFeK7iV1VcAcVg1fPQNKXT98L
	 PQLPTNOJptm0swzD1yZPJcmITQdmqcSvMFrFXL7zdcURfALnumyTrSmsLsQJ7XVYzbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
	b=OXxJqC+6RRCyYmeNLSwkdcOudZ+PLpBp9E3zfBaObvQInj9hXPqF8jtdTBZoWsGfTI58
	 e1GgJdf+hJx4EqNPyjHPrJa6nBYbvvl4iWhnt9/rIumzOUfAEhe6NY3hhMBLbjcSk3ea3
	 pfdmjCjyYTRUc6TA67jTAZ+AK7XhLHjDyjYL2oTFWNgtUN1tipNjJjh6IwHDBHEw/3mhK
	 NgRzElcNYdUn84PW+ZqdQ2SuEotn7zT1rzDm4PSnxsmfFvFmWYnHEr1J+vZeiDsXPDObj
	 L/cyzCVZ2yumiLc+yLu+mtU5YCtNa8jIw3cN+hsE1ibwmm2EiN/J9wy3/69++O0/aJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qc17ywGL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DBC606A8A2
	for <oe-linux-nfc@lists.linux.dev>; Thu, 12 Nov 2026 13:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77DBC606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qc17ywGL
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9eb579c0eso24718135ad.3
        for <oe-linux-nfc@lists.linux.dev>; Thu, 12 Nov 2026 05:39:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794490772; cv=none;
        d=google.com; s=arc-20260327;
        b=ZIWp9h8fwXFIAy1hM5CLIhtmPVEgQGhbk+4ot4KDsOa/E8BLLL7A4tFTm1sr6c+gy5
         q74fR8zLt+yOQ71RpFZu3apWe7liH3rFb17/2jTQn6rQvCrA4R2P1DgGbHBoJYls/R25
         rTk54U2wSv21qQmH6OKIpVMPryPXAx8HXoBF85exXiad3gU9/16d1Y0ii4WMEfF4NNP3
         Zg8Zc2+6q/cXvtAfiCDXUVN8wF8h426iEsSfO9wW7xicqy5YJruc791Y9s6TIl4tJQ3x
         SlCb6WgL5tepsKOS2dlUPlw3t3sM5/5iz8+eSHqGI4Gxa3cB+tFoUib7UQs3fvCTQRe2
         Qe1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
        fh=GwKuOAF4R6lAAEXKaUJaU48nZc9Ssg37deS1ieqdjdk=;
        b=kHqKPGLUWR84GpcgJLsTBnuRoVwE7/Wdpe8DCUSbgcBrKZlkNQ4FF81vLE/Q9umcOw
         Z4ieI6rxWcfFMBMDa8RaIeFUtkr4fpxZLmCBYD5sOGd3u7iYkG7JSDKwU9OOLNl9ibvy
         dr2ifTrKGPEMRWXZWqXJ7wcE768v3f7SmJR5KahCYgq8WmdZgifuyQurq0ltHqImzg1n
         /u0l7DPBwAD2yUW3foY98Tg7agkpuh22lwr7JJtPWqN7LYMcrkNIC5yOr6PT4Lu0lQ03
         0zed4h1ixsB5YmOzhBhukAsDr5Xzz5rqlfltli4IbkWJSEPfQpKCCdTirjoQcWHSxdMY
         Wk2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490772; x=1795095572; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
        b=qc17ywGLfWVrXrefSq95/2ZWTFjEL8k8KqHM9nv/uDhWHtHpTJxsJsX8fB/17ca7ni
         h8UNU2X2hbQ/iCbKM+ejGxZrkrgXByA+ISKo51qeAYvtpPei3jBW6Gye2CCMAqyLWte7
         dYkNlkdGM4qJgKxE0XKq4eVVGGhbcoEvss7Yp4UdogqfALNwFvJSPNdld8RS/SANWWDa
         9rznB5ip/DJwVLhCZ9ZgKaeZH2nAc3S0Rn6Nko2wnsN4GMjdJ/C5xzONgSSMujSUSR0F
         Q79MEEU8CSy9vKNPLPeoc3nXnWUXZJ2BncIj/N79tWgd0xFM/q4sCTNisJV5DBqnoAp1
         JbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490772; x=1795095572;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
        b=sv1kx9VSFMJiHES+VzVR+u9cANsJshM7KeACTT41AkCsdyZFhnDJtMBoRtQVQIODX8
         4VC1o2blFKdPjIPqplgH4wu+kwM92Qj/MrWA8M0DCjaHbw07vd006dQGjpTdQ1yg6NBc
         ZFOBeaAlbrA5lexfOgHjaybqnnjdV/AN90Fd5OFcLwVb3hEzpWAdFrmcQegw4NcipqDS
         pPRGaAdEcBaKeYIWsB9k8GkqZcIiFAAD7y2QWJJQOutYCnYOvnjVsevIsJ3ncHd9c1H7
         Rf4NjGNj+5ZYwSj/n3K9POIPAWsH7GHNfzcPxTum+9Z5XSahq3+iNTFn82Dhh94wdYpO
         F5dA==
X-Forwarded-Encrypted: i=1; AL+hErGZ83BmMpN1xC4d0pN+m+Cb/JOPO4G2CMHjEYMMmHqyHqxLrNehS95Qag1KC1ix+KHNJlJLySKEDAui0ko=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ovCa1KbX2ydqDDF/43sWzSsExXXNpCA8gR9DJtkGRIeEg6RgO
	+78dXltXAl6xzjDj+R91Zr6Wh4imOahAP/EU9vW5XFWSZz9mRLobZZpTU0nqR3ceqSFO5BmVTu1
	owQvwhbj+tQoQ3veDR4qFqxCf3H3NGg==
X-Gm-Gg: AYBFou3DUCeqbB0uQoeilZQRayggHRMasy6XcWCm92uyPW9UyQctonqurbpEUeQ9kdm
	CGPG+190fUe/X38D2ahVh2mOYXQNkD9w5/Rfq10rZiOGqaLGq9M5qfVtuNy33qnDr0vTJZ5/+Qp
	7mencBy1ChI/HJNRaIYBFu0QgETIswiBgBiKlP37Vj6YiuClGLfYduH5WoTN9iIOdi1yglJXonI
	FEMlnffd/ztKOZsi9I2D8fVuB6lfEbtjB1pC6UeZNv8tvEDqudKI8LkoEW9a1CnbLgYMGP2O2Ar
	/cQqK5h5XMg+bQ4XuADyGKMOuQMtQwqkeM+dbujO9tmWCHYtTwBwYWUBcuijO7vDfGS6ANmBqML
	sEuszp6+YjOSkWzW/ycKP5R/mJX0memI3KE+n
X-Received: by 2002:a17:903:3c2b:b0:2e9:723a:cf30 with SMTP id
 d9443c01a7336-2edd747589amr58537755ad.2.1794490772460; Thu, 12 Nov 2026
 05:39:32 -0800 (PST)
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111-m52xq-dts-v2-0-063289405882@gmail.com>
 <20261111-m52xq-dts-v2-2-063289405882@gmail.com> <20261112-sophisticated-peculiar-husky-c8ce51@quoll>
In-Reply-To: <20261112-sophisticated-peculiar-husky-c8ce51@quoll>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Thu, 12 Nov 2026 15:39:21 +0200
X-Gm-Features: AclHuK9wD85pxbo8x4o0sO-zJHkPTBWQEPCcLtvvrU2Ak_t5O0goATrr7wKH0Tw
Message-ID: <CAARotkfQxp0xE_XnixLeRLrcdrWx2PgC78BKv46e2NJiVnmmBw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: net: nfc: samsung,s3fwrn5: Add pvdd-supply
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	David Heidelberg <david@ixit.cz>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for the review.

Who will pick up patches 2/4 and 3/4 (the s3fwrn5 binding and driver change)?
Should I resend them as a separate series to netdev with the net-next prefix,
or will you take them with the tags as they are?

Patch 1/4 and 4/4 are the Qualcomm side (arm,qcom binding and the DTS), so I
assume they go through the Qualcomm tree separately. Please correct me if the
split should be different.

Best regards,
Asdlerto Korry
