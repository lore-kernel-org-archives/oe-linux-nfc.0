Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813AD3B14DB
	for <oe-linux-nfc@lists.linux.dev>; Mon, 20 Jul 2026 19:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576299; cv=none; b=eODZCfsJf+YTEWJ0PtemPT5WYfl87/5nf2pCuXrAzHXFa6uo2sCXpSQCSCYrUnt9uFRLk0eEc1pvE/EnPs3mOe+x0jWipZPekqhKdc0cBiI94SPRgTfltTzetSin4R81HdaUlQ4OyFHZLEYQTipTXx2sFgkakBmvxobuFsyKx+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576299; c=relaxed/simple;
	bh=ztLYbWJ1y8k0+eUnrRRP6Ge2zqUEpkXCr50a1DVmokE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DRxF3K9hRSRbn/VDnF0dZ1DM7jV185br/7tcR29PUG2wm2YeMWxHoss+UjPU0Yb7GfVKWwiJ1dgNv5Hf6KmJk4ZhvH0sY7c7vv7zhCECrOxTgYewTgUOexeZz0n4B5Y76LZc1bfRb5cAeN647mOk0r8FtpM4KAGOxUZXCsvAlk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=og/TfXLY; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="og/TfXLY"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8eeadbc5e21so46494636d6.3
        for <oe-linux-nfc@lists.linux.dev>; Mon, 20 Jul 2026 12:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784576295; x=1785181095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XVmP6Q1Pga6fp07J2kITQdzujOlBsfUzlR7zTDUVucw=;
        b=og/TfXLYvYX5pnLgEQ4NBXY+vJbDsDdwlUB9FZ9h07858qOvKHta7fqoUlvoqAjTbJ
         91YTLRV5Znj2E07aarzBUtsi5nIhtwfiPdmQodHt50lgWeL/9Kn5kCd9l8/kapxkzPxR
         7yHdG1Lw4/1csptOY77erlsCFUaaQHE9qnp92HGTp2suvF1E8i5rEIRv8uZ6a/8/QDs2
         /cXuI+jaP4K2CMWGcoRoQG3Oj3VUN/gI8jlDGfuMSgepwfBkL/2ngleoXu1iGN7turCm
         KCQ1g61sf3LelP0/5kf1rkoJmbX9ftcqEFwSl3LyjH0GpdmxJmikkwv4yqjIzdX5g3KW
         BL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576295; x=1785181095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVmP6Q1Pga6fp07J2kITQdzujOlBsfUzlR7zTDUVucw=;
        b=EXH7wqZai4c49RC/iWftfF4/wvbOPjg//LTtyqoC23ENFBYGuzVUax07JY1x+vGrs5
         8hui9aHbdO8HtF5yzI3wqCsbYYbyIVYtooz4eu3gmG8ME6jvurphBiEibtWL36TEkBJO
         Gc91sqJgsIg/F4qDQX1P1fhN1ankb8mf5tWjnKresHyfLaRrQSXHLernd259cfLFLXq3
         DpkXVY6LuCphKlCk5a3bc0NJOJdT7JEvoOEvlGrEn7gr+RsN5/k2rlzyjVcARnRwUqO8
         zqQJgo7pgPikhzTTSAIsz2M6WKeNNNasa3aVwlNjiurnr3MKm0GkR9cq8CYbtZg4neiE
         8ziA==
X-Forwarded-Encrypted: i=1; AHgh+Rrf6itkTjJAA44QYtwcXeGZVbK8DE1WBFr3lD1qSOan0UidEYPpExfLoKwpvmqpF6K/2clk4umKn5jaNKk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJl/Hls/wPWvoJAfpGKS1lmMQ0yOh+/b3d9Zj/PAiFn8McTb2O
	+uBvETYlOV1Jch3GEMdf9zG9NlREBu4fTkGqbygPQE8wZ4Sp7qJfCr/O
X-Gm-Gg: AR+sD10CXTdEkBlBCvwLjFdBUP9XRZ8LP9yBGXX10i21wgwhI68yMpv0ZOB73kKLLNr
	FTKHIFVESChv+wX6MJxRbBWMZB4UlA8nOPPtdKGNyLB6y1IFp5t9it/W5pYYnlzz1XPjNl7RPR2
	qyaYx6GhakWABi6FdpQecbYhkZT8Pwu7y/QPey0+Ui7ApFKXAdad3xrWnvWNGpkauc77Ma9x337
	jGHJGe4N8LsRMR0Z6RdIH9fJBBdKSgGry0ZdNZxMRX30C5OqO6KOL022N5gKkdKUWyaNuUw8n3Z
	sFC7KedNfn7T/idDH/848yOBMSWHYIEjyZGmpKy66ywxZXcHZzRnUHS/YNOdvR9cEVBVQTat+tu
	zFbOETWUypQQO7DQEPWbVSOkXQzm59SNzHViyNt2AmilBfQuc9wbjvZIyuA+dTW8DI7P10aeiIa
	e8f17xjOWCf7zuh4kdXbOCMEikOYcT/Bg=
X-Received: by 2002:a05:6214:2269:b0:8f1:8937:5dc7 with SMTP id 6a1803df08f44-907784ddf91mr182320336d6.56.1784576295334;
        Mon, 20 Jul 2026 12:38:15 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077871f650sm98436156d6.45.2026.07.20.12.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:38:15 -0700 (PDT)
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
Subject: [PATCH v2] nfc: llcp: Fix nfc_dev refcount leak in connect
Date: Mon, 20 Jul 2026 15:37:59 -0400
Message-ID: <20260720193759.1773705-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

llcp_sock_connect() takes a reference to the NFC device and keeps it
while a connection is active. For a nonblocking connection,
sock_wait_state() returns -EINPROGRESS while the socket remains in
LLCP_CONNECTING.

If the socket is released before reaching LLCP_CONNECTED,
llcp_sock_destruct() does not drop the reference because it only handles
connected sockets.

Drop the device reference in llcp_sock_release() when unlinking a
connecting socket. At this point llcp_sock->dev is still valid, unlike
after a failed blocking connection has cleared it.

Fixes: b4011239a08e ("NFC: llcp: Fix non blocking sockets connections")
Link: https://lore.kernel.org/r/20260707183518.1888697-1-shuangpeng.kernel@gmail.com
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
Changes in v2:
- Move the device put from llcp_sock_destruct() to llcp_sock_release()
  to avoid dereferencing a NULL llcp_sock->dev after a failed blocking
  connect.
- Add Fixes and Link tags.

 net/nfc/llcp_sock.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index feab29fc62f4..0a3d87c2c9b3 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -633,10 +633,12 @@ static int llcp_sock_release(struct socket *sock)
 
 	if (sock->type == SOCK_RAW)
 		nfc_llcp_sock_unlink(&local->raw_sockets, sk);
-	else if (sk->sk_state == LLCP_CONNECTING)
+	else if (sk->sk_state == LLCP_CONNECTING) {
 		nfc_llcp_sock_unlink(&local->connecting_sockets, sk);
-	else
+		nfc_put_device(llcp_sock->dev);
+	} else {
 		nfc_llcp_sock_unlink(&local->sockets, sk);
+	}
 
 	if (llcp_sock->reserved_ssap < LLCP_SAP_MAX)
 		nfc_llcp_put_ssap(llcp_sock->local, llcp_sock->ssap);
-- 
2.43.0
