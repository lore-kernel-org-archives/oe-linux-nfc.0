Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA913CFF6A
	for <oe-linux-nfc@lists.linux.dev>; Tue, 29 Sep 2026 22:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722241; cv=none; b=EajV4/hdFAjEVL9YqL8kxeBf8NSXCM7prnc908mQfsUob0vzMv47qfJ5qgInSE50v5adPXcfXGO1ZT2+gLOXsJ2miVf157TJledoGfnx3NN0qIMOsDyWC2diJ9PpQ34QKannem8qsYE6gWTxdWqLVNub8ZM3xcHQIu1bg7KW0EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722241; c=relaxed/simple;
	bh=otyvp6XeZqbiznEBQM1Q0b+7Jp6rj2C5l78Rqypb1Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dREsSXOeWYYv2m3XIl1foIiQTjkKzG7LeNzFhPdy/TZjAqJIp8MZMX/ZUcH4JH98+hitpoTcOQ1Dby/y1INwAdpFRC9PDmfMWbZkUp/4qh/JfUmnSK2KiliS+0+UCBrhvpdJLCpwRS8AHTXeusO/0Jg8OGdxLnQiS/5lZBfYwxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=taufderl.de; spf=pass smtp.mailfrom=taufderl.de; dkim=pass (4096-bit key) header.d=taufderl.de header.i=@taufderl.de header.b=n8wW8hyQ; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=taufderl.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=taufderl.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=taufderl.de header.i=@taufderl.de header.b="n8wW8hyQ"
Received: from christensen.uberspace.de (christensen.uberspace.de [185.26.156.203])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 581D4180814
	for <oe-linux-nfc@lists.linux.dev>; Wed, 30 Sep 2026 00:41:27 +0200 (CEST)
Received: (qmail 1126 invoked by uid 990); 29 Sep 2026 22:41:27 -0000
Authentication-Results: christensen.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by christensen.uberspace.de (Haraka/3.1.1) with ESMTPSA; Wed, 30 Sep 2026 00:41:27 +0200
From: Tim auf der Landwehr <tadl-git@taufderl.de>
To: Kristian Brox <isyourbrainfoss@proton.me>
Cc: David Heidelberg <david@ixit.cz>,
	luca.weiss@fairphone.com,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tim auf der Landwehr <tadl-git@taufderl.de>
Subject: [PATCH 1/3] nfc: st-nci: map proprietary RF 0x90 to MIFARE
Date: Wed, 30 Sep 2026 00:41:23 +0200
Message-ID: <20260929224125.3656680-2-tadl-git@taufderl.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
References: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.999906) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.599906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=taufderl.de; s=uberspace;
	h=from:to:cc:subject:date;
	bh=otyvp6XeZqbiznEBQM1Q0b+7Jp6rj2C5l78Rqypb1Vk=;
	b=n8wW8hyQBd+bgPae7MShpRrq3CE27/lNGT6ELbxVEQn9UHNqE9urNr2d0tZH3Bb1ZCBtCqrI15
	ZmQKjkglfDkDE+X8EDdlLg47hG68XQ9R6Pkb+V3bGep7XRDYm/+YDuFD6CYQ8roHZ0SMQjfuq5ci
	J7y04RSyJ0p3Rgb7DfsvcxOgfFUAYiBepBxaSHGGUfgR4xs02SSXZ7hcicY65XZRP/UoGJeWLyIb
	WSM3+OLSK9XTB+Krt8+8FYyBWW2tMrZj4cTG7jz5DZIU5d7aECwXQxZ6nENugTBHE5cmukrNYxc3
	o/0KDUBNAERJO03O8gXzWfKz5H6N9bb9gSgg0B8h50c93AnvocESNbcgP3gHDs0nplwROcqQL5bT
	MLAbLPRUreZviM7XDJJDqc8Vf2HzUJ+9VNsY4A+DjmD62f6ZUS++1y2EdKK48mQCyYjwfaS2G3ML
	Vh5JW/Zq0mW2iaGScPKrVIBSh9sOreIEmVMna3BIKvCW6tjK8joUrEBDWL1dnI1HONhgCUBXmxk8
	INsC9QuwUmTpvbzuy7u0Abng32r3HNj4vH2mgcU9HMNYMXnk+V+Pg47M1N/EQ7tOwPzK/aTxo3rB
	pYgcYxcvXjfkqY90TwCQfGUF9VuS7S6c1gwsJROZ/vPfPyYEOZ9JS7CTKI7YCQsyykMKWtI5eU5h
	c=

The ST21NFCD reports MIFARE Classic under the proprietary RF protocol
number 0x90 (observed on a MIFARE Classic 4K). st_nci_get_rfprotocol only
mapped 0x83 (ISO 15693), so nci_add_new_protocol dropped the tag with
"the target found does not have the desired protocol" and userspace never
saw the card.

Map 0x90 to NFC_PROTO_MIFARE_MASK. NFC_PROTO_MIFARE_MASK is already in the
driver's supported-protocols set.

Signed-off-by: Tim auf der Landwehr <tadl-git@taufderl.de>
---
 drivers/nfc/st-nci/core.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st-nci/core.c b/drivers/nfc/st-nci/core.c
index d7802434a..3ba49d696 100644
--- a/drivers/nfc/st-nci/core.c
+++ b/drivers/nfc/st-nci/core.c
@@ -15,6 +15,11 @@
 #define DRIVER_DESC "NCI NFC driver for ST_NCI"
 
 #define ST_NCI1_X_PROPRIETARY_ISO15693 0x83
+/* Proprietary RF protocol the controller reports for MIFARE Classic (observed:
+ * 0x90 on a MIFARE Classic 4K). Not an NFC Forum protocol, so it must be
+ * mapped here or nci_add_new_protocol drops the tag.
+ */
+#define ST_NCI1_X_PROPRIETARY_MIFARE 0x90
 
 static int st_nci_init(struct nci_dev *ndev)
 {
@@ -76,8 +81,14 @@ static int st_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
 static __u32 st_nci_get_rfprotocol(struct nci_dev *ndev,
 					 __u8 rf_protocol)
 {
-	return rf_protocol == ST_NCI1_X_PROPRIETARY_ISO15693 ?
-		NFC_PROTO_ISO15693_MASK : 0;
+	switch (rf_protocol) {
+	case ST_NCI1_X_PROPRIETARY_ISO15693:
+		return NFC_PROTO_ISO15693_MASK;
+	case ST_NCI1_X_PROPRIETARY_MIFARE:
+		return NFC_PROTO_MIFARE_MASK;
+	default:
+		return 0;
+	}
 }
 
 static int st_nci_prop_rsp_packet(struct nci_dev *ndev,
-- 
2.55.0

