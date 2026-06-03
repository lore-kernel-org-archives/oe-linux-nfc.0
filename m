Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F334266BF
	for <oe-linux-nfc@lists.linux.dev>; Wed,  3 Jun 2026 16:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780505180; cv=pass; b=C8jH03ifu+o186lj3z9y3jXUz3yaXgMEAe+hpY8riIkxNZlpIXbR6RKHGLlTDblJXk+nEmmuFl4LOGnZ7MoCcBvgDzm5ELxf4uxYvx0pMdN+nQfDideDPLgG/ThgL3PFPitII9Xhy6UaOT27RCsfwTqVFUPx/mBBuABZYiJkZqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780505180; c=relaxed/simple;
	bh=Sp0RGi5NmaP49iEYxVtxwSOEg/eXQsdxe/qX51EHsAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCkNR1vyyWRbmzjJriZVUNueXVYLIO/H9ity033e2fQrNWUZT4781mdN9NA60Xj+KlekLX96oTFDrccWbM2mDP8hQgcN1JrhJTpM4cqzAOEgJfQ3wkd00a8trzaWHvKwfEsX6l8QUNsAdxcdWANuM52Mz4MCITSVgBSTvdL5Ytc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=f0aC1Zkc; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="f0aC1Zkc"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84229481d44so1842060b3a.0
        for <oe-linux-nfc@lists.linux.dev>; Wed, 03 Jun 2026 09:46:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780505178; cv=none;
        d=google.com; s=arc-20240605;
        b=foXJZtVqUS/7SHBPWDDbqUWUL02xbgYktHmY5NzFedIdufWPm/Nh1E++HhcRhLvVNO
         cGxCihUkwxXXXo++KBfa7fHW+4mm9qnhtk6AUVd10+wjB9x5FQTexASUam944yMx9Rl5
         HvNtaQoQtZ4DTVFSam2rhYuDkQ7dvo33vlR5KGzwTHBMcngxMaxrLjzm4Aig8/VuiNcZ
         BAubV8Y7gHz2m6nG+k3eWgyudxtfSe6wuTJHC63FqeDvjA+AXOo873bY8Yq7tLuSKe0w
         GzTPnGrGH2NAfth8hFkt4KUpzujDJNz3lUfVDlwx9ynE1iGqzwWw2apHCnkmDpYwKH+v
         enaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Sp0RGi5NmaP49iEYxVtxwSOEg/eXQsdxe/qX51EHsAw=;
        fh=QhbW4HU1C7NAI9DwGHu1MT+VAmUPwmAUcV5MKacbKnM=;
        b=YAqZywQ6s60iRXqPW2VGS2sM78wAoAr/utnYqkr+iia2vZ4JWHhBQnm2ugGXITxYzX
         n6OG7opnmgXsIqriFC1qXUfXw89OnsswV0jWp5TfyULrcdUsrwZJR9TbfelAjtwU5E3z
         pHC7PmLmDAwgdiAwOvQs6fTQ+vtrcW4tMwPxrz2EoxygnDt4KyupiC7ujGaSTSOVGAxK
         vCHJK1MJLmTQEVrRWgXRcZQ4vxnGeUuwvxGRSDCvE++zVDsuSPIoM6Bxv7JiAPmoumda
         SuFmJvI97VCz4sn+9qBnyhC+LxjEhUJWgSMhbjOrNeBf252PdKS9xPREjlFH9SHMnV76
         LxnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1780505178; x=1781109978; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sp0RGi5NmaP49iEYxVtxwSOEg/eXQsdxe/qX51EHsAw=;
        b=f0aC1Zkck6EjFUmi/1a2qkDwxc0qjmQuCs8Shzkw/LGhy3/hDD5qKDPpl6l6jA8bOJ
         WJiNpQXqPr4nrvX46TfbcaNiX9+niuTMyB1E3jxnB6n0hbYyTLMvR2OgwecNTS94QY/K
         kg2Qq0yTiNFI/+A6ItTW5YkvapqBC8ek2nlBJuBTJiTBminVL2Vgy4nCrNh6Ff6dIEt0
         KMEAq5/aTr9zY/JwgUQUNgUJ85rwSAqY4edpiCAmOd4JGO5xiArsI09ciI4yE99ya8HB
         I6jRDgGO+Eub3aygnvIV84/rWiZC9w197ez9MtDB075PnOsK5yWwRVR7avBVIwbvYvDm
         XZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780505178; x=1781109978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sp0RGi5NmaP49iEYxVtxwSOEg/eXQsdxe/qX51EHsAw=;
        b=PbqZSGNYBIT5cngf1IFZGKdpWfKYsugtY3DrdrMmwGhVF6l7ehlRh59/+R639qVw3U
         Kmz6F3AGVCdBvLnbMwvWxiYOjmtP6tHtFejOy/WrUErzdDFaMslDxoHVdRmIbkzDUCRZ
         Rckzcio+Rdu3TQzKyYRsldSEkn66oe7r8EprTCQFpNIz4e2KuEGQGmI+UZreOJUnsCjz
         pPwOkmZDH19PYtnmbQwTPaX9dEXQe+NHA78hobSzz7hrMEy0nXCMv1VHGHUtunGpMGhz
         I0+nfqNpU9Yab13v73TUi6Zn1cxHOWZu6DVZiWBQ5vn+Kd3wD2jaAIyGN7Z+SCa1TBD5
         kK6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8dGA8DBw0WQDmAacUKF5awplmVqh5bI7hBOOhZcsvRjrdVv1L6JZLH++QinaTAIDJghFr+AtJ5iMS2m0c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFl6aB0sQvjF+bpFL+UvbjanM21Lu9nfFnoJVbkjJoMrMaorQ3
	HRkBp48KfXE155qbP2jJcaBhEe+DuK6ARntRvqHiMSPeILkSOo8Yq/Nl17G1Q2IXXnnalf+fxPh
	PAPCDdlBU8yzJncBPEIDoxftMiBowLpEMlZXJ+0SDpG8=
X-Gm-Gg: Acq92OF52I+tFzYoO/xSWk6EyuUWYusec78nS9tCz4cmSrtCmGXhns1Ft0TuL2wFsWW
	gE3dbSVVq27zbc64x7KAdMTBveATqEnsl1BlrV0YRzWv2tHYrODaUVP5x/wMQBsWIhwJXhIGCrB
	aPII6nRAZquzD7Af3DFaBh5so1PiltZvuNFq0YFytBjEdrZxwkj7biJjZsUgqCS6hOW3qTVzvrs
	PSRj2FsVELnIY05DpwWn9U5VaEDZ9bcjMt2HLyCWtDFvP2R64iqo4HzlwuiRoFnVd5pwRuTK+K0
	dRv0Ndm7grHSOY6VQhbwOKawFS6jcM4kskZOQPN4TzrJogSK1fbWAY5YZjiExy4r2ovQGU6OQd8
	s/Kf6OQ==
X-Received: by 2002:a05:6a00:2e88:b0:842:1ffc:55b4 with SMTP id
 d2e1a72fcca58-84284fbcdc1mr4542715b3a.36.1780505178146; Wed, 03 Jun 2026
 09:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603141355.68156-1-doruk@0sec.ai> <2f3ea9d6-a483-427d-bf81-ff26627f4f1c@intel.com>
In-Reply-To: <2f3ea9d6-a483-427d-bf81-ff26627f4f1c@intel.com>
From: "Doruk (0sec)" <doruk@0sec.ai>
Date: Wed, 3 Jun 2026 18:46:06 +0200
X-Gm-Features: AVHnY4J6gY9pqDSXMaShzszHsJrbvb7KD7f_CAT036a599QygxqxvS8l2JPk_5A
Message-ID: <CAPdMp1r_fPeqHC9LeEek2+u9JMma_h+qtg=CoGs5Gpp+QL8ivw@mail.gmail.com>
Subject: Re: [PATCH net v2] nfc: digital: clamp SENSF_RES length to the
 destination buffer
To: aleksander.lobakin@intel.com
Cc: david@ixit.cz, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 03, 2026 04:28 PM, Alexander Lobakin
<aleksander.lobakin@intel.com> wrote:
> But I guess it's not needed at all, we can just silently clamp such packets?

I agree, thanks for the review!
Doruk
