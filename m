Received: from mta1.migadu.com (out-98.mta1.migadu.com [95.215.58.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D02549F116
	for <oe-linux-nfc@lists.linux.dev>; Wed, 23 Sep 2026 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163208; cv=none; b=d00hZRRFzEU5vK0sv8n6GgoEZa5fTxjaDoruSsZPEHu+PnA1omHeeHdFhcEWNALGaratZmmGnFQdw+oqfgQxR9PzUkErf7RTuJp2MUapEppKVJ+xR9Y2QlwGoOLWM/WMiNTqth/3ygckf1Dg14nDdtIGJ6SFWbJ6JZ5y/KfibnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163208; c=relaxed/simple;
	bh=bjda4J3eMCzOZJo8bbmUc8WxUWf+HGn0VNN3IFV57/s=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc; b=R5R1Dt8pk5Z7ra1dv0gY3jrxi1H0ZsukEfFO7wLQ248mXrgLN6Yql68HhVDFkeYkWoqxuilOS/t/liMng8zPjZ+FUH2cmPhouh2Ro9BjoJV9rcNZsDlwhjBt/Lw8dOJt3NQntwuKCoc34WqzRKFUgU5StzBAeR0OLRO8uZVwDhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WDa6/h+I; arc=none smtp.client-ip=95.215.58.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WDa6/h+I"
X-Envelope-To: oe-linux-nfc@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=bjda4J3eMCzOZJo8bbmUc8WxUWf+HGn0VNN3IFV57/s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790163200; v=1; x=1790768000;
 b=WDa6/h+IdAYIYRRckbl6Cl0Qdc8zy0o+tvES0CQ52GtFxI+EejwqRlg4tJo7z5YnDSl92eIC
 qCFrUrVdZLBhxrlDwJNZCZRfVZGqMEttvU9NqZPXQzp6Wp1krZHLc08C75AWpW4TPsWqYERB704
 SkoJcTr5IoZVXKzmWysu4Vk0=
X-Envelope-To: oe-linux-nfc@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 7113b4692752f233;
	Wed, 23 Sep 2026 11:33:20 +0000
X-Mizu-Trace-ID: 7113b4692752f233
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 23 Sep 2026 11:33:20 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <eb4c2345f8d94181d33bd094f7926a36adf127e6@linux.dev>
TLS-Required: No
Subject: [PATCH v3] nfc: st95hf: validate device-reported response length
 before reading
To: david@ixit.cz
Cc: oe-linux-nfc@lists.linux.dev, shikha.singh@st.com,
 linux-kernel@vger.kernel.org

From: Tianchu Chen <flynnnchen@tencent.com>

st95hf_spi_recv_response() reads a 2-byte header from the device,
derives the total response length from it (up to 1025 bytes via the
long-frame encoding) and then blindly reads len - 2 more bytes into
the caller's buffer, whose size it knows nothing about.

Call sites can be overflowed by a device reporting a large length,
for example, st95hf_irq_thread_handler() passes the data area of a
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
core deassert it. Simply discards the unread bytes, then report the
overflow with -E2BIG after the transfer completes.

Discovered by Atuin - Automated Vulnerability Discovery Engine.

Fixes: cab47333f0f75 ("NFC: Add STMicroelectronics ST95HF driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
---
v3: resend as a separate thread; no code changes (v2 was sent as an
in-thread follow-up by mistake).

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
