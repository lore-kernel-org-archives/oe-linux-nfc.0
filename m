Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C3121C9EA
	for <oe-linux-nfc@lists.linux.dev>; Fri,  1 May 2026 00:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777595754; cv=none; b=GCSUTp2ymCr3hMRvwwIAXjCEwo2VyNS0U4UTzbvhWTZxiQ9nIr2WhMJmeXQjfJfZBR/cyyMNC795OAxRCX2ns1jTex6RTZQf4iLcT/vDjTruOmQE2tpCYKQVHHfVOoTfuPCbP9+FKJSqCdYGHbfOG4UdDYxU4LnheW6A6VNysOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777595754; c=relaxed/simple;
	bh=V7lmIo6YStzuThSfi202zQSDyu+9QN/KHy4tcHqCYm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pwnok3cX7m1BBQ6QKNB2o7zyC+M+MqUle/e+WR+rj+go5fdwF58kAQljiZEMIHvx3Ic7y/PQtmCuPX/I3rZ9Vl+OnOa+RJHbVpu4JHuDJfxbYjm2xiVeX620Qd8QYVUHegexHiyQUBwNDP/mQU6WnsEHfK+vuFCuSsUSI9WXquA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Alu85hcV; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Alu85hcV"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-89fc4147f2eso17745416d6.3
        for <oe-linux-nfc@lists.linux.dev>; Thu, 30 Apr 2026 17:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777595751; x=1778200551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qVbj4iq96o7Ay2secqPEgWO1PF93KBfrCZ4Yir6DMPY=;
        b=Alu85hcV1tskAHVHypsym424qThKBbhWZnnU5/iCCrWWjXuXpkkOU9hvD0h67jkKY5
         pdASjHIZHYIn9dcuQZVGZTXiDaVkjWUyL5/fA/rKhUaFaDYOqPJ2ncwNuKDdjsCgs9tg
         w/QgopvUeo+cefFlQTjPvTVuQl5/z4fpRal7gcrtlryAHXqvAAZvJpgRXgAf/2BOJrOC
         udGhD6nL8UR9dKXkyfjjomWguvVw62QlK6q/Fq9eKWLJ/ivCRRA13h8MYOsPN8Cy6P2J
         4o9xbd0FIjvGvpYcZ7039ofGi/kMrLXlt+l3MZ1vTxChJRU6uX2cOC8Zfdxo69wYrKfI
         r8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777595751; x=1778200551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVbj4iq96o7Ay2secqPEgWO1PF93KBfrCZ4Yir6DMPY=;
        b=Gz4NImaWe0UzG68QXxRRxsQCD4SrdTa9UB7ueB4qM3CZSm1nkrYD20/fYfyBHh+oSA
         wcU1yKfa/tGZG4Xl4rF3m4LkkIJN2me0he/QhKXQ2P0QMe8tHn96Z5SpDUTII415LWXX
         BMjG0XNWIeh+c3/kFuxKZwxaRIOIkmWIRJO2xw5r2MpVCkjI89mJHlzKvHwGPP139uw8
         Ahq6az8NNpkilS9FyfmDwQIxT4ThqLp/AJBtuOsMXApzTqXf0++iGZZ1/Q0Ak3qUwGS6
         lfK8QLRGvOPpSjbjO/28KrIQZGBGn65tB6zHrNBRT7HU+kfAut/+KR8RXDJef2EhPHzq
         qQrw==
X-Forwarded-Encrypted: i=1; AFNElJ8f0TXJx59NI9+E3eXY+5llUChbq2w7oSNEt1uaoa96mfEh/SPQ12dLU0kmhAyQhKNgen9dCjgIw4Ej514=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5/Sjnm2G1IsYfizCLtmCibKFkN3VOR7i4ZtvATHKW+m8NJ1wy
	d8f5R4gKoDJQc+IHoWUFDu/Jwq3kKM5DHLZXakYcadQvzP88KDS6jcwwD5zQ144aeaY=
X-Gm-Gg: AeBDieutsl/7Ay2mWpI+seeQZ3vRiUC9UZ3FtT8WwebEwKDmGlSACOy+co2gsT7uuga
	UBTBlQOiyM2OysNybHvPW6WobrZtGBeKFqikZM4FGwWOlMXjfY9hExJXycBkez8LMvhsqeWW+LB
	SW5+MrmJA2I3tjVQ62BPiTJJPAag8xymUnmEr1eGwo/rvbO8CwC2EP+TDEtu5e+R+jrhao4BZtk
	T8wwDx/yN+p9WNNW4nVYai5PdLs+3QuEn1pmTnY9YzLzwOIVJlgWE49v8wUx/SCJTIrRuZtbRzn
	Elcnd/pveHCThaQKOohUmJ+O5/9ySI3yID/VwRQVIW8NGM5cpQkPHnF/q0q6Gmgq5fjtHElry9i
	wWlxer+TlePHaxsKPEmH4fJKsywXPuMqY4rwj/So0JYZUHKlnsFRiM//7YfbQQ0/4LuIRqD65i/
	PfOrOu1pw5ld+lbHaoRSeaYvCMWAtybuv5+Awh3lXuKT3dUe4jeQ==
X-Received: by 2002:a05:6214:4608:b0:8b1:f2f6:33b with SMTP id 6a1803df08f44-8b3fe7af5dbmr82344046d6.22.1777595751571;
        Thu, 30 Apr 2026 17:35:51 -0700 (PDT)
Received: from fedora-btw.hsd1.pa.comcast.net ([2601:985:4883:91d0::917])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c1dca6dsm7182776d6.25.2026.04.30.17.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 17:35:51 -0700 (PDT)
From: Miles Krause <mileskrause5200@gmail.com>
To: Mark Greer <mgreer@animalcreek.com>,
	David Heidelberg <david+nfc@ixit.cz>
Cc: linux-wireless@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Miles Krause <mileskrause5200@gmail.com>
Subject: [PATCH] nfc: trf7970a: fix comment typos
Date: Thu, 30 Apr 2026 20:35:45 -0400
Message-ID: <20260501003548.6838-1-mileskrause5200@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a few spelling mistakes in comments.

Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
---
 drivers/nfc/trf7970a.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 08c27bb438b5..f22e091019de 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -61,15 +61,15 @@
  * support that.  So, if an abort is received before trf7970a_send_cmd()
  * has sent the command to the tag, it simply returns -ECANCELED.  If the
  * command has already been sent to the tag, then the driver continues
- * normally and recieves the response data (or error) but just before
+ * normally and receives the response data (or error) but just before
  * sending the data upstream, it frees the rx_skb and sends -ECANCELED
  * upstream instead.  If the command failed, that error will be sent
  * upstream.
  *
- * When recieving data from a tag and the interrupt status register has
+ * When receiving data from a tag and the interrupt status register has
  * only the SRX bit set, it means that all of the data has been received
  * (once what's in the fifo has been read).  However, depending on timing
- * an interrupt status with only the SRX bit set may not be recived.  In
+ * an interrupt status with only the SRX bit set may not be received.  In
  * those cases, the timeout mechanism is used to wait 20 ms in case more
  * data arrives.  After 20 ms, it is assumed that all of the data has been
  * received and the accumulated rx data is sent upstream.  The

base-commit: 08d0d3466664000ba0670e0ef0d447f23459e0d4
-- 
2.54.0

