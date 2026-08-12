Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3512338B7B4
	for <oe-linux-nfc@lists.linux.dev>; Wed, 12 Aug 2026 07:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520125; cv=none; b=exF1VyjS1jot33kiyqefvOEvpbrSqfLfdf5oUQdS0KPI1B2Ym5OLg8z/WcHQC31riou2Jv8u9lfCb7wsnbw/JEEw9uN+/ffJUvKuD9AjkOh7oqO3u88FqPmEafmsZ6FLkEjWUWDBVEAI5IrW2lzNEkGtMbzD0JnOnZmJ+LUtrWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520125; c=relaxed/simple;
	bh=7B8tE+cjteSKGkPNTNCILX/erEQE+pSMtnVnVaNdEqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gcHzAWFVIRCT3L+cgZCqWOwNEIK+ZCI7GTzmB5riwqGqQgPPo5989Qjy0a9EO0DezO9vqppT2OH8YfQ29LolGRaEnbQeArmz4xyHCEQ9zHl95bZqKykHc+qSuj0syAp24TPp72N2Nz7JSyOGAhPrfN+mNt0vshXESzOapH/c6ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDEug0ze; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDEug0ze"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceaf8a1265so7240755ad.2
        for <oe-linux-nfc@lists.linux.dev>; Wed, 12 Aug 2026 00:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786520122; x=1787124922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7B8tE+cjteSKGkPNTNCILX/erEQE+pSMtnVnVaNdEqs=;
        b=MDEug0zepdjnMQ2Iwjb/VPwsm/JxxM50LkVanfLXPpy34645dX70HBuClviO1C+nxN
         Y3rfXyTIzJfKslbEoYVfK65LO31EZotOIZvjmFKQpD4S+MJGuYTEKHkKRG8QSM21ZUgI
         djhj6WdhcqKb2idf2eFvlI8xzL6O3mawukVUSETD6U66M5NwFfcgdzL0RjQ6CqevL5ok
         5VMX3Rp7n1kSSwGKbASEaTo1BBv8e6Gu7vfkVKa9dG0ehqMZ6gPfhSsYhkLTEw231hka
         7+ebVMSBXyoKqiJXzqlAaSZPKwd+WTrFiiuNgxB1Mev06vK+Ls/pEougVSProxZRoOHg
         acUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786520122; x=1787124922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7B8tE+cjteSKGkPNTNCILX/erEQE+pSMtnVnVaNdEqs=;
        b=TTT1WVysT39n4CiyRz/jl1FriKQXGruu52WBwxtwTG8kKPEfFlF+kNL5AYkWj5+19k
         d+22ImoQcguC4XRo2snIBe3bydKleteJzkdLCuD2wNw3KYgwPWyDDRlSmdy6Pnj/KW36
         bB7xDMOc3IueqCRALAAdf980k0Vm/mhH1b4cJ68xmz1lWl3z9UP4qm8l/RoKeGW8nOAL
         Za57c9A1S1qoVqr97jF4co1645ZYcbUusX5x1paDTHeBpKQ4OhQLZkVvy+X4W5ajuhQg
         p1XUg4MvZx6v1mGD9pXci/clZXy6BdcT4scydlgMhbbx5NtgFHHlXNvmTFO0AzZeFK+8
         bv5g==
X-Forwarded-Encrypted: i=1; AHgh+Ro5JfUCR1sdpWOr5tNVrwZGzw1sMt89PyfLiTDj1f9YGeIGyhzerZsLrNIWcfIdifCpyqkwQb9Oy5TYsx4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyarwjVvZ2mN/6O3ADA89j7vUHJDQxZqDgq9BtgZZdA5yjnMJJ
	I8wT5YZyR+mM9q/f+hXpHcDFcA4KGsP2gQOKLRJa64ba/eVCDF2XJvxa
X-Gm-Gg: AR+sD11sFXMI9MXh8fwE6CbM5b+E4xjhQwD1ZL7kDF5yaBJsGf/DA+qsn9SFfmu9/mo
	WrpnFAicR1Z2ZP0riYuLZE2tP53Ec8TJioVOzPkOwj25PbxXzx1fAfKacb0gVGsrPRHlloKnAnI
	X+/9uTJimbOHX55evduOKfXltoJ2xFnlceOQrfdNoUllt0m4/YKD2Gs7fCnWUiKV8POYyfRK/R5
	kPQ2IDXsBfHZzA8+SmU+/3piR8cjmqYgmxSqrA3X+lsTwI+4MZtn3nZmbGW//29D3iu5UkoBCo3
	8t2DRN/RfOr4h7CAfD3BuAMvz3atvtNLQQhU/NoNocKz1TTK+J+xu0wyW6so2wQbgLC7enBQcqo
	NpuCX1OZA0aIC2YwijTIrfjwB4vO4J8vBebIoVYa/3pJpBOXEdoCtdZQJT2bRRmA3uZokG4mj43
	iSl0QqgbTi2vzqKZhf4xbfSTH1Yj18qyireGHI39zh6VsUQyprsWBR+tJ5bN49/Ac8YSk+UnohW
	h1b/fKmKXTHs23fg6st4JjTizA9bUCVwTwDMx4u+XwSVz7OYMj8
X-Received: by 2002:a17:903:2cb:b0:2ca:d658:d874 with SMTP id d9443c01a7336-2d345713af3mr38231045ad.23.1786520121828;
        Wed, 12 Aug 2026 00:35:21 -0700 (PDT)
Received: from secrnd-cstp.tailb7f510.ts.net ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3511496f9sm2661295ad.25.2026.08.12.00.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 00:35:21 -0700 (PDT)
From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Sanghyun Park <sanghyun.park.cnu@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Joe Damato <joe@dama.to>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Kees Cook <kees@kernel.org>,
	Ashutosh Desai <ashutoshdesai993@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Deepak Sharma <deepak.sharma.472935@gmail.com>,
	Michael Thalmeier <michael.thalmeier@hale.at>,
	Christophe Ricard <christophe.ricard@gmail.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4] nfc: nci: Fix conn_info use-after-free
Date: Wed, 12 Aug 2026 16:34:14 +0900
Message-ID: <20260812073415.507615-2-sanghyun.park.cnu@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <8e5c2ea4-53fe-4dd5-ac71-5bb3ab5ee911@ixit.cz>
References: 
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello David,

Thank you for the review.

> Could you please rebase against
>
> https://codeberg.org/linux-nfc/linux/src/branch/for-linus

I've rebased the patch onto linux-nfc/for-linus, and will send v5 shortly.
