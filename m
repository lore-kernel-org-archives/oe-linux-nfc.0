Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C1B274B23
	for <oe-linux-nfc@lists.linux.dev>; Mon,  8 Jun 2026 05:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780894853; cv=none; b=tFb+JxXWnwgA3tdmJrCWhbuNEbuq0DIW/rcJLtonFp0pc/ypVx9mGS30geZO9Nc7ZwP5J0kXFHdlYIA0bz9yQHaz+C5aDUqKhJ7sV1gR4gMGs33uOK3FS5NjMrGVf8wHUvYdtGlBogEwEslvtzTUz8TKdY7CVIZrdXSsmwXJoZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780894853; c=relaxed/simple;
	bh=LEO51zVZQ4PwIYRBvGUMxl65oubDJDhjO2lHjYxIrwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NbG1T7mFc/dW1vVALTTbpi6nzgMp2v9z2RVFK+deuW907XWXV3PhE7zJXFoiiWfQ1pJqTkKD7S6AYOlu5qMII2IqYxWCmqfApd5dmv8u4rCaQdmHkU89Kv/rKfkmRYWOz3Oyb8kjp1ASsCF6seKHP69/jUe9MNS2tkd4DgV++q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huKXOGAn; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huKXOGAn"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c35980fdso39244375ad.2
        for <oe-linux-nfc@lists.linux.dev>; Sun, 07 Jun 2026 22:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780894852; x=1781499652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RmNq/ntgnQWCSXKyuTVv4BpCK0SRdqBKAJRNsXGpW+o=;
        b=huKXOGAnkurIOUPVy6eFN2TyOOS//gYgOOSjTsuGLULg31L4O4YqTJ3oYpRgiDWDEW
         4v053sXJhqehhnWhv4KosU6emkIPgZXaYZLZNnQE5Ew3QAD2x+zs9UTL5WOy9bM3fIVc
         8Mh015k0aPkHrVP6CrSlLlPhBIODgwYe8rHjSRp3GgP7i2h5AMs7ERzhWEEQaiHUC6zR
         qCQBFOS8XtwIansxA+TpnlsvNmOejDhM11GGEf3DkvkmeTBtr//KOfenpvvblOyoFmzN
         SS0bDyedY+NjyTst63DKXkcL+xC+kJ54RTcE2jmOxYzB0qz9vF2H/434MCzjwPosFS9K
         XQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780894852; x=1781499652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmNq/ntgnQWCSXKyuTVv4BpCK0SRdqBKAJRNsXGpW+o=;
        b=UwdXoeUs8SV816KLrRR+akY+j4vwuun50nwSU0ZbG3uIqI8BX4wz1eaW/1aVoTgN15
         B8CnCJ+MHkge/ukEdsZNtVKRX9zWSGDkJSSj/nLjr0p3nCf99ZmccS73aKj+CZsZD/6j
         DmfhHsR5gQNtN/zDSyG/2xx/D/7S+QCrGXCBc8BhQkhITPxaHR4U5CIH4dueFk4QZVQO
         LU++WEUBJx3O8LaUSB4TL65C6IF42wK4YYrZ7rqKva0q2l79hzmgqkX2IhurG7KTxyRk
         Vhjl99qaAZ0K8tjuHAvvr6ngUhjY3E12JBOeIuZjsxHZ1On5SMurssq64lUCKgoF0fnO
         FgCQ==
X-Gm-Message-State: AOJu0YzMBEn//4CTeaQZHVT7DE1I/FvPhwSbNs2/2bxwwIweBmHkLmqg
	lNMhnQy14piOb3DPNTj8DMYwm1shLsh27vtBZqTP15gsNUlOMzNFgaup+0LSSQ==
X-Gm-Gg: Acq92OEXFzot1UQPcJeafUOYNEUZLBsoNlNINlc1aWuLI6FlxFCzkzxXo189v5+jH/e
	uPaOcsCEZJEO+74ppTYaoZx0p7RsXRMuVFRyb6nWFsrwBrRhICrh6E+yqdJo7Jq0ZJUkyKWkB75
	yWdYmA04QId0muy/X91QdKJs9aX4pCT6OLSPeQriUunQiRZHDKS8lMHsFIgAcNgxokbbm2h/oNL
	nLScjwDb5nH1jGPMp+q2hCgNX//oz2E67Ii4s381BF86oV2ZglWTsOro6nHEQSOVFgg7uknOzDd
	cfM5csRfVKR07Sc3oaWFB7YPOrkFKj3g1p/5HfJb1jftefSCX9dkZwDvA2O0yctFXXvyjQA7va5
	llP3pnut91zdIXmNe9tcRqa6Xj82Lhd4ZapUlDNeqwR6MVoEmRJv0S65m7fT6yglc7C1VRZFOo9
	DmV5gA0oqzuRNg5oi8J0nQxXMZINUCwdfMeg06xI4k9mx0SKKepSh9K/7qEZs2mJYfWiBp/Cw+C
	zgiVjY3f2sePdnrGL1S/Sn4FGPE12r/+PgLEc0F45I9zA==
X-Received: by 2002:a17:903:3885:b0:2c2:245a:3368 with SMTP id d9443c01a7336-2c2245a3649mr110430735ad.14.1780894851632;
        Sun, 07 Jun 2026 22:00:51 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f94a7fsm167581765ad.28.2026.06.07.22.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:00:51 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: David Heidelberg <david@ixit.cz>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] nfc: pn533: fix memcpy overflow warning
Date: Sun,  7 Jun 2026 22:00:34 -0700
Message-ID: <20260608050034.5679-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error: call to ‘__read_overflow2_field’ declared with attribute warning:
detected read beyond size of field (2nd parameter); maybe use
struct_group()? [-Werror=attribute-warning]

As suggested, add a struct_group and memcpy that.

Also replace 9 with sizeof for clarify.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/nfc/pn533/pn533.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index d7bdbc82e2ba..4e721a8dfd8b 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -740,8 +740,10 @@ static int pn533_target_found_type_a(struct nfc_target *nfc_tgt, u8 *tgt_data,
 
 struct pn533_target_felica {
 	u8 pol_res;
-	u8 opcode;
-	u8 nfcid2[NFC_NFCID2_MAXSIZE];
+	struct_group(sensf_res,
+		u8 opcode;
+		u8 nfcid2[NFC_NFCID2_MAXSIZE];
+	);
 	u8 pad[8];
 	/* optional */
 	u8 syst_code[];
@@ -778,8 +780,8 @@ static int pn533_target_found_felica(struct nfc_target *nfc_tgt, u8 *tgt_data,
 	else
 		nfc_tgt->supported_protocols = NFC_PROTO_FELICA_MASK;
 
-	memcpy(nfc_tgt->sensf_res, &tgt_felica->opcode, 9);
-	nfc_tgt->sensf_res_len = 9;
+	memcpy(nfc_tgt->sensf_res, &tgt_felica->sensf_res, sizeof(tgt_felica->sensf_res));
+	nfc_tgt->sensf_res_len = sizeof(tgt_felica->sensf_res);
 
 	memcpy(nfc_tgt->nfcid2, tgt_felica->nfcid2, NFC_NFCID2_MAXSIZE);
 	nfc_tgt->nfcid2_len = NFC_NFCID2_MAXSIZE;
-- 
2.54.0

