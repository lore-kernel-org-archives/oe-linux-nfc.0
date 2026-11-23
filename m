Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415600;
	b=wAUFYAACHC/dTwqvFk/h9BQzOCwuCqcUaA2om2e6BrGXevRcVzSjaj9iqaeSRI1U1UIP
	 9Sb4E2QvILPkob0FI4MwasmtHinTnlc8mGM2/IAKgQLr5SX1yA2k8oZyyNC5pFz0ECN2m
	 VS2J2Y7G0Vi/+j7a3RDileMYxpFp3ZB1ipkhgzOa5X0lvZkzS8LsbeDvPTDwApVqE1i6K
	 zsUddA7C3gaXmXxZQBEwUeRRVZFPY3N2kxcHEG+puOzVcMV/yEWK+1x9Bsff2/QDTi0sF
	 VYT3nwyL8edA9ijcW6Wr3pbaTHugZ7whhP/5hNHUOXS3mNzU3EJe9G0xrZ4Dmp/B+Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=m+NdFSCwXjzJeLngRwlLE+1QgBgKdpmNBcIPuiYsBGM=;
	b=tpPwYje/lRLEpRGZurMG4YsnAhK5FrdyIhU1wfu2r5TVg1o4yPqGs/d9uQO1zIoiNrSE
	 sLfgaQ2n6qfZVO3Z6eG7wHd2L9UCUoOcVwp859yL7B0XJcJguBwGqc87oUUc1Kk+oh+78
	 scxUJNwf2T3HO6i0RzFfvwIJvD+PUvQa2t1f/Qotx5An21+aPuXSNQ6ABiG27bhsH+35g
	 orIYkpDYHF0gMmspe+kGY4tiw3v4S+DhGnyRchfk182+4uVW/h0q0Bck4vKSIi/gBMUCc
	 4Ten03h/AkfVSV5pQht7qI/sZbhdBNQQA0O/9XdWMbf1+HsaDhZFvyJwdtW7DZ3hizw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sbwI2/eV";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02F0606A31A
	for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Nov 2026 06:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D02F0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sbwI2/eV
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38692f62b22so1328492eec.0
        for <oe-linux-nfc@lists.linux.dev>; Sun, 22 Nov 2026 22:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415599; x=1796020399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+NdFSCwXjzJeLngRwlLE+1QgBgKdpmNBcIPuiYsBGM=;
        b=sbwI2/eVqwzcSICpUhVeGBNiMXf+g9DgPNz4522GVGouCTVFYCVHwwHeiIwVPnVP+W
         wg8Xcz+rwB2sQOx76kqgfpGtXdycFov7pWxT2bD47n/6ACkiIo4r4HPaLITI3AZgwm9h
         nBjs5H1DZpXUw47gkHt9hGHN0w2IjyseXlJ5m382pS6paPrfI5+aVIwDe0UMPT1Ka2gU
         7DGTg9Sv7ca75+927hxRKz0jMOkFPTvfJ+HHohnfMS6Yc54iZTGnOjRRbHVyZX6eT4AM
         euUXN94/P91cWr+4nTEIo6jvTKvkYvFcm85KANy6EWKqyaJ90Wnf161vXtr+xicbECaw
         y2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415599; x=1796020399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+NdFSCwXjzJeLngRwlLE+1QgBgKdpmNBcIPuiYsBGM=;
        b=XVOo+mEVCvvjexfwPUfRVJIvQVfBtuJnpWi8YHZSHJbeTIRMPoMtUkxNonobys3v+G
         gteNQqxuvKHpc1X4oIazD0dSdxhPYcp2cWR4Z9dh56Iwzp5eqXnXL7FWE/YEpNxFX1OI
         9OfVKX6+6jGv68JYL4CGJmh0pmUQffvoPPt6R8PfLskzhi0g8XMD/8aL9uLnS+71nR6h
         1AAkTTeP2Q4Q+5FPYDHsuO+rUJE6RRFj1c8ZATZOMfcuOY7ThGo3wpX37SD4bgxJgdlU
         NgodaBkcyFNI6dIhlm3UQz4S+DgUC82JT903KcVDxtnFyXf58OwmajkglNRKt1/aaI6F
         Sm7g==
X-Gm-Message-State: APuU4Z+3n4utIJ1TjNUozdNcAkHluG3mYnhwAPFJIqogXiE1lJXLnJvV
	1zOjdvjSjTbrmahGbznHXIVIF5rAOylnBSa4t4CfSqBPsHpTiXMhSc7QDWwpFdmyNE1kR2UC
X-Gm-Gg: AZFdTZcwQzk9TT0jh6d3/u7wCCXTVFBuRmKHKHotU4mn22SkmV+7hdALEF0IAoQYXW+
	FP+LTijNj/XdN0gMieVw8/hzDdem8/XlFTEWLN0ett96yssoIyUI/BEaP7W+ktHQ4MQ0eAl/ds1
	tR4jDHyMLTvSjtfzc8sNTwHRaIfVIvievvUuABPi+AbHfPGm0BV0eNB3RbLzMLZS+MSCe9mVx6h
	uHXj0iAK87ISIZaunMDi4U8c91LePYt46Wn/KJdXRX1vx5hY2Q+gOeycU+tJDNeyM1gpk9iE/yz
	T5drLcB4hrzO5qAwFN8m5L92bBT7dAXgjgVE7aUp7rxIUgmr+6dCD+mPL0nuLTDGOZ3LH5iXwGZ
	kgu+pKbUYsXflH5YBBySDvXQ5Wkex00PmRMFB6+KNelTsOxYOPqb/ocSsFJWfuHDR86TnfdU5Tj
	MshxhG3N3DwKDC/E20fpteshfUDDZ/rbwaJt4ETtnDWvdYa0U5W8vdIGQdIvn3at/d8DE0EvRuw
	6eA3dXVQtpRYgzHTS9VqNrpPreXKJ/hPcuK3tLlFjZ1JdP8VXYbppZjDRzTO2u2ONJbJe8Z3v0Z
	Z0XVd2v/wX8gBALJZ/diClH6r7AXjmAIMCPa2KzJsS8TgQ9uH5wYqjdYLRfhV8ZmJyn/H20YCcW
	zawdCOFnzVMBWEYjj4D/1KdHTaVrx4xqATKkIIKf8GvA7v7g6ZtxiLid+/wUCS0jB++p4kjcQQH
	UsygZjKJKrcO5GZO3t8LCS3ZBjfjRBF4VhR/yS4cnWjJe/
X-Received: by 2002:a05:7301:e0c1:b0:380:c3d7:c263 with SMTP id 5a478bee46e88-3856c0d076cmr12988626eec.5.1795415598719;
        Sun, 22 Nov 2026 22:33:18 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-47-129-70-252.ap-southeast-1.compute.amazonaws.com. [47.129.70.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm35452817eec.24.2026.11.22.22.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:33:18 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	"Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
Subject: [PATCH v3 0/2] net/nfc: fix skb ownership and NCI status errors
Date: Mon, 23 Nov 2026 14:33:08 +0800
Message-ID: <20261123063310.1267-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

Hi,

This series addresses the review feedback on the v2 NFC callback-ownership
fix.

The issue was found by source inspection during a callback-ownership audit.
The NCI receive path can pass a non-NULL skb together with an error to a
data_exchange_cb_t callback. The audit found consumers and wrapper callbacks
that returned or freed only on success, leaving the response skb unconsumed.
It also found terminal Digital DEP error paths that freed exchange state
without completing the callback, and an NCI status conversion that truncated
negative errno values through __u8.

Both the baseline and v3 x86_64 kernels were fully built with NFC, Digital,
NCI, HCI/SHDLC, NFC-SIM, virtual NCI, PN533, PN544, Microread, ST21NFCA,
KASAN, and kmemleak enabled. All three full build logs contain no warning
or error lines.

The QEMU TCG test ran 32 NCI 1.0 MIFARE exchanges with status 0x01. The
harness provisioned the virtual controller and polling session, then ran
AF_NFC operations with effective UID 65534. The baseline returned
SO_ERROR=-240 instead of 16 and kmemleak reported 47 unreferenced objects.
The v3 kernel returned SO_ERROR=16, reported no unreferenced objects, and
produced no KASAN report.

A test-only KUnit overlay, not included in this series, ran ten callback
tests covering Digital DEP completion, ST21NFCA callbacks, LLCP error
release, NCI loopback and NCI-HCI errors, four HCI wrapper branches, and
PN533 response aggregation with an injected allocation failure. All ten
passed. Real NFC controller hardware was not exercised.

The final QEMU run used one vCPU. A two-vCPU KASAN boot hit an early
enqueue_task_fair int3 before userspace; it did not reach the NFC tests.

Patch 1 documents the callback ownership contract and updates the affected
consumers and providers, including terminal Digital DEP completion and
fragment cleanup. Patch 2 keeps NCI data-status errno values signed.

Best regards,
Bin Luo

Bin Luo (University of Electronic Science and Technology of China) (2):
  net/nfc: fix skb ownership on data exchange errors
  nfc: preserve NCI data status error codes

 drivers/nfc/microread/microread.c |  3 +--
 drivers/nfc/pn533/pn533.c         |  1 +
 drivers/nfc/pn544/pn544.c         |  3 +--
 drivers/nfc/st21nfca/core.c       |  3 +--
 drivers/nfc/st21nfca/dep.c        | 26 ++++++++++++-------------
 include/net/nfc/nfc.h             |  5 ++++-
 net/nfc/digital_dep.c             | 32 ++++++++++++++-----------------
 net/nfc/hci/core.c                |  5 +++--
 net/nfc/llcp_core.c               |  4 +++-
 net/nfc/nci/core.c                |  1 +
 net/nfc/nci/data.c                |  8 ++++----
 net/nfc/nci/hci.c                 |  4 ++++
 net/nfc/rawsock.c                 |  5 ++++-
 13 files changed, 54 insertions(+), 46 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
