Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060979;
	b=hZe/n0LxzONv6necUB1s0J+I6/bNHCGixWR8Wggipp2ENhC+KwyMhSHTix9/c5xk10JP
	 oSnV3yWnDLZVCyjprPSOa6J8p4Z1A09EnOhRwmv2gA7D+jSh9cAZtC5QlLi7Opp6j59s6
	 JGB8mrhintY6OtR/6dXhyVUSJigd4s6ZE1BrnDqw+1ftQKennXsaN8431uF4fBRboLyWW
	 glyxoWlBb9VcYO5ELPYq+IT514xP4aKLUr+kTAhGUK/VuB2A/CzxyuF8solLXJqKoAtky
	 Mc5hLal1f87P2+aYg4nfsNuStyl2jSIgzHgSxO/dCcD2DPI69m1KDB9ewu2PEFmrOew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8YRFM8U63OEdRvVjTw8RvG7PNWf4otoP5rtHsWUr5Dc=;
	b=3HAhuwQdAGMkcqnitqKbC648htpci/JoXL3aMlL7UaLR6nEX52P2YhyME/gr2NcsXs93
	 LW7dP57LaRD11MmUd3o8sD7PXUAWJrDhP76ajncZxytRHPmzu6t/GsiZlP1BN5aZHGbJI
	 zB+AcMbQNXbW6tgK3JV8vciL6mOnaREQqE4K6/gPVumkV59oyJ1Pp3OyG/cUGXu2IT6Lb
	 JrgC/P3b7CSc1tI+NMvbNxRfkG1HMYiPAUdlb0f2FVDEIbO2FbNdrH9S9jPJCMWZk0RyR
	 BM01nneuatCqeOsqIHkLAMswFj/lF9TUtvn6EGGFlHJIX2z0T+Tccn/4jDUKHCuM6xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=octane.security;
	spf=pass smtp.mailfrom=octane.security;
	dkim=pass header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=OxaZKYgK;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521B0606A32A
	for <oe-linux-nfc@lists.linux.dev>; Thu, 19 Nov 2026 04:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 521B0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=OxaZKYgK
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1034327a91.3
        for <oe-linux-nfc@lists.linux.dev>; Wed, 18 Nov 2026 20:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1795060979; x=1795665779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YRFM8U63OEdRvVjTw8RvG7PNWf4otoP5rtHsWUr5Dc=;
        b=OxaZKYgK5oDVHfLCu2IHQn0ak2oGN171HoH+a9Og2bubj48yk610/h1DAURyhnPrNd
         dvWDbvOaIaVX31ZdRuAQ4tbgooJ/69cWhAMAuj6PJGZ0pO6XvjbeubHkYbFDFjc4s1k8
         0R7BYXdnId0WGSkaXuh8nYJWy9EnS5j01Wrp+3/5uKxtTyWNF+ZhlfhVV0R+D4EZ294R
         CRcgcjJpykQGN+5ROPK4S/ii8WopQM4VpMI3Ds5rpvoo7A1LKDa1+HGBHMNR0Q6WMr0n
         HGnpmfiufVohe/7frpx35qH+0hPBsaMLpO9Ope9AZo/AGCI0f5me5Evvd9D9NAL7JHQ+
         QZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060979; x=1795665779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YRFM8U63OEdRvVjTw8RvG7PNWf4otoP5rtHsWUr5Dc=;
        b=a7MTzsE1V20IDO3NYikAraVuVplH/STwHxlhXRrTRu5NKZQ5O93qh5CXLjAU5DaG5K
         rMPKOEPkTM2vz1sl0MEZA6X2ICNGpHoM0pKKrhY9gzDk13r9TGF2z1j7y2zscQcJNCcb
         KWzMZjAMI4h/hpeS1XGqMynBkwT4qQQJvhTXzTywbKVVd/v5wG1kkS2Vr+u2R4SUlo6s
         abXRRwWxm1uWIWRudSUFt5oK7Kp/xqBbDXgCFFDI4KXVHULqMllI2GAn+VzYTUb+4XZU
         171FNWsiaxIgZCPWWZP8uR0tyNIbGnO+8BpraqxRRQaHc0KU/p08hZUUuaqrqJ7MahF3
         +/Tw==
X-Gm-Message-State: APuU4Z+SNoikZ/RpSwyEwtfO8tszcEqQuzIHWhjyIZIWIK7s1/pKPPT5
	SY2IyvKXGHmXSRRobxX88eIFEgRs8oxFRAsrUZ8uVyTk4xjWUe1OIX/L0rEgu5+89P8GNHtcZJ3
	9nf7c
X-Gm-Gg: AZFdTZcPgN98Bp88yuGZy341RJeW/iU8rFIgczg9GQYty/dysZsK48cyLUGHTXMM9zy
	9wxx1Vkd/jQErEZoxFhi4j+mjLlHC0RqG2VYglbjz2XFyPO87z3CrW+InPnavMccB2tzyyTlK3W
	l5s/gA6+4x/EIujlBWzTxHFAtzWVAgkV8SAd1se5Jt/OK3Di1/9PlqvAWoe5Qw1RVZV+utf4A+X
	PXrTTrlbQ5YQspT/7REZyRStNfZEIqAbJnHtiZ18X6hR2oQMKz8pfemhguDy2oIMoManr47eV35
	JogijZnnF3NMC2sNX/kI4OaHHKiDHbHyzk0I4jMONznh226N/OzSnsDGJgZrDSe44aE9rQEZAWS
	ZcbFUCgLD0HUvDHj8Ku8jilsLfsaLCFjm3pPkkTVIMGZfRojc3BLbs7QnWYonL6+c+/XXNI/qKZ
	ZjR8TE09sLNTFdkDmlPa1xo3NvxWcvI4xYC1KNnjI7N/8nWGOw6rcjR0kDZ3Oo0bmiAgKPm6aFG
	rr1Bzx+ph+IapY8VCk3GGK3Gd4XXqyCSSqR5nY/mDOL/26Xc/ZhzzxpSwwWelF69taevLXxD12K
	6YhV3iB2GQqtjLUPSY4Csc5X/YN0o5dA5QmGu2lJM3SqBTLFJk5TfPdZ2G79W8qZRvEdi086gOZ
	A6cRjrlCe0+CH3SKgfIPt8haIdL3UQ47sq2wds1HzOuoyrCUoZlLdV2wwGP3jIgzTQR3m9SVu
X-Received: by 2002:a17:90a:d60f:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b3d063e959mr4513245a91.1.1795060978401;
        Wed, 18 Nov 2026 20:02:58 -0800 (PST)
Received: from localhost.localdomain ([103.207.175.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4057af4e2sm406863a91.7.2026.11.18.20.02.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 20:02:58 -0800 (PST)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	david@ixit.cz,
	horms@kernel.org,
	gio@octane.security
Subject: [PATCH net v8 0/4] nfc: order NCI UART and firmware teardown
Date: Thu, 19 Nov 2026 09:32:49 +0530
Message-ID: <20261119040253.15986-1-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make NCI UART driver selection, callback shutdown, close-time command
handling, and Marvell firmware completion explicit and ordered.

Patch 1 serializes NCIUARTSETDRIVER and protects the driver registry while
a transport takes its module reference.  Patch 2 rejects a second firmware
request without disturbing the active core state.  Patch 3 orders UART
publication and shutdown, preserves close-time reset and driver commands,
and bounds transport draining.  Patch 4 stops firmware timer, receive, and
command producers before their queues and private state are released.

Source auditing, patch development, review triage, and test planning were
assisted by OpenAI Codex, gpt-5.6-sol.  I reviewed and tested the resulting
changes and take responsibility for them under my Signed-off-by.

The final v8 code was tested with:

  - strict checkpatch and git diff checks for every patch;
  - targeted W=1 builds and current sparse checks;
  - full x86_64 bzImage and module builds with KASAN, UBSAN, lockdep, and
    DEBUG_LIST, and separately with strict-mode KCSAN;
  - 20 concurrent driver-selection cycles under each configuration;
  - 5 registration/publication and 5 reset-preserving lifecycle cycles
    under each configuration; and
  - 100 firmware teardown cycles and five timer-boundary modes under each
    configuration.

All test assertions completed with zero failures.  Neither sanitizer run
reported a memory, concurrency, locking, or undefined-behavior diagnostic.
Current sparse reported only two pre-existing warnings outside the changed
logic.  The st-nci close path was also built and checked separately because
it sends a final proprietary command from its close callback.

No in-tree selftest covers these NCI UART and nfcmrvl firmware paths.  No
physical Marvell controller was available for testing.

Changes since v7:

  - keep asynchronous core completion lockless to avoid an inverse lock
    order with driver-private locks;
  - serialize transmit wakeups and retain partial frames across worker
    restarts;
  - publish Marvell transport state before NCI registration while keeping
    receive admission closed until core queues are ready;
  - close command admission and drain response work before cancellation;
  - preserve the close-time reset and a driver's final close command, then
    cancel any command left by an interrupted synchronous request;
  - actively retry partial UART writes during the bounded close flush and
    poison a line-discipline instance whose framing cannot be preserved;
  - stop firmware receive, timeout, and command dependencies before core
    workqueue teardown; and
  - document lifecycle sleep, locking, lifetime, and queue-ownership
    contracts and refresh validation on the final tree.

v7: https://lore.kernel.org/netdev/20261104062026.80599-1-shubham@octane.security/

Shubham Antil (4):
  nfc: nci: uart: serialize driver selection
  nfc: reject overlapping firmware downloads
  nfc: nci: uart: quiesce callbacks during teardown
  nfc: nfcmrvl: stop firmware work before unregistering

 drivers/nfc/nfcmrvl/fw_dnld.c | 237 ++++++++++++-----
 drivers/nfc/nfcmrvl/fw_dnld.h |  11 +
 drivers/nfc/nfcmrvl/main.c    |  52 +++-
 drivers/nfc/nfcmrvl/nfcmrvl.h |   4 +
 drivers/nfc/nfcmrvl/uart.c    |  64 ++++-
 include/net/nfc/nci_core.h    |  29 +++
 net/nfc/core.c                |  20 +-
 net/nfc/nci/core.c            |  82 ++++--
 net/nfc/nci/rsp.c             |   3 +
 net/nfc/nci/uart.c            | 467 +++++++++++++++++++++++++++++-----
 10 files changed, 805 insertions(+), 164 deletions(-)


base-commit: 30c71476d842b094651bd7712f6c8ee8716147d0
-- 
2.54.0

