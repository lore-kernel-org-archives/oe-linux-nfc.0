Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460873A8FF6
	for <oe-linux-nfc@lists.linux.dev>; Wed,  3 Jun 2026 14:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496040; cv=none; b=WDr+BuqX1y+dH7UAGqqaSKF3+43GYiz7tnX2kRCni8fgpeHcO7BGmvicaYzt9/VW8b6a5xVO9IMDcJ0o/9Ozflxj/YfrYhgAiD4BW2oUF+rJHAst/SpjEsmeYGoGfgBEphr/RuGvC0g1xcmYqTrR6LCtV44UZQSdE8mPIaph/3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496040; c=relaxed/simple;
	bh=rltsMnPstES5O95K26OEKN7CoVBeKZdZbNkscQutuP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yzwu2Vyojo7rE3jqpbk2ZzgGL1qQrK0Q17hpzl2ICWGCwRKBQkwGHo5VqCkEGCmITE+g2ASocnjor74ZaPE6Y3x6vP6kvGRUiErmn2Qi27AVDhiuQofr7LUWzJPvaq8ZCMOPeZo4l3t+SvoTYgkYEOXLIohZNBze99rrUdUqFag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=sBzNMexG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="sBzNMexG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso18873605e9.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 03 Jun 2026 07:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1780496038; x=1781100838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VjsRnZLZQ7estap9LmjUBhs1AGh/vTFeIsSLLUn4dTk=;
        b=sBzNMexG7MyV39QMwRZL2ByQr4HVdcLgn9om/3/Xux2u70ScMqrXt6O/lIcktrb8NG
         0Gnc0FASStGumNgysKsFWbm/MPM93bFGRGNYX5EdNoxuC8aJyCxlx5TDpHFf4lCejtW4
         XDpcmcL/kKuJX8hE7OuU0Al//fvpKcE9xZ7eB7RvME+8C21cvrfv/w/pvEu3U0GkRXpF
         IC08NMEde0QiFDImiHBtA9QcYb8xjoMK245qNd+rGINEwW3iokMl/8FxP8mBpBDe/YEY
         jvdxooN9766NNXjXNCceNg2AZ8etkWAh60Nws5ENyBcYJxDzRxN5B9gqFvO9PM2tZaBr
         nCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496038; x=1781100838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjsRnZLZQ7estap9LmjUBhs1AGh/vTFeIsSLLUn4dTk=;
        b=idKt/U5OsnBDqDytHNTPALQG6WQmXv9MvQySqR/vjt5ZG/Vm+FKf7Z6xHXMxP3qYon
         a45m8IHhdQRW2jjHTw8LOb73C9p5zRGUssHHEght4X1C5nNmPJuhyJC2zu2kvv3MfFqp
         O0Y0EGchMVYt3+LoMbyMZAdCrYsNsv3J3qjllEoXR78cuREK23rYJ7NZl3O4miCXrwnT
         S4MspCBz53HpCJkk2dgCq5rOzTdMgrSg1q74HJW00Zz9mFy+UIxaz+NkX35dHeYjV7VJ
         ArgJ090iKjF7IspWrLII7ev+YHm6casxrQAvsZt6rkO9AIjUFAluHmFJf3G6eDe4Fs82
         SPCw==
X-Forwarded-Encrypted: i=1; AFNElJ/IULs/lzoaxK21dB2vAeykgr1Qr4eAcEvnQVI25z8HovqtoB+ZMjVntZO7l55hZzGjxfz5qtlhQARoud4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyACVQ7NH+3nKt1VbZ7es6oo1YVOkrSOgj2MOOXuVd7zOn35c3M
	4PxSzvv8/3rPd78LM1ZYtl11wPQiiuSXH+5m5ya8dZOXOdQ7/IYjyes+9W1V9fAXSdNJ
X-Gm-Gg: Acq92OH5kMRAFZA/A0fWxJKyrabUBREq3S8Lup0lLQF7QffLI7cut2Shr2SaPrODces
	/pl/ndsP8EFyAQMJ/XHzLjyEhWsyXp6kFUK5yQb5Bi/IUjm9JIwZN4xUY8OlWWwu/8Mo35cleLL
	hpnZaPPghW4Zg64wgGhFNTQA5vpB9nhaIvPNwTakKxp7CkGYEv2nn9mHt14nTXnQKnydSTkJSL8
	tK0YvUblayoEnCUyBhpp7p0A4rYGOYUVed5N4mnLS544sJtgjz2dY9o7e8DUE2qzlJwmc5dzMjW
	8gb2Xvum6wg0uPH29Ni4vLjbjTbu8LWQ/s915qYB2I9teEQUoqCv1AyQyOUI5NH6q9JNBQ+DNvF
	XacKRhTwKTp9eE4Br8hmRTzipqjIiO0F5EwEA68iA1HZxgW4y5yvC7vZumEnnQK9+HsEQaM+Hi7
	QMLYuh3i3O7UWmVZmOsHZSTKpTpD8VAgvPtNRsKDfok+duchLeJY75mHJG63Rr3EUl2Vzxhkqs7
	A6cVvVycUX7GOTW8MMkn1llzzCLDKpcSX6SN/y8pWTZrRVizco/Efd+sePeYaT7mg==
X-Received: by 2002:a05:600c:1392:b0:490:a1a6:6f24 with SMTP id 5b1f17b1804b1-490b5eaad68mr59903695e9.15.1780496037716;
        Wed, 03 Jun 2026 07:13:57 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6d16f0csm65358165e9.15.2026.06.03.07.13.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 03 Jun 2026 07:13:57 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: David Heidelberg <david@ixit.cz>,
	oe-linux-nfc@lists.linux.dev
Cc: Aleksander Lobakin <aleksander.lobakin@intel.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	stable@vger.kernel.org
Subject: [PATCH net v2] nfc: digital: clamp SENSF_RES length to the destination buffer
Date: Wed,  3 Jun 2026 16:13:55 +0200
Message-ID: <20260603141355.68156-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

digital_in_recv_sensf_res() memcpy()s resp->len bytes from a remote
NFC-F device response into the NFC_SENSF_RES_MAXSIZE-byte target.sensf_res
field without an upper-bound check. A nearby malicious NFC-F device can
send an oversized SENSF_RES response to overflow the stack-local struct
nfc_target.

Clamp resp->len to NFC_SENSF_RES_MAXSIZE before the copy.

Found by 0sec automated security-research tooling (https://0sec.ai).

Fixes: 8c0695e4998d ("NFC Digital: Add NFC-F technology support")
Cc: stable@vger.kernel.org
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2:
 - Clamp resp->len with min_t() before the copy (Alexander Lobakin).
 - Add Fixes: tag and Cc: stable (Alexander Lobakin).
 - Frame as a stack buffer overflow (saved-return overwrite not demonstrated).
 net/nfc/digital_technology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/nfc/digital_technology.c b/net/nfc/digital_technology.c
index ae63c5eb0..ae6487c10 100644
--- a/net/nfc/digital_technology.c
+++ b/net/nfc/digital_technology.c
@@ -778,6 +778,8 @@ static void digital_in_recv_sensf_res(struct nfc_digital_dev *ddev, void *arg,
 
 	sensf_res = (struct digital_sensf_res *)resp->data;
 
+	resp->len = min_t(unsigned int, resp->len, NFC_SENSF_RES_MAXSIZE);
+
 	memcpy(target.sensf_res, sensf_res, resp->len);
 	target.sensf_res_len = resp->len;
 
-- 
2.53.0

