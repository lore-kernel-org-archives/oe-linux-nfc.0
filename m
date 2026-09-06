Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA5337F72F
	for <oe-linux-nfc@lists.linux.dev>; Sun,  6 Sep 2026 05:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788673442; cv=none; b=dz4tzYRS3bfqbqk/ZMxzqwpcD5hN3xJF7ALFe/N7HOj1WtPhHkuC82q62Kr4MsXjFumMZsBLsucOb5ar+IRhDy8LGhr2YmRR/N/v3DREqSv1WxFLVTluR6tTrYuHYaLMl8ixnKOPejg/qR/9tkIpsUcVG8uU+QtMZBpWmSeRc4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788673442; c=relaxed/simple;
	bh=+7nqH51/1OdHpCcWbSJkBnwhzRrc5KxfkE7iE+q5aJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pQQn2HQINyPePphuTzKlI9kxqY9TCNxWp3zeY9H0eqOi3PRQJxJVFyFR6uIq48ga29Bj9lWkmB9wu6vC0mxsJZgrVuls5lW0zDzLWKTR/MR4tkxbLEokxiaeNHjt89q0uxWHmJJbdqt5mTzZXQiqbrq5l/2uDg9pNTCtyiZ8t0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgHCo2p9; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgHCo2p9"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1961509a91.0
        for <oe-linux-nfc@lists.linux.dev>; Sat, 05 Sep 2026 22:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788673440; x=1789278240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOlpr3i4pRMFaX6G1BU2/mCS2v2PccHIfgN4ACh/VAg=;
        b=XgHCo2p9r7ydgijGR8bq3ZExA7OhfFaLBXtd9zc/2S7H6L21VdU1M+rUh9FHKF4YGG
         ZRAS8iC4AA8bvxpbulN4zQF1Rje1TRuPlOxew+R022qaagfu3IDKFmFf1DtMW0RdcEXj
         QDTNyRNXYvyzsNJCEi08jjh/8/Oa7J6GMKeHON/lsqCV2nNDWfJCOOBKMLbP26E5OWkj
         +GnVxW1UmBI6a5EgDqYJwiE0Iy87njA68GsbKb5BiVjMKpRpxkfBv0ZsAQGBOj1YvWWg
         YKGvYofaHSZB+YYr3BkFpYRqilNyBjKwy4GOLum5fI4w7Ho2BFzqxYaQF3mD4KGpGY5s
         6ZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788673440; x=1789278240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOlpr3i4pRMFaX6G1BU2/mCS2v2PccHIfgN4ACh/VAg=;
        b=XFBySv2tkAsU8uceLHdzurqXBpoYW/xo6B6IqmTfQ1EbEgtNJCCk34VziwqAuVfklK
         0IRnntFmo8olH/8TZrO2XFgAbZ4Nb7ARyJG2U4VhY+tP0RHg+t58BKf6eBjKtsGQnWHY
         T0c0lS9b7dLIkrO3AWmmGQpf8/xoqKYaOHUuL3R7+7eQZHb6knecj69ouGQXHtNgCUyC
         nwYDZ17HFuiLHoZB9125H9wJWX8iSxCVfBQVe2mDKFXe6U2ed/iaCUnfc/5lEGitMSxH
         q774qXnAA71pAZTACjWhl3Oo5mAXeTI3BASkPBu6YdHg+whI884kEda/R+W0HWjQWjY3
         5Hxw==
X-Forwarded-Encrypted: i=1; AKwUvBxIAtdrRNh7Tl89ZDqC/9eh6NHgQT5g8NIoonRD6A4Kw20TGRTAut7Q8X5lvIxqGGX6n372mwnkYTEsP/o=@lists.linux.dev
X-Gm-Message-State: AFuF++mc7tJ/5VRYt9WYMMqHd+d9ngwZ9hqeU2Ur58mXek5eRG2mlUp+
	J/E3X/1moTL/RXYO4Tp6oI7fRZBXyMc3qTG55iX9rlCAmcF8ILL0qkHE
X-Gm-Gg: AYBFou0y6iLQQ7o5CppTm3+8GrbC4SOfrI0YBs4pl3TKiK9yh/9Idwxbk7+nvFPiibp
	5kiSvm+reg3j/N27vmqOU+wMS8jtZnLUnVI0ciQe/UgWf+FW8fPCOcbicqV1RYCOlk5BJZAN2Bm
	ot/IeKpnDd+UvTtNPKtRHicZpP6me0euFSX/r1zPmcc1hMgqVtGW3Hh0fZzpS+8/voJGeKv6HnU
	nJ6IeqcetoHxkIB36WY244Ei4R5cnl+VHXpUVgrDQss3IV1CXO2iT9ghJtz0wq9CuqiVXYs0ys9
	WHyyUIfUtQA4GcNYN2DeL6rEjXSinYOgs316cIiHL5U9SSBJCNGHFn/ragMSWXRmWFkJIP0P3ms
	hGRHjbUYaVcZ4cyj+KbnFld8z+vjTHU8y2IpGOSNCKs/QYVJl9LhohW58oMufyFMe/IAankTJQx
	yy7nwQsdE+DsW/7z2YCeKkKHuPNO9TscaolbeekuRbib6FMiBT13FQLJ0tUj8sFTi9cpdHETVvn
	YpK/pXDyKgPu/HQZGoGGK9L16N6+DPzR2v7qU3cM2GZ3Of8anVWT4skBJUIBnPs
X-Received: by 2002:a17:90b:384b:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39b261e79f1mr23457699a91.13.1788673439728;
        Sat, 05 Sep 2026 22:43:59 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:7136:e816:e198:c7e0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm13569418a91.9.2026.09.05.22.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 22:43:58 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: david@ixit.cz
Cc: kuba@kernel.org,
	johan@kernel.org,
	horms@kernel.org,
	error27@gmail.com,
	gregkh@linuxfoundation.org,
	michael.thalmeier@hale.at,
	sameo@linux.intel.com,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Subject: [PATCH] nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()
Date: Sun,  6 Sep 2026 11:13:36 +0530
Message-ID: <20260906054336.20187-1-kartikey406@gmail.com>
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
before using it, and reject values less than 2 to avoid the
"datalen - 2" underflowing.

Fixes: 9815c7cf22da ("NFC: pn533: Separate physical layer from the core implementation")
Reported-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1853daab1a47603d4678
Tested-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/nfc/pn533/usb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/nfc/pn533/usb.c b/drivers/nfc/pn533/usb.c
index efb07f944fce..d08d3b0df988 100644
--- a/drivers/nfc/pn533/usb.c
+++ b/drivers/nfc/pn533/usb.c
@@ -322,6 +322,11 @@ static bool pn533_acr122_is_rx_frame_valid(void *_frame, struct pn533 *dev)
 	if (!frame->ccid.datalen)
 		return false;
 
+	if (frame->ccid.datalen < 2 ||
+	    frame->ccid.datalen > PN533_ACR122_FRAME_MAX_PAYLOAD_LEN +
+	    PN533_ACR122_RX_FRAME_TAIL_LEN)
+		return false;
+
 	if (frame->data[frame->ccid.datalen - 2] == 0x63)
 		return false;
 
-- 
2.43.0

