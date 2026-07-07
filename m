Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9D942254F;
	Tue,  7 Jul 2026 14:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434219; cv=none; b=so1Y6KEdA/XYNeMbjoeHwGXp76/q3d2X32zGjkHAeoQwHwCJUgcpmoV/JXvqPSwMypfyMoOZFfpIe2uWTkEGww0IQUrx+ntdeoyMWlo6QxYYlgCK9W5MtARln0jnwFjDtIV3BNutUmC4jPS3zD3az8HtJrk0eDDzh2QQlwW/J7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434219; c=relaxed/simple;
	bh=nCFQ347hZ0XA5rpNCe4+0nnueQ4jojMtbAtT5IAzx4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dgPVY6HOZrx4CcINR4g/s4Wj4HR8FuMFcWyjtHtOBNlJUo2kt/rrN4dQlJeyO4cimoP27q44xhpMnku1gY6Q5Dq7D/cvvPMJ6vw3z740acGDTRDrNdl2qRv3PlkPf+CvCNjFVcDKwfecIOEgLI8NxeEVhFh2a/DgVNoQeXUeno0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qcdreG5i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qcdreG5i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99EA1F000E9;
	Tue,  7 Jul 2026 14:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783434210;
	bh=d49iQ/zPG6AW20k0FZXd9H09gOXdc2kwJ1ZV4M5OjOE=;
	h=From:To:Cc:Subject:Date;
	b=qcdreG5ig5LLS8qZErVsWPw3MmLI+FT8kzGlybMtEy1JzotCaxEjeeF3XVAROxVXm
	 29tD/8Kq6Tmgkzhe1f/52VaJ30cadRqMe1m66GkN4orYyzrvVB0p3Jhh/GOOBfD4tx
	 YmsQjQpl4YLTNMVs637KVu5Xr+/yZHfWiEDUZ13Y=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: oe-linux-nfc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	David Heidelberg <david@ixit.cz>,
	Carl Lee <carl.lee@amd.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] nfc: nxp-nci: Add remove on IRQ error
Date: Tue,  7 Jul 2026 16:23:27 +0200
Message-ID: <2026070726-observer-fang-9716@gregkh>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=E2w6poSszQztN0/SICl7E/xLd3dRTWNYv0u3xHSY1ws=; b=owGbwMvMwCRo6H6F97bub03G02pJDFm+3Pdu70o6/Nf4PZ9KTv6ttzd7Am3td/D/irnIv61Jq fLuy6tfOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAilbsY5opkbiifuNvpaXZw Xu41tz+qWyrPiDLMs97bs/xswPKvX1IWHxG+5si1p2RTEwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Griffin Kroah-Hartman <griffin@kroah.com>

Add a call to nxp_nci_remove() in nxp_nci_i2c_probe() when the
request_threaded_irq() fails.
Previously, IRQ resources were not being freed upon error.

Assisted-by: gkh_clanker_2000
Cc: David Heidelberg <david@ixit.cz>
Cc: Carl Lee <carl.lee@amd.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>
Cc: "Uwe Kleine-König (The Capable Hub)" <u.kleine-koenig@baylibre.com>
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/nfc/nxp-nci/i2c.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
index faebc89a7ef5..564f38735510 100644
--- a/drivers/nfc/nxp-nci/i2c.c
+++ b/drivers/nfc/nxp-nci/i2c.c
@@ -334,8 +334,10 @@ static int nxp_nci_i2c_probe(struct i2c_client *client)
 				 nxp_nci_i2c_irq_thread_fn,
 				 irqflags | IRQF_ONESHOT,
 				 NXP_NCI_I2C_DRIVER_NAME, phy);
-	if (r < 0)
+	if (r < 0) {
 		nfc_err(&client->dev, "Unable to register IRQ handler\n");
+		nxp_nci_remove(phy->ndev);
+	}
 
 	return r;
 }
-- 
2.55.0

