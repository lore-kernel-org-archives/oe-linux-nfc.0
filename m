Received: from h6.fbrelay.privateemail.com (h6.fbrelay.privateemail.com [162.0.218.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0800E288BA
	for <oe-linux-nfc@lists.linux.dev>; Sun,  5 Jul 2026 19:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278419; cv=none; b=XjWQLDUm9+hFNWZUWQZN5lVGZy2/UzBofdN7/GYeBuBxQyzelGWom/lrM9v2KFCvRriBKSFi+zJZyXq5YSnbkt/unG187L0u0W1N9tbVJrvuQU7+JbWh7egH55gIXFu2zC6XAnmHAZDR6Gc7E1ipxCe5DWPBVAu9KZiCsfDbTRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278419; c=relaxed/simple;
	bh=lVuLe5DKccN3BSNZnJ5IgF8cRkXFuHfGfiCHhThWpdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DRyGV6NBymBDb/xepLzJ2mswM8Bo+Hysi8ioFU100KcPDO/DxSluLEYi9nK1cIPCFBNgUKDKJeBBRpeVMGp9H0Ti417U/3ndyFB1mPvxWmdAa4sD/SPVuIU/GQ7eCtmE2vWRUjIrpbBFNCLpWiDHPuESF6+CZ5bUL8zE/YI11rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=162.0.218.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from MTA-11-3.privateemail.com (mta-11.privateemail.com [198.54.118.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4gtcRZ5V9qz2xGc
	for <oe-linux-nfc@lists.linux.dev>; Sun,  5 Jul 2026 19:06:50 +0000 (UTC)
Received: from mail.privateemail.com (K8S-PROD-WORKER-13 [87.215.145.39])
	by mta-11.privateemail.com (Postfix) with ESMTPA id 4gtcR73L4Lz3hhT9;
	Sun,  5 Jul 2026 15:06:27 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	David Heidelberg <david@ixit.cz>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] nfc: s3fwrn5: support the S3NRN4V variant
Date: Sun,  5 Jul 2026 21:06:18 +0200
Message-ID: <20260705190621.128257-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4gtcRZ5V9qz2xGc

This adds support for the Samsung S3NRN4V, an S3FWRN5-family NFC
controller found e.g. on the Fairphone 6 (SM7635), to the s3fwrn5
driver.

The S3NRN4V differs from the already-supported parts in three ways: it
ships with working firmware behind a bootloader protocol the driver
does not implement (so firmware download is skipped), it loads its RF
registers through a different proprietary command (DUAL_OPTION), and it
gates its reference clock through a CLK_REQ line that the driver must
service for the chip to be able to generate the 13.56 MHz poll carrier.

Patch 1 adds the compatible and the clk-req-gpios property to the
binding; patch 2 implements the variant in the driver.

Tested on a Fairphone 6 running a milos-mainline kernel: reader mode polls
and reads ISO 14443-4 tags reliably, both from a fresh boot and across
driver reloads.

Changes in v2:
 - Drop the -i2c bus suffix from the new compatible: it is now plain
   samsung,s3nrn4v (Requested by: Conor Dooley).
 - Close a race in the probe-time CLK_REQ seeding by reading the GPIO
   level under clk_lock, so a stale level can never overwrite a fresher
   state applied by the irq thread (found by the Sashiko AI review of
   v1).
 - Binding completeness: document the PVDD supply (required for the
   S3NRN4V), add an S3NRN4V example exercising the new properties, make
   clk-req-gpios depend on clocks, and describe the CLK_REQ pin in
   hardware terms.
 - Rework the binding commit message: justify the GPIO modelling in
   hardware terms and explain why no fallback compatible applies.
 - Add an s3nrn4v i2c_device_id entry carrying the variant so both
   match paths agree, and describe the of_match_ptr() removal in the
   driver commit message.
 - Reject malformed rfreg blobs (word alignment, single-byte section
   index bound) up front instead of failing at STOP_UPDATE.
 - Handle gpiod_get_value_cansleep() failure in the CLK_REQ sync
   instead of treating an error as "clock off".
v1: https://lore.kernel.org/20260703202601.78563-1-jorijnvdgraaf@catcrafts.net

Jorijn van der Graaf (2):
  dt-bindings: net: nfc: samsung,s3fwrn5: add S3NRN4V and clk-req-gpios
  nfc: s3fwrn5: support the S3NRN4V variant

 .../bindings/net/nfc/samsung,s3fwrn5.yaml     |  65 ++++++++-
 drivers/nfc/s3fwrn5/core.c                    |  40 ++++-
 drivers/nfc/s3fwrn5/i2c.c                     | 138 ++++++++++++++++--
 drivers/nfc/s3fwrn5/nci.c                     | 119 ++++++++++++++-
 drivers/nfc/s3fwrn5/nci.h                     |  32 +++-
 drivers/nfc/s3fwrn5/s3fwrn5.h                 |  14 +-
 drivers/nfc/s3fwrn5/uart.c                    |   2 +-
 7 files changed, 394 insertions(+), 16 deletions(-)


base-commit: 805185b7c7a1069e407b6f7b3bc98e44d415f484
-- 
2.55.0

