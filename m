Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFB325B09D
	for <oe-linux-nfc@lists.linux.dev>; Sat, 12 Sep 2026 04:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789185843; cv=none; b=OzdvfbD1tQLWrMt3zLzh27F92Ujl/OHOTaEtnRUVADDgCNBm7l5V42I9gr/IGVEGFDz0D7h1l68EH35AL20rRk3zYney+hDtAnyqHIx7rWFIrDUYfHqYaSq1NjJeUvxR7OV3EKxFZ2h8kIkszYFRUgmOFdIeYJ9OpLe9eNA6WhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789185843; c=relaxed/simple;
	bh=n2+a3bHoasD57GyzTGSQRXSs6iKWYXA4uMXs9bwZOSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CqGNzoKPghyq2OPOzOQQBGYHwZM3KnlTyL6/QpTvFrdxgVYQ8waFKqx6DUup9XucynhFarOrdOGXW81XV+eUcylRFqBrc17aqWcrvtBub+ly6yZ/M/3hiVZyn1HZK0uTXrpt0SpsUpcyZw4sGaLLfnv1Pa5ozyi9viOQKRn/sC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kp66jpO6; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kp66jpO6"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc1so103451a12.0
        for <oe-linux-nfc@lists.linux.dev>; Fri, 11 Sep 2026 21:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789185842; x=1789790642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UClbOqJghVNS+HetxvyOx47BLVX5S3LX2RS9VshAjqk=;
        b=kp66jpO6rLUpRPaWOo6NdGlxX+ppctHFNPQm3O6CKD3r3YaG77euygBSLmc1fPkByI
         K92X0VsO+9iA726pDmXTfPBbeYQ/TQiDby2DW96UoOlc5FRaPvUS87ZdWyzJQGc7bm8x
         Krrq5Nu2WOMU9C4rNipbPiKPZM69Jj7K8or5InxNSUS6TfA+PP23sc7afWo/Q+mgaI5/
         gsIR9J2aubYkkBst1Z8jhNKyOa3kceQuIxokry/O8+a631MIVWbkhl4s6GyBib4FYQF1
         Yfdg0jtyvaycBq6x64KnakdcGmRe3xgP89cFUkAaoVXMwI64Z3cyInfG97qJiNjx2h0H
         bPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789185842; x=1789790642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UClbOqJghVNS+HetxvyOx47BLVX5S3LX2RS9VshAjqk=;
        b=np0Io6NbBJFtQBuqvXIXHo/3ZK2kuAScNsb22iYz6I6zFccfEYgPh2RY9rCnjmamQ4
         eWrZQJUkxqVZWw+TdEcxUjWFFXb5Ud74PLTEogqkYtpx4d92apVz8J3hRDVSCkZStnnP
         OPsMB7tDJb47njjerK99RXw6btlynpqqZcwdnFGDPPuIpXlJpaUgxfdpyGQmvusw8lPB
         a8tLAmWMJC140m5rl4tZh+MB59/1o6Wjvq6PsLltAbBpb4aFshDmeDr0Mh70sPWojzXi
         7aA5Ot19Vqt3Ll4MXDmz6yMGKcXPdP7f5MSNZTKsXpaUmvsVegM4esIIpv6CrYWoj1l5
         LZPw==
X-Forwarded-Encrypted: i=1; AKwUvBx+MgHmRhiMn5CXM/1Fqz1ZMJriZ3R22kQwZFTNJJqbAwROsD0rn3od8PVEmzICoRC9++zX4XeQKzqlF9U=@lists.linux.dev
X-Gm-Message-State: AFuF++mTztmhFiJ7JuGTrCQ+6N+PAB8YVS26qpkyNDm+B9Wn4Icda9dJ
	hoUHkTHoNGuRFfWeP0yUkOj99wYjUHHSDAkGiULZFnfAWGHuDxB5MqMN
X-Gm-Gg: AYBFou3f+8kKrg+Pj1eu1T9aLa3/G2F0swGaAbWn+DvUSaVZk5qzM3V3n53osKKfKSq
	qLa17WzBjZjNTQN+vDLEdgrJY7/dfP2W4wCUI9uhlWMXY3+6kwP/AvPhnJBc5TY2PzH8Y4jx6Hy
	wSltWdL9nsK5ZhGw1HCWbYDePON2KALUlvrUa8wendE8Z7NfcsFnUPSyMDe0+7URu0qJsDp06d9
	ap6/Ycs6lWe4CvoDAUQyuzB3khL+VQotsm7UFMgPfReoiYk6mxL3PYMfnnj5fLVQz494LZykqqB
	S6xRRZ0T1jxxL2RtgXc/3KsDEqk4RDedwnh613t8BWFOEoIDJx+EGLqagT2kwSSWg6rwmFaRRd9
	kMnnMbo7oewwAOP+ZdKESh55kN8uO7VryjlbVG3Uc8+SvfdcSE7fUQIeSkMkH2PdjL0XwwHBCeP
	YnON3473kwfprzy1rd1jtB6OLe2QBOu5I+uA6nuAq/E6vg+TcGLjy4SMq13hkzw7W+hq9ZKQifD
	xU9BqTFqUckZLD+URXwkCN+UN4g6LnJ8EiuZ2B/WZID7U7ngMmI96ITUdBM+Fw2
X-Received: by 2002:a17:90a:c2c6:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39dbbe85d7bmr2067589a91.4.1789185841956;
        Fri, 11 Sep 2026 21:04:01 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:3e34:fc0e:e4a8:fba1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9d7ff2c5sm1937554a91.2.2026.09.11.21.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 21:04:00 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: david@ixit.cz,
	johan@kernel.org
Cc: kuba@kernel.org,
	error27@gmail.com,
	gregkh@linuxfoundation.org,
	sameo@linux.intel.com,
	michael.thalmeier@hale.at,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Subject: [PATCH v2] nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()
Date: Sat, 12 Sep 2026 09:33:51 +0530
Message-ID: <20260912040351.15056-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

frame->ccid.datalen is read directly from the USB response frame
and used, unchecked, as an index into frame->data[]. A malicious or
malfunctioning device can set this field to an arbitrary value,
causing the driver to read far outside the received buffer.

Bound ccid.datalen against the maximum possible ACR122 frame size
before using it. This replaces the existing datalen == 0 check,
since datalen < 2 already covers that case and additionally
rejects datalen == 1, which would still underflow the
"datalen - 2" offset used below.

Fixes: 9815c7cf22da ("NFC: pn533: Separate physical layer from the core implementation")
Reported-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1853daab1a47603d4678
Tested-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Assisted-by: Claude (Anthropic)
Link: https://lore.kernel.org/all/20260906054336.20187-1-kartikey406@gmail.com/T/ [v1]
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>

---
Changes in v2:
- Replace the existing "if (!frame->ccid.datalen)" check instead of
  adding the new bounds check alongside it, since the new check
  already subsumes it (per Johan Hovold).
---
 drivers/nfc/pn533/usb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/pn533/usb.c b/drivers/nfc/pn533/usb.c
index efb07f944fce..9471c34b4d4b 100644
--- a/drivers/nfc/pn533/usb.c
+++ b/drivers/nfc/pn533/usb.c
@@ -319,7 +319,9 @@ static bool pn533_acr122_is_rx_frame_valid(void *_frame, struct pn533 *dev)
 	if (frame->ccid.type != 0x83)
 		return false;
 
-	if (!frame->ccid.datalen)
+	if (frame->ccid.datalen < 2 ||
+	    frame->ccid.datalen > PN533_ACR122_FRAME_MAX_PAYLOAD_LEN +
+	    PN533_ACR122_RX_FRAME_TAIL_LEN)
 		return false;
 
 	if (frame->data[frame->ccid.datalen - 2] == 0x63)
-- 
2.43.0

