Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645425;
	b=X4OKNOS0O9p6qmao0o2su5TR2vDTLsq6SWDjMafTR+DE6l4QHkaRnAWm8OoXArBxZh+0
	 dcN5Ygz8EJiI7dXLAP/51suwrWUyZJh/cT1AGiYBML7Y+t1AZ71ewv9hHh8oiTsz8J9C5
	 9hU3dBLobZtFrjGTwvtxKLEb5IrfLXdZmxBrFeiTDgRzTqgRCtSYtcD+u5n/51gNuPkqg
	 o9C941S1rO9nIf6Tj6Dctgp5kZ7V6zqjRkrVxLS3d8mjdHX8pPobD4p9tmSWgIgptkepO
	 4knfoSpQqH+3WqV9oc+J+UT04uSWRF4u+DZRat/GU9MnmsY563+sv36Qs1jzsRoYdpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3b33X25rJkg/st5uBmBh5JOgmQ+U8JpPJF9za8o/02E=;
	b=B4Ffh7lCi/MmXg+TSujS2SSfzg3Jif5qCnlWcOIyQEBBbaBYWUnSRgMoSn5wVLFI8kq3
	 OsYqS5Tv1OMn0rDyVAwjhEjx/MiUu3JK+SOT2VVMveOpVrWN9BWdaskG9FJzs/1WtBVWx
	 1SsSIWGFjZxWr9ArWXbVR5a6oEiv8qhvuc4g8TUOehirVl6M7WYna8c3/ImwDdEhuRj4g
	 q1O/15YEJt89g9GVJ+6sWI376MYpXHjibDy1XvbjugdCHXMTg1WbABSGxfPoRAlnuPbrH
	 5x1W696Sz1XycyrnAVm5SLLaJzvZ6qWXkYlqoPk0dg9s0zO6j/8CPC8L82ES0Eh9sWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o3DtiZSf;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0D4606A321
	for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Nov 2026 22:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C0D4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o3DtiZSf
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so9498682eec.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Nov 2026 14:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645424; x=1796250224; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3b33X25rJkg/st5uBmBh5JOgmQ+U8JpPJF9za8o/02E=;
        b=o3DtiZSf+eDYNix1Ztij2OJVDQQ/grr2tqxTxhP7KMe2nFiuHF7MhrUQBVxUcaQK+C
         3W2Ri6lwlSfHMCwQLzUYWnpkRKM+tLYnnNGB7nobDMKI/9dk/dtDKMNu/PhZbgIcOnTW
         Uflk8HaYa0yOSpDX7TRabeymUxLkn1jqfUWMXaJVksrFacf0IHY06Z3sBlqRLKduHxvX
         Ltzr4bZQgZ3XAeyly6v5iHF872qN0wP8w7A7iScPDAOC3kyDDw7tXyw4yehYD3bip//D
         9xQZnI4DOL7cTCEL90w5UGQLwxPlm9Szqt9Oc8+nNm7nNjBjw9gkqc/Kbfl0ZhROjCI7
         LYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645424; x=1796250224;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3b33X25rJkg/st5uBmBh5JOgmQ+U8JpPJF9za8o/02E=;
        b=i4hicCD0MC3V1f76vIOWfMM2cxc02lNtsw7ToeW+qsoRU7Qtcq+QUbeALsSOz93EUD
         6CzeCCe6rQJkfRtW5gVkwq2XZZ4ySttaiju53mQyEas49KA2ieH/rAgP5fNNPFQGWHoc
         DdpoBxmboREHzxAMg33a8NVF8KQ4Q1mX/8IWNKgxmPhhjkrhQQE18tjC/+Zok8liibWp
         KwLp3u3GaNowsMMMOQH074WlMmYzPtlPunhmYDEcfnUdKu9jExzezmUS0KTDW82U02PB
         9V+NuB5BYG2H1gZMxGr3cCR0OZT4LH3xMhoeQ9sauzwB3E9b8gunfL8zWZHyIHKWCRvD
         RY9g==
X-Forwarded-Encrypted: i=1; AL+hErFIEhE7nGtppq/t4hjnxOAokH1vFgbFpMp/2XL+NZY8WLc5nhy3p7LArrihIJTwQxAeE4KZlAtGaN5Otc4=@lists.linux.dev
X-Gm-Message-State: APuU4Z9HIfbMNY8jb8KoByELUHWvjNxJVzgvZ5ICDGs0WXUMx6k7ItTa
	p97cYiiMfDVqr57F7RP4iZBgqHIqcjzAdXno5pZ4djdIraoBjGM6mAbHKI+qjtiHkA9NBXOBoiH
	KHQ==
X-Received: from dyx17.prod.google.com ([2002:a05:693c:8211:b0:378:1191:3e95])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d587:b0:381:d92e:ecab
 with SMTP id 5a478bee46e88-3856f25884emr17872862eec.11.1795645423958; Wed, 25
 Nov 2026 14:23:43 -0800 (PST)
Date: Wed, 25 Nov 2026 22:22:55 +0000
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222300.1438398-1-elkin@google.com>
Subject: [PATCH net 0/4] nfc: st95hf: fix SPI receive bounds, DMA safety, and
 teardown UAF
From: Elkin Cruz <elkin@google.com>
To: David Heidelberg <david@ixit.cz>, Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, oe-linux-nfc@lists.linux.dev, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, irogers@google.com, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (4):
  nfc: st95hf: bound SPI receive length in st95hf_spi_recv_response()
  nfc: st95hf: use DMA-safe buffers for SPI transfers
  nfc: st95hf: validate async tag response frame lengths
  nfc: st95hf: fix probe init order and remove teardown UAF

 drivers/nfc/st95hf/core.c | 151 +++++++++++++++++++++-----------------
 drivers/nfc/st95hf/spi.c  |  75 +++++++++++--------
 drivers/nfc/st95hf/spi.h  |  13 +++-
 3 files changed, 140 insertions(+), 99 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

