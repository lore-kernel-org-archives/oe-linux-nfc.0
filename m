Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009E74E3221
	for <oe-linux-nfc@lists.linux.dev>; Thu, 17 Sep 2026 19:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789674159; cv=none; b=g56zaDwY+iO9VHd1+j+McTL5FQBr1QwrXnhHrTibJ8l7br1p7tke4OXS0bzJfkAiLuHjh/fpLg7HALUE75bvRJJmWg82M8/nSlFoajFQZZdDJaC964Ja1Gb2xftVOMdbh+u9Rj4t3MDu4Cl9NqAZRFFO0S45RvLA6ZbVDsJa6So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789674159; c=relaxed/simple;
	bh=uhUM/M81d4CXxPFscOxT5I7bnlNnmvtxKPyzZsjpw54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OYiQMaTB7vTc2lZArg8+JmQtA/LEOBYAEWeJBTNCI80msQBeZxuIeSPqD7+4K2Bu4ovA7dgx8uKGtsIeFiB8xxAU2q5pu46ThW76PCBIg1RgNbnj49Skb+5OW8ZWQdecb5gyU/bqpOxjLy+An/Dj8uPhBhWeKbDOInR9D5shKa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4WZlxcI; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4WZlxcI"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910a0cefaso108112485a.2
        for <oe-linux-nfc@lists.linux.dev>; Thu, 17 Sep 2026 12:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789674155; x=1790278955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkY2/FLZ13vCVvKQ7BjBhJgp4fsJ4DBBdsauFSxn6kY=;
        b=l4WZlxcI7KszQ8b4NeIu8ORJRITvmSU9slbNGiMvUeTrd1bOMO38kuzrEcKCLIRwof
         OfB8KcYpDlfz/LoOq0nsQzge2jw2ZT+gA9rCPU/cWWHS75L3yKCQpSKFQBohASvEUHSL
         9x1u3bzuSNMdnvyl1jnbwhTfQjCT2hgxanR59VV7bqX77Ho4/1oVAxmnd7YkI+iGy9hU
         Ic1PwidFQExAYpKfihObGonNTU32j3WKmmilWu/ww6rO54/Zx2WUY1U0sSv63yRwbrOc
         +lQxYLhOH8kjFkCsxRMsaKLHWJjPaZk9VdMIpkver8uDpt6ooRL+51ZLYpSOomE/LFO1
         NPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789674155; x=1790278955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkY2/FLZ13vCVvKQ7BjBhJgp4fsJ4DBBdsauFSxn6kY=;
        b=mG8GgNUVgQJt5fUhrRi+T35rNehsRemDAlvZ+0i7MsJQJM3QOo3mEPV/W4IrVp+UpI
         pACwrCx3qEgDWl7Hw6SNqqjQJeGhyrqCoBIl+54dYRJuSHKD1zQFnFxeNbMYCflNsXzv
         UhODwTJb3QtUIyqeU3MUM6lN12l8wvLW0iWtcA8R1qUZFZ3sljzVanlDlo+FLjxf63lE
         uUim41U8QuO5Ci5yWB5LLr6TCwNvpqY3P3xf887L231E15upECxzcWknja68uFqrxFXa
         uH+BqYa6ov8+e+zSA9i031BQHfPvixRAT0NEwa1ZfY7K5gzDEnmtt4Y4qpexFM/DYm/X
         wUzw==
X-Gm-Message-State: AFuF++l08jJm/3C4lWjgWq+AO/JZAjD+lpF/LMEvtzZjPHz/6KdNVLx6
	nv9va4BiylH2K316E0joFzb+LSHSFQ3weaRsiz/7LMFO9st30EXDr24=
X-Gm-Gg: AYBFou3JlQ40tKyhgScaL1zFRn+Nfm0IPt1AsV4Edda71iFilBy4SOnTtN7aOfVO9ML
	LxjK5W3mMHttmvLWyhIugg/ZjIc3+AHOspSzkaf4rCvxolMGlesqX6Bq63kXi1ULXTo+kqkoyW4
	+MahfQyjc5RWbneus9m+HvVrsW3bmA1EZq1B5Lpwe2oF509JrRscDa778NMY4xzqRkGJYZxuSN4
	9yUlmygIOvGrCJFB7CYalHOxsBoYgGyG9syLn9bedCm1z7s1jJeFTvryrMlRJZk5Z514rTuxuWP
	+IQwIYh8efgfeVD0gBbgKSH/9K/JcZG2bPuMV6SuNhbeQL+PfDwdJ/4UWSq14YpSIHKYWjr6p6B
	jPs4lPmhmyhGibPV6hpNDfnsOTLB17/glV9sBpx0zEbD6PPTmTidjZSu+hsc/Ripa667obPu0AI
	/wshPWBpMkObfAmR3FLFZQ0L3RCXrgFw1JSbAhC9MPmipuM6Un/Pj9Mb6y+rnsI4eTqRylDLJ6R
	PR3kUF8sthZXJyQVN4ZqEb04M8Oh2NFYAOofO0OLv2YCOyqd2sxJB18da9kolQWoDxL1oxGPhfH
	92Pjduy/JSJDhfXdabs9qZGq5r2PP7zWQhhe
X-Received: by 2002:a05:620a:438b:b0:93a:1b82:4962 with SMTP id af79cd13be357-93bb79b5b59mr1444714885a.47.1789674155573;
        Thu, 17 Sep 2026 12:42:35 -0700 (PDT)
Received: from localhost.localdomain ([104.39.169.225])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b780cfa78sm524335685a.2.2026.09.17.12.42.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 12:42:34 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] NFC: st21nfca: Release the I2C IRQ before freeing its resources
Date: Thu, 17 Sep 2026 15:42:33 -0400
Message-ID: <20260917194233.65921-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The threaded IRQ handler accesses pending_skb and passes received frames
through phy->hdev. During removal, st21nfca_hci_remove() frees the HCI
device and the LLC state, and pending_skb is also freed before devres
releases the IRQ. A pending or concurrent interrupt can therefore access
freed memory. The HCI probe failure path likewise frees pending_skb while
the IRQ is still registered.

Release the managed IRQ before removing the HCI device, waiting for the
threaded handler to finish. Also release it before freeing pending_skb
when HCI probing fails, while keeping earlier failures on the path that
has no registered IRQ to release.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 68957303f44a ("NFC: ST21NFCA: Add driver for STMicroelectronics ST21NFCA NFC Chip")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/nfc/st21nfca/i2c.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index a4c93ff7c5b0..894eb100ab5f 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -551,10 +551,12 @@ static int st21nfca_hci_i2c_probe(struct i2c_client *client)
 			       &phy->hdev,
 			       &phy->se_status);
 	if (r)
-		goto out_free;
+		goto out_free_irq;
 
 	return 0;
 
+out_free_irq:
+	devm_free_irq(&client->dev, client->irq, phy);
 out_free:
 	kfree_skb(phy->pending_skb);
 	return r;
@@ -564,6 +566,7 @@ static void st21nfca_hci_i2c_remove(struct i2c_client *client)
 {
 	struct st21nfca_i2c_phy *phy = i2c_get_clientdata(client);
 
+	devm_free_irq(&client->dev, client->irq, phy);
 	st21nfca_hci_remove(phy->hdev);
 
 	if (phy->powered)
-- 
2.47.1
