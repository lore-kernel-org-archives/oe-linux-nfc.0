Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71043CFF56
	for <oe-linux-nfc@lists.linux.dev>; Wed, 15 Jul 2026 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105051; cv=none; b=GC3UNB0LmxrJG7y5gfhCv/P4h9ONuJIa6zKUC2FdBZGu5rnzk5peTCkikWUlwkv5OxQ/OllewzwI0MX4wU9ZLBJMtwXUiPNMvmwyRRmN6KQnFDB5nK9T8+lv+1rLhmqoAbQ1yJRxO2G8/N9Ae7/XztHXdA9Bmhb1VB/BCP9ya64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105051; c=relaxed/simple;
	bh=TgDMKplnUgmUXYVbImhujmuatJ8zj82zrvtRs2w/+JI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h0TCyWYiTb7aUtS/+LhNGdyB7wAQBLXBateNhz7Q+Ys6Yws1wX4IMAhniaIpcGSI8z3J50CP3UKnM3w04Lmeg0LTVWjxDPoEaSFO2D8PLePg/QXnVMrNiXWpHFdBo9WVUecSoOvIueJ/mm/35KKVTEy4oaJqK3mnjIQXBVX1luU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABXrdBVSFdqxHJHGA--.59645S2;
	Wed, 15 Jul 2026 16:44:05 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: David Heidelberg <david@ixit.cz>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH] nfc: st21nfca: validate received frame size
Date: Wed, 15 Jul 2026 16:44:05 +0800
Message-ID: <20260715084405.41546-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABXrdBVSFdqxHJHGA--.59645S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF4fCr43AFW7AFyxtrWUArb_yoW5JF4UpF
	WrKry5Xr4Dtr43trZxuF4rAry5G3s5Kry3KFWIg3Wfuw4rGFy5WFWFka1I9ry2vrWrCFyj
	yr48XF43W3Wqya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU2Q6
	JUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

st21nfca_hci_i2c_repack() trims a received frame at its EOF marker
before removing byte stuffing.  It then assumes the truncated frame
contains the LLC header and two CRC bytes, and it unconditionally reads
the byte after an escape marker.

A malformed frame can place EOF immediately after the start marker or can
end its data portion with an escape marker.  The former leaves too few
bytes for check_crc(), while the latter makes the unstuffing loop read past
the current skb length.

Require the minimum framing bytes both before and after unstuffing.  Use
separate input and output cursors while removing byte stuffing, and reject
an escape marker without its encoded byte.  This keeps malformed frames
within the received frame boundary before CRC processing.

Fixes: 3096e25a3e40 ("NFC: st21nfca: Fix incorrect byte stuffing revocation")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/nfc/st21nfca/i2c.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index aa5f4922b6b0..11ba4fb49828 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -289,27 +289,36 @@ static int check_crc(u8 *buf, int buflen)
  */
 static int st21nfca_hci_i2c_repack(struct sk_buff *skb)
 {
-	int i, j, r, size;
+	int read, write, r, size;
 
-	if (skb->len < 1 || (skb->len > 1 && skb->data[1] != 0))
+	if (skb->len < ST21NFCA_FRAME_HEADROOM ||
+	    !IS_START_OF_FRAME(skb->data))
 		return -EBADMSG;
 
 	size = get_frame_size(skb->data, skb->len);
 	if (size > 0) {
+		if (size < ST21NFCA_FRAME_HEADROOM + 2)
+			return -EBADMSG;
+
 		skb_trim(skb, size);
 		/* remove ST21NFCA byte stuffing for upper layer */
-		for (i = 1, j = 0; i < skb->len; i++) {
-			if (skb->data[i + j] ==
+		for (read = 1, write = 1; read < skb->len;) {
+			if (skb->data[read] ==
 					(u8) ST21NFCA_ESCAPE_BYTE_STUFFING) {
-				skb->data[i] = skb->data[i + j + 1]
-						| ST21NFCA_BYTE_STUFFING_MASK;
-				i++;
-				j++;
+				if (read + 1 == skb->len)
+					return -EBADMSG;
+
+				skb->data[write++] = skb->data[read + 1]
+						     | ST21NFCA_BYTE_STUFFING_MASK;
+				read += 2;
+			} else {
+				skb->data[write++] = skb->data[read++];
 			}
-			skb->data[i] = skb->data[i + j];
 		}
 		/* remove byte stuffing useless byte */
-		skb_trim(skb, i - j);
+		skb_trim(skb, write);
+		if (skb->len < ST21NFCA_FRAME_HEADROOM + 2)
+			return -EBADMSG;
 		/* remove ST21NFCA_SOF_EOF from head */
 		skb_pull(skb, 1);
 
-- 
2.43.0

