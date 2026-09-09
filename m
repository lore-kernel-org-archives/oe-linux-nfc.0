Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8E35505D0
	for <oe-linux-nfc@lists.linux.dev>; Wed,  9 Sep 2026 12:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956457; cv=none; b=eOZdhN+Z9I65e9tU4CfUjyJwYV8MPQpQpI5GFAdukV/OeHdLCRgx+98Ld4clvMgdwATqXOAivNqpa1HO38C1EhFtEGfi6WA16rjHgO8/s7HEgyq5Dt/Rxq4V1OPCpSTL7x1KJD0C8L6DwQoKyd7IXJvrJzulftk//G24dDrVH5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956457; c=relaxed/simple;
	bh=vd+z64yYMDOdR0OIYTpsYsjv0KiOe8KWY0gyD1raOhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jrpsFjpZScAaG2gKhW78J4hyCNNuvNFdOl7ybJ4vR5wPSUSsv1mmNYNcHHd+Lok3R8T5iEZU0+Nnbmf9WJuItOgVEa053QO6FHBecYF7ycLYvrfN8VcxPhEWbnLCH7dBQ358CVzWCp8RdVMPbz/gztTToK+X+6I/zVd9tmBOOqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWJA2eRd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWJA2eRd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d0e19300cso781695e9.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 09 Sep 2026 05:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788956454; x=1789561254; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mWIg2sOePVQ5eOCne4aTRq59EeTij+H6YHGybcSN6I=;
        b=hWJA2eRdeEf8PPpm5tgJ9LPwTFpCXUJQ/7lCq+SWtmKEYtI/X+Qxy0wCZ2sd2D0dHT
         lFrqG3Nz+/cUnyCrSIxd1HqGf/sxaNHqYfAN9d+izUAPeuwps62TQuwekbV3wzwUQLpF
         ZK0WsDPWE74XKgYXd2D6xwYeY90MCzRI/JZjN8cHUI6owl8tJ9lcVUrenky8uxD5ZSK2
         XObA/2P1f7pAH+FTi3JLLRDfv1MnIJD6nt8z5gRinfqGnH969gj//ypoNLKe76yoP4xu
         HoidSvaP5hM7xC6Ahx834MmAqS8b9AuEXvoid9MKRCSI3ibB45MX9OYCZRXQ71ghQohx
         3vpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956454; x=1789561254;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+mWIg2sOePVQ5eOCne4aTRq59EeTij+H6YHGybcSN6I=;
        b=bIRGjgbs5sWaogdF7skkY61glJ3akuotlWjlXblmNsU4ypoRZL9Y1+kmbGzb5K+bjg
         c5KTn7K6wLyk0T+yB9qcopdjf2tkBt1P77gaBaxh5dE3rYLW5VbfA8thEV8xzT7Zinna
         zu9iLlxKa4S7CwkJznFri5el/eRkEAQrV0uUDFZ/VOeXka7k831bTO/FnjLtn83n4eDc
         BfBXGxNNyKema8dEuElykIfIRfQJ+oyxY/9BWlPu30vVC1NozZXPlzAcvTYUnyo+eUBM
         +c+Dr1CYfE3kA+68T/SYesJu2uqqVIRGd36ctz4rPu1eehEgtmaLhTEWlKI9oWt3LD40
         nyQA==
X-Gm-Message-State: AFuF++n9AiLhC8pdY5LR6N4swx4MTnVaVHPn4FBo6Bz0xVQN6bcFTif7
	2aI+cShf2hCNmrE7SiZ4GbvpoJ2IxhatUJCQarTWjrqWNofJ9YLvjRYa2trUfl12jVxAzQ==
X-Gm-Gg: AYBFou2ldVppKGeMcQEo9GTxHoqN/gSH2p6sRfSLCUNv94QFmnfPTu66yvyEjbLCtSU
	dpKOXBlPe3du6ZsaQzPqfJZCwchShhm+1I/8Kh1VLlLxHbVml8Z48RqH3qU90qcr00flEHY92Af
	0ZKpSHY8h1lLYzrSSr4MAZp6W67cpq1eabEN1ZNBVfLmUabog5Zsp0ew/2rrPkUG6rjv27Naz3d
	AaaKMDPz0GDJ7SaVlVNor4WRl0kyTQ5h1FOa/uRD5h8fNU4q8N57unKzoIETSZrrIfJnhcrgllT
	hpAS/zkUCgvU3Dnzk9RRHfrFKDhw80zCwlSb0aZk+fiI+BDwIK+B8TYSK7pdoEWyu8lIUoX4KdA
	LcEAVBGBXoGA/b/gWmmAU8U8Nxc4c7X3OXPm3zKS1EW3VMO+uNh1a65uGb158/yDYVLeNtfENzI
	iAhx25oAn9AriKWk0yikTesTDeJQhzDkbooFdBO2zDCJeNcpkjo1T8GpWSL8HMSizLqR7D
X-Received: by 2002:a05:600c:4fce:b0:49d:24fa:8fc9 with SMTP id 5b1f17b1804b1-49d258cda59mr7298055e9.5.1788956454095;
        Wed, 09 Sep 2026 05:20:54 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588392b3esm49340906f8f.12.2026.09.09.05.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:20:53 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: david@ixit.cz,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net] nfc: llcp: fix -ENOMEM on connect with zero-length service name
Date: Wed,  9 Sep 2026 15:16:22 +0300
Message-ID: <20260909122029.34081-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When service_name_len is 0, kmemdup() returns ZERO_SIZE_PTR which
passes the NULL check, causing nfc_llcp_send_connect() to attempt
building a zero-length service name TLV and fail with -ENOMEM.

Fix by setting service_name to NULL directly when service_name_len is 0.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 net/nfc/llcp_sock.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 5558d8a4d48b..220cd38e253c 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -734,12 +734,16 @@ static int llcp_sock_connect(struct socket *sock, struct sockaddr_unsized *_addr
 	llcp_sock->service_name_len = min_t(unsigned int,
 					    addr->service_name_len,
 					    NFC_LLCP_MAX_SERVICE_NAME);
-	llcp_sock->service_name = kmemdup(addr->service_name,
-					  llcp_sock->service_name_len,
-					  GFP_KERNEL);
-	if (!llcp_sock->service_name) {
-		ret = -ENOMEM;
-		goto sock_llcp_release;
+	if (llcp_sock->service_name_len == 0) {
+		llcp_sock->service_name = NULL;
+	} else {
+		llcp_sock->service_name = kmemdup(addr->service_name,
+						  llcp_sock->service_name_len,
+						  GFP_KERNEL);
+		if (!llcp_sock->service_name) {
+			ret = -ENOMEM;
+			goto sock_llcp_release;
+		}
 	}
 
 	nfc_llcp_sock_link(&local->connecting_sockets, sk);
-- 
2.55.0

