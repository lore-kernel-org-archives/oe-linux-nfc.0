Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA4428469B
	for <oe-linux-nfc@lists.linux.dev>; Fri,  3 Jul 2026 15:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093668; cv=none; b=bdOfw3u/UoyEjHmYbv82JU1EziSd0NtvYdZrqxEjADaeFguTQoGrztikgLegoRMKDj4RNYME+h+ZWLrwb5D29dsrWNQWOjDYxpSjm9e7hBRwpv4sHPPqR/heQOZFuFBxftjscRfY6uL+gi0hJQHyTn/UIzFun3/y5MHWTReegr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093668; c=relaxed/simple;
	bh=r9/GcMhpOQTwR+oNvHf7A7pC89OwRNvLnjc5KzBH6do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LloHTAs6RWwO9UAfYgFSld5BUCEJ1A0ieiQUUTInDcjRi0500AcEhkl2qhY11FO8xgRvTaRWiM24Jcylxgo3ldMuc4LD9TijMAXTfKKViXV1XR0bX0ATpviFHvMJE7GoJ4x8o7Eaws3gJ1qvjycGo++bCllJGgb7CXcqo2MRKrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=eBlX4i/Q; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="eBlX4i/Q"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c1950518so9498605e9.1
        for <oe-linux-nfc@lists.linux.dev>; Fri, 03 Jul 2026 08:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783093663; x=1783698463; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HM5rpi/aV5/zoXbumUNoHzHA6sTkth0rx5R6RsiusQ=;
        b=eBlX4i/QacAA7N1JoMx85lb3hDth2KmB4QAfkFah18syFTaDWnrIU8BkqPWJEdMV+R
         jvTbWgrojJzcE96jRSyvH7XG70NCDXWgbD6pF8GFIuJDHf5A/9EPnNJlPkfmRV//JAaU
         /BseJbKfXRBD/H4NFEUuso0c7RDq5yQCyAQ8wwF5MBG1bf7a5MDEePyoubDOOvTsQ88d
         N8Xl6Q4jpNbcBZo65bCahcviQ4YLdFcyqsDApEDFV6KohcwJHRwJx/La/w7OnCVWYdhx
         +GQOpJa9XBm/Ny2J0Czp1KjY4PjdMsefowd4kpBPHdVqUNEjcrQBpMqfxnxjM7kfngIs
         1y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093663; x=1783698463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/HM5rpi/aV5/zoXbumUNoHzHA6sTkth0rx5R6RsiusQ=;
        b=ijVq6KrlbuCml5xj50K1QmXlr1sWZ4nuNldosHzI+2LmuXFRxpdbNxGTCx0uHgPmTs
         9crL3uw2Z2nDbXxE9TuE0vVuNNzB8fqIh+774dnXHvRfaZaOIeyFb2FUh9XC5Vei8pwO
         kT2rLu6fcOE5Q11yTjTYmCjxDJ8Z8TVk/dIKb5MOeGlqK+VlM8aYF0EyITyDbddszanP
         TYOxJ3cujLG4m1GROYL8iFkHUgVP5L318PfivFV8+dbbnCo4yVm6DH9nbG/t5KD3zX5H
         zotGC5P612vJZNx5SOkd21+BV1484Ccge7Xb6TAzvw0uk3334VlDfFCS4xROA10XNPSd
         fRVw==
X-Gm-Message-State: AOJu0Yyx7FzQKBNf/R3BZpF8KqyDQYLeAaAOvIuZYiOP1uO+9OCXGfnl
	FFT13f/aEpY5ESRi0KDSu/uFkzy4AVhsSeENjTzIXK3Q0P8YtMIDy9cRQ4s7Uof3Glk=
X-Gm-Gg: AfdE7ck5uGGRdkmDrOmUwfv0cw8aMAqe+5Nydr1+o3jcojSx0AuDFtMiJoZUz8/TkbF
	x/jj928wKLd26X20Wb/RCCUV1aKbyipBfL1/NRl92cIybDNptAgDlgIy+Z90yXKlfyQF2VGfXu+
	CYG23iSdibTgyCTkIvgMjQ3+zlICQUcJ3ez+VV3Zp7G9ThtNZZo1usK3D1iLDhIF0b3raLrHIQ5
	bdwuo0EJXpiw0QgjEqqDWrba+AvN5/3n0cq9S6JLFTyZn1zekXzi+6LS8fIzhmMrTO21Ysfuxkm
	1Ul6RPFQEEdTOEzvtiQzxahl5pa/2ts/wakTEzTfH51HpiOPS3TzKNOX87E+cSSPbEvGJW/570w
	7nL9SN47F/qAPZQvZgnBE939R36S5QHsYDrFBjxkvu7Yh2aMQmLovlUMw6KuL2FpGdSsz2vjJuc
	ZOsvMcivZUWBUstcKWQr/93GfpVRr/tcIeFCnqjZRImEwn/UN4Y800Z11bXHaCuc+gJO4vxucMq
	WVn
X-Received: by 2002:a05:600c:8189:b0:493:bc4a:a14d with SMTP id 5b1f17b1804b1-493ca6d6347mr47879915e9.19.1783093663019;
        Fri, 03 Jul 2026 08:47:43 -0700 (PDT)
Received: from localhost (p200300f65f47db0472e4f1e98703de96.dip0.t-ipconnect.de. [2003:f6:5f47:db04:72e4:f1e9:8703:de96])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960816sm204009f8f.29.2026.07.03.08.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:47:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: David Heidelberg <david@ixit.cz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Tomasz Unger <tomasz.unger@yahoo.pl>,
	Jakub Kicinski <kuba@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 05/12] nfc: pn544: Drop empty line between i2c_device_id array and MODULE_DEVICE_TABLE()
Date: Fri,  3 Jul 2026 17:46:19 +0200
Message-ID:  <7562d0062948a474957d8d733c0e8a70de502624.1783091699.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=981; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=r9/GcMhpOQTwR+oNvHf7A7pC89OwRNvLnjc5KzBH6do=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqR9leVRPOAO2Q75kX+zIlfIGbPuUzkJV40EomG 9nZgAv5Np6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakfZXgAKCRCPgPtYfRL+ TnTkCACPhaZP+r+xa3ex8y22CdJRRJ4maxg+1eA9QC8KazPXqbrEPbgoksjnjdBcMYaZKn9F1Sn 3y1GxkVdAvzPhJYFASWbZMwk5cCLHWLIJaTX4uuXVs7/f30iApfjQYFj0zYh/9s/iiwSwqkTfuw qjNyZPnWb+IQLiwSoD0CO/fRlpK09uZDa/LdjEIFpdD3YcgsAMLDOGTw+pkzAOhAPg/rdgBxpyU pm1KG6wPE9K8J4uPh1d82I6d5ZNADKYajYkv7djLdmB7zuhvPoe3j6hwE+K6s08jSa+4ME6xYnY V+3p6k1cMk0P/2TJNSpI5PM6yD2G8MvafwqRtBYHheEdMm9Y
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Usually there is no empty line between a module device table and the
respective MODULE_DEVICE_TABLE():

$ git grep -h -B1 ^MODULE_DEVICE_TABLE v7.1-rc1 | sort | uniq -c | sort -n
...
   1388
   8129 };
   9784 --

(The `--` is part of grep output to separate the matches with their
context from each other, that's not the most usual line before
MODULE_DEVICE_TABLE(...).)

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/nfc/pn544/i2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index 9ed1cde1de2e..b731d0b02f52 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -47,7 +47,6 @@ static const struct i2c_device_id pn544_hci_i2c_id_table[] = {
 	{ .name = "pn544" },
 	{ }
 };
-
 MODULE_DEVICE_TABLE(i2c, pn544_hci_i2c_id_table);
 
 static const struct acpi_device_id pn544_hci_i2c_acpi_match[] = {
-- 
2.55.0.11.g153666a7d9bb

