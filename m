Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A50C3B8412
	for <oe-linux-nfc@lists.linux.dev>; Wed, 23 Sep 2026 03:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135799; cv=none; b=If0up9ENx2oYKii9EDa6L9kY5ukYGuzRHRursVgdzsCdQ448ETi+ByokJXOSKb/X+G78/NyFt6YVBzng5UxUFiNZBUIhL7izXhyleHZxiHCrOZvxv1HbGGh5sufCZJNRq4q9cH4wHdf3VnFvLX68wvjKcunmmOlMgSXrFquCpww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135799; c=relaxed/simple;
	bh=UHxbXnNz5HUYTb29HGjKrLh62KMUdOWP9PPapwJ8CWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cGr7qb8B0Jvs8iB0VfvgjkDqmtfLDed3ztlsyFaFayDdLWyQn3U3KgMAkexiyxUvtBx4wjIlZ+A6YIQ1AevTNK38Ez37egQFdnameSp0kVVt7qbwL6Od3apNPp6RmERKYEaGAYIKE8AmKkcxAhSFls5iqbLvDUg2ixxWsNoOFko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0qftVn5; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0qftVn5"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f05ffdso2219295ad.1
        for <oe-linux-nfc@lists.linux.dev>; Tue, 22 Sep 2026 20:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790135798; x=1790740598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLoSPPIDOuiot3v0sRPK1oQnqyJuz/HjWQDWKSdrDik=;
        b=E0qftVn547EAFjC5T+XjiELC2aSgdqVSkz1AxzxSuAludvH5U9o5tgNUWTTpRG/iUe
         kcq01idhVUapK/Y6Z3EmPfKzjgDza2Lq+jA/zTyWBe0/inMJFIp+cvMzwO0DslYyVEJG
         rF1lCI6/Gcj5Fwb8AQVXy+/mPtFy2+U6Cd/P7YETYtVmTkqkDRChkQzBItdpM3b2cG9y
         B4r2IBPjz9sL5ScjiGXzapIBZU/HbRUamhoUgC9ysIzorA871HAMtIdWZQXeje0M2VtR
         3wgekjzP3uZV1c8vVKEc3PaSrP8jg5+SNKhHGfYgv4Nr2S679JIh20lFoJVsHfVTGrET
         2vxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790135798; x=1790740598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLoSPPIDOuiot3v0sRPK1oQnqyJuz/HjWQDWKSdrDik=;
        b=hrUe9FSCsmBHZhPsaOhPmcGEWGmvwuzfs9CkdZ9+lbGpqF/K4j53GPMqyF/dL+3nqV
         A01Ku+nm9+cGNJ6qOqHfOUCqlxv/7YEmk++DnC7qlpj0v+5fSU2xHpCXDpsKcz5DqkPH
         AFS9jXVvggnPVP1/pp/J39p2YsKq1d5FZsXQFMSssKlNrrPNf6aF6AWNCtpgDxhXDL4d
         +zXP7WG7/+AqGMRCutoTZKL/BhnkiSxP4mMDowCcdHMaWJmFX++gTE2Qc08DiiSmZ2qN
         5lq86gYcmT3pMEKh9eGTry02ZPwrHfs0GBK5PpZH1Bka9CW2qG5amc/GnzC6p/nGod6o
         I4xg==
X-Forwarded-Encrypted: i=1; AKwUvBzOSOVVmGrKGyMisZnYWOmIh3a0G6P2X1PpZOok9JvZEM17j1lw1kSVAezr3CozLjHyOFokwVNkyoNxpew=@lists.linux.dev
X-Gm-Message-State: AFuF++kSgaWzfFegaPGzHiag5aG0QZw1Tsq1yhJUk6b4fsf9qshXryNZ
	OaGPy7fSPpeFVAc7UfR3xTrtbYz0bOggJiWDE9LxO2yRNV1Gl4yRif79
X-Gm-Gg: AYBFou01qtNsPRAXSe1Frb9F1nMKtz0T+DleD/oOQUJ9QhQlraMqWhCfCbIfykso+lu
	jfk3SRlimAn0Rlz8DbmGnvqkv/uafrWtktJdc0YEOOtPqwq2JpbFUOlqXUHRFpjNRuNO9CV3N9e
	MrT7W/yovn34jySfB99l78sMbIgSm2ZpduvCKGTt6PqA7XX1Uq4BJnOnQ8yGJ18lAoXR20GN0I4
	ZOLcQWAz7O+PpvSBFfa9BXnp+fKp6EQ3xwm8gd9q3KX317Mkc/NSOrg8PDSLSXWFnvv7Ekl1YuP
	CKOHTvQ0QRnY1Yxiis2VCkYB7fT/2e6RxksgOKY/BlPuhuOsh5Qlkf6lKa6vbK6cvq3Bl+mM9Cn
	M2DnDWLC6glSxGc1+llvmI0Uqoz1DKg2jeEIg1VLVJWu4Q0Y1UOwpfWNJrr1JwwxRwvrYS4w10l
	eMYuRknC4tqFgdOCenpieVUkvRqdvWZyFyM28DY5+lBQ1zB4oM3Jo3aGXjhgDvNPrajKV3/drGJ
	+io63QEVrgLby0UpJl9Wk1njrs8kqxiQDMk608TAiniSCavq0Jp7YY/hB7MDw4RNXH8WPJN/x4=
X-Received: by 2002:a17:902:c94e:b0:2dd:b52d:e83e with SMTP id d9443c01a7336-2df69d5a776mr13052365ad.19.1790135797674;
        Tue, 22 Sep 2026 20:56:37 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:794a:555f:d5d1:ac0d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a843asm3850835ad.25.2026.09.22.20.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:56:36 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: david@ixit.cz,
	johan@kernel.org
Cc: kuba@kernel.org,
	gregkh@linuxfoundation.org,
	error27@gmail.com,
	michael.thalmeier@hale.at,
	sameo@linux.intel.com,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Subject: [PATCH v3] nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()
Date: Wed, 23 Sep 2026 09:26:27 +0530
Message-ID: <20260923035627.6210-1-kartikey406@gmail.com>
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
Assisted-by: LLM
Link: https://lore.kernel.org/all/20260906054336.20187-1-kartikey406@gmail.com/T/ [v1]
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>

---
Changes in v3:
- Correct Assisted-by tag to "LLM" per
  https://docs.kernel.org/process/coding-assistants.html (per David).

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

