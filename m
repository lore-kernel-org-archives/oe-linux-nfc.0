Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5571541F7CE;
	Tue,  7 Jul 2026 14:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434094; cv=none; b=NZBUQrZMgWDiLTUrccEpOnJV4KjYFeboLNyozEmttYbCZgtZQYh8ZmwOq3j4iiasFWIGMiNAglgZDtED/wmp19K4nTbLmtODqCoIek7Qg8SVMr0oNYfDN3VJH7Evbc+IIzIlMTkggDq0YAD4w7iKYD5SsFqTOVM8i30L69NYYwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434094; c=relaxed/simple;
	bh=xiw5StsJ7PQZPmgtbb+s1M8Wix3imuDhNiaJp0LTig4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BDeMUb2/+4ADqppDv2ivC8QyZib0DmTJ+46RJSB7Ex/YYK2etCUbTxjGu8ngAc42Z8EGcqvD1qLKxI1wfM0HZOIOpqPdvHcLxKb1inuUak/L9cawdR4+8V2+VusdSZIKUV5bmcpm3N7xn68sy3MgWcYicJ8GQ6dkq5+paQfNonk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=t5wvR904; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="t5wvR904"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790DF1F000E9;
	Tue,  7 Jul 2026 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783434093;
	bh=mHgKH8qgfosl57rt8Jb8K06QboN4E0Wdi8LGck5VH78=;
	h=From:To:Cc:Subject:Date;
	b=t5wvR904BW6XeJAho8VHzkyRWg9Wv8u9Xhqom6qR+Alr55nIEKKGlK6cO6RqZh6Bm
	 +7G1WaeRH7rwKvVxEdKF4io2oE8mDbchrnWd0qzgIcdbViEXOoI+vkp6ZhF66jrk5d
	 kT5XOu0rQPLtSmhrkVkbEWBQ9WRaCAyY5UmSaa1E=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: oe-linux-nfc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	David Heidelberg <david@ixit.cz>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] nfc: st-nci: Add error handling to IRQ handlers
Date: Tue,  7 Jul 2026 16:21:27 +0200
Message-ID: <2026070726-wiring-yield-ceca@gregkh>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=v4MXMw1I8MkCSS/lMd++8WIj9BAh1xFB0l7yfZacMVQ=; b=owGbwMvMwCRo6H6F97bub03G02pJDFm+3GldBycFvP5tyXfui2LmrZrTQrpFTZ1vZt2bt7w2b Z7qSvFPHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjAR60MMC6bvcD5utHrByZwT C2o3Zy1ae6f7KzPDgqYTf69qbrhpfimk4FRa5ERRzp2sjAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Griffin Kroah-Hartman <griffin@kroah.com>

Add ndlc_remove() to st_nci_i2c_probe() and st_nci_spi_probe() if the
devm_request_threaded_irq() function fails.  This is to properly unwind
after ndlc_probe() was called prior to this.

Assisted-by: gkh_clanker_2000
Cc: David Heidelberg <david@ixit.cz>
Cc: "Uwe Kleine-König (The Capable Hub)" <u.kleine-koenig@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/nfc/st-nci/i2c.c | 4 +++-
 drivers/nfc/st-nci/spi.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 9ae839a6f5cc..7f727d9b97ba 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -243,8 +243,10 @@ static int st_nci_i2c_probe(struct i2c_client *client)
 				st_nci_irq_thread_fn,
 				IRQF_ONESHOT,
 				ST_NCI_DRIVER_NAME, phy);
-	if (r < 0)
+	if (r < 0) {
 		nfc_err(&client->dev, "Unable to register IRQ handler\n");
+		ndlc_remove(phy->ndlc);
+	}
 
 	return r;
 }
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index 169eacc0a32a..6f1ffd8244fa 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -257,8 +257,10 @@ static int st_nci_spi_probe(struct spi_device *dev)
 				st_nci_irq_thread_fn,
 				IRQF_ONESHOT,
 				ST_NCI_SPI_DRIVER_NAME, phy);
-	if (r < 0)
+	if (r < 0) {
 		nfc_err(&dev->dev, "Unable to register IRQ handler\n");
+		ndlc_remove(phy->ndlc);
+	}
 
 	return r;
 }
-- 
2.55.0

