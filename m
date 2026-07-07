Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634633F99ED
	for <oe-linux-nfc@lists.linux.dev>; Tue,  7 Jul 2026 11:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424680; cv=none; b=hwcdxzJGKIBKBCQwv6E+0MIFxQ+B89ZP3rtQqZct2o2cmNE3TBmMHOrlHwNAIxnIcTgJXRwYRcAafhqRP6nreQi7R7pnwD3PAxuLMn4KimH84sDxOTewZQwSmsm6All6zmRcaF27jArWtlBMaWc5aRTeudwdnQgUS2JIPtsb4Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424680; c=relaxed/simple;
	bh=KyobzfFT857/xJYn7ncP07FGsnX/hqiiLm+rms3UCTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tpjYZssZfE1QcB4adFmwflJV0diHmpKOL0sigi0+r30lFZvXM7oJIjGvSxLiVJRNorHfG/MY82mA2c2FYjj3mGw+GWR9iijC0BlU7Ob/HuCPcftzr9ntbv99wkQ02fEIc+njAXn8adREnJhCfx5PDswXi8PKiY336+qRDphFEXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=iSbr1Unj; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="iSbr1Unj"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so30900725ad.1
        for <oe-linux-nfc@lists.linux.dev>; Tue, 07 Jul 2026 04:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1783424677; x=1784029477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pKhBjhdvedO5kI4cf31ZT3jc8IVL8OLcFwvvWlnVO1I=;
        b=iSbr1UnjQ85XnZ1JA8JP/U14KR3sEHcIhMgBVa73cI0B+0TpEFhnbNG5lqCli0dMD0
         qucMxxqDaqQM+ub0xWoRSiqyXu8juf/2JWIP2r/yjlxLqubkiqze/BytQeUAi7LVxN+a
         4Z6Z1sD7YFUahji/WMGVwJxLZ+9vSonnXMa4zKOPf253FJZuatFqq2rWRtH8xiPFtvcb
         KQn6gKgQ5jcJA9NlWbFfMvRsv8Bat5xrACG1FRcV62NEhwhUCdj25bt3RbpwJ2HjduEj
         rzZZUxUIU5sJqJIqi42nU3sZxQjtS71zFCrseEGpFd8V2nJONyektbx1iOQ+o/2pgWpY
         Yg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783424677; x=1784029477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKhBjhdvedO5kI4cf31ZT3jc8IVL8OLcFwvvWlnVO1I=;
        b=gOmujPh0sDUrICg/aJwujInOfMOSGLd0GWUW4VZY1F4L8j0SRh2dXGFmcd1Ux7Ztlv
         Mr9rOP5vNcoqQSQOKC3AOr6ynWIkKK/bIex1dnT1z1QTyPwyUMkd/12mBeP6Sk4Q+vZz
         UK4vxbkIxd9Fw5jvd4Omm6J4vu1a0kIRDC9XxOemQQ9Px/xmEDw+t8gHZ5zO9ujPJNxi
         y3koY0x1832QykEhI/lMi2EGM3XnkuxUq1g8fYW129Uh7w8XJS97wv5NXMp/E/DHRySr
         HbCx63aUklGGlg68YELdAzwRURHFzLm/jm2zyT9TAydaFgLPWrrrA6TQiT8EsF8TkTAS
         y3vg==
X-Forwarded-Encrypted: i=1; AHgh+RpNgBaSc9C/qPAfp4zN8qLnXWilavny14cXh7bAvSeTm+TD7y6w+e0FCml5NDPYqxYAXyUzjA0SVZ5PKCQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6lnMQtrIFRNGv6mUMfdWDD63KDv4SgOR2o3lZ5Otb7GAivGw7
	Fcjc/fApBrfB3X4CZc5geGkKmomari3AQnkgTjIy4UWOkkS4turc+M0FOrVKFktG3yU=
X-Gm-Gg: AfdE7clyVhbXkOjsD6mWbXyzjF/9WRCQQyQzN3Y3CFw6ZCBdqh80SuBljhjqqvUb8Dt
	6O4XNxdi1zaICJ22JCPF6ibNDduVrlHfm/Z550CzZLrUy2Zi31a+CqYD2eWJg88iMaqXcIE1KQ1
	0BZXukFBcLXEKA9CiVJbWEZRehNEDG8tpcR/rMbUoRDmihjsQhcwBJ1h7y/h2qYrujmrM1j9yUq
	ljQggmND6iX4uYCJmhbZHY4M+MtTJSYOqVa5M8oZONKl8CfkoAuYhPfZabDNXE/nWjEcH+g52n/
	3QogKZgIvun80vKn9eM052L+1n05teQzdz1L1EypS8H0B67Rovq51iMih1lRsyQzKcZvvkdmy/m
	anJ1oRB/TmS2Qo+64b7OovjAckg70cH6ckBiSepe51KHZN1tzxj5FzGkvKsvhsy5TMv37DuJFAi
	SZOr1q+/BkFyAYz639F032bFYTrHRhLl15ci6PfbzKGljxPfivbb+uyKPuuY3xOA9SI1FPdVRan
	nBHpCBisKfOWt7Y1zF40KzEhCq9Yc/sCG2Se2y+9bE=
X-Received: by 2002:a17:903:38c5:b0:2ca:11fd:659d with SMTP id d9443c01a7336-2ccbf07b550mr53814135ad.34.1783424677549;
        Tue, 07 Jul 2026 04:44:37 -0700 (PDT)
Received: from Metius.iitm.ac.in ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ccc9d59e51sm10206015ad.76.2026.07.07.04.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:44:36 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: david@ixit.cz
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] nfc: st-nci: Fix potential memory leak llt_ndlc_send_queue()
Date: Tue,  7 Jul 2026 17:14:08 +0530
Message-ID: <20260707114427.998485-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The skb dequeued from the ndlc->send_q is dropped without freeing or
queueing it back to the send_q. The two function targets of
ndlc->ops->write : st_nci_i2c_write() and st_nci_spi_write() don't alter
or free the skb on error. Fix this by queueing back the skb into the
head of send_q to be processed again later.

Fixes: 35630df68d60 ("NFC: st21nfcb: Add driver for STMicroelectronics ST21NFCB NFC chip")
Cc: stable@vger.kernel.org
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

 drivers/nfc/st-nci/ndlc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index be4808859cfa..480a30acd996 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -101,6 +101,7 @@ static void llt_ndlc_send_queue(struct llt_ndlc *ndlc)
 		r = ndlc->ops->write(ndlc->phy_id, skb);
 		if (r < 0) {
 			ndlc->hard_fault = r;
+			skb_queue_head(&ndlc->send_q, skb);
 			break;
 		}
 		time_sent = jiffies;
-- 
2.43.0

