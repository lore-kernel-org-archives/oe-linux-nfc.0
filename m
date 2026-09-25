Received: from mail-dy2-f14.google.com (mail-dy2-f14.google.com [74.125.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4BF217F27
	for <oe-linux-nfc@lists.linux.dev>; Fri, 25 Sep 2026 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359103; cv=none; b=WnzzVx7v60iYqcri83syyv5pS9pF8b9mgyyeVGdnYevBzxmXD75NgkdPIifNE+EyaMFaB2FeEJHPUg9H+6Jbqh9Hox2FB1GfFwFUikab86/IC+7U6D2zMNjhSDm1bqiZD/1S6wIg1dsy1zuQRDjO1/5KPfwP6h9CB/4HXujy94U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359103; c=relaxed/simple;
	bh=iOZHQT4IOAIyVGF4UgMZZiMxiLFANObxfB3HkuQmwoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uPBlNzk0rugNW61UmtSOH8/HTewm1WWeXYZUd4vYBEO2RVcmnrX8BVdNc2rgW1VrEgiM492bDcPhsgCUl7JHIXFWHFUkF/nES9710Hyq8UUaf5sPaH1N/FzrldJ1VBDrk+76UCoFK8Jpr7L6Olm+ktM4CAsIe134pO7oh1Q/Xw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESlm/8De; arc=none smtp.client-ip=74.125.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESlm/8De"
Received: by mail-dy2-f14.google.com with SMTP id 5a478bee46e88-328664b7528so1042860eec.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 25 Sep 2026 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790359100; x=1790963900; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJ/NQTl1WNpwK1sUwU0K8HlG1PwVQbHpKjHbUF6bYOc=;
        b=ESlm/8DeCdGhBR01zbq55NCI+rbtL4354fUHOkbCu3go0kmGU08GstC4GNyWi84WUW
         0XMIMueSmZGMAc7Zg4HXxDfkMA0TiMRwtc6e9ENW5wyKguuT1dW5cMKTtdM1FfvcgTRs
         hOroiNO7P3YvAvkCHFWuOVlFw2/9Kr4LoHfW9bH4yqNtHqdtNkl+pVjrIQIbXVx4T4QQ
         1egRuerkwz2bQiqhxlnU9FJScIPM7Y7WorN5YBTK5sadxOfMfit7MieQcjxQHUFcW1Ei
         r+MXtpUcOdJ8QgotAc3+r05kvBzWkeKpuffuxyZOwuU0RLNlVAR/xUC02DVVzpSKThLl
         UofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359100; x=1790963900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJ/NQTl1WNpwK1sUwU0K8HlG1PwVQbHpKjHbUF6bYOc=;
        b=NwZ6Y1iv/6A7skFqGjB1TpKoe7sKw2xlNeeL4FhQxOu8gi62H4nb+g3FA1mpiuo/wa
         Mv3TRQYo34vKIdu63Lp3PYgcBYYvK3ATjYlpZRSmSJ/WCPVmGo65rq6fqwtDGYIIwbbQ
         9UbSP3NbHyxce/PDBNlh45cRvLeZ+I4CmWLAnHbb9yYq0PVfA0Afh5bG2eGpa7Ok64nP
         Que2Yf5Qp6n440GG5iNC4kFd2RQ9zjOLE7WIwnTnZLo4JRzYPoAKomb/Dxoq5aA4F3nR
         14EbHvJxbWtcejgaT+x9kV5lBEKApPM0RnQZXtdD1HSZdGM21vHsBi8uk3RMBTqn3jb3
         o9Qw==
X-Gm-Message-State: AFuF++mWlyD+zE1Hw4qrFQBgHUTM6y0hs3zZxhJaG2fKhrQ1ipsE+oJ0
	l8oAR/Lfzd7ruWrOMI2p2yyiGVhnljUm4qdacgGvVZOX3KU02QXmnWXbqjGRH8cX
X-Gm-Gg: AYBFou2SXX4EB9bCgSghQUKM/8KZTX/XgZJHFgyTH03e+34hf1N5q8H0FeEXUGyThoy
	L/nLzI5p9TljewZ80nyPRqQAkg3uVItVXQtfBbmjbUneW130nk4gMyREO5YKoCW2bgLEupjpIH9
	TIiyGoIq0agmdnqii+GYLyTbKAUhAoXH5aTN52HaTEW7Z1147P3YWvLo/WNP0qnEw4tmPUrKPdJ
	KZxCZLxSdNBrWrp3oQTQNTz3NUwRZiInCwrk2LwcauunR+UpkEdPrUWxJu+148hRNilLYsmqei1
	tGA1FWJ1xrpNDm5JsozUkolwHFm3buKSElozar4086yUc3LQaxkudhyJE34dcB0uxFEbblSjgeX
	/+zXe0CDaVHGtdOwpqianyRAZHIheH4tZqIufXGGyQOXZqIfw0YE+RgcGTyP/N5qPdm4HMKKkwq
	dDnRxKgQ/d7oHAhgZmTWlIJ7d58CulGcpVhaZtNJtLk0P0vBgeroZ+P6uSAeiNoRlRAqO44Vilu
	w==
X-Received: by 2002:a05:7022:2525:b0:144:f096:4dda with SMTP id a92af1059eb24-146d096d302mr1238633c88.43.1790359098946;
        Fri, 25 Sep 2026 10:58:18 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145727589sm7005744eec.23.2026.09.25.10.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:58:18 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: david@ixit.cz
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH] nfc: nxp-nci: fix IRQ use-after-free in i2c remove
Date: Fri, 25 Sep 2026 14:58:00 -0300
Message-ID: <20260925175800.3694044-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nxp_nci_i2c_remove() calls nxp_nci_remove() before free_irq().
nxp_nci_remove() unregisters the NCI device and frees ndev via
nci_free_device().  The IRQ handler nxp_nci_i2c_irq_thread_fn()
dereferences phy->ndev and calls nci_get_drvdata() on it; if the
interrupt fires between the nxp_nci_remove() and free_irq() calls the
handler operates on freed memory.

Swap the order: disable the interrupt first with free_irq(), then tear
down the device.

Fixes: 6be88670fc59 ("NFC: nxp-nci_i2c: Add I2C support to NXP NCI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/nfc/nxp-nci/i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
index XXXXXXX..YYYYYYY 100644
--- a/drivers/nfc/nxp-nci/i2c.c
+++ b/drivers/nfc/nxp-nci/i2c.c
@@ -346,8 +346,8 @@ static void nxp_nci_i2c_remove(struct i2c_client *client)
 {
 	struct nxp_nci_i2c_phy *phy = i2c_get_clientdata(client);

-	nxp_nci_remove(phy->ndev);
 	free_irq(client->irq, phy);
+	nxp_nci_remove(phy->ndev);
 }

 static const struct i2c_device_id nxp_nci_i2c_id_table[] = {
