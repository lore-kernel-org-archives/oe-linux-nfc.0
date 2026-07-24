Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234E147604A
	for <oe-linux-nfc@lists.linux.dev>; Fri, 24 Jul 2026 23:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784934024; cv=none; b=EUPCW5guirwVQl+egwa7XbkZ4VRH9O1ZqFEaCF5h4OkCf0xGGxvROB11EyLDhgSBW3knB5LTNo4KRCs63vT3m8GuNxC48U5h9R+xxFR7KweD6P4TtD5rw1bpuR3YV2URG21kC37JcawzV31jQuGHqQ6Y/V7OmIABwaTRvVbtMIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784934024; c=relaxed/simple;
	bh=vTPbPaUCfbvCDH8I0hFjGnBATGgT0m+Ap2wg81Wj+3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GCtFLAjMnSA5MzrzqzddRDS/hvJnFenZIcaDXp3g9x/8cDe4h/LH9yLHW8oXvfYK8jgUbRGrK0ZeV/LEV534U9AQeuJlD5eP2uCH2+JKmSyv4v2mIiKr5kiuduUmakpNZ0dp6AfFYjinwT/PZ6TxKkQdMDPwGK4sBPmBPOnS/YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skW4G1NF; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skW4G1NF"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caf228a910so7575025ad.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 24 Jul 2026 16:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784934019; x=1785538819; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OyqvMw4pNtuviAbPcMn+7IXNgSVNvvnPfbN1pURoWOA=;
        b=skW4G1NFy1i2E7+6q42EETfoKuFXWdfpjAZmt8aSt8cw9Ap1JYOdC0/YWhuxDPBFZh
         0Whx1waAqCb+Qbh2sNscVmLu8QJjYf6l9I17Gb4l+cfqcjxPekJ6IjZ/bkzhS8zJsWF+
         POx4H1eN8JyQQudOSs2D1bhT5dOmZkqB2Xttv1x40Q5qFVZregmfgnss4PYnoVBWAKS8
         tPIWiXegr9x56K//ULxJ0UOcBbZJGHkf3GTrDEErCiETobDXf6aaEG9D2CurpB8duFxn
         oVW+ciw75SyR1DkMFyIIfFS+JOPGRshANw+DkBWmHRWx38VjdWHvxkTRtP97RMpxUaYZ
         OEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784934019; x=1785538819;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OyqvMw4pNtuviAbPcMn+7IXNgSVNvvnPfbN1pURoWOA=;
        b=dcyW94fx/BPDtjdpt4R75XYNq/rbXHUgnTtxYzE6x0gZfHMNlbqgrcB7wLiffLqPTV
         RupHOK1AtDQRrhidoEKnRaqWVL8NLLgqw4ICZmx8HMa+JlnK6/SBlA6Td/4p6k0zvuiN
         NPJ5WjcQZ9kHMfCZ8Ox7v/b3xvWoBaubYP2Qj5nzrQLVxcRQvVksiJ8NIyYgQOMkeHDS
         CpgxnLRQcFpfNClnCCnjT5bfikwuLWyi7tnASCGkhpQJ+zkFGuuJoXvAswnyHGODVpvm
         ZrmUNZbQInL1bvAdyR2g1DVXsXDHmZ7qehtuEBGuWVGIQR21fZeMOC0F0OdXJW6rCQXw
         6c9Q==
X-Gm-Message-State: AOJu0YxWq4fRehyRJ4x7Bx6Drm5W51xX2cMvoXaQuRlDsYOJQfRGcrqo
	0qKScPPxTF09V7dEsppUFqBVMLt+tDASefux0e3LkxX1ob5L/k+xwfNK
X-Gm-Gg: AR+sD12YFtCKx811ebrtv00AVr+4d/0K4tBuIApN2lpCMzYTtEJXtAJJLm1IBOzue3r
	I6uDnUlcq7E8gLHriaj+5zvL8Bywd3DzgdElyt1YalPPMTiFIJ0lXwOeHKDSE2H32zev77DPvfR
	4vsIJZecQcRyfCCrUbKPbWOB/McQMXmP2dhgcMq+NQwmWTGu9uURjzT9bz5iC1/ssSPbbQElxXl
	xu1k7uz4BV33WDx+7Mb3zugNxAuEa+a9ZQpMMdbpsJnSN12ANu1BSvmLl5R4hVlfpVG2Mb4DmCr
	xHplOiBsnEgXWk2w1FQDg7QdznyClRqxz8qkXzyy49x1gui6AZ2/9/6C9sKNTCIlTn77lFoxyL6
	4qm5xs8+jPaNXDhl+TkkrD2hHNUaduUrYZO6QvMJT27QR+N7Eq6AUL68Q6Kvd08pO4jFvxd+vPJ
	DVa+TkjARmR6RjtvvJuqqKNHXCpaQ8WIzL3V1Xy6wfr04=
X-Received: by 2002:a17:903:1845:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2cfde78b647mr2978215ad.10.1784934019267;
        Fri, 24 Jul 2026 16:00:19 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:40e1:40e4:dabe:543e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm1204655ad.84.2026.07.24.16.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 16:00:18 -0700 (PDT)
Date: Fri, 24 Jul 2026 16:00:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: [PATCH v2] nfc: st95hf: switch to using sleeping variants of gpiod
 API
Message-ID: <amPsnh9wDIG2CeSi@google.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The driver does not use gpiod API calls in an atomic context. Switch
to gpiod_set_value_cansleep() calls to allow using the driver with GPIO
controllers that might need process context to operate.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: - dropped extra "not" from commit description (Przemek Kitszel)
    - link to v1: https://lore.kernel.org/r/9b77e25c-8942-42f7-b82e-42b492b437d8@intel.com

FTR I am not using this driver but I'm helping clean up legacy gpio APIs
and stumbled on this. Using "cansleep" where we can is simply a good
practice.

 drivers/nfc/st95hf/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 321fbe8aeca8..4d772a308bff 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -450,19 +450,19 @@ static int st95hf_select_protocol(struct st95hf_context *stcontext, int type)
 static void st95hf_send_st95enable_negativepulse(struct st95hf_context *st95con)
 {
 	/* First make irq_in pin high */
-	gpiod_set_value(st95con->enable_gpiod, HIGH);
+	gpiod_set_value_cansleep(st95con->enable_gpiod, HIGH);
 
 	/* wait for 1 milisecond */
 	usleep_range(1000, 2000);
 
 	/* Make irq_in pin low */
-	gpiod_set_value(st95con->enable_gpiod, LOW);
+	gpiod_set_value_cansleep(st95con->enable_gpiod, LOW);
 
 	/* wait for minimum interrupt pulse to make st95 active */
 	usleep_range(1000, 2000);
 
 	/* At end make it high */
-	gpiod_set_value(st95con->enable_gpiod, HIGH);
+	gpiod_set_value_cansleep(st95con->enable_gpiod, HIGH);
 }
 
 /*
-- 
2.55.0.229.g6434b31f56-goog


-- 
Dmitry
