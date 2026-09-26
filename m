Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F0B39E6F1
	for <oe-linux-nfc@lists.linux.dev>; Sat, 26 Sep 2026 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790457659; cv=none; b=Toh2iLH+NL1f5JoaM2EjumzXEloU1UoZ81u4MaRBxMlkWYht6jfIu2cw/8hs5OSQZ0FWd7ILgmAnSA1R2sRTDkLw9/k9Bn9NkfCfnE1i1nRvfT0JXNZEjSDlTytYEbf9ho5RLlDOxHJOr2MbzSne2S27M4lBQ9gDPdpJ7/CZKqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790457659; c=relaxed/simple;
	bh=ehymt4lLAFUs4DIWG3dhPtmab2vi6Zhi6J9yEIZNRNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MZQfy0glSHysfL66EkL7cljOhmoDD5YZtIdzTzY/5R+jC9a7WwZSy9/W8OYOCEKB/7+9loIIjiewGPOn2As10qA4zXGO6PU6F1XcwtgxOvGS+TIBLUc8EVyfrlA8/FztZDocFPFfP57jsjJJ0fuWP7JLPpSaTlPY0Z/wXD628EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSvz0w2H; arc=none smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSvz0w2H"
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b451f1e66fso239465137.2
        for <oe-linux-nfc@lists.linux.dev>; Sat, 26 Sep 2026 14:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790457657; x=1791062457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3SALmSygZKgLrynJMWzH3B1y0jcmXpTFsBEcTzacV4=;
        b=hSvz0w2HdWZ0xwWYyo8mfqoXuPxD02+/JVmtx4lgMOOd6OC/MvF6crniSjaCa7Td8O
         9A+ScboxTaJes0z+bf9mAg7POv5UZmC/9zJ9Wp0XxmjIHOEWA9X4sxpjxww6fFwfyBX6
         UWXXTpeR++eRw6L6tfDGL/ost1stVNebKrCyF4tV6sfovE0q2677LG8rdt7tk67An0+H
         GY0Cd4qtjsZ2pgNS/WewA+R9kdtfKeG/0z2gc3DUMbXYAdXL+hC1H3wW6yFkF6DdvFoJ
         pfery8q28cl7/P7UrMEvHeYDMFMUhy5Xo4SOdkc2KboijbaIxfK/ARAf+eSO5ntrk04O
         ZwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790457657; x=1791062457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3SALmSygZKgLrynJMWzH3B1y0jcmXpTFsBEcTzacV4=;
        b=qqFgWELq9cwgzKR2PWwxF6uLVTOT9F7k/+/iZJnRQWKfpSTJyqlnOzyynKFZQl1/2A
         NYnf212rG83S0sw0r7M7nXThVMuvgpFcPrDCq2H5kWz+i7UwtPlgLzOG+gshEjHZrVc3
         dANy0Iv7nFNwhIO/l+ASkUhFMEK+FEk+yzaJ1UfXMFd/1D+X8TxjpvwfRU0NnwEIV1rQ
         kWJYkTDxDKJFN1WbfW6LV6VCBZoDNeI8eYTyQzMeBo6ri1plgx7+Jm8hzaccHx00JoK6
         0d+yy339+j5CVIqpCfopZ+2ez5g6+xgSgjtd5i7b2lmVscRgpNY0HpisAi0OW1uo2u8n
         movw==
X-Forwarded-Encrypted: i=1; AKwUvBz14NpBAiOfYhbFAiwi9Te/bJZ/OCqQVnMpI6BbtcZUwUubBJpyizN9odCLzHrNZ15+MAjjHv3EpBCYCZk=@lists.linux.dev
X-Gm-Message-State: AFq9FYJJth0vymrIg+/cQZ2MBxmE9pzTCrYqMfILGgQZlm18wPWz/1yh
	Lqc98jUrghKgjOy2J3twBlXhO5+VKsVpxyfo1RzbRetqecr8aN/enUm9
X-Gm-Gg: AYBFou0POmbGdul1XeHy4bhrLPnrHUpknli68VF4i3GgpgDJBfFkY1ICJ1FmqJB0dxM
	KsgwTnTL0pQuVYrmQk4tfvulWxG6jVHUon1madV65RnlA1giTBm0TqWKAcfv7XoMlL6aGK3dtwt
	oJiEJuaC+yNmOnBZH1HcN14PJg366xVtoccRCMyHTkYxi8AaHg4V35hDmaB/uTwkXLkP+qYPuwQ
	62BPK/eNgb6P8R8v3i5FwZ9FNnRAfQwiumN01ojM13115/3AFzdKINAeOU8BLSy8GEkQDTrXlAv
	hijrYWyWxDMQLPXaqAmt8SJRnlNaJOIKTl7bgQ8gOXhnoqgRcRZ8sSJGLABPqU/97rxpd0niGFO
	LsDhg/KhyfcSXCSpDaKQGgz1YR3KfGkf+uwrVA+gVoIWX7wdAXKwMJr2NfuNn9YFTi/6eQvXQFG
	Njg1ehzUXdbIT/xPhKTwZNFTsjDFZYwaWswv+TfFpsQV1lQ3bPuk6SL/gl4vmunzUUhDwbdMWd9
	g==
X-Received: by 2002:a05:6102:4b11:b0:7a7:198b:674c with SMTP id ada2fe7eead31-7af1f3f3a90mr3668073137.33.1790457657120;
        Sat, 26 Sep 2026 14:20:57 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b9ae253sm3267723137.8.2026.09.26.14.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:20:56 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH] nfc: llcp: clear device pointer on disconnect
Date: Sat, 26 Sep 2026 18:20:41 -0300
Message-ID: <20260926212041.1342558-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfc_llcp_recv_disc() drops the device reference via nfc_put_device()
when a connected socket receives a DISC PDU, but does not clear
llcp_sock->dev.  If the socket is later reconnected, any cleanup code
that checks llcp_sock->dev will find a non-NULL pointer and attempt a
second nfc_put_device(), underflowing the device refcount.

Clear the pointer immediately after the put so that a subsequent
reconnect does not double-release the device.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 net/nfc/llcp_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf81700..199543c47 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1220,6 +1220,7 @@ static void nfc_llcp_recv_disc(struct nfc_llcp_local *local,
 
 	if (sk->sk_state == LLCP_CONNECTED) {
 		nfc_put_device(local->dev);
+		llcp_sock->dev = NULL;
 		sk->sk_state = LLCP_CLOSED;
 		sk->sk_state_change(sk);
 	}
-- 
2.43.0

