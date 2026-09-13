Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115B62C21D9
	for <oe-linux-nfc@lists.linux.dev>; Sun, 13 Sep 2026 04:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789273598; cv=none; b=PTVb2RKQMtkAl4XkPuhuOk2JLz46J+6ostxkPAWKxzYqCwGKjSt24ol/XSXV1E1snLKcdWizctq3y0gwyKnzmrZQ5DIK/CdLhVai94RfHuSUIDlDEQ+cb6EJ2WTSBsttZ1IHVWbH3mk+vh3L8aaf+93ulKYqYEbictHGaaZIA5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789273598; c=relaxed/simple;
	bh=l0EqM8munegQGAWYoLgSWbJr+elV0QzsYM8QaNsLACM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DzVmRUg/MaYQs2VL/ltAjws+JBmNFenfQYxOcl8mhhcgcUkBfNQXGGVyPa1Q8PLqOEcU1WbSBf8BF+J9oos2nU+uZiSjJqNzHcLz+6Gcwr9e3ytHdZI4QAGGOWbBn+dxKxcwnCoV9yZBorBR94ZMv9lNFRCst4gEREi+rQPmpKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIV6yGLh; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIV6yGLh"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-5309ce58730so17829391cf.2
        for <oe-linux-nfc@lists.linux.dev>; Sat, 12 Sep 2026 21:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789273596; x=1789878396; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWc5ORGBMLSs59eoqsaA5DPnuqtjSJQmTTKP2X4y/Io=;
        b=iIV6yGLhI5F6CzGu5s2P39+dW6TtGlcUZ3KsnoakBKXWPtoNxQh6MSFbwz0P7qFeC6
         hnsM02++vStQnlt4AtvsLJnw9DSM2sC5AKLG5W4g+cktbjEuXtSu+GcWVeaKPjddnn/j
         /7VSC5/GuIUBIJpW45Ldk/RGQdxjCjiKeTX+TPHmgQduF7ccH3hIoCyBe8wl2FPyR83S
         Qy/hB1UO09B3f8Oijr/p6p/gJyoqAMe/xrKGQsP4NHvzpUNbgSv89vLoks6ptQ1nuyyv
         xQzNl2RGmZTDLtFUxtN2RR0aM1Rbxr0c+e235ldXXyvHICPxcv3Zw61Y2YswAISzZ31u
         7tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789273596; x=1789878396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWc5ORGBMLSs59eoqsaA5DPnuqtjSJQmTTKP2X4y/Io=;
        b=WRKK98z+JUpf4X09xXjMh+KQ4de+MFulqOpKrwKUl5sebmhK2oXhIvedjjfrdSwLIt
         gQD19rzl5S7xhJmchYscw2SzFcHOtTmDjnLvNo39izhauDCfmFXR7sCkf9X/vIVWNRRp
         lo11TP7kzcMKka5m3KqMZmDc9F/bh3Jfdl7xAqxN8VD5aiJxDCkkOGKCdFlDNeZBs4js
         8DjdE+1K4p5tnT3NCKjYDj1GAYo2oka15fmDQlzaz6z5U95cp9SGXTOyKsCqkD1ELnMO
         z0ND1ZRky5exr/L7XQAGFSj4nhBUxrPOw+FeoVqrLvub70TdOjgWqwN9UGAuF766Yr80
         Z4hQ==
X-Forwarded-Encrypted: i=1; AKwUvByrxB4x/H2sEOD9g/2iewUTkap6gxbtri/x4GHxS7gbJWx82fYU8Xi1aMzP39Iq7DHZuCtYYBcDdv0YnRU=@lists.linux.dev
X-Gm-Message-State: AFuF++m4etkPCXGhMLnxwY+Brgfp4Ld5TOBCHhynfOMeylojyclpGGGF
	PONkts18LxGur7/uszBEtoS50x8zsqrI8Bc4ySMb7USwTeQIrJS5EJQ=
X-Gm-Gg: AYBFou26kNZ/5eM6T0FmeLbsrJadrlb1D5yAl1LNZsWC/x0KF18Z4JZ6aRcYJ+8euLD
	foc/vm0wADGG8XVopT5RE6G/3UAjhLc8ZX1HhSbzSN/ejq751foR10HifZAXcXPaAEWpaamnG/B
	P6V2+lPHFkRFcgiQOfL6FJNodl2H0VNfLAbnzGn4Dx7SvJJT+e2iP51VxaZ/pTMqyPs3+SRJ1ct
	qvdXIHbh53BncBJAshSUpDzrLfmBE+kwWPP55qNFnBHQPbJ0C1tD3xVGgD4mezsBVotntTvLWkT
	xNi03Uj2x9Oz4GvQfl6pPnYUUwaP10VDKvYILU9NLiJG2w8wmsKjGuFYQ8FBc2EbJeM8TzRkGqO
	mwyceLsiLEXTIlZ58gVxGv1MSJuavFxvQicnx1zroDOHT0BE1IuwEhdV5I/hc4G1feg4SHEYGaU
	qSnOuOUGp14kBrtio7qL55hbmUqLsA69aFX+c0th1y/vl4bK9/003xp2XL9kiO2V7dAf+3XWqe1
	z3VEnYm6nTYXH3UN0/meWgc1r0aploJd21ynwYhSeBQ1WzvS+hG6D1n6q3siWWn37SVLnfV6aTC
	3HyeDNXE+L9l1ZNvF5rsPQ5Owy7i
X-Received: by 2002:a05:622a:295:b0:530:e01d:6003 with SMTP id d75a77b69052e-530e81ecc85mr78423631cf.49.1789273595966;
        Sat, 12 Sep 2026 21:26:35 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f2033e7sm62784096d6.4.2026.09.12.21.26.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 21:26:34 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Greer <mgreer@animalcreek.com>,
	David Heidelberg <david@ixit.cz>
Cc: Paul Geurts <paul.geurts@prodrive-technologies.com>,
	linux-wireless@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] nfc: trf7970a: power down on startup RX gain failure
Date: Sun, 13 Sep 2026 00:26:25 -0400
Message-ID: <20260913042625.31296-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

trf7970a_startup() powers up the device before applying the optional RX
gain reduction. If the register read or write fails, it returns without
undoing that power-up. Probe's unwind only drops the separate regulator
references acquired by probe, leaving the additional VIN enable from
startup unbalanced. The system resume caller also has no power-down on
this error.

Call trf7970a_power_down() before returning the RX gain error to deassert
the enable GPIOs, release the startup VIN reference and restore the
powered-off state. Runtime PM has not been enabled yet, so the full
shutdown helper is not appropriate here. Preserve the original SPI error.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 5d69351820ea ("NFC: trf7970a: Create device-tree parameter for RX gain reduction")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/nfc/trf7970a.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 60883001f..ddfc58c29 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -1997,8 +1997,10 @@ static int trf7970a_startup(struct trf7970a *trf)
 		return ret;
 
 	ret = trf7970a_update_rx_gain_reduction(trf);
-	if (ret)
+	if (ret) {
+		trf7970a_power_down(trf);
 		return ret;
+	}
 
 	pm_runtime_set_active(trf->dev);
 	pm_runtime_enable(trf->dev);
