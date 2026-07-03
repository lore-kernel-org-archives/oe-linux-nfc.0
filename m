Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CAB2C21C4
	for <oe-linux-nfc@lists.linux.dev>; Fri,  3 Jul 2026 15:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093667; cv=none; b=l3V9v/5/CBEUm7znHCxx7KxofHWq/kc4tZQfwX0HJ8C4mVP4jUHSXaQSDtR/kiZ3ne7i+lpS+G/Zn+1VnlK0LXdgqAfGW9QCj0cIPtrcOcXBKxFI2/QK96Sz9jiGNmfqo9z/3SeIVuMdPRGFzdZqDb+dOAk7x4xh1XXDuffyTlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093667; c=relaxed/simple;
	bh=oxcRHJulWLW8FSGmOJ5k7+eMU+osS4+4kNAD7nhVgdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YapHKXUqEgVY18uLhLcbwpgWZFyTuz142glX8VRXuGoRzPTSMhSvi2hBy+06+Kgy+LqTJpJU3q4iKND+uketE5ezHNSl2CQ8bjXrYfTE7rorWX6Bjq+zwHXCLi8YecfXLpSaqDYjHxU7YD0gvBjpxmjDKSUhfMz4nigK6ISn9Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZdN9O7NJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZdN9O7NJ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b966dd74so2784315e9.3
        for <oe-linux-nfc@lists.linux.dev>; Fri, 03 Jul 2026 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783093661; x=1783698461; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n80SmZNEKtQEMsC+lFQN3Kpxk5VqkI3Wv02hUUqzIjw=;
        b=ZdN9O7NJ9QU7p+pnIgUJ7bTmKDDsbWC/H6l7wlrnJMxwnJ4kxo8YG5ChHab4IVY1QF
         D8WGqeO36Pb1JjwqBsf9GAlsCffTTOiCeucjSjwMmSlVI650U3sm4A2r/dZhWqj+l2tm
         WC8/y7J2mCLOV32xtPvQxPoLAGRyXdcAc43wvX0NQhyXulGllav0zMKP8y7LXCcUFpnH
         R2Csi26IiYYOrsS/ouqR38zjfQ9iOAgdwCIAReJOae9n3tyUoQ2W4QqlXAyEfmNnrMNL
         lICyMFGseKEoGQFi0digA6SzZVbjELBUyq4dq02wVNseLdwlBVar11alwj+58R+EmGZG
         Q3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093661; x=1783698461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n80SmZNEKtQEMsC+lFQN3Kpxk5VqkI3Wv02hUUqzIjw=;
        b=HzKrlsqtTvFAxuZK01/3bxO1KUak88BhPBaD3SF9cDOfYqCALLCfiU8rK9cN9YVbf6
         i9If6yf/jSG9/yDgfFSq9dU20yazO2WqOG4niU8PKVKh99MFkEEcJ+68BCo3UPvS0Ui+
         Qy1cfgyQpiiR8xBRXrb0tixlqmIA/yYBNj3JHUrd8azN0k5IQwFPq/EJW5vB+dw5+GrS
         AJZPhHVFU/K+wg2OJZpn+YT2XhOAl8nocy4suTKTB2QZE0COLL5zA1vbbw8XTw75nM+F
         xXXzaR6+3bgQX69f8f9YxU56l3XTqmCwl7Y0ahFjhSYYZfWRRUbrcX9NwtyeIOyE1y5u
         cLVA==
X-Gm-Message-State: AOJu0YyW7nyvH6wMuOeRCJ857ntozuAyDlVSluHE7JgMFEz5NkEil6YZ
	lm7XqlFfCMhAj1NicMaOQzgponACr5bGoP4XI2DEf3boLs2h0TzWPrOnwejtyO+Zh3c=
X-Gm-Gg: AfdE7cmOpFFZoduwENH+rcsg4VO4rkyQ3AvJgziOsXvREQir3LysqU3lx24i2yXNLr3
	9INPNIjwqPnsbGn8177nNTufcPA2AyWnroIq9WcjFL2O0iJ5JQopkXy4vpRsOiGMso06GV7gnWC
	iwHkfYCD9Td34eyqzGap4oNi9nWgbXDaBF4UD73y4I99fcC1FYONvkI+qGbASzcLzWcH9FtZsvc
	5PfyYe1Qq7ZZEfms9TxidDZTWZHMXPBAyCz/S7No4pHa/wp31NvdixxqgWQ5CrJUFG6Y6mkJiEt
	Ab3S94D4iiX9033Ae5D+M0angeM7EeBENbJQILVGjXeC9bCtZQxeGu5Ie9AjTn1H5OT6TP2hyMu
	LsB9JpAkd15GPhHK4gZr5EY2yCBEZKP65lDXfDdRmK1dxHevIgJtZZeeoXEIbF6U0tkJyBNoMGh
	DEz4CMJ6EXP3xJjOlUhnelmfbWKweuZKyiXPaSeyrI9WV5Msf0H3LvWW9iC0LaFgekvQojzuhqn
	kcL
X-Received: by 2002:a05:600c:2115:b0:493:caad:2b7d with SMTP id 5b1f17b1804b1-493d0f0ff4amr3573535e9.16.1783093659927;
        Fri, 03 Jul 2026 08:47:39 -0700 (PDT)
Received: from localhost (p200300f65f47db0472e4f1e98703de96.dip0.t-ipconnect.de. [2003:f6:5f47:db04:72e4:f1e9:8703:de96])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c636ec8asm119817345e9.1.2026.07.03.08.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:47:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: David Heidelberg <david@ixit.cz>,
	Carl Lee <carl.lee@amd.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/12] nfc: Initialize acpi_device_id arrays using member names
Date: Fri,  3 Jul 2026 17:46:17 +0200
Message-ID:  <5f60cd3e9831aac3995ed1a1b074ca1ae32e5286.1783091699.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3823; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=oxcRHJulWLW8FSGmOJ5k7+eMU+osS4+4kNAD7nhVgdI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqR9lZErd7JkLfAAvSP8Kpw/HRlaUBft066XUcY quiukrerMaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakfZWQAKCRCPgPtYfRL+ TrQCB/9FRrWSAfewieROmDrkYsSB2/pJxYrrbZdIWCf03pan037ZF1op4BRQo9+sdB+KK1YiZEV XT/YhQ+05+S1L9CXLzYFQjn6akXbufKOZxOd0uCMFZJI87UtOAjBH+5qjjThrMNXxHrLIyG5OYP qK3b4bqYGvoc3hrO4EIZ75qrw7iD4JXRUyfGTV1QYzzWUBNTmsyZ6cLWK/2X1P+xbq+Dc4RHwIP GUkQDHas7NSGr/KRx0MMqyfQHiuiW+QMS+qV8vX4GVad6cio3SIyRQZrQVEvUjx4wk8Oh42NQV1 jYUO/YbF9B9WSzW1ujVWRYzBNyX3HkS6o1m/KBpRbqcLTAm/
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
acpi_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/nfc/fdp/i2c.c      | 2 +-
 drivers/nfc/nxp-nci/i2c.c  | 6 +++---
 drivers/nfc/pn544/i2c.c    | 2 +-
 drivers/nfc/st-nci/i2c.c   | 4 ++--
 drivers/nfc/st-nci/spi.c   | 2 +-
 drivers/nfc/st21nfca/i2c.c | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
index 9d589b388432..47f3838ac9d4 100644
--- a/drivers/nfc/fdp/i2c.c
+++ b/drivers/nfc/fdp/i2c.c
@@ -349,7 +349,7 @@ static void fdp_nci_i2c_remove(struct i2c_client *client)
 }
 
 static const struct acpi_device_id fdp_nci_i2c_acpi_match[] = {
-	{ "INT339A" },
+	{ .id = "INT339A" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, fdp_nci_i2c_acpi_match);
diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
index faebc89a7ef5..39b43f8f3bf0 100644
--- a/drivers/nfc/nxp-nci/i2c.c
+++ b/drivers/nfc/nxp-nci/i2c.c
@@ -362,9 +362,9 @@ MODULE_DEVICE_TABLE(of, of_nxp_nci_i2c_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id acpi_id[] = {
-	{ "NXP1001" },
-	{ "NXP1002" },
-	{ "NXP7471" },
+	{ .id = "NXP1001" },
+	{ .id = "NXP1002" },
+	{ .id = "NXP7471" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, acpi_id);
diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index 66d070b18b4d..ccca07eb828c 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -51,7 +51,7 @@ static const struct i2c_device_id pn544_hci_i2c_id_table[] = {
 MODULE_DEVICE_TABLE(i2c, pn544_hci_i2c_id_table);
 
 static const struct acpi_device_id pn544_hci_i2c_acpi_match[] = {
-	{ "NXP5440" },
+	{ .id = "NXP5440" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, pn544_hci_i2c_acpi_match);
diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 4ddf0cc2a259..3906a806ec8b 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -263,8 +263,8 @@ static const struct i2c_device_id st_nci_i2c_id_table[] = {
 MODULE_DEVICE_TABLE(i2c, st_nci_i2c_id_table);
 
 static const struct acpi_device_id st_nci_i2c_acpi_match[] = {
-	{"SMO2101"},
-	{"SMO2102"},
+	{ .id = "SMO2101" },
+	{ .id = "SMO2102" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, st_nci_i2c_acpi_match);
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index c94d67f33184..8fc60a972d98 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -278,7 +278,7 @@ static struct spi_device_id st_nci_spi_id_table[] = {
 MODULE_DEVICE_TABLE(spi, st_nci_spi_id_table);
 
 static const struct acpi_device_id st_nci_spi_acpi_match[] = {
-	{ "SMO2101" },
+	{ .id = "SMO2101" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, st_nci_spi_acpi_match);
diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index d6cb74a89f93..e5109f701795 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -578,7 +578,7 @@ static const struct i2c_device_id st21nfca_hci_i2c_id_table[] = {
 MODULE_DEVICE_TABLE(i2c, st21nfca_hci_i2c_id_table);
 
 static const struct acpi_device_id st21nfca_hci_i2c_acpi_match[] = {
-	{ "SMO2100" },
+	{ .id = "SMO2100" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, st21nfca_hci_i2c_acpi_match);
-- 
2.55.0.11.g153666a7d9bb

