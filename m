Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C855283FCF
	for <oe-linux-nfc@lists.linux.dev>; Fri,  3 Jul 2026 15:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093669; cv=none; b=DU9wnx06BFCT3U07OWtrmez5pH0QIzPXvtFtVUDEWclkwMW2JnbGpPbUgiDB3wV7shVP7tvxvu9OKHFaLKBQYXsQDA45C0P3be/s6dS8QpZaHedBsIy/1UTj9puAgSqdYLQQHdHYUAGXHCBj48VRWzrPCNbfTbhr8UHys42dG5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093669; c=relaxed/simple;
	bh=TWSNEV6HROmBG8r/fIAmoG7NoNWcNjFAZmGRLvamtZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RgpykUMgAPIe90QEWdyld849qA5wy3nv1FU3rBkPOKNfCPZoxYq53deYNx66A2Fdw0hiyHy7cj8SDujQunLoFBdw6reR7/6NK7IqAudHs/odGIOZEVohy6T4ZVnGyx5YD3Wm0/wUIRvIq0VhaKch9hBdBCV6PI/tpDsY6CqahmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BxCVJ5At; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BxCVJ5At"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b68b4643so3941645e9.0
        for <oe-linux-nfc@lists.linux.dev>; Fri, 03 Jul 2026 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783093666; x=1783698466; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A6s1jVW0tBl7XsSZdcqCAwoY/xGB4Q5j39SHmo5OdEQ=;
        b=BxCVJ5At62oW+ZULu/bmPTnCbHNs/9LyQIzFdY7qzRNtHakDvYLYUF9o7RBpD3wo2Y
         XpPQf4umgDe2QcfhUmJfg6qdmEMgdTpKY2Qr2jrYjCOLs0SVHQxyTmx+ajVldDvbqJ+n
         GGzGBmyf7QYEuTYtG1oSjIvvC6mcnPuuG+bSIj2GOUE39OgSBM9cr6ldZGnSC7E0r6/E
         atBY/ge7pxPqacULghZZL7jfFtaXDTFPF6LGzhYnONT9fhKniBAd6z8/1hD/lE4i3jPk
         dhlNpPP+5PuTyVHqe8R7NdiHCYSiQox9nuQAeTaBfraCoJ9VjsONJqCdXbuzTUHJlLMu
         e/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093666; x=1783698466;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6s1jVW0tBl7XsSZdcqCAwoY/xGB4Q5j39SHmo5OdEQ=;
        b=IlietRMf9wUc4ENkFX0gPwqF5WH1fxSsVXsKfXR+Lr4vJEzEqakks1jQ/rxcC3sI1g
         mp58J5YTmHOpAiBvUGhMaBu7MEwUnS70U5QP7B70GhijjDVw7OcsgzSiXqTh7XZmeuGR
         DTP51ejyN48E2k5BEHVbAUP7p+/jIUO4FqfVzfbzo5JIOo10BWrbbkKKM95UGGtNDZac
         jUnIXggInNijkkcTglt7nNMUeDcteDe4Gz2XZvJrseVs+1aSh5K6cG5LWC3vUHuhOjI0
         OPb4Pb3ynDHHh6jObF/CusDKkFrgWpeRRdvhRH9IpSZIzj96l+SxSSCFtNZ5lsnZkRC+
         0X9Q==
X-Gm-Message-State: AOJu0YwVLlsHoKbYJfVnykzrvengYGTdaAOatVXSPPIl5zzdxBim+zBO
	7W+ubIG/qLOk5yWWJuPMWm5UEJVrEikoyE4+wcE7cbudm/aiLSLpQ4WHZTptX9hiwko=
X-Gm-Gg: AfdE7ckyZ1j7xpcnPDweKoPS5bJWF48yAc/21JlvsrhJH0cwRT5+9u3U7ohVPmaRY1i
	HzL2CTqoa1ikd6B51qOcAnsadcEg1Q5UnkMNBDUB/e6BHAHvBCREQcdeANwjmo59xS6kumrxkEk
	fhO5mNueU2n39i0oa1v0SCj3MTCegRt8wtfpphaIcaQY4NFtNvNEFJmoeyB6jmtxW/rzxDAucRS
	ZYnrOAgEHCSvzI/YFJnivHDr5BlACTZma79gyBMG6pYpXhs5Me5Diy0y7bHD4EDl32guBt59aXn
	5LSgNfWQilu0z3Bf7IvIG8wmM1/gHcLXJmrYFu298SnkknvpBSUn/AHj2s/VDCIkMCJ1JQk8/11
	hTXKQfDLys2wN4IOK8KX74qvtA20w1xPVV5etHyVOSNAXld6rG4g1idED2OfDoFkbV+VetLJNVQ
	O3HH1DlOKRohH8+K+z8WnurvpM2sMW7IePh9e6AUpny9x6Bmq5i1dCvopIi3nWFwcZwJQ/EVKvM
	rGd
X-Received: by 2002:a05:600c:154f:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-493d0f0793amr4673825e9.4.1783093666048;
        Fri, 03 Jul 2026 08:47:46 -0700 (PDT)
Received: from localhost (p200300f65f47db0472e4f1e98703de96.dip0.t-ipconnect.de. [2003:f6:5f47:db04:72e4:f1e9:8703:de96])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493cce12c40sm96650805e9.13.2026.07.03.08.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:47:45 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: David Heidelberg <david@ixit.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Greer <mgreer@animalcreek.com>,
	Simon Horman <horms@kernel.org>,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v1 07/12] nfc: Drop __maybe_unused from of_device_id tables
Date: Fri,  3 Jul 2026 17:46:21 +0200
Message-ID:  <031ea0ae38838df3261f844eb13e9841769b49a7.1783091699.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5888; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=TWSNEV6HROmBG8r/fIAmoG7NoNWcNjFAZmGRLvamtZw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqR9ljaFLF44dumHi+7/WAE/b9IH/HX2t6ecATi Xh44elrfoyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakfZYwAKCRCPgPtYfRL+ Tky3CACt1+H9/r260UQeKogAXpy2JHC7Cz25jgaDpgYL+yZNCpeGegTX59Ul9v92LXVajQWZdjM cpzd7EO+zOfI0b50jBi6lBlW+/7XEcz3ZdIiRXu+TutvpEVzjSn6eCM6rNzO+F85aAqYp1/g7L5 63WKvg27vx4q+0HxEkGYkuC1aDofCLAPZgxtYaZxNQYyttSmjirc7RyqPWK6w8K2qsCuiAQO0Sm CJe2EoXOGOFtCDsFCcCWeLtn682K0TwUoyFVuSGtv6n0uKEY7a9IaUX/vomGAfelZd5fSj6U8rQ VfyC2GoKXB21vleviLirxhskwIBxCJjdGnQ/pG8gd1eCLgNY
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Referencing these arrays in MODULE_DEVICE_TABLE() is enough to convince
the compiler that they are used even if the drivers are built-in (since
5ab23c7923a1 ("modpost: Create modalias for builtin modules"). So the
__maybe_unused marking can be removed without introducing a compiler
warning.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/nfc/nfcmrvl/i2c.c  | 2 +-
 drivers/nfc/nfcmrvl/spi.c  | 2 +-
 drivers/nfc/pn533/i2c.c    | 2 +-
 drivers/nfc/pn544/i2c.c    | 2 +-
 drivers/nfc/s3fwrn5/i2c.c  | 2 +-
 drivers/nfc/st-nci/i2c.c   | 2 +-
 drivers/nfc/st-nci/spi.c   | 2 +-
 drivers/nfc/st21nfca/i2c.c | 2 +-
 drivers/nfc/st95hf/core.c  | 2 +-
 drivers/nfc/trf7970a.c     | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
index 66877a7d03f2..687d2979b881 100644
--- a/drivers/nfc/nfcmrvl/i2c.c
+++ b/drivers/nfc/nfcmrvl/i2c.c
@@ -245,7 +245,7 @@ static void nfcmrvl_i2c_remove(struct i2c_client *client)
 }
 
 
-static const struct of_device_id of_nfcmrvl_i2c_match[] __maybe_unused = {
+static const struct of_device_id of_nfcmrvl_i2c_match[] = {
 	{ .compatible = "marvell,nfc-i2c", },
 	{},
 };
diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index 9c8cde1250fb..8dd71fed8493 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -181,7 +181,7 @@ static void nfcmrvl_spi_remove(struct spi_device *spi)
 	nfcmrvl_nci_unregister_dev(drv_data->priv);
 }
 
-static const struct of_device_id of_nfcmrvl_spi_match[] __maybe_unused = {
+static const struct of_device_id of_nfcmrvl_spi_match[] = {
 	{ .compatible = "marvell,nfc-spi", },
 	{},
 };
diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
index 94aca9119f0f..2128083f0297 100644
--- a/drivers/nfc/pn533/i2c.c
+++ b/drivers/nfc/pn533/i2c.c
@@ -236,7 +236,7 @@ static void pn533_i2c_remove(struct i2c_client *client)
 	pn53x_common_clean(phy->priv);
 }
 
-static const struct of_device_id of_pn533_i2c_match[] __maybe_unused = {
+static const struct of_device_id of_pn533_i2c_match[] = {
 	{ .compatible = "nxp,pn532", },
 	/*
 	 * NOTE: The use of the compatibles with the trailing "...-i2c" is
diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index b731d0b02f52..50907a1974cd 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -937,7 +937,7 @@ static void pn544_hci_i2c_remove(struct i2c_client *client)
 		pn544_hci_i2c_disable(phy);
 }
 
-static const struct of_device_id of_pn544_i2c_match[] __maybe_unused = {
+static const struct of_device_id of_pn544_i2c_match[] = {
 	{ .compatible = "nxp,pn544-i2c", },
 	{},
 };
diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index e9a34d27a369..499301a6fa3f 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -210,7 +210,7 @@ static const struct i2c_device_id s3fwrn5_i2c_id_table[] = {
 };
 MODULE_DEVICE_TABLE(i2c, s3fwrn5_i2c_id_table);
 
-static const struct of_device_id of_s3fwrn5_i2c_match[] __maybe_unused = {
+static const struct of_device_id of_s3fwrn5_i2c_match[] = {
 	{ .compatible = "samsung,s3fwrn5-i2c", },
 	{}
 };
diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index f43ae8e92070..ceb7d7450e47 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -269,7 +269,7 @@ static const struct acpi_device_id st_nci_i2c_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, st_nci_i2c_acpi_match);
 
-static const struct of_device_id of_st_nci_i2c_match[] __maybe_unused = {
+static const struct of_device_id of_st_nci_i2c_match[] = {
 	{ .compatible = "st,st21nfcb-i2c", },
 	{ .compatible = "st,st21nfcb_i2c", },
 	{ .compatible = "st,st21nfcc-i2c", },
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index 9303217acd7b..8632cc0cb305 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -283,7 +283,7 @@ static const struct acpi_device_id st_nci_spi_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, st_nci_spi_acpi_match);
 
-static const struct of_device_id of_st_nci_spi_match[] __maybe_unused = {
+static const struct of_device_id of_st_nci_spi_match[] = {
 	{ .compatible = "st,st21nfcb-spi", },
 	{}
 };
diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index 13fb6f5533e0..4e70f591af55 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -583,7 +583,7 @@ static const struct acpi_device_id st21nfca_hci_i2c_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, st21nfca_hci_i2c_acpi_match);
 
-static const struct of_device_id of_st21nfca_i2c_match[] __maybe_unused = {
+static const struct of_device_id of_st21nfca_i2c_match[] = {
 	{ .compatible = "st,st21nfca-i2c", },
 	{ .compatible = "st,st21nfca_i2c", },
 	{}
diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index ffe5b4eab457..1ecd47c6518e 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -1054,7 +1054,7 @@ static const struct spi_device_id st95hf_id[] = {
 };
 MODULE_DEVICE_TABLE(spi, st95hf_id);
 
-static const struct of_device_id st95hf_spi_of_match[] __maybe_unused = {
+static const struct of_device_id st95hf_spi_of_match[] = {
 	{ .compatible = "st,st95hf" },
 	{},
 };
diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index f22e091019de..bc01b46f461c 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -2303,7 +2303,7 @@ static const struct dev_pm_ops trf7970a_pm_ops = {
 			   trf7970a_pm_runtime_resume, NULL)
 };
 
-static const struct of_device_id trf7970a_of_match[] __maybe_unused = {
+static const struct of_device_id trf7970a_of_match[] = {
 	{.compatible = "ti,trf7970a",},
 	{},
 };
-- 
2.55.0.11.g153666a7d9bb

