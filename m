Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D8C341AC7
	for <oe-linux-nfc@lists.linux.dev>; Sat, 15 Aug 2026 13:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800432; cv=none; b=eu5sBTq+vR80WT9g7QWTYG2tH01CEKLiQYBaHYBI0ni5OfatELHVsz6GK+QhprE4CC+scaK4dlNiC07GHRhg0gNslQUg7ZkOg5asCGRf3foTDScJJ0jeWaYzhvek1zbb6H7dg8wECmiNRfyj6f/5ysx6eXVYAMNdOBDXU5Whi1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800432; c=relaxed/simple;
	bh=3i6ATnHwyB3/VBG7vmQcEUx820r61tf0FG2JvCPCTxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WKr/9zwqgq9F2qrX2GBR9dzzLCJUlPoJfguubx0H+7SpevLhoarnZn3iPNwzAaliOQwofT7zvqvAxDZJcFh7ElV0sI5stIaleCS77eUYp39kv3tde9D1HWQ6r9xkReCD3XHGLQW7ZkyqNLOpgFRVD4t+dwQ+tu6+3ziZn7ClHoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-05 (Coremail) with SMTP id zQCowAAXhT8paYBqNv_QBQ--.22822S2;
	Sat, 15 Aug 2026 21:27:06 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: David Heidelberg <david@ixit.cz>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Vincent Cuissard <cuissard@marvell.com>,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] nfc: nfcmrvl: validate the firmware download length chain
Date: Sat, 15 Aug 2026 21:27:04 +0800
Message-ID: <20260815132704.34075-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAXhT8paYBqNv_QBQ--.22822S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtw15CFWDJryDur47Kw4xXrb_yoW7trW8pF
	45AFyqyr4UAFWSqr18tFsrAFW5Cws3CFW3Wa47JFn3Ar1YvF18Ja4ktryY93yqqrZ8Ga13
	G3s8Aa4j9F4ktrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYNVyDU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The firmware download state machine reads its fixed firmware header before
proving that the image contains it.  It also accepts a 16-bit
helper-requested chunk length, narrows it to the 8-bit NCI payload field,
and copies that many bytes from a firmware offset without binding the
complete chain to fw->size.

Validate the fixed firmware header and both image offsets, require the
exact NCI helper-command frame and payload length, and reject chunks that
exceed either the NCI payload limit or the remaining firmware bytes.  Keep
offsets and chunk lengths in size_t so the checks dominate allocation,
copy and advancement without an intermediate narrowing.

Fixes: 3194c6870158 ("NFC: nfcmrvl: add firmware download support")

Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1:
https://lore.kernel.org/all/20260715084325.40276-1-pengpeng@iscas.ac.cn/
- validate the firmware header and both initial image offsets
- require the exact NCI helper-command frame and payload length
- reject chunks that exceed U8_MAX or the remaining firmware image
- keep chunk lengths and offsets wide through allocation and copying
- clear download state through one release path

This revision was not built or tested with nfcmrvl hardware, malformed
helper frames, or malformed firmware images.

 drivers/nfc/nfcmrvl/fw_dnld.c | 52 +++++++++++++++++++++++++++++------
 drivers/nfc/nfcmrvl/fw_dnld.h |  4 +--
 2 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/fw_dnld.c b/drivers/nfc/nfcmrvl/fw_dnld.c
index 2b8f401d8fd7..d97e7491e22c 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.c
+++ b/drivers/nfc/nfcmrvl/fw_dnld.c
@@ -238,6 +238,8 @@ static int process_state_open_lc(struct nfcmrvl_private *priv,
 	    memcmp(skb->data, nci_pattern_core_conn_create_rsp,
 		   sizeof(nci_pattern_core_conn_create_rsp)))
 		return -EINVAL;
+	if (priv->fw_dnld.binary_config->offset > priv->fw_dnld.fw->size)
+		return -EINVAL;
 
 	priv->fw_dnld.state = STATE_FW_DNLD;
 	priv->fw_dnld.substate = SUBSTATE_WAIT_COMMAND;
@@ -263,9 +265,19 @@ static int process_state_fw_dnld(struct nfcmrvl_private *priv,
 		 * B8..N: payload
 		 */
 
-		/* Remove NCI HDR */
-		skb_pull(skb, 3);
-		if (skb->data[0] != HELPER_CMD_PACKET_FORMAT || skb->len != 5) {
+		if (skb->len != NCI_DATA_HDR_SIZE + 5) {
+			nfc_err(priv->dev, "bad command");
+			return -EINVAL;
+		}
+
+		if (nci_plen(skb->data) != 5) {
+			nfc_err(priv->dev, "bad command length");
+			return -EINVAL;
+		}
+
+		/* Remove NCI header */
+		skb_pull(skb, NCI_DATA_HDR_SIZE);
+		if (skb->data[0] != HELPER_CMD_PACKET_FORMAT) {
 			nfc_err(priv->dev, "bad command");
 			return -EINVAL;
 		}
@@ -273,7 +285,6 @@ static int process_state_fw_dnld(struct nfcmrvl_private *priv,
 		len = get_unaligned_le16(skb->data);
 		skb_pull(skb, 2);
 		comp_len = get_unaligned_le16(skb->data);
-		memcpy(&comp_len, skb->data, 2);
 		skb_pull(skb, 2);
 		if (((~len) & 0xFFFF) != comp_len) {
 			nfc_err(priv->dev, "bad len complement: %x %x %x",
@@ -286,6 +297,12 @@ static int process_state_fw_dnld(struct nfcmrvl_private *priv,
 			priv->fw_dnld.substate = SUBSTATE_WAIT_NACK_CREDIT;
 			return 0;
 		}
+		if (len > NCI_MAX_PAYLOAD_SIZE ||
+		    priv->fw_dnld.offset > priv->fw_dnld.fw->size ||
+		    len > priv->fw_dnld.fw->size - priv->fw_dnld.offset) {
+			nfc_err(priv->dev, "invalid firmware chunk: %u", len);
+			return -EINVAL;
+		}
 		priv->fw_dnld.chunk_len = len;
 		out_skb = alloc_lc_skb(priv, 1);
 		if (!out_skb)
@@ -310,7 +327,8 @@ static int process_state_fw_dnld(struct nfcmrvl_private *priv,
 			nci_send_cmd(priv->ndev, NCI_OP_CORE_CONN_CLOSE_CMD,
 				     1, &conn_id);
 		} else {
-			out_skb = alloc_lc_skb(priv, priv->fw_dnld.chunk_len);
+			out_skb = alloc_lc_skb(priv,
+					       (u8)priv->fw_dnld.chunk_len);
 			if (!out_skb)
 				return -ENOMEM;
 			skb_put_data(out_skb,
@@ -507,16 +525,25 @@ int nfcmrvl_fw_dnld_start(struct nci_dev *ndev, const char *firmware_name)
 		return -ENOENT;
 	}
 
-	fw_dnld->header = (const struct nfcmrvl_fw *) priv->fw_dnld.fw->data;
+	if (fw_dnld->fw->size < sizeof(struct nfcmrvl_fw)) {
+		nfc_err(priv->dev, "firmware binary %s is too small",
+			firmware_name);
+		goto release_firmware;
+	}
+	fw_dnld->header = (const struct nfcmrvl_fw *)fw_dnld->fw->data;
 
 	if (fw_dnld->header->magic != NFCMRVL_FW_MAGIC ||
 	    fw_dnld->header->phy != priv->phy) {
 		nfc_err(priv->dev, "bad firmware binary %s magic=0x%x phy=%d",
 			firmware_name, fw_dnld->header->magic,
 			fw_dnld->header->phy);
-		release_firmware(fw_dnld->fw);
-		fw_dnld->header = NULL;
-		return -EINVAL;
+		goto release_firmware;
+	}
+	if (fw_dnld->header->helper.offset > fw_dnld->fw->size ||
+	    fw_dnld->header->firmware.offset > fw_dnld->fw->size) {
+		nfc_err(priv->dev, "firmware binary %s has invalid offsets",
+			firmware_name);
+		goto release_firmware;
 	}
 
 	if (fw_dnld->header->helper.offset != 0) {
@@ -546,4 +573,11 @@ int nfcmrvl_fw_dnld_start(struct nci_dev *ndev, const char *firmware_name)
 	/* Now wait for CORE_RESET_NTF or timeout */
 
 	return 0;
+
+release_firmware:
+	release_firmware(fw_dnld->fw);
+	fw_dnld->fw = NULL;
+	fw_dnld->header = NULL;
+	fw_dnld->binary_config = NULL;
+	return -EINVAL;
 }
diff --git a/drivers/nfc/nfcmrvl/fw_dnld.h b/drivers/nfc/nfcmrvl/fw_dnld.h
index 7c4d91b01910..68f8cf8eee71 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.h
+++ b/drivers/nfc/nfcmrvl/fw_dnld.h
@@ -67,8 +67,8 @@ struct nfcmrvl_fw_dnld {
 
 	int state;
 	int substate;
-	int offset;
-	int chunk_len;
+	size_t offset;
+	size_t chunk_len;
 
 	struct workqueue_struct	*rx_wq;
 	struct work_struct rx_work;

base-commit: dac3e89a2c90c2feeb471e1f22a2512ad424b792
-- 
2.50.1 (Apple Git-155)

