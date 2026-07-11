Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B6633D4EC
	for <oe-linux-nfc@lists.linux.dev>; Sat, 11 Jul 2026 07:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755548; cv=none; b=YvGmg2LlN6t49vKygkbthPgn/OjTzzSoGwqlFRdOq7zyr0JnfZuuYe2LYl8ugQDhB+wcvP8/A3vD+f8GTiev0mp1B5otT8UO8m1bsSa/VSCfUYAp/nqIPiie9JXF1B323i4N9n6lUO9NFCQfug9yMrfyMH/F/W0rosdvbXHKuyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755548; c=relaxed/simple;
	bh=be+u06AdYrQNudktwkV4S6TmLYRJkKzVLJTnqQZnM5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyqDA/vLyFUlDj+6BsweYVqkinCLj6bMDFQUN5GbEYO4xs0CJfGZsPoxhpSY8E8WBbgGWdb/5Yt0iI8+eT2nfNw0SArV7RUL1qsaOqcyyh56mGXacubkwjSopM1Piwwum+PiiBylFXxCkT5EFqUZtFNUzApJOdGm1koDa/nTNaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=VKLqZYzK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="VKLqZYzK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso10973775e9.2
        for <oe-linux-nfc@lists.linux.dev>; Sat, 11 Jul 2026 00:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1783755545; x=1784360345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=be+u06AdYrQNudktwkV4S6TmLYRJkKzVLJTnqQZnM5s=;
        b=VKLqZYzKk/Hdmu+QOEKwS5YFOJiqG9cKTLO4Zh2vQ6aIIet3+ZiOP1Pu9G9FBuFOk1
         B4pRY3GmdDbId+4pnpQZfjErds8jUpPVmJSzEf7J9xFhmbzRHhBfbh43bTIJCNb8rsDz
         iL2a5DVHegB/EPwO3jzWbC2vR5x/vRbj7KfVZydKV6LMYaB8aevqPNo3g0UUQPvydzd/
         pw2yfv1lykzscMrLSdgXRX5CfR95aFAth049retpJb+LHYQTs4KnmBWrf+vZb4TPavG9
         1C7uVyDfzB6URS3WMg7MwxKWyxL7HBkZ4maDZ64/3rEenLF4L/xD9PKv4fydbP4Hacu1
         iEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783755545; x=1784360345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=be+u06AdYrQNudktwkV4S6TmLYRJkKzVLJTnqQZnM5s=;
        b=Whu3xLnVfhIqZNKhQdIzEy6bO1QTHQlFla4NnP0y9xB1WK8U0qqves+1fGnA61Iwl3
         8Jc86R4SIThpE2ejEZpLh1PBW7mSZINXsew1nvrgODd+RPcbYgyFlLn/55p468fXKDAa
         hbSGxSgp0j/qjDYzdd0X+HCJJxG6djcl7xAdml0mHZETQKZHA2t6EwntWnuht6Hyvcp9
         VTuNQfYoQyKMQCf+ge0JOiVfF1Nc3faSVMzZzM/zK1l68aLP0KZZtxCWGkuAa+N0i8Xs
         W2bODLRKF3hbSnebg3vktQu4SrSzMGnf0gHrkHyv/+RGdRUbYOUDfd+xar0jFcoFCdUB
         1fkw==
X-Forwarded-Encrypted: i=1; AHgh+RovhR9NuRc8kA0TuaKpoJqQqVz0k+fk/rolqJ4qF9DUZWx6syrGfyaO9xoX0N2uhXn8gYjQogWkvSO0wAo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZWsxTG2rjEkdHg10NRzu+WUrBdlHtXPeSGbXCsbfbf/V7rVTS
	h+4+JhzBLIpLGvw6UHZRJigjXdXmnf6mex1iqHHKIIcQebQLkP3U+LVyoWLXdFZOiZ0I
X-Gm-Gg: AfdE7cljNl05MKYcmh3/qLkwq4qDEt965PSGX6GLhTzt37wIIDW7VpSB5Wt7ynUqK0Q
	4IKQxTcmpR1spLbWG5ICS1pFd5pW98Gm0Pan69AY0mDER50VZ0om1v5mlpDHGaP9lJwA0bK9E0M
	UhxIEI5pN3ZBIpltNGnyP0uhsRmoXIgto/Zxa+chEX2MynlGARZ2P8zRwrmg2kRDK1ueOpa3bRS
	i8xxXjefuEx6y4CmucauB2lBLNyeXHePJbSRsGryCoazNrbaUUAvicvFBarIRMv77p28j5HZQAs
	RaYmRMBw3aEEc/t7isn8GxgxQL+15FcCtp/FBurk6FJeGDc5kj1Kzbs90mAdUGlkOq43GR6inn0
	9GHTtxvv1IAUKtMK/md/ZvHgFVEnfgsHMONLk1CvzSzXXilCVjkpoU0EUQ51Sk7209nnuFpm2hG
	uRmztNzeQLRgBge9UNAQKD2sDoeyEY2cB5oZvOR0d45dvPKxU0rfNi/cw8piOyVWPR4RQuHvmrg
	5BqRvhe2ccT7HAuxWIge1c9mNrBFe0lXOU=
X-Received: by 2002:a05:600c:4e90:b0:493:9b02:484c with SMTP id 5b1f17b1804b1-493f8826b9emr15373425e9.29.1783755545138;
        Sat, 11 Jul 2026 00:39:05 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm61374217f8f.31.2026.07.11.00.39.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 11 Jul 2026 00:39:04 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: david@ixit.cz
Cc: Doruk Tan Ozturk <doruk@0sec.ai>,
	horms@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] nfc: llcp: guard against short PDUs in nfc_llcp_rx_skb()
Date: Sat, 11 Jul 2026 09:39:03 +0200
Message-ID: <20260711073903.73366-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711073012.71066-1-doruk@0sec.ai>
References: <20260711073012.71066-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi David,

Sorry, two copies of this went out by mistake. Please take the earlier
"reject PDUs shorter than the LLCP header" and disregard the
near-identical "guard against short PDUs in nfc_llcp_rx_skb()" that
followed. Same one-line fix.

Doruk
