Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBC526F29C
	for <oe-linux-nfc@lists.linux.dev>; Fri,  3 Jul 2026 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093667; cv=none; b=OjY0T6gEttSLhfuc6GmFW7AGsggR2NpQQ8olbcgTdCMIVAKdp2bUJO3iU+PFnwa2ysXnklU3T8arDrmgDf3+YBkk2uU31rxgsZWYYFOrBB94M4AEwWInc19hiYaL+YzmdsVi9dswYfinUAU/iwtbZ75VSBa5KhaoMJTcFjBLjjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093667; c=relaxed/simple;
	bh=bkGz+lQ0ehECpkL0qngfI5u+jxhod2fHu+YOv2bwP6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rD1os+v807Nlbnvv8DJhuxr/bBmm+iQ72X1qNC/6Fvu9Sy+D5aqChLyxJXi1oCkRV7kqHmcGYbxajrSc05+1wr50KxwGY5fDzOTX6MLJroTJ+VO8D7wgtO2UE7mVJyA0qnYqcKKybTW9XCLPzG7YIJLoxlceyEQYnGdW15GI3bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QaE+SjVQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QaE+SjVQ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-476a130c138so699985f8f.0
        for <oe-linux-nfc@lists.linux.dev>; Fri, 03 Jul 2026 08:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783093664; x=1783698464; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ykZDrcy2GUnsnSM6nwzjRPmI+w28LWloPQAwNTR32FY=;
        b=QaE+SjVQtQ/AMnNdS83HkpsCyelh7R1D3hZyrLbjONTBEJ0iiEaSGlxEQ6snTJE7KY
         se+sXnvQC9Ezr1kW2kjGxd6EAIphcjtjV8T20Rrsrscp61qzbMYtMVOm50SSGXePABa8
         2CF8NahgWx8sa8tJLMK5G41G3xDZ7LhcyMJUURMwlmOohGXIfS2w1NbmXKAAxzzGXwE/
         dOwkDW1O7ehgIormOhoD7BITCCnA+OdmoVRI/Wpvgk76jqGb55ptb3NqJHevUei4M5Hv
         7pP3qu/1aCH7dEHE0NoJseXX8r8PRsBkaeSZOzcosh+7WrtCmADk01zyb+a0Xxt4i5p2
         QH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093664; x=1783698464;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykZDrcy2GUnsnSM6nwzjRPmI+w28LWloPQAwNTR32FY=;
        b=IT3d5SX5GZwyB2Yk6uOFlW7iWKrlrBL9h+YpmqWrXj9RD006GPSiXq/F2xFGxBgHFc
         7AItMiLdZUC3nEzlTUVim1lPJuf6kpUIESJ/AZ0sP8P56lwAAr7vzuAyHaIUmAY7elak
         wIHZF4wS7XDWgNr1FqjC8s+XfS8Tr6sdFKFXXaCu7i+DtXgWSEl54M2AlJt+HUZA9Tt3
         U1w+9m9I6PiFpagQvI7j96mTgwry5h+oTlyc+YK3FsAEmpmDEPT4alqnV6JoGzwi4lVS
         ADAJz2qBPV5BWg1HQrSJ5JMCps7K9nFNRT41BrKGiWIy6aLzEMDDJnhJZW6JUBS2IPxe
         IIrA==
X-Gm-Message-State: AOJu0YwdHW52ZXyhdXBrGi8pgCizhq0CJspUNx+V1mN4p0Lq8bkJMBVN
	safrPkDB9HzVD2sqV1o+l2IB4X12CLH7M7Jh3KQrYQasDXWcVCWtIpFk8XIZxhvb6/o=
X-Gm-Gg: AfdE7cnZW0zhljclcmZXlBatSds9I7tnq5rD4599puODMJwxDv2n5ijjx53lTOHob56
	3ys4wWDpqM+Xawax5zLANJKM5EOSIWtJI5fbhnRqx5X24CP1BrjOJUG4dfMUP2RUxya2yAdroao
	hEV6RuaGVVdm9KFzSrGSMlYgp/lvcxdJh8g8fieydEhet3xpN+RrGoAi/o7aIhPVZ2pheE8W9Wn
	FNA7wiRS4uHfvmMkB1qI2mB/W38O9CoL0e7NlcjLlHQXdmyAiRMA5e7oyQ9kJVpg3LX5JC20d2y
	lrcCK8Zyy4eEyg4j5ES5yaeXuwXbiYjFtd073GXYN0SW2UZMzZqC+eXk80cfWoEndAvCDv7yy9I
	ZUgT5iBmIKBBX1JIotp0Cjc3DmZ1Z9jEnhRGJjbNrusbnrBrCUzlM2T7t4RhqZLcP4AsjxZAym/
	FjBVBAv285ne+1Bm1pcz65foVZOPCPfstzteCYRqQ14nQTis8zQHw/jxWm4ekXIxn1chFvs5V2S
	SaE
X-Received: by 2002:a05:6000:4a1b:b0:46e:483c:2262 with SMTP id ffacd0b85a97d-477b3982f36mr15236368f8f.14.1783093664501;
        Fri, 03 Jul 2026 08:47:44 -0700 (PDT)
Received: from localhost (p200300f65f47db0472e4f1e98703de96.dip0.t-ipconnect.de. [2003:f6:5f47:db04:72e4:f1e9:8703:de96])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f213e8sm182938f8f.34.2026.07.03.08.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:47:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: David Heidelberg <david@ixit.cz>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/12] nfc: Initialize mei_cl_device_idarrays using member names
Date: Fri,  3 Jul 2026 17:46:20 +0200
Message-ID:  <cdc9bbac2e0743550970e565f57996c8a833446f.1783091699.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783091699.git.u.kleine-koenig@baylibre.com>
References: <cover.1783091699.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=bkGz+lQ0ehECpkL0qngfI5u+jxhod2fHu+YOv2bwP6s=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiz3mwlXZxszWyrkVW+6GlCefSQ65U9qamNFCFPFsRUzW D+v+32nk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJmCdyMHTW7JiXsflH9+eJ hXmPRfj5iiqcD39ZfLy2tKm698Wi7nLJf4eEvr2bOfFqrsX3dTrBJp9//POwfMhRxrdB+uDalka evUUb1uu76S3Jvt9p5SjZxusZt+fthmv8bueVLxsplu3s0k7MCRVdKK644q9TBf+SCtUoTnMHLb WPApNeNG+PCBWXUqw2O6O7SaCCz0/qpXniUb6Zsl/lvzVsOibV0Onw/VtftJ/eylUxk79r/3R5+ CI5IelRgHSjT4iOkh9n1dT4qPyca19u3Nsu07kzNKnc7/Kr5o+LIwL+ifd5XM4Uq3GtevjSWMp8 X9T2SK2H12+znt6mnMUvpWhfLRjiF/Uv+MyhRU6OCyUB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
mei_cl_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/nfc/microread/mei.c | 10 ++++++----
 drivers/nfc/pn544/mei.c     | 10 ++++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/nfc/microread/mei.c b/drivers/nfc/microread/mei.c
index c256ae92d6b1..484e3ae0e875 100644
--- a/drivers/nfc/microread/mei.c
+++ b/drivers/nfc/microread/mei.c
@@ -48,10 +48,12 @@ static void microread_mei_remove(struct mei_cl_device *cldev)
 }
 
 static struct mei_cl_device_id microread_mei_tbl[] = {
-	{ MICROREAD_DRIVER_NAME, MEI_NFC_UUID, MEI_CL_VERSION_ANY},
-
-	/* required last entry */
-	{ }
+	{
+		.name = MICROREAD_DRIVER_NAME,
+		.uuid = MEI_NFC_UUID,
+		.version = MEI_CL_VERSION_ANY,
+	},
+	{ /* required last entry */ }
 };
 MODULE_DEVICE_TABLE(mei, microread_mei_tbl);
 
diff --git a/drivers/nfc/pn544/mei.c b/drivers/nfc/pn544/mei.c
index 3d3755cfa71e..7ca117186d3e 100644
--- a/drivers/nfc/pn544/mei.c
+++ b/drivers/nfc/pn544/mei.c
@@ -47,10 +47,12 @@ static void pn544_mei_remove(struct mei_cl_device *cldev)
 }
 
 static struct mei_cl_device_id pn544_mei_tbl[] = {
-	{ PN544_DRIVER_NAME, MEI_NFC_UUID, MEI_CL_VERSION_ANY},
-
-	/* required last entry */
-	{ }
+	{
+		.name = PN544_DRIVER_NAME,
+		.uuid = MEI_NFC_UUID,
+		.version = MEI_CL_VERSION_ANY,
+	},
+	{ /* required last entry */ }
 };
 MODULE_DEVICE_TABLE(mei, pn544_mei_tbl);
 
-- 
2.55.0.11.g153666a7d9bb

