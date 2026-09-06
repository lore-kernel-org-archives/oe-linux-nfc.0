Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811B22765DF
	for <oe-linux-nfc@lists.linux.dev>; Sun,  6 Sep 2026 00:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788655175; cv=none; b=PUo0F7aopMkvgMKpJOlAaGlijj/cjAccj07OfyaIRf434R6m7I7xK4L+OQH0X4VzG9+D3nmKaLxvSpHNj8kM5DPiPES1ZItJ34RaVXA72wOW6Enyvp4X2dFu4VQXdtxTp+qgSn4BBso5iivlTQHD3RarZPMPC1oexxLgLr1U+CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788655175; c=relaxed/simple;
	bh=X/xRmr4GqSFunc+sX8Q9MZBpCDeItpD08dRwHxnF2ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VWM3eT2DV00eA+wYWgMIx+RCadyZGctJvf4jpUiHQIHFE9a5/qqX9qhTX359ZFgJPNDs8lKTckLLMJO4lQu/gvYfH1RvjzLaI+3EmnidWBgFVWeV7F4tz0Nd/PqQqwwCmRxaClZj3e5c95nLzGiwUYSDnnt5egbhYJCZucaeSuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSej4vAP; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSej4vAP"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-485850cf499so1304682f8f.3
        for <oe-linux-nfc@lists.linux.dev>; Sat, 05 Sep 2026 17:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788655172; x=1789259972; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcaDcOTwZKz9h65XJ4Y1vvTbk/7+OUqBRO3ySthF/ls=;
        b=GSej4vAPVHO5upESErZPn3EIEFfSdhu2Q/LgiXQwDMUM+cxBY9qX+Ojhg/vlDQJ9nP
         erN2Amgxtz5eXcCgBS0L3rzFtdyB/iC7exuvm9UIY1HV88T6WIHmLEDvyJJQac3H8+vX
         vvHxR3pEgDrOWE41IzvPGVHpAjOBtNUV2pDX5P/WLvRJ7lObIw4Lll4dSmn5k87eYCMm
         NFWUS2YbE2o5GKL+P1ArMW3fYuXju2x3LNsD2zPzDjO2riVbxU5A57rdZNMykQ6KXtAH
         sgyo143HUTFPKHvCFwlwyCJd/ED6yIsXt8sb/aVRW/cOfGTyoddLwfTfSt5Rm/EJEof3
         Kauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788655172; x=1789259972;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcaDcOTwZKz9h65XJ4Y1vvTbk/7+OUqBRO3ySthF/ls=;
        b=J81kLTZMUjjaTMr8Sp+NJgAPNoW38BHo0riyYirtqeIxcYSU+6zQHwlQ4ZuShqFBkZ
         S4FpIX37XlROQFETDoqjzRFub1mveKmBpX4FHxE9yv6/CUAkIkFrtMpn4bp4f5YPgRm6
         Zwo+TlNMoE+LLBQY143xSduIgz078u1hghC3JgiElHeaDUVkFqWg3qACASMgQgeEolQP
         2NofNIiIX2ll7L4rrfI1MNTZAzols1W7+kZIu5kCCNqjd4AfCTzltkkug294zjHUkPFT
         pP+ZNf3EX7nhEleun9bpM/2Izr+SSLO9gN9DTX7cO6WFc7v6hjxijzd4czT7B+bax9r3
         Ay/w==
X-Forwarded-Encrypted: i=1; AKwUvBygbVdrl6Scjaayu6FjK8NZJK1fW/Dn6jW3KXO+F/ZMf3JNR8oyNmAxihKQx4u9FoB+/w1W2k/ORwH9wTs=@lists.linux.dev
X-Gm-Message-State: AFuF++mhU/w4tqfDbAOraA2E9Uew2f90EGeV/twR8fMReoiten8m1JPA
	Zjk233K8JGKC9zbAb+hBzTqreyzbMiv/SK8DkDpHjFTu4qUruH75L+i8
X-Gm-Gg: AYBFou3QpS0iVUr1n/za1Y1dziawfJhkLxM809Id+Y8/+hLXqLygTaei96+TCyPGazU
	WFOOMEhENi39QcONUDHDaAA9wr7mcxsFWhnJ7ttGA7KuO7TtWN54hBsAhR7klRcaVqn4vkqqP+g
	+EGGDA35T4gLaKSeBslVUS5ne6PuX3cnFsys5ziiC74way4PF74Hok+G1ij8mUx7v3EcxeHVyUs
	JTVIOTOIjvMpKJaROh4T1BOuotEj6hz6Ix2IT7YnuiFhuj/R/sMgsDyN3lRWvXNfpqlb2P6bpez
	bNWB1Y7iKPs0mWTYzwavm9HsL0NBkq0Lao/eiDP6NpuHnwmj7PhD/GQhLOXb40jcB6cJe8tYQmi
	Wi+HPa/+KUrk3vkKVG0LEA8a1P5gA9t3FU0wM7vRBBnUP687WWzTr1AwbiT7pJZk4NWxRt2GTDH
	wqIHnKGKU9IVbjRTvJjCRKZxhtakMvRZ1Q7je2Yx/9vUxr9Kc1yXMiCxvRUg==
X-Received: by 2002:a05:6000:18a8:b0:485:8c17:975e with SMTP id ffacd0b85a97d-4858c179915mr11914158f8f.32.1788655171649;
        Sat, 05 Sep 2026 17:39:31 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b1320sm17088363f8f.27.2026.09.05.17.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 17:39:31 -0700 (PDT)
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
Subject: [PATCH net v3] nfc: llcp: fix slab-out-of-bounds reads when logging service names
Date: Sun,  6 Sep 2026 03:38:08 +0300
Message-ID: <20260906003917.627282-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905225211.596366-1-omermetekaya0@gmail.com>
References: <20260905225211.596366-1-omermetekaya0@gmail.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nfc_llcp_wks_sap() and nfc_llcp_build_sdreq_tlv() pass non-null-
terminated strings to pr_debug() using the %s format specifier.
The buffers are allocated via kmemdup() or come from netlink
attributes and are not guaranteed to be null-terminated, causing
__dynamic_pr_debug() to read beyond the allocated region:

  KASAN: slab-out-of-bounds Read in __dynamic_pr_debug

Fix both call sites by using %.*s with the explicit length to limit
the output to the actual length of the string.

Reported-by: syzbot+1e3df0852e82c21ca418@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1e3df0852e82c21ca418
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
v3: Also fix identical issue in nfc_llcp_build_sdreq_tlv() as
    suggested by Sashiko review.
 net/nfc/llcp_commands.c | 2 +-
 net/nfc/llcp_core.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index ca89fe967d6a..1213946ce91f 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -135,7 +135,7 @@ struct nfc_llcp_sdp_tlv *nfc_llcp_build_sdreq_tlv(u8 tid, const char *uri,
 {
 	struct nfc_llcp_sdp_tlv *sdreq;
 
-	pr_debug("uri: %s, len: %zu\n", uri, uri_len);
+	pr_debug("uri: %.*s, len: %zu\n", (int)uri_len, uri);
 
 	/* sdreq->tlv_len is u8, takes uri_len, + 3 for header, + 1 for NULL */
 	if (WARN_ON_ONCE(uri_len > U8_MAX - 4))
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

