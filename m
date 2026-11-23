Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448234;
	b=xafaIFc9+u/zn9rAmtUAzn7shabDXGzPC1bwLFB15xg/6AWnTHwv247FmxpEOqN/1A+a
	 GJ65/72ncYKLZTYEw/TNTEKhoBQ1oF+jMaOowosMPYuLdlbWKCNU2hlflPWzmQtwjuFGz
	 Bye9itpfMctRL1v9izA9M+r5wddz9NhTharkYuxT87zSZySF8gS5wtA7IYO7098OtU/9p
	 G/QWoCaSTUlmi1nDV9/1mmeqqWl8R+2s3beZ29EZPCsxH4kQUz2annzLAOQ7nSrtnMH6r
	 b3eZCwY4XUYVdbj0A2Jrqqv58CyNk26wUBURzvRBU/f5jQyqdNz8ExNBtfpKf172lwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rF0mx83XmYPM2qNwRzWvVTGOMjzCPdNgkj+Hi/DwTQk=;
	b=tb/sAdHTN6Fdw9mLUPTyPoTG11C2TmlJTwBJwXhkLDhRvnJ/nf0JboH1y5N3ZzP8uby0
	 kN5SqkeIoGZUuHUK3dYFBGAFsMnGwiV3ShwsvNZYAiAS2Yw/Mh9R8wpeEcJ2zwBZEMh5O
	 Z6i+pOQF+DT1xP/GNnJGrCIc8Uj/ybixQkPF2lNFI07Y+ltNDCvbOBrmEHTAyVvkvv4f+
	 3UXOYJ6hCCoVKjt0e0LE1HBBj0oRJNHbZSKM41b0jQJOGSmNvHWFNxbkeqS/VluFwQA+e
	 EUd7Vtkgh3K3WW2g3FoQLUsj+LIdy0Rz+5O1ekm2Zn4S22gf9LZ69WuGLQsURIlQE7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="isGPFmK/";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53E2606A31E
	for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Nov 2026 15:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B53E2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=isGPFmK/
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b40a522c00so369878a91.3
        for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Nov 2026 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448233; x=1796053033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rF0mx83XmYPM2qNwRzWvVTGOMjzCPdNgkj+Hi/DwTQk=;
        b=isGPFmK/AlwUSggnBI0kHs4tIhemwSuAqIzIqX3kdTz2DgbS7CwxcNJNNVsYHmVhIZ
         O9RsSd4oLLfHXL16PHaAdnlN6QypuuoqhioDKcbDUaWtELeGeHkJooJoTz1Whh1rF2a6
         n7NU1HYMGfLkalU1aR/82vS7TneBQ1OfDSzR6w3XYPksAe1U1baABKMcAtLtWQvgJP5i
         lKKkbjJ+YrsMAFsBxPMS1XyQvZLBLxJmTUHybQpyYiFCUKhAlx5h8aig8P5WriIbovxq
         vr9ISFNUHT2Pe2pkuPIcX3LM2Naa7j3qBgYWyiHcuzFe1GiPfHX1HaXV/RMpV1nj2wcn
         CmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448233; x=1796053033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rF0mx83XmYPM2qNwRzWvVTGOMjzCPdNgkj+Hi/DwTQk=;
        b=hk/8DydU6XqBLF+FuYHMY+RTwf8CAuI8GUpUhmRrOBH+y0oTwd4aPQ2E+qJQ5mADOT
         Bwv2f7LdzAceQe9KUZb56v9jzJsA+MeBAsrqaUfl8wu5iLrQLk+5hk5yRv0n7KF+I9BC
         hQ7GElOFi0R8YYW1/13b6ooka9LuY0pAIu/96mpwxn9pVOUkmJK9HMohPc3CMcaMreTM
         Kf75EaqU8TiobiKcbwD9zbBOy40QtYmiTmts9UqhGaWBDuwTsAXCUSnNY4XHYshonVds
         fQivFBb/lXowaHswhMl8AxjQkz2je2wWRVqz7pEKqV0GIIt7B17hPDYoZ3WvlxgJPGWC
         Ggcg==
X-Forwarded-Encrypted: i=1; AL+hErFHiimP2O/w/5vgd/Tc/Pnj80aF6MS+R4Ph4/52eobHQQIjG4fL3JNa/eIi2QuN1S9CHBdtmihAaCIsiXM=@lists.linux.dev
X-Gm-Message-State: APuU4Z9/AecR1vdFDy6YAYUBuadmEDmDaTPCxFTk6Tq1HbQr546i7B48
	uUgEBmIj1gNcnDdTbAqOiL+Srvc+YigJ2mgj8fGXJ9hIqai1Vd+zI3vr
X-Gm-Gg: AZFdTZeTiZNk72ZG6niCV8m1rwTxpsdxiVkulRo2ri2jwqjw6RvvxzBswgn+mfqNYTq
	rsvxJ48HQs4LN2cgabTmmQpcSkDihW+nELUBP8qC5tI8EWOw5W7/6uf1Qn4l87A7vx37laiCmi4
	EzACtlu1nzmWc6iPQo5aXVZHQb0lZK6V7i7zwKl9fMpdi9Tdfru7QxMvVixR4IeAF7dwqEnWOwc
	r+A/wgSKu/5D5O1V57qkZtmZbhB2ov9kmC/Hph1v+ZV5Hh1dmXzkpQrxg2GyIMvG/es2QMSeDxi
	Aa5XyRrdl2FOiN14RQTHGZ6aRaO5nTcjvezhSXEb/vr45ybiXO4ijgY2Niel/4OgCBCKbtaTcmZ
	XbwBYrAGSG4Z3WwqW9FDUwy4KH5MmOHLZdVkqwSE0efufjUYN2eqIdzrY1AKhKoiDqv0/ZVX746
	ZYJ8peGeoQAzTZYMH2NgdgJCzrNZTU2DhkHPpeHNq/B2bqnETMj0aOo/pfG6k1SFD1Pq/NUdgO1
	rnpOS7u3/ZVUhXI2rakMV68q51q5w/cbJ86VEmwtzrBrdRbPM6xOfUOgHp2ny6JnDoQKTGx8mXR
	cZ7KBUUlIULnX+a6gqK7NjzJydUl5TZepzUnOLAb
X-Received: by 2002:a17:90b:3d8d:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3b41c80b970mr17701792a91.2.1795448233074;
        Mon, 23 Nov 2026 07:37:13 -0800 (PST)
Received: from gmail.com ([36.112.205.124])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde797af60dsm4050341a12.29.2026.11.23.07.37.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 07:37:12 -0800 (PST)
From: Ziyu Zhang <ziyuzhang201@gmail.com>
To: ian.ray@gehealthcare.com,
	david@ixit.cz
Cc: clement.perrochaud@nxp.com,
	sameo@linux.intel.com,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	ziyuzhang201@gmail.com,
	baijiaju1990@gmail.com
Subject: Re: [PATCH v2] NFC: nxp-nci: fix deadlock between firmware download and IRQ handler
Date: Mon, 23 Nov 2026 23:36:34 +0800
Message-Id: <20261123153634.66973-1-ziyuzhang201@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <b707c629-97a7-4766-955b-64a2a7626004@ixit.cz>
References: <b707c629-97a7-4766-955b-64a2a7626004@ixit.cz>
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

Hi Ian and David,

Thanks for the patch and review.

For the timeout/late-response race David pointed out, I suggest checking
info->mode at the start of nxp_nci_fw_work(), after taking info_lock.

On timeout, nxp_nci_fw_work_complete() sets the mode to NXP_NCI_MODE_COLD
and releases the firmware while the worker holds info_lock. When the
work queued by a late response runs after this cleanup, the mode check
makes it exit before accessing the released firmware data.

The diff below combines Ian's unlock/wait/relock fix with this additional
check and applies to the original code before v2.

I have not fixed the other two issues yet. I think these would be best addressed in separate
patches.

Signed-off-by: Ziyu Zhang <ziyuzhang201@gmail.com>
---
 drivers/nfc/nxp-nci/firmware.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nfc/nxp-nci/firmware.c b/drivers/nfc/nxp-nci/firmware.c
index a953397..33193fe 100644
--- a/drivers/nfc/nxp-nci/firmware.c
+++ b/drivers/nfc/nxp-nci/firmware.c
@@ -154,8 +154,10 @@ static int nxp_nci_fw_send(struct nxp_nci_info *info)
 		if (fw_info->fw)
 			schedule_work(&fw_info->work);
 	} else {
+		mutex_unlock(&info->info_lock);
 		completion_rc = wait_for_completion_interruptible_timeout(
 			&fw_info->cmd_completion, NXP_NCI_FW_ANSWER_TIMEOUT);
+		mutex_lock(&info->info_lock);
 		if (completion_rc == 0)
 			return -ETIMEDOUT;
 	}
@@ -174,6 +176,9 @@ void nxp_nci_fw_work(struct work_struct *work)
 
 	mutex_lock(&info->info_lock);
 
+	if (info->mode != NXP_NCI_MODE_FW)
+		goto out_unlock;
+
 	r = fw_info->cmd_result;
 	if (r < 0)
 		goto exit_work;
@@ -190,6 +195,7 @@ void nxp_nci_fw_work(struct work_struct *work)
 exit_work:
 	if (r < 0 || fw_info->size == 0)
 		nxp_nci_fw_work_complete(info, r);
+out_unlock:
 	mutex_unlock(&info->info_lock);
 }
 
-- 
2.34.1

