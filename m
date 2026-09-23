Received: from mta1.migadu.com (out-98.mta1.migadu.com [95.215.58.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED1446E01D
	for <oe-linux-nfc@lists.linux.dev>; Wed, 23 Sep 2026 08:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151521; cv=none; b=eZOWyjy3SIe4pD45yBtan/dQnjTV1AJzo45wPubvTLTK8lrUVhXJIThkhn/kD/4zLpJ39PA40XezPV+dLcGTXdyTM6ikI731CsIsA/LJSAjNZO6JwGMJlu674+S5ysGu4jcPF9Nc8YlmiPCTPllm1C7R81mNXcOJ2+l6iALCWpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151521; c=relaxed/simple;
	bh=rcg7i8alw+6pwIMR9PsQo8oSyi7qilX87QkYp2YVlUQ=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=qPW6eCSPc6YbKRlF/WO+YEnhOIbQqGGzlAoQyRWIwOOXi7ngnRQwArcVQakAsRkuDjCZC+/+AcVdkHE0yEr1qmasMSna3JqlUKXSZzxc9wKs5TkxdOcPbLgkzCWydQNRoWn0En5LOlg4WZf5FQk6faVV2Zetb8Kz0bAvgkK8TCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=My40XYNi; arc=none smtp.client-ip=95.215.58.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="My40XYNi"
X-Envelope-To: oe-linux-nfc@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=rcg7i8alw+6pwIMR9PsQo8oSyi7qilX87QkYp2YVlUQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790151516; v=1; x=1790756316;
 b=My40XYNiu5S2Ev5qKWnPwEBFdJbwMmSwVTgSA9X6JPCaXCDc2pEMF9bcAsSffwQLMuF9+7fj
 F1GWLHag/BJIPRAG3IM0yoENdQMuqXWVniHJ9DSWrLNBaRHOrhOnrBAVPApbC3GBBFsFslmN8nQ
 EScDegREs2sSyqtwO0WRQTEM=
X-Envelope-To: oe-linux-nfc@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 57f5298fc68db611;
	Wed, 23 Sep 2026 08:18:36 +0000
X-Mizu-Trace-ID: 57f5298fc68db611
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 23 Sep 2026 08:18:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <fe549eb46f9f666f2778e7c50198528028cf9528@linux.dev>
TLS-Required: No
Subject: [PATCH v2] nfc: st95hf: validate device-reported response length
 before reading
To: david@ixit.cz, sameo@linux.intel.com, shikha.singh@st.com
Cc: oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <91f49a98dd42655829b7206f0d64cc31ef9c0e95@linux.dev>
References: <91f49a98dd42655829b7206f0d64cc31ef9c0e95@linux.dev>

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

Add a buff_len parameter and clamp the device-reported length that does
not fit into the caller's buffer, Also modify callers to pass their
real buffer sizes.

Note that the clamped transfer must still run rather than bailing
out early: the header transfer keeps chip select asserted via
cs_change, and only completing a follow-up message lets the SPI
core deassert it. The device simply discards the unread bytes
at the chip select rising edge, then report the overflow with -E2BIG
after the transfer completes.

Discovered by Atuin - Automated Vulnerability Discovery Engine.

Fixes: cab47333f0f75 ("NFC: Add STMicroelectronics ST95HF driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
---
v2: clamp the payload read to the caller's buffer and let the second
SPI transfer complete instead of returning early, so chip select (kept
asserted by the header transfer's cs_change) is deasserted by the SPI
core; report the overflow with -E2BIG after the transfer completes.

 drivers/nfc/st95hf/core.c |  6 ++++--
 drivers/nfc/st95hf/spi.c  | 16 +++++++++++++---
 drivers/nfc/st95hf/spi.h  |  2 +-
 3 files changed, 18 insertions(+), 6 deletions(-)

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
index ffaf2789c4069..a69f7c5e3695e 100644
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
@@ -106,9 +106,16 @@ int st95hf_spi_recv_response(struct st95hf_spi_conte=
xt *spicontext,
 	else
 		len +=3D receivebuff[1];
=20
-=09/* Now make a transfer to read only relevant bytes */
+	/*
+	 * Now make a transfer to read only relevant bytes, clamped to
+	 * the caller's buffer.  The transfer must run even when the
+	 * device overreports the length: the header transfer above kept
+	 * chip select asserted via cs_change, and only completing this
+	 * message lets the SPI core deassert it.  The device discards
+	 * the unread bytes at the chip select rising edge.
+	 */
 	tx_takedata.rx_buf =3D &receivebuff[2];
-	tx_takedata.len =3D len - 2;
+	tx_takedata.len =3D min(len, buff_len) - 2;
=20
=20	spi_message_init(&m);
 	spi_message_add_tail(&tx_takedata, &m);
@@ -122,6 +129,9 @@ int st95hf_spi_recv_response(struct st95hf_spi_contex=
t *spicontext,
 		return ret;
 	}
=20
+=09if (len > buff_len)
+		return -E2BIG;
+
 	return len;
 }
 EXPORT_SYMBOL_GPL(st95hf_spi_recv_response);
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
