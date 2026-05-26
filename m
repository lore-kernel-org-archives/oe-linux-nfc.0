Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BE73B4E9F
	for <oe-linux-nfc@lists.linux.dev>; Tue, 26 May 2026 09:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787878; cv=none; b=Zw2RnjN0OxhSGbuZ6RN7/UHfYLIA6GKvktLOPMJebh4BtgA6q183E6oLRzWXqMKBkdpFRGQjhSRA2T64GXBvMyrgo53OXawF1StHY74lBWcrMRhcLP0mN+XlJfwAUiJSC+EYuE5qGe+48nMtArYHn5O4zVFMbfbXfWWxO27hlRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787878; c=relaxed/simple;
	bh=GaWyZI8GTHXd4nEu+St0loCud0SYnF3o0zqqQFGK9wM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YUHWQTbtvEvnM7eLSGw7dpm6IJKBp/s3GzOxyfILFq7ioE038/PO6LOftOIRiotzgCg+meB/2Lmhz5eXh8tbzCmgAq3CZ8mn59isxildAnIM4VieN8+4ub2tYYJKVR5iaA39j198CfNu0LKvkr8ZhQf+RuIzoDu61r8ndErWjXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=zgSznEQa; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="zgSznEQa"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so7430157f8f.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 26 May 2026 02:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1779787875; x=1780392675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1TDvqAyFlVxKGtNUc9btTtlzkS1xwUoFgbr4epPWWGU=;
        b=zgSznEQalWalyxK/1w+Pod1Mnq0NUeu8wxDlNugNYrE9b9vvJQgWKXAoQRo5tFlWRl
         w9R0mOSVGnTTSdzEcPuAcDg94jKhSEKP8cpwQCHOV5RHVsaNL4QmE1f4MmqHrDXvoW/4
         fwhB8EhOXgzZ80RkzfcGignE8Ke2EBUNmIBPaw03XqWvDgjgtA1+ykwpsu0c7HI5yls0
         C+wpPCnqvX1sd8oWTKkr64X2/ktz1ViGTDnCYGppk8e5MaIWd+MNwQL7dCBVi/188pwe
         7mSg6W9gsie557f3qsZY43xfT6dejzIU6rO3l9ZweBw30OW0gaw4ZmGkKpi1jEWihk5p
         K7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779787875; x=1780392675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TDvqAyFlVxKGtNUc9btTtlzkS1xwUoFgbr4epPWWGU=;
        b=atoplUR2mQPDj5ai0j2zBBovIhMbNau6N7V2G9fdr4s07kAkyhQQpInFntCT7QbQjh
         Bd4/1FWfiQQcP9AkzpG9XGR9K1AwccpqVc+bgmbl3yabu4ZYbyT49rTsTfXqmtE8vN2K
         3DTdc+KrBjWhmMfRus4OXLE1QSDJa1WvmVY3zL8aeKnGjDdV6pcE0A0asKTNqKKTzpG/
         jupKJk8wa3QdhxfUZVTaAa0fLfCpamm4MOXVVAwW9flv5D5GLsusXZFAzna8BD7zFpvX
         flrd5xTupssC9d8wG53UWtnn30k/LoaAp9j0kjV90AYReR9oqem9JhhQAl41Poj9Dqaq
         536g==
X-Gm-Message-State: AOJu0Yy+56BKio4mrIVt7qekPAY4r7TJCd2keUwUTEdDXbwBsHrVfxDW
	HwgRTieoW+Pkk6McTJixElvL4pS/NQmm6+a5gWpugGaeuW1e6obKt5cdLPT2wLwMgi/aCwzS8Sy
	rYHEhIIaZWbs=
X-Gm-Gg: Acq92OHmu8LIyilvubHRp1O1UX0V1IQxgtdzIu+iTrU4J7429pjNbcKzJzO19UxJrQb
	s+/bk2Ph64TJb2uqj+yGNAT0zjibbLvPp+6wvIKs5bxVerrzaih69+v4g6opUpiCHcn4eRvP1sn
	lotupbnA/3SDWY7McQxu6bR67IYXESsgfmGH3H8d22I+kLcMsZOVw3lKTsH34X+kRlMXYjEchsH
	uc9lN9/4ht5NwvX+ykvkQjsZjN3jxWqi5AJndgQuz/4DWZcJwTRHgvdbwPFNTyBJ1dyFtd2glWC
	ldBWG8CW2+n5wrks96EEPoaSCUgZYQLElQLBPWg5g1rxeC7pT6xwfrM3FN9HcWOAoynw1GikJVP
	aab4RBctKKhtmtLH0HxK1Bqa2obBwjuWeRrdtc5XGnuqvpmgXbRz99qjSOai0O0p//6prcYWlAR
	tGJsR4XF6gSqCieSinXrcdhgVxuonFj76hJmQ17qI4o+IHp63o8U5QOG0jEMu5f7zSO3/3jKxIx
	yVsekj/TygzRNyKvwRWNwQ2Bf0ngQr47Ntk5I7k9fpzX3H9Yme1U5c=
X-Received: by 2002:a5d:5c89:0:b0:45e:8ad3:86a9 with SMTP id ffacd0b85a97d-45ea3138d38mr36473526f8f.8.1779787874838;
        Tue, 26 May 2026 02:31:14 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d70c51sm36450132f8f.36.2026.05.26.02.31.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 May 2026 02:31:14 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: oe-linux-nfc@lists.linux.dev
Cc: security@kernel.org,
	netdev@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH] nfc: digital: clamp sensf_res memcpy to NFC_SENSF_RES_MAXSIZE
Date: Tue, 26 May 2026 11:31:12 +0200
Message-ID: <20260526093112.22614-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

digital_in_recv_sensf_res() copies resp->len bytes from a remote
NFC-F device response into target.sensf_res without checking that
the length fits in the 18-byte destination buffer
(NFC_SENSF_RES_MAXSIZE).

A nearby malicious NFC-F device can send an oversized SENSF_RES
response to overflow the stack-local struct nfc_target, potentially
overwriting saved registers and the return address.

Fix by clamping the copy length to NFC_SENSF_RES_MAXSIZE.

Found by pwnkit (https://github.com/0sec-labs/pwnkit), an automated
kernel source review tool by 0sec (https://0sec.ai).

Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 net/nfc/digital_technology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/nfc/digital_technology.c b/net/nfc/digital_technology.c
--- a/net/nfc/digital_technology.c
+++ b/net/nfc/digital_technology.c
@@ -778,6 +778,8 @@ static void digital_in_recv_sensf_res(struct nfc_digital_dev *ddev,
 
 	sensf_res = resp->data;
+	if (resp->len > NFC_SENSF_RES_MAXSIZE)
+		resp->len = NFC_SENSF_RES_MAXSIZE;
 	memcpy(target.sensf_res, sensf_res, resp->len);
