Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693DA23E342
	for <oe-linux-nfc@lists.linux.dev>; Tue,  6 Oct 2026 11:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287742; cv=none; b=BKAqbUx14XTJC7XwrYmcGubqr1dBCvx8i98G3wlIHX2lOm/bKG/ZDd/Pxz3KJWWQbNM/douBk0CoYT0vtLACNT1jgIw7PLGaJcoyQuF/w0T+C+967Tyz1DaScyr99iKDlkjyK8PNihnqjEV5Eo2N+NR9D2iUGWwzfR+V6aznlwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287742; c=relaxed/simple;
	bh=kXgW3qjo3KY6zHiH5OrCddi50NW2IkFEEVqHnddhBTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IkVKRxVrmNVt3WCCCjczW5RDwiDEymILW8VKjtnv8FG2oqzTihf2TqxysNeWtspVLOMrhZM4QuGii8Ly4W9OXR/wln74qgXA33dNawPudziK54jj+sS6ykkBGkmsR0akkUjnRtML2WCbfVBddXTogxMIY5s6KAZz8q9FWR8Ntkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=WVmHWuiq; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="WVmHWuiq"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-34bb8b31647so4488708eec.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 06 Oct 2026 04:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791287739; x=1791892539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=84Dq146BpPlH5Vbiz9syfTsSyl6UfDOj/cgMWw94ckE=;
        b=WVmHWuiqUkYyerT5Z8FplzCyqJg+LvRX41WHZdmSKkjlIkt2vl7bEzBeIQnBbE2FvT
         UIzYyxmMixgJ9XTJWQBZOmyg4j+/GjC19QWSpxfYWBcXWyhaoh3+xyy75uINWvvOiKBg
         YZ89A4J7iuiJkds/Z2s886Jhu9sJ+QAZR2zmUtIQiaArjo7i3uoAXnQJJc6se04T6lNh
         QCoh7ADgAY+xrGlZ8XXmL4tH/NZ4CjTeoWxOpU6365mh9B+MmPGvj/xJ5J8L6SWNu5vf
         lNyAORpvqxtAkhkV9um4F9BhBqT09+Cpi7R6mIbAyyxtT7UxPaA0EJmdrW68oMsfVKq6
         u/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791287739; x=1791892539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84Dq146BpPlH5Vbiz9syfTsSyl6UfDOj/cgMWw94ckE=;
        b=uJ5W9E7GzaifCSxIUIVaDfbEfH3wj1HpyM8cHXBCnLTztnghuOR/aFvTHqYdGWXdn1
         cfLXiabTljZ/Z9gezAaAbuGsJJQa3l/bS/gSGxNlf1j9MCQ66ej0JRYXQ6kf6Ig/HQmY
         9nvToK0/v0fbg6bQa1zQO3yi5WfxTyG4pZeQ8E0g+jKNNXOAl/1QUAG7czW3MOBu35i5
         f3Z32GxahTykWtpsXXc+YHv2Q3ycvsEGUR8KgyUeq/TdlFsAuwvEIe2oVhDvndPYAGIn
         UP93HYOPyrv7ncIcO9BKoDi37Z8EdX8TXMbAQPT5ZBMoMwcuOUZ2U1j+j/cXnByj6wI5
         rFbQ==
X-Gm-Message-State: AFuF++n5XfIVS4c6uXAzgoRsJDarF8DqAPQpo8c3z1ZwOVbCyW+OQzF5
	zW5zMiGxAflJPIVAd1dV497FUgW7LwZx+dt7qTyYDcX0tSoalM/MEqNeZfzEedpYQYU=
X-Gm-Gg: AYBFou3StIbFYbdi9AMP+NvjzGnIwmC7q3E06daXtGYICQ2KLavl8+tnhLWzeDVfmrs
	BAnz6VBg4yvktrXfaxzSw3y9tuUEZGMfnWDZWnpsNBknx0QBSbCDYnHL227wV+LUNlKn+d4LA+n
	gxYXWJPWL4lHDVukCdMj5sjJy7vzDGh2K8oNJV3FNveCfEOCmSZXLkc2yB95k79iprGDxZhYu9K
	eH/6wkBGVRxPNIJwOrK2aPFQYSWAMpN8MuNQqCKr8NovG0LJUze+v/XLJwtFu2k+EvpasotlNfc
	w+tZPQwILFPHnjL1VV6I6ioZcRzhOkeszRzmX7vG4x9gwaqOThHAHxBlGL7uAmfqCMVvQ46bKMB
	k7aJtR2Tm7YqGAXWFtMUlIu8FEYAcEnCcP/1Hol0GaAl0qL4R75XeIHr8gVFyeJW4nEzvk5gQ7N
	DSTriSMkLT4VjmmtR6j7KI1/QQ3OgD2BdQ+rg7W+BZyeF57ERHcg/G205LHwh/yagGMLMbHWP2D
	hchQLtRVTPH8UKl8C6MpLqvAEKNKadE4cXt1vtZkOoGPGfeoOrXB96BHHVbMiHJnPL/4mksm6px
	g3XJVXbf10AR2vRUzQM=
X-Received: by 2002:a05:693c:4159:20b0:345:84eb:7153 with SMTP id 5a478bee46e88-3514df99528mr1348121eec.11.1791287739230;
        Tue, 06 Oct 2026 04:55:39 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469f75fesm8638511eec.5.2026.10.06.04.55.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 04:55:38 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	Giovanni Vignone <gio@octane.security>
Subject: [PATCH v4 0/2] nfc: nci: uart: fix write_work teardown UAF (+ nfcmrvl drv_data)
Date: Tue,  6 Oct 2026 17:25:29 +0530
Message-ID: <20261006115532.72100-1-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a use-after-free in the NFC NCI UART line-discipline
teardown and a NULL dereference in the Marvell NFC UART driver that the
same change surfaces.

nci_uart_tty_close() frees the tx skbs and purges the tx queue before it
cancels the write worker, while the NCI device is still registered.  The
worker can therefore be re-queued -- by a tty hangup, or by the NCI core
still sending through the driver -- and run against freed memory.  The
fix follows the Bluetooth hci_uart ldisc: gate the worker on a readiness
bit under a percpu_rwsem and drain it under the write lock on close.

Enabling the worker that way means it must be enabled before the device
is registered, since the Marvell driver may transmit (firmware download)
from within registration.  That exposes a pre-existing NULL dereference:
nfcmrvl publishes nu->drv_data only after nfcmrvl_nci_register_dev()
returns, so a transmit during registration reaches
nfcmrvl_nci_uart_tx_start() with a NULL nu->drv_data.

 1/2 nfcmrvl: publish nu->drv_data before nci_register_device(), so a
     transmit during registration does not hit a NULL nu->drv_data.
 2/2 nci: uart: the teardown use-after-free fix; NCI_UART_READY and the
     module reference are taken before ops.open(), with shared error
     labels and the tx_wakeup trylock comment aligned with hci_uart.

Both are runtime-tested together under KASAN: the unfixed tree crashes
within the first iterations (slab-use-after-free in nci_uart_write_work),
the series survives 56000+ register/hangup iterations cleanly.

Shubham Antil (2):
  nfc: nfcmrvl: set drv_data before registering the nci device
  nfc: nci: uart: fix use-after-free of write_work on ldisc teardown

 drivers/nfc/nfcmrvl/main.c | 17 ++++++++
 drivers/nfc/nfcmrvl/uart.c |  3 --
 include/net/nfc/nci_core.h |  2 +
 net/nfc/nci/uart.c         | 80 +++++++++++++++++++++++++++++++-------
 4 files changed, 85 insertions(+), 17 deletions(-)

-- 
2.43.0

