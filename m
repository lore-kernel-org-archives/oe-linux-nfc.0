Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421715;
	b=qRWQxHFeEr2h2xQgiPankj90SiQLxzhI9vPl1jx3bE65JN3VKvn0ub5PWYAs9jYWTPXk
	 xzVeoEBrgjejfA7qb2pELmwTnIHkZroSGgyFOtR8XDLn0z2rz04NZJz/cineQbN3rqGso
	 sfXrCzotyT6mxrrFPJNdKNMJFdGr/mkn9AbKkFHcn+KGQGVFpxUHPDvKnF9ndNf/1MB1I
	 oouBeWGfSx4OUtERVNg2/1l6VwkNulrCcggs5BbCyngXAzewo4A8KF9ksc2r9CkuHnCWH
	 7EnqAvnHqEKbOUxTkHTjo0WHHJ6XgxactA9vkiJ1dzlH2mq+f99iUGF7Ks2FjTjdBRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421715;
	h=Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=MmAvYMzYsSLV9YGDTAToTSx5qORIoNpIq25+Tdy+3Zw=;
	b=araFo9pOKx2VjQWDvchIP5UfG/QVt9PTtJBC4iKMnZS4HfqXEHZz8QxQtuX/IqDMZE3H
	 I+WhRsIewY6P1buKFuhRCQllajL4AIHC9qwSgAWFUxn3JzqIJFlHjt9qzXoCneyLj1HwC
	 Tx12HlrbXlmrpwlpLHjfF8VoEhSX5C+5i4kibjhGvJyo9yKCxQQmQOLM/s22B1w+sn657
	 TVOqrtFCgKdAkWQNgJUCLVe5fPeJsX8L6tB45FdGSz0TEfTEGVF7swpDhek26ZPrRNvL6
	 BkpcQzTnGQK0IXqRJSawQEQ5IG5svTTgkZX9nNKYgjj2DYuO9BivpQIJ4rDtrA/aN/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rj6v+SRc;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B06A606EFF6
	for <oe-linux-nfc.lists.linux.dev@localhost.mlmmj>; Mon, 19 Oct 2026 14:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rj6v+SRc
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56914533D6
	for <oe-linux-nfc@lists.linux.dev>; Mon, 19 Oct 2026 14:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421715; cv=none; b=HfMcicYV0P4qhRFYavJkoqxY3giYcYpgKlp5NzgAqZBx9WNyXIDN5VREg7f0huiq9kmya3oBn9mx+VMp6H/va/k1zEt4EfQs9aGpPrMuUb9ijHQRuQej2nKX2Xk1Lm5zbJ+U261qeG1rk/EvZLiOGiSDhGCpBe1vilWF8L3T5Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421715; c=relaxed/simple;
	bh=RLy20rUqp920ststPilGHR8safvwyNqGX8plEY72uGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VI/37icdrzsexzmDP0ylp3NlemOjW3XCPwCMWUZcjaBqBknFuoAhQF5SFpfoTCFnvuYGEKrWk0USRmMgNGRgDyuhzm4Q593otXRROVxL3YFvI8+a/GAcO0aNn9mUH75nbmaaPC5c0yeZd8ujIYBnA8fxRxehbL+rxKEUa2TiMok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rj6v+SRc; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-354ba08cfd1so3998025eec.1
        for <oe-linux-nfc@lists.linux.dev>; Mon, 19 Oct 2026 07:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421711; x=1793026511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MmAvYMzYsSLV9YGDTAToTSx5qORIoNpIq25+Tdy+3Zw=;
        b=rj6v+SRc0whxTjRu/q1Df8HnVXpXh0y7GKPjFRmmUWYrD77SfKjfWMoKynzIA6vqBp
         eZqXmsllgseL3u4DzI7M/wLBs/mf7mbKchZQnD3LmGXxpmNq5nNxWa3KhUuUUwTwj4aS
         J3V7HcEhjvbvV+zxeBqLSSnLQg4WGkrWbgQNzsXDyMQvlsUCKtm44hbDYsRqR8kwWNXG
         lgl+avR9W1LEVllBo+aE51cAWQmuHAuFApR3dmQXm125GzdZqhbcQBbW26iaG22AT/s0
         5uT01fHE9gDNRJ1JOCZNNqbm1L0FJwqK/xckLGpvuR4tkBIeFfP3TIDVODERj+XDWdXW
         rJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421711; x=1793026511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MmAvYMzYsSLV9YGDTAToTSx5qORIoNpIq25+Tdy+3Zw=;
        b=AhrWZQQ/POp1E22SXs2yRrOGbNrHUYbHQMGgxvQsIlE+B04nzUX7d1/HynU7pkDIvZ
         6TAX+Fq5bUgwVgMwFDhnBLBlNXFyNi8kK4ZjaokNWT3sm8b+fDmoiZ+XlKnVNheVLdnu
         3yK24SAJPDwUBWG9QEFCr6BRtraAR7CsCqC47bqrXU4AnOeQAbfnSc7GAisp3ZxEAmLw
         qynZf27pETenItGrHUEyHUUqb/dCaBjrXqqZHd/shdPCYbJywd6SgdBTc8pbsnPp1bKl
         f95QNvlmtLlrgg+ZPhUUHL/Y//PiEBFZmEMZ3e14IvnsHWjgIlhd+3+u1YluSzEUXzNn
         M4YA==
X-Gm-Message-State: AFq9FYJKCsBYTP5+7IWBBMz6aJ9F1nWMCXMup877rCdRzSZywSzEopUR
	H+Z2keWhLFA9oLIb/9h4uEfZT/dvFalHbSGg6nm2qLSK/aYcOq3BqoDJ
X-Gm-Gg: AYBFou0677z8WxVrswrpA80AhgpM9a89W+1/gbDj2f8Gfh9PRKBKHFM51NZh3GnUaP6
	hGyXWGpFZ1MaIZ1X1Wldwre5zejmA4jzvgXGqHGoGxL9H70AyGoYYRRU/7bcZJIrotTfGW2O1Rg
	E6ydZIVaj5WRJD6+t0qbBnUvBrQGWmBd+vhJu+Rbzit3PsHx5XFrXvo8OFLnq8L2rd+LNLpbnPe
	pYAbs2mdoDK9kBCqxakEnG2qrfBWbIC/x8vz67S830kB3f7u+rDlfEyVPxvAjNQDeuCGt02qUre
	3iyW42QbBYFb3lgq4gKbpVHElZguh8hrasLnUA7R9ECLgEGkm5cuzV1LE18VsDJK5lzfTVFwbjq
	ZFYttI9J6yaTKB+w4piB8xEue6GVxIpfGyu9MuIkWk1yP+h0fxYx9H9aFgAnOj+tIzAJbeC/+u2
	zmkduqlPGPSw1Z1IPyE3vDrIT+4lpAmRckCZlhwuGGGWnE/+0jmBGi6MKr2eFEj7LbiBBV6A==
X-Received: by 2002:a05:7300:8284:b0:358:bbb7:88da with SMTP id 5a478bee46e88-361a234c05emr10464488eec.32.1792421710542;
        Mon, 19 Oct 2026 07:55:10 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7a80:50::3cf:67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082e81a06sm31590887eec.26.2026.10.19.07.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:55:10 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minsuk Kang <linuxlovemin@yonsei.ac.kr>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+1c5368988052dc2d8201@syzkaller.appspotmail.com
Subject: [PATCH] nfc: pn533: bound the OUT URB wait in pn533_usb_send_frame()
Date: Mon, 19 Oct 2026 21:55:05 +0700
Message-ID: <20261019145505.176036-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pn533_usb_send_frame() submits phy->out_urb and then calls
wait_for_completion() with no timeout. During probe this is reached
via pn533_finalize_setup() -> pn533_get_firmware_version(), with the
USB device lock held by hub_event(). If the device never completes the
bulk OUT transfer, the wait never returns: the hub kworker hangs inside
probe() and every other task needing that device lock (e.g.
usbdev_open()) hangs behind it.

Bound the wait with wait_for_completion_timeout(), using the same 5000ms
that usb_bulk_msg() gets in pn533_acr122_poweron_rdr(). On timeout, kill
the URB (usb_kill_urb() waits for the handler, so the on-stack
completion can't be touched after return) and fail with -ETIMEDOUT,
which __pn533_send_async() already unwinds.

Fixes: 9dab880d675b ("nfc: pn533: Wait for out_urb's completion in pn533_usb_send_frame()")
Reported-by: syzbot+1c5368988052dc2d8201@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1c5368988052dc2d8201
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/nfc/pn533/usb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/pn533/usb.c b/drivers/nfc/pn533/usb.c
index efb07f944fce..569b1915afc9 100644
--- a/drivers/nfc/pn533/usb.c
+++ b/drivers/nfc/pn533/usb.c
@@ -184,7 +184,12 @@ static int pn533_usb_send_frame(struct pn533 *dev,
 	if (rc)
 		return rc;
 
-	wait_for_completion(&arg.done);
+	/* device may never ack the OUT transfer: don't hang probe() */
+	if (!wait_for_completion_timeout(&arg.done, msecs_to_jiffies(5000))) {
+		usb_kill_urb(phy->out_urb); /* waits for the handler, so &arg can't outlive us */
+		phy->out_urb->context = cntx;
+		return -ETIMEDOUT;
+	}
 	phy->out_urb->context = cntx;
 
 	if (dev->protocol_type == PN533_PROTO_REQ_RESP) {
-- 
2.43.0

