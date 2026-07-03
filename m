Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C088256C61
	for <oe-linux-nfc@lists.linux.dev>; Fri,  3 Jul 2026 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093660; cv=none; b=ecYz4oA7mrux5+feKV+dDRKKO0O/GB+Z/AN1Lz2SVxU9YG3RgyF25A+ZVH9z5j/WD9uX7xAKe3ai5pkwi2ebH7XWEnzoiKbQNTP7U5oqsIvFhBtead9JIWW++gnikyirR1H/pymfMeEjhknkIIJuBcrmxacWwQ9BmMnMthIRwTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093660; c=relaxed/simple;
	bh=mJht/bXMY0DIBiuYNqXwrfWYRURf2/xNxGdA/NrN0tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OXBbAhacfZ5C2WUK60jvHakS8ZVHpWJlkqTbRHbITtiPudBXXvgDbIO3FoKZF+nie3DOdjTMx7T5g5vtMEhMVhVj9xNYsVUzWvaVF8MheFG51DoRgYKRIZw0BOak/uG86KGRs/QfA2Sq7ahqLYfPS7y5j2P6w9NlhlPuxVpCImg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cjYc9e6Y; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cjYc9e6Y"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ba701891so5100805e9.3
        for <oe-linux-nfc@lists.linux.dev>; Fri, 03 Jul 2026 08:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783093657; x=1783698457; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vUQe4xyY3/8BADBj6Hhog121bL360JeXAIwGjPx327M=;
        b=cjYc9e6YYvsiqx17RqqNA8MtlWBAOLw1cTgLub6Iq6dIOkqZpiuEhLQikfEcDzZfmS
         9DLQ54RNlTyhf5vOuVEi78zQGLTK1tH+gdQXztxglLfOYNXsbW2r4UH90MY/j0llFtiO
         PfsKcCxJZfLtaOhR8TlSuDB2AjGyKH3SVrBxvjwhrFh2mKNBXB/+4ROthgQmQih6GZxq
         TVEdOmNJq5umbCLc3Go4IjdC2Snpu0dwpF7C7PzDhmw6/wl8znjIDz/UQF+e6UXqa9li
         Wo888B5EYbiZ56/n+d27Q+LcRSvUl6RBpOnulNBkzQ9GC9E+RUuTrA1B7l7qWulN06A4
         UixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093657; x=1783698457;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUQe4xyY3/8BADBj6Hhog121bL360JeXAIwGjPx327M=;
        b=g9m1rh1t15RIyQyGWwsh00HvJ8/tC0arAHfMya0/ExqbcHmszbH1ohImOmiDhreIA3
         pRo+00QIPoNIgilLC8QEG/E/o7VD3sQ+XUJSQDSw1bwKhbDzrt106NAaMNslClBR1MAK
         a6Sf+jH8J0EQ0hxs/+on4yZru5ccfpFTqQ9Jb2aax9BAL/dXE8WsxzBRZCyODQ+Ji92d
         OpX3LcyQAUjCWEG2XFtkhQTYHDxLPfhSgtf8Ae90W7l7vJfID3bZt6UMk1a63EbMCTnf
         b4W98ZV4CqQG92DM3LUWhnuU2uyTGssTfHIOwYPy33Z2SzlCHrlfGGdM0FPZc8NjJwT3
         ecAw==
X-Gm-Message-State: AOJu0YwS9BapmiXTpIbwCU0QDhrGYYCzqd3BcV63BEEOCwFpLluJBSd7
	1MFRlQeJgF2xb/ogSaxv1eDTWmtZMEtgpaCT7w8ckXYUlP5ebtkaWcwKZPTps/k1Z/M=
X-Gm-Gg: AfdE7cn/bJk77GZ3iuCgpnnqT+0o1HoWOqRBojvyP+OMzofq8RSwd3/zSpeZBz+yQKS
	Xwm9xQHH9/Vmt+A3e5X1weIr0fXjCx6zuImU/UJ1hO3JDfxxELHjgkNazJkQhRFiqRMeQQdElHO
	fo9427rFPHwINUpePEO0ixVuyJ4ZXyEW2NyG9q+JYqy4EnOigc+QPWNTwTLQXMeQ5r/HPG37wAu
	EefyMHJKntUHYyb+VIRlt2/jPKJ7fl8eCMIcCI1i46IpeF2HDOZZ08hUThX2omh/iasWqa2xg+T
	Q09+GZh+0rnX3ABuV7sjCze+vFMXU3PcrQLv5fEA1R3XxqK7zfZxoIIcVLFIl6V1Su8TeHAA2at
	9fNfD6l4Iza5Cb1JnOVA2MboWWO5zGndeEGQ62cDY7Db8x+XL5xnMN9laNi6hgA/BU48HPCqJnp
	NqD/cULXZ4dB5OEI7L3Vwp80wSeRyMf+nFLsMQyn2vETszoFm2CoAmvIH1xsX/05zfGFKfu7/qd
	tLK
X-Received: by 2002:a05:600c:83c7:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-493d0f465a9mr4606505e9.32.1783093657033;
        Fri, 03 Jul 2026 08:47:37 -0700 (PDT)
Received: from localhost (p200300f65f47db0472e4f1e98703de96.dip0.t-ipconnect.de. [2003:f6:5f47:db04:72e4:f1e9:8703:de96])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039b126sm214654f8f.24.2026.07.03.08.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:47:36 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: David Heidelberg <david@ixit.cz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Simon Horman <horms@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/12] nfc: Drop __maybe_unused from acpi_device_id tables
Date: Fri,  3 Jul 2026 17:46:15 +0200
Message-ID:  <4c25d7a7f81d5117cd5d0de4a9f06ed0552e8793.1783091699.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2588; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=mJht/bXMY0DIBiuYNqXwrfWYRURf2/xNxGdA/NrN0tg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqR9lUC4IRjes0ETMVwvnme0nq6o5O6D8SV/7LI 1BjhSxVaB2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakfZVAAKCRCPgPtYfRL+ TmuCCACgE2iz2QehQbaAO+bBc/Bp62CWyxXelmNpLM4NVcvC/1y6p7LCQ7Yayv7qfy8LJ2POXvK sorrb1npUHhPaX4PyYBSc98S7WdqSeUjsE0oi49z3MNJW1exmMx96SKuSWOeaBTwTVWDCpY8k7q q8IL22uMMWpfUJb/4hcdsGYCkP3JAkb0bdwlBPFIongIoCv/Zmi2E8jcUNNrzFNAdfx22rmPqqO UsD6JBLxdN3+LGF1RcK517+kVKG6VroI49xSwM/2sI4mxaExw1tpUwmNDprxjN7D+e24iGRz0Ue euDybZublxLSWeJqImO92zrWyvYcMlsZbgwCuU4keAMZiK8Q
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Referencing these arrays in MODULE_DEVICE_TABLE() is enough to convince
the compiler that they are used even if the drivers are built-in (since
5ab23c7923a1 ("modpost: Create modalias for builtin modules"). So the
__maybe_unused marking can be removed without introducing a compiler
warning.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/nfc/pn544/i2c.c    | 2 +-
 drivers/nfc/st-nci/i2c.c   | 2 +-
 drivers/nfc/st-nci/spi.c   | 2 +-
 drivers/nfc/st21nfca/i2c.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index dcfa96bd4345..419b014d232e 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -50,7 +50,7 @@ static const struct i2c_device_id pn544_hci_i2c_id_table[] = {
 
 MODULE_DEVICE_TABLE(i2c, pn544_hci_i2c_id_table);
 
-static const struct acpi_device_id pn544_hci_i2c_acpi_match[] __maybe_unused = {
+static const struct acpi_device_id pn544_hci_i2c_acpi_match[] = {
 	{"NXP5440", 0},
 	{}
 };
diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 9ae839a6f5cc..4ddf0cc2a259 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -262,7 +262,7 @@ static const struct i2c_device_id st_nci_i2c_id_table[] = {
 };
 MODULE_DEVICE_TABLE(i2c, st_nci_i2c_id_table);
 
-static const struct acpi_device_id st_nci_i2c_acpi_match[] __maybe_unused = {
+static const struct acpi_device_id st_nci_i2c_acpi_match[] = {
 	{"SMO2101"},
 	{"SMO2102"},
 	{}
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index 169eacc0a32a..42f5f477e807 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -277,7 +277,7 @@ static struct spi_device_id st_nci_spi_id_table[] = {
 };
 MODULE_DEVICE_TABLE(spi, st_nci_spi_id_table);
 
-static const struct acpi_device_id st_nci_spi_acpi_match[] __maybe_unused = {
+static const struct acpi_device_id st_nci_spi_acpi_match[] = {
 	{"SMO2101", 0},
 	{}
 };
diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index aa5f4922b6b0..577434df5ff3 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -577,7 +577,7 @@ static const struct i2c_device_id st21nfca_hci_i2c_id_table[] = {
 };
 MODULE_DEVICE_TABLE(i2c, st21nfca_hci_i2c_id_table);
 
-static const struct acpi_device_id st21nfca_hci_i2c_acpi_match[] __maybe_unused = {
+static const struct acpi_device_id st21nfca_hci_i2c_acpi_match[] = {
 	{"SMO2100", 0},
 	{}
 };
-- 
2.55.0.11.g153666a7d9bb

