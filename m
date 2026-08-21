Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC4B495052
	for <oe-linux-nfc@lists.linux.dev>; Fri, 21 Aug 2026 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321707; cv=pass; b=rPwa+27eyhgmFGoTy8DmgJ2yoJ4iLYMq1DDa5xWcjJHeXUJ9Og/BAP8ZFOUP5Q9Su/zYiJSGK7a+++LU3VcyQNxlMwOzKeOHW9t1YWEUapp4DLWtX8iutgvp4udadHlqHYK+PcsaxfT8OnlvtRs17V04Hf/f/d83MWiBRj1a2TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321707; c=relaxed/simple;
	bh=TccSS+NIaXCENyWwJJSgaLleoIe7Il1Nz65FsBDFwkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gKgmqE9benCFbFou0VZ2GuoGn/Hs72T+ixhQcU08RoZE3CubwPFpzT4dVaIqvtERQNj9v8jdPZNfIkj/cC1jWVZzu5T7QS+WJ72Tcf92Mizj6sMMG1XR9EH+RBSqsuXXZ/glS4g0qnbHsag0VTHaL+qkLrhybBnFn2XOwPiTkos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tEZbCLEP; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tEZbCLEP"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c08df8513so6320041cf.3
        for <oe-linux-nfc@lists.linux.dev>; Fri, 21 Aug 2026 07:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787321705; cv=none;
        d=google.com; s=arc-20260327;
        b=avVOn4B2dmzLKSg2cWnC/sUPy3BYdP6o0EZrtQ95kf1VSvdDdWrb5TYhQZiQWoJ2ru
         VsmQgl15ybfn/dOap9EThPbvIX2luj9vnZvz2o1c8/7Qf5MHNB6BmGe4OqTbWfg4JI1e
         BPUBkJC5QYxF4itqXoOQ5Ulhv/nzDIMgt495fHDuIrPH2qPzN2x6/+OkGgGMiaV7f2b9
         uMrufZz42Tp2w3vnkYOltd+0MIfWASv/etw908d6NjwhuP0GPlGyIpBMJ0fQGUNkaX28
         qPMh0WRTYaWBZtQbXhzV0GboVjejOI2eY6eaWM5hWcsgv34lAO3DZ0P0eSIUQDKDbVs4
         w+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TccSS+NIaXCENyWwJJSgaLleoIe7Il1Nz65FsBDFwkI=;
        fh=V/kCgEDTR3KnKFLGTmkQ83nVnMy7kF4wqLc8E36+8gQ=;
        b=ZvU4NuGqYpp08WM8wCG0rxXPWJyRYGiPUboHMslRHI85bf2CGooCRx4HRx/uW4rJa7
         7Fw+ukTlRT9+TwO9i9ND7l34N77Ij9SzF65zCZu3pbT0sKW1ZaaLIafNKO7WHFomc0Gs
         ilr7jNPPSoR9E0BVQ/EZ7aTEXXt6KSbaQ54rikqV8ZpgSq4zm4D5zc46dHlbo+s2ei72
         p1GvacIPham7gv89ovQPGLye74BX4TH6C0FjTcRnc706WdC1HmUmukSpfpYFzgbBkIbL
         OiTIzZNz1EOM7ULxvBnWzi4+itfUMh/Rk49uLIYfR1YgecswufptawZJknGwa0LX8rFx
         AjCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787321705; x=1787926505; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TccSS+NIaXCENyWwJJSgaLleoIe7Il1Nz65FsBDFwkI=;
        b=tEZbCLEP23gCmhgP6oL9pkivx3NmRgbGsfMB3BIWxVtIGXRTT60281vCMBOC6LJRZi
         aFkC1x5MmwzwVy6UA6F8AOOKh9dm/O7b8fo24b4s7VlZsLEzXX2svcKPUi6fIh8KLDWX
         qShPD6DdTC2wCOJhf1meyP1EUU/b9Ij9BcsRH9Pqssw3DlVcnSFsyYA9UK9T0Lgodm46
         V/Hfm6EF/Kqsh6eYmNgiS8vOAo1ry11Y6ntOBa1Q9nyFLNEsF6uDJItymh7sDaZtFYxw
         SN2iT9O8nbaykvEULjGTA3yDS1hB1dPoaiw70k9/sq3b+GryWJ2LmcDO3Cx22J+hnzWn
         ioIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321705; x=1787926505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TccSS+NIaXCENyWwJJSgaLleoIe7Il1Nz65FsBDFwkI=;
        b=IzabBmhKgr3laG+zi/x0ZBlMdP4y02NY4oEEnw0zRzqUOO792JS9xznMCLN9aBzNiB
         8JLo6VkSNh6F4rZiMDbJE5ux4oK0pvA4eXrhC3GqNUOFs61yMfUEUHqbC9ejrxXCD+BN
         DjVCWDtFP2+8bs/itOtqkKEDab10BtSUxIfTyTNLNZ047iGSUaZaUZYywBF+8//SLgC0
         luGQ58ev1FGpjwBp1UQaeJntgU9dM+03gCnomBpGAOcxkxkSvGX8l2HXC2R+dyHL657T
         hCw13zDEV2XfG3yp7wB6etH2qcgOvFk5UvV79h2qQk/M4UI0CBgSbLYSg1J3C7dFCtJB
         /ExA==
X-Forwarded-Encrypted: i=1; AHgh+Ro++nMT1zx0jgU6UDUVtuY5LI1hkpRSOheksTQ7zoa+0nT03Ki7iElIpKhICT+D0ICdQ1+s5BA9VMjJVHc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+oq7TVXvW3cXlhNdPMVTHgrUJoFGx+pued0jqCy7PLuRvPiYu
	0+jFmUMTltoaJHUNS31J0TEoAlcnOcaU4ghj3+PYLa20dolAQFiPHg1QE/f52EtgTguvj1dCkqO
	upQ5d9nCRL3w3T6GKQandAumfm0drn0Z7tFkvB87+
X-Gm-Gg: AR+sD12UcmEIJ3IJWzN8CRarHr1pQ9oZHC9F6LypE8Cp2utwF1+pe9rKRD2lszAU1Sj
	UbEuK6CodqMDIU56O0W21fg4B60ZQQNRrC95O61denJizpjA05/wulJM9mb14v7MGYA+3qOijmo
	VRwnK9/Ku7YGnP9/1VVBO/tCnmEV9puWw69Ww71+G8/bo3V96jU/kqycvM4cYWxqQLMUzHzCjDf
	33KEhBXLe8sTEZCeE7Hyc5iNHU/7wOd4cIcqiSfofPCWxaG2Hu32t57xu4QUnx0aNOLkU6fT35W
	s3ZaapOXPfgnYDqLT106hecmhyjQwiClVV4/RaoV34TdSkkoV+0CCYDMl1UzYPWMiS2YMbE0b4w
	E6NQWqtsmzTHwV8VuBRHMqsWwQ3trVWYS1BLz3nP/bvNFIO31dXG24Ivn5Q==
X-Received: by 2002:a05:622a:14b:b0:528:38b1:b54c with SMTP id
 d75a77b69052e-52df56eb847mr62757171cf.2.1787321704290; Fri, 21 Aug 2026
 07:15:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819050031.2725592-1-shuangpeng.kernel@gmail.com>
 <CANn89iJbOs54esoGSukvMiYnXQkHadnC7NgQanbAXOeiHXOsjg@mail.gmail.com> <F1E58A29-96B2-4BB0-8840-8A168477F48E@gmail.com>
In-Reply-To: <F1E58A29-96B2-4BB0-8840-8A168477F48E@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 21 Aug 2026 16:14:53 +0200
X-Gm-Features: AcwNN1Ug5BQfMCgHF1cykLrwRDkb8I8sreh-uNSxFtMO9C306K_evZ6Ynhi4Ebk
Message-ID: <CANn89i+Oz1498M1YGnMCUmFSe3TQxLhP=+z724e5vsrkUnJu7w@mail.gmail.com>
Subject: Re: [BUG] NFC: slab-use-after-free in _raw_spin_lock_irqsave
To: Shuangpeng <shuangpeng.kernel@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 2:54=E2=80=AFAM Shuangpeng <shuangpeng.kernel@gmail=
.com> wrote:
>
>
>
> > On Aug 19, 2026, at 03:48, Eric Dumazet <edumazet@google.com> wrote:
> >
> > On Wed, Aug 19, 2026 at 7:00=E2=80=AFAM Shuangpeng Bai
> > <shuangpeng.kernel@gmail.com> wrote:
> >>
> >> Hi Kernel Maintainers,
> >>
> >> I hit the following report while testing current upstream kernel:
> >>
> >> KASAN: slab-use-after-free in _raw_spin_lock_irqsave
> >>
> >> on commit: 3aa1dcaa4f6f5ae08936491e08bd456f331f2d40 (2026-08-13)
> >>
> >> To help trigger the bug more reliably, we applied a minimal diagnostic=
 patch
> >> that only adds delays and print statements.
> >>
> >> The reproducer and .config files are here.
> >> https://gist.github.com/shuangpengbai/f7dab4725e2a2d57b1d302714c93c549
> >>
> >> I'm happy to test debug patches or provide additional information.
> >
> > Thanks for the report, could you test adding one skb_set_owner_w()
> > after the skb_copy() in nfc_llcp_tx_work() ?
> >
> > Something like this (untested, not compiled) patch.
>
> Thanks for your fix!
>
> I tested the patch and reran the reproducer. The bug did not reappear.

Great, I have sent a formal patch, please fell free to add a Tested-by: tag=
.

Thanks.
