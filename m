Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F323A48ED
	for <oe-linux-nfc@lists.linux.dev>; Mon, 10 Aug 2026 08:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786350115; cv=fail; b=sxJnLacX/CNEGaSn9gze4L4NK+6Jtpq2oM1cENAPppzQi3tkt8+MJcaysMTc+goyR0pk8ZUdAGaSezYau/7EWezSbajJCm8725r6qj4YrBlS5mp2tZX0aKH0hOzAy08H4c2C+a1dMzP400tXOc6tOgnvlc82KNUaoUObwznDHM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786350115; c=relaxed/simple;
	bh=jbger48BohFc8S69dgh0Klt03nokXlAMgL6SdILYayg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oYr0JKlTpcMR7G9HJ2433lABefrqmnMUDNAOuCW++djccwg4mnh6qorGD8zBS6pYrOWMC5lG1n3RhF/6LRF/Yffg+v+6/wQkRZpg3NTEQBkMncjxilCXlcUw6HFiEWHn4Z0rOUSa1wdtG7FyrYp6dHujhgBGqCovynHarR2HK+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=nKUnmsOs; arc=fail smtp.client-ip=52.101.52.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="nKUnmsOs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEKDt97HqHh7PLpxRzWVB4ZpZGUkZ2OlcUGpfnLWNEIyDCmf0ObNBba82ezlwNTtKP8ajbSv/SpLrEn5Ag7y98H82Lk3pGmJbUcQd/jPIk8P//P44G0tmjWK1bQFSK+qzCE23fA5Zk5JWWsHmK/6f/NsUdwicqRLQVi3q0NKwyv7ln0uthMpvt3S6If7s2v7DqJvs/7jw61yuwC7Y9UP8SzyWNOUe39JD+RNLd9UYQD/kDPtzYIEWFvxtco6p8yhFs0DDEuuAqHsCnHSHX5ia86O6vA/l3BzRNCMok4nKKVlPQmj4HuZkIXQSTaSeSLgsQ8DE5wqVhJe94DEtFht8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hK7/0O31ND1R9nU52JSQRW7bsszYpjMfB1irG4X/7U=;
 b=YWQIvsx2C/tp1IpkKtuHAnmJ3iWTwRVEV6B9SNYd+p0JAFtkwAh7m4mOviDqDNJRxwsVgab7Thv/E3NJgTgWhGKbqftUQ/Ubkx8HsOgVjKwB6OqRo69rZRrB0Zml9bBNWJJ19TU5DvQwvBhrq/QuUb99z5t6q8UjPENcCjYMrAPWK6ThpHCzG+qPQEZfhExwZf79kNOMpwNywbtkulYkUvNilJYmf5J/OK5D6bud6AOC5KDMnT/KwHe6A0Lxmi7/M7Coj/2S8jsQFB1OKLq3BUnWOH6mpepeLECRAH/fLNxHdu0CdpL4Y9MOX7vHt8TrKK5KxHZCjXFQAJj8vFMTgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hK7/0O31ND1R9nU52JSQRW7bsszYpjMfB1irG4X/7U=;
 b=nKUnmsOszIqVc/ibC9+/njxicCCxhsKb0bSA5UmyaozN3B2FkIrL1Rh7ELqocyPMmRap/zih7llFcTkqIvHSPSefuPazha9eBSVIf9r5cWXHpWUu74tZrJZLgx2zY4XOv4SAP+l1reVAlIWbwr8T0BLOfxNyNiAYQ23XtIpG8R5h5Qb4g/0N17EicTSuc7b97ky/iI38MGB7OHtt+AofhPkbNrsmocbTLNfVpDhvgNRvfh7/3Uu8o6qdgL4xVSf/P3Wv41MQ93F4hCyVQ8UOBJEKReQDPycAwIsne6Z0CddS07KVsr3NLkAu5BHUQZ1pPqmvxzCFKaGxyjmMs3MHog==
Received: from SJ0PR13CA0139.namprd13.prod.outlook.com (2603:10b6:a03:2c6::24)
 by SJ2PR22MB5024.namprd22.prod.outlook.com (2603:10b6:a03:590::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 08:21:45 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::8c) by SJ0PR13CA0139.outlook.office365.com
 (2603:10b6:a03:2c6::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Mon,
 10 Aug 2026 08:21:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Mon, 10 Aug 2026 08:21:44 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 8CD3AE4DB;
	Mon, 10 Aug 2026 11:21:42 +0300 (EEST)
From: Ian Ray <ian.ray@gehealthcare.com>
To: David Heidelberg <david@ixit.cz>,
	=?UTF-8?q?Cl=C3=A9ment=20Perrochaud?= <clement.perrochaud@nxp.com>,
	Samuel Ortiz <sameo@linux.intel.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	stable@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] NFC: nxp-nci: fix deadlock between firmware download and IRQ handler
Date: Mon, 10 Aug 2026 11:21:36 +0300
Message-ID: <20260810082137.719-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|SJ2PR22MB5024:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d38c2c24-c3b6-4219-4ce4-08def6b86a5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	gUT6DC/jueLOrGkvdnYiBy6+Jgg4v6D0fU3tIfK+B0XyIPfsiA3aHvZHwxLRX7G3YWGYtGGziXpXEkCgk6sBXuhyCPlvZjSZ04Gp1caapDaMpV+jPKQ10kBAuA+9PpmWGKigXIVDEnz3MV85ENcQNI+y4Q5qylrR2w9Wiy7M/ZGo1xu7rbyoL0nfshIGX2FSFLNLklMCw31fLR+SiBZtrRmLp6nQXxLHoMrbZiat/n2zDGt/cx20oHCrO4iOuNMpVVR6MOqKCYG1p53fqVbeqOu5ldpYZIm/8ru5ukkJmggKpPWOn+3jeRFZxg2w62UekN/93r4r64hjhYBv6xdwhsNG9EycjEYR41fuY9/bDS2i9eh2VvvpyU/YNikpzG2RUpHPk47twIueNrbraGmpvpUpXVuySUE9LpdSUJeKArSMzczl8SZ/P0wOZhoG7JqIzDi9eYGpCIZ0AIqcneML9f106TkJ/+F6uMqKqPh4GjPbqv0jDOt09qkvY+ntPF1J96h46JpehvP5Gg9/TOHyMzfhn0nY3clFOgQROx9fI8KrmoIA76j7JbG3OfUeQ0TK/QaBAjJ1s2dMu3shtSp9QazW/uWOdsQjv45eHpSaUB6y5c0pHTnPX+DFNdtVYCMHU5fp80YjzpTgcN+XrrYDgTzW6inlE8ccET/OHaP1XSoyK7ebW6Vr2l21tS180B5t7nxlYLiOq02tTsvt0TL/TA==
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UwqBYz+4t/qWvG2kbb1PAtojaaLkCgTpjBPsT2qvGuOdNa4yDCDoMD8wAFU5SN+pGhkFB0N3UjSI5/RdTNqkV2BD1oBRGXj0lljalXJTXKZGuFY2wDZP5Loy/MWiuX3JO8a/S30lupTiT5LgnGtEYlZY9yiNYsFYocKY4YKoDwAxFHHkFfKiE+ENqwuJ8/n0U2NTb79YRFBrU30QYKioghy/GIzP7MgwQiKEb8EP+BvYe58d+q21m1Y3I08I4rC5FJ3+9WUpEBCw/RXy9tV7f1dj2UZMoYcxjw1DpWOLtIRJ708UbyY7pMc0/4tnDWS3axOjFfQqZHH+ddLlrg7eW4qi+H5j2UOmT5MUWWKCDaGDoqUqoPSVCekQMfJ/hWK8t7/AKakD8Zk2/7BXftTJj0tkLx8lPd2CoFB85chLmAY76GcOy7+4p72iKeQz+uMd
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 08:21:44.9799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d38c2c24-c3b6-4219-4ce4-08def6b86a5c
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR22MB5024

The firmware download work function holds `info_lock' while calling the
nxp_nci_fw_send(), which waits for a completion.

The completion is signalled by the IRQ thread handler, which also takes
`info_lock', causing a deadlock.

Fix by dropping the mutex while waiting for the completion.

Fixes: dece45855a8b ("NFC: nxp-nci: Add support for NXP NCI chips")
Cc: stable@vger.kernel.org
Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
Changes since v1:
- Fixes tag
- Cc for stable
---
 drivers/nfc/nxp-nci/firmware.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/nfc/nxp-nci/firmware.c b/drivers/nfc/nxp-nci/firmware.c
index a9533977aff8..38fcac26ce56 100644
--- a/drivers/nfc/nxp-nci/firmware.c
+++ b/drivers/nfc/nxp-nci/firmware.c
@@ -154,8 +154,13 @@ static int nxp_nci_fw_send(struct nxp_nci_info *info)
 		if (fw_info->fw)
 			schedule_work(&fw_info->work);
 	} else {
+		mutex_unlock(&info->info_lock);
+
 		completion_rc = wait_for_completion_interruptible_timeout(
 			&fw_info->cmd_completion, NXP_NCI_FW_ANSWER_TIMEOUT);
+
+		mutex_lock(&info->info_lock);
+
 		if (completion_rc == 0)
 			return -ETIMEDOUT;
 	}
-- 
2.47.3

