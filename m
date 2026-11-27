Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786838;
	b=yIIQ6GL7JOlcvLVrl3bx0tCykAnrL8LD7pNbtXA042R1Ve8c1qkq1p+D+dcvtvu5fZ+i
	 mSOA2hsVh/PIma9dRFE3wi+uoCwNJgquT4sccDSXQMwzsb+GNw6VItUEhDmAI2u5zOGaf
	 mhL++dbDeV0+zT5a2mHPyBNebB1sMMK0Mk9raRw/G1ezUBHrxq3kiV+Bf0m9kN+IB5WN/
	 Ts0eD8mEMKmveMZRH79i0SZCjaWG7cBMolFxEZWXxguvMxpoiUmgtlNUDLQawXR4G1wDO
	 isylkBlafazRTHaJoH8Gfz72rquQWy9Cv+mgK4C4hmjo50wg74QjaoDuF8WaHoIeBsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CoVAookeqxpBctfLqaghk9pJLGpO39zMMXshAYvBqc0=;
	b=xY+2PPK+0bUXnRWxmZyh3LkNfQIXOMCPutr45V4WFDtIuvz6VvEDR8uMjdfB237qv3Yj
	 erFK5CMQrhRt5Lz+Xz5jiApFiKaeRh8qp+kmq6z3KRKqozZgccw9yPTl4b/q71U9SRNAT
	 HPWTwyOSgNzPx8cft0wm8b5yQHqRA4+s8avfd29WQJ85ZaY6tqCsoz3Ah8TVooP2us2mO
	 XFR+Dj8CZR9V3jwSjB43tVGxsr+mSgder7Bz3OJIpkUluqvLhzICQWojUF6ETb5R3o4pw
	 t/GaJQXHbUa1v2meEN9qz22Tg156my83i1WLD6RWQnd6ZgkY8M8cfI1iQJAK/cOXyVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fmgfBxeD;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA0606A31F
	for <oe-linux-nfc@lists.linux.dev>; Fri, 27 Nov 2026 13:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CDA0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fmgfBxeD
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b271e573adso3491074b3a.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 27 Nov 2026 05:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786837; x=1796391637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CoVAookeqxpBctfLqaghk9pJLGpO39zMMXshAYvBqc0=;
        b=fmgfBxeD8aGlSYv27VK4iLd8xdJ0yNjXqQlMpPPCaFTVkIBKdhvRcqqwg9TQKVdrLd
         KgPN4nHaq7B3AxO8x9U4Q9RXrBQFVr3NUpMH4Cmjw3VjkSbe56rBKRA66ntXDusgnknB
         9gv7OOtl+LfJ9AharEoujtcMAA2bE0B9ChdB5zhuafj3XW1ZZsjyZ/1Ex9AltLOeP+/U
         FM0YMpzhi7p4ckwgAmHgW5oKIvBUzGCOHn8VyyUZtLX2/1RK2XHTgpI+ZDIaBvhgZjSd
         qKA8ivSTEsvynoA4vwHNeVtOHoMIP+ucjkp6RpgAQt8s4SnLt5vTug4rJBnPypClwWRM
         47kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786837; x=1796391637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CoVAookeqxpBctfLqaghk9pJLGpO39zMMXshAYvBqc0=;
        b=QFCsF69DYNMtFEnVIr5qHpP7jkrdR4+AMMIiUrVTpnsNPA+ccC8GklzDZVqWqXyDjd
         lvgLpQfPGH/Iz3HHmYSfwjPiAUnVs+n5PdohOGFQHQqL95l64qCd5GxdatScU+qw4YA1
         c/yXyo010++CJeOU5wPhTuFO3Ns9zEoLFJQmwFShck4ihL13O6QzYhZSGCw525QWjghk
         Dd0LsZrYUprRx3T6Z+WqIrQm2TVHoF8R+5WyIeHfEV1Re2AkurrugARx50hboMjRgeee
         Wc9jB2vY1Fym3BivTq7Y4HO1mOrTBtuQEv3EvwRMRtOvWqrKNMUtYUNYVh7k3LjGJr7A
         80hw==
X-Gm-Message-State: APuU4Z91z+6TK4BD19aHxRYc2lK2d/Y7CFJOucP9PVAxF/A3OzOg4u6M
	5M44Y0AIUWfl+fYZJ2k7jMTLX0MiGmVdXXuZxMqJv1D4A0vfQkDHlIlP0+EJMjfMNI/Znon+
X-Gm-Gg: AZFdTZfspUk1QXKNKLXeZJbnuUKMxYZG1OnZCSL98sUoAG+Acbeq3Htgpf8iJAh4dr0
	y2IS5KewAY2t33bLKofoyfN7iwCIlTBaXkkSWVMaFF/aEoMMrgHYzyK4ho92ms1sPr+Yv0UoviG
	PNgFmeAE7FIs4IGXCqclKH+BapnJnGHNIu0OeYZzo4xLTWTihPrrnLmABkQztqYK/1CqlwULCLv
	rNVZbLYwbjXRrJ2SC+G8BWareflsM2gSJpYa7DSXccu4V0gCrJRvwcK97KalzAeEF+XIkgNzHrZ
	c5Wj5edWgo1cSht8whkgfMxvu7HzdBsJ9RGTVNCAS4ABECEZOGMJkfiCFkS3jtdjl5PN+yOU68x
	sea1bOh5Flxapwv9uyc+n0Tey9sb6lWLj8m5mjpiuCLVjfylqMozouAj5FluJQkrlO0VNN4iUgR
	t4NTdQdO6c1WVzVwIW7ukenn+/usiScnB5rET1+Tk1yPYRH7sv50haRtK4Z9r496Nvbq7yDgsF9
	3OEoQ9d31GpfxaY6ep8a+rofZ1iUwVbL21u+QTUMxtWHiR3/NuZ6h+/A5QU0rAQN/wmYvcQmC+j
	mnuHJcC88QDa2uy9NWIZ9+yHfpOmoKLGSyGF+2yw8iCCVCtZNUktyVNcW5yoYfWlzkJ3lITRDXs
	74RTGwCFOWkDxlIR1MBlIkxCP/xhbgZBKAlHnALPirpn6nF3CZjiEI0h6KaW70K3+J0/fT1PJJA
	9Dv2/jZXSZipgQFrSu+KBChlE00ocWXPEgVd1tCvw=
X-Received: by 2002:a05:6a00:ab8b:b0:8a0:1dab:fd50 with SMTP id d2e1a72fcca58-8c87b8da580mr22941464b3a.20.1795786837347;
        Fri, 27 Nov 2026 05:40:37 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285b60csm12705838b3a.9.2026.11.27.05.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:40:36 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v5 0/5] net/nfc: fix skb ownership, reassembly cleanup, and NCI status errors
Date: Fri, 27 Nov 2026 21:40:24 +0800
Message-ID: <20261127134029.1813-1-luob87709@gmail.com>
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

This v5 series addresses all four findings from the Sashiko AI review on
v4 and includes the discovery method requested by netdev-bot+sinfo:

Changes in v5:
- Split the former v4 Patch 1/2 into four single-purpose patches with
  accurate problem descriptions and complete Fixes: tags covering each
  affected driver/layer:
  - 1/5: Document the data_exchange_cb_t ownership contract and fix
    callback skb leaks across rawsock, LLCP, HCI/NCI-HCI, Microread,
    PN544, and ST21NFCA (explicitly covering ST21NFCA DEP success-path
    leaks on READER_F, r < 0, and unknown PFB types), synchronize
    HCI/NCI-HCI rx_hcp_frags with a local splice, and accurately
    describe the nci_nfcc_loopback_cb() NULL-dereference / !conn_info
    leak (noting the current mainline NCI_DATA_EXCHANGE gating nuance).
  - 2/5: Fix double-free of resp after queueing to dev->resp_q in PN533
    (both pn533_data_exchange_complete() and
    pn533_tm_get_data_complete()).
  - 3/5: Fix missing completion callbacks on terminal errors in Digital
    DEP (preventing hangs and socket refcount leaks).
  - 4/5: Drop stale ndev->rx_data_reassembly on NCI data-status errors,
    unconditionally on CORE_INTERFACE_ERROR_NTF (outside the
    NCI_DATA_EXCHANGE check, covering listen/target mode), on
    data-exchange timeouts, and in nci_close_device() after
    flush_workqueue(ndev->rx_wq) on both close paths (guarded by
    req_lock and !NCI_UP).
  - 5/5: Preserve signed errno codes in nci_add_rx_data_frag() (former
    v4 Patch 2/2).
- Document the discovery method in every commit message (static
  call-chain audit and code inspection, with QEMU KASAN+kmemleak
  reproduction for the NCI status truncation and rawsock leak).

Validation:
- All 5 patches apply cleanly on v7.4-rc5 (4dce97c6c265) and pass
  full-tree scripts/checkpatch.pl --strict (0 errors, 0 checks; the
  only 2 warnings in 1/5 are checkpatch codespell false positives on
  the verbatim upstream commit subject of Fixes: 97f18414af39).
- W=1 compilation of all 13 modified NFC object files (rawsock,
  llcp_core, digital_dep, hci/core, nci/{core,data,hci,ntf}, pn533,
  pn544, microread, st21nfca/{core,dep}) passed with 0 warnings and
  0 errors.
- Full x86_64 KASAN + kmemleak bzImage build and real QEMU TCG
  verification (32 NCI 1.0 MIFARE status-error 0x01 exchanges as
  euid 65534 over virtual_ncidev): all 32 iterations reported
  SO_ERROR_OBSERVED=16 (expected=16) with SELFTEST_STATUS=0, 0 KASAN
  reports, and 0 kmemleak unreferenced objects.
- Real PN533/PN544/Microread/ST21NFCA hardware was not exercised.

Best regards,
Bin Luo

Bin Luo (University of Electronic Science and Technology of China) (5):
  net/nfc: fix skb ownership on data exchange errors
  nfc: pn533: clear resp after queueing to avoid double free
  nfc: digital: complete DEP data exchange on terminal errors
  nfc: nci: drop stale rx_data_reassembly on errors, timeout, and close
  nfc: preserve NCI data status error codes

 drivers/nfc/microread/microread.c |  3 +--
 drivers/nfc/pn533/pn533.c         |  2 ++
 drivers/nfc/pn544/pn544.c         |  3 +--
 drivers/nfc/st21nfca/core.c       |  3 +--
 drivers/nfc/st21nfca/dep.c        | 26 ++++++++++++-------------
 include/net/nfc/nfc.h             |  5 ++++-
 net/nfc/digital_dep.c             | 32 ++++++++++++++-----------------
 net/nfc/hci/core.c                | 25 +++++++++++++++++-------
 net/nfc/llcp_core.c               |  4 +++-
 net/nfc/nci/core.c                | 25 ++++++++++++++++++++++--
 net/nfc/nci/data.c                |  8 ++++----
 net/nfc/nci/hci.c                 | 23 +++++++++++++++++-----
 net/nfc/nci/ntf.c                 |  4 ++++
 net/nfc/rawsock.c                 |  5 ++++-
 14 files changed, 110 insertions(+), 58 deletions(-)

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.51.0.windows.1
