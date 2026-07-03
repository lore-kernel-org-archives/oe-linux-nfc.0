Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197742DEA64
	for <oe-linux-nfc@lists.linux.dev>; Fri,  3 Jul 2026 15:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093673; cv=none; b=eHDmFJ3FI76W/zDHlv+wXXSAEjgJpu8Bw1aC2DGx+jJy+E2gHOdOcMiHcXgQ47DnXmw0W1qtca+O2OrxclboqqcAR1EYOXmND0Cjb5HuuqFeg/olpiPdgIBopcoEFl9Asn1lFN5CI+qjVIFi40AxpHa2FLNmVairBU94cN7Tv5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093673; c=relaxed/simple;
	bh=2wV3hKj9vhnAodfbopd+iezREj9IBgRhvOKI8jHXilM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UMT3pGsGnA/NCVWthFqUPzA5I2UIvwPjND1/L+giltFHA5bAUClBBYb1NffvpxGMjrpRzXBWThHJUHOrdoygYD84H0P1g1k7n39arYHLk9LKAPeAoYMhr8EpqeK+zHd2U5GhNENR0Ksi0Q2Rdp1B2DkrH/wazidXzOAtUDc0SmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=D885hyvr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="D885hyvr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so4720495e9.3
        for <oe-linux-nfc@lists.linux.dev>; Fri, 03 Jul 2026 08:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783093670; x=1783698470; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nFRygkXlrzW2EnOOrdUvnj0OJKNC6C0PLgzWojPc/qs=;
        b=D885hyvrEGn7bn6Qgeid1mgnsI8EU/BAHaxgrq1L28g0r2pN3uAJ0tE267zSk5Wk+T
         45u0GgFhy5VIpDTMlaxrS+lasFSrmoY71ggUAZAuNaglZtwhb8s6H1zpZInZBiOTiPET
         n6H0DhCVdTYb8ZTOShKgBFs7l0Z3uu1KBh7Fadz9xJd9tPGCz2O7h05o/qFqPsmco5GV
         Z1TOaTS0j0CnCQu6VUp0OMX/c7QfCWBkWbZyHFNZfRby7CZbkRWov+gyXjxU3yGa5z9k
         0ABHukGQgC0mdaUeOSL2EmENmmLtQg+upoefJF+3O+jsX56qSP/Qw0gnbfKGZ4sEMHra
         RUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093670; x=1783698470;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFRygkXlrzW2EnOOrdUvnj0OJKNC6C0PLgzWojPc/qs=;
        b=gL+yXSh4TV/H05XKOty48bNu3cMhdHnL2bBHQYVjsB7sP0JSY6lcK9sgwK4ah/DCK7
         XVuS5y60tDrmC0rycxSO55kL1K4LYyXrEDavts3iZIHMl1X5B9kmsKJT5ybh37FS2Jkv
         NGfDGL5yvuHwEM5p1Sm9M2hAXm/ZmI4DmP7Brsoiqb+ByYR2sKwc7W438byGHcXw86Pb
         9ZaTzN0cyZuWSJi5rTQvPXLtHhAzce5YR16H4rKGXPGRqAVeWGUFx89+pjw/NrPB6O2T
         QAfCHWHA8IGXPnpNzL4zVThczHt75MrSJZO5fy6epyWeqN3+bvTL/x0DlA7AdmuQA9WP
         rjcg==
X-Gm-Message-State: AOJu0YxUXZx6cn79ay54+D5LFmktgt4E5HxP5CHTgWV3jaT6VEfX0v7+
	1Z6ocR4I7b1PCqCUhibHKxjClZjP4XUe2Pe2DApU4WhCSAU2tOkcl+fSttbNR+lTa2M=
X-Gm-Gg: AfdE7clpeFkmu+13Cd2C7MC/kwEtwowVf9mHtVnSDG42saBVAFOEAKccjmMvuCqc0U1
	COaXx9woQbxtatL0UqTlDmTjLGP58WdecbCFnAQj5SY59OQsOn9dg0xNwcW/YKM5duDWJFAQThf
	k2teZQL0bJF2HzvSGVzh4PzCySd2kOpvqS7tN2nDr8AiIjQlE+crF6AStLyBHa8c7EZp976TjnJ
	GErS+7dbndQfRcYNkgPrnYWR3UxLy58mSJ6CZjije8pcjfg8/FQmuKRuAlvtHlaqDGiFgScpTvW
	NggA7oYYhPoxEDNXA9IJ/S0M9ppNM5DcO6AnoNmDIOkvbqaoFoL+cUdRJG4TNNE9MMNnY4Qlsaw
	Aef62Ta1NOd8QlEC3B4z3YdpXfJouEr/9fc24h5Wq+3lJu69R530DwBACh6XfMWYZY3C05naU2S
	eVOXI4aFQFKK+ZvfbYCu7MS4bOsUyvjwtDSHsnAbJsmxa0k3pApXc9d+VeKeOC+kyKV1eckiC5Y
	6QF
X-Received: by 2002:a05:600c:350a:b0:492:7142:f46e with SMTP id 5b1f17b1804b1-493d0f08ac8mr4537355e9.2.1783093670501;
        Fri, 03 Jul 2026 08:47:50 -0700 (PDT)
Received: from localhost (p200300f65f47db0472e4f1e98703de96.dip0.t-ipconnect.de. [2003:f6:5f47:db04:72e4:f1e9:8703:de96])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c63b6f28sm145328795e9.9.2026.07.03.08.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:47:50 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: David Heidelberg <david@ixit.cz>,
	Mark Greer <mgreer@animalcreek.com>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v1 10/12] nfc: Initialize spi_device_idarrays using member names
Date: Fri,  3 Jul 2026 17:46:24 +0200
Message-ID:  <308a0d43ef042566ca595f1afa803cac592a4643.1783091699.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2615; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=2wV3hKj9vhnAodfbopd+iezREj9IBgRhvOKI8jHXilM=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiz3m1mmP5brfFv45vO6fdOCpyyueZU7o86B+82U5Zb8u Tubv1/K6mQ0ZmFg5GKQFVNksW9ck2lVJRfZufbfZZhBrEwgUxi4OAXgIizs//PNvRUbTjFfKlwU eFV3seCzqHsnP4RLzeT7VLhzg8jdq1KqrW+SJVoqpKOZlLpzxPxFE9YwyzxRL+lm92osWm77/2T g4gmPVlg84OhJvN/EIVzgcn7i/1sv7MXnzP2T/6VriUrn1iOpqwt6zdRuXLRZvX7j/PbI874BUd VpBoVzBUKZMlWOi8fZ/rn4sEDRdW7t1piria6+C89aCe9sPmJbkt8Q/qpmzSuBP3MPvXpmw8bgJ LbAOjVwhVCjuKTwruk+8merH1e+WZc1vdR+gsbGhStuPnicVeI4halOsiXi0oZZ76b89rY9Pd/V jSMp5/Sh010M5ft7e97s565JzbGzlrnQFsbcuovfz9kNAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
spi_device_id that replaces .driver_data by an anonymous union.

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
index f873f5380017..bc5140c194b6 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -188,7 +188,7 @@ static const struct of_device_id of_nfcmrvl_spi_match[] = {
 MODULE_DEVICE_TABLE(of, of_nfcmrvl_spi_match);
 
 static const struct spi_device_id nfcmrvl_spi_id_table[] = {
-	{ "nfcmrvl_spi" },
+	{ .name = "nfcmrvl_spi" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, nfcmrvl_spi_id_table);
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index 1bbda3d0a7dc..1b97b2f3f441 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -271,8 +271,8 @@ static void st_nci_spi_remove(struct spi_device *dev)
 }
 
 static struct spi_device_id st_nci_spi_id_table[] = {
-	{ ST_NCI_SPI_DRIVER_NAME },
-	{ "st21nfcb-spi" },
+	{ .name = ST_NCI_SPI_DRIVER_NAME },
+	{ .name = "st21nfcb-spi" },
 	{}
 };
 MODULE_DEVICE_TABLE(spi, st_nci_spi_id_table);
diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 52fe81a557a0..d4e3049d138a 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -1049,7 +1049,7 @@ static const struct nfc_digital_ops st95hf_nfc_digital_ops = {
 };
 
 static const struct spi_device_id st95hf_id[] = {
-	{ "st95hf" },
+	{ .name = "st95hf" },
 	{}
 };
 MODULE_DEVICE_TABLE(spi, st95hf_id);
diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 8f36ff82be8b..673989d5c927 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -2310,7 +2310,7 @@ static const struct of_device_id trf7970a_of_match[] = {
 MODULE_DEVICE_TABLE(of, trf7970a_of_match);
 
 static const struct spi_device_id trf7970a_id_table[] = {
-	{ "trf7970a" },
+	{ .name = "trf7970a" },
 	{}
 };
 
-- 
2.55.0.11.g153666a7d9bb

