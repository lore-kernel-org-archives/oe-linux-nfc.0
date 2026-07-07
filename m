Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010008.outbound.protection.outlook.com [52.101.56.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5E8186284
	for <oe-linux-nfc@lists.linux.dev>; Tue,  7 Jul 2026 17:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444358; cv=fail; b=kZL78+PtAK/HfVJ2nOmO4w0Ubaph/pVGHuIu0X8jCgXLKxYoW0v8UAgXX3SxWXPFAfEQHeo8pLE/DIASpp0/o37p3BIWT9f9FanX3RWIHDsVf+tri9eDYwevg48k94kq4DsRfh1bkzA5rj7Q6R+4MurROFzTdmDT4O4FKuyX6nQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444358; c=relaxed/simple;
	bh=QYPv2SRrFDlOjkVNzVY8LwspziAihyU4qE6aK5Zenzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=au4L0FNQbtcZHRGgK9AXdADUKFHy7TPGlS64Zunat2gm0NYaRlRCLCifIuk3PGTBmG4eIBmlPhFH+Z7gi2U87k65EEepjMuWGv3knOIIsKhztnUuBQ53HhugCje7WKtL86xWnMkIm6l4E6mnt06C4T/lDegcuLFd7lb+Nms/KAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=ynSjF5qM; arc=fail smtp.client-ip=52.101.56.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="ynSjF5qM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmIGS3nnoZfcjP/w/PgzOBmTkaeBp62qiYyEoiab1rfG/hNA+Ksnr29jBeYPgMOj6tQEueLCU8TsoYBasYsC8nMyxmD50aDfjgnNsgOkXnMM7yZDeiVMZ6Se50DUnNM6A3u6wvv2Devg7zQYs3joz9TFzUCMExKtn9U0E/NzYhDqO9IU6jExQb4Uc3cqvSMeOYKwZJPSCxomlFiU1WC0MRlAu5IviCLFEtyWSb7kcV5GryXWFB56aGvzxc9vHF/d9s135VFjN7AcABKegyVDTwCzq/yawdMBkz2lFKD8VJ4pGInporDRxKG49S1h0AULQOfvILckdSWHW9dkjb+7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lo7PmIFxBNtvtBxythlsA10aKndfTss3YtrS2J1ZD1Y=;
 b=qZ4tZ5LmJTceaJX+ybsLyYV14qGJ9YzzXlKg9AGUEbAp6rTzpSm0X8IejIUaw2MBczMZ6rtfcw0/7XF+7VFdFhUVvWMcjkwluqMsj+w6f4ICHt1uhvVgOyBcXBaii0jo+OfV5WIAsX0UskGLIY6zpxInaQ20cPMM/cGFuBZc3tm+X0D56BwbUmeFq+Kug5vzPXkbNN9q0rdE/4tRfMeTRGynX/liaq9flhQNUCxGjQlhOUWaUiBvDMo9FJPDk97qdOMglnV+XdZEtBUUignBw4YC4LF8U4VYcpE2HapGJcZDs2A14/QcbrDmhx1Q4g75IBJB+CrvHR+2C99HSZzQ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lo7PmIFxBNtvtBxythlsA10aKndfTss3YtrS2J1ZD1Y=;
 b=ynSjF5qMsklBt4tqil0b2Xegn4fKP7w2zbb4F2d29uf7Cv2brxxof1Or1xRt17DdoglZ6XJtBswmOKiv6gRYH/EWdj9efpdPrSg0TLWsfBwYTORTB5N2H7v87ZI32EaGyQaBgGIU7DCbot67Ge/1NuFR47SbU0ZPXnyye5+b2RqvQ8yGqLkyN3/ildT7RLoT/qbF5w5fh+/CfNpF57DRcqYoalu263CkKuV/gRe13Z7LSVE2vsw4R5TZgcfhG96mF0mBragIzj1jxVzSdnVL5cS3ZBpK3zl5sjRShlF3ANzA3cz0kRyoHxC9S+szQhOngLls0PE+xc+J3ARsqtaRpQ==
Received: from BN9PR03CA0710.namprd03.prod.outlook.com (2603:10b6:408:ef::25)
 by BL1PPFE069F944F.namprd22.prod.outlook.com (2603:10b6:20f:fc04::f53) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 17:12:32 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:ef:cafe::7e) by BN9PR03CA0710.outlook.office365.com
 (2603:10b6:408:ef::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 17:12:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 17:12:31 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 6E50E1290D;
	Tue,  7 Jul 2026 20:12:29 +0300 (EEST)
Date: Tue, 7 Jul 2026 20:12:29 +0300
From: Ian Ray <ian.ray@gehealthcare.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: David Heidelberg <david@ixit.cz>, Carl Lee <carl.lee@amd.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Tomasz Unger <tomasz.unger@yahoo.pl>, oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 03/12] nfc: Initialize acpi_device_id arrays using
 member names
Message-ID: <ak0zfaTxM5Kn7X5j@zeus>
References: <cover.1783091699.git.u.kleine-koenig@baylibre.com>
 <5f60cd3e9831aac3995ed1a1b074ca1ae32e5286.1783091699.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f60cd3e9831aac3995ed1a1b074ca1ae32e5286.1783091699.git.u.kleine-koenig@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|BL1PPFE069F944F:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5d449f-c46d-4a7c-25d3-08dedc4aee88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|5023799004|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	C/5resRTrBKHktQAcKjxIENMnKZQ3v1FOFwrBFxpkARHcmRKiWqjbTEsfVZulI2U3kpBe6h2fJS3hHmhtmqdGpKtDEKGz2f3Y029t2jCNzFrHbpMfh7B8mLxcTLfkiVjT5chCdYK4otmIXpzKSxdRyFVo6Mb2RRRckY6MPXnNAczi2yeIldqCKwuqns34A/8cE8ZRiBHdQOSNyMsiEP+fZU6YnczqRyt0bwv09XB8gD4ySxLuMRQADAOR+WhXJ8u17MXDIltsqX3Otx3nCi43UE4pDK7fINhp+Mh4QkyX7LUD3UJPkMOVjlCjpbN1V8GwOeVX/RA+Yj3LGj2UxfkM65GF7+VO+7yY/xfOG1W8vTVuG4jl/bp03mIdjIoJflQ8+KXAUyMJC6Z9UHYyB3KYpFqpaYSiU3u5D1XNncePPczspgkFcZ09/1kQu0nFwUFMMkX+9UeoCPFf1rwFc1OnJKxZH5oal6X9stxb94ZPMMgLmqAmie/28es/SqN3q7yhs+QVd3jO45+T4YxCQ1YGreNgYem400VU7/mRiVy4nBQJ1Law7mmCpvkOynueVnJ2i3Fr/dHPGoNa5GEb18Zjr6YDt4M0ScI6LACr8m+WIDCk6ekx73CzSLVYbKBwTmZXcyOjnHeFA9VCEbxgd7OtMl5/n6rxPaapmyLnRN8M/QZBPrpnzNj80x6ocabFjeujOvhk+IpV1RoQDbFn9sCCA==
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cHgVhJ4mBTvrryMx2U9ieCqjcTSSG1Q74kengv1LrjTZN2QNlOIDJFTJFokw+kqvRZloOF5lLC6HH0a66gKEVC+QgQ0lXX1Li8uTIXoa/M5hgavGpMn+HpOyLPXbjoWuV4KwhJdzaNQDhVlgQAFTt8DSDmgnn7+eKbZ5UL54DeLOHGo00IzX3+eJWc0kRnPk//mYqtnJVRuT0ObvTs8Q5wdUW7wqNunap8utxkD4QcGBLyy9Q+CqRTn0ScoMkAOxdNxCqb33t3mXUTBjqKmX4hz61mHV8Ck5Sk5qVqEXmnlYZBrwFvMFmQQ5EwNNcw7TLNWF9jMdHdm8t2DylQZ1MVFLSqyuXHmjpkC1J6P+HgLyi+lKLX8Xvz5AwhmK3PWjEvRfHJj2d0OEzaRUnXDRkTIDc9H1/AuIgQ1ZfdCWDTSGBxHL+dB/EiUL2LFzNOfW
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 17:12:31.7861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5d449f-c46d-4a7c-25d3-08dedc4aee88
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFE069F944F

On Fri, Jul 03, 2026 at 05:46:17PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> acpi_device_id that replaces .driver_data by an anonymous union.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Nice clarity improvement.

Reviewed-by: Ian Ray <ian.ray@gehealthcare.com>

> ---
>  drivers/nfc/fdp/i2c.c      | 2 +-
>  drivers/nfc/nxp-nci/i2c.c  | 6 +++---
>  drivers/nfc/pn544/i2c.c    | 2 +-
>  drivers/nfc/st-nci/i2c.c   | 4 ++--
>  drivers/nfc/st-nci/spi.c   | 2 +-
>  drivers/nfc/st21nfca/i2c.c | 2 +-
>  6 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
> index 9d589b388432..47f3838ac9d4 100644
> --- a/drivers/nfc/fdp/i2c.c
> +++ b/drivers/nfc/fdp/i2c.c
> @@ -349,7 +349,7 @@ static void fdp_nci_i2c_remove(struct i2c_client *client)
>  }
> 
>  static const struct acpi_device_id fdp_nci_i2c_acpi_match[] = {
> -       { "INT339A" },
> +       { .id = "INT339A" },
>         {}
>  };
>  MODULE_DEVICE_TABLE(acpi, fdp_nci_i2c_acpi_match);
> diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
> index faebc89a7ef5..39b43f8f3bf0 100644
> --- a/drivers/nfc/nxp-nci/i2c.c
> +++ b/drivers/nfc/nxp-nci/i2c.c
> @@ -362,9 +362,9 @@ MODULE_DEVICE_TABLE(of, of_nxp_nci_i2c_match);
> 
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id acpi_id[] = {
> -       { "NXP1001" },
> -       { "NXP1002" },
> -       { "NXP7471" },
> +       { .id = "NXP1001" },
> +       { .id = "NXP1002" },
> +       { .id = "NXP7471" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(acpi, acpi_id);
> diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
> index 66d070b18b4d..ccca07eb828c 100644
> --- a/drivers/nfc/pn544/i2c.c
> +++ b/drivers/nfc/pn544/i2c.c
> @@ -51,7 +51,7 @@ static const struct i2c_device_id pn544_hci_i2c_id_table[] = {
>  MODULE_DEVICE_TABLE(i2c, pn544_hci_i2c_id_table);
> 
>  static const struct acpi_device_id pn544_hci_i2c_acpi_match[] = {
> -       { "NXP5440" },
> +       { .id = "NXP5440" },
>         {}
>  };
>  MODULE_DEVICE_TABLE(acpi, pn544_hci_i2c_acpi_match);
> diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
> index 4ddf0cc2a259..3906a806ec8b 100644
> --- a/drivers/nfc/st-nci/i2c.c
> +++ b/drivers/nfc/st-nci/i2c.c
> @@ -263,8 +263,8 @@ static const struct i2c_device_id st_nci_i2c_id_table[] = {
>  MODULE_DEVICE_TABLE(i2c, st_nci_i2c_id_table);
> 
>  static const struct acpi_device_id st_nci_i2c_acpi_match[] = {
> -       {"SMO2101"},
> -       {"SMO2102"},
> +       { .id = "SMO2101" },
> +       { .id = "SMO2102" },
>         {}
>  };
>  MODULE_DEVICE_TABLE(acpi, st_nci_i2c_acpi_match);
> diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
> index c94d67f33184..8fc60a972d98 100644
> --- a/drivers/nfc/st-nci/spi.c
> +++ b/drivers/nfc/st-nci/spi.c
> @@ -278,7 +278,7 @@ static struct spi_device_id st_nci_spi_id_table[] = {
>  MODULE_DEVICE_TABLE(spi, st_nci_spi_id_table);
> 
>  static const struct acpi_device_id st_nci_spi_acpi_match[] = {
> -       { "SMO2101" },
> +       { .id = "SMO2101" },
>         {}
>  };
>  MODULE_DEVICE_TABLE(acpi, st_nci_spi_acpi_match);
> diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
> index d6cb74a89f93..e5109f701795 100644
> --- a/drivers/nfc/st21nfca/i2c.c
> +++ b/drivers/nfc/st21nfca/i2c.c
> @@ -578,7 +578,7 @@ static const struct i2c_device_id st21nfca_hci_i2c_id_table[] = {
>  MODULE_DEVICE_TABLE(i2c, st21nfca_hci_i2c_id_table);
> 
>  static const struct acpi_device_id st21nfca_hci_i2c_acpi_match[] = {
> -       { "SMO2100" },
> +       { .id = "SMO2100" },
>         {}
>  };
>  MODULE_DEVICE_TABLE(acpi, st21nfca_hci_i2c_acpi_match);
> --
> 2.55.0.11.g153666a7d9bb
> 
