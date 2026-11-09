Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222053;
	b=jvjYu1BtljMCJ8j0ScE+XRRVRzlq95iycAmmLyRByJYoHpQXrmyPG+GvB8AEGHh7cSUY
	 8sdRgrdNHLZj3ROAgEsyKFvpxOg5WpfpBiRHGuS/22c6zWT1XjgTBfQ5DCtt2uC649RFi
	 rFpiAhZ1yxgHSI1hqhDkTelvXXHitQ/+KzrYJMo4g9VybXnHEQfmbxL9wmCQe8D6o5wtW
	 xvH+x3WsxMSFnC9m29mguHYaSxqNJ0OrKTIp087yjWpIaPjeFRsfaKpiOlU35b0Qey8ln
	 9u60ZX3q9fazFN/a0tkpwMenDriZGZEYre0ZAicyOIhhDaG0dvPYl9SrrWHW2jq0FNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4iXeY4iqUL9ww0pQAAvwhem0iOVjitiOYOwOdTHElEs=;
	b=BUmuZbM/FufyMjn1dkNnLOv7eo43cScC621zw+ZrQTguJx8aapJbgfeC+Euy4Vc/R6u/
	 JUBpmRk/8jHwRFO98YMJc7FhHXFmYW8GFIyCX30gBiyR9HCcmS1bSu10Kdiu4dVWrfHvO
	 f9yKnC46gGlKFT7nHXEDUj8uzM7lz23+PaL1cpGJpMslIb+gB4ESxoCDGh0zoFIQ8a9Ry
	 4JoinA7AqVi1nIIQEMimbbDuiAR3yJiRgLWVUEmi0EQAFEpQr4NhNTCpo1PboBz9PzJ+N
	 DskJ9I1ipei2eOgqXxmusKjUuahwatOuwcvzZm55t5iXmGC8L/lJncbp2s24kyKW5Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ED7jDxxQ;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F04606A330
	for <oe-linux-nfc@lists.linux.dev>; Mon,  9 Nov 2026 11:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F04606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ED7jDxxQ
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1366866c88.0
        for <oe-linux-nfc@lists.linux.dev>; Mon, 09 Nov 2026 03:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794222052; x=1794826852; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iXeY4iqUL9ww0pQAAvwhem0iOVjitiOYOwOdTHElEs=;
        b=ED7jDxxQGwboHG7Il7Yti8Xu/CWTa0mImwReV34n33gIl2wYj867UORADhWS/rzKxU
         yRCX7ZOKwAPj+qBrngxvJqCFDsY1B2H0dmpRxsR8heLP0NDWlnlpYT1vlMIe7AxEVKTY
         rsi6UsTIS8H9/8q6AR6ECCQLwDYzWWU/wh9Xgk9l+5thYXe56ZRyB1wVSdlNp45b5IfO
         nRKknykV2Fc+pBHV0IFRTbUXsoWjIBXg57fDRdzfVCrco5wBAGQHSwc6jZOC70PslYyA
         LSNPx691cpjbtqJxhrlpNgCxUt9UTT9UuPGB76u+UpnG9raXhNZIMrWMhAuPjPpNZHIU
         u24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222052; x=1794826852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iXeY4iqUL9ww0pQAAvwhem0iOVjitiOYOwOdTHElEs=;
        b=jSvRcMZEI4Kk/l6sTvwumP3QC9f74DKoVZM8kCHS/tdyiWSZmKQOtXyifnk1krOxye
         AYHkpIti5wrL/B88FxyTWEnJssZ0g4y+eioeHvbRE29MATrvvnqv2aafTT6GfKCG6P3E
         F0Y6y+tqHxQHjBCAtvM4z4VUJHzwZrh5ELivOgoAgqVAtORpsI/yaYTHKMfZ2MuNqJ9v
         uxCzF1NjaUIEFj1Rdx1Z5ZiMixUrO6M1QOSEfkCsFpx3N1G6K6ofH/eCCjMCxYcaFYQz
         Cgk7lURtsLXhZl9CEIQ5DvJiwVVs58AzZWrIX0irqhMap6O7mE2ak/+3D2+s9lqJRjf0
         AZjA==
X-Gm-Message-State: APuU4Z/iTMC4I+vceSSRn21NbT0YLC7I5cx60HAbyU/7WmWPyCWPbt/2
	nScYKIwG13NdqxqHS0EeTYN3uz588I/Xn3aHEVNowxN5qGd2G3QuRbVEOhZHRdCR
X-Gm-Gg: AYBFou1MSk94pcPQDBtWLGkAMGcAFHQKfZ+bjpPKGiMUwGCiWwCHOEZmDiT0kW+MXJc
	cPt3wyMazqlSNP7lmF4z2udF/EwxHweSefKasbaZ2Dtwmx0L8XmHbT7oPXKb/V/HkTkZ4zsw6U9
	F3UoEha6Tn4A4IbRQOauHf2429ZFcgng1kFtC/A4KDCUxi5kOkWEwWITjn8eQGoD5m8gvvFV6XC
	jknHaKuiVyMB7iYFpsJWwwuyt4RHJ5KihiMdUZyPxyTHdWobJjywrV938ya9j4wSq6CSgL6jyT+
	bSu3MbzfZh/4nWFYnWdZzcaX7kLX0Mvb2wVfaa0oosUClLgYqWSjbst0Cif0dXAYOj2WoB6qU0/
	7rXRY4u8cOW9vAKRbsdP2ihzx6JCFGxd95mMEFnYsAKKBpa38CqVFbz2IS0MkHsMjfc4ul6cX5p
	PsO/BFkKVz/hNltmE2eep08DeNL+26QBbGG6PlT00+UPaEfFgHXfrr9tNrF2qb6YMcVOY/rKB6I
	gajzoz1skljjloTppLZgHMpKygQYhja/pFKbU+OeHDle1I8R0aaymbbkJz+eYMgfYiBPL1/JDtG
	brgHAirzOOdeigY+Qg9YtZcLzMH4Ti6dcD/S/2AOkgyz8RdO
X-Received: by 2002:a05:701b:2092:20b0:151:5d01:9316 with SMTP id a92af1059eb24-1b39fedc89fmr6555851c88.23.1794222052154;
        Mon, 09 Nov 2026 03:00:52 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm15407609c88.10.2026.11.09.03.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:00:51 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] nfc: pn533: bounds-check the ATR_RES response before parsing it
Date: Mon,  9 Nov 2026 20:00:16 +0900
Message-ID: <20261109110016.1511307-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

pn533_poll_dep_complete(), pn533_in_dep_link_up_complete() and
pn533_activate_target_nfcdep() cast resp->data to the fixed ATR_RES
header (struct pn533_cmd_jump_dep_response / pn533_cmd_activate_response)
and, on a successful response, read nfcid3t[] and compute the general-
bytes length as resp->len - sizeof(header). A short response leaves that
read past the end of the skb data, an out-of-bounds read; the copied
nfcid3t reaches userspace via nfc_targets_found() and netlink.

Only the success path needs the full fixed header: a no-peer/failure
reply is just the status byte, and the existing failure handling (turn
the radio off and re-arm polling, or print the error) must keep running
for it. So validate resp->len >= sizeof(*rsp) after the status check, on
the success path, in all three handlers, before nfcid3t and the general
bytes are read.

Found by code review; not reproduced.

Fixes: 361f3cb7f9cf ("NFC: DEP link hook implementation for pn533")
Fixes: 673088fb42d0 ("NFC: pn533: Send ATR_REQ directly for active device detection")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
Changes in v2 (thanks to the Sashiko AI review):
 - move the length check to the SUCCESS path (after the status check), so
   a no-peer/timeout reply (resp->len == 1) still takes the existing
   "turn radio off, re-arm polling" / error path instead of returning
   -EINVAL and stalling the poll loop
 - also guard pn533_activate_target_nfcdep(), the third ATR_RES parser
 - add Fixes: tags for the two commits that introduced the parsing
 - drop the inaccurate claim that the other handlers already length-check
   resp->len (only pn533_init_target_complete() does)
diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index b0133e51dce9..9c65b52a8a14 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1319,6 +1319,17 @@ static int pn533_poll_dep_complete(struct pn533 *dev, void *arg,
 		return 0;
 	}
 
+	/*
+	 * A successful ATR_RES carries the full fixed header (nfcid3t[] and
+	 * the rest); the general bytes start at offset sizeof(*rsp). Reject a
+	 * short success reply before reading nfcid3t and computing the
+	 * general-bytes length, to avoid an out-of-bounds read.
+	 */
+	if (resp->len < sizeof(*rsp)) {
+		rc = -EINVAL;
+		goto error;
+	}
+
 	dev_dbg(dev->dev, "Creating new target");
 
 	nfc_target.supported_protocols = NFC_PROTO_NFC_DEP_MASK;
@@ -1799,6 +1810,11 @@ static int pn533_activate_target_nfcdep(struct pn533 *dev)
 		return -EIO;
 	}
 
+	if (resp->len < sizeof(*rsp)) {
+		dev_kfree_skb(resp);
+		return -EIO;
+	}
+
 	/* ATR_RES general bytes are located at offset 16 */
 	gt_len = resp->len - 16;
 	rc = nfc_set_remote_general_bytes(dev->nfc_dev, rsp->gt, gt_len);
@@ -1937,6 +1953,11 @@ static int pn533_in_dep_link_up_complete(struct pn533 *dev, void *arg,
 		goto error;
 	}
 
+	if (resp->len < sizeof(*rsp)) {
+		rc = -EINVAL;
+		goto error;
+	}
+
 	if (!dev->tgt_available_prots) {
 		struct nfc_target nfc_target;
 
-- 
2.43.0

