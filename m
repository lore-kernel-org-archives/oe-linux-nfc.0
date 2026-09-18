Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C394B4885
	for <oe-linux-nfc@lists.linux.dev>; Fri, 18 Sep 2026 08:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719426; cv=none; b=fpdU3wvUAcpZehvFPNhsYHmsbKdD43TKtyyJuXESA368GYfFajbaFMeoCxK2sLptwmo4jVwZEh3MFotjwsZjXRFmhkT1DiQt1phwL+bXVwHxM32EoWFEwTEVfynU4u2+e+GZNwXh8zsPMybcXMQxwm57TCX8ImH7GS7QWiCFnQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719426; c=relaxed/simple;
	bh=3Vb/Q5gFmB9GEcWuixSJnDg8oOAAOJry8Kj0f4JNoZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YdvISPzET5LzOhblB52s6hqMfS4U/FI2o7gD4y8JocbfoH+LGK5wim4bLkZJY9Cu0MNfZUkgtZC6wp8Z/cGe5580RQhfRMpaNhIO1HUsGeajKpIzwQ5RTHSuUv0oD2QcZ7WDlilmyvtnNDF4x10en1lefT4jLXoDJDCRpxSb7Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cSpd28yA; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cSpd28yA"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15d3so55197066b.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 18 Sep 2026 01:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789719422; x=1790324222; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4kVqeGTAB3R+JJC+QW2Gmsm/OFhxPzA+cRh/xOgn5H4=;
        b=cSpd28yAfDG+f0RQ5JBpTbe798pQpBUIAnYaquhBFLkAyruVCDp1vj58nE0JiFFYkj
         wMDQSngQv39B5dNuPIoOWXvbdblprCwlkdKUf0r5V/Zs++ak4FvqXH08boMYyH/ST+Fp
         aGaYDb2swKqkt7mN7Fe2ZZjCVJ9UCEHlcsmXvuTOPHvbQX0MG7tbCeyur72OUhk8sHzM
         jc5p1IagwA4eGCrchbSuSf9Lj8yuNQykfZ3XZqyLmlsYZRzFUte7QiXiTZlNOVQqIe7l
         /0pxpv2mbA8b+HvQrRqO7v25TrhWONNsywqu9VhWYjs2/XGO03b2qGueSzipKfGwOJRf
         EfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719422; x=1790324222;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4kVqeGTAB3R+JJC+QW2Gmsm/OFhxPzA+cRh/xOgn5H4=;
        b=fMac+aPDn1NscgcKl3fuTNjkF/nM41sHdzRPtfV6nsNTXlUKmmdYI1RjTD5quxQhih
         LG5AgAhLsH6LtXGLEwxqUWVNCvbgXhBuM5RZzYZsvqtQu2/7lpOvZX3XVDim/PJWpgIi
         52nTN4Xbo/Th2d5cwSIvBEhSJwd754sIU4ThqhmOdV6eF+PQGuduP6D5K3nDDnDNh0KP
         ZHA76b+Yw0PggBnXfuMOZnQ0Rvtfo1jX96L1JuNelOf9GZCJABrlY8l5RSuGN9991m0M
         +q7Lgd7Gorr6tx2f73XD4/HT7PSF8IynYKdT5GMXXYVkbOhNMBz46qv9vsy8b3gw6y2y
         jgGQ==
X-Forwarded-Encrypted: i=1; AKwUvBx59JTYr2O2QvjYIBq82l0/Q9gWX9aRLp651try/EQxfwSha0G+rS6t7+iZ6d8LA19KQaVk1NtoJC0TPvg=@lists.linux.dev
X-Gm-Message-State: AFuF++lsEV2MgwHWkEXaW+ME1Ol3Wwa+fsO5BLWD+CPJ5Rf2R4vD37Y/
	XIFTZVAzh6UAPDrW3cUy9U1azPnrX1NnYs+cfVdRB2Xva5gkTt6f2kBTEEmwVxLc/mpAEQfLgvf
	bYq+5
X-Gm-Gg: AYBFou1yJHirmjtWBQgRW7lzAcO8PiorMy0o8ghBsvs/d9xkzisPqKPnoQABG5jUTxL
	WdbAOQY7QNooagIO3q/rOeubwNha3V0jaVnJjmDJGQzwlmgapsNakYxrch8TkmQDWkB4p7wr8lY
	WiaumPE28a/l9cUUrJzKJPaQeZIk7TA6bW1xPrA7Y+IhmhiSiYOQMXvbX7e1YoYQk5k06ld2+RZ
	5BFrMjw9Ff28wxh06tRdTxNekoXy8uqblvJHmNvx9aw9RW2GVz+j1ZguKXc7wdIKWWf//DsPtcd
	+F03Vp1cmjXIUU2ZYjmo00Io4XSlOsEeAOjd86oIO4Ak3AweoQB4kRJQvS3EH/IrTgYmYsx7F2R
	2RfhDSeD5kQMGDd1DaBOfxk98xLXgE0YEK6bNT4lyt09HWhF88qKoJkjXknQ5tq7xS/V0tRQYKZ
	YYQSzErDdESYDWb2HStH8RQxlscvk86UTD5aEoK5IFCymFJYyCKJEgwUlhlHklbrweQVs+iP1ci
	uwYuUK69N3tQLJQFFOk8GQvT3MaiIgVV2j5qWfEI9XVg0sHIuFJ
X-Received: by 2002:a17:907:3cc4:b0:c29:f5d5:5aa0 with SMTP id a640c23a62f3a-c2a159a977bmr170225166b.42.1789719422087;
        Fri, 18 Sep 2026 01:17:02 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb43a37sm30344066b.23.2026.09.18.01.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:17:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Sep 2026 10:17:00 +0200
Subject: [PATCH] nfc: st-nci: Use print_hex_dump_debug() in NDLC_DUMP_SKB()
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-stnci-ndlc-debug-v1-1-48d370af9c6a@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDug8Se1VxEXJhl1iqQloyKId
 zfq8lu8t4NQYBL4JDsEWln45yOyVwJ27PxAyC4aVKqqtM7eKLO3jN5NFh2ZZcDcaFWVhTZalxC
 zf6Cet3vZtI9lMV+y8/WB4zgBGa5/CXQAAAA=
X-Change-ID: 20260918-stnci-ndlc-debug-3b726547b775
To: David Heidelberg <david@ixit.cz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Kristian Brox <isyourbrainfoss@proton.me>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789719421; l=1184;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3Vb/Q5gFmB9GEcWuixSJnDg8oOAAOJry8Kj0f4JNoZk=;
 b=aVqV952H3U9RE4pnVYs1xz5MaLGPVT6K6cveb1CJo3CvPPyUkSeZdwykELjdRwogWB6L7Db2D
 q0SaOd5RYEzDSPlDvAIj+bLA5G5NT1n8jKCHnxSq6ZCA8qGBcSxQIkC
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

print_hex_dump() will output when just the console log level is set to
>= 7, which is different than the pr_debug() on the line before, which
will be going through the dynamic debug feature.

Use print_hex_dump_debug() to have both prints be controllable via
dynamic debug.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/nfc/st-nci/ndlc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index be4808859cfa..89a13a439279 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -39,7 +39,7 @@
 #define NDLC_DUMP_SKB(info, skb)                                 \
 do {                                                             \
 	pr_debug("%s:\n", info);                                 \
-	print_hex_dump(KERN_DEBUG, "ndlc: ", DUMP_PREFIX_OFFSET, \
+	print_hex_dump_debug("ndlc: ", DUMP_PREFIX_OFFSET,       \
 			16, 1, skb->data, skb->len, 0);          \
 } while (0)
 

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260918-stnci-ndlc-debug-3b726547b775

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

