Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553090;
	b=mAai0tsebPitp7an3DY1aq0/4bqAG+SRKp5A3ZHPNQS2WSlE5OYJoO9uCXI7YnvZjYRd
	 YLI1nOgfcnqjNBYQtmS2lJ2SzibO19H1WU8zP2oK8m2lB51IQCzCX9YyJwSUsK6Ppdj+u
	 XMa8afI8Kr7ar/AYcDRfynlyDPgZ4eoLE/2fvMXjI7ylU/HXlKJg4lO2g9HtH0rd5xWqU
	 lH7/HMqSOspQ1f61ms8GWCFBVluIqCo7tWAXrAMBI7VHU9BsFYJbrh9KdtcFioseiYipk
	 aleZTGUw4EXE4ZCheMWG85Jk3ctVqT7yQphLR9a8VIe2smsM7D0g5gtutSUkz9PgJrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y8qAdHKhHoP8DpQW3B1dUXlYVRW6lqzxu3F7cl++c/0=;
	b=WMyKKwCcCcWFV9hXtNLBnMfvy5WlA/MzCKcfz1PG+MBlGCjYkW9SROplcg5Hvd34budg
	 B0s/GAklMIkeUG1f7lXciuiUNRK7nVzzne+bVOwEqM9rB610NyTZ87MjhJSFqqSSs5iKg
	 imwtw813ErgncpqTOOVgO+cROE+QXvyl279OMwsJjHKiMJTrZXsSXHy4ZqiabUPGVyFGs
	 XrAX8epL6fT1Vyskb7xIWaIxV5kKXt+r64woprRZqC3R0zaWsIUh4n7vKLIBWwUTsWnPM
	 fDyDjzcIRSEMjclNTqUiET8y7ccuAwqB+FQeB1c9XaiTMZ7jPVgdy5DT6vULmTRCxNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=octane.security;
	spf=pass smtp.mailfrom=octane.security;
	dkim=pass header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=Spi4q42S;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F4F606A31C
	for <oe-linux-nfc@lists.linux.dev>; Wed, 21 Oct 2026 03:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5F4F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=Spi4q42S
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so175120a91.1
        for <oe-linux-nfc@lists.linux.dev>; Tue, 20 Oct 2026 20:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1792553089; x=1793157889; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y8qAdHKhHoP8DpQW3B1dUXlYVRW6lqzxu3F7cl++c/0=;
        b=Spi4q42S9xkVLN+Yj9FhTXT7aDlMHYzeZUIRfiyM//oCi9s5OXtfsgZ1Q+RyYbitjC
         4vWP3jOzNPT0VLk0IZttswDYMDr06lQIxuI7hvT+dH71bFqGKh591b9FsaQ16BaNDQkG
         5txICMIIxI6/5/IfU5AlwxaIEH1OgQUqhBvlKfxw+O44KCOOvQe0VIGT5rtoHESl2dCh
         ix3/fUhqwk2Nip9mkL6eN3u0wTVU6TbwLYDjVhQuoKlITaBkiRCVoiq17qCrD6DkQMCA
         Ap2I/kspuc/vsbSAa5ZCVg2RS1F3MAVnC0zFPzM8zI7g1vgwQoM1EcDtk+NnUZlEx5rr
         kXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792553089; x=1793157889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8qAdHKhHoP8DpQW3B1dUXlYVRW6lqzxu3F7cl++c/0=;
        b=n60bthlNrShjKZJuCYyeFSx6+Sx0TdU5SoMb0XO0vQxwtTqx5nvYTKd2mYiJmNwpcx
         /jjA/x2su9lpTg5QPAwtcFAsh+FIb4VEbINe4QiDru6fDF1d2Flu8B/nBbyu6TrlDKxc
         QHLP1ybU1Pm3YzCcp1eLSCvBemhW1E00ZEe5WXlmlDRpmbNQmjmbo6A5n/WxfXa8nOdA
         lZ4p5oY1aGmBmSltGsr6EsEd+gHw/IOpDxO97w2C9q4PQMbwSYztTc+R+8LAraWzZN//
         T6zmCNvJSFa6xTb0/l7NDl8lvNeebHUrsT3qGuDtxYmn4MEraNdxl2K5EU5GTj//fP8j
         DX7g==
X-Forwarded-Encrypted: i=1; AKwUvBwU/rSOdHxE5WnzM0TRV09mN3NXk8ADr5nCkaPDeSt/Ji3aW9l2fKUpB6V8Kk6fYguhHtsZN72FSSN0OvE=@lists.linux.dev
X-Gm-Message-State: AFq9FYIz1VG4XXBT+0B4zTb206mf6QzHjNNKqE3nIJHMRMINjbi5a3Gm
	oB9ekhdx+P1U+5HzbZ1r7cjeFKlAv5kbgs7fZlipHfWOQgDVH9vntbL/ldIvBEgIxG8=
X-Gm-Gg: AYBFou0r3gZ5M8FGsWaYveazL+6iC/jIS/llO2nmRe8RSI7huK17Iczd+Wh3CewZGjF
	zoOHs7IXZWpKfgdWii1r5e66zQDJt8sRFAFVfaKgaE5X7BYIw0pQP51QJDhCtvXLCdT/K5WT40T
	qKKig2kiu0y3w1YYJncCOxzi52gPupxFpP5mFfNsMsvfrcVO1otGCC4eZSBRYgVW5+ni+JPMTJ8
	WeILwyEK2BbjImmucrJrFR83eF4Z3AweZ+Q5dNUZifOt5n+wlrmuUlbxcOEr9y6B9u9EwGfTvtC
	JXmyF9JhGG24ZyEis6AhgnLdKWQMC3rVA3oVTcPEP9tB6VziErSneYSJjtPe4mg886w8w7IIjXi
	RHB2fp0SKWOfV2dRewbICMFYK//IgoCUSYInqhQ6GjvEQa2wN0hb5UXy+HEfs9BvxI03RYG1/7W
	QWgpxjLBIsLyflKS5p+WaUIeMXOA3msTzvbsx4V48mfuckZhmry22NGklVx8OedDM95UHY0E5tv
	OglhQKo9yJWRxhIBhgViu+S07J54HAPQThir6mq11uHBQRX/DEa08LfM/cRHiHpHYAbJ+cA9oTs
	Ox/rPgSf4a3JskgMAV04mPoZuBRvdPLOAyL5f15wdMQemPuSSp5iii9pSiiSX1Ow6DCqMFE2P4Q
	5
X-Received: by 2002:a17:90b:4c04:b0:3ac:a491:3cf8 with SMTP id 98e67ed59e1d1-3ad86da24e4mr747324a91.43.1792553089020;
        Tue, 20 Oct 2026 20:24:49 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8030226csm2155285a91.12.2026.10.20.20.24.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 20:24:48 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>,
	oe-linux-nfc@lists.linux.dev,
	gio@octane.security
Subject: [PATCH net v6 0/6] nfc: fix NCI UART and firmware teardown races
Date: Wed, 21 Oct 2026 08:54:37 +0530
Message-ID: <20261021032443.44412-1-shubham@octane.security>
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

This series fixes ordering and lifetime problems in NCI UART registration,
teardown, and nfcmrvl firmware download.

Patch 1 avoids issuing CORE_RESET after unregister has closed admission to
the NCI device.  A normal device-down still performs the reset.

Patches 2 and 3 serialize UART driver selection, protect the transport
registry, detach TTY callbacks first, and drain receive and transmit work
before the transport releases its private state.

Patch 4 publishes the Marvell UART state before NCI registration can expose
the device and rolls that publication back if registration fails.

Patches 5 and 6 serialize firmware-download ownership, copy completion
metadata before releasing it, and drain the Marvell receive and timeout
paths before unregistering the NCI device.

OpenAI Codex, gpt-5.6-sol assisted the source audit that found these
issues.  The UART paths were reproduced with a pty-backed NCI controller
under KASAN.  The firmware paths were exercised with overlapping download
requests and repeated download/teardown cycles.

---

Changes in v6:
- Skip CORE_RESET only while unregistering; retain it for normal
  device-down.
- Detach the line discipline before quiescing generic UART callbacks.
- Serialize concurrent NCIUARTSETDRIVER operations and the driver registry.
- Publish and withdraw Marvell UART state around NCI registration.
- Serialize generic firmware-download ownership and completion state.
- Drain Marvell firmware receive, timeout, and queue state before
  unregister.
- Add the requested discovery details, Fixes tags, and stable Cc tags.

v5: https://lore.kernel.org/netdev/20261013025746.41292-1-shubham@octane.security/
v4: https://lore.kernel.org/netdev/20261006115532.72100-1-shubham@octane.security/

Shubham Antil (6):
  nfc: nci: skip controller reset while unregistering
  nfc: nci: uart: serialize driver selection
  nfc: nci: uart: quiesce callbacks during teardown
  nfc: nfcmrvl: publish UART state before registration
  nfc: serialize firmware download state
  nfc: nfcmrvl: stop firmware work before unregistering

 drivers/nfc/nfcmrvl/fw_dnld.c    | 199 +++++++++++++++++++++++++----------
 drivers/nfc/nfcmrvl/fw_dnld.h    |   8 ++
 drivers/nfc/nfcmrvl/main.c       |  19 ++--
 drivers/nfc/nfcmrvl/nfcmrvl.h    |   2 +
 drivers/nfc/nfcmrvl/uart.c       |  31 ++++--
 drivers/nfc/st-nci/vendor_cmds.c |   8 +-
 include/net/nfc/nci_core.h       |   6 ++
 include/net/nfc/nfc.h            |   3 +-
 net/nfc/core.c                   |  19 +++-
 net/nfc/nci/core.c               |  12 ++-
 net/nfc/nci/uart.c               | 220 ++++++++++++++++++++++++++++++---------
 11 files changed, 398 insertions(+), 129 deletions(-)


base-commit: 1c1e8c24d537ba6133f08f523a2b8c626da4e966
-- 
2.43.0

