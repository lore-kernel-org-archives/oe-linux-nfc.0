Received: from out-2z4y-a128.jellyfish.systems (out-2z4y-a128.jellyfish.systems [198.54.127.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34B447DF8E
	for <oe-linux-nfc@lists.linux.dev>; Tue, 11 Aug 2026 22:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485754; cv=none; b=JOQnZifAVw8bR+CfGQ4tJW6QXYOwCWmRizICi/0J/JEujwf0ObdR2Gx9yBSdFdW7OSgBDOl6GueuvelGCS+vzqojMuTY1yRfIQ/KhUxKBeI0JkRTgGEfJMIpMBdTxcImPwwNmSlx6qM8JR3AVHD0Eb6qqBhkWwH+6iszYLov1aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485754; c=relaxed/simple;
	bh=Z3+PNZbexYEBGfPD5sFnQ1ueFQ5UZLxOTsSqCW/A9k0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uePZDRzE+k2PXm/lfF0d3WjfuK5mUMMBFAyTWztFUuSvHvuvXtbHzCgwiiwz+lBPW2lqvTYiCqCZcJaKTiS5M2Y+066O1t+4rJjhsCPbrPF8EkkGo0LG+Qi1hmkofWIfsXpLsOpurLcD28cC0mFjN/r8opfuwWQd+fW5PIKMs0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.127.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (unknown [87.215.145.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hKQZg1s6Xz8sWQ;
	Tue, 11 Aug 2026 22:02:03 +0000 (UTC)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: David Heidelberg <david@ixit.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Subject: [PATCH v5 4/6] nfc: s3fwrn5: enable the PVDD supply
Date: Wed, 12 Aug 2026 00:01:33 +0200
Message-ID: <20260811220135.472380-5-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811220135.472380-1-jorijnvdgraaf@catcrafts.net>
References: <20260811220135.472380-1-jorijnvdgraaf@catcrafts.net>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: jorijnvdgraaf@catcrafts.net

The controller is powered by an externally switched PVDD rail. Get and
enable it in the i2c phy probe, before any of the chip's pins is driven
or its clock started, so the chip's power does not depend on whatever
state the bootloader or platform left the rail in.

The uart phy (s3fwrn82) is unchanged: the PVDD pin exists on that part
too, but no in-tree DT describes an s3fwrn82, so an enable there would
power nothing and could not be tested. It can follow with the first
board that describes the rail.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
---
 drivers/nfc/s3fwrn5/i2c.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index c528c085b43e..f93d8b47b65e 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -11,6 +11,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/module.h>
+#include <linux/regulator/consumer.h>
 
 #include <net/nfc/nfc.h>
 
@@ -158,6 +159,11 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client)
 	phy->i2c_dev = client;
 	i2c_set_clientdata(client, phy);
 
+	ret = devm_regulator_get_enable(&client->dev, "pvdd");
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to enable pvdd\n");
+
 	phy->common.gpio_en = devm_gpiod_get(&client->dev, "en", GPIOD_OUT_HIGH);
 	if (IS_ERR(phy->common.gpio_en))
 		return PTR_ERR(phy->common.gpio_en);
-- 
2.55.0

