Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB514F30C0
	for <oe-linux-nfc@lists.linux.dev>; Thu,  3 Sep 2026 16:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454233; cv=none; b=FhN2FgsVfsQUg7hnCoDMGDKjT0Z6L/5TTegG6shTT8CiXsfbZuXMQzHFUL1BCTxUGgccP/D1qC0xBIn3q+ilr/8lUj8hcbgQlQRUTYBWAAYD/zB7/8c2ep1841OqzpqYB1p+tw5A5zcyG+QSuhbe92nZEgK+s1ldo5699eSSLxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454233; c=relaxed/simple;
	bh=WIYW1hFseBhkom1HpovCX+6HMqEApH6/wtHvd3IL/Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HyIHPko30ELpKS21iGTKhyBeu9sMPslJYTYdT8NbEAjVxplHa3kqh1WJMS/jRMsPZR3pB6sFf1egq1JXpRcQbZeiAtIpDOqG6f3rRSLZ6owgr0Pxrti/iK6DkS70v3BN4pnY4QxcsylcwBWoTNPfVw9QyJTYaqU0i13XVSlJuEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYSO9k/5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYSO9k/5"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482fc3327fdso48316f8f.2
        for <oe-linux-nfc@lists.linux.dev>; Thu, 03 Sep 2026 09:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788454230; x=1789059030; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9P1PcfnFpiawXqi46+lwtTgAUutr2k9gbd+NE4dCYww=;
        b=lYSO9k/5skbrb4VlizvQL9Y5mV8YIFUMv/d2T+o09Bkv7yfCSPamjbVViTtNrSFgOJ
         Fk5bZBWhZ1JgFVR8wCobsE6WN5OC3UqHYm1EaJID+hO94zvlp7zuYZEst490Q7ZT7Oy5
         M3RoN6yhsuCB3sRFVcTVXTdAdgJMEE3MSy4DbCP5lyOV/WdC9SAZaUhBYrGAM7RUzSeO
         XPmsjE9wzW0a2pUFYry6BUkM+oHta1vzIlQBZU+bvVB6F8L5e1v4+mKkrShL5WXY+J7y
         g6KFj44SUt2/piH5/rxY2QmyM/Hjp/UVuoADrrAsAUWqVSyMbqfz7K2+h8+q1ThKNZmr
         RGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788454230; x=1789059030;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9P1PcfnFpiawXqi46+lwtTgAUutr2k9gbd+NE4dCYww=;
        b=dkiSQxwmOZZDkydEeYR4aSTg6bpiHxiN0Z8FN7MXKxAu2qho4Vsvb1w3AlYZnSsohn
         U1usr18oZlCKAToHzl27R9ynHxmres0SVfbH9pNAtqFN5GAE93APtzZE4Vmtb4UzvXnt
         nHdMtso3Ekgcwu0UkCNSLoTnraWxyRvWSVBIt+F7gk7rq/iMysLrF8xaMjQEpenoobOH
         HWJjlssj26WP4l9sQC5f86eu2zUBS61N6CfQLIC9gfX/05VKCwdLKRBBp9xjCAX7DIw0
         HN7huiXf5zzX+SMHq3fQA72LuSdfXv4L1ekzNw5qVRimjHZoHgOz1asBmeArwhaOEaA/
         P86w==
X-Forwarded-Encrypted: i=1; AKwUvByD0OTiJpxthg0W1K9gY5bh0C+1dGMeoM5lhoVDQHDBo2+Ve3oZTfgeNc1metdVr0KBkdYW8a5no/rHQJs=@lists.linux.dev
X-Gm-Message-State: AFuF++lCKiPa3QsP2QPepmSXRDPuEAzrulOaUmJdv889Qv/FC+kVKnR8
	lpBNPt5VTsjGpJRBzYw6UCd6Bp0HEjfzT7bTCddi3UmME+gB1Hl9q2pe
X-Gm-Gg: AYBFou2MxGh2Qh/hy4cuMF6AWWEpz4kvPCtrzLU3ZplxfHuaTwzx/Gkv5VIr/GmLtHy
	d0F3un64ruNN47K2JLIMh6/L96YX35LsKdbZcJuZXAn8GVZS3UzpN2oQ1zdJ7TGmZMWkriB2FmH
	LdNEpWCuNfzOyLlmO2Jf0+2+mAaTJZtDjH3VL2SH0WAqU/DG1qlI3lavhMOQHM44eeOXq5sZWLq
	xFIzd8wGTNoEoZtUkPfSS9WPTzd1e9bbuDhBSiBbKFMqSm58podY+oF0G5AwB9jux/sVxZe66pG
	9rqTeQ6ARsgjRCN4dv/58CoHB5sJZhCw0NMqusbIQDxp15EBvU5bZfYmlUPNEsiyF/kX4bLBOV2
	buTkXNVqNY+SpgycOs3ziAgFd3pviGKCoxlJPQY5LvwXI0bUN/lz2x1bv4xavx3t8QhA4Ak1t0D
	uZw54HIrQ6LncUsGpOx52AgUWUotgPT2nMCK1hDXcHeYyWtJ4M3RJDeogT8Q==
X-Received: by 2002:a05:6000:46c7:b0:485:847f:fd97 with SMTP id ffacd0b85a97d-485870914ccmr561197f8f.4.1788454229792;
        Thu, 03 Sep 2026 09:50:29 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7fddbsm14470014f8f.11.2026.09.03.09.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:50:29 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: netdev@vger.kernel.org
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>,
	syzbot+1e3df0852e82c21ca418@syzkaller.appspotmail.com
Subject: [PATCH] nfc: llcp: fix slab-out-of-bounds read in nfc_llcp_wks_sap()
Date: Thu,  3 Sep 2026 19:49:39 +0300
Message-ID: <20260903165014.497490-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nfc_llcp_wks_sap() passes service_name to pr_debug() using the %s
format specifier. The service_name buffer is allocated via kmemdup()
in llcp_sock_bind() and is not null-terminated, causing
__dynamic_pr_debug() to read beyond the allocated region:

  KASAN: slab-out-of-bounds Read in __dynamic_pr_debug

Fix by using %.*s with service_name_len to limit the output to the
actual length of the string.

Reported-by: syzbot+1e3df0852e82c21ca418@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1e3df0852e82c21ca418
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 net/nfc/llcp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index cac1b5487064..fda236e4d9fd 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -341,7 +341,7 @@ static int nfc_llcp_wks_sap(const char *service_name, size_t service_name_len)
 {
 	int sap, num_wks;
 
-	pr_debug("%s\n", service_name);
+	pr_debug("%.*s\n", (int)service_name_len, service_name);
 
 	if (service_name == NULL)
 		return -EINVAL;
-- 
2.55.0

