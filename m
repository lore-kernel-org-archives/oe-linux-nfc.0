Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C1343CE56
	for <oe-linux-nfc@lists.linux.dev>; Thu, 24 Sep 2026 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243434; cv=none; b=eZFpYNBHc6DNBhCvuF7WgMdfqHxpTx9uBjUAHYPl7QQaXHTe9x9LZ6ydQIMshqXHVoD8c3yVjkMZSE8xpZ1bNN3HV/OTSnb3Bid6mk8UN5KFRaL6ou4aSuBiTNiyk96GEF7GFDQWeIeE4vXuUaIVTqnoQ54NlAY+OORFr9+meGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243434; c=relaxed/simple;
	bh=5k7W/rnOy/1h0oXD3pb7JlgUJgi+5ScccSZ1omyxYhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IhHOrlnsLQ0sJ1Yd7FTf5RO6PLlrzRV2wQzh6OvtV3nDiCGstn8vbsHcGKNGhe99Hfk0uSbFrR5P/YLS6PaIgwHEK1cRqo8h3FAjt1CM0800HvPousejWBXr8tuSvjHrRd0F2FPu0COVey61AjjItZZJQix8j9HI0dFOamGkuFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nge8yGs/; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nge8yGs/"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso1163827a91.0
        for <oe-linux-nfc@lists.linux.dev>; Thu, 24 Sep 2026 02:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790243426; x=1790848226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s1wVtq/AxOLm16oJhbIvzXCIHYiUcLBOkeaHt9nYFpA=;
        b=Nge8yGs/RwHrYbR2MPUkM8eMX+yKFHryz0UMSOdUZLUM/psXI2b+V2GlCHJ1IPHnCt
         gEugFa97GBDrHEU2AGwwr8DA5abgfkt8zBwArJ6wPwNO39Pb8+g37B0bfifClAJAn4lf
         r2GqSyETo2RdqTbkjYFr/eSFFIyjpZ+8li/fLCZQOK27jpeT+S/jMI3kBUMBxOYTCRa2
         YdXZwzUIyV6TkM+GwKq/9iQuxzKyBhGi00iy2gJPhxMqt4qJ8LyEidGY8t31RRxk3QqL
         6DSC91lc6yhUw0oU41Lp2C2Igk2IWuMZNsKV4wE5MUtt3+RvBSnPtMRPZzFDYgH1rrYV
         OaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243426; x=1790848226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s1wVtq/AxOLm16oJhbIvzXCIHYiUcLBOkeaHt9nYFpA=;
        b=YTGURljq/NGnkY8jCy1li3WaO1C0f+ASfe/4/dhStoZJbIoYR70+RA5rnGlRYwadcs
         gn6SG2A/OrZIqAshT84X6FCnMuHDkMpmbLvzz47N+045V+UeXtj4wZ8+VawvpWcJWxzk
         aH9cYD227ljageC0xG+YkroVwf8dVoRbY2R2ImJAUMzYkdhpgN7FjeJRMSeRO5evgP2n
         cC513GQDxF3Ft6ShSWrXyeocWvs4r4U6cj73eGve+feWMqKZWncU0HePgectxP42zaP0
         DuHfvX4ghXu9LbZ69pq7lpDyZYyr31cSWB413Z9ixZabwfBLBdPxlg6vCTgWEHwW4r+5
         H2VA==
X-Forwarded-Encrypted: i=1; AKwUvBzPy6b7mnYnXK0pkNYjk7K+l3KyWsJRk9xi4DGJd2VIWos+XfgB1GrR02ADKT6dc0oIU44oaMSJUltuot8=@lists.linux.dev
X-Gm-Message-State: AFuF++lWSCxja3YQoUdZ3YznIUTXbf4x0KIRmRvr8s2on+vDzuw4PSec
	oYwSZq5wSkq1BsXAgPf4FB29gt0+e/Z8+/5nt7QG6uvxFp+8H9xstLu3
X-Gm-Gg: AYBFou2Sd/51AGCf9eKjSSMOlso+dBDlJHkIeTvy1E/MdD/nxJh4JGdLL4U6PqvXwQg
	x9gvIrXxEZAawrqzKiR7tM0ndLJDhbPh5v2vJNrPadNYg8Ek20ssO61h0JEu81Hg8HLBudJLV4a
	fHGv972MVAd26l8jSOmPV/iq5R6K0A0t+tU0AGQvFViuIx1fnfHvW/UJ4QcQRZjNDHxJ6ovKm5g
	4G8WNEYmaoclRORl9N0ug55OdtZwZ4bX972+tKKMnYrDpJuhWWZP2S2Jl7ZZKeCgpfBL/CAl66M
	xmJB0LoGp9RAob2S/L1E2T12mOVAELZOQY6TXeUCWWr814JeQaMO0QCT01mODQDkeLZDmd3aV3X
	hOI5iw1RMd26Iod5C6ZfGlt6BfW+sxqDphDx1oquZ/McuKe9SdOMlfgFaIQZt/yfOCAsoe6jWr7
	9hD4i6RWCuLCVDdMR9yrr3uHFKrwheZwHmUgtQsqDWZuwXkgytN/LHV1/3YmNd86tjOzzl8XGJT
	si+DTI=
X-Received: by 2002:a17:90b:4e8c:b0:3a0:7d5b:8d56 with SMTP id 98e67ed59e1d1-3a0986075e7mr1540851a91.28.1790243425925;
        Thu, 24 Sep 2026 02:50:25 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:10be:b866:ebcb:a009])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm3916906a91.13.2026.09.24.02.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:50:24 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: david@ixit.cz
Cc: u.kleine-koenig@baylibre.com,
	linusw@kernel.org,
	kuba@kernel.org,
	pavankumaryalagada@gmail.com,
	xujialu@vimux.org,
	johan@kernel.org,
	sameo@linux.intel.com,
	bzhao@marvell.com,
	akarwar@marvell.com,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com
Subject: [PATCH RESEND] nfc: nfcmrvl: fix memory leak in nfcmrvl_usb_nci_send()
Date: Thu, 24 Sep 2026 15:20:07 +0530
Message-ID: <20260924095008.8227-1-pavankumaryalagada@gmail.com>
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

