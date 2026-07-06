Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3EE3F164D
	for <oe-linux-nfc@lists.linux.dev>; Mon,  6 Jul 2026 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327249; cv=none; b=gaGBOi9343DKg1w5HpmObR9jcgYT2H1o2I/3dUAMYwfMj3G20URXNjPy24LYTLIaVJ2twSh+83+8TpvP9vivIFEJGYG1/p0m6Ys62uBOf0SR3BeISlwPNKZ+kOgL8SrD2CI0Row7P/ArXfgB5htKS7s+D/U4LyIWP1CZ7uDByCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327249; c=relaxed/simple;
	bh=K1GNmpOIIOhYDgdp+CA+Pf4VVt/nyQJt49hSw3ao5j8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DsWuiXgGqLYCWDDIJIj5YwYs+McNI60W0UKAp7rTkoltKy0obwAWo5xHuQBplPlRA8g+x/qvYK0vxsD1QoluTtSkN5N9HBI4tpoaZgHB10PhymCLShsWZYsy9+WUtpktMPOLaQ+NuIE/4pWWOgxyjQig1tIFwdvNM93oPiOw9Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=LP/ezNbh; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="LP/ezNbh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1783327186;
	bh=h92CBGLQv856ItrkwFzet7jaDjUm3Lt+HlVjHrmeTyw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=LP/ezNbh5SO5le4YG1Tm5vCTCcN4XqP8I/MM6D0tGpUCOunstO199wr7CtwrQ4hSr
	 T0BFdx6u7SUQ8U9aa/c08YqM+a+yyddx8dToNFDkH9NR11MqrS+4uAtQJav6/6zscg
	 J0QdzdG6RfAlxMCSLF8TacqgvA4hldYRpaQLPZkE=
X-QQ-mid: zesmtpgz6t1783327169taa16b1a4
X-QQ-Originating-IP: UDVmnmVibFP5g3XG0vCXMjPNVZAX9j55V8MvBZ1mhzM=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 06 Jul 2026 16:39:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15330445638552442504
EX-QQ-RecipientCnt: 8
From: raoxu <raoxu@uniontech.com>
To: david@ixit.cz
Cc: kuba@kernel.org,
	krzk@kernel.org,
	raoxu@uniontech.com,
	error27@gmail.com,
	kees@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nfc: pn533: free queued command skbs during cleanup
Date: Mon,  6 Jul 2026 16:39:26 +0800
Message-ID: <3B4941C5D2E3FEE0+20260706083926.798888-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MzVGNhsCLlFKQfL6/+bwQQI9zhegcTTVjp4iWCK+ub5V4i4ammff+jth
	YamFLyGDGsI2Cje+1smGR5I0Rp7nHL+fuaS+xuRb/ZPOQxg/cTWMPf3fRIuWsyrc7vvhd1b
	ArdEgJi+axCoDnReprLjriuhQBl+3wD09HJrrKDIu2UZG8huMXTJ8JoPe7iakU4+lsNiBgM
	PlurGku1QHU1scyZiEqKdVWjZjxHKyjsoKcqtNtBqyWtPvnSWFfLD7bUwWRibqfWSzQBBNB
	VGZhAaJtzz9O4p+JbeupDCQ1yvrUocKoBdgyXLobcUIJPyCF3PUqPBj3NsTQ5NwEv0wkU2P
	L4YViwXDu0eer6Pasp7TTZIy5PuKP4NO1h3Jh44HNxpuOMj9cAASzeS4jcin7UevN9guMTo
	5GXY5xk5Ib/lkGhvF5BDEIOR3V50KO62sBtzse1qI9zp0JSq713ji4H5d/3fgOiWFosN9ci
	fV6mR5JjSlKdvvpItRuYwCzOlwuFwTYJ8ENbEC1CpeEBEVxdv8+71DLsN27MFElBtU2CfS2
	v9klxoWUo8tUTqsMTgqJW9nm0t7GPfhM37xLYFdMNf4/azaVWktV6Zh+PGbdtIg4jwPg0R6
	IGuCGEZnK1Fz8+g5TILRDScdtIrODTno2U6mRSv9z0xT5VoS8gr4wz7DKrmzj3Yzew0VrYY
	nHk5gcpIqb8HfvebFtOCpx1AnDDRgCsMiERKPRoQJTmEtofM+Sa+AXZZcadINRusJ68EMCQ
	qJX7k3Ab0LfM8nsY20fay9+sUuYVnNwsLlOphehcrjaDOVZNWMsTsjiu8tBoCjsdP4YO0D+
	9nfw7W9YkmfUFwxfmkVc7C2kEe/sVplKUM9yJplZpnG7Qa28J+kGwdewjtBHe2WPEYLotjb
	FTH0LcP/j+phIiUkZXevjtuG4zXY+IeTVYZilSYvTSjx4ZjOFBpgQ1Nex2COPXpfR67dYC+
	Wo996vSu7d916Wm4ynoSdXQJtzipEegoOIYCFHvXq6AMPqJyf6v88ieEZwKtls+DI5enUSu
	xhrcvBVa4dakn+ZZNxSV47HxZTlkZmfFPN21kw5AQYhgczbqQpmaJkA6HNWIpyfDM0pIj2E
	8vJwFm+N08T5LBJ5O4WpsH/XZwuaeQdaKE6ijELQTyCMPUit54Nr64=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

pn53x_common_clean() destroys the workqueue and releases the common
PN533 state. It purges resp_q, but leaves fragment_skb untouched and
drops queued pn533_cmd objects without freeing their request skbs.

Queued commands are created by __pn533_send_async() when another command
is pending. At that point the queued command owns cmd->req until it is
sent or discarded. Fragmented transfers can also leave skbs queued in
fragment_skb.

Purge fragment_skb and free queued command request skbs before freeing
the command objects.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/nfc/pn533/pn533.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index d7bdbc82e2ba..de2b7f4d708c 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -2799,9 +2799,11 @@ void pn53x_common_clean(struct pn533 *priv)
 	destroy_workqueue(priv->wq);

 	skb_queue_purge(&priv->resp_q);
+	skb_queue_purge(&priv->fragment_skb);

 	list_for_each_entry_safe(cmd, n, &priv->cmd_queue, queue) {
 		list_del(&cmd->queue);
+		dev_kfree_skb(cmd->req);
 		kfree(cmd);
 	}

--
2.50.1

