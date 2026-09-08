Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED4656329D
	for <oe-linux-nfc@lists.linux.dev>; Tue,  8 Sep 2026 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884448; cv=none; b=nNgU2kwzg7vj2yRKyw2zmRFe6bVWubMOWZT2FTVEhtoR0vnce05amfT0Z0YLVgwNtVOEzUCgyWLI4kbOBWuq9XmauxRP1mHUSU4y+kWgmFSnyb0R7aeKdudRBqvlsc7X2zxHa46AK2OnYZ2iDzae0Gnuj/FNI6ONtrmX29GHaho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884448; c=relaxed/simple;
	bh=olB7ON5GEqbF6ANJo9WUseDrng9sbZUoV/TkAb3SZzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BS7SMX4CFB+vD5onJD+s19JpERPjsVs+4wgs+siJ+Pj02JOi3Nb2kI7dryEVnpReMN7GEVByof6xpcU1st//jD0UOrwaG+9PyiNU4IN4h49fxd3dgVrIV43DluP1/FIUxOmG/c80tRCr+Lm7I/HeHogwZpeW2nhXskkzIW3JS4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g12F6GFu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g12F6GFu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso35254205e9.2
        for <oe-linux-nfc@lists.linux.dev>; Tue, 08 Sep 2026 09:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788884445; x=1789489245; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNfCA4fa19+esHhbQ0fqNRwxl+r6i90f8pc7dIJXU2k=;
        b=g12F6GFuSLjrnN0IJJ4UwMlyxmX2roefEGKvjSNqQWCCBmidiB4eFmDn2tNvs+aNqJ
         PouOx+gMwLvZsli6GNhJvR6KO2IuuDAeh387ki/b/SAJBzZ9k3PCnQHxjSI2gaywGbwg
         jXGrzIAk5uh4JGsvvM2fQsiOzTG8nr3iXFt/513znCm3eaiKFqT0kIg4Xtu/9+NVJe6z
         GG4USgC/6PO695MNQEP7dTkyWQ72A9HOYkX7Yr+fin5YnkoIMxXsgm8JEOniaZizV6lz
         01qugokdUobTg4SkaIntsLj/QVcqDCkQ8ubHYJ7HK5blYUyY79USjRs51Yp1sgy7TeAW
         F0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884445; x=1789489245;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BNfCA4fa19+esHhbQ0fqNRwxl+r6i90f8pc7dIJXU2k=;
        b=pkwBJJ9BBmzhtCpdOFjZxkP/xLIRbC2dftm3p+n6Wcgbm3tqbGRZTT7ueGfV6YQmNt
         N2q/PaQtl0kvKLcgmr8Ed1B8Ypde/tIgSUxAHSvXMxXZgpy0lh6VHToAbyv04IK4WCMD
         2SG+2CVJw5G2ALQsQCvrFmd363VvqeVoTeAz2c/uTePebKlCLfjVGegC8oX4CNHnIBPi
         i61ogqC0d2jjZu5J8FkZxmEIhQlqK+aGiPOG3e9RwnG+5pdmIey0TRYzmGmgHT1+PK9Q
         CkPH5nB3jutUrGiUjFdAqRyxk8ZWGVEqsLBKPH6+yc7aRu1L++tqkRdP1lk8JuHvVlrX
         WqoA==
X-Gm-Message-State: AFuF++ngsqhMIEEufWn8iK2OBQX5E6c5/t66ukvFWeVspGhr2lLZ5aQ4
	fD8VnpxYR8i1rRYBNsQ1+R2WCyPoFFEc3zBusGV90h+zLpiEtgiwbYDvEFGvFEVxiLA=
X-Gm-Gg: AYBFou2ITMFFvwVRul+i6EHLCnkgisS3RhetvGUhT2kpOxktllnBLtt9PEzyQ165g3q
	d4bt2rGldkvcYol6otxGtp+2UAJtvlJM7fQ3Eby3SQc9GE1UI0+BEE/NS+5B1FuuuCNP+QVb5BZ
	wpS68g9weP6ieT+QmjaNj8ml7z6c6bjH4NnhvLyneTmlkVfJ9xL2zotqVy8Jpuny+bTbuBpPkuY
	uuw3nfx2n9Sudjeq/3hCfJGhSLlXwOXp+ArnNBoiSTXLQ+gU3y/dw2JY/OkmcXzmm5OCzEh8N/I
	d6jojSmxn366VUdbELuOD6WE2AqH8RZe9p1rLYqvmeOJZoArWnvXrq9ayTT7f6p/gWqhI/St27c
	k0dAsn7WOJ+gnmQsxuHzmK7X2UOOt/Z/waSRPKqlTZTqXbiLk9KIPjy+u8J1+qwdU1ZL44TIKpJ
	kGuKBjfUZtJlR+I5PuFMBqTvGxj3ucKCCj8wewyc9gHHVOY8fn+Wr7uFLwOCc7ntE2sVQZ
X-Received: by 2002:a05:600c:8715:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-49d17d4b01dmr151135895e9.1.1788884444585;
        Tue, 08 Sep 2026 09:20:44 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm884641885e9.15.2026.09.08.09.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:20:44 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: david@ixit.cz,
	horms@kernel.org,
	sameo@linux.intel.com,
	thierry.escande@linux.intel.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>,
	syzbot+1e3df0852e82c21ca418@syzkaller.appspotmail.com
Subject: [PATCH net v4] nfc: llcp: fix slab-out-of-bounds reads when logging service names
Date: Tue,  8 Sep 2026 19:18:01 +0300
Message-ID: <20260908161952.731468-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nfc_llcp_wks_sap() and nfc_llcp_build_sdreq_tlv() pass non-null-
terminated strings to pr_debug() using the %s format specifier.
The buffers are allocated via kmemdup() or come from netlink
attributes and are not guaranteed to be null-terminated, causing
__dynamic_pr_debug() to read beyond the allocated region:

  KASAN: slab-out-of-bounds Read in __dynamic_pr_debug

Fix both call sites by using %.*s with the explicit length to limit
the output to the actual length of the string.

Fixes: d9b8d8e19b07 ("NFC: llcp: Service Name Lookup netlink interface")
Reported-by: syzbot+1e3df0852e82c21ca418@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1e3df0852e82c21ca418
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
v4: Fix missing uri_len argument in pr_debug() format string
    (compile error reported by Simon Horman).
    Add Fixes: d9b8d8e19b07 ("NFC: llcp: Service Name Lookup netlink interface").
 net/nfc/llcp_commands.c | 2 +-
 net/nfc/llcp_core.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index ca89fe967d6a..80a00938c869 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -135,7 +135,7 @@ struct nfc_llcp_sdp_tlv *nfc_llcp_build_sdreq_tlv(u8 tid, const char *uri,
 {
 	struct nfc_llcp_sdp_tlv *sdreq;
 
-	pr_debug("uri: %s, len: %zu\n", uri, uri_len);
+	pr_debug("uri: %.*s, len: %zu\n", (int)uri_len, uri, uri_len);
 
 	/* sdreq->tlv_len is u8, takes uri_len, + 3 for header, + 1 for NULL */
 	if (WARN_ON_ONCE(uri_len > U8_MAX - 4))
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index cac1b5487064..fda236e4d9fd 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -341,7 +341,7 @@ static int nfc_llcp_wks_sap(const char *service_name, size_t service_name_len)
 {
 	int sap, num_wks;
 
-	pr_debug("%s\n", service_name);
+	pr_debug("%.*s\n", (int)service_name_len, service_name);
 
 	if (service_name == NULL)
 		return -EINVAL;
-- 
2.55.0

