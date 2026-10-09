Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F37636B907
	for <oe-linux-nfc@lists.linux.dev>; Fri,  9 Oct 2026 03:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515866; cv=none; b=vDUyqo1UcMnZUQKT7lhd09Z692fn72GrlZhbrPzEbcu97/M/z0cP2njL08XFDTfH0WUZES7QDJ8jC9r7F0EcUkEIqFlR4qclji3A6fW77LCMcQ3ACdyHX9eiOfh/MTYcoquvJ2ej39l6kVla0TkdQ3bQTf0C5avZR7+11DEeCxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515866; c=relaxed/simple;
	bh=rAjHGlkSJzTt4zV6DN+xGsa+T/h/GL774JO7BeNVlMk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O8Vj6/Tp06/yeFmj9B7CPacwxPzQ39rktenP+CUsJSsomfMYUE6GrTALdOZJmvrWm72WMjJeOhLOKl1kICl1RTHZy4QJtaSoiwlrX2nMstFNCln0LKdz693S3Mk9gSO/NLKgLptAZWPaYGjmRbhisxbDWTfcCdL6/uRPCewQ6qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABnbjzLXMhq6HgaCg--.19984S2;
	Fri, 09 Oct 2026 11:17:31 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: David Heidelberg <david@ixit.cz>,
	Shikha Singh <shikha.singh@st.com>,
	Samuel Ortiz <sameo@linux.intel.com>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nfc: st95hf: register NFC device after drvdata and locks are set up
Date: Fri,  9 Oct 2026 11:17:34 +0800
Message-Id: <20261009031734.3052980-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABnbjzLXMhq6HgaCg--.19984S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr15Kw1kCw1rZFyxJF1kZrb_yoW8ZFy7pa
	13Zasava47tF47Ar4qya1v9FW5WF4Iy3W8G3srC3yIg398CF9YqF1Yq3WjyF10vrZ5J3W2
	qr4Sva48CF4Yyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWU
	twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUgeHgUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwIPA2rIJBHVRgAAsN

st95hf_probe() calls nfc_digital_register_device() before
nfc_digital_set_drvdata().  The nfc_digital_dev is allocated with
kzalloc(), so ddev->driver_data is still NULL when the device becomes
visible to userspace.  A NFC_CMD_DEV_UP from userspace can then reach
digital_dev_up() -> digital_switch_rf() -> st95hf_switch_rf(), which gets
a NULL stcontext from nfc_digital_get_drvdata() and passes it to
st95hf_select_protocol()/rf_off(), dereferencing it.  The exchange_lock
semaphore and rm_lock mutex used by the command paths are initialized
after registration for the same reason.

Set the driver data and initialize the locks before registering the
device.

Fixes: cab47333f0f7 ("NFC: Add STMicroelectronics ST95HF driver")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/nfc/st95hf/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 4d772a308bff..9f6a086653aa 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -1170,18 +1170,18 @@ static int st95hf_probe(struct spi_device *nfc_spi_dev)
 	st95context->nfcdev = st95context->ddev->nfc_dev;
 	nfc_digital_set_parent_dev(st95context->ddev, &nfc_spi_dev->dev);
 
-	ret =  nfc_digital_register_device(st95context->ddev);
-	if (ret) {
-		dev_err(&st95context->nfcdev->dev, "st95hf registration failed\n");
-		goto err_free_digital_device;
-	}
-
 	/* store st95context in nfc device object */
 	nfc_digital_set_drvdata(st95context->ddev, st95context);
 
 	sema_init(&st95context->exchange_lock, 1);
 	mutex_init(&st95context->rm_lock);
 
+	ret =  nfc_digital_register_device(st95context->ddev);
+	if (ret) {
+		dev_err(&st95context->nfcdev->dev, "st95hf registration failed\n");
+		goto err_free_digital_device;
+	}
+
 	return ret;
 
 err_free_digital_device:
-- 
2.25.1

