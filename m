Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406077;
	b=WL1oI/JsPHkqlcAjDt2aPM5uapKKmdpl0N48TvnIEF8ETVP00yTC+8l1atqZvcEmb1yn
	 AxbI8bGyo3mFIyYyheZpYIYBp+Yv83hsFVaM/zla6vgGfnoJ1hVTsD6pLLbN3LaGqKS/S
	 yLCQEijRE9J2eBrtW7Qv2ZDX7B6MX2Vw62xuuEIVGRC/UlNnzbwSowv7euok09TGfOwqk
	 a+kk+d/acQbQeUrfM0d8KArMT6F5LzbDrxcnYcJerxWqeU/yaUxieH2wPg+M2lc3wM9Tq
	 e6ytgwWH3tT+bS1HaRHGKLED43Wgf0X/34XMnNwFvPBRijZ3sAlMGxtXsWk7wX8IOAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x3RzAiD1nujkrt0dHPNnUah2YzBZvBSykZZIS7z7tfI=;
	b=keBb51Nd1hym3/lOghhKauWjb5xFJ2+WKWDyJglryV9vyQqW5wgfHpnbBA/H+yYOYMzi
	 eAD2uECrIiu/aUfSmymQ192SSHR6pRhH0B4E3xs+R962kOK1jItmyxBrbyOcJHJsmxp+o
	 S8WtRXXewd7e0kT4dLVCskelorWlG1qcMX1ufvB1Qi+QmG2pGRHyYH6ua316gEdS5s7SL
	 6JVG8D0e9Malpx2JzpITAykYbcm9MrqpZgA82JpLBBGqjrSDG7AlTlgS2Dl9pjIoxzFsO
	 YV/EF9mPfmk+fNVDmqAmDE4AmOtmOqCqey/Ln7vviyVJRZGMy4enNKUsHbOB02Pm9/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6NiVGZT;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DA5606A321
	for <oe-linux-nfc@lists.linux.dev>; Wed, 11 Nov 2026 14:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DA5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6NiVGZT
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1718350f8f.2
        for <oe-linux-nfc@lists.linux.dev>; Wed, 11 Nov 2026 06:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794406076; x=1795010876; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x3RzAiD1nujkrt0dHPNnUah2YzBZvBSykZZIS7z7tfI=;
        b=X6NiVGZTVqgnF9Va4qsjsf/iXC0/G38P1Gxi1oX9O8cqmCF1dpauvMhTeI04ai3mL8
         Y6lheuh8Wyy52795i0HFPb8ELy5pz6W/PRiBZnKdTHdkUDVFS/0dXYFvkU/V7+wM1iqg
         xJuHQZBex/7U8nyeUxPDWqdt2zzKmV8HFRKU542AF+gGyZtlKB2D5dt8pSexX1vmQcgC
         S0/ErfcDZz6LzAL3MiFUvbsioL4h+1RxzcAMbRUxK0c0fzcnen/K/Xis++XJoZzGLQn3
         7iAWbRHroMcDpbS5FEv46CtXNJEiCo9M6ERlTftx291xIFls24b0Yh7NFhBKZ5V6UHgx
         U/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406076; x=1795010876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3RzAiD1nujkrt0dHPNnUah2YzBZvBSykZZIS7z7tfI=;
        b=OP2yIuk1noPRiGsrXMY3py6OvrfTFPdNuUn9vQKOEsxBTvLho5xa8UdwfV8Lo0P26f
         7vui60GPkrBf5u0V2dGv1Bkl5AfwTXwxGvLHgV4lMlntVcQrb4Ol6QlqlUWy4Uqmlu0I
         qwaWbI3TYZIpvRXTA3tuAFVI7uopIb0vhgFegGBczIuI506NOIJPJ9iSORTGrbVF6CFj
         SGOKEyX/covxRbtZv4DhyclrEQeZo04XLbhmce4CEqNti9aAQlqV4lKGdaSHcgSfa0Dt
         FKVel22g2WhzJwV8Fwhsps+TLZuuHTj0iXFb2zNORs1wonuKo3G2h/1cNboMg97P1hwC
         5BOw==
X-Forwarded-Encrypted: i=1; AL+hErHipe2e/KfS1o+HMmVG2QBuCoLA1YdHKqPN9eFfia8sjEHsBXBsUgIViEUGRr0kUPTrr8lOvRdApYIFKYQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8VZVwZ696EMoAt2QAwN9NasyoPn79ypHmvpK1/kQgD1ZW3Jmp9
	mkXZEyc7E3PR4udM/7M51SQnBfZTlLLY8nH4Nm5wGXJ3l40+1mOHJ/Y=
X-Gm-Gg: AYBFou3nhluSG+oe1zh55yhfAB3P/brMkgjDZ9Ls26CZ9ooqudMFPnjp3Q5ZX2AFXCS
	knztJz07XTmUtS+OhO/yNCpczcIxzVFxDrpRWy28r4Tn0mg3ObIyZ2PN65YLkxjjWXAN9cgHhWb
	bcCll8RZ099TVsFyN2+BgCdqLbVLF9WbpcAS1k1mrmCB6KDQv4Rb6K/l+WhWwY3y+7+6ZFsoOos
	XKfM2Tq+XcdU/8H+QPNXfXuepVU2KcSRLv+jNDZdkQ3dD1fDRsT5s5RhqX74L7nCV77l0uKriLA
	i2nJLccQEC9VsnxL3FrBsxc71PNRre+z4oBPhdQixSqi5eLhKoIo4tRxAULJa3qcUH9OeV5F2FV
	uJRGvIrEKnRloAwnJ5DSWw7TVqPKdR1pfI7H9rOtuXfqmWlr+vtinRFTdfrzGN+MVdwpPjJYhhD
	jm8TgoCZclcH2QWhWrObB/MTPUIybLhfgjoVgp05r+qkAzhv/VJAeAe0XaMtk2koOrrqgAeVuBl
	gwGQ3FL+e3aSN/K5c0qu9E3rxnLXCb0cdfi5koMixKhY8VNRobpeFQ9s3T1vhyNd3NxBkUUV6ES
	C57T/MSRAbKur28=
X-Received: by 2002:a05:6000:2201:b0:48e:5cd4:aa60 with SMTP id ffacd0b85a97d-499c9dad952mr4864181f8f.42.1794406075481;
        Wed, 11 Nov 2026 06:07:55 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm10604532f8f.3.2026.11.11.06.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:07:55 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Zheng Wang <zyytlz.wz@163.com>,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] nfc: st-nci: use timer_shutdown_sync in ndlc_remove
Date: Wed, 11 Nov 2026 14:07:46 +0000
Message-ID: <20261111140746.375923-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

ndlc_remove() uses timer_delete_sync() to stop t1_timer and t2_timer
before cancel_work_sync(). However, the timer callbacks
ndlc_t1_timeout() and ndlc_t2_timeout() schedule sm_work, and
llt_ndlc_sm_work() re-arms the timers via mod_timer(). This creates a
circular rearm: after timer_delete_sync() returns, sm_work can still
re-arm the timer, which fires again after cancel_work_sync() completes.

Use timer_shutdown_sync() instead, which prevents the timers from being
re-armed by mod_timer() calls in the work function, breaking the
circular dependency.

Fixes: 5000fe6c27827 ("nfc: st-nci: Fix use after free bug in ndlc_remove due to race condition")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/nfc/st-nci/ndlc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index be4808859cfa9..14e1213d76c9b 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -283,8 +283,8 @@ EXPORT_SYMBOL(ndlc_probe);
 void ndlc_remove(struct llt_ndlc *ndlc)
 {
 	/* cancel timers */
-	timer_delete_sync(&ndlc->t1_timer);
-	timer_delete_sync(&ndlc->t2_timer);
+	timer_shutdown_sync(&ndlc->t1_timer);
+	timer_shutdown_sync(&ndlc->t2_timer);
 	ndlc->t2_active = false;
 	ndlc->t1_active = false;
 	/* cancel work */
-- 
2.47.3

