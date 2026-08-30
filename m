Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8144C3BA23F
	for <oe-linux-nfc@lists.linux.dev>; Sun, 30 Aug 2026 18:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788113539; cv=none; b=QuYWKOfqxP7kNouOjv4RWOchEd8ncbQNX6+xPyEbAiOW2GUa5ezl1sm6axGVYZjY41l4ireGeIpMgiEIN/bEfGOAqfsbjxtH/xes1NdhkJqu3LjPna2i9/k3DxLsgW48sfic3QsxGmufUk/aClzwjgMFfBlogyRw46KfkuWb98I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788113539; c=relaxed/simple;
	bh=5k7W/rnOy/1h0oXD3pb7JlgUJgi+5ScccSZ1omyxYhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fb76SjQFSaf09aqF4DSQg9vCbjrtpBVxPWWu4+4tVvlplQzecRaT3WGkPGr20ymxvaZfEvO+VIX6PZ+orqeK7H1mX0mYW9g4+Gf5rWiHChKEuOxetNuq//EMh8YJXWaK05DKeXZpNLTD36jk53e0j7wMIuD06Td1d4qnWMPN6HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOaERK0v; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOaERK0v"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84830c774a0so2954348b3a.1
        for <oe-linux-nfc@lists.linux.dev>; Sun, 30 Aug 2026 11:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788113538; x=1788718338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s1wVtq/AxOLm16oJhbIvzXCIHYiUcLBOkeaHt9nYFpA=;
        b=eOaERK0vJYEURAUKwjhSOdqRcSG64eVBYCyjfGvUbrYFNs4se/UV7TFBeeY5EDU8H0
         +5ql1i/M55jAx/GITwO2R9LxWgggVz69Wgp9NHrUg50ENF0pUh+f6gnGdGtQXRRf/Css
         hUdxpBawrWf7SSvXb4q6pvy6tPTxg1Afg4gqZTYda1nc71pSMAQwuX34C7swLnqfxdU9
         7V5I5py8rdvMXrl7r7FZAtBRcoqqVpHpWzQtxeulaZnqcnlaBZNUn2/OhoJxMeErjOxb
         e3/JKz2YwacE6drjCD5LzmDT8/phCfI2Xh20+tMXbNQ6ho6wnW+1CwKmHY1qAHa2WNQb
         6vEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788113538; x=1788718338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s1wVtq/AxOLm16oJhbIvzXCIHYiUcLBOkeaHt9nYFpA=;
        b=SgNb6lZX2hRIEub0g3LLJ/e/MKcAfzdHJ6vzhtcSPqGXjPsHI8ATlNRmKN6zMXcUzp
         Qnn3rGls1gj5bARZpKdXPI6qHwKsm5x6d9lBCX68LppmOlWuapdRMsX5d1Tx6qJ3sutc
         VVBrD3hkgxMvxAUZ1o51SRDk4a+Fah+9NqzqKherPGX9CmUvCtcL99TJNhLKw+R/rSZ8
         P0sZo3/IQCjPamuRgRjMsJRZcn+RfIyKb57Y9iPujNvCQAHiSyiGa+fbB35FpfzS8/+B
         7904JihAW6Bs9lwQBf0i6qeQi17W9MH+vBJmeh3uO21AVN7kNcW18itRGcO5urdm2xaz
         Az4g==
X-Gm-Message-State: AFuF++lDWqmhLlsFkM6ooEVBMO1isQwsyt/0For67IcmJxf1FuEXOUHI
	zLq2/6pC3Yv/cBI0i8doOfEnXAMFGYfXI3XYSPjimnhJ1Mldyy/KmIRxjxuE+gIa
X-Gm-Gg: AR+sD10TKs1ZExIJEUV9Fjc1XwrILTpMTwZUQonlaOk28RPp/IyQWF007hBTtC1fXsF
	qsLobs9B2O+Sy8Yba+YrfDvS1AI/u03EG4qeb7DlB3K1ER+8j/giLkNqai92xCLAFzhuTct+0n0
	0lGvrXcRmtqvE67OnNsyH++9ER8a55wZz/ExsWEJiBLHj/DWMR++8x16nED7IJ1sWMi+V1OEW3f
	iS4hDA8jwY28y17OLmHMkAg6usbSELmRZgpT8GABZtQhcgybVGZexFb2G4IH0fSKjWzDHFXZtbH
	x1EekAIZf5zrHbHO2WEcda/nW1X1dABGSqevTSyYwTdOGre3NGxwoErHhcyjofZ+6xq25IGuJ2E
	wJ9THCe1taaXeK9+k8lkZM4e2Yb+zpAhVzAABKDI7T+pQmggzp6dybtKVGL0BDqfUgHjMybiWRx
	6PDC9m2+iUFN46UJ5M9ltEKjO+kA2UjDWT4LwUSqsILpI33DSgyU0tElaA0JAhN8rGGNo=
X-Received: by 2002:a05:6a00:9512:b0:857:727c:a1f2 with SMTP id d2e1a72fcca58-857727ca3damr18291726b3a.20.1788113537655;
        Sun, 30 Aug 2026 11:12:17 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:fcb:65b0:addd:e3f8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fa79c1dsm2697723b3a.16.2026.08.30.11.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:12:17 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: oe-linux-nfc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	david@ixit.cz,
	johan@kernel.org,
	pavankumaryalagada@gmail.com,
	xujialu@vimux.org,
	bartosz.golaszewski@oss.qualcomm.com,
	kuba@kernel.org,
	u.kleine-koenig@baylibre.com,
	skhan@linuxfoundation.org,
	syzkaller-bugs@googlegroups.com,
	bzhao@marvell.com,
	syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com
Subject: [PATCH] nfc: nfcmrvl: fix memory leak in nfcmrvl_usb_nci_send()
Date: Sun, 30 Aug 2026 23:41:36 +0530
Message-ID: <20260830181136.165395-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

nfcmrvl_usb_nci_send() gets an skb from the NCI core and sends it
over USB. If the URB allocation or submission fails, the skb is
left allocated and leaks.

Free the skb when URB allocation or submission fails.

Fixes: f26e30cc6b50 ("NFC: nfcmrvl: Initial commit for Marvell NFC driver")
Reported-by: syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b197a0fb4e741cc5030e
Tested-by: syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 drivers/nfc/nfcmrvl/usb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index c7f2afe00b93..7a4094797ba4 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -224,12 +224,16 @@ static int nfcmrvl_usb_nci_send(struct nfcmrvl_private *priv,
 	unsigned int pipe;
 	int err;
 
-	if (!drv_data->bulk_tx_ep)
+	if (!drv_data->bulk_tx_ep) {
+		kfree_skb(skb);
 		return -ENODEV;
+	}
 
 	urb = usb_alloc_urb(0, GFP_ATOMIC);
-	if (!urb)
+	if (!urb) {
+		kfree_skb(skb);
 		return -ENOMEM;
+	}
 
 	pipe = usb_sndbulkpipe(drv_data->udev,
 				drv_data->bulk_tx_ep->bEndpointAddress);
@@ -254,6 +258,7 @@ static int nfcmrvl_usb_nci_send(struct nfcmrvl_private *priv,
 				"urb %p submission failed (%d)\n", urb, -err);
 		kfree(urb->setup_packet);
 		usb_unanchor_urb(urb);
+		kfree_skb(skb);
 	} else {
 		usb_mark_last_busy(drv_data->udev);
 	}
-- 
2.43.0

