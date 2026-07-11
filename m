Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4279F3BB13A
	for <oe-linux-nfc@lists.linux.dev>; Sat, 11 Jul 2026 12:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783773408; cv=none; b=e0H1y3aT1TjcQ4uhwgp9G+7kTqR0Q9HvzTwEdsxdIUhubPGbh30QAcsFksrH5XVmlNe6DnNgacH/uKhXmQSXj0KoMmsre9S8xrjCrRGZSGlvAg9MHgkHKI2EOB6hPBfai3MZSRu9jXVrF72izo9RxZLhcfQvXo9EICWwFM2Tzt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783773408; c=relaxed/simple;
	bh=PhVyj9qD5Z/KlbzjKtoN1G0Qg0OHJkNtCd/AmCW/7Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rAMVX8KcfDe04bZT6s9m2E/1L2C7LZwh5DBYG3C5QZpgKS5WcqXV2Ib0d9fweLwS+xAVewfV/Tj0vw69M8VyOwent1PAJy5Rn4Ua+lkB0t8vI461pLjw8vG7bvvJpSnVd8BfCJ/e4wRcCusUdffSvqn0L2jrmuGyuEj5BCnOtUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=Md9ZDbPY; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="Md9ZDbPY"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47122683cf3so974736f8f.0
        for <oe-linux-nfc@lists.linux.dev>; Sat, 11 Jul 2026 05:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1783773403; x=1784378203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iEZdacI12rwF3rcHsuyG8xQf3FKIyTovs73PN6g2MOE=;
        b=Md9ZDbPYTwsBZxVxXfUHyA2wrACrecArZALVzGTRpPrymCaZWKIBQC+IbdSnb8jAah
         z7F7ssCkW9Rjl2BHyNo2QTbvJYH9DGNV8gzM5oBnsvi84Re5/Uldwr7PnxK+5aNRKk2A
         j39CS5ValvIZpLktgR9hPcyUCn2+SiMd+0/j3gC2Kk8UfDX6Cr9hYEeD3fEWiF2bomfb
         ADl+GTaGVfNLK/xoJ5CEfCRqZ7OqtYXgBKWHh9BDmlmtPJ3gzEE/PWRSc5SP+O5M5gyJ
         TEbqmuj4NQOEVPk75d+6KUSdKTZVQ17Oq04Iadud1iJziYKz8iaKah6O6d51Sr5W0a0c
         SkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783773403; x=1784378203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iEZdacI12rwF3rcHsuyG8xQf3FKIyTovs73PN6g2MOE=;
        b=T6l9axps9w0ZOp5WAGlD5Qckw7IjThFhUZP0bJK613fgJlpQ4Tz21f11fzLpgsmkMm
         2HlsemqQgXWzimI1gJIZM9/aW4TEI8V6DMOqQKtD0o5GKGplY7MIXZ8XuHsnbKb5X4Z+
         0jGKPw558Zd5Mlnw0bYoTUBNEQ8R3CVKveHiHY1l8WSvO3sio3deuIJvvsVQaik0hTqc
         bo4Aoenf+Dg+1S09ES4pXjCyT77/0S8LFiIGDlTKmdH0m1oUrwD+WBQ/qGI4tOjv3a6L
         2CYzW2R5eYt9Bl7s/2XT0YOn27DWhA8cP3riRy94OxdqAK1e0Gmxi9IH1WrnvzeuYAn/
         29IQ==
X-Gm-Message-State: AOJu0YzN4XJcJ/DXcBZ7XUcQcP+lHltzDyeVD/W0T3ERHm9A79ZZ81o2
	mSujqxN4eEUVvpkT2mNps5kRhpll2mPb/q7KpDSL+cw0RMdMK5RL/wAoz5naxmtGkMQ8
X-Gm-Gg: AfdE7cl1eZANN7me7hN82znggDtL4rIh+6oSDLrfx4gHykOrQL6f194to9TxFez6evC
	3k8p3wnmNSCA/tM0pgxhh8CyLb093+pMmsdCVhypQF9GAmzLu0gK85TOowZULzgjtMNn8rqjRLQ
	ms9Il4ZPyy8/6gkHbkTmpl5V2u+9Ttfg1s6dQDcsACIxvAQmCFdHOQou05Qq1oYQ3307wmrasu2
	jT+wT+bvae5nmzK+atJTdIDb8AipiuWjfWYiKrbVLCyoZVyP+QGj/DEa3LoK5XBiyLdUCEjzUkD
	93Be4i+KfLXlUoIu5OOo1IW1iS2KwcPiywpVca8ZQHoEEiFfWNDW1G3ce6VjtZS4WEW/8mTD1Jm
	Qq2GvhDlI/mu21atMjfI9E9/096SO+kGBEsbUzkZbPxXGF1sv81JfP097a+7YMjnpLqKs0T6KZK
	1kslY2LvopkJ4lw9MkcBXrPXW78eyIEhl8UuN/ufDRWC0OA/1LfpVCEPGPnMgDaVCB+M/rQ0B4H
	Iw5BnE8KGLMmWuAj6TBWwZ9ykNvKqv0srw=
X-Received: by 2002:a5d:5849:0:b0:46d:d5db:98 with SMTP id ffacd0b85a97d-47f2dd02487mr2501924f8f.44.1783773403587;
        Sat, 11 Jul 2026 05:36:43 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960816sm66169851f8f.29.2026.07.11.05.36.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 11 Jul 2026 05:36:43 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: david@ixit.cz
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net] nfc: fdp: bound the device-supplied read size in fdp_nci_i2c_read()
Date: Sat, 11 Jul 2026 14:36:41 +0200
Message-ID: <20260711123641.32502-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fdp_nci_i2c_read() reads a "length packet" from the FDP I2C controller and
computes the size of the next I2C transfer from two device-supplied bytes:

	phy->next_read_size = (tmp[2] << 8) + tmp[3] + 3;

next_read_size is a u16 (up to 65535) and is never bounded. On the next
loop iteration it is used directly as the length passed to

	i2c_master_recv(client, tmp, len);

which reads into the fixed 261-byte stack buffer
tmp[FDP_NCI_I2C_MAX_PAYLOAD]. A malicious or malfunctioning controller
that reports a large length thus overflows the stack buffer -- the
r != len check runs only after the read has already happened.

Reject a next-read size larger than the buffer and resynchronize.

Found by 0sec (https://0sec.ai) using automated source analysis; the
missing bound is evident from source. Compile-tested.

Fixes: a06347c04c13 ("NFC: Add Intel Fields Peak NFC solution driver")
Cc: stable@vger.kernel.org
Assisted-by: 0sec:claude-opus-4-8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/nfc/fdp/i2c.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
index c1896a1d978c..581f85f0dfa8 100644
--- a/drivers/nfc/fdp/i2c.c
+++ b/drivers/nfc/fdp/i2c.c
@@ -128,7 +128,7 @@ static const struct nfc_phy_ops i2c_phy_ops = {
 
 static int fdp_nci_i2c_read(struct fdp_i2c_phy *phy, struct sk_buff **skb)
 {
-	int r, len;
+	int r = -EREMOTEIO, len;
 	u8 tmp[FDP_NCI_I2C_MAX_PAYLOAD], lrc, k;
 	u16 i;
 	struct i2c_client *client = phy->i2c_dev;
@@ -140,6 +140,13 @@ static int fdp_nci_i2c_read(struct fdp_i2c_phy *phy, struct sk_buff **skb)
 
 		len = phy->next_read_size;
 
+		if (len > FDP_NCI_I2C_MAX_PAYLOAD) {
+			dev_dbg(&client->dev, "%s: read size %d too large\n",
+				__func__, len);
+			phy->next_read_size = FDP_NCI_I2C_MIN_PAYLOAD;
+			goto flush;
+		}
+
 		r = i2c_master_recv(client, tmp, len);
 		if (r != len) {
 			dev_dbg(&client->dev, "%s: i2c recv err: %d\n",
-- 
2.43.0

