Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0474306D3F
	for <oe-linux-nfc@lists.linux.dev>; Tue,  7 Jul 2026 18:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783449333; cv=none; b=cekzExqzFfBbj6J8xz66cn1pDrnjeryAsuaZ2sSZrxfP5GiTyU9bkgk4QcqorrsjjSEQrsVL+D8BPoD7tX1NS0JW9nLhXhslSsnf6ax5xU7KHzvXdPFO3s/Ae+oIJRBnzsJ77/X4fuvcWcnmSZAemoYIjg3tuHH5B9o2I7eCLAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783449333; c=relaxed/simple;
	bh=LTNIWWWHNfOkmzU80JlTfNalGkQHDxa1lYfF+7hTDXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KtrhSmVaV4aM79dOwKcQITjC1WamzfydOwZh/ThkR2ZPF6SneMNEDv6eYY7q/vr8nM+50k6F+LQJm8uiZUIg/uqZKQtzMWCsd74Hw5OxxhXywgwSbnGUVv+2RLO3lkt4F7LRBE6e+c3NNsfxOqN2HfwJ1yImTu/YAibUV/Rkv1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOToFiE8; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOToFiE8"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c21495722so24168401cf.3
        for <oe-linux-nfc@lists.linux.dev>; Tue, 07 Jul 2026 11:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783449330; x=1784054130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OtzdIfG9XZcnEgeVPPq/84u21ReObj8E02cU3lMTv1U=;
        b=SOToFiE8ElOuNElLhqYmwPJVeNiwGyf3POGyrplIGmjFW5F3nDUfH1kK/0qhIKa3Zg
         gxJE2d7U8Le+GTRHAzJzDSnNmQ8kQBltQltufBl0nd84AsQNeoGZaJh1wHGTrP7uB2d4
         F3GwR0k6eqAkCj3myW3VmswJNYrA2dADue9g3yOlS24Gj4RBwXqrIa/A9EN+nHg8iu8/
         M509k9ukUh/jOfIytgQLu3rasGH8FNRrL7YzhxVegEMq1iRMex/v2ViYDBYM9wzG6Ad2
         N2Gt4BXPoaQ8DwJ3Vt+G/JdKehi15vNJK0oCZJRSglNVw4Igs1M9fBWWOVGCv1UTfVnU
         3tGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783449330; x=1784054130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtzdIfG9XZcnEgeVPPq/84u21ReObj8E02cU3lMTv1U=;
        b=Ud8y/nmPMMq9cOPpFU246NHrFqdDammNqqOFmZsrKYmlEcfh9TbJa1Yhl+im77R9nq
         /saQ6cEQpoqgKO3bmcYBSRzsIPDr2jDKhmvaRc28AOBBXj/09e5sNK9Am6XwclUDIpVt
         bnE0cLF3NqbfYYL3fu6buBONTACrSdkgRBBdjZtT8WlKIyculqnxIytwWWNBXzk/xOi0
         eKR5Gm8DDtIs9yM8kAqd01I5vKXRPivbDxEAO8MDqJ0QaYxWkxL65kWqHmotKJA6qSgY
         zaj2WOZbWSY1KYiF1xfBpIXSxQlY8YE0Vz2YC1t3MFQNsGhN6FJz21VuY6kf6g5XaDt+
         PMsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrN3CuQ1c4L2YQWp66iGuwqXfO3Iu9oY2wfIEemQ5kkinlbSGr1zRCVn2LRsYJptTzpX6cADKC6GQVemxo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2KUCK6tjkM/cqxmqpYG4EyK84edZCCuu+Vt4AoRmU2uQTaoSJ
	O7HAYXrh8AZNar3+4ydGm4zspS+nsScrSG4913j05Tg5f8M7plTXzLxl
X-Gm-Gg: AfdE7cnvMJmJZ61IaZiCprrfWBlgjm5wIIWAJIiEBKYcQrFZi6oPJC8Yjj4xbgbXiHT
	LGh0SCJTgpBiZA9wd05ygIVJejbmraCk4ek6aQAzf5LteZvUJ6i0PK5LF5hypNjwbxPaapXVuFE
	iwO0Xig1kEB24l8Ry2ImrGDRjuZjzTqT53PDk4IUzP9I+1KHdXahZj3Na06tHB7Z4+Mieere9ye
	Jp5Pvm1f5X3zZiVgKTgk4++uWWg8n2QwaMaltX8AJB17HYnZYtGrcqRBUCvuibbj66KkJhH5gxJ
	DTKxqu4bOsDXeeNHbbKqZnGjX8md/+6MVGk8h6Z5WbyUKy3fq0jeJm8kqMRwKlvfUtF0dQ84YCL
	j1d5kZQkP/K4Ac5ezsCkZsOBzNUcUWVAfaCtVI35Q+Wn5Z7RSG33XcXr0E/BvCqUlJZyDSwFXUD
	umLmWdxsiXqIkdQhBTkMatATtOa98rO8AvhcG/OjBkdg==
X-Received: by 2002:ac8:7c54:0:b0:51c:1590:8e28 with SMTP id d75a77b69052e-51c747be191mr71047181cf.25.1783449329472;
        Tue, 07 Jul 2026 11:35:29 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41d2d688sm124822691cf.17.2026.07.07.11.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:35:29 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: david@ixit.cz,
	oe-linux-nfc@lists.linux.dev
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Subject: [PATCH] nfc: llcp: Fix nfc_dev refcount leak in connect
Date: Tue,  7 Jul 2026 14:35:18 -0400
Message-ID: <20260707183518.1888697-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

llcp_sock_connect() takes a reference to the NFC device with
nfc_get_device() and stores it in llcp_sock->dev before moving the
socket to LLCP_CONNECTING.

If such a pending connection is released before reaching
LLCP_CONNECTED, llcp_sock_destruct() does not drop that device
reference because it only handles connected sockets. This leaks the
nfc_dev reference acquired during connect.

Drop the device reference for LLCP_CONNECTING sockets as well.

Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 net/nfc/llcp_sock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index feab29fc62f4..44639ccd438e 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -960,7 +960,8 @@ static void llcp_sock_destruct(struct sock *sk)
 
 	pr_debug("%p\n", sk);
 
-	if (sk->sk_state == LLCP_CONNECTED)
+	if (sk->sk_state == LLCP_CONNECTED ||
+	    sk->sk_state == LLCP_CONNECTING)
 		nfc_put_device(llcp_sock->dev);
 
 	skb_queue_purge(&sk->sk_receive_queue);
-- 
2.43.0

