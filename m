Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFB32D8DCA
	for <oe-linux-nfc@lists.linux.dev>; Fri,  3 Jul 2026 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093672; cv=none; b=oLQisIG9mdmQZvWleg+/GZjq2nXl+cQNH4ei3Uh1CbwrsemW2Jj2dRhy0gvY1Vi5B4H5zZJc/5V6H1K/+XLFO4h19DjEv1Hl4e3+8v28MGNTCvW43HdZgHXKdTAsAfcDL57dQQlKKrNLUK0pfLhX+WNAVi0EJ1ukNmHetxX8hWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093672; c=relaxed/simple;
	bh=/05CrF/2SzP5JuGbrxM/FXT+JGkfk+pdRkCjznb7Lyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WPtQcQS8OQEH4qnZyghwkb+7YCw8W5xQ4GdxUWQEoW1pUbJsAhaprmUbm4sZ8qmtXQ6jrP184NgZDfMmmMd6nxYG7zprHcZA/SrG7u30bcntNzUG7Wk/oC0ZNEU28f1wU36qkdwvArD8MHsMCWuMFNFwV8+pYi1hjS8v/oZ+JaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ebecAvxm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ebecAvxm"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47488efcf30so469380f8f.3
        for <oe-linux-nfc@lists.linux.dev>; Fri, 03 Jul 2026 08:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783093669; x=1783698469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XObmSid5rWVDs24+y2Z1pazYwKHrVLxvdlmXq4NkD6E=;
        b=ebecAvxm/stkLq8JlusEs2Ve4VxDX5YWc+r/X8eZdPJAWoZCTsE58MMAsSSlsFSB++
         LnIJWZXNLFgdy23Xf/kOr7Sw1VAiEBz3wnEQWU6W48ZtiGAHCMwdk4aNi+/iujFO67pT
         OzE2rHn6KaoRvKnhlIhSZq3NG8c9+pooLEC6IGyZxFgs1XxUiFmtao9YarowVV7rxqBz
         WU9k5b2rc5egWAwCft5IyAEtPJb6E7tQYip2II+PZD90wzcAkIl3WUWPyTMBJAiSvFcm
         nZOLBG1GcsgYsP8Hqr9R8/IqPscAh1oQq3E99hyVpf7tDBRz8j6eS31L4JnfXfNGbmTn
         AmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093669; x=1783698469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XObmSid5rWVDs24+y2Z1pazYwKHrVLxvdlmXq4NkD6E=;
        b=PlmWoCTBG1oaxiZUgenE8zeVlURyFvhzabPeJDF7EscOzeuPYdza1qyEWb3BbSeb6+
         C8gz5mxiQUYCUBa67/BkWk4AA4i0ZCGkHQ+fGT0rZD3Ua0fiAPdiUri5q78GJtQE1tx7
         JxUmrUZeciI5b+pZrPxU6H+hK53zYLUl9PuQR9GAYPJ7zNZ3rl24A36prQMElD2T8fK7
         wWVGDmup7wuOCtQJOHId/0W5ijRhtzbr37k0n8QfVT7pVklvfYGjTUv6e28D7hh8HCBe
         Sr0t5OyESMRkahff5T5XAfdD/yQeV0u9BiTKk7PBlTAF4nzLzR11b3kfZRfPpiBF6qkr
         Py6Q==
X-Gm-Message-State: AOJu0YzXVpT+dKDMomkXXudvjq5M0Rt28T1FQUUzDWzOuFi977XHFWYZ
	RWZdBloy+I2MZtzGibrUlcVkc1TkWJ/rqMXyNP3CfW/w9KDC5172dZ46ZjyU240k+8I=
X-Gm-Gg: AfdE7cn5Pz52aQWFFU13UX7MlKL4arm2lxC6QhOcMR3UCx/RfiiQ1J/YpH3Pf5zas4P
	SCs1eKMd9FAmeQDMzx8ZLW5TvPJXOKPfuIPZFizbQA18oEOYUoLDnAiwV/PSYSQN5HOOX+TJ0Jo
	JLStuGXyIZjby0UzAEfG8OpXG0C1z3a2YHCYud6c4XCEqqWbGLtjQudiYtflJKSvERTD8dzw6q5
	lziHrP5EDdztqR20vsEQgiwRysGitK6+8T3b+E1f9R2bjgh1NLPyHP17vyyF04k4pAL5c2ZkMjm
	wXoBog9qLdjJk+bmK+XglAUGUbeRu68sJL4wGlNTWG8j638YP5Fl3Wyz7b1ediPV7XSuQ7W+xR8
	XNwOK8LzfEu/U7BzQhjQzdNEv2UF86n5oe7vs/T0NbqLW+haNcnYj/o1yaLM7m2H5XJdohPEaJA
	QqDt+q4mlENSu7D/N+fBap4bsdMeV1tPN2mnLwas7dY5OVHyWNGHvmKZya3Jvsh1d+L7rZKfilC
	sOO
X-Received: by 2002:a05:6000:2c0f:b0:46f:7d90:8121 with SMTP id ffacd0b85a97d-477583280e8mr16112347f8f.14.1783093669050;
        Fri, 03 Jul 2026 08:47:49 -0700 (PDT)
Received: from localhost (p200300f65f47db0472e4f1e98703de96.dip0.t-ipconnect.de. [2003:f6:5f47:db04:72e4:f1e9:8703:de96])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960816sm204810f8f.29.2026.07.03.08.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:47:48 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: David Heidelberg <david@ixit.cz>,
	Mark Greer <mgreer@animalcreek.com>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v1 09/12] nfc: Drop unused assignment of spi_device_id driver data
Date: Fri,  3 Jul 2026 17:46:23 +0200
Message-ID:  <c645d5855d26307d6164122412335533febbf8b9.1783091699.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2337; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=/05CrF/2SzP5JuGbrxM/FXT+JGkfk+pdRkCjznb7Lyg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqR9loglMTx+4sYWE7/1hQ3OeE8HuPWClyE12lY oBI1NW8EJ6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakfZaAAKCRCPgPtYfRL+ TpDVB/oCrhbM+rnbVWuPSxRJyQsOwuc0QCEQ6j4ysYXuFXJ6qRpSyvZkqc/ekKzkZ5CU8S177x9 WbTD14sLzWQ2z69z2jD/WUYY2qcQ9bCSe2GlqM99wN09oWXqZrBSv9i/Wy3FHjmGmbvy7AEb4bI i1YZDk/VXsrDC3etmgrmX40jD6lpeWNPHY3h4WwFpEnaL8QL5i4s+T1P5ZAVGs9/WcTXoVgrXBt aDtL6n4tTqF8doyh0J4QIcsMSp5tgX+91EHKvgDK1iWoDdwl2hThG4P7GozyajTq3aStS16aIVI jPzSxZjBo0cr+OG1+AL394Anl3ZjREKibIjHwJQgjXSa9BzI
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
spi_device_id to zero without relying on that value. Drop these
unused assignments.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/nfc/nfcmrvl/spi.c | 2 +-
 drivers/nfc/st-nci/spi.c  | 4 ++--
 drivers/nfc/st95hf/core.c | 2 +-
 drivers/nfc/trf7970a.c    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index 34842ecc4a05..f873f5380017 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -188,7 +188,7 @@ static const struct of_device_id of_nfcmrvl_spi_match[] = {
 MODULE_DEVICE_TABLE(of, of_nfcmrvl_spi_match);
 
 static const struct spi_device_id nfcmrvl_spi_id_table[] = {
-	{ "nfcmrvl_spi", 0 },
+	{ "nfcmrvl_spi" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, nfcmrvl_spi_id_table);
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index 5e0b94050f90..1bbda3d0a7dc 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -271,8 +271,8 @@ static void st_nci_spi_remove(struct spi_device *dev)
 }
 
 static struct spi_device_id st_nci_spi_id_table[] = {
-	{ST_NCI_SPI_DRIVER_NAME, 0},
-	{"st21nfcb-spi", 0},
+	{ ST_NCI_SPI_DRIVER_NAME },
+	{ "st21nfcb-spi" },
 	{}
 };
 MODULE_DEVICE_TABLE(spi, st_nci_spi_id_table);
diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 265ab10bbb61..52fe81a557a0 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -1049,7 +1049,7 @@ static const struct nfc_digital_ops st95hf_nfc_digital_ops = {
 };
 
 static const struct spi_device_id st95hf_id[] = {
-	{ "st95hf", 0 },
+	{ "st95hf" },
 	{}
 };
 MODULE_DEVICE_TABLE(spi, st95hf_id);
diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 3802081fb8ee..8f36ff82be8b 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -2310,7 +2310,7 @@ static const struct of_device_id trf7970a_of_match[] = {
 MODULE_DEVICE_TABLE(of, trf7970a_of_match);
 
 static const struct spi_device_id trf7970a_id_table[] = {
-	{"trf7970a", 0},
+	{ "trf7970a" },
 	{}
 };
 
-- 
2.55.0.11.g153666a7d9bb

