Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF4E28469B
	for <oe-linux-nfc@lists.linux.dev>; Fri,  3 Jul 2026 15:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093661; cv=none; b=QH493+OfYKjN3ewBD7/v7HedFxj0B7LKg+VJTY55NO4Y6mdJ6c1y5hxQeKXjYHyYfozAeLAuSLYOgxoAFwQ5BHuOuEfeEIZgXLPuEUXcn/RxnloXSqQgtVs74ju/fnLkgN1bTJ6p4QKZDJ1Imql/Z8J3gF/yYvIkBXv2CEtu0O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093661; c=relaxed/simple;
	bh=vA6tDoj6QyK9mUVQvMCcpMGmBDhfZmtLxM3fAEHl9cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oE7Lw/bkpVd3OEZ/8klxLVr7r7z4M3Gso6HT0DEls2Kz1C3BdUZoi6oobu2lm48WVlSspc0tlf9gq1P0Fd8wWEBh91dKobgr0/1S4nul2p643mBHsdIDYLwJdQivR/HFA5YyoF67q9LxjvYmFTNvQ9eKKinyvL+N3mvpcGkjsRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kp8BEb9M; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kp8BEb9M"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso2648455e9.1
        for <oe-linux-nfc@lists.linux.dev>; Fri, 03 Jul 2026 08:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783093658; x=1783698458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUQqW+8IAZE2KleiROO7+tnLxWQDKkl7U0Kj9sqi+Vg=;
        b=kp8BEb9Mgoq2B1R/mYFIYKhJYzlF0RHrzJTRlUXHVA8q8IteZQgeXg8Aegv2bglY8T
         wJl8IbKgeJVIQLo7gPW+JmiT5wCebjQS2ob0XcAPjGo9ELgw0Xtu0AtEVlWhYhwnlVis
         u4cgU5Qk0l+o1Mpes2BjzECB84Vp51KpMxRHC/kdUyKQVTpjAmAFwrWvyAFCKKAm0XSC
         22JIYguUk+z56QfJNrb7sxsiHB+zxwioheoQwa7uMvAA/94mEor8BVhStl+z5YYFWEzL
         6gnI+cxr2YYd82loy/H4i4HMvMHIozBYbTLdUyQZN7Yu+vySW/QgqtrjbPhHx0iIx2Uj
         T74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093658; x=1783698458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aUQqW+8IAZE2KleiROO7+tnLxWQDKkl7U0Kj9sqi+Vg=;
        b=s0bMqckmw2a2Uv7YhV0IvxIcs5+DsHkRE8BEvsVlAWHrCzTPIFXy2HWZ+Qa9plWrt6
         mCTupmEgpC+ierGfXwQt4spx7BCtStSGU1ZTIi9zmMVaQsajhjG7mOnKMJajD7Ckg46B
         HYPXIPZ9eQ1BjOBGEkkofQH0D02U34OmYEIqMKHMgV0dqwPEJ5QdA9MVAVZvEIz4Me+1
         EMRBU1Iz67xCwV2LY4K+ZA3K0oiTkILfzDLUdwmN6c6xHoC9+uzTgvt45qDozPGbgPHU
         xRIQfmng4oDNrURekvYiiryZ6Jij86fAyZPRNBjd106K6KqM77/uCQPe1+3lioyTVAv2
         ODYQ==
X-Gm-Message-State: AOJu0YwpQBlL8tWHboOjTpixbTucAX5YpUBhQX6MxvASrEnnnuU/moYO
	gnQ7DYqOfXlnuc06ieW2uQYj8LJkryO6BDgXK57zp2Zt9gQZNbFC8NS2wQuwvvKotk4=
X-Gm-Gg: AfdE7clAI5hOnETViZ6Qob7rm1Z37a68OdT6uuzpc42kq17Wg2eAMkelq/gkAj0zQfo
	hhHaR8JRnII+gv/LIWK3S7AID0d8CaPNl26YXNaFn+BFdXKq/1RUIZdl2/iXqGGtuSxwrWYLcAX
	fO2ezWWHERoM7RxG2NPLeHI/Isvzh0a74OAQIUshjU5CcnwcZ8hqICW18V3ZNsVLeoXiX7aLkk5
	Nn1SGtfFQX70HlNyTtTw0+aVR8oFYezt5KY49vYb3D02oh+AIyFN9c/HRdp2Nf4rA9KN84GLfD9
	0wO6WG0GZXfDUqSOEdWygOb0A0JICbm2sQGRCp6mX+b9FDZkkARFDw50XUz3sC1YpjBAGDlHQkg
	mdUc8dj28vvpAqvZp2BKLhQGTnC4SSmqCR7YA9/4a/VxLEBBpwFYboYx6ihcFqpcxInDr9J9X7M
	yRfeHPew07Kvlc7M7eEOKVRrBbR2Lbr4eDdJaGBDNVwEk4Nrv3goXyGjflAXi1vSXJuodxtwken
	tza
X-Received: by 2002:a05:600c:4e4f:b0:492:3e44:214b with SMTP id 5b1f17b1804b1-493d0f17e23mr4574385e9.13.1783093658490;
        Fri, 03 Jul 2026 08:47:38 -0700 (PDT)
Received: from localhost (p200300f65f47db0472e4f1e98703de96.dip0.t-ipconnect.de. [2003:f6:5f47:db04:72e4:f1e9:8703:de96])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c637bc21sm227300115e9.7.2026.07.03.08.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:47:38 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: David Heidelberg <david@ixit.cz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/12] nfc: Drop unused assignment of acpi_device_id driver data
Date: Fri,  3 Jul 2026 17:46:16 +0200
Message-ID:  <c77f6376214001297f28d3ec48f0a853985f1847.1783091699.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=vA6tDoj6QyK9mUVQvMCcpMGmBDhfZmtLxM3fAEHl9cs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqR9lWhpAJsEzKR3yULO6auEkdVIY01o0AxnfTG 99YjqISIQeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakfZVgAKCRCPgPtYfRL+ TpDEB/wI/IHZyXSnQUF55e84yH4M2BJdhY/CsKbB20MgaTlBahDCq2JGHTCOWr4fYEgTAiMppTK mtcWajt4u3+T+sOKKV/hW9IwZ2aNLyxF5Y/9WrdlK2EJBM4n43XvPGp0/4KZo7ohpAJ5EAfuCP2 0vW9Q7+k+bqjLjHkB+3EEdKOrR8gnVm7j4KD6hschsEdah8NjY3yRBOcWIwPy/d0TRvB6v4JCSE 4AD1Y++GnhByRGKe0prsMMVvW1KrgonUsofGWIHo+lRBccaLjZ6onJGGsUoERn1r0hQzdWH77Kj //P5jeufBEywuOIxHBLxINyF+NieY34PHVrAO1yr2Hz9Ab9u
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
acpi_device_id to zero without relying on that value. Drop these
unused assignments.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/nfc/fdp/i2c.c      | 2 +-
 drivers/nfc/pn544/i2c.c    | 3 +--
 drivers/nfc/st-nci/spi.c   | 2 +-
 drivers/nfc/st21nfca/i2c.c | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
index c1896a1d978c..9d589b388432 100644
--- a/drivers/nfc/fdp/i2c.c
+++ b/drivers/nfc/fdp/i2c.c
@@ -349,7 +349,7 @@ static void fdp_nci_i2c_remove(struct i2c_client *client)
 }
 
 static const struct acpi_device_id fdp_nci_i2c_acpi_match[] = {
-	{"INT339A", 0},
+	{ "INT339A" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, fdp_nci_i2c_acpi_match);
diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index 419b014d232e..66d070b18b4d 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -51,10 +51,9 @@ static const struct i2c_device_id pn544_hci_i2c_id_table[] = {
 MODULE_DEVICE_TABLE(i2c, pn544_hci_i2c_id_table);
 
 static const struct acpi_device_id pn544_hci_i2c_acpi_match[] = {
-	{"NXP5440", 0},
+	{ "NXP5440" },
 	{}
 };
-
 MODULE_DEVICE_TABLE(acpi, pn544_hci_i2c_acpi_match);
 
 #define PN544_HCI_I2C_DRIVER_NAME "pn544_hci_i2c"
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index 42f5f477e807..c94d67f33184 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -278,7 +278,7 @@ static struct spi_device_id st_nci_spi_id_table[] = {
 MODULE_DEVICE_TABLE(spi, st_nci_spi_id_table);
 
 static const struct acpi_device_id st_nci_spi_acpi_match[] = {
-	{"SMO2101", 0},
+	{ "SMO2101" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, st_nci_spi_acpi_match);
diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index 577434df5ff3..d6cb74a89f93 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -578,7 +578,7 @@ static const struct i2c_device_id st21nfca_hci_i2c_id_table[] = {
 MODULE_DEVICE_TABLE(i2c, st21nfca_hci_i2c_id_table);
 
 static const struct acpi_device_id st21nfca_hci_i2c_acpi_match[] = {
-	{"SMO2100", 0},
+	{ "SMO2100" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, st21nfca_hci_i2c_acpi_match);
-- 
2.55.0.11.g153666a7d9bb

