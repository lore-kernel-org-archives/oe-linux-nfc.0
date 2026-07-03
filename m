Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2784A233939
	for <oe-linux-nfc@lists.linux.dev>; Fri,  3 Jul 2026 15:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093666; cv=none; b=p89txnY2R0paXELYk/6pL6h6U8X0XkoGpPN3jK/xiPU8bNHt87TpEN3VD8pbxBAZLyGzVT/1p7sznhrT+5/yO4YUxrtWrsP7slhiMeyePu5IkiVb04EOMZ3W49+uctDYe6ohvVhVOdAB2cH8Ny3JRijR8v4uCAbnLWQ1mCOZsgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093666; c=relaxed/simple;
	bh=Ztbou7ZVeJMK3+Nma9DkAkAWuD0Wd8CJYWBeeZ0s+AU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ll0OnzNFktMxVYj4r7xskP7+D8bVW0Gk4RU8AdJRIj9y2j/QaZMn3Btp+Ps49n5ELDRoACSXZ0d/dKaPuYlyVWumfe/dEAiJc07bEGxnX/qdVEzvnTSklybIbVk0Ppk1ezgtKwPegcRCtzVXzwat7fTCBgpSCiyImXuie9iu0kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WQYzTbyc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WQYzTbyc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47362928f65so693134f8f.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 03 Jul 2026 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783093661; x=1783698461; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xv+KnHLSqDDKh5+EJRw+TXozIRP3/ki1fOHuVz+QRj0=;
        b=WQYzTbycGHgBPkgjWcrOr8fwFrU0mGILpfYYMx065+CvnDWvT7IKT6XSEw6E4eZvM9
         ZAPc6tRudvOwG/LMaem8c/nkank06hsfcYj9GHtOqfODx1zllTHtZWrhFnV5MurvQqIg
         hqycmuBZ3VpZqvKCm3NncQTcfN/7KnQ1WZEwEiscZh9u7F/w2HoG9QB9Dc/G50+ISi3b
         3gZ7+bX5R/GM0wzOFg1a0s3jwU2zxDm4aX/1vuXCLC0radr4PHkdP2YugUH9b4GXJINJ
         srpuQpwELI6ARaXsDfb0QCfYjMvnKY9rqx+zcq2ru+vv5VTtSJFAdfOtZ28jymo9jjdV
         PQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093661; x=1783698461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xv+KnHLSqDDKh5+EJRw+TXozIRP3/ki1fOHuVz+QRj0=;
        b=hjZeBLyH9VDIwx1OnbbrxuAgSweHFhQoKsxqK8MmUfZA9nb84noa3n3NHEl4OjqI9R
         vofpR5r0pp5CpFYD1kW8xggbQtKUT4POVcTBzUNxkBBthe7Gz3jWKZorrFvM4OhUejqm
         sYpiVZmF5qDFHKDaHHVL1UajWjAiD05GzSn2kb85DKBXa8/3gv/fNQBBdhWKKWEDWtjT
         IqczzoHbmRT1xwkpmVoSNhg6K3BmuMLV98B/ADOOP1IsEcgczt159rX/WwD6BrBgYBND
         4TmMX0fvWBaJUqFlTfJ9viPbZ+vJJ//DUagylewGwphLSrq5avSXk4OpuwudT4d+FYOF
         0FSA==
X-Gm-Message-State: AOJu0YxhmmXWcagpoeCN6FqkxniRqdToPde74nIvkuke5GoWM6oDZVJl
	L468rIMlhliqPvmJmPcr/UF1rOROkK1SKHLksy33gYLwnK1Q8xzCBuV+7m78Qw/dc0E=
X-Gm-Gg: AfdE7cnZd37SSkDPrZlDDhDXrWVlXp8vmLILWyOW5bOzC/cDNBep10cgg1mFS29LOUg
	S8MWo3ePc9P8r/HXLfEgik+QNaVq7YbFYQyXzI8IMTAafjQM++2ChXJzbVggWES9eO6/w++7Z6p
	p9aDvlhFTDYHxlfa7RWSKCmaPgX6zyVCWU+thZzPO/aqCcLZqHXmIn1uivwJVoacLBuDajF0Ald
	UriMvLwG45VhlquZtAVJ1QIYMw1c0231SA2/ZdnsDosF/6BzjPYGfIH/oSs7D5trysJaG3CbzCQ
	EQlnwq/4M4MFg0hQv5jDUDjp+EIOXT/WoFds03MwcAtoWr2kqXdRhos/lIfW669p1Fa8Nj54++j
	86vpRR0vdjLcR24olGU/KC/+snISQ47i1ty/W/gt2jeDnJ6x1MI3JAnXyD3XeOfNOlm6A1i35+f
	wjaALgjQQZM8kSnQ+eBfMijyXyXYDvL7D2aujsUHQgFV+xnf04nK50oNcipkQTO5yK2N+8f9jdY
	Tbb
X-Received: by 2002:a05:6000:2689:b0:472:d857:5d39 with SMTP id ffacd0b85a97d-477570d4061mr15666507f8f.0.1783093661579;
        Fri, 03 Jul 2026 08:47:41 -0700 (PDT)
Received: from localhost (p200300f65f47db0472e4f1e98703de96.dip0.t-ipconnect.de. [2003:f6:5f47:db04:72e4:f1e9:8703:de96])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960af0sm195037f8f.30.2026.07.03.08.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:47:40 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: David Heidelberg <david@ixit.cz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Tomasz Unger <tomasz.unger@yahoo.pl>,
	Simon Horman <horms@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/12] nfc: Unify style of acpi_device_id arrays
Date: Fri,  3 Jul 2026 17:46:18 +0200
Message-ID:  <30cd94a6821917f16daffdce5fabf145432c13eb.1783091699.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2603; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Ztbou7ZVeJMK3+Nma9DkAkAWuD0Wd8CJYWBeeZ0s+AU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqR9lbHnirMC22bR92RZqgPVyd86F68kxfaGB6C 1wEOkxTv3uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakfZWwAKCRCPgPtYfRL+ Tns2B/4u60UUnK5rK+R2ZzkO1tDg/QMbQw+3R2T3GpL3jsOeqoac6QKlYAYjdckltubjAummIc+ yF6Wfa3xEB2tUrxn4XNJgVqEaakLhsezLZq9ik+LMW6aNItdhSNeaqI5sbDHhIQF1IFS77SCsAc HSrhbgmUV7WJ1V0FLKDA9V35udQJqS8M0EkKQopPKP3Ep7PzNOOu0tmDYjEZm4BhFJ/2KQdvkCm exwQZxv8eDwdEGTlCiGzW3y8fPUQQraIbIA9iLGTcsbYLEXZ5bn0wJow9g4cIYSSYrb3lFoVMq1 jIzRZxWMgbUmgggO4eab+9SURTynSpG5ySluXUsldjvKdr22
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Unify the style of the list terminator in acpi_device_id arrays, that is
use a single space between { and }. This is the most common and
generally recommended style for these.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/nfc/fdp/i2c.c      | 2 +-
 drivers/nfc/pn544/i2c.c    | 2 +-
 drivers/nfc/st-nci/i2c.c   | 2 +-
 drivers/nfc/st-nci/spi.c   | 2 +-
 drivers/nfc/st21nfca/i2c.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
index 47f3838ac9d4..13d4387e79a0 100644
--- a/drivers/nfc/fdp/i2c.c
+++ b/drivers/nfc/fdp/i2c.c
@@ -350,7 +350,7 @@ static void fdp_nci_i2c_remove(struct i2c_client *client)
 
 static const struct acpi_device_id fdp_nci_i2c_acpi_match[] = {
 	{ .id = "INT339A" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, fdp_nci_i2c_acpi_match);
 
diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index ccca07eb828c..9ed1cde1de2e 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -52,7 +52,7 @@ MODULE_DEVICE_TABLE(i2c, pn544_hci_i2c_id_table);
 
 static const struct acpi_device_id pn544_hci_i2c_acpi_match[] = {
 	{ .id = "NXP5440" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, pn544_hci_i2c_acpi_match);
 
diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 3906a806ec8b..f43ae8e92070 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -265,7 +265,7 @@ MODULE_DEVICE_TABLE(i2c, st_nci_i2c_id_table);
 static const struct acpi_device_id st_nci_i2c_acpi_match[] = {
 	{ .id = "SMO2101" },
 	{ .id = "SMO2102" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, st_nci_i2c_acpi_match);
 
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index 8fc60a972d98..9303217acd7b 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -279,7 +279,7 @@ MODULE_DEVICE_TABLE(spi, st_nci_spi_id_table);
 
 static const struct acpi_device_id st_nci_spi_acpi_match[] = {
 	{ .id = "SMO2101" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, st_nci_spi_acpi_match);
 
diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index e5109f701795..13fb6f5533e0 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -579,7 +579,7 @@ MODULE_DEVICE_TABLE(i2c, st21nfca_hci_i2c_id_table);
 
 static const struct acpi_device_id st21nfca_hci_i2c_acpi_match[] = {
 	{ .id = "SMO2100" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, st21nfca_hci_i2c_acpi_match);
 
-- 
2.55.0.11.g153666a7d9bb

