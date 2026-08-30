Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85A13B47D6
	for <oe-linux-nfc@lists.linux.dev>; Sun, 30 Aug 2026 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788096606; cv=none; b=jo7sVOTEGYfcoKDHNvoawv5lAVLwUxYsFHMw75+8BhV1sfXVZa8HXpeiHB6LPGJpnfi9P0k4d+6jJl9BFdyNy9nt+FWIhRht12aMd+1Y2aVU1CF7YNc3pGWc5sO+is8PwrXds8n2mFsnEiYIA6WLALb2Ba2xRwy8oi+lox7ioT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788096606; c=relaxed/simple;
	bh=Z5bJA5cfXiPKCmO/FyfP/YrKZWhhaXnliQhgTT5R4xM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W4YyziBMe0ZZBHP0VmaEg5q2Hp+BmPmTNq+bMBKFoeb1sSM1i2u4BJcbQTTdup4XwuHJijc/oviEg+rvuzyktjgnYOks77MdCgGacXej+CwCqn5jbTIZOlfqMo5Nag7VENV9WOi9Opzw9HmqcXba5xg25SawqBdbg6Lpr59JfaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowADX4D5YMJRqQh6bBg--.17810S2;
	Sun, 30 Aug 2026 21:30:00 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: David Heidelberg <david@ixit.cz>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nfc: st21nfca: validate ISO15693 inventory length
Date: Sun, 30 Aug 2026 21:29:58 +0800
Message-ID: <20260830132958.6397-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADX4D5YMJRqQh6bBg--.17810S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF1xtF48WF13CF4kuw15Arb_yoWkJwc_KF
	1vqr9F9r4UZr1jkF18urn09rW0v340vryFqrW0q3y3tryIv343JrZFyFy5Jry7GrWUCF9r
	G3Z5Ar1SvwsY9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbz8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUna9aUUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The ISO15693 inventory helper removes a two-byte prefix without checking
that it exists, then accepts a one-byte remainder before reading data[1] as
the DSFID.

Require the prefix and at least two remaining bytes before copying the UID
data and reading the DSFID.

Fixes: 7974728094d3 ("NFC: st21nfca: Add ISO15693 Reader/Writer support")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/nfc/st21nfca/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index fd39a05c96222..34d797a29d21b 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -577,9 +577,7 @@ static int st21nfca_get_iso15693_inventory(struct nfc_hci_dev *hdev,
 	if (r < 0)
 		goto exit;
 
-	skb_pull(inventory_skb, 2);
-
-	if (inventory_skb->len == 0 ||
+	if (!skb_pull(inventory_skb, 2) || inventory_skb->len < 2 ||
 	    inventory_skb->len > NFC_ISO15693_UID_MAXSIZE) {
 		r = -EPROTO;
 		goto exit;

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1

