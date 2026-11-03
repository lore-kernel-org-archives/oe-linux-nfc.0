Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702554;
	b=wcgASMyCYLlvsHk+7ToOPRuq7jeNYCFepz6BL6D7/LocUMSYqtBqi0XS1rlqnw7VT0uN
	 bSCvjAeBczeYpZz60mQ1gklEpdOjnCn/Wwav73xiP6INZ279/UkYyFlCOUQelPf2d+qWp
	 QKVAtZVuk37LTL3rz1ET9hLa+u5EoflFOnJErKbUdxICL37qeF2eDMokjbWsekd39LFSR
	 /XM8APa9NgwWzFBXPGKm1RRrA4M0FZ1r9d06HiJhf00vYU7XM62KKvF3e0H22ZMtWYfCW
	 sk/DxzEj/AAZ+wzhX1nglwVtofx/sZSq954w5Yv2FVj5JtqcX3njJr5KKkvfN6NrjGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702554;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=nKqX9luvgkH2YEYGSeE2+wJBSMv9stNPEQFCJdXsfmM=;
	b=G3QzftRNt66QQxxpD6TjDi26Qe2REs2g7sBhUNn9MTxKUDPUTTGPTZIeJTlcuphMYGd/
	 59LPQRp/KrzTM+nDxvELIxjtmHfqYjwocYnkAb84eqi0ChR/4MgvI2HaRCe1HYopQA/Nc
	 CfBX35Fc9vMPwQVZr/5fVyRgh9lKQt7hObP5u/lXbZfSuxf6g5qvZ7etjZPAN3x708gxg
	 5EHL7vHjxasfdP2GI0YrU/ujCgQkDxs+a49OYez/SBMm2Jz/2Hv2QBnQxvp4cFf8Vua5P
	 NvU0GE+lV4qqMqkc1VtVhk9WYYsqghZCdbKtXHxjYwx503Ke7tGNl6bRDQWd1HmEU+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C50360775E9
	for <oe-linux-nfc@lists.linux.dev>; Tue,  3 Nov 2026 10:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C50360775E9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADn8JGXuulqnsg7AA--.2916S2;
	Tue, 03 Nov 2026 18:42:31 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Mark Greer <mgreer@animalcreek.com>,
	David Heidelberg <david@ixit.cz>
Cc: linux-wireless@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] nfc: trf7970a: release runtime PM reference on RF-on errors
Date: Tue,  3 Nov 2026 10:42:40 +0000
Message-Id: <20261103104240.1373772-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADn8JGXuulqnsg7AA--.2916S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFW8uw4rZr4DtF48Xr4xWFg_yoW8CF1xpF
	WIgr4Ykry5Ar47Jr1DAr4kXa4Yk3yrtrW7Cayrua4xAa1rJa1Iy34DGa42vF1jyrZ5JF1U
	trWIva17CFyjvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9mb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_Cr1j6r
	xdMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VAI37AI020EjII2
	zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	yj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdYxBIdaVFxhVjvjDU0xZFpf9x07jFApnUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwUAA2rpnO54xwAAsP

trf7970a_switch_rf_on() bumps the runtime PM usage counter before
validating the state and before initialising the chip.  Neither the
incorrect-state path nor the trf7970a_init() failure path drops that
reference, and none of the three callers balance it either, so the
usage counter stays elevated.

Use pm_runtime_resume_and_get() so that a failed resume does not leave
the counter incremented, and release the reference with the same
mark-last-busy/put-autosuspend pair that trf7970a_switch_rf_off() uses
when either of the subsequent steps fails.

Fixes: e6403b7c756f ("NFC: trf7970a: Add pm_runtime support")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/nfc/trf7970a.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index ddfc58c29964..7de590485657 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -1150,23 +1150,31 @@ static int trf7970a_switch_rf_on(struct trf7970a *trf)
 
 	dev_dbg(trf->dev, "Switching rf on\n");
 
-	pm_runtime_get_sync(trf->dev);
+	ret = pm_runtime_resume_and_get(trf->dev);
+	if (ret)
+		return ret;
 
 	if (trf->state != TRF7970A_ST_RF_OFF) {	/* Power on, RF off */
 		dev_err(trf->dev, "%s - Incorrect state: %d\n", __func__,
 			trf->state);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_put;
 	}
 
 	ret = trf7970a_init(trf);
 	if (ret) {
 		dev_err(trf->dev, "%s - Can't initialize: %d\n", __func__, ret);
-		return ret;
+		goto err_put;
 	}
 
 	trf->state = TRF7970A_ST_IDLE;
 
 	return 0;
+
+err_put:
+	pm_runtime_mark_last_busy(trf->dev);
+	pm_runtime_put_autosuspend(trf->dev);
+	return ret;
 }
 
 static int trf7970a_switch_rf(struct nfc_digital_dev *ddev, bool on)
-- 
2.34.1

