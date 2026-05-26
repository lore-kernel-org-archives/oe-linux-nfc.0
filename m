Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC04C2E229F;
	Tue, 26 May 2026 02:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761386; cv=none; b=RPa2UnBB7nkfJjQQZbp23qXTx1FVnZC1ZkX+I+IT1kmDjfpN0gMrxG77Vcfza+CVarjH+g4lQ/FcgA6HZHY8vuFjzTTVDWh4jy07a6DZyDrgno3kiOgGicxAHWJ7EXM1WOdsmucz3DTG8xf9tZcd6I3M/Z2IV/tqs8URsze4L40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761386; c=relaxed/simple;
	bh=ZBiADtqd8YlbeRxp67vWcMx5hT8HmfCfD/xcharnfAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JIj1kKjABXijUh/E0V7qQ758TDctW6CuyMe0dSQrnLRTCcA8CaC61tZjVNoYN3quxBxAYwhvLJqSex8S/e6GJGY0WDAh4A/glvIknxrC0WABOljd/OCyHqF54P2T/ARWrcjxqMrMOOZu0NHc1dpeH68oD7apy0InFywf3SjNXmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=On8KzBfZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="On8KzBfZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6347AC2BCB3;
	Tue, 26 May 2026 02:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779761386;
	bh=ZBiADtqd8YlbeRxp67vWcMx5hT8HmfCfD/xcharnfAo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=On8KzBfZdM98TWP8HJFa3sO9nSFYuhEDd4R5HJdpvAaocpSXofbFPzUNmsz2pH2el
	 YwRuBBUZbpk0615UBzMgPKbF/Il0SA/oviONcrRBTe47s/i5dieSZPvjVwBbJJH83z
	 LronoYv8lMLvuRR4Ns6OyVB4qEk8K+l3gvKyWF1iOfTuaIPSxQ1rCIiwzmzsY0UNLp
	 CtRRTy8Y5MBC+vi9KQrAbV0iAFqb1IW4cr4klnRtPlTQXMO/rYhewxSCHE7puMTsb3
	 vWV9DCFzd3OInEOAHQw84UqFHXjyhMgkXZdZWa1ab+meGQL6fLqd/rMWIzKHYtpO4C
	 5NfcJoyY9skUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49790CD5BD0;
	Tue, 26 May 2026 02:09:46 +0000 (UTC)
From: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>
Date: Tue, 26 May 2026 09:50:29 +0800
Subject: [PATCH] nfc: nxp-nci: treat -ENXIO in IRQ thread as no data
 available
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-nfc-nxp-nci-treat-enxio-as-no-data-available-yet-v1-1-305bb11b9147@amd.com>
X-B4-Tracking: v=1; b=H4sIAGT8FGoC/x3NywqDMBBG4VeRrPtDTLG3VyldjOPYDshEkiAp4
 rs3dPltztldlqSS3aPbXZJNs0Zr6E+d4w/ZW6BTsws+XPwQPGxmWF1hrChJqECsagRlWMREhUA
 b6ULjIvhKATH35+EWxjtfXcuuSWat/+XzdRw/n6zVDYIAAAA=
X-Change-ID: 20260520-nfc-nxp-nci-treat-enxio-as-no-data-available-yet-acc13582b9c7
To: David Heidelberg <david+nfc@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org, 
 carl.lee@amd.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779760230; l=1735;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=1ZJQP4AB1kE0xU7kjZUMkXjaZv6GrF/sYeABGXqI9i0=;
 b=uMq5mPbkyw9Aay6onfye0xUPFUU+XOQbl54U4yv+BMr2L6j6jZdbqishmammC0IZQfj9tntgB
 sHZ0jhUyQ/MBIcmX2A4qiyxRQZfuJY6Dmj6eVZxXYKEnnv0XJsjlBNv
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-Endpoint-Received: by B4 Relay for carl.lee@amd.com/20260203 with
 auth_id=623
X-Original-From: Carl Lee <carl.lee@amd.com>
Reply-To: carl.lee@amd.com

From: Carl Lee <carl.lee@amd.com>

The I2C read operation in the IRQ thread may return -ENXIO
when the controller has not yet provided data after asserting IRQ.

IRQ assertion does not guarantee that data is immediately
available on the I2C bus. In such cases, the read request may
be NACKed, resulting in -ENXIO.

Treat this condition as "no data available yet" and log it at
debug level instead of reporting it as a read failure.

This avoids misleading error messages during normal operation.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
Repeated -ENXIO read errors were observed during normal NFC
operation. This appears to happen when reads are performed
before data becomes available after IRQ assertion.

Handle this case as "no data available yet" and avoid
reporting it as an error.
---
 drivers/nfc/nxp-nci/i2c.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
index a6c08175d9dd..1d9d7d6fd542 100644
--- a/drivers/nfc/nxp-nci/i2c.c
+++ b/drivers/nfc/nxp-nci/i2c.c
@@ -231,6 +231,14 @@ static irqreturn_t nxp_nci_i2c_irq_thread_fn(int irq, void *phy_id)
 		if (info->mode == NXP_NCI_MODE_FW)
 			nxp_nci_fw_recv_frame(phy->ndev, NULL);
 	}
+	if (r == -ENXIO) {
+		/*
+		 * -ENXIO may occur if the controller has not yet
+		 * provided data after asserting IRQ.
+		 */
+		dev_dbg(&client->dev, "No data available yet\n");
+		goto exit_irq_handled;
+	}
 	if (r < 0) {
 		nfc_err(&client->dev, "Read failed with error %d\n", r);
 		goto exit_irq_handled;

---
base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
change-id: 20260520-nfc-nxp-nci-treat-enxio-as-no-data-available-yet-acc13582b9c7

Best regards,
-- 
Carl Lee <carl.lee@amd.com>


