Received: from mta1.migadu.com (out-249.mta1.migadu.com [95.215.58.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD01D352008
	for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 14:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151327; cv=none; b=PbWaXcrC2x1SWN/pZZ42ZfLFdKXeXYEMcLkwFWkrmE4+5GLs5iCJ7Ov6VbYRKAY03rpMVJgbVsaL5Q9fQXbciFcdeazeKQ7tdyK81/K4ZSlAnUnZSDg3BMwawm7gCyU17tx2Ac0eyXZOa2o8WwJznn2O4MYzcus9d+AIkn0iz+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151327; c=relaxed/simple;
	bh=8wNfg5Ll8U/gOyT+7g9lgcQRSGPtknL4RTLBa0Av4Ng=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc; b=hLA3l0OQWhUBW5QO7YLqUkUu54atzO3mTLZ6MyLY22Q2KBvKNQzNfE+KvUPVx2YKcw0/egCawB91+CTKUUjOETj9QqaqfXJDcYvZObXLRr/BBLfU04zmveqgDOg+WWQw11BJjHzKKohKKrLdWD5zRBw14RhfnOEsuanx2drYaeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=v8hxzRW6; arc=none smtp.client-ip=95.215.58.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="v8hxzRW6"
X-Envelope-To: oe-linux-nfc@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=8wNfg5Ll8U/gOyT+7g9lgcQRSGPtknL4RTLBa0Av4Ng=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787151322; v=1; x=1787756122;
 b=v8hxzRW6h8lrCp5hpKnOk+D4auuL9e0+KILnioXtTCW1PUu/ClUJyLhEYV8YzOCbyxqGhPLx
 C97qLIas5xi13QwFXiG1M2FQI3g1dnrLpgIdEXmg23kst9aiwnWC/Ydn45finzwBR+zmxPJRbXB
 WFToUbk9lHIioL64msdYT4ug=
X-Envelope-To: oe-linux-nfc@lists.linux.dev
Received: from webmail.migadu.com (2001:41d0:303:fc7a::)
	by smtp.migadu.com with ESMTPS id 9ba50729c19702ff;
	Wed, 19 Aug 2026 14:55:21 +0000
X-Mizu-Trace-ID: 9ba50729c19702ff
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 19 Aug 2026 14:55:21 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <91f49a98dd42655829b7206f0d64cc31ef9c0e95@linux.dev>
TLS-Required: No
Subject: [PATCH] nfc: st95hf: validate device-reported response length before
 reading
To: david@ixit.cz, sameo@linux.intel.com, shikha.singh@st.com
Cc: oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org

From: Tianchu Chen <flynnnchen@tencent.com>

st95hf_spi_recv_response() reads a 2-byte header from the device,
derives the total response length from it (up to 1025 bytes via the
long-frame encoding) and then blindly reads len - 2 more bytes into
the caller's buffer, whose size it knows nothing about.

Call sites can be overflowed by a device reporting a large length,=20
for=20example, st95hf_irq_thread_handler() passes the data area of a
280-byte skb.

ST95HF datasheet states "In Reader mode it is possible to receive up to
528 bytes of frame data from VICC and TypeB cards", so technically a bogu=
s
NFC tag may trigger the OOB-write if the card-reader's firmware allows
large packets.

Add a buff_len parameter and reject a device-reported length that does
not fit into the caller's buffer before issuing the second SPI
transfer. Also modify callers to pass their real buffer sizes.

Discovered by Atuin - Automated Vulnerability Discovery Engine.

Fixes: cab47333f0f75 ("NFC: Add STMicroelectronics ST95HF driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
---
 drivers/nfc/st95hf/core.c | 6 ++++--
 drivers/nfc/st95hf/spi.c  | 7 ++++++-
 drivers/nfc/st95hf/spi.h  | 2 +-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 4d772a308bfff..0fbb60deada23 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -283,7 +283,8 @@ static int st95hf_send_recv_cmd(struct st95hf_context=
 *st95context,
 		unsigned char st95hf_response_arr[2];
=20
=20		ret =3D st95hf_spi_recv_response(&st95context->spicontext,
-					       st95hf_response_arr);
+					       st95hf_response_arr,
+					       sizeof(st95hf_response_arr));
 		if (ret < 0) {
 			dev_err(dev, "spi error from st95hf_spi_recv_response(), err =3D 0x%x=
\n",
 				ret);
@@ -800,7 +801,8 @@ static irqreturn_t st95hf_irq_thread_handler(int irq,=
 void  *st95hfcontext)
=20
=20	mutex_lock(&stcontext->rm_lock);
 	res_len =3D st95hf_spi_recv_response(&stcontext->spicontext,
-					   skb_resp->data);
+					   skb_resp->data,
+					   skb_tailroom(skb_resp));
 	if (res_len < 0) {
 		dev_err(spidevice, "TISR spi response err =3D 0x%x\n", res_len);
 		result =3D res_len;
diff --git a/drivers/nfc/st95hf/spi.c b/drivers/nfc/st95hf/spi.c
index ffaf2789c4069..f48abd09a08fc 100644
--- a/drivers/nfc/st95hf/spi.c
+++ b/drivers/nfc/st95hf/spi.c
@@ -66,7 +66,7 @@ EXPORT_SYMBOL_GPL(st95hf_spi_send);
=20
=20/* Function to Receive command Response */
 int st95hf_spi_recv_response(struct st95hf_spi_context *spicontext,
-			     unsigned char *receivebuff)
+			     unsigned char *receivebuff, int buff_len)
 {
 	int len =3D 0;
 	struct spi_transfer tx_takedata;
@@ -106,6 +106,11 @@ int st95hf_spi_recv_response(struct st95hf_spi_conte=
xt *spicontext,
 	else
 		len +=3D receivebuff[1];
=20
+=09if (len > buff_len) {
+		mutex_unlock(&spicontext->spi_lock);
+		return -E2BIG;
+	}
+
 	/* Now make a transfer to read only relevant bytes */
 	tx_takedata.rx_buf =3D &receivebuff[2];
 	tx_takedata.len =3D len - 2;
diff --git a/drivers/nfc/st95hf/spi.h b/drivers/nfc/st95hf/spi.h
index 3ab678734c174..443a5053c0128 100644
--- a/drivers/nfc/st95hf/spi.h
+++ b/drivers/nfc/st95hf/spi.h
@@ -45,7 +45,7 @@ int st95hf_spi_send(struct st95hf_spi_context *spiconte=
xt,
 		    enum req_type reqtype);
=20
=20int st95hf_spi_recv_response(struct st95hf_spi_context *spicontext,
-			     unsigned char *receivebuff);
+			     unsigned char *receivebuff, int buff_len);
=20
=20int st95hf_spi_recv_echo_res(struct st95hf_spi_context *spicontext,
 			     unsigned char *receivebuff);
--=20
2.51.0
