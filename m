Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD25352B1DD
	for <oe-linux-nfc@lists.linux.dev>; Wed,  9 Sep 2026 12:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956096; cv=none; b=nl9qKN5tPniH39esUK+U6Um6Fe10ZfhuTtuPqFm7GwNKBeQHq4Dh/aPs4b8yV9aEQO8ujqkt1bJOBYvEbVp7XQCWi+/bv1vVZ54dj2YXRsdg0lInXje3+cF6uVmFAjJgWlAum0WM//ewB0ZGmenmkNwRk/HC3yHomgXp7mEm2kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956096; c=relaxed/simple;
	bh=hzCE37uZI149uf8HBl8Q/B2wOI687g6UE4boyN1ASoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t7tg86Vc7YfJ0sr1N81L/jpK1J9uJnTb7K116P43AowWSRYHLuypA9t3O2gZjJUIWIFWzJZDrXQk6z2jUZugkLgGTfepWneJr/RiucKejk5rK0GJCQ6/OPzLpbYi6vV2w7aLB7okciVd9pu0gfpEO4Y2UzI/7oNAMhGMlEmESvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUTWCJu6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUTWCJu6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so45314795e9.2
        for <oe-linux-nfc@lists.linux.dev>; Wed, 09 Sep 2026 05:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788956093; x=1789560893; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsuivYkcY/5Dx3d9+yUm5h+u4pSa4bcPrVtBnEBIRQY=;
        b=rUTWCJu6nVIcY8I7oS0dJkOqtHKhZqtfIW0+/X+wX2RfQ4rnUYZ5um83wqapgCYUGQ
         CAX00/j2P/IBARoETuU7FP2ZRx3P7qJ7SY3nKcxIi5qUSNbY+MOReIcaWsFv3x/lZqA7
         Roa+tfGHoeYG902BCxqJmVdh2lrwVJaPaeMNXm/UyaXfZM+gdZg630Fg8W25acL5uiuT
         BDmPLOQbTUc/gScPKxr5tx5K/f5FaUFQ95VXP8O/4Nf2Rk3k8bLOvMIr0O6MqKpNjmWB
         jhYxTvCRTsfzhsjaIAU4BDrncr3XrNn2kxtJoIsPnKUOWtgK/CfkENSj2Iokj1Vn3Q/L
         Ft1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956093; x=1789560893;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qsuivYkcY/5Dx3d9+yUm5h+u4pSa4bcPrVtBnEBIRQY=;
        b=ZUgbwAFBXl5bpsg4Kq0MgQU+dGtq2eL9yr1VxtJsUptKHpRbcy5v7vXCo+G6eDgdAZ
         QXl73kU6s1qCvaqmouT/nJb4NFnDPl7JWhw0X5M+fyKyN1AxpDabUkr+92NI0a6JdAjj
         XJFlhucdiBEw2ssGFdOhWbpdcuG4pIWPTrP9zZ4QToXKOhtvvGLqKaOT9Qx72xSv1YDv
         62kRW052XdzDwstXwYZYPhYpEyzai7nnAkM/+rlY8sWarS1rCF5N3Zfi46qd4n6UETBN
         qhSTqyNWntGR2L309Fn2Ts4vcg3mwHUY5DbuNSBiuwFfz994bgTIUapEy5QWSM2oKlMM
         jXVQ==
X-Gm-Message-State: AFuF++l7hlT38Eh4vC3dcO1Et0HnCY/Nc/iYge6a32bZbOqhrrZEHdbC
	JOWYw+AiEcaMVl0iTvRSIGK3rbJAhYMqzM7rMvooKRUC+0OCLiNGRJ+vFuJwQ4zsGDEP8g==
X-Gm-Gg: AYBFou3zVDMtlrVfwftJXsUZprCAaHMVWy5CE8ASrH4NBvh8fpTjF5ekMbslVHUjtbs
	7iNArRhsjS9sVhZoKvhpFCReH7eX2QYq98noROuMQ5soWmMF2/X/N2rlrUa7k3MRb65TxUaKVGp
	NQO4TdVJhgCmsDpq7Lzff5gLf4yQL9Rq288vYtgluUyrVp2oxakrn90RP4qXdF5fdcGXhdQDl9N
	t1DoB6QRI721c5WyjkcwSOBpkwnu6eQoXTKLBaRk1HFdBiBzkssjk8snObvvAkbj9QnJVy+3elO
	1Lr4E/qMaY5YOi/zAz89IX4uzj1QyD/xBCSfDl1UKIeJFpG29O178jF/6oyDcjQi+m5X1C3K65z
	FEZQPpb7j6z2PENhKHrphvBVSkb9pj4/SbSmn2wJGW/Igu8goberxjBR6PBHgv+BqPKoxRdQ3hL
	AnR0glzNRYviDZg4SI8EAGzA9XKmRhuQJi0iGFBXVyBJgsX9QetazGHprP+WWS74Z5/eEjMgYmP
	HrfqGk=
X-Received: by 2002:a05:600c:4585:b0:49c:fc6c:be16 with SMTP id 5b1f17b1804b1-49cfea09f08mr302913425e9.28.1788956092594;
        Wed, 09 Sep 2026 05:14:52 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf772692dsm547547485e9.10.2026.09.09.05.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:14:51 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: david@ixit.cz,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net] nfc: llcp: fix WKS SAP hijacking via prefix match in nfc_llcp_wks_sap()
Date: Wed,  9 Sep 2026 15:14:31 +0300
Message-ID: <20260909121437.33744-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nfc_llcp_wks_sap() compares only service_name_len bytes, so a short
service_name like "u" matches longer WKS strings like "urn:nfc:sn:snep".
Fix by requiring exact length match before strncmp().

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 net/nfc/llcp_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index fda236e4d9fd..5025d8bdfc36 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -352,7 +352,8 @@ static int nfc_llcp_wks_sap(const char *service_name, size_t service_name_len)
 		if (wks[sap] == NULL)
 			continue;
 
-		if (strncmp(wks[sap], service_name, service_name_len) == 0)
+		if (strlen(wks[sap]) == service_name_len &&
+		    !strncmp(wks[sap], service_name, service_name_len))
 			return sap;
 	}
 
-- 
2.55.0

