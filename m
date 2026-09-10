Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97684BB297
	for <oe-linux-nfc@lists.linux.dev>; Thu, 10 Sep 2026 16:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056755; cv=none; b=mvZqygrF60H+bhMu1rgGnb6bP4wwLsR7rnQSRpuiYuZ+iQMEGIahVOwQNyode4FZCXjCj1qPpctsYOtsLuegOi6noSNriTM9f+/3WLmrVw8HNq0ztr7mGPzfvPOvfNL8NSwGXwGq88NhWJGvxrleJEhX2hpeHLjfoumTuqot2Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056755; c=relaxed/simple;
	bh=GXalrwLzzTTBgALbvFODGq3SYZ8bvEu2vVVnxJtIZ8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YZWQIjKP3RgSScLtdSsEb5iU2/JZs5nimwEfsqmCWLik14IS63J6kSfjuArkC68Qg9QazRjHUYVgHhXMQ355j1TQPrxQz85mWym2yvpI2YZEmSxbTBlYLAjVDJu43d+CJRaTyPZPbQjb2u7CwFsQ+hooGfBJ9Lkfzb/rH5cY3uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0loIQ5D; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0loIQ5D"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so2542220a91.0
        for <oe-linux-nfc@lists.linux.dev>; Thu, 10 Sep 2026 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789056753; x=1789661553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JzOXKkjLjek2eBf4/YRRMWedpMo9OjK0tCopm3Wj9N4=;
        b=A0loIQ5DaSz03VJMjaM5XZ4JaKYUYP03bBMIiLf996YAxsWTJGLUkRDgsQxnNejIN4
         QrMCzOjrazJxEz78WccWErgUhIlWdNc1sK8YBCC6zwV915i2i2KFYUZGbvTMZz2whx95
         MaZpTyEsOQKmIhenTt4zhwZH7wSIQbennCXfBvsqnspktt/fi6yEbep9MU07DGWJcUwn
         fZgdyEyyTh9+CNNV/uaHt9gEIW+KcG3miRrGvo3+STiFY0FuT3H3ua5kvaVb51nbJi3M
         V+9m+jFdzYM7SeMlBAnFIdVJWU5Oh9g5owxIZxdrW26+ete69kptIxWBkE9j0Nxvc3IY
         xHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056753; x=1789661553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JzOXKkjLjek2eBf4/YRRMWedpMo9OjK0tCopm3Wj9N4=;
        b=WS4TrOoFCeeUo/DnXS0UORzC6O1RaWrNN8EA4rGwOx5svH5T2+9AeEYh74d54hzK1Y
         k9Pv527wYJDREq8x5uLBNR9Z6RbPvZVLYJnu//NwkV5B1aJHXthvAWjvKGwnEGl1KwfT
         o7IcZQxy22ztlvqss6jhBOLn2zETM05phdkKjuN8KzDf+J1FCTRH1njqNOgfXY94os4S
         QrDM8WzZRqyUUZTxzDLEO13Nq7vdtRzBKCjPQvUhx9Zn1nkc75ogx1E1OJhZWfnnymWR
         zbKlievPSTyIQp2EtvcRzsN0TXve+9GWnrafHKBtUBru9KNAZq3VDfFKf4IppSbclzZi
         oa+g==
X-Forwarded-Encrypted: i=1; AKwUvBzyxbtpiYlb7z5/j5KxRN2WlrXw1UWIxykdSIRq3m8ye68lY+1I7XTtpfuehMr/Gv/S2pJ+JflJqcrgUL8=@lists.linux.dev
X-Gm-Message-State: AFuF++m9Q2Ijvt94el+dRMvquzqQj94TaMDS310aLG6JSoA+QpSpSABy
	DIzv6aWFRRAk9/QNkMHznEPdrOJx7WiHPyRtrS0pj85A0Dq3k4nOb4cV
X-Gm-Gg: AYBFou1YMXSi8BOhbzoLYjnhT/1C+xQ2971Qqdmwf+O9XMtbvQn96p52wS2TfW2e5aY
	qo4eiHjOf6UZaFAHmjiJvpyYOPYK0Hm9dgMKDlbsQGmAFqGaE70tVG9p4rWb0POWuudTUVNolu+
	Mw6n7BfG2eInMgz6lPYbXsAHjavOHsN8mJeduCVyC7I/rgnl5tqpGUzpynLAHsOYjvgrfF21NJ7
	lrotvmICCDjORSKaAvoMnO28r/6izVj6JggGuBcS0YkPnr3opclH0ZVxsHlWWmduWmgAMM36h4Q
	XCf0dS5OYu/jz5cMvMmU2jX5ot+zyLes1m5M5tp539ATpELvoSme0IuDMkryPpKVZWFx7Gw7CWf
	MeivJe7rr2rq+0O3znKFkEPVkBzT8efi2J+qJUbqueKGgD4fAEIxZZnyffgeawfYXif3XHh7uOn
	K1cTpX7mQem31WfU5lM+JTsOa2ecwCmLvLWj4mRzKFNKh/Bji1f8cBfhSu5ywYofNPi1AJw4iNi
	MMWfXXJr/8iLqWErbk=
X-Received: by 2002:a17:90b:2e86:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39bac3b0c7emr21419132a91.17.1789056752638;
        Thu, 10 Sep 2026 09:12:32 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:ced9:ef96:e152:2608])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95994375sm281031a91.17.2026.09.10.09.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:12:32 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: linux-kernel@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+8996fbe184c5b84f89d4@syzkaller.appspotmail.com
Subject: [PATCH] nfc: pn533: fix unbounded wait in pn533_acr122_poweron_rdr()
Date: Thu, 10 Sep 2026 23:12:27 +0700
Message-ID: <20260910161227.27945-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pn533_acr122_poweron_rdr() submits phy->in_urb and then calls
wait_for_completion() with no timeout. This runs from pn533_usb_probe(),
which the USB core calls with the device's dev->mutex held (via
hub_event -> usb_new_device -> device_add -> really_probe). If the
device never answers that bulk-in read, the wait never returns: the
hub_event kworker hangs forever inside probe() while still holding
dev->mutex, and every other task that needs that same mutex (e.g.
usbdev_open()) hangs too.

Bound the wait with wait_for_completion_timeout(), matching the 5000ms
timeout already used by usb_bulk_msg() for the TX half of the same
exchange. On timeout, kill the urb and fail probe with -ETIMEDOUT
instead of hanging indefinitely.

Reported-by: syzbot+8996fbe184c5b84f89d4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8996fbe184c5b84f89d4
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/nfc/pn533/usb.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/pn533/usb.c b/drivers/nfc/pn533/usb.c
index efb07f944fce..ad4d84614241 100644
--- a/drivers/nfc/pn533/usb.c
+++ b/drivers/nfc/pn533/usb.c
@@ -416,10 +416,17 @@ static int pn533_acr122_poweron_rdr(struct pn533_usb_phy *phy)
 		return rc;
 	}
 
-	wait_for_completion(&arg.done);
+	/* device may never reply: don't hang probe(), bound the wait */
+	if (!wait_for_completion_timeout(&arg.done, msecs_to_jiffies(5000))) {
+		usb_kill_urb(phy->in_urb); /* waits for the handler, so &arg can't outlive us */
+		nfc_err(&phy->udev->dev, "Reader poweron response timeout\n");
+		rc = -ETIMEDOUT;
+	} else {
+		rc = arg.rc;
+	}
 	phy->in_urb->context = cntx; /* restore context */
 
-	return arg.rc;
+	return rc;
 }
 
 static void pn533_out_complete(struct urb *urb)
-- 
2.43.0

