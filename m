Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82623B52E6
	for <oe-linux-nfc@lists.linux.dev>; Mon, 22 Jun 2026 13:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136727; cv=none; b=c362v4ALg7MaoOvr9iOE9WjjXIm64kbTU3UlBxTiUkxdVP4uxd/67dYJjwESkd5Ns1dqICCCUKnY5CXlCxQzu567A89g8LiTrHyr5BpiKzsktsK76qpNt4H2c1R/9JptZzdZz0cQZs1HCymJeGmUwYpe+DdARKc6OL3ILmIsgs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136727; c=relaxed/simple;
	bh=F2YVYUXSYaBRv5EuPpzQlID5z4oH0xM0C3Ad7xeAKGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHWZuWVGFAFtI7+OzoJy85BaYuYrqttdbGiJA48Lmw2DhrGhln6kqWpxEpkSg4a5blod1PiMhE4/HuYBdkcT4Ik2VcNDOkF9VTNDtmaR9Xc92cr5BNgxqHI0Urd4jV6VZcaA+jZbiu/CmbwSlbp6cav+oqDxy351ZJ1UT8auEGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3Qes65/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3Qes65/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso7041002a12.0
        for <oe-linux-nfc@lists.linux.dev>; Mon, 22 Jun 2026 06:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782136724; x=1782741524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2YVYUXSYaBRv5EuPpzQlID5z4oH0xM0C3Ad7xeAKGU=;
        b=h3Qes65/ANUEG2w6hplQbiZ06Za6NYzTuWPU7kQKXPBbnWxXAr4SSE5Mm+bUZH9/hP
         JzJNfR+qC7Vh6r76q5TUBnIWub7bPsbuG9jLKuHT6zNJlZ//lN0pwS1sOzBvmkE5M/K5
         DWR5KufiLG5IS9FbDwyul1vPbAxMc4G05Iy9inAcaJTx/f35EIzdIrh8tldGRlwfQanU
         bBsJn5qhjK8GwLPcAdeaBfAI1RHSoTbL6vHd4Jhz7QlYkgORfaMRdB1td0j6QecREItN
         X8h1dK13p/CA6Y9jKBjtKIPihTvMBnrR9QcImlCNnuVLolP8ERAgtK2F73KqmLe0LYR5
         hNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782136724; x=1782741524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F2YVYUXSYaBRv5EuPpzQlID5z4oH0xM0C3Ad7xeAKGU=;
        b=gb+/PWVcNPVkDY04ccm3lHn9bDkDYv0fantlIfvyoFSrEy5oh2t8WLth8p0FYDWVSX
         rqNY5TxBhka7AraV+aiw6QDC5xS/5stwn9g3jldKGoydRNC7Zhr8COzgM64WxlzQmleJ
         pSXH6vys9vheVd3ZIW99dE2GlrgQIM9QXU0JqD4lWMRKWeXOmwTSYJtbB8l0ckIzqXs6
         4pcluxKeqmManUWvShPMw86Vb9IdZvnoWnQi0FgXGNUaZfC6Q4PJC6S5fUGVJhLKXyfl
         NKNq0rfSj0UqSk68Tt/xWPrsGjFFCwRfcnbD8nCrOOly5OS4JBKzkZ1JNvV8ERnq9UI/
         4JTg==
X-Forwarded-Encrypted: i=1; AFNElJ/vdFmNGcUauZ8TaGvLQl9FbJ/1zFR882V+ThHENWxOEpvT+rDecDfa/t6Sj8k1+kg952he1yyGFxq6TDs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6YGI7TvgGik64drqmD04/G1pd19YXoPYqAVBlkTxuAanQJCyT
	+SLTOotO7ooVFI/MQjpozT4wrYSCH3yu0YkTk360OalyymBXcQjtoUT1
X-Gm-Gg: AfdE7cmFxSRW3VrK9zKxXGqiWSY8ySs0S+rl+qNg5Ic0zKLjuNWDGOR32/LXQgQQt/R
	K6XUBZGvZu064fpI5UAGCNu3mC0/whwZyRf8b6Qu/35CrNZzps5lxku/7/HKAENq+ZUInW5T7PT
	C+EHpPmNit5uC73tINpWNL/QOCfSGasg3tUr7FyXzYw6V+DT49rgOX3cyQuIe9GrQ4WXSbNhCBK
	SEmF7USfvVRdawuahEthScKw3ZEFztXilDZ6NXsZ6pyunvrkVdWEnXrbFkrtYQgCa1H2XwDuPvT
	+EGI9MClUvjbU+w6eCOlRJbAz6+ilr7Dk4QUZbl+6Thecvpuo/LvB5S758Q2wVLJFnDjqcZhxyZ
	jq/o7Wun+Yz6W06gxWQ+DItAUWkftWVuxyXD08EKMFpKmH9nnOnms6bItkD5wDyyYMOnKWq8bJY
	0s7nEHGvJnx072X28/yUsSQ26tqDSFDazUjnNS1sndnwkU68vFZ08UGrzQPAqghzg=
X-Received: by 2002:a05:6402:5288:b0:68b:ca3c:6bbb with SMTP id 4fb4d7f45d1cf-6973bcaa247mr6412241a12.11.1782136724049;
        Mon, 22 Jun 2026 06:58:44 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be64ddasm3156308a12.28.2026.06.22.06.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:58:43 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: david@ixit.cz
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	horms@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net 0/2] nfc: llcp: fix OOB reads and integer bugs in TLV parsers
Date: Mon, 22 Jun 2026 18:58:28 +0500
Message-ID: <20260622135828.241486-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <78e283f0-1493-4d72-92fe-e6444458fb91@ixit.cz>
References: <78e283f0-1493-4d72-92fe-e6444458fb91@ixit.cz>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Jun 21, 2026 at 09:52 PM David Heidelberg wrote:
> could I ask for the patches rebase against for-next?

Hi David,

Rebased onto nfc/for-next.

v2 is now sent and available here:
https://lore.kernel.org/netdev/20260622131802.239035-1-meatuni001@gmail.com/

Patch 2/2 was dropped because the equivalent fixes for nfc_llcp_recv_snl()
were already merged (ed85d4cbbfaa), so only llcp_commands.c remains.

Thanks,
Muhammad Bilal
