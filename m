Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EC14746CC
	for <oe-linux-nfc@lists.linux.dev>; Wed, 30 Sep 2026 22:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790808602; cv=none; b=g/ioTEIiJQcuW2w/r3yq4AJQYmIi9OhMcv/VF4gqjhe9k2K51ekWS/GKj5SnkJPLnfVo/nET+c9Ep9hg3FAKzCj719JF/B/EFjdHVE8VutXpiicxfCO5Y+TB37DPMtSMQEBXWnANkLawIG6u5LwKmsWiphmED8vbb9wgbVnuQkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790808602; c=relaxed/simple;
	bh=j0LEvXObH71hDZRY5WG5+a5o+/RerOV7SsoqXWSbysk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S9tBP7LXMt8ogbH2qhKKoD7ZooopVbgxzSmJPWDODxCQqqVOEljah1jkHLvuOOGI47/NwInYgImHAaaAB/AD3xR+fbaBBADzw3yN5lq+pxh7dBcNIgak7pEWI4e3uerIUjOaluqnPncmiLKXFtprgeeqSokWY9CLkjGEQIpeNgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7o7kS1H; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7o7kS1H"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so750703f8f.0
        for <oe-linux-nfc@lists.linux.dev>; Wed, 30 Sep 2026 15:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790808597; x=1791413397; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEXFn4CcqNXZi8Xfb1/9aMVRytKizyJNcxUrexiVgfE=;
        b=h7o7kS1H76Zc/08eisJPhHBZzap7tyuYpnSRuHpvLnbO4kpleors58TH1ESM6Qw4D1
         z0JNypHa5QrUJ627+eM3yPc26i4nzeWsARZjbQ9PMlHWwWfibulqmsC5/lPVbHbVvOau
         4M/n4l0yYkrI4WLioQ0yNijdsoLhhvh36O7aJH1hXh44Pr09ip3DlZ6JIINjy5bY6+/x
         /0TLOuC19aSaZVN0ozS1eRyAlQViJ37ao6pnG8HhbnuvZBG2vJ20XwZphE2KKdWO+fpk
         umL2/+3kL0+0a8aVm+OvgJEDzTZvkMDV7p/CzYI7ErwaVfjJuzN+HESoddEQBnBEYD+t
         v5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790808597; x=1791413397;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CEXFn4CcqNXZi8Xfb1/9aMVRytKizyJNcxUrexiVgfE=;
        b=lwVTxVCsgbNOSp3FgWxdLttTaCBxyHki9rP7EOZbX5VE+qzBETvx0ACmxrcd0l+KU3
         Iwa4MOpabdAP/Tnd8l0msIPRiP6rNjuYhO2eAOpfqGlWRXlXpMAsI6erYvbVpgESFZHA
         wW+pZ3RSEjW+V/sVeDDGYfQItauwznwY0bfnMQJely8zSl9GEPEFon5A5jIkGPXgbLRn
         StTLzEZiqVLt4Bw1pG62TIqLUdJfP2DUQg2pGCfIF0F5l9l5kuSsByGP9wAXT3813/OZ
         ybdWe7B2SXXpvuJjaH0wyeeKWeqrqCB2pZqqDIRQgKrDG+nwmLqhfWnIxoNxRBGD88BD
         Sqkw==
X-Gm-Message-State: AFuF++kSveWp2QRdXwJl2cRD0P4J1A9jcm3QJT4dvbryX1ahMdTxqEMx
	ftCtk+q9osnIQ9d4aSQy4IUXmB6ZhVVwU4NtZTHFdn9MkIZsOB0xl+7l6Zsc4GXkt1o=
X-Gm-Gg: AYBFou1CRbCluSlBcKfciggac2n1pD6Iwa3z4+IDz5IzzvXKvaija/rmyWiJeZGrMDC
	miGMZNTQKC0ZW+qGxDNg+NK66H3oBswX/xOgrN9UU7/PSI2+iXaHxF3VUzrRwangUP9YUaYeZNr
	N/9ykpnxWt4iusJTKPAV1sCV8SPvA0ZVl/U3y6Y2lDJOdbLNw9osFmau4LhUjI4hlIqZCz1eKpP
	CfxPYHu+FVpYegNoUVaAXORztZ/CGOaxRiV+n7wviTOgOZS73MBk60hzpeFgUdMbsEjwucRhXfn
	43LHYa4vhmBA5mcDWDf6KQiMYUiZYFbLFj7iaX98DLQh//3xR/Hlp3hQQKN+IYNKZY36Vhee7X4
	6113k4XDPhbAU0gI04EPzxU0a+D9lovmjjRUKlN1fWu54yEwSnaWy6vc0hjDFhe1vhKRw2hdVSD
	FWVcWuEQOAuW29t8hqtpm2bNQzaA2SGwq9LOaL/0ER69+5R0GItaP6jQnH7HotiKX4sTyw
X-Received: by 2002:a05:600d:4448:10b0:49f:ce78:3564 with SMTP id 5b1f17b1804b1-4a01b11bedcmr35960895e9.21.1790808597033;
        Wed, 30 Sep 2026 15:49:57 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f99a332sm31602845e9.12.2026.09.30.15.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 15:49:56 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net] nfc: nci: fix out-of-bounds read in nci_core_reset_rsp_packet()
Date: Thu,  1 Oct 2026 01:47:06 +0300
Message-ID: <20260930224940.725976-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nci_core_reset_rsp_packet() guards with skb->len != 1 before reading
rsp->nci_ver (offset 1) and rsp->config_status (offset 2), but this
admits a 2-byte payload where config_status lies one byte past skb->len.

Fix by replacing the != 1 guard with an explicit >= 3 check before
accessing those fields. The 1-byte (NCI 1.x status-only) case is
handled first with an early return so nci_req_complete() is always
called regardless of payload length. nci_valid_size() in the caller
guarantees skb->len >= 1, so a zero-length payload never reaches this
handler.

Fixes: bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 net/nfc/nci/rsp.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index b0ab4f5ac..e52956bf3 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -32,16 +32,22 @@ static void nci_core_reset_rsp_packet(struct nci_dev *ndev,

 	pr_debug("status 0x%x\n", rsp->status);

-	/* Handle NCI 1.x ver */
-	if (skb->len != 1) {
-		if (rsp->status == NCI_STATUS_OK) {
-			ndev->nci_ver = rsp->nci_ver;
-			pr_debug("nci_ver 0x%x, config_status 0x%x\n",
-				 rsp->nci_ver, rsp->config_status);
-		}
-
+	/* NCI 2.x reset response carries nci_ver and config_status;
+	 * a 1-byte response is the NCI 1.x status-only form.
+	 * Require at least 3 bytes before reading those fields.
+	 */
+	if (skb->len == 1) {
 		nci_req_complete(ndev, rsp->status);
+		return;
 	}
+
+	if (skb->len >= 3 && rsp->status == NCI_STATUS_OK) {
+		ndev->nci_ver = rsp->nci_ver;
+		pr_debug("nci_ver 0x%x, config_status 0x%x\n",
+			 rsp->nci_ver, rsp->config_status);
+	}
+
+	nci_req_complete(ndev, rsp->status);
 }

 static u8 nci_core_init_rsp_packet_v1(struct nci_dev *ndev,
--
2.55.0

