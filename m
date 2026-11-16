Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810348;
	b=VSlcKbN+6vXd0/9umErbzO4onWLA0rE7yg0TETfmnBn5So5sYGtuTJ1Ut1/nICU/ugVU
	 IPNoh+6Ii4gepQB0OCK0zzaRu0dl3ErWgMx76mFrKbhsSglTB1EDtK/katpzzfBZkV0J4
	 A+CTFhuN9OCcewRF+DIgkUYX3KV9biuSAqahN65ocPADkh1V6yUklOipYsgrSk6fc1RA4
	 haLDK0AlV58tSV+D6EbMOowx8kJ5Idz/U0+aQLjBs4mC2OOUgcGg9COwMjq+6XplfACxg
	 amuEDlgrm5TQufKTEHUZAqj+vpuZc8EJjajFB7mhD1B9L5dDb48Q7289cpiWVNQbqxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UqI2rR4S/NYOEtKkItcu/tRll0s0XIsV9mZE5MtAea8=;
	b=urxDDg0+XcZzPK9WU2cwSduruoSe35QzNf3PVJGy9+KsEKbTXQVKp0gMpxP7JxXBvhKr
	 ShEMfqt/SUVJYRRnhhQ+8TSM/02Poytxa+friZRvAmHX/18N2s5Jb4shfGLee9UxmBKWN
	 56XCf2aT4gzMKXWRPb4BL3zudtkKqRYRvhHiuIA8MVqlFHRm3yRw/kfbmlZc32y8d/SQC
	 Sgdq/l9zMwy/LXlzBEdE9HLb72YNcv98syjHtyNlSNpGZ8aloGTjLTCViVIj8dbJjONjo
	 PcnONv+OO14EdeWC4j+lyVfjJPGv3eTwuezcNRJnG6s7LtW8J7iTAOOHpxkOoJAkGIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qT8hSapO;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B200E606A337
	for <oe-linux-nfc@lists.linux.dev>; Mon, 16 Nov 2026 06:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B200E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qT8hSapO
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so3307316f8f.0
        for <oe-linux-nfc@lists.linux.dev>; Sun, 15 Nov 2026 22:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810346; x=1795415146; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UqI2rR4S/NYOEtKkItcu/tRll0s0XIsV9mZE5MtAea8=;
        b=qT8hSapO4qj1+s+HYrSoZh/qOZRMkHPi9PYAlqSnn9UafSzzZ8xCg+xkWKw5sbJEnl
         PJDnf6OW+BouVQJGa8ndiARO56e6tc8zsWJzCMM8e0BIVeDxxxlmayT6Mi1lltRgWytq
         zW6XpFWPMsb+oMJ9o8V4mXuVBPuDjkNOrqBzaO0BxuPdanoNM/iKVTmrCUQYwG464+jQ
         UlutLHjDtJAFcfkZ8yegC79ribKXh1BRs8vMie54KjnCPuXWwsNndpSCm+4W1HwtEcR+
         Ebx/fNDNXmLAvh0b2eaac5Z/Gc7bdtG/AbCond4/06A/pMizGAzkhrwBCWrLc8svWdPn
         QzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810346; x=1795415146;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqI2rR4S/NYOEtKkItcu/tRll0s0XIsV9mZE5MtAea8=;
        b=hIxVTNyCKaJkt2G7iof64zvodgMQi3+9wf+/pFCR2LGhy+b3K78uWBVWjTY+tzFQ0K
         b9u7p0PcXnMPmygCBDYDfZx/nngXNA7CbQMAl0hXKq0FtgM6laI11YBqfw/q/8nH5m7A
         oDxwoAhiUKza/HRPgkWgSN1uPVFu7CZR8gJSxLE7GPjeYMG3O/aeCsxLJB2ctMq8NNYB
         NqOVPUEM0emhhFQHsinWphBTiQWR8nQUO6ybmrqIRNLZJfVdxdgKX7W7nklwKblxBh/b
         /fARp+A/XBz8tJ6cpsx68rgIYvtMHuQ+S1C3V1agDzVK8ps2PDVwBHilz4QQDo1bhuOY
         G/Vw==
X-Forwarded-Encrypted: i=1; AL+hErE+BW99FoFZ2pJ0q6geMaijt/P83nA6b98N1TqHmOBbRo6tCYV7Pa93GHSDqtNHpQTmc9Va3/vyETZlYK4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8KCgOkF0yqLDZ0MgE0dVZSrRPRGTAPIUbLjHXP90WJ0pMluFY5
	vbIK9NaXXl/RaJYsyC4+W6xYZAcm9c/ADBZKOd2pP3bzczHFElocjKwB
X-Gm-Gg: AYBFou1lwcAqjNExZGKwZJqA8ZOM8cNez06HwKQYShQxVRXxKgsKRQGZzTsx02taB8d
	SBZVNnS64Ogbd3+CL0BJk2rQW2fnND6jiwVzUJmlhfBSY7BvZmdhUQqv2orwCJQrA/h+qz3CRuo
	vFaLD82WFIeQkfCdJf8xCws3nwe6pkMjYPE9wgvsmTIF5Lcm8oJqwpsVbbpDHAiDwCGcwuIGcEm
	AUkNMuOgTmfU+xE0P5lsyEnT76qjEK54ijUrqd0DZEkQDipp5muHyf394MwtVa5Og5aU6OcnvmH
	Dtnj83RfhxhfHPrODqIKc/Hs6gJeAloxM9jgXNkHHagdlI7NBTCRbEWne7Zf36Yx2Y0TP3DgfIR
	fKj0asuNyvZpV5aBXNK8DudPoRiquswbXvMFUZogjH/0tbrtMa6ctdSx3DZqDhH0SRakV+JdvtY
	SZyQGJEZ6HjlVeb3n0IO2HLTMnBd8B5f9O0swHmo365nJMYfwdArzC6f4Fs0slJCRvmK1xMK4uh
	vLzUdSfpXf1SscIacbzJn9SsSvPv2gxVsrvgOIM0GuUzYUtvw1BpQe4JMi3YdBSoF0/2k0hLjcg
	nLF3fSPbfZd/e/cQ
X-Received: by 2002:a05:6000:4541:b0:48f:bb86:cc03 with SMTP id ffacd0b85a97d-49c70ed7ff4mr14133514f8f.11.1794810346143;
        Sun, 15 Nov 2026 22:25:46 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm21676892f8f.45.2026.11.15.22.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:25:45 -0800 (PST)
From: Adil Tepe <tadilhusrev@gmail.com>
X-Google-Original-From: Adil Tepe <adil.tepe@basarsoft.com.tr>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/6] nfc: s3fwrn5: drop of_match_ptr() from the I2C driver
Date: Mon, 16 Nov 2026 09:25:41 +0300
Message-ID: <20261116062542.275485-2-adil.tepe@basarsoft.com.tr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811220135.472380-2-jorijnvdgraaf@catcrafts.net>
References: <20260811220135.472380-1-jorijnvdgraaf@catcrafts.net> <20260811220135.472380-2-jorijnvdgraaf@catcrafts.net>
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Adil Hüsrev Tepe <tadilhusrev@gmail.com>

Hi Jorijn,

Tested on a Samsung Galaxy XCover5 (Exynos850) on top of 7.4-rc1: the
s3fwrn5 I2C driver probes, binds, and does DEV_UP/START_POLL/DEV_DOWN
cleanly with these preparatory patches applied; the "s3fwrn5_i2c" rename
and the of_match_ptr() removal cause no regression, and the PVDD supply
is enabled as expected (NFC is dead without it on this board).

For patches 1/6, 2/6 and 4/6:

Tested-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>

(3/6 is the binding; I can give Reviewed-by there if useful, but I did
not write the binding so I'll leave that to the DT maintainers.)

The variant patch 5/6 needs a clock-rate fix before it works on this
26 MHz board -- details in my reply to that patch.

Assisted-by: LLM
-- Adil Hüsrev Tepe
