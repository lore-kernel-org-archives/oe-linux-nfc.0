Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010066.outbound.protection.outlook.com [52.101.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6A03DB338
	for <oe-linux-nfc@lists.linux.dev>; Wed, 24 Jun 2026 15:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782316590; cv=fail; b=nRFvPiBerN7SY5kCVBfAKjCFrazJJny1zgjRFlYwD54w7mEGzFw/raT7zOnKTTvS7RPwN9uOUE9F7HfDhim8BJtTL+Y74VkSNgnO5/cfhF4srXX7h9eq0mXWVUvIpq8zwsRfO5X3BQyiOyP/D2z0f15kobgKiGIt6P9V1THDcmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782316590; c=relaxed/simple;
	bh=F/E2JqtivnPI0kpFw/KrmRGCiOOsyKVGlMorY6ZNbYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pC6Lwo8avmpsd4n2MBDJzGziXKoJI/e1XrGqQLq2efS8MVj41BYiDFeXa99TIade6Ok1XggAG0mjjq0s19Ee+W/vpkP96mY6sfZdaLkThkLa0Wek7LeqfIz/vIMl8y+K3yQk0OwyS1LkgPyhf2KO2c6NUcRWRoHDwCI7iQu2WaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=DUa2TujB; arc=fail smtp.client-ip=52.101.61.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="DUa2TujB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEayIKOeUD2VsNjd9tsBWl/7Z/C2Y1G92GS6wyY4e4hK/6UsW0cXPD6sZsZdMJ3UYrDebG44wYvHBxn+oirVpTf3KFFGSVO1AV4QfqShZit71eWmgCuXHQDJXjVlAw5t2Pq5Mx6GKa0CGcGc63bKeMt2Xn98XgqrZZV1JFhjJr7s2Jc4XEYcihjeW67kGgF1ibmswO8ycYiv/MfCkOSOwLn/+/Yzyad+EGS76uTTUZWrPi4g6ycCRyHrpJN4FvOhHR6mxrPiD2FknWzMpPiS5AulqG2jDcT/Jxh/ivXnW0eHMi0d5Uk+QGSsj7EXggpXQaOx4WrAQV4Tb2XsCYocqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtCbrVFMDrLmwX2G3Y40NnliJOPbWaEzvtvBhc4IT3I=;
 b=eArAk+ms8kyfPRHY1Qp0BcD3C63kpGePH8R28+erO2iMA6hOGHMNaEyPdU5gEwmdaT4U1eDhwXTRSCs5JoDWqLjXzm3G3H75pQvNO2QbSMuQn8bRbPQ6GIehlXnIRHvdgVUtulh/lH1BEBhe2+i3NWzsk/oDjbnfklJpKeWkDHn07iN4KDMpdWzePVKXo7caH8qLzb4LEkK7uMoEiXQbfZhW/+mzcIIsHvmLMYuiSAKOLtD7/mK4DLegqYViA6HtLFUwxWT7aSpIkCAnW53CjAP5nSYUpYMZKLKknbhDrnJckDpJOznYGhSia/bv5UVOkUSZGLMJLg4Gfp7r3l+SuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtCbrVFMDrLmwX2G3Y40NnliJOPbWaEzvtvBhc4IT3I=;
 b=DUa2TujBJvmC40z+wkJP0osAWFiKJp5yb1yyvPnJFAflxgIA425sUG4+7u7N4VY1RxYzdi4Sk/pk9E6sZiJckWnf61tzLp84HeHpV8ZEbqi5jvWWasW/RCbTgctzWLM4E1OPT1dPne4p11/vpqmU4YEiYLqnff3HkOmsDlT5b/qwsr2mgps6zIr/Q8Cmpj9bxSKm1HBBvBWTG+oKkRytNT8lVsUrMB3PAUjKToHWpUJsctdtQ+NMBw9tU50tolJT0ub4e3KHkb1NWeYn3Fd/IbBPHalBVV+hCKDwtg9eLNSB/7BaJ0w1n+wO+aSf6SBHzW5lGMSkassIUz5SNxojnQ==
Received: from BN9PR03CA0851.namprd03.prod.outlook.com (2603:10b6:408:13d::16)
 by LV1PR22MB5989.namprd22.prod.outlook.com (2603:10b6:408:2b2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Wed, 24 Jun
 2026 15:56:22 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:13d:cafe::49) by BN9PR03CA0851.outlook.office365.com
 (2603:10b6:408:13d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 15:56:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.0 via Frontend Transport; Wed, 24 Jun 2026 15:56:21 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id BC5061290D;
	Wed, 24 Jun 2026 18:56:19 +0300 (EEST)
From: Ian Ray <ian.ray@gehealthcare.com>
To: David Heidelberg <david@ixit.cz>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] NFC: nxp-nci: fix deadlock between firmware download and IRQ handler
Date: Wed, 24 Jun 2026 18:56:14 +0300
Message-ID: <20260624155615.858-1-ian.ray@gehealthcare.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|LV1PR22MB5989:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8ac4d4e0-edcc-41e3-23d7-08ded2092328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZNoAcvFhWMaczurv0W92ClsMroLH2/LjTEls/xxLNBJUAx9KLiismOn99LtCA17H8hT33bvdZt/LWlAOc8t9BZnA3IYf4f5bTttitHsrkxUbzvVkF0X9HswUdm5K3Sd9P33ZRL+rKcHPIIVYxNFj5mha+fKJIQYg7t2+SyVnJu8MJHqyIDBoleJYWKsgS2ZiuoGveNBJGStP5YDUbV3RPb8WPqALEfdttGR8Go+wDU9UZ3335907czBVyoSO5qFksQVsu60UIVF2gdfd6+eNTsUAX9v+r/8v4knK+eDJN+3bfzIPANuiSp8fSGDcAX8L/0P3KJrNi5x7qv0gRwAftv1al8CPIKnVcSORhOqsJLZygPb1dHQ+tJMIyzV5JbydUYOPEp94/u41QwZCK8nZRIK+14L1GhQLWKMMmm8sJ3QB7mxXxBxUnmZwk9+HLF1gsxdVHFTT2Lg3et5n8R1U4PSJfm7WvvVxbyyCM1k6pGNxPNwffImVcz/fYWKhUQ652cTHKqXgYn76EjUw2Pgf2yu735ZDdTdjcFIjNt71NTKSlvdb2KbmB3VaLt/FTKlAvix4kKTyljDhWp/BPD2pzOzzgjKyQ9ZwqB3pBZ7iH4Zy20auLy5I0sNaAGua0CC6UKxihPcTV6JytWn9VNWHyE3WGyrpuFonelonzNFNi2hf2zXVryyW9f1qvNDtgwn+zngQ4DXjitcEzJu7CVQ/5A==
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FVbCJi1PrDeEJgqV1PZjsGVR/sT1w2gTVxrtp4kGSbNk0+NspBPEE1jB1MK+Nw0skvv+nvVVXyzC6o0v/M/2VM9M4pzg0WuaFWBbjUb3lTB9whUhCT988J66yEmLQrc7RPc/x3zTjKp32G9cnX7YKgrNilgDKej0zzW6uK4XhW+w4A750PXXOzMWItn8Xmpsk81kW7Uc1d6Kg9jrlPMLJGTZO8dQqKs0O3oeDcCcl2oAvgqnjLX/1Hamcgb22ejyRIjs2G0dBIADLptcQMlzgo8y+CHx3O13RVgbA0gP4QtMDGHGCnlVPUYmpWSFYIAqSftsuLH/mX0I/X2Y626pU6oFazG9MeImm08QwFhBbr7nbMF1Vnd4Wn1ywsw1FMvLqcpkWYvfKHC+F8ubVg6H3DIvPGt6vcmJLtMmXDd6+lG8HnsSFp7ZwJvTuDqi95OS
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 15:56:21.7700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac4d4e0-edcc-41e3-23d7-08ded2092328
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR22MB5989

The firmware download work function holds `info_lock' while calling the
nxp_nci_fw_send(), which waits for a completion.

The completion is signalled by the IRQ thread handler, which also takes
`info_lock', causing a deadlock.

Fix by dropping the mutex while waiting for the completion.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
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

