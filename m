Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB933BE14D
	for <oe-linux-nfc@lists.linux.dev>; Sat, 26 Sep 2026 14:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790434188; cv=none; b=Y7Uxlgd/Xmos2plIwNAxpOJZo8FhQDxaalelf/fhtgpBaVzzL2uBXLpRdUyu09Gg3V0gu514efOXOxRSIZ9kkhMFZB0gW5DOphAm49OwcKt8sTUdFj+H8CMFEjKkemz/8uLggig1XF6G53nv7Ay1/MsC5K2atMlnno2D/rVq5fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790434188; c=relaxed/simple;
	bh=O4ei2s9gZuecLamrTdJFFCxcBL+em9k63fiNXCLXqzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cz+m6ugnDNB1f5qTVKEo3rO5J33LJHnidmID8mpE+7v96daXQFZoRDKdocn3v2DwW/kbRbFrBss0376TiOPy7IfwGR3qEMNazxuK+0Vun98jHVsZ7CfWWFb7a6hMjmM7RSJsyUcRo9+VaodftIj5YMc/g1m2emckZNGUBY+dsNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hr3maqFN; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hr3maqFN"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so1113176a91.3
        for <oe-linux-nfc@lists.linux.dev>; Sat, 26 Sep 2026 07:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790434185; x=1791038985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxnEwlfneT94G2UrKcochh8UCTOdTS8Fzu8EtUevf3s=;
        b=Hr3maqFN7qSlJpgnOQgiwjhi7z5vkliE532kyVyVmCr7qinKtwgWqGoQW8CIu4Alqc
         +uDzdLwCLEKPOBFdORu9wVpwEOLRWnyBBW+AX06pmeA4Ki2nu1mXFOwJEi3RWvz1KGvh
         OiTfATLljqBrUt6hUkwxIUrLY7oY7wpLGNBEKBck1RmWVj4nyO5CTVyiqHUw4Crge0ix
         fF5mm9/eqJiPlweFo+a+D1A3qPYPRveHuBgwBR3ZM8F1+5kEYEVyazYCfyOcDdUDyHO4
         c8qMVNu+BRcLn4n45gVtw3GodWCJR73ZwfBjId2hFCMxMl000KyiM+nB/6uYKJlqfLOF
         UNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790434185; x=1791038985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxnEwlfneT94G2UrKcochh8UCTOdTS8Fzu8EtUevf3s=;
        b=W1ZTgj6y6HxttTXs9EZm7gtHyas2ccT5F7p9+mMtGYNIwx9G20m19MXiFFDqHGtBON
         6AZuzzq1x+/b1n8DRbQE1OBUjvHtO3AmBawuCn3H3mpewpeP4ybj4ea9Ts3WopY0Vsyz
         pi/NYKi3cxnFssVgVCPhtnd7L65092/SNfioPTBChW5ot0oPHjlzM/xhzmXykU/Tz2Si
         C1mkX21R5zJD+HJDuWN8qnG/xuIExb/3a2wD3s/kNymx3GCc4s+b7Mj0xw40wa4+RHY2
         65DUTlc8Tk3+hktWBBL3fqCIsQLyvgCA4PQQdwCVFqZBFWr5RgoaufRdvT9MoJAr7YDi
         lqDg==
X-Gm-Message-State: AFq9FYJaielkOnGMei2nY67tyg5KDNpr/awv3ltNqhYkWi8tY+nK6Nk7
	DRs5b7fXdiFh5rxdRON9eUU2rhaPjuBQb0kJaVlgqsAZVkNGH0kp1QIZ
X-Gm-Gg: AYBFou2jcYRFqvkqWoKfSjUo80KYTIMWDmjsn1TxPOM60rAAft1DYQPWeuKmdr6Zpzw
	TKMicgDHkZ1g94AQIzKu1hdEIcRGYFXKchSddFP6yvlWIi1xwfVBmE8dl3+5IWpIWWpOtzu0A49
	Hw8pESuKYvGC66rl1294jL6xGXjFVNreC7Ry1BMkmHAdy0uBUXj9lpMi7/5kTGrIq4EzbPU25OU
	L6j5PXRvUFd4hFGeS4mo7GRmUAgbJVc4NiG0fGxMCS3R4BSmi7sr37dk0cO4Frj9CoAq9KgbAP9
	ucM4pF+xWm1T+V8l4ByLhn/cSsOZUa6eugrHn2VfbqxmwXPQaQifM1tcvypHL59uCJe6OFrT75f
	Otx/Ijf51+U+gkLklkBJAQx1dw82wxsr5+7HsmhdN/O9F5X62whM3Kcq+vdWY7PB825R8CemSp8
	7QWgAeXzRdZsGq/NtGRlys4vPKvOVk1YTsLlAFuMFqSxNw4jzwG/D7UvSrnnLOBPvikaThsppld
	JykNR1DdIrC6jNf
X-Received: by 2002:a17:90b:3d92:b0:3a0:f0a1:b460 with SMTP id 98e67ed59e1d1-3a0f0a1b954mr748138a91.66.1790434185508;
        Sat, 26 Sep 2026 07:49:45 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:a00e:c90a:972a:c5a2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9589f7esm10105011a91.10.2026.09.26.07.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 07:49:45 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+89f5f8143d8e62af2b61@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] nfc: port100: cancel a stale out URB before sending a command
Date: Sat, 26 Sep 2026 21:49:40 +0700
Message-ID: <20260926144940.14412-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

port100_send_frame_async() reuses dev->out_urb for every command. It
assumes that once the device has ACKed and answered a command, the out
URB of that command has completed. A device can answer without ever
consuming the OUT transfer, leaving the URB queued. The next command
then resubmits an active URB and trips the "URB submitted while active"
warning in usb_submit_urb(), e.g. from port100_probe() when it sends
SET_COMMAND_TYPE right after GET_COMMAND_TYPE.

Kill the out URB before submitting it again, as port100_send_ack()
already does.

Reported-by: syzbot+89f5f8143d8e62af2b61@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=89f5f8143d8e62af2b61
Fixes: 0347a6ab300a ("NFC: port100: Commands mechanism implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/nfc/port100.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index b613f5e2fd57..5fad6444fe3a 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -780,6 +780,9 @@ static int port100_send_frame_async(struct port100 *dev,
 	print_hex_dump_debug("PORT100 TX: ", DUMP_PREFIX_NONE, 16, 1,
 			     out->data, out->len, false);
 
+	/* The device may answer without consuming the previous frame. */
+	usb_kill_urb(dev->out_urb);
+
 	rc = usb_submit_urb(dev->out_urb, GFP_KERNEL);
 	if (rc)
 		goto exit;
-- 
2.43.0

