Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C023C2796
	for <oe-linux-nfc@lists.linux.dev>; Sat, 11 Jul 2026 12:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783773416; cv=none; b=m3s7rYz5YPbyIyAbx29GOAnrw3CV2XEHXIVbAhYY8i99bmOivUeX7RynWth9prL5ETsTjOKYcvTDJI+qQyiW5OXoHqnX0JgeMxzGAWyv+58hwA08CQCdX5/dNJBx6om/R4Atc0/LLPJhtCtPhO5RAFmI+afLhCSFedUStrsp8vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783773416; c=relaxed/simple;
	bh=yuIVmBPzTzrv2Dm30aECT2hNK8SzBGa9AOom3Qlk6Is=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YI138VR/9N47t0iroFQhfQtyPp1Kt8TjMj6iTkVYQmG2ksYQzog3YPv43hND3b1Rp37gFi4Y7ptMFQMuZQqee+XNEZraFIC5U8mkRZGCkO8mdTGMR/IOMbWIA4cR1JaSJGeVZ4mw1Dg5/l1zPuvHr9Viw6Dp4FTzjcLExnRvMSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=oEGskfP2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="oEGskfP2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-476a130c138so2151481f8f.0
        for <oe-linux-nfc@lists.linux.dev>; Sat, 11 Jul 2026 05:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1783773413; x=1784378213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TKxklP1jarkRVxjcZK6OwpDBv6NsE5WBXhYoYNX2yBM=;
        b=oEGskfP2kAp4jzyyIwXHK36sE4twZfZKhe+BgA+sHLsISt1xfKPx0/F36LppLG38bL
         filmTs9cTpNv17Aais5THftK3hn1DN5gY4lBQKXYdP6Bc4NQSJhyB4D/sMRX+b7Xgba3
         OOlNH2i/EYawaAaE0mYulHza5rtkNWR1odBweKH4KVoFJ8QgwvtbVzFNg3sB8qkC0LON
         vYPPBB7z6OM0RpXU2E6Es3P3z+126ElBIV5ra03J6WelxGVBr1QpcsYMq3oPnRsdare3
         Xh3+07U85bTkGRJ/OrJX60FsfUHfXXw54FxQdk2HHiofjB5/mpysXmyeL+lxY7g68wyd
         Ntbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783773413; x=1784378213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TKxklP1jarkRVxjcZK6OwpDBv6NsE5WBXhYoYNX2yBM=;
        b=jFWEkj3L0D7tOWZfhfO83ED+vAYlgbXOrrwYv52K3FwML3/O0ffSi332mULXo83hJN
         qdKxhSgPU6pQrapOKzI4e+C12IfmBmaGaoiYr4RMR0lNzc5C6I4mUqF3+oNhR2Er3ER9
         X9ZXCYcVhSgYmlhBxO1xXk/EqvRiBCtQthLoM4OL8UJccQHvQK/WfFAzEgI11c/04199
         hGqsxrUzJhirvsx6tyAYJMJE04ebtlArS6HzNSmWsmNTvK3LGL2qptEB+61HJhnHrHw8
         V7wU8t2zAU1I9RE7ZTOZpdqKioaeAnId4xCgP5xZTwCEjsgJouHl4765OBt256S+xrnz
         bk8w==
X-Gm-Message-State: AOJu0YwxpCsq4u3HMNo1FWoh8C35gOeBaxRuy7TQhVLvJ2yjW2MwLOba
	PY1btrUYeqNm8XxewDMqDlfArZ7Z+z8md89/Anq9AtCDlMMVc71s2SEFSETX+odH0y3PVopJlJQ
	a3e3lXDvv
X-Gm-Gg: AfdE7cl4BQMcLpWFNaLpF1yoGRiKHmBbWtm6hrjwx11je3oD3d13KpBJmNmh+62ObV3
	oCFVPnWpc+Hu6OxyxbqD9c5uY01Ofb8INuS5f0lFF++lZhGGxKjl51XOxa/aeWXqCdC/1wrWMr8
	fFldtrZ5zfGpNN8nFSweOMEoWoIujQioHyr6TCRLW7XPTREu/85bsC/0JHsQMHCZOhfqYPjnuSW
	agdfP0rn2Nbuw6TMhJTgDvgGSs6wKgrAoo8vEYedeDSi37vNEQiO2eEOqXN9g5b9tHry953hCl0
	0P0ECAp3frEP485xd1I9XkNl5fb9j8rRhUxpSBq4j46WsNnvn2p77zgB9VLB6OQUrkcDLEShCTk
	FzoUJcvcWVGXmIpq6/BXQ+4iTnWqqDn8mJlGjqh9l/I9BUI+jxVsH4PoLLE4s4nO3WvHo8rOlug
	cYeV94jvf/eW1DGOVK9rJujzV9IZs67j6u48nuED5fXGvO46fsJ9FqhrkiKui9Czz6VO2ANvI41
	XqT6iZzvs8oPTe63djRaRxsjGpg+KQIAL8=
X-Received: by 2002:a05:6000:2387:b0:476:7036:f854 with SMTP id ffacd0b85a97d-47f2dce9662mr2553907f8f.21.1783773413232;
        Sat, 11 Jul 2026 05:36:53 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d83bdsm67690276f8f.13.2026.07.11.05.36.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 11 Jul 2026 05:36:52 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: david@ixit.cz
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net] nfc: port100: reject frames whose declared length exceeds the received data
Date: Sat, 11 Jul 2026 14:36:51 +0200
Message-ID: <20260711123651.32595-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

port100_recv_response() passes the URB transfer buffer to
port100_rx_frame_is_valid(), which checksums le16_to_cpu(frame->datalen)
bytes of frame->data. datalen is a 16-bit field supplied by the device
and is never checked against the number of bytes actually received
(urb->actual_length), so a device reporting a datalen larger than the
received frame makes port100_data_checksum() read out of bounds past the
transfer buffer.

Reject a response whose declared frame size does not fit the received
length before validating it.

Found by 0sec (https://0sec.ai) using automated source analysis; the
missing bound is evident from source. Compile-tested.

Fixes: 562d4d59b8a1 ("NFC: Sony Port-100 Series driver")
Cc: stable@vger.kernel.org
Assisted-by: 0sec:claude-opus-4-8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/nfc/port100.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index 5ae61d7ebcfe..30a4e09875d3 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -636,6 +636,13 @@ static void port100_recv_response(struct urb *urb)
 
 	in_frame = dev->in_urb->transfer_buffer;
 
+	if (urb->actual_length < PORT100_FRAME_HEADER_LEN ||
+	    urb->actual_length < port100_rx_frame_size(in_frame)) {
+		nfc_err(&dev->interface->dev, "Received a truncated frame\n");
+		cmd->status = -EIO;
+		goto sched_wq;
+	}
+
 	if (!port100_rx_frame_is_valid(in_frame)) {
 		nfc_err(&dev->interface->dev, "Received an invalid frame\n");
 		cmd->status = -EIO;
-- 
2.43.0

