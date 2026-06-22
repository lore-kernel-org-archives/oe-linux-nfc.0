Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4593438AD
	for <oe-linux-nfc@lists.linux.dev>; Mon, 22 Jun 2026 06:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782109933; cv=none; b=Q0W8+x3U2I8bHRthC320Pc0wxiKHQYD5CuKhoimpT3LbgTiF9EtjRYsV4OK0qErA0x4N6vF/VAGD4m9oQMIEN5rz/wpvvjc9qa/OmyhxFvLS5TDHNdlGzFD+G5GRDLMrMJoprIAl2iqnBrOYsjnn5M2OkUDZQoX4+hUZX1iuBh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782109933; c=relaxed/simple;
	bh=sO2VCjgYLWsbatZblwFdOv5SQCJmlXlUk9frEctl7uY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qtFaysZtR4bIrKJkzuyrhqSn6/lTJs3ftiK53g+nYtI7C3S/gcqUolWY9UOlUiEWYbwXWDTBRuppvX1tF/Lfpz0r3VAECB2t7NTbjJtSR/jINI/ZKE9uJe9EJWajMaH37wHRiDsK6HawsrhtPHq9A3on/K1NBLSebm2G8KhUmQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uj3HaCDm; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uj3HaCDm"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c8894387780so1672847a12.2
        for <oe-linux-nfc@lists.linux.dev>; Sun, 21 Jun 2026 23:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782109931; x=1782714731; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HGVBPdCK3AGzwKRru1pGLY4f4womJDI/YrwxL+ueu4M=;
        b=Uj3HaCDmibbV3cd1wy08a+usVSgJdiFBZ/263kcrsthDzPfxfN21pB7hI0+TpznNzO
         LHTmccd4Cwkb3L8MRzXAb58QYS71W+cxCRPblwnUiDsIfVTxiCekIgDykoR4DAa+hWfJ
         l8HOkLv+FEnA7a9AqVpEsfC3p4keq2HL8JG2sE+sur5vH4kaLNhkgtycgs5lbm1bXP5j
         v4elrXhKgSWC+5u+C9hu6U09pAKwdi1VslZXBSYRiBvbFQt9+vrvjO4w97nNLMiFYTlx
         HL4A3gBtHFebWSHWMwlEoj+/Rt77kZ+9KbjWML4gOsj6/buFCsbB+dgGr7Mls1KQaQlD
         pAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782109931; x=1782714731;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGVBPdCK3AGzwKRru1pGLY4f4womJDI/YrwxL+ueu4M=;
        b=cwhq6DmRzXY9dThovanQc9GZCJtKXfsdT1IAnt30oMZBwxAO1M6AvpzE+jgf0XLQfx
         0V9XiSLyO0M2NFY2wGRPsK9/7qRVMhm+UL20aWSfhj7oMhMj6tNUUa95ZJhAu6f2BEm5
         0tnGzRoYY4Kd6Eb0JFnbl8jRqr6BMFHJzU9vAoJ0gO00t8SFUxWnPNuTOFlY65QG54fC
         /cKpIMTZ62nsNnI7Pvelf4JF/4NImR0mWhRqnxZ1kv+7dcLSnlVByZ25DWeq2EFX79qk
         hzHpzAEhYFJJpO2t0PFr6ynEgJCdzncjTgVJ4RfsPMShuwCXMZdLPaualEt02Qs3k305
         Catg==
X-Forwarded-Encrypted: i=1; AFNElJ/MfDEYeqjQ6Km5Q8kj2psBAl3y504juLbm8MHtpvMw1pr87G7A2mC4jjg+vDz+RyWw21qNqdeLhhUqyiY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzE5M6cKVOnJR8MjqmyMITiezyzXgdkMt27sfKy3fXFesa3fof/
	yv6zS6/PiibxCqr8DMnU9vP3dRU4skZbZtg1eLTHehOtY9rLkWtfUkMs
X-Gm-Gg: AfdE7cld5wVpwchKSnsbSrlo6u3d3uO3Rc6QPRPGnH+5f+MUqgHp6nVTgSTYDeNCg3A
	PKwfD7gfyJ6sE7z8/4U3XXG7rb98fEnqVO5FjJ27CtgaIhCzt85V1Eq7RUFVeM2KzJ0yBf00SNe
	KdfWdvPePru82HPsQfQNuVWjOw4RHDxFX0mJy0A5CPMJyo0w/6EkRIJKlWZtU6b9eM57dCEQvZF
	QqS+SaKq9twpuyC0dHiAVwR8va7L23pmEo5D1Dpa32eP4RynMdYfqGFEL3rBY0gE1rOi4INIq/v
	n75Ax9/zRPGVx+mw4qb0NMcqmYCfy3oTPs5HoDZSkCMDRL/tV49go9m/XVKc+apQMIzEN+Rc3Yd
	jFbfNC877JXZxhMD2nIIMwwa3naFw1NeNly7qSA5QLq769FatDu2K+FRj9yAoXpT6guXndb7UJb
	CM816N0s/bLk2X3tWm0dCBMqh4M/ae7/ZIAB+ETQ==
X-Received: by 2002:a05:6a20:1443:b0:3a8:7fb:ca0e with SMTP id adf61e73a8af0-3bb33953900mr15603997637.23.1782109930425;
        Sun, 21 Jun 2026 23:32:10 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bbffc2329sm6230436a12.0.2026.06.21.23.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:32:09 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Sven Van Asbroeck <thesven73@gmail.com>, oe-linux-nfc@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject:
 [PATCH] nfc: port100: cancel cmd_complete_work before freeing on disconnect
Date: Mon, 22 Jun 2026 14:32:05 +0800
Message-ID: <178210992563.2193984.1212513889352740911@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

port100_disconnect() kills the URBs and frees dev->cmd. dev itself is devm
allocated and released once disconnect() returns. It never cancels
dev->cmd_complete_work.

A response or ack URB completion schedules cmd_complete_work from
port100_recv_response() or port100_recv_ack(). usb_kill_urb() waits for a
completion handler that is still running. A work item it already queued is
not cancelled. After disconnect() frees dev->cmd and returns, the worker
runs port100_send_async_complete(). Its first accesses are

	struct port100_cmd *cmd = dev->cmd;
	int status = cmd->status;

so it reads the freed command. That is a use after free.

Cancel the work synchronously after killing the URBs. Nothing can
re-schedule it then. Do this before freeing dev->cmd.

This was reproduced under KASAN on 7.1-rc7. With the current code the work
runs after dev->cmd is freed. KASAN reports a slab use after free read of
cmd->status from the workqueue. With cancel_work_sync() the work is
cancelled and the report is gone.

  BUG: KASAN: slab-use-after-free in the cmd_complete_work worker
  Read of size 4 (cmd->status) by task kworker
  Freed by the kfree(dev->cmd) in port100_disconnect()

thunderbolt XDomain fixed the same race recently. A delayed work ran
after disconnect had freed its state. port100 has the same shape and is
still unfixed.

Sven Van Asbroeck proposed this fix in a 2019 RFC [1]. It was never merged
and the disconnect path is still unaddressed. The earlier fix, commit
f80cfe2f2658 ("NFC: port100: fix use-after-free in port100_send_complete"),
only added usb_kill_urb() to the probe error path.

Link: https://lore.kernel.org/all/20190205160118.27491-1-TheSven73@googlemail.com/ [1]
Fixes: 0347a6ab300a ("NFC: port100: Commands mechanism implementation")
Suggested-by: Sven Van Asbroeck <thesven73@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/nfc/port100.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index 5ae61d7ebcfe..2483864806de 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -1618,6 +1618,8 @@ static void port100_disconnect(struct usb_interface *interface)
 	usb_kill_urb(dev->in_urb);
 	usb_kill_urb(dev->out_urb);
 
+	cancel_work_sync(&dev->cmd_complete_work);
+
 	usb_free_urb(dev->in_urb);
 	usb_free_urb(dev->out_urb);
 
-- 
2.34.1

