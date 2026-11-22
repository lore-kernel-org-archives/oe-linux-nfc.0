Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795324386;
	b=qUQChPpexv7+Vo0pjwOcKfT+1Bh0gL0EG3PsuwL7ElxPI+vIfa3y6aMCOS6exAREy2sF
	 B5vlRD5D4tu53c6Is+4qy2hLrq8VIq1aZ5eTHJxLO8v8DkoI1a9+KSwgEHHwqcRJCHZmt
	 V0YNVtDXQEUBjH7uL1QfSHIe2UrW2fKs0P83tDHlprNkTp6YLGe928KNUhzyOzM6IUs2+
	 gMbZIClOfQ2FqdaMufPUXjdtXhzEFjTBGJrVrxmn8umgoDrhvBgduJlwAkyFPriEyqdKl
	 bDH0ytRCL7BsgYS7VwtEDEvmq6vXYal8Ls/lpvTyEsU90ujVOYaTWvGDKfvG/aYIOHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795324386;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BNmjm7j+QCSdIyjhvl8UOXsiskGAvLed6P75UbxH5/k=;
	b=4rg9k0syWa2lFsYa9Ord0+tduLAzRBbZAAlfbkN5sbwgY18up/HC2J/0MGQw3WEyeQuw
	 5phgBXedQv1LCia7nsVl1g90Oj2bmY9BTfpYtoTzXXcgwQz3dUOpz9etx3lHBReAUZFPn
	 o/P9uEEjr5VnzHJ2YRhQC7FNtUw9wArwOR0Ecd6l1qwzqE09RYya9oNePXhhHxFCXilyc
	 /3aHL7AVSU8DfhqFH5O1h9FYJdUd+RGj9o/gb9Wx5v4/H9wrrIIM5nQdTeG5tGsmRFRhE
	 4xN015SjXvZICHVnEFdDgz6TKdn2PNveLEaY1aPKX4McUhTjPYbKTj4KfOv0ToF/8LA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKJQ15Ty;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06020606A338;
	Sun, 22 Nov 2026 05:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKJQ15Ty
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795324385;
	b=zJE4tYKjqUTWpOor7bnu8NKnecxbGw9vY7bd8KegvVT6/Ubz1I1SRLhIFlokSRKnLxAr
	 8NubQAkgXaEQNM4zS6BVbDiRpVrZ6ywT8CmtwY3pOZsn935vOmBIdiof275pJ67QEXbXV
	 zHwzAhlkJblWjthaylFQnUbNHEVgNayAhVE2n7HkLdR1VGTmyCU6nWaJqzEoHs6SVANgG
	 CHGvVmkrGI/oCbrswdLqLNW6UneLbNKMG1aA+YUq4q+4n1KfTyQ4yA0u+hHbaPyFUvuLC
	 08NkvEXsu9x+DU/6Fkvxo/FTG0XHGDeOSLDhoBI06YiyXmrq08c39v8Ee3LnyD06GUQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795324385;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BNmjm7j+QCSdIyjhvl8UOXsiskGAvLed6P75UbxH5/k=;
	b=17cZuFGP0/hcjIRSY3QYjE+TWYuB9iDKkhHE8NnGzTsVR7iIFHcFdM0G8T0j1zHNEwvR
	 UpCt3auBzefAsAnj6bDANf5EucdjM1Vo2bOsMhWfsWAq72aPGCUST8zQY0KpdiamHlUPn
	 /DLTqaKbU35DFsoEeC2o2ueRLSCagteUmV1+GpSXgbNNWyrmZvDlwAd5C4uxGDboEiUXU
	 d1q31HKl9ALpIgkenuuXr52HpQruIT6nZz1sskw0HhgcE4PL0EtH4V/9Eh9J3pYhOpInA
	 Zczh5uiYMtBG6CX43z7GQQ5FrAiGEFGMFaq9MXvkVqgkZIMQZQ/Aook9J8MCc+yzGlA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99AED1F000C0;
	Sun, 22 Nov 2026 05:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795324385;
	bh=BNmjm7j+QCSdIyjhvl8UOXsiskGAvLed6P75UbxH5/k=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=mKJQ15Ty33/DZUmYlZ23JYAEWpYcjfcrU+mp4zPDV0OMJZYVH7KjydwHkq2/I/qUd
	 vRejzisGHvrgJ5uv4yfplzqEyyWQ6ydcYACnWMRmsfJCUGNRP/hX3BEwb3aY0Kvte7
	 aXqUBsEFIJLLb3SoM3cGRbUHoBNjm/7UqCPQ9nKaUfJSUeX9vkgUHPTWam3j/IVZDi
	 AxUZbpi9mNh+5FWqDF+pwBH4MGOyhor81yusWhwHB8Ox38E+QtVdMcjGdXj4iQBNnV
	 eSZ3tRnE+DxltY0g91Vq7JcikOtVM1tYIVZk9PCzEbPcYC8J5LIlyvKa/uW9xBX/RB
	 zflmGk5KMT1/w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2AAD94BEEE;
	Sun, 22 Nov 2026 05:13:04 +0000 (UTC)
From: EMCP333 via B4 Relay <devnull+emcp.enser.io@kernel.org>
Date: Sun, 22 Nov 2026 05:13:02 +0000
Subject: [PATCH] nfc: nxp-nci: i2c: Do not keep a fault taken in reset
 across power-up
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-nxp-nci-cold-fault-v1-1-fad784c73cfe@enser.io>
X-B4-Tracking: v=1; b=H4sIAN15AmsC/yXMwQ6CMBAE0F8he3bVNoSqv2I8tMtW1pBCWiAkh
 H+nxeObzMwGiaNwgle1QeRFkgwhQ10qoM6GL6O02aDvulFKa3Q1hnXEQII09C16O/cTmof3/DT
 GONtA3o6Rvazn7/vzd5rdj2kqZ6XhbGJ00QbqSlR4W8y1xkga9v0ANA+UVpkAAAA=
X-Change-ID: 20261122-b4-nxp-nci-cold-fault-78ffe9777ba6
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Perrochaud?= <clement.perrochaud@nxp.com>, 
 Samuel Ortiz <sameo@linux.intel.com>, EMCP333 <emcp@enser.io>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795324382; l=3002;
 i=emcp@enser.io; s=ultron; h=from:subject:message-id;
 bh=mB+rrVjlXf4RV4trPETUOgk0Sb3i1GXtUlZZsMRZRbk=;
 b=yyOeSlKhkgcaNvBbh6HL4cj3paoE+S1FtJkg8tZbr3E5Bg8XymaEKA2rbuZea+1JDEKmrn000
 WSA1891ZlwWCINpxN810Luw5YQYkfUJTJEeOt+i6U65+jaN4bI72+vt
X-Developer-Key: i=emcp@enser.io; a=ed25519;
 pk=5sG48Lul+Vn7OzXu3VZrCWk5uvEFPYMXYnAV0TZR/tY=
X-Endpoint-Received: by B4 Relay for emcp@enser.io/ultron with auth_id=1598
X-Original-From: EMCP333 <emcp@enser.io>
Reply-To: emcp@enser.io
Content-Transfer-Encoding: 7bit

From: EMCP333 <emcp@enser.io>

On a OnePlus 6T (PN553), the controller powers up once after boot and
never again. Each power-down logs a read error, and every later
power-up times out:

  nxp-nci_i2c 3-0028: NFC: Read failed with error -121
  nci: __nci_request: wait_for_completion_interruptible_timeout failed 0

nxp_nci_close() holds info_lock while it drops EN and sets the mode to
COLD, and the IRQ thread takes the same lock. An interrupt raised as
the controller goes into reset is therefore handled after close() has
finished, in COLD mode, where the IRQ thread treats it as -EREMOTEIO and
records it in hard_fault. set_mode() clears hard_fault only on entry to
COLD, which has already happened, so the fault survives into the next
power-up: nxp_nci_i2c_write() returns it for CORE_RESET without touching
the bus, and the request times out.

Do not count an interrupt taken while the controller is held in reset
as a fault, and clear hard_fault on every mode change, since each one
drives EN/FW and so resets the controller.

Tested on a OnePlus 6T with this change on the postmarketOS sdm845
kernel (6.18): five power-up/power-down cycles through the NFC netlink
interface all succeed, 0.03-0.04 s each, with no read errors. Without
it, every power-up after the first times out.

The code and this changelog were prepared with the help of an AI coding
assistant. The submitter has reviewed both and takes responsibility for
them.

Fixes: 6be88670fc59 ("NFC: nxp-nci_i2c: Add I2C support to NXP NCI driver")
Signed-off-by: EMCP333 <emcp@enser.io>
---
Also ran on v7.4-rc3 on the same phone, as this exact commit: 5 of 5
NFC_CMD_DEV_UP/DEV_DOWN cycles over netlink, 0.03-0.04 s each, no -121
(EREMOTEIO).
---
 drivers/nfc/nxp-nci/i2c.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
index 9eec67c109..1ff8b5a2bb 100644
--- a/drivers/nfc/nxp-nci/i2c.c
+++ b/drivers/nfc/nxp-nci/i2c.c
@@ -52,8 +52,11 @@ static int nxp_nci_i2c_set_mode(void *phy_id,
 	gpiod_set_value_cansleep(phy->gpiod_en, (mode != NXP_NCI_MODE_COLD) ? 1 : 0);
 	usleep_range(10000, 15000);
 
-	if (mode == NXP_NCI_MODE_COLD)
-		phy->hard_fault = 0;
+	/*
+	 * Each mode change drives EN/FW and resets the controller, so a fault
+	 * recorded before it no longer applies.
+	 */
+	phy->hard_fault = 0;
 
 	return 0;
 }
@@ -222,8 +225,12 @@ static irqreturn_t nxp_nci_i2c_irq_thread_fn(int irq, void *phy_id)
 		r = nxp_nci_i2c_fw_read(phy, &skb);
 		break;
 	case NXP_NCI_MODE_COLD:
-		r = -EREMOTEIO;
-		break;
+		/*
+		 * The controller is held in reset, so there is nothing to read.
+		 * The interrupt can arrive just after EN drops; it is not a bus
+		 * fault.
+		 */
+		goto exit_irq_handled;
 	}
 
 	if (r == -EREMOTEIO) {

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261122-b4-nxp-nci-cold-fault-78ffe9777ba6

Best regards,
--  
EMCP333 <emcp@enser.io>


