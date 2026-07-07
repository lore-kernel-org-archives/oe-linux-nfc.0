Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E2D32E696;
	Tue,  7 Jul 2026 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434144; cv=none; b=u7S9kZtuaRz39INVtaAxrSmo1DV1jUIkqSK/CG62bojPCd2xeJG0NODfistpWlCkRDTMis1SSq7QMOqFEJqHKHUP4zsRsL4a61nFvaP6ZQdb93aBIRmah86zNSp5y4DESJb8giwlvTb0VGcH3Ujxg7QUgJHlIT+WbseaqZhl+OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434144; c=relaxed/simple;
	bh=Y9fbFINXPgSddO9fuLVtYB3Fcb1lmHYfWCWYNi4BkEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NtLRa6iO557JKYN+iRUqQeelJQEHOKgtLOmrYScVbGevQvT01hJcT97dT5NPmslHyX8LUu07qivBtsHdWlxfQmrGsvwkJPJFgh9eXNDds1Z3OapY4uiNWZ0zkzl08EaEncDCIA4XlDwoK1BvBLnD8rtkJ0WVmaT+5Y519Jw5bkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hILSNR54; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hILSNR54"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C99C1F000E9;
	Tue,  7 Jul 2026 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783434140;
	bh=5va64subXFUyXb4IM2FICixLhbunUDUhlk6CX2v0BuQ=;
	h=From:To:Cc:Subject:Date;
	b=hILSNR546BqE0k2mujCd0tcdDWa9WpLKGt/ip3SF5Klc8roe2XWHIQH1lqo8F8NlO
	 dqpZz0yKTo54jKclkm764prO3Khi4PpJF6tj4OUO34cC0I54HJUwBTSWeLVByF6Yuh
	 qR82dQccHxlZA91cL/wSsiE7WcVkVuPMP2R56IPg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: oe-linux-nfc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	David Heidelberg <david@ixit.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] nfc: mrvl: spi: Unregister dev on allocation fail
Date: Tue,  7 Jul 2026 16:22:17 +0200
Message-ID: <2026070716-crucial-slouchy-b8a9@gregkh>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=Jq0PWYAOZT3RVLCWd0ZP/oxOWqj1eXf8Fx7STNz6HsA=; b=owGbwMvMwCRo6H6F97bub03G02pJDFm+3DOCI341cbOkeB2Yf8fe+leN0878/sqmCAWxV1VBc 3f2bJzQEcvCIMjEICumyPJlG8/R/RWHFL0MbU/DzGFlAhnCwMUpABPJucUwz9z8zqWAcmvW49tE iwp+1QsLam1UYpgrciBn963P646yzPO3z3QJ+N0klX0fAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Griffin Kroah-Hartman <griffin@kroah.com>

Call nfcmrvl_nci_unregister_dev() if nci_spi_allocate_spi() fails,
unwrapping the previous call to nfcmrvl_nci_register_dev() during the
nfcmrvl_spi_probe() function.

Assisted-by: gkh-clanker-2000
Cc: David Heidelberg <david@ixit.cz>
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/nfc/nfcmrvl/spi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index 9c8cde1250fb..dad07c8e13b8 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -168,6 +168,10 @@ static int nfcmrvl_spi_probe(struct spi_device *spi)
 
 	drv_data->nci_spi = nci_spi_allocate_spi(drv_data->spi, 0, 10,
 						 drv_data->priv->ndev);
+	if (!drv_data->nci_spi) {
+		nfcmrvl_nci_unregister_dev(drv_data->priv);
+		return -ENOMEM;
+	}
 
 	/* Init completion for slave handshake */
 	init_completion(&drv_data->handshake_completion);
-- 
2.55.0

