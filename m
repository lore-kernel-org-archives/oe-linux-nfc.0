Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB49F416111
	for <oe-linux-nfc@lists.linux.dev>; Mon, 20 Jul 2026 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784550323; cv=none; b=UZJro4vyL92p1r65IcxhvjRpD398pEfY1gphmhi7JSTvbjdc6Lc/6TkrtNvRO0b8iBloHXmyHzwmj+iUZfy1Zb2FPyJfwlGyFQbleyLl88rpiWwzigafDm3uqdvDvAqJeIbwYtdKmACNKznj3980P7sxHn7RrZNWz/fKufuD/Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784550323; c=relaxed/simple;
	bh=YJC7x5mwc8feAI0ftsL5R8MF6dTVv5JMEnBF7m/SZB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eG3uUUnSb4lhzAQ1zpLIfBMZ4f3j/Tp3EtNzBICHg8GbdE/f+CDs5NQR0Koxkv+RQKq5FuEyVC6BJDFLhqe3j3bX9PIU0Eh002jSg7dOrme4KhE6zMb4xXjTP86n7xG855I11lUXgDktNYiJ730ArZCXtTe+mcqx6KjYmvb1Sao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=C93/UyMY; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="C93/UyMY"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so6244767f8f.1
        for <oe-linux-nfc@lists.linux.dev>; Mon, 20 Jul 2026 05:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1784550320; x=1785155120; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJC7x5mwc8feAI0ftsL5R8MF6dTVv5JMEnBF7m/SZB8=;
        b=C93/UyMYApIEm8Q1su6l69kRziwkOZEAjtmWCtUQ0ZnvbsKTkno9Oh+QdMZ+ZuCmnn
         ov8b1yGYOPLt3s+APIDhN3jzE6a3q5bEqkWppkGyNc/YCKbyw+m7HSHO17c9fz7ZFUV9
         9Ymmjh6pQHkgn4soSF9Y4tmKaq5fHjP3D/g+C8+Uq88904ECsIvfkxULKu2kvnbf5Hyw
         +07SaaqVPHWyFr0FqGvW6rdnUMLqkxrlaj0IMnbyqTl1ct1eiFvRhIqt79/LlEdfHRS+
         21OOsk41R6PC1nYq0xI6uOqtGq370PkvaWyFocZIokjZKfVgZ04f9+0ycNKhcNkmfPwe
         p+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550320; x=1785155120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJC7x5mwc8feAI0ftsL5R8MF6dTVv5JMEnBF7m/SZB8=;
        b=D0e9UX+pCqNbiXu5cAVzFX7dchCA0o+YItD0xHue0eM1KDxigjG4vug35DaF7N1/+1
         dMWO08aqGFAF3VmhgA76dIV3QYdEDvFCKDpMQDNZTTov1M+sfzt1DTWcJmWUtmMv4pt6
         EFQf82rEfKHK0GAmTvp/Ib/ttBv1mvYYUYMfSdcx7VzkKcFYfFec2+Q4kqlm2jC+OtWp
         k4tqRHtGYspkWLyY8B08EdF53OQQBABBKPpH1DPo503VHqsKQuhK5OtTqnJTaC6XKQXg
         Ka89C0W3cFL8/gS2caEFDjCtSOuSnFCxkqnqODaErlZ/gXb5dM8ePazod2SIJC9/cyAu
         sb6w==
X-Forwarded-Encrypted: i=1; AHgh+RqU2w3POFjsPXx7R/qhEr+vtx90Zkv8QQq5eH07lavCsCCFO5x4EjU4Oscli+moqdyOG28i+p4N7EFjYXs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGa9uDxP/qHUt/PqhyRx3r/w/xeAVwL1x3ZdMEc9aok6h6yHus
	0v9PYTiO2fqg0NywTPZmAlH3bD7c4X69uOiRHkTxmQ9C/5riT5YkLGxsSq06QTFq7Ck8
X-Gm-Gg: AR+sD11aAJ4boR+H1pZgpKYyxuWOz/3YRX2MlLOi6Xi3btXyed+Rh1neFNHzqXFw2I9
	0g7NZB6o3R3eZilXd02Pm9QW06n9CW0tgNBjHwJkktyP5NRbcHaLb/6C7MBylCb4G3YVYJiU6dh
	H+9inYlrW8LyLe00ONBCIiA9e0B1OpTeQcM8cnTGUPXt1K5bkeD+cBINDCtPetzP/OT4mk4ZSy8
	xsRpTXN410/QugJKi70RSG/yWH8uKQyU25D3g+AONHNNRM0ugfxQo3EWKIraOLiaZpfR1PxnnRt
	VGGleTG+97EpXbqRWZLTsniwaUWd0KJwNdLe7UdLkq0KSu6zYJj7ZZj76F1O71xPEDUjfZdLFEk
	v70c4B2aGDSdAAwy6Arb/Q36gAXUfNxjnwiavxUTTvrZfVycrp+UgdX9UivzKZY1ULOKlhAyn/Q
	YIPmw9WF0+R3m7rZndv53ZuZu8IyIJaPFKnnT0oTXe40Tzv6S0AEEP/JCP2L8sOafjkbPnp/bLp
	t4CRpQ825gMXGGi+w5ooAOn
X-Received: by 2002:a05:6000:1883:b0:477:6874:5413 with SMTP id ffacd0b85a97d-47f6232e170mr14743966f8f.58.1784550319642;
        Mon, 20 Jul 2026 05:25:19 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.219.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e51c33sm25636889f8f.12.2026.07.20.05.25.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 20 Jul 2026 05:25:19 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: david@ixit.cz
Cc: pengpeng@iscas.ac.cn,
	oe-linux-nfc@lists.linux.dev
Subject: Re: [PATCH net] nfc: microread: validate CARD_FOUND event length before parsing targets
Date: Mon, 20 Jul 2026 14:25:17 +0200
Message-ID: <20260720122517.22197-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c1e0bd81-15ef-4aa0-a8d6-bbc193d95cf8@ixit.cz>
References: 
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 19/07/2026, David Heidelberg wrote:
> thanks for the patch, 1. 7. I got the same one from Pengpeng, which
> needs to address Fixes and Cc tag [1]. Feel free to sync together for
> the future effort to not get duplicated

Thanks David, happy to defer to Pengpeng's, it's the same fix and theirs
landed first. Please drop mine.

For the Fixes tag: it's cfad1ba87150 ("NFC: Initial support for Inside
Secure microread"), and it wants Cc: stable@vger.kernel.org. Hope that
saves a round.

-Doruk
