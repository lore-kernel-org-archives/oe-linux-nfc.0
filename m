Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA2B302146
	for <oe-linux-nfc@lists.linux.dev>; Sat,  5 Sep 2026 22:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788648758; cv=none; b=Zb185WT+68oFEf3pu8EZpUiEbONgUvYZqh+tvkFfOrsIf0k6yy+fYgLN2zl1a9+lwYnNFjvvj+JdZrUNWNjDYIq57WY9d3itqOqoxA26a6GohIWd8STjzdwlwk1HQzHH/C2xc1TdAoUAL+xRlxoYRrJ+urDnTzeyCNZXjiuvuD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788648758; c=relaxed/simple;
	bh=NpZyNzNUhutWagHqilNpgKZT91VlklsV6mHOKCKO/T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsjbvyWYfXSKiiaUKaNGagIujU9mQS8aERLDUR8FhjMx2C1LqHqPXEPA4sO+aMblksyAqca1bR+2VJHTQkEglcdYMWHx03BevpV9f553xtbnTsSQROMYU89xTLTfJI0vNlE9cgzUGnsJwnp7VhUsCVsXsTZn9Ffkcs0jFZZO/+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bxhl0wLt; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bxhl0wLt"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48431648f33so2399228f8f.0
        for <oe-linux-nfc@lists.linux.dev>; Sat, 05 Sep 2026 15:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788648755; x=1789253555; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XCkBwlj1vCXbflJebDoML9tmLNIEB/3Els0FcjcXPJk=;
        b=Bxhl0wLtm8UBmAlfEwhOxTS533HNRRkzzpIZiZ3ESsk4WDGjlaqKG+nLK0Janl+mIx
         xlXBvsxhRqY0ks7qYs9iPiDS3hr7IAlsWBkQldyun5red+YVNIIyTCSpIF13nLjWelCH
         YCu6BIYFxm0zHZVmNIRiCyVGHEttqllLhQt/Cs6MYodLoZsv3tM55kPvHpj+Is6BfDqb
         0qsq8/IqFR/lZEk4tkAPbpo//VOLUOH0U71s7iP9wRl4IyEecC5pTmPZrIZvaaiywAz4
         yTyfQExa1sc6JI0SIS76uPPaMZD6KK3sIFoNOZLovUC2CtvPktkrIaYg2xK2taDtQVgG
         lTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788648755; x=1789253555;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCkBwlj1vCXbflJebDoML9tmLNIEB/3Els0FcjcXPJk=;
        b=tBtxsy7NXWOiDmecWWm1hYXyf5yeQna7Cp899h5eBLVN2c4eJqxm+Z7HzqZ5VIJEwd
         4z9v+SQjq0Ob5KVqIZON5kTQVgGKGdeUDYJrFee0GewROeGeduBPmjH5uf79AfCg1wG6
         Ee/w5smzpBLgtYuIz7pbtscotgfB55/IuX+mfvrAdKRFEhEcW5Nr2SLZOwKrKzP66ILc
         13utEYIJ8lSxs172FdmmD6kzuPpRF0/jVP5cgLYTeSORSF51uuqq/wtFZK5Eh5Njz6qD
         wsbvqqBM1o+NEyLDxSW1R7W1lVrixiB+jTe19yk6N7WuQHCSoKJWXKeX+mZ30YhNMaaP
         8hIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLYHcAr2EdP7RUjS2WizFxo4Z3BszQ9ol4kNANj6v2fs7v298Z5/nuN6w7wvfE560GbfpKLVfvGswaOXA=@lists.linux.dev
X-Gm-Message-State: AFuF++msv7Hs6+SzH2eUManjkqWJ+Wr5/crf7q/RQEzEcJL/W1XcaHW9
	cg8jrinWBEiofaG3fND03h9flXcmBKyV0M7mE9431+CopXPPcMaT7c3q
X-Gm-Gg: AYBFou32yxz8MZeXEkPTbVuBUu3D7ILSJUBXaO1AbGyoVbPz+drlCU8VTPn32r8EXWH
	OVprbR2k3VX3UE747vRF2heuD+zllmFUxpHOjEX6tzgbdKlFqjz/gdqyuwD9vxWbx9rSOWBiCYu
	89ysja6mPYa/l8qZ80GdpFNOYd4vhpn2iHpKm+bVV1J32OZrML3k5noKmb8Puo6oIkHKEWeNSli
	1Wb91d/F3qIq1FLbW6OK+gKLtU3Noyw/C0d3cvBgyeZL6ml7FK3k5liaWlesXLTtls1JAH9XN0E
	pe/htKLiBuvs39ksRWMxQvetiy1Q/Prauzz3BfIBKneQF2/1IXlfI+hNSbhIwjuD3WTefBHOYxX
	aUYnoF1bIrxrfTp2oLpc7JFLY+T7GfqMCELfBvVzVeqHc7M+Ml7JY0Oc7p8F9z3i8aYfwiBewrd
	xBb6yMi9CX3lH3W1TzUac6JVG06Ou9GVgcIaLQQ5PjJquv6wD5IxxQhAufcw==
X-Received: by 2002:a05:600c:3b0a:b0:49c:f13e:e4c with SMTP id 5b1f17b1804b1-49cf86f49b5mr128633775e9.9.1788648755042;
        Sat, 05 Sep 2026 15:52:35 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm405224965e9.15.2026.09.05.15.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 15:52:34 -0700 (PDT)
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
Subject: [PATCH net v2] nfc: llcp: fix slab-out-of-bounds read in nfc_llcp_wks_sap()
Date: Sun,  6 Sep 2026 01:48:43 +0300
Message-ID: <20260905225211.596366-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903165014.497490-1-omermetekaya0@gmail.com>
References: <20260903165014.497490-1-omermetekaya0@gmail.com>
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
v2: Changed prefix to [PATCH net] but still I could not find the Fixes: tag both in the gitblame and the lore.
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

