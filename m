Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9680820C480
	for <oe-linux-nfc@lists.linux.dev>; Sun, 24 Aug 2025 11:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756036349; cv=none; b=N51VbHLGw4HJ6yAUO+kycR5Jcvn7DZiIr7Vp0MdEGKSg/e3lAotI3n0zJuj6yjJI90yJAiNvdyE783SbCC9LhhrLvR8UOV8fCXNE02L55iQZu+uOIjBHFru2nd/MM7Yr1u8UDu8uSw4cP6B2naM9+5ci9KOQBBnukkr7D4wfCNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756036349; c=relaxed/simple;
	bh=kuqUW+eizf4rLubnE33P6TiP7Seb2DJSxdiqNF4FacM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZRW35lHhbgdw8G2TLtszyudBycY9FF7q5+++ewJBLF1yqB1YLtAKFbHKOQNNiYOF7WlHYMWEULKEKFmV/VSr79pNqwEqZgbDjz5Fzu426iIzm7juHVYdrFrqzjaqyfYuhHXpeUZ3xU8QzjWcZgk52GcT1uAf7llQDt+FAYDDtgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wv0DZ36A; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wv0DZ36A"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb78d1695so49198566b.1
        for <oe-linux-nfc@lists.linux.dev>; Sun, 24 Aug 2025 04:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756036345; x=1756641145; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DTLKR/NU3p37i9GQHhiwnaoT7n68wfDC5T1lTeq+4Ag=;
        b=wv0DZ36A5QqQSot9fLXN/KNc2Sk+Q0l1DLTd1FbJgYJihBwzyG51Ut5fybT6dz+8Q7
         tydK6f7xPo+yhYqlmdvajQdn/HdM9oP8HekgeZHt2zXFK+HvMYBHBNNUhLcLgqbr0y1s
         qGtsW0x3Ch/zlamTx4PaNmUP5jH9GH2i/9akv2nzKhbxr3h4Rpm+t7Lw9iHACrGYC8X/
         iZTCE7Y1QXsoYu05KJau07HAgySzjNDL8ZYQiFFbIgd9LK/mb8q5BfDbm/mx+bq5nbLQ
         6VlnYg8kcn6J6qqt1XHvC416BdJYZ5PnjKkqdOhC5uiOwOHxNXNa1CGgumOkEy2Bmah3
         R4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756036345; x=1756641145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTLKR/NU3p37i9GQHhiwnaoT7n68wfDC5T1lTeq+4Ag=;
        b=UfMER8OhvV1CWGvwaT/AyI/fjr40gEAukldPMbyfCPVfiDHZaIreS2zvJwKMnrySvR
         ooVU9KRuWxuEMb6Tl0kX01EkUxUJPzcKHRxySOjYwAGIq/p1W+5jdS44dQTPv8SWNKUh
         DGCRYcyJoa9UPX5T/2xmkbQ61OKoBQYfgsLyFcS3iKpIE//757eA29F0JQpolh9L3sOs
         9M/6LWt/fir5eISShDNJLtwLThO+l1rbMrevOK/i46RU/Crs3VV7gwPb0qJRNv6E8uOs
         4NZrLMW5Rbtwzz6Na9g+lWjq7SNIOs5pYueztH2o6gV+l02S4Z6UEjuXJhLg8SL84lFF
         NGwQ==
X-Gm-Message-State: AOJu0YxWU8s/pjU+dxXPeP5LpLbudzlexG+b+iPsssD1GKYd2ClLWAdS
	4Rlkc4cw5rMrppNaIyozEzRNniiwq61XsecSvOXHagQjxXqQ/RLEGesW60bGf6AtLlutoVnnXBU
	j8/i0
X-Gm-Gg: ASbGncvjgc5uEPpCq1t/60BGp1FyQ8VM3Xvbut3V0m5w+4bGjgCmQAZH0yGnCrrusjD
	D/PsOlfHDqIrY1gDM4h1PZZzNNuGAsTB4dUDbMPbyNfOuVaktuG4vYar6X0zDHuS1LCa/QG2uVx
	wppcYkJ42pjLoKWkXQAu6KayxxA3cnTi1HLa/V1KTymLklFbAhp9rRpeQY6k/amcigQn9vGgzzV
	zcZ+G/T590dwQgIvLBpHIRZpg/d+hRPVeS9ef4JGqriIviO1aMzLWaUFcUbPEBWYCXzZPYh4W5O
	meXLyKeOMSvSWj9w3w9TVkKH3hQiMqgUVZFaNWMVwx5IfX+r+ZILnw3WM884+xY2qKY34cN2Scd
	h4zbc/fKyAaccK/+E7jfFDzky5qh1dIxwUA==
X-Google-Smtp-Source: AGHT+IEdIInJ+6kpIujkYJMlA3YDL90eSjLJQELmPFXe11xS0WsOppd+wT4tU/spYzuEVl/bxfqXbw==
X-Received: by 2002:a17:907:3fa5:b0:ade:902e:7b4b with SMTP id a640c23a62f3a-afe29446218mr450851866b.7.1756036345422;
        Sun, 24 Aug 2025 04:52:25 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7194090fsm119178666b.13.2025.08.24.04.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 04:52:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: oe-linux-nfc@lists.linux.dev
Cc: Mark Greer <mgreer@animalcreek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [neard][PATCH] Replace defunc linux-nfc@lists.01.org mailing list
Date: Sun, 24 Aug 2025 13:52:15 +0200
Message-ID: <20250824115215.43498-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

linux-nfc@lists.01.org stopped working long time ago and the archives
were migrated to oe-linux-nfc@lists.linux.dev [1].  Let's use it as
dedicated list, not only as archive .

Link: https://lore.kernel.org/oe-linux-nfc/ [1]
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 README       | 7 ++++---
 configure.ac | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/README b/README
index b2967a787508..b8419c3b592e 100644
--- a/README
+++ b/README
@@ -59,7 +59,7 @@ Bugs and contributing
 =====================
 
 Please send bug reports to mailing list:
-	linux-nfc@lists.01.org
+	oe-linux-nfc@lists.linux.dev
 
 The project development happens on GitHub:
 	https://github.com/linux-nfc/neard
@@ -68,7 +68,8 @@ However for historical reasons the releases are also mirrored on kernel.org
 repository:
 	https://git.kernel.org/pub/scm/network/nfc/neard.git/
 
-Contributions can come in a form of patches sent to linux-nfc@lists.01.org or
-GitHub pull requests on mentioned GitHub repository.
+Contributions can come in a form of patches sent to
+oe-linux-nfc@lists.linux.dev or GitHub pull requests on mentioned GitHub
+repository.
 
 See also HACKING and doc/coding-style.txt files.
diff --git a/configure.ac b/configure.ac
index a150f55b9126..77ba4be8f9f7 100644
--- a/configure.ac
+++ b/configure.ac
@@ -1,5 +1,5 @@
 AC_PREREQ([2.60])
-AC_INIT([neard],[0.19],[linux-nfc@lists.01.org])
+AC_INIT([neard],[0.19],[oe-linux-nfc@lists.linux.dev])
 AC_CONFIG_MACRO_DIR([m4])
 
 AM_INIT_AUTOMAKE([foreign subdir-objects color-tests])
-- 
2.48.1

