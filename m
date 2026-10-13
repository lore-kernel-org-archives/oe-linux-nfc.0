Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61222470E8B
	for <oe-linux-nfc@lists.linux.dev>; Tue, 13 Oct 2026 02:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860276; cv=none; b=r6BJuQbFSbBVMVbdLbyGay3gHksHRkTJHNiKodWcvmbHk321w9Sinji9U/cZicO19Ra8nPPbjuFlY9YWHODXDV3kx2wwL8dBlWZdXmkzNetQyxq3qXgBXdfmY5ibycOPhgecx3/NKCt8xbOQxjk4lUHDQCFpiqU1BaYY9yE9Mzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860276; c=relaxed/simple;
	bh=jFs2ejwyQRoiUFaaaOWLo95jLgIUJD5pi3UvSHe6KKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DT238XN1y5axZTdXEQPCMyOfirNobCaF2P/EwPNaRvpcyEtz4Ct2dXUch+dDnvSLu+26ow08S3T50A24o2MNjUWQOug2u8rpYDoAlAf8GxOP6YkN9t+NCUBOVvvvroamRw54S7oDYbu1/2BaEpKWOFYy2PqG0lQm7uyt1LvpRhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=WeMTlQfj; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="WeMTlQfj"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-154e9d2d979so1641694c88.1
        for <oe-linux-nfc@lists.linux.dev>; Mon, 12 Oct 2026 19:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791860274; x=1792465074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VKlzSdYOmHmxNkajBIoZRP6k3zgKUV8Nk9LgZQpvxD8=;
        b=WeMTlQfju1RC1XkDDkJO2PHn6VhyHbx1LQ/AlqhZ8gOMbEO2VIUNVjqWmyD6932wTo
         AX87vnIarM8W6m0rANIbRUeh0XE2VS9t3eaI5cQcTJny7fWJFQ6aZVEHNjcLcKuUY4ef
         PIccLu4IWX6aHuR7+Zpvn97TzmzGt5V+siqWEwJYvvm6csmv9rnkxh7xLTC6l21Fai3E
         ChGCOPhdNLnoa+Xbn7/AgxNsHrtKJPdUbi0rGjnasbIM9DPvRd0mKMTLs9hVEnTOZIFD
         Xoc4aPLghZWmWoGIAFfjz69Hiu94dFwPMbtGthPNt7IBhu5SSmQ3RDZHpfvv5nefcIfO
         GtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791860274; x=1792465074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKlzSdYOmHmxNkajBIoZRP6k3zgKUV8Nk9LgZQpvxD8=;
        b=bN/VSkdGJq8JrYirfWttdqsjg+1+0UZfJ1RBMqhIOn9lZnJXyQ+iQjcDjwSLERW8ew
         1CUObpyKjsweTyZQgAMCFoYF5kAiika6OlHWkxMpSsds+90xIy7zWeaN4HmhCJaNxv/z
         7BXjq5n039G6l1nOgF78J/MRhSdc14Kzfj5+HAJiq+uGaUnzgvCDRzKwpTHq6z9Fle6L
         o33+sPo/CLLosdcvkntc6oSKD4RNxny9+HFaiPtRr8uj7srkpV1p6Kmmmag0dENEVJF8
         qW2nceE1FlI0zFPKFyGxQEQv1T2p0si+FKdGcBP6G3+lbYrQMO3a4SLMAEuSwN0XeQyx
         JZdA==
X-Forwarded-Encrypted: i=1; AKwUvBxKjR75uL0M8/wPQ81I1ggycCrIA1GGsJlteGTxapLrcDDnqZFwun0D0Vus4xf1iI9ga37ekYSKpepMzFE=@lists.linux.dev
X-Gm-Message-State: AFq9FYIlOf5Jk94NXHb4316G9RoNpEObFMgDhp0usARxhWg9dfr3jVzF
	dncsQaqk0vQ28dMBiapz/fcuLorgkuRT2Ve/lpBxNsothwDH0h6PLgSmYPtgICOX3Y8=
X-Gm-Gg: AYBFou2nnYdfZNzXW/snAFY91TsULeBrPpnQGnKiYg5DshfrFz7hwcorIkJM1i1pao5
	Wa5RsyFDXazio4zW0DHIZEUO6yyUJJzveY90P7H+ue9tAijs9nYJpW3jKVghibcVdVgHtLh4A7E
	huxE21uaWA0GpPXcaXLjimyK2T5tQ1t0RVOC5SP29KtT6tPr1VXp3AMEUfQCSaAaIxTtAAZ6t0F
	FFDENk5B4cqCa1GdCEMq4S65DpSCdhq68S4olDs966oESKwU49QIVSutkV+1XHO7p3dHespwnC4
	1MLYGIUMp/D7t0DZoo6LoRNI+Hkmxl6tS+ynDXa4+X8CpIjOzem7L47Tsfrw84m+JbDVVVPUKs6
	ih+DUYnIhqSG7UpKgwVUh1PE0jk7DM+zd366VwGYPxOafO7b2Soe6zRkfJrgbj6LHbBEcgfRbxK
	IRHDm7XffwQ/duaDjJnc8QLQjUzOXPzhV/ycNp0+jmFeUjPpqr2o/dBYr/Ibk33kxF19/pD1lyr
	sDeoj22WutcH8dOpX6qAf8R84PBCSl9h2EBMXSeauEGR/pDcWZJVgAG8rUK5RZPEV4DF1L8+Ji2
	IenBp1W80GKFHA==
X-Received: by 2002:a05:701b:42d3:20b0:156:d588:c881 with SMTP id a92af1059eb24-16a0adc14acmr15455735c88.2.1791860273055;
        Mon, 12 Oct 2026 19:57:53 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becefdsm34223721c88.7.2026.10.12.19.57.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 19:57:52 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	cuissard@marvell.com,
	sameo@linux.intel.com,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gio@octane.security,
	Shubham Antil <shubham@octane.security>
Subject: [PATCH net v5 0/2] nfc: nci: uart: quiesce write_work during teardown
Date: Tue, 13 Oct 2026 08:27:44 +0530
Message-ID: <20261013025746.41292-1-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the NCI UART write-worker teardown ordering without
blocking the controller reset which nci_unregister_device() may transmit
during teardown.  It also fixes the Marvell UART state-publication race
reproduced while exercising that path.

Patch 1 publishes the Marvell UART back-pointers before NCI device
registration can expose the device, rolls them back on registration
failure, and establishes the controller's initial halt state before
registration.

Patch 2 serializes producers with the write worker's final state handoff.
The generic close invokes the transport close first, allowing the
unregister CORE_RESET transmit attempt, then blocks new work and cancels
the worker before freeing the skbs.  Marvell performs that barrier after
NCI unregister but before it releases private state.  The failed-open path
uses the same barrier, and the transport module is held while its open
callback runs.

The tty write-wakeup description has been corrected: a wakeup may queue
or run immediately before close; it does not run inside the close callback.
The same spinlock now protects producer scheduling and the worker's final
SENDING/WAKEUP transition, closing the reported lost-wakeup window.

Both ordering issues were found during an LLM-assisted source audit and
reproduced using a pty-backed NCI UART under KASAN.  With these patches, a
61-cycle regression run and a 56,690-cycle registration/hangup stress run
completed without sanitizer reports.

Other concurrency concerns raised during review are outside the scope of
this teardown series and will be handled separately.

---

Changes in v5:
- Preserve the unregister-time CORE_RESET transmit attempt by closing the
  transport before starting the generic worker barrier.
- Quiesce the Marvell worker after NCI unregister and before private-state
  release.
- Serialize the worker's final state handoff to prevent a lost wakeup.
- Correct the tty write-wakeup race description and close-contract comment.
- Take the module reference before ops.open() and drain work on open
  failure.
- Publish and roll back Marvell UART state through transport callbacks.
- Add the LLM-assisted audit and KASAN discovery details.
- Keep unrelated concurrency follow-ups outside this series.

v4: https://lore.kernel.org/netdev/20261006115532.72100-1-shubham@octane.security/
v3: https://lore.kernel.org/netdev/20261002055620.18339-1-shubham@octane.security/

Shubham Antil (2):
  nfc: nfcmrvl: publish UART state before registration
  nfc: nci: uart: quiesce write_work during teardown

 drivers/nfc/nfcmrvl/main.c    | 18 +++++--
 drivers/nfc/nfcmrvl/nfcmrvl.h |  3 ++
 drivers/nfc/nfcmrvl/uart.c    | 32 +++++++++++--
 include/net/nfc/nci_core.h    |  3 ++
 net/nfc/nci/uart.c            | 90 ++++++++++++++++++++++++++++-------
 5 files changed, 120 insertions(+), 26 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.43.0
