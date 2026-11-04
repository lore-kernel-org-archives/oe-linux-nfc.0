Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773233;
	b=AmTHf5rEEF6V6r7tX1sS6C14eGCa7lyCStj1Vl7GGIei6UdlBTuHVKwy6YIzu7gwjyJT
	 zLRoQp+teUxsu5KxoTZ33l+3TFSlNIltlLPJI9LTbCYLSOPt0qvpGEzXPpR/kQLnn0msH
	 h/ij/Fty6b1V95ybqMbuOL88/YSjO5AK/PvdLVWgo+bSunY2KfM2C9c9i99UV/EWNnwom
	 pB0ZD6ZiZxxeJUvVFKJPdfa3uLp1M079B6zGHYWTK7i/ooZy81vSMtcmH0sy1naXSknYw
	 GkGRNGNlc46P1pIl3nx6RviOheUtnncGa97OVWi5gmOxvuY66jlhGSH8niL471+DGKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=j/G9eZEhmGI9eqew3mTdn9uzfzxC/cn4soLSuXEetZU=;
	b=l3BxzLG/2x3og2xw2ygLSqB+7eEJfRo6z6y23USX1yFdc+dcQi86vE0LwHfAE+LHz+vp
	 NbgIWZI5xirUC6mIJHDIeYwHvjFpW8oq3gHaXM/7LMx0z1QqxgR1C7VyAVt1NU7qPnkux
	 Fp6NEpBm7o/nOlEezpbSFXsIf9QVrbZVosQy48aYBgkxGxs5Td9/8MY6TuZlYFgjsioFh
	 Qy5Eg55EIRl07BpIyDq/9bacF/0n7Xv8vruWaTRBSZiCzqStSRHSeFtodDxClShbrmaHx
	 BkLe9jff/PlomAgM+XnPQjCJ4N4Yn8uLpngFMrcn5ZJVEL44TU+8PqBvq1b1LzeJKTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=octane.security;
	spf=pass smtp.mailfrom=octane.security;
	dkim=pass header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=AWQDlGD0;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CFA606A326
	for <oe-linux-nfc@lists.linux.dev>; Wed,  4 Nov 2026 06:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4CFA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=AWQDlGD0
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15dd124bbe7so791890c88.1
        for <oe-linux-nfc@lists.linux.dev>; Tue, 03 Nov 2026 22:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1793773232; x=1794378032; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j/G9eZEhmGI9eqew3mTdn9uzfzxC/cn4soLSuXEetZU=;
        b=AWQDlGD0vBn8qDrRq/pxGPavAlvd3vyrolftRlCTWISh/waJo4Bukijtxmqgznzedh
         RLcsSceVDqN9P+A3l7S1XJc1Xa2sdhlfzTGSRVNdmT3a0B+ZQQT6jAMCWV6NJpikA0O4
         keWQZ5AwMb6WgrjZh5ZjUvHeBKkeTwUuuFj/xU9SNG9t2nYq6zAbKvH//hjmzkXWKWtj
         +1DXPBSw5Bn/6D2BJVMjK2XmdQUKwVSnu0NwYQh+UjrKkJLQrsEi8nPP3s5WZ3i8kGnq
         k970GKEL43FhaHGoRv4+cHBoUYgM7W3XCbWjiNknD+R0XcRR37oSJToohJHxVfZGrt34
         ZZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773232; x=1794378032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/G9eZEhmGI9eqew3mTdn9uzfzxC/cn4soLSuXEetZU=;
        b=gQKIDV8+HIdyrWi1eJGTF7PBiapchVPW18wKlFTP9x2kov261fBFgNCsGnt67XtWJZ
         pBZ5bRWFYZN91QDYAtA+07NXbfm5OjfwE8qIefXlNDXhk9B1P1ZXy1Pm7eEcvDV3C5+P
         yDxTfl6dDuVxALF8S5Nnq5DCcjPA55uoVXBwT/A8wIvmGPX8sjUp9LA6omFvOf+TfeMp
         dM1kF330JNq5WJDoC/M1M30RpGmiTojQNKxljUgSOBV5+hLIc9IU+J+T5KMhNxY9swHI
         15Y9acF46b+ycz2G3ghSYPn4UClqQ8iYBLmFwG5LjbxqOsD/1ihLnNDJtD1WB8DQJbwf
         UL3w==
X-Gm-Message-State: APuU4Z+FXycIVnNAgPyhoRh92lY9XAoA0mfD6M12xT1FwSk2KVrqRZkz
	gv+HuJv7FFcyAXW2QytS46dlk+CxNRVkd5gEt/ThcI9C09extsKOSVL7VjKBQWlIOvA=
X-Gm-Gg: AYBFou0j6n5hUtTjTPj9InICUAXh9zbJVlu63KVzkPCB/PP95Xu5mQVI53JZyvPvqVu
	9IVBADOteZAv6lFq7vrY/ix7mkpQaR/lMGXumNJqLpfmrXDE+40fycF42nDJl6GI8b6RZIXGo9r
	UQ9YMDyvYHnC/EEH4lxzq/IS1Js9C9ZH9NErUdIRJIy3DxilvDfRpJQvQP9xbBZP2/ghmusdf7n
	/SOuv8R0dFwWpAycdqU/9YVl9SvO+FeNmdYW+ArJ6UCdiui9MNTYxpD5qBKYTpLZx22b4niBWzb
	CZDGr1me5LBkHxZjv9kDPpzxyUmBW6/uiMHZVaJkFtPuZ/34i0VRWFs9qbgoaWqef8bAjT9tCj6
	UkPe0YKO4ydkIn0Q6GIRlnEFE72QXTtVd9Wv/FLEh1DUXYuARx9WNq2gKVwW9spf6UmCoj6xx/I
	zeewo2NV0q91IMO2pluNDYg23Ed0bIx0MrbSv8Y/iVr3WFNGlmnnh8UREufWHkKSx5d564QlsAk
	GN5zOD+ii92HVBk8Uas6tD1AOpZKo64mRXGtUuwjwLJCYQLquBHSdR3K/3tG/rWI/qTHLi4MwPB
	SandXIScILCtT4dGl6oxL9FxQL0Lg0x+k3cdywxw9qZ2UolRknZzxNaL4WyWvfrRUzEZGtK31rY
	NvzBPFKWgiEF3om4bwizwrq9WJJ0pRhF/UGQZeUwD23T2hhAY4Q==
X-Received: by 2002:a05:7022:281:20b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1ade9e3e335mr21918851c88.31.1793773231590;
        Tue, 03 Nov 2026 22:20:31 -0800 (PST)
Received: from localhost.localdomain ([103.196.55.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c69c3fsm4486279c88.20.2026.11.03.22.20.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 22:20:31 -0800 (PST)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	david@ixit.cz,
	horms@kernel.org,
	gio@octane.security
Subject: [PATCH net v7 0/3] nfc: order NCI UART and firmware teardown
Date: Wed,  4 Nov 2026 11:50:23 +0530
Message-ID: <20261104062026.80599-1-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
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

Make NCI UART driver selection, callback shutdown, and Marvell firmware
download completion explicit and ordered.

Patch 1 serializes NCIUARTSETDRIVER and protects the driver registry while
a transport takes its module reference.  Patch 2 closes UART callback
admission before private state is released, publishes the Marvell transport
state before registration, and preserves the unregister-time CORE_RESET
before quiescing and halting the controller.  Patch 3 drains the Marvell
firmware timer/work/command dependencies before NCI workqueues are
destroyed and prevents a new download from replacing state which is still
active or completing.

The firmware overlap guard is local to nfcmrvl.  It does not change the
completion rules of other NFC drivers.

Source auditing, patch development, review triage, and test planning were
assisted by OpenAI Codex, gpt-5.6-sol.  I reviewed and tested the resulting
changes and take responsibility for them under my Signed-off-by.

The series was tested from the stated net tree base with:

  - strict checkpatch and git diff checks for every patch;
  - targeted W=1 builds and sparse checks;
  - a W=1 allmodconfig build;
  - an allyesconfig W=1 compile through vmlinux.o; the final global
    objtool pass could not be completed on the 8 GiB test host because its
    working set required heavy disk-backed paging, while the affected NFC
    objects compiled without warnings;
  - a full x86_64 bzImage and module build;
  - KASAN, UBSAN, lockdep, and DEBUG_LIST enabled while exercising a
    pty-backed user-space controller through reset-preserving lifecycle,
    concurrent driver selection, registration/publication, overlapping
    firmware requests, and firmware teardown cycles;
  - a separate strict-mode KCSAN run over the same lifecycle and race
    surfaces.

No in-tree selftest covers these NCI UART and nfcmrvl firmware paths.  No
physical Marvell controller was available for testing.

---
Changes in v7:

  - drop the generic NCI unregister/reset and firmware-serialization changes
    and keep both fixes local to the affected transport;
  - retain the close-time CORE_RESET and halt the controller only after
    unregistering;
  - fold Marvell state publication into the UART teardown change so each
    patch remains usable on its own;
  - restart a queued frame when the transport publishes READY and balance
    tx_start() with tx_done() when teardown catches an active burst;
  - replace generic firmware serialization with an nfcmrvl-local
    active/completing gate;
  - drain both directions of the NCI command timer/work dependency and purge
    commands which can no longer run;
  - hold firmware frames until the reset pulse finishes, queue timeout
    completion on the firmware workqueue, and preserve positive errno
    reporting;
  - drop the stable Cc because each patch exceeds the current stable-tree
    size limit and would require separate stable handling after review;
  - document the discovery, validation, test environment, tool assistance,
    and selftest and hardware coverage required by current netdev rules.

v6: https://lore.kernel.org/netdev/20261021032443.44412-1-shubham@octane.security/

Shubham Antil (3):
  nfc: nci: uart: serialize driver selection
  nfc: nci: uart: quiesce callbacks during teardown
  nfc: nfcmrvl: stop firmware work before unregistering

 drivers/nfc/nfcmrvl/fw_dnld.c | 243 +++++++++++++++++++++++++---------
 drivers/nfc/nfcmrvl/fw_dnld.h |  11 ++
 drivers/nfc/nfcmrvl/main.c    |  18 ++-
 drivers/nfc/nfcmrvl/nfcmrvl.h |   2 +
 drivers/nfc/nfcmrvl/uart.c    |  28 +++-
 include/net/nfc/nci_core.h    |   6 +
 net/nfc/nci/uart.c            | 235 +++++++++++++++++++++++++-------
 7 files changed, 419 insertions(+), 124 deletions(-)


base-commit: 21f57ec673a1917547c808cfa81890485fffa03b
-- 
2.54.0

