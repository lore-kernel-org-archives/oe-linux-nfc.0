Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834B1361951
	for <oe-linux-nfc@lists.linux.dev>; Thu, 15 Oct 2026 03:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034357; cv=none; b=LZ80H/Etj2k65/PWnKIQwmoASPv7zLzHM6FAGuJwP1unhmgAqFrOb8lhbN4fwL+JxE/G2zX3Y2E9n2mxMvb8gaRyAjgoIux7x+fmn9Ff/9FlzmvJdAGHN5eyrM5eAB0VEtSM8980z9/jXxroFu9uFt8OfXUDqFa3Q0VCiLGLQyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034357; c=relaxed/simple;
	bh=7DkAMSdqs432b5pKGZ5+z0IBkk9S52bp6CXXe3fg5J8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sHrAmiXkNq/5fS52O32OaRYV4ZWgR8+AyUe6DP3Z4gFPckSIdt2j6ASCLz0RakENU7Mwg7jecTet3IRiwJSUuu/RAO9tYLyotdREb4Je2Hr4Lfl6tUhgAmLMIZbHL8yBnfEO0YHM5xGRUaHW10as1NVfsoPxzL306aYYqoD2AUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZvPWs17; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZvPWs17"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93e7ad9f78dso572709185a.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 14 Oct 2026 20:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792034354; x=1792639154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBJxQj6NIsMthKy4n+dk5f3Do42mZLL4sgV4e8c1TBM=;
        b=dZvPWs17Tfi18b9eYdIt+rfJ1DLWRfNAHbtwdv7d7erm8/YdJY1/lauLOu1Nj8IhBC
         euK2re/dicoSDxEQbF+JWIkv5HS4whM7s0VUH2uzpwM7kfC9us+JhyRFmkqDCcA1ANbS
         iopjPxtCXGsDmaQDlJBhJ35iJoZZ9relKHOd+cJw629si92bQtX90fNVfM1xWqdEsBqT
         F6eY8sppvK6VBY8baXSqGVFO3/M9jGlcOIPsVd82mc1pWUt4QJbRJZeLf8VzUVbW+aAn
         h+UqYS8F1+3HyjfeD31gK9EBOzugaia0T4tODOKVZ17NhMFNEJnztYf+ebC4nY27lXDk
         7H/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792034354; x=1792639154;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fBJxQj6NIsMthKy4n+dk5f3Do42mZLL4sgV4e8c1TBM=;
        b=qXyjbACgDuuXlXnO9+uVPungBCV44d5mszaFU3nj1dmwAQjAIwMdOooNfqCZ2B5y7l
         nciwixkUmV3YK0NaIvfjm7/5M2sAhMpj7nitEq7lgEx641G7UZLxo5/Jf63sZm126ZLy
         PmvLRhtf8Ie0KNI3F4cjfyRPXRnvg9weeyvNycDlfVdE18XL5XCMWsyIZQINqH/fVFyn
         LSJumb+JFu4dZQYkgqIM1KMC4k+HWybQP6GlsJOfmkPtQTLW0hWzltJD/HUJVgxdLy4x
         ps1RRqpfSS6HIRX76mU6PgQ55Xokhh4WgoOFqnmUE+nDKUvQtmQOkPWDF2IQ57e33xjS
         fz5g==
X-Gm-Message-State: AFq9FYLcg1HasDmFowcg+7DXffCcjvgzEMDS2u+zxEuW+5fwcdr8SQCt
	PcI7+OfHAKKgMOUQt+AT49vHbc47lVFTpgTtmZQ2/0WfqC1T+PSGIb0=
X-Gm-Gg: AYBFou1VTEz7jD7wMkaXbfd8c7wP5HSEWLaXAcW6WyOzO0NWGmHEr8xY6ope5Z+aTI4
	fi/moFRPPNlyHdcOOGCvOLu+fSz6vkWrHeEChQT/pm4CLTGCHiLZc8rzJ8LD8czHyt4YyGyN1xQ
	snP8B7z+BVrHhXgwrojNR+4BoJ9LKGc8iS7V2WKMZy9AWWbqQRcpGKXeMt2aYOZiOaA+icloP9g
	dxS/tGXBNGGM8DTyy7cowBjW+PW0Iyp5SPzaMYMeqtX9VM53GRZgAMpbV0twQJFam1K2TxAwjRx
	uMOdaOjCxDH30Lpl8lN4F1H3D81A5Fh30HGXmaUbF37Z11xVfqUh8mc0kmbVI74z98AQT5IFPFz
	BUficQVUY2Q+rX18e5NT/PZRl2jLmiQML2F85I8hSOXhu4jS4MTPrZpNTeI0HqJ7ED6p+Eo68Q4
	bT8x62PuCA5NyTVllce9zxKAhKFhMQKJ3jUM0F7AUAP6TdYcGvkcFwVZm6b+H+MSVe8HfUh3JPU
	zgW8ffI3Kbv3AfEPNU7eUpmjLkFLfRhWfUtxn146P+Bze6d3mllrbVY7fs0YJ9SkIKazDWON2p1
	fdwXyxt3Qys+QZVzcJd2FI+V1ewi
X-Received: by 2002:a05:620a:1a20:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93ebd20e0b5mr2836858985a.25.1792034354184;
        Wed, 14 Oct 2026 20:19:14 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50095a5sm659924785a.12.2026.10.14.20.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:19:13 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Eric Lapuyade <eric.lapuyade@linux.intel.com>
Subject: [PATCH] nfc: pn544: close firmware requests and IRQ before teardown
Date: Wed, 14 Oct 2026 23:19:11 -0400
Message-ID: <20261015031911.2746479-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C interrupt can queue fw_work after remove has cancelled it, or
pass a received frame to the HCI device while that device is being freed.
Releasing the managed IRQ only after remove returns leaves both paths
active during teardown.

Serialize firmware request admission with a driver-local mutex. Close the
request gate before joining the IRQ and draining firmware work, so a late
request cannot change the firmware state or report success after the
worker has been disabled. Do not hold the mutex across either join.

Keep the gate closed until the HCI context is initialized and the IRQ is
enabled. NFC registration publishes the device before pn544_hci_probe()
assigns the PHY's HCI pointer, so an earlier firmware request must be
rejected without modifying the firmware state.

Request the IRQ with IRQF_NO_AUTOEN and enable it after HCI setup. Release
and synchronize it before disabling firmware work. Complete an aborted
download while the HCI device is still alive, then remove that device.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 06c660340f1e ("NFC: pn544: i2c: Add firmware download implementation for pn544")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC 15.2.0, W=1 (x86_64). No runtime testing.

 drivers/nfc/pn544/i2c.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index 7fde3aefae70..057ef481579b 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -9,6 +9,7 @@
 
 #include <linux/crc-ccitt.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/i2c.h>
 #include <linux/acpi.h>
 #include <linux/interrupt.h>
@@ -153,6 +154,9 @@ struct pn544_i2c_phy {
 
 	u8 hw_variant;
 
+	/* Serializes firmware request admission with probe and removal. */
+	struct mutex fw_download_lock;
+	bool fw_download_enabled;
 	struct work_struct fw_work;
 	int fw_work_state;
 	char firmware_name[NFC_FIRMWARE_NAME_MAXSIZE + 1];
@@ -522,6 +526,12 @@ static int pn544_hci_i2c_fw_download(void *phy_id, const char *firmware_name,
 {
 	struct pn544_i2c_phy *phy = phy_id;
 
+	mutex_lock(&phy->fw_download_lock);
+	if (!phy->fw_download_enabled) {
+		mutex_unlock(&phy->fw_download_lock);
+		return -ENODEV;
+	}
+
 	pr_info("Starting Firmware Download (%s)\n", firmware_name);
 
 	strscpy(phy->firmware_name, firmware_name);
@@ -530,6 +540,7 @@ static int pn544_hci_i2c_fw_download(void *phy_id, const char *firmware_name,
 	phy->fw_work_state = FW_WORK_STATE_START;
 
 	schedule_work(&phy->fw_work);
+	mutex_unlock(&phy->fw_download_lock);
 
 	return 0;
 }
@@ -878,6 +889,7 @@ static int pn544_hci_i2c_probe(struct i2c_client *client)
 	if (!phy)
 		return -ENOMEM;
 
+	mutex_init(&phy->fw_download_lock);
 	INIT_WORK(&phy->fw_work, pn544_hci_i2c_fw_work);
 	phy->fw_work_state = FW_WORK_STATE_IDLE;
 
@@ -906,7 +918,8 @@ static int pn544_hci_i2c_probe(struct i2c_client *client)
 
 	r = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 				      pn544_hci_i2c_irq_thread_fn,
-				      IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+				      IRQF_TRIGGER_RISING | IRQF_ONESHOT |
+				      IRQF_NO_AUTOEN,
 				      PN544_HCI_I2C_DRIVER_NAME, phy);
 	if (r < 0) {
 		nfc_err(&client->dev, "Unable to register IRQ handler\n");
@@ -920,6 +933,11 @@ static int pn544_hci_i2c_probe(struct i2c_client *client)
 	if (r < 0)
 		return r;
 
+	enable_irq(client->irq);
+	mutex_lock(&phy->fw_download_lock);
+	phy->fw_download_enabled = true;
+	mutex_unlock(&phy->fw_download_lock);
+
 	return 0;
 }
 
@@ -927,7 +945,12 @@ static void pn544_hci_i2c_remove(struct i2c_client *client)
 {
 	struct pn544_i2c_phy *phy = i2c_get_clientdata(client);
 
-	cancel_work_sync(&phy->fw_work);
+	mutex_lock(&phy->fw_download_lock);
+	phy->fw_download_enabled = false;
+	mutex_unlock(&phy->fw_download_lock);
+
+	devm_free_irq(&client->dev, client->irq, phy);
+	disable_work_sync(&phy->fw_work);
 	if (phy->fw_work_state != FW_WORK_STATE_IDLE)
 		pn544_hci_i2c_fw_work_complete(phy, -ENODEV);
 
