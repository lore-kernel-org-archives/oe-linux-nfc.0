Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011027.outbound.protection.outlook.com [40.107.208.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DAA43784E
	for <oe-linux-nfc@lists.linux.dev>; Tue,  7 Jul 2026 17:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444264; cv=fail; b=rPeVue95e7f0gBM9c8W3EoymbTUzULztG1i7Z8zsRp+UbsJ6OMasQEkJ7cYu6P+lGM0x3/s5QIqb22/l7nvoVMxeqsXo/kf12eo6bxSeKso/CngNaxygRIrxIXaE18aCoPPJys7OWxz2PweqhYh0s31imky9XiMgepkg16Y5zM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444264; c=relaxed/simple;
	bh=AqdTCdZjDJPr74OkumNSGn5hmLipIMdFZd4f5qtiPDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBiDzGf1pNo8nvwQ0BmK44WCE6kf2JBB0H3QxFlvT0PIos6EV2GnW2BoinbWE+uEij8kWLyre4xw1lVCgFc40Fo3okvBX49ZC4BzwgU7Yyv53+APF77cLX2nYIGrACT1nQIs+U7hNxG6u1vCDCm2uo14deQHBOp9s7uAWky+wY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=NdOE730W; arc=fail smtp.client-ip=40.107.208.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="NdOE730W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVL6lcp5UXRCBSWZgx/dtJqpQn4xqwlLRUZUQ/BmT/NSQ6XoDsu/kyOMYr4EJtFhqXQKlyN8ln66tK+QzYdHyWzVVEvMaI0twLtvkIn3bis/eISg9BVh/0DrQnRgKj6DKF8ALp6nSYWRsVkaS/TsupVFmAms6SKnqhsO6iXPoiOzAC3EEKX7SuoaP2gHOCPp4RKWrR/4y0g64BQBptY7t8f2ytsPS1QPQOgAYpOKo/RK/4PBZTKrqTGPOKsaDMUD69yMe7Gngn07rCXWZ6zKYoapxb2KbYxEHg3oELgzTkoDoJB0XWrylxbvCzzSJnfx48/TD4bX6phXvKpTylUNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuFjPVWZ0S7I/NhN5L7l+kiIF5nNZ0lY3SyapqM/CP8=;
 b=m3cSOzaP/EAh97wgTbEBRrF80ropcH1r16d/3ET0Y/hGL2cTgzBXHLR7AYFxxvfD0l6FzHehzuFKisfBXya6g+I7yH3T6Y3Oy0BMmCzjIWo1ayJjVLWhdDgDCpQmwZh5NrJJcAJOt3EMeuscMbqXien/q+aA3KfnxA+uNGoUskka/QtE3FhamPcHh4+NZI/CnR4ZY8Yh16rqgTFTENSv4cjalwGCUX43/oezrzlagntZOJbRtRtsp0DS0ciPrdW2cOTBupmbeiZKb9aWbn+njTjlwfwU0zzLoN6dC/YMwy7y3ObDy41J7QPJFAR+owHmHOBZKnZH1hEFczAf/s0lTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuFjPVWZ0S7I/NhN5L7l+kiIF5nNZ0lY3SyapqM/CP8=;
 b=NdOE730WWNw230mNaeX2acYO91Izd4CzYbGgt0+vyw6z7ZpQtdJuazfaeBT5kd8XWpI54nByvX1HiDaHszqzE/fuIapxhd9E2VXOii0MWbfWe5r6dC/037IczrwaAgI20gZHVaQVxi9Qay5m4UjnB4ZqPivl/UE6ZzzpmpWYATgju2es5gRtR40ROOE5YczBlU+XChLPMv002SegQwpFWMxemijMOI5lJ/YcxKdBuAk59E1HtcvCwYaoE/Schut3rKuxhLuxiIMh2DtEll5SXR19xt0ZM0rqy4vkaSoRcKK9hVApHC1sdoWput0gAW1v4ILPOzsprl6RuMfoXbMqrw==
Received: from CH0PR07CA0004.namprd07.prod.outlook.com (2603:10b6:610:32::9)
 by SN4PR22MB2904.namprd22.prod.outlook.com (2603:10b6:806:20f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 17:10:59 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::98) by CH0PR07CA0004.outlook.office365.com
 (2603:10b6:610:32::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 17:10:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 17:10:58 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 1D72D1290D;
	Tue,  7 Jul 2026 20:10:56 +0300 (EEST)
Date: Tue, 7 Jul 2026 20:10:55 +0300
From: Ian Ray <ian.ray@gehealthcare.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	David Heidelberg <david@ixit.cz>, Carl Lee <carl.lee@amd.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] nfc: nxp-nci: Add remove on IRQ error
Message-ID: <ak0zHxoAC8w3H9Nn@zeus>
References: <2026070726-observer-fang-9716@gregkh>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026070726-observer-fang-9716@gregkh>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|SN4PR22MB2904:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a2b350-ce6c-49f7-6b68-08dedc4ab6f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OYlLSP8qiw3RD4RAbdF7IBR0b/nkCgroDy5X0WAxLcpu6+6Ywp3XVIADro0KjMzdaNtkPhI6N8MmuQORceBBzMxPNEdQP+vSGHoRu4gBrzYkp7bv5BazTYybZBZmXBzUR/eacjvFjp/UzQpxfyO15D0ZMx5nOhpe7vL2jOjgQyHo+DpSsy6mZfXm3TCJEkn0x3V0FMVyIBy1LTjkQCU3o4hnVOXFyyJYoOaLBV3WdZZ+SX4v+SirQHa++lI1UWE8WuVbSolSOMk8OEHV0dLsbGRlmQx3YKDrkA5Ywg3mIXJiNrCEBRXjiB28ZECFU/V2HdtYIHR8sAzEOf09yPFWvzldlIGZ6FlpuiNvuTFAZi6Rjjl1PUaJOBXWhSo3Sb0HhrQA/deTqLcPMjFS8G1han2R9OrdYqh25KC2g5SvHm79SIiX4IMBS9Sy311Pk7e3ecnU94UInW17bwRnix20ZL5lrbDK+2AuoMPv8QrJXDA/+lwbA0/YDexjnz3zs3WIftgU3vHNAiWHiTiZDQ+83oSpab7aAHpv9eYYiGmDV76g5wTeTDIR7GiSCSbvkQRN3t0KD75vFyaKK/AMvo3icOLv1af/9UGTIPKcCf+UJPsdd4OMnFf+vEBSeXnka9j+iDz/TAT7/0VXcd6yrIiaL/4HxoOhpbpcNmEM9bPiNzPENn0Iy39W9TUGXFJKbxAYHtUq8tGLc8npCmiTqeONdw==
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sEo5kGkd4hh/aO/DxzjOcq8Urd5qDZhwOpJoUVk8WgZOocTgrbUJDrDgkwhY/kQjVG9zi/QzTk/RrOhVJul5yRoFgHQxayOU6pP3nqqxH572eV0FkA2vZnvMAT8a5YUrw8rMn46+VipWg+Zs1ju+hmnZvg/0ngJHIAEnn2PKQbTCv4cmb8Pn0am7ibuWO+K58KIg1hb17A/ooMHqRBIo54y1NnivicZU40XpHW+f1VDzR8N4pbRByamrbrE13n4o44bhpoN7x9BxLz7Ep3IvC7d7PQnkgszehmVj8jyM+oyFn1mDsqUBo3pqzGctfVkUJH/+jucjAYpFuZHK4XEFtVuSRN4PK7//D4iP0rb1bGe6HdGKS1+zE8UT7rOjdudxqUWcwmkv+Zu6KuzK8HOjOc6ZbQMn2ftT3jbf15JG+foShpuj4/drRl7TkBrpNm8/
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 17:10:58.6153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a2b350-ce6c-49f7-6b68-08dedc4ab6f2
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR22MB2904

On Tue, Jul 07, 2026 at 04:23:27PM +0200, Greg Kroah-Hartman wrote:
> From: Griffin Kroah-Hartman <griffin@kroah.com>
> 
> Add a call to nxp_nci_remove() in nxp_nci_i2c_probe() when the
> request_threaded_irq() fails.
> Previously, IRQ resources were not being freed upon error.
> 
> Assisted-by: gkh_clanker_2000
> Cc: David Heidelberg <david@ixit.cz>
> Cc: Carl Lee <carl.lee@amd.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Cc: Ian Ray <ian.ray@gehealthcare.com>
> Cc: "Uwe Kleine-König (The Capable Hub)" <u.kleine-koenig@baylibre.com>
> Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Nice improvement!

Reviewed-by: Ian Ray <ian.ray@gehealthcare.com>

> ---
>  drivers/nfc/nxp-nci/i2c.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
> index faebc89a7ef5..564f38735510 100644
> --- a/drivers/nfc/nxp-nci/i2c.c
> +++ b/drivers/nfc/nxp-nci/i2c.c
> @@ -334,8 +334,10 @@ static int nxp_nci_i2c_probe(struct i2c_client *client)
>                                  nxp_nci_i2c_irq_thread_fn,
>                                  irqflags | IRQF_ONESHOT,
>                                  NXP_NCI_I2C_DRIVER_NAME, phy);
> -       if (r < 0)
> +       if (r < 0) {
>                 nfc_err(&client->dev, "Unable to register IRQ handler\n");
> +               nxp_nci_remove(phy->ndev);
> +       }
> 
>         return r;
>  }
> --
> 2.55.0
> 
