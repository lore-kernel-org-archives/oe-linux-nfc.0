Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54AB185B48
	for <oe-linux-nfc@lists.linux.dev>; Mon, 12 Oct 2026 04:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780537; cv=none; b=oLjft6qRWBy3IDIzTDJUCI9kPWgixmRXchJygXOkia9YXuWox6RmI6p7WlXFf4eWij9ggV4+259bdt3okxduYxDPnWfPM0iCRuBZ076kkekkH8KzRfXa83Oo6p2J9++zYa6GOhf9H5Niofn0upo89D6425DQBG1gVF9y4reiYpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780537; c=relaxed/simple;
	bh=mNXVZisFr8d4ag5Ybqo/067e1iUf3Fk/1Flu0l+yMHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tu2t+q9d0NhX2aXM1deh8li/i62DNny0+lTlON8bKYyQny9ilzUzop2wCZkPK99UEMVrZQAzydXGJvsaj9Ds5gFRrC6ycjVPtx7eCdgJFgvxBh8E+umPQRg6QC0BLu7zLZipOTH59WnfkPJ03roWRSn50VvFpsNWFEGhwi+wwc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPUtReuf; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPUtReuf"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53504882980so18253281cf.2
        for <oe-linux-nfc@lists.linux.dev>; Sun, 11 Oct 2026 21:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791780535; x=1792385335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMGRj2x4/MNQGJmOzzzZqm+73crDKnrVgU8faoZXAfA=;
        b=PPUtReufhVVzEPkxcNLxDvGs06W1eDS8/Yo89FHgutaSz8fOTEdmHJzYIXiyUXnzjX
         JJLNwH9EOnoeloUgQIablqjy3q5yTfUrRJFKwjXn537c7cEiQc5lhXh5l4GZJiHGkhJr
         C/490gexnCppjvDHVLrmm+RnJj9YCITre7hemg4/eyKRzZ42c/NXuLmO4i5jw2foVnfC
         l58zvDUEkBkcVpiTSpSHEshiqbA+oG8TxhUQynppGSInjxourrP/mfbrqa3HUkoE+2yG
         cgvujKv4dULG02Sq6FNWZ/G2/kq62kGXIg8w0gPMHJ+Aj6wuwLCw5nek3wtc/XQQAWu9
         aJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791780535; x=1792385335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMGRj2x4/MNQGJmOzzzZqm+73crDKnrVgU8faoZXAfA=;
        b=gIZgFHxIG/gNE6xtTirddCL1DquV24TD9RZzOw5qGMMQz04fSCrtZP7NHH3N3o4m5r
         todQO15EWAInyaa9kIj+Bw5aLcR4dgT0sbwBTEVFzs5eu38uNh/RK9GldwcYKc8hIFGI
         dnJjOiOF0ma62QZbWAaF4XPft9TLRy14Y8njLiiOYRoTd/HoZCCCRX1B5nCEko3v/AMX
         JlDvBar4oyBlRFXjBf5tegKYvqZW3qhk0PGRnduyzIcmrcczpk5H8+fa1eckeeMkJ0aT
         wSnfxMfuqWjHoxPO9JIg9B4C6Im4hIFV9LdMaSU+DnVVUksJhdu1WR5UdzmOthAwDoU1
         Q54A==
X-Gm-Message-State: AFq9FYLpO1rND9D2PELhxDg2ECGUpadMnKZxvGOqD72GA9n29/8HFN8u
	9149lHlIIDcip3wCyvjFWVt6tJX3u9fE9m7V7ykCyof0saKFvB58f9E=
X-Gm-Gg: AYBFou26oAM03TCCqvQALDdLbsPVheH6I5akWbm27/2EhGw1645589EOkQw+nvxbVY9
	7r2Pp6XdWqmiIsIorCby/IMwpPXv10yeEKNxm8tc8KAiwnq51pmAC4w5N4J7CYXgoSseudnQsp8
	OXZaxr/jVZ3EiyCnhmld1rM0QL77t3W2luA++sXaR4fIfcMMIkvMFiCSza7/M5BObcelycfKzmG
	rwsK3JkLKV96VvpYEgtwq/F9DBi12D0to0BrMi7/lwHH2pzDMty31GkDTuevXys8jIH6BvUcZ+k
	IVlnJGFlYG52NFsvIkU5tzuKmMAfBow33EPuJ6pTYo0ofHcA+CxTZyUv0fmlgSLOyZHP+PLfAQi
	oPEN2lR7FrhQ0BMa/3SLMjitj+IRMUksUMgtfiGXU49rUUxCdo7Xc6n8qnSf008qt2qfqk5Ubp9
	yZcfnQirHHFKnkbSzhFNPX8maaulQAqG/iED1IyYUDUexkIrYn/jYFOKZwKD46rZVvkKYynUdJk
	YcBbNSDjoJauJgWrwJQmgU4wUR8lsmBk0dyu2u0lOjLsi78lDXBp2CyCp3EDgsWnwBQp9t83Aht
	C1VXh4cvjld8ZIkxGcWU4/FOXD1K
X-Received: by 2002:a05:622a:1e17:b0:535:142d:fa17 with SMTP id d75a77b69052e-5359f488fafmr154064881cf.6.1791780534742;
        Sun, 11 Oct 2026 21:48:54 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b80d74168sm18142096d6.42.2026.10.11.21.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:48:53 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] nfc: microread: stop the I2C IRQ before removing the HCI device
Date: Mon, 12 Oct 2026 00:48:49 -0400
Message-ID: <20261012044849.162298-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removal frees the HCI device before the I2C IRQ, allowing a running or
new handler to pass a frame to a freed context. Probe also enables the
IRQ before microread_probe() initializes phy->hdev.

Keep the IRQ disabled until HCI setup succeeds, and free it before HCI
removal. Failed probe can then release the IRQ without callbacks into an
uninitialized HCI context.

This issue was found by static analysis.

Fixes: 71054c7db161 ("NFC: microread: Add i2c physical layer")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/nfc/microread/i2c.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/microread/i2c.c b/drivers/nfc/microread/i2c.c
index f45e883b8730..07da86db989f 100644
--- a/drivers/nfc/microread/i2c.c
+++ b/drivers/nfc/microread/i2c.c
@@ -244,7 +244,7 @@ static int microread_i2c_probe(struct i2c_client *client)
 	phy->i2c_dev = client;
 
 	r = request_threaded_irq(client->irq, NULL, microread_i2c_irq_thread_fn,
-				 IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+				 IRQF_TRIGGER_RISING | IRQF_ONESHOT | IRQF_NO_AUTOEN,
 				 MICROREAD_I2C_DRIVER_NAME, phy);
 	if (r) {
 		nfc_err(&client->dev, "Unable to register IRQ handler\n");
@@ -258,6 +258,8 @@ static int microread_i2c_probe(struct i2c_client *client)
 	if (r < 0)
 		goto err_irq;
 
+	enable_irq(client->irq);
+
 	return 0;
 
 err_irq:
@@ -270,9 +272,8 @@ static void microread_i2c_remove(struct i2c_client *client)
 {
 	struct microread_i2c_phy *phy = i2c_get_clientdata(client);
 
-	microread_remove(phy->hdev);
-
 	free_irq(client->irq, phy);
+	microread_remove(phy->hdev);
 }
 
 static const struct i2c_device_id microread_i2c_id[] = {
