Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E01A2C11F3
	for <oe-linux-nfc@lists.linux.dev>; Fri,  3 Jul 2026 15:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093670; cv=none; b=BdGUUlgUjbqx5foGwGiyX7ITX23QUw1bY/fXaMacEK3M7L9NdnN/KVrpkGoh9VzmR+FODj4KBRZw4Sdx5cjljZOq/Yc0Wa8sKuMXnDL6xwgpELK2YbIp/TKpL0rrDXmvAhi/I5zZyObUUK8wkAZT6sSj4Tp7Qvdt46w2bfJHF48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093670; c=relaxed/simple;
	bh=4RfI5PQzdlJp5SSDIXdOGzF9MK8F0YdVzMlT5vViNdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LVwxE4yNmBPa7SIzWgh5R1l7exbq27TzhDPBTqzgO9RkGS3L8fi/hSLrX92PLtMCvxwlT5GhpkhMJQ5A5CBI74QRkbR6u3XVQeIwwCZN9Hl6oU67Ll8cAXgsVEONLieUKH8sVT85Z7A1NcpD+XSUjFFTSnfdktj/ZqFUA4HDmnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dqdhVVIE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dqdhVVIE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so5520385e9.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 03 Jul 2026 08:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783093668; x=1783698468; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FS4+nxD6byAOtlaenyC1bAp6p0e5dRpJe+n2ndVLOqw=;
        b=dqdhVVIEmxEqiA7hq9nuPa/nEaa0+Jf1L6F41gCKB/CWJ5Nzrg3xwo76248wQhCo+V
         BdGE1Br0n+jujD3sjblKH6RnHCQHTFPCsHIyqIfXjkJ7d/U8Cx3j8CR/2ytamBuYt+8d
         V0XoHohARuaIqx3vE7OaQP2VyYagg92gKhEUZbweTTu8iwIPjWNfG5Lpj8sIQq76eNOa
         4enkNZdfLGEvS1U4oq74TzbU4UlfG1Xc6BR7Ui06WF0PdXFVkMU8EPXbrk0Ch2G4BILp
         GJ7vMj1JKDDQ+YQLyKLFXnbxxILJlKLlzzF9YVg+mpei3MhG36aVa72F5GkmGWytxfHx
         agsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093668; x=1783698468;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FS4+nxD6byAOtlaenyC1bAp6p0e5dRpJe+n2ndVLOqw=;
        b=FQnPUSFIA8UgLp9l0tRl9fIHzJb7GDnPes8oo4qCmufv0a1Fq4B1bVtwhfaNQKYmDc
         d5l4WKOprwJE5WHjHnx18Fj2WG0LqMeCrWMkJZGwE/Sb3hYHcRK9Qv4TTLR/bSWtkKV9
         RK7q+030IviieD8IzgaxYglpzdq33179fZkMoCoB0VvM1nw3w6xX4vSG25y//D02VeUh
         s0QtU9KOyllFF4kz3JtcR/fj4ZcubGxYbM1Ibr77NdOcLs2FljLiieMfzYtnnAVK1eAa
         3JCXruKQqziOiEAGikMIOkModnQ7plnCup42T5XE1jZzqRFfQPvmBcfNAzponkX/Cogq
         CARA==
X-Gm-Message-State: AOJu0YwQHbS9zydK+vZfih+HawNVMyvvi9Thv0X+V92oOmGKVYdn0xKk
	PC0jiRLoH4SSPnILGNuraPwITgjLn5T1dIfjLdVJQmSgkbkBF8DTS0N8xk9BP0wZOBQ=
X-Gm-Gg: AfdE7cns6bEL3S+u3bq4ph/Yu4gCyU3TXnTVgCkBEwtD9xy84aSwgx6gb2l0kZ0rLJT
	gKAFX2b6FF/NeL6FwxIOeB2fcOwHgjp/ashnBNaCXGUNfi2oxstP94hbaOkPFOmhEN+exFNndmB
	5XnYVBmcTRoPGDNT4NChJhmiiyWYYetg0tnKzEl3Ha+ExGVWJ1aNzD4KoEY0N61xgA9r6jIk1lD
	krKTmyOmlWxfSaNZSePPTHYT0UmWv0qLqcWSkqOPLVwCF+v/y8+KBow9+Bwnc2gzsBRHDHbdloA
	eonpE38y4bM0eV1hSCtFaeNGBgPBmQ4vJpfD4+O8KNh/n2U1HZT9RSOYO6HIJXfU5IjhrOnPEF+
	YTnnANvytANzUg04KUCknkFrESHY52EzhgS8YsiE1h2I9ylEEUDaItoOJj6RCruR1fGssNWstC2
	lZVxYXH2sjk/O9PZ1WGYrQHuRITtq8TxxtSikFzCMVhgScwIUJ39M+g69591D6MQIlMoKSR4lkD
	4Qm
X-Received: by 2002:a05:600c:528b:b0:492:5145:f054 with SMTP id 5b1f17b1804b1-493d0f38d22mr4921825e9.26.1783093667647;
        Fri, 03 Jul 2026 08:47:47 -0700 (PDT)
Received: from localhost (p200300f65f47db0472e4f1e98703de96.dip0.t-ipconnect.de. [2003:f6:5f47:db04:72e4:f1e9:8703:de96])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c63ba971sm218684255e9.13.2026.07.03.08.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:47:47 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: David Heidelberg <david@ixit.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Greer <mgreer@animalcreek.com>,
	Carl Lee <carl.lee@amd.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v1 08/12] nfc: Unify style of of_device_id arrays
Date: Fri,  3 Jul 2026 17:46:22 +0200
Message-ID:  <583375dcd834f5edf6241b09cdd75ad4f32af668.1783091699.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7781; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=4RfI5PQzdlJp5SSDIXdOGzF9MK8F0YdVzMlT5vViNdU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqR9llSw/kj+UO60OMjmzXCwsC9LOyZKPVsIoSm K0PkfP0qtSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakfZZQAKCRCPgPtYfRL+ ToYpB/9oTXSjWZS6cfv2Qjv7mMzYXh2n7XCFASuB+rs8f1wljm2T2H9a3fgwXM9OUkmlflTD0VW vI7IQgnJwVvA0w1yHuAmlfKSoaYjPrvcufF8y2FshNtL1PFBK2ZUtr/TiZCWKPtjNEdj4ELo5l3 4bM85u7PKiv7hP0OQ9jkBTWudWqwZmhca/Wl+MgdpnvMb3VexwwwaqvIekwMh78rnTTMbeHQ+Yj TxrHvaU1TZNJ7cNsHy0+sLTa5sYCe9+NOCdiNERPExV3JqndeZrjim1zrZ14pSGYWj1uU7FCaUp jJS2Vh0+KRH/Sw65cxn61nsAKnxUIxAsX1ldS6cBwnykIw0e
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The most common style treewide is:

 - A single space in the list terminator and no trailing ,
 - No comma after a named initializers iff the closing } is on the same
   line

Adapt the of_device_id arrays accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/nfc/nfcmrvl/i2c.c  | 4 ++--
 drivers/nfc/nfcmrvl/spi.c  | 4 ++--
 drivers/nfc/nxp-nci/i2c.c  | 4 ++--
 drivers/nfc/pn533/i2c.c    | 8 ++++----
 drivers/nfc/pn533/uart.c   | 4 ++--
 drivers/nfc/pn544/i2c.c    | 4 ++--
 drivers/nfc/s3fwrn5/i2c.c  | 4 ++--
 drivers/nfc/s3fwrn5/uart.c | 4 ++--
 drivers/nfc/st-nci/i2c.c   | 8 ++++----
 drivers/nfc/st-nci/spi.c   | 4 ++--
 drivers/nfc/st21nfca/i2c.c | 6 +++---
 drivers/nfc/st95hf/core.c  | 2 +-
 drivers/nfc/trf7970a.c     | 5 ++---
 13 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
index 687d2979b881..068c5d278a35 100644
--- a/drivers/nfc/nfcmrvl/i2c.c
+++ b/drivers/nfc/nfcmrvl/i2c.c
@@ -246,8 +246,8 @@ static void nfcmrvl_i2c_remove(struct i2c_client *client)
 
 
 static const struct of_device_id of_nfcmrvl_i2c_match[] = {
-	{ .compatible = "marvell,nfc-i2c", },
-	{},
+	{ .compatible = "marvell,nfc-i2c" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_nfcmrvl_i2c_match);
 
diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index 8dd71fed8493..34842ecc4a05 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -182,8 +182,8 @@ static void nfcmrvl_spi_remove(struct spi_device *spi)
 }
 
 static const struct of_device_id of_nfcmrvl_spi_match[] = {
-	{ .compatible = "marvell,nfc-spi", },
-	{},
+	{ .compatible = "marvell,nfc-spi" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_nfcmrvl_spi_match);
 
diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
index 39b43f8f3bf0..d424452934ec 100644
--- a/drivers/nfc/nxp-nci/i2c.c
+++ b/drivers/nfc/nxp-nci/i2c.c
@@ -355,8 +355,8 @@ static const struct i2c_device_id nxp_nci_i2c_id_table[] = {
 MODULE_DEVICE_TABLE(i2c, nxp_nci_i2c_id_table);
 
 static const struct of_device_id of_nxp_nci_i2c_match[] = {
-	{ .compatible = "nxp,nxp-nci-i2c", },
-	{}
+	{ .compatible = "nxp,nxp-nci-i2c" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_nxp_nci_i2c_match);
 
diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
index 2128083f0297..66d201c14a40 100644
--- a/drivers/nfc/pn533/i2c.c
+++ b/drivers/nfc/pn533/i2c.c
@@ -237,14 +237,14 @@ static void pn533_i2c_remove(struct i2c_client *client)
 }
 
 static const struct of_device_id of_pn533_i2c_match[] = {
-	{ .compatible = "nxp,pn532", },
+	{ .compatible = "nxp,pn532" },
 	/*
 	 * NOTE: The use of the compatibles with the trailing "...-i2c" is
 	 * deprecated and will be removed.
 	 */
-	{ .compatible = "nxp,pn533-i2c", },
-	{ .compatible = "nxp,pn532-i2c", },
-	{},
+	{ .compatible = "nxp,pn533-i2c" },
+	{ .compatible = "nxp,pn532-i2c" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_pn533_i2c_match);
 
diff --git a/drivers/nfc/pn533/uart.c b/drivers/nfc/pn533/uart.c
index e0d67cd2ac9b..83c1ccda0af6 100644
--- a/drivers/nfc/pn533/uart.c
+++ b/drivers/nfc/pn533/uart.c
@@ -238,8 +238,8 @@ static const struct serdev_device_ops pn532_serdev_ops = {
 };
 
 static const struct of_device_id pn532_uart_of_match[] = {
-	{ .compatible = "nxp,pn532", },
-	{},
+	{ .compatible = "nxp,pn532" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, pn532_uart_of_match);
 
diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index 50907a1974cd..7fde3aefae70 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -938,8 +938,8 @@ static void pn544_hci_i2c_remove(struct i2c_client *client)
 }
 
 static const struct of_device_id of_pn544_i2c_match[] = {
-	{ .compatible = "nxp,pn544-i2c", },
-	{},
+	{ .compatible = "nxp,pn544-i2c" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_pn544_i2c_match);
 
diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index 499301a6fa3f..4ba762611711 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -211,8 +211,8 @@ static const struct i2c_device_id s3fwrn5_i2c_id_table[] = {
 MODULE_DEVICE_TABLE(i2c, s3fwrn5_i2c_id_table);
 
 static const struct of_device_id of_s3fwrn5_i2c_match[] = {
-	{ .compatible = "samsung,s3fwrn5-i2c", },
-	{}
+	{ .compatible = "samsung,s3fwrn5-i2c" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_s3fwrn5_i2c_match);
 
diff --git a/drivers/nfc/s3fwrn5/uart.c b/drivers/nfc/s3fwrn5/uart.c
index e17c599a2da5..8f142a255101 100644
--- a/drivers/nfc/s3fwrn5/uart.c
+++ b/drivers/nfc/s3fwrn5/uart.c
@@ -85,8 +85,8 @@ static const struct serdev_device_ops s3fwrn82_serdev_ops = {
 };
 
 static const struct of_device_id s3fwrn82_uart_of_match[] = {
-	{ .compatible = "samsung,s3fwrn82", },
-	{},
+	{ .compatible = "samsung,s3fwrn82" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, s3fwrn82_uart_of_match);
 
diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index ceb7d7450e47..152c20b6bb01 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -270,10 +270,10 @@ static const struct acpi_device_id st_nci_i2c_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, st_nci_i2c_acpi_match);
 
 static const struct of_device_id of_st_nci_i2c_match[] = {
-	{ .compatible = "st,st21nfcb-i2c", },
-	{ .compatible = "st,st21nfcb_i2c", },
-	{ .compatible = "st,st21nfcc-i2c", },
-	{}
+	{ .compatible = "st,st21nfcb-i2c" },
+	{ .compatible = "st,st21nfcb_i2c" },
+	{ .compatible = "st,st21nfcc-i2c" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_st_nci_i2c_match);
 
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index 8632cc0cb305..5e0b94050f90 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -284,8 +284,8 @@ static const struct acpi_device_id st_nci_spi_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, st_nci_spi_acpi_match);
 
 static const struct of_device_id of_st_nci_spi_match[] = {
-	{ .compatible = "st,st21nfcb-spi", },
-	{}
+	{ .compatible = "st,st21nfcb-spi" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_st_nci_spi_match);
 
diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index 4e70f591af55..a4c93ff7c5b0 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -584,9 +584,9 @@ static const struct acpi_device_id st21nfca_hci_i2c_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, st21nfca_hci_i2c_acpi_match);
 
 static const struct of_device_id of_st21nfca_i2c_match[] = {
-	{ .compatible = "st,st21nfca-i2c", },
-	{ .compatible = "st,st21nfca_i2c", },
-	{}
+	{ .compatible = "st,st21nfca-i2c" },
+	{ .compatible = "st,st21nfca_i2c" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_st21nfca_i2c_match);
 
diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 1ecd47c6518e..265ab10bbb61 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -1056,7 +1056,7 @@ MODULE_DEVICE_TABLE(spi, st95hf_id);
 
 static const struct of_device_id st95hf_spi_of_match[] = {
 	{ .compatible = "st,st95hf" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, st95hf_spi_of_match);
 
diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index bc01b46f461c..3802081fb8ee 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -2304,10 +2304,9 @@ static const struct dev_pm_ops trf7970a_pm_ops = {
 };
 
 static const struct of_device_id trf7970a_of_match[] = {
-	{.compatible = "ti,trf7970a",},
-	{},
+	{ .compatible = "ti,trf7970a" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(of, trf7970a_of_match);
 
 static const struct spi_device_id trf7970a_id_table[] = {
-- 
2.55.0.11.g153666a7d9bb

