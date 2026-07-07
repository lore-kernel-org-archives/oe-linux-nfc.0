Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011071.outbound.protection.outlook.com [52.101.57.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FF025A2DD
	for <oe-linux-nfc@lists.linux.dev>; Tue,  7 Jul 2026 17:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444394; cv=fail; b=kxxssugJSSKlcQpWDmwZUF+pBiuvTZHf5szPagPvIsLcbrciOoa4VL8wEZXJYAD1H4q0fJ1OKwZm6m/0sKg4TzMFBCbkdgO7R4sikNdBtszfgI+lG9VYf0ldWFWEcLRZNeq5eHpOcMsT2bhsGXPrelwzX1gC6eJr6r15KcImzKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444394; c=relaxed/simple;
	bh=4U1cM35t6N8R55xReJWaYtdHoTcPrd48+nU3RLcGjiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/4QWYm44tsQTHDBXU3wJndGghCOK98PEjvqXClonYvz5KH8GEaRTbyl9x2HPPAkLS6WdjVCVWvdKRliHDzaqvAn22GmVpIeTL+5xF7oif+FRMJvWwlCU+7t6bJOGzoHVxGdvN+2TQQQITb1v8OpTTlYWHRKIFBjyqeehewFNO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=ix3arFIJ; arc=fail smtp.client-ip=52.101.57.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="ix3arFIJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrHheoOogI1xgw2seA+y5pnol0Akwp9Ta1q2xTxCisAJIH0fs8LeUCop8P360ExawI4FcEdJySp0Po6FvWXcqmA6FwSrfqQ/0ImaRasURewSNTWbuRE1jW8SD9NC58Umu3AOfgb8SEyRanltSF/55OVZ2LMwBUdCeK7LhnSAE3au+JJjMbjmYtNTdD/zVRh2SyPosLsrkk6vhgoqcnAvC2OTcG0sZXRzY7WeBgr7DwE4N5ChJUwLZR+FYi/TubMwD7p8rUMqV0AjfL6x7jFC96nm7TorkwwqTNSPOJ+3+cvvJeMY5P9DpAaW09LHBtrSJnpYpCGG6/PEyJweOy5f2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMt8M6tY+dej2y5q1v8ojbTbK8iDJcfKd3u5E0qbTNo=;
 b=Ubk8AEmpffwWMFdmqP07H5//YwhzoBQY9nf0tszw0q+c+aZ/h1WoFmS5aePSibg4zdE0o8pA2643q4LFuXTdOh9BQREEqv4T5CtroVDWTJh2brBs67MGsqQFtae9elaAWvs7TwLU1ENoaX7Q5FMpjfLvHVjHXZhfrKTP9OSN02f/S0jf+0CyLhxRb2gsT5o+Z7ti+gRSllFIAQ7ZtW048GzhvokE65EoCL1lTANeskIrPBQa03dPgnxcHwZUsH5DRJx0HHzxu7QIkDjCY7NFfp0YNBR4jcbQegrFY8u9Ax1tDyULBSlP0UCdNPns9VGsj4kMYyy7wNHoDhiLyzYdig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMt8M6tY+dej2y5q1v8ojbTbK8iDJcfKd3u5E0qbTNo=;
 b=ix3arFIJKO0WMzG9EPN6R/w+/uhk6uNolmnNaPLwf/VZywTYFSFJAaA2qnGMb9Se71MKnrpRSoBbN09+59IJiUPmqOxK14kDu0oU2a3twELOUtrEnoSgoUv00j14N+OP7hK7+f/2y6/jd/Byr+gbYq/vFoSkytxi/mITu4nRPxzlAgo6GDFgcI3Wj3GDiV83uE5umex/M+bltX/dKjZNDDhZ0w2g2IUKMB8oHtyK1IG3DwsIlfp1SM90czYBlVThikeYcxP2ImnE6wVIMPhJCLBhi1+BBW8ZY7MzmCkBVKaFwy1R7dINIvSOxpocLEkFLdkJTJlklp7pfq6prDde7w==
Received: from BN9PR03CA0904.namprd03.prod.outlook.com (2603:10b6:408:107::9)
 by CH3PR22MB4372.namprd22.prod.outlook.com (2603:10b6:610:179::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 17:13:06 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::3d) by BN9PR03CA0904.outlook.office365.com
 (2603:10b6:408:107::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 17:13:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 17:13:05 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 3E2811290D;
	Tue,  7 Jul 2026 20:13:02 +0300 (EEST)
Date: Tue, 7 Jul 2026 20:13:02 +0300
From: Ian Ray <ian.ray@gehealthcare.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: David Heidelberg <david@ixit.cz>, Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Greer <mgreer@animalcreek.com>, Carl Lee <carl.lee@amd.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Kees Cook <kees@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Tomasz Unger <tomasz.unger@yahoo.pl>, oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v1 08/12] nfc: Unify style of of_device_id arrays
Message-ID: <ak0znruBO6M7Ough@zeus>
References: <cover.1783091699.git.u.kleine-koenig@baylibre.com>
 <583375dcd834f5edf6241b09cdd75ad4f32af668.1783091699.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <583375dcd834f5edf6241b09cdd75ad4f32af668.1783091699.git.u.kleine-koenig@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|CH3PR22MB4372:EE_
X-MS-Office365-Filtering-Correlation-Id: f19e3fb3-4bcc-453b-21f8-08dedc4b0262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|30052699003|376014|36860700016|18002099003|22082099003|4143699003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	bb0k4wJm+v26Xxwea5+6KUO0G+QHJtUaCBjzAGKtYZnedHrA7GNN75JhaFOVRYgGStpAhk4YrQp53QnBnGfZH5rjC7NbIWE+E+65rKMcNebgQJq6U64E0oUvcZJAoFGGlZFVuGmiCK1r5Q9brJXnH75o/Eg+G7B93INkIavYWqG/KKhWgld/tkrhzDN63kbgAuXsp0VXLLdCxNPDEh0QCMvv64cHSLLXmfgG6kiL3Oaak9iX4NhkgPmODIt+Q9p0ZcgMdlok5PQ90tcn4tn71xDbsJIJBXsWJSQSXhkoATVabK1xUeIRlRmKc+MoxRBlsstpXQsLB536W0o9xa7Tl5fozSRsZvB5lfgcBqzto8/ilIdiBoJfNJYR6AR2GbSmoRlu2ZbZpK+vJ8LrzW8tOkaL2IfcthEH4Tc4/sMRVP8qahmv2QVP9P6kWhnhTUfWYYQ1LdIYpRiqaVEIvqwTjQQcQzE0dmjVaDukiylnlAHs7tcAlJc3LjMKui1sNyR8E54WRptA/uJ7BtpSjNHDRBqSR6FvKsjSANg5LEkM2iBVcJ6/yUYn59KQ0DERlPhcWmC9sgV2d7yF2v6u0qU0cnxAo7NOtbqdIwTsgNxuxsi6Pw0F/p2L1z7P/Iuiecgo4Uy42oATxEMhjKmuAg+HrLDpOFBAx5qSIH94cJz11fGbr7wDT+0eY+vn2YE8VRdiulgXbkLvIdbujPXJCAe1Fg==
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(30052699003)(376014)(36860700016)(18002099003)(22082099003)(4143699003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yKk7FQ93pVb8weKMHTazTMvVQ5WLPZRIuVYmiG3KO5lzIcP2Tt9xLlAQXYe1xl9xv1Wb16iEFIuwRX7grN4RwOspRvnop/HvCn8Kf9bW0/nZYRDRUuek7QXoLnz1fPy8EEjUvpfMydBJLVPRwqJYiAT+Qekp9FVvBJPkVWfxhAkHd4IhRmIcDuoBHFCd4RkbnW0yFIJ06C5o7bJIkrtjMjPAbp+n2oI73yCbl6zrdvkWHnOKKkO1rDrRtKPHlyW7JQ6nRa5b+DGg88scYqBQ1//JJ+MlLGcwGOY/iBzUzrFemcSbmW8Xx5hzl+avAIag7osMC1F1AgqQC9e/97zR8JajO3SJe2my0Pap58+/WOGixbihvb6d+QDYVjNT40Bm93x7R6yBUvfmwqOB+jGHpYswUMEqf+WblD5VaQSaEHgoCNYBHVdBcKyvGy+TscKO
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 17:13:05.2268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f19e3fb3-4bcc-453b-21f8-08dedc4b0262
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR22MB4372

On Fri, Jul 03, 2026 at 05:46:22PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The most common style treewide is:
> 
>  - A single space in the list terminator and no trailing ,
>  - No comma after a named initializers iff the closing } is on the same
>    line
> 
> Adapt the of_device_id arrays accordingly.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Ian Ray <ian.ray@gehealthcare.com>

> ---
>  drivers/nfc/nfcmrvl/i2c.c  | 4 ++--
>  drivers/nfc/nfcmrvl/spi.c  | 4 ++--
>  drivers/nfc/nxp-nci/i2c.c  | 4 ++--
>  drivers/nfc/pn533/i2c.c    | 8 ++++----
>  drivers/nfc/pn533/uart.c   | 4 ++--
>  drivers/nfc/pn544/i2c.c    | 4 ++--
>  drivers/nfc/s3fwrn5/i2c.c  | 4 ++--
>  drivers/nfc/s3fwrn5/uart.c | 4 ++--
>  drivers/nfc/st-nci/i2c.c   | 8 ++++----
>  drivers/nfc/st-nci/spi.c   | 4 ++--
>  drivers/nfc/st21nfca/i2c.c | 6 +++---
>  drivers/nfc/st95hf/core.c  | 2 +-
>  drivers/nfc/trf7970a.c     | 5 ++---
>  13 files changed, 30 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
> index 687d2979b881..068c5d278a35 100644
> --- a/drivers/nfc/nfcmrvl/i2c.c
> +++ b/drivers/nfc/nfcmrvl/i2c.c
> @@ -246,8 +246,8 @@ static void nfcmrvl_i2c_remove(struct i2c_client *client)
> 
> 
>  static const struct of_device_id of_nfcmrvl_i2c_match[] = {
> -       { .compatible = "marvell,nfc-i2c", },
> -       {},
> +       { .compatible = "marvell,nfc-i2c" },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(of, of_nfcmrvl_i2c_match);
> 
> diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
> index 8dd71fed8493..34842ecc4a05 100644
> --- a/drivers/nfc/nfcmrvl/spi.c
> +++ b/drivers/nfc/nfcmrvl/spi.c
> @@ -182,8 +182,8 @@ static void nfcmrvl_spi_remove(struct spi_device *spi)
>  }
> 
>  static const struct of_device_id of_nfcmrvl_spi_match[] = {
> -       { .compatible = "marvell,nfc-spi", },
> -       {},
> +       { .compatible = "marvell,nfc-spi" },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(of, of_nfcmrvl_spi_match);
> 
> diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
> index 39b43f8f3bf0..d424452934ec 100644
> --- a/drivers/nfc/nxp-nci/i2c.c
> +++ b/drivers/nfc/nxp-nci/i2c.c
> @@ -355,8 +355,8 @@ static const struct i2c_device_id nxp_nci_i2c_id_table[] = {
>  MODULE_DEVICE_TABLE(i2c, nxp_nci_i2c_id_table);
> 
>  static const struct of_device_id of_nxp_nci_i2c_match[] = {
> -       { .compatible = "nxp,nxp-nci-i2c", },
> -       {}
> +       { .compatible = "nxp,nxp-nci-i2c" },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(of, of_nxp_nci_i2c_match);
> 
> diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
> index 2128083f0297..66d201c14a40 100644
> --- a/drivers/nfc/pn533/i2c.c
> +++ b/drivers/nfc/pn533/i2c.c
> @@ -237,14 +237,14 @@ static void pn533_i2c_remove(struct i2c_client *client)
>  }
> 
>  static const struct of_device_id of_pn533_i2c_match[] = {
> -       { .compatible = "nxp,pn532", },
> +       { .compatible = "nxp,pn532" },
>         /*
>          * NOTE: The use of the compatibles with the trailing "...-i2c" is
>          * deprecated and will be removed.
>          */
> -       { .compatible = "nxp,pn533-i2c", },
> -       { .compatible = "nxp,pn532-i2c", },
> -       {},
> +       { .compatible = "nxp,pn533-i2c" },
> +       { .compatible = "nxp,pn532-i2c" },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(of, of_pn533_i2c_match);
> 
> diff --git a/drivers/nfc/pn533/uart.c b/drivers/nfc/pn533/uart.c
> index e0d67cd2ac9b..83c1ccda0af6 100644
> --- a/drivers/nfc/pn533/uart.c
> +++ b/drivers/nfc/pn533/uart.c
> @@ -238,8 +238,8 @@ static const struct serdev_device_ops pn532_serdev_ops = {
>  };
> 
>  static const struct of_device_id pn532_uart_of_match[] = {
> -       { .compatible = "nxp,pn532", },
> -       {},
> +       { .compatible = "nxp,pn532" },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(of, pn532_uart_of_match);
> 
> diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
> index 50907a1974cd..7fde3aefae70 100644
> --- a/drivers/nfc/pn544/i2c.c
> +++ b/drivers/nfc/pn544/i2c.c
> @@ -938,8 +938,8 @@ static void pn544_hci_i2c_remove(struct i2c_client *client)
>  }
> 
>  static const struct of_device_id of_pn544_i2c_match[] = {
> -       { .compatible = "nxp,pn544-i2c", },
> -       {},
> +       { .compatible = "nxp,pn544-i2c" },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(of, of_pn544_i2c_match);
> 
> diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
> index 499301a6fa3f..4ba762611711 100644
> --- a/drivers/nfc/s3fwrn5/i2c.c
> +++ b/drivers/nfc/s3fwrn5/i2c.c
> @@ -211,8 +211,8 @@ static const struct i2c_device_id s3fwrn5_i2c_id_table[] = {
>  MODULE_DEVICE_TABLE(i2c, s3fwrn5_i2c_id_table);
> 
>  static const struct of_device_id of_s3fwrn5_i2c_match[] = {
> -       { .compatible = "samsung,s3fwrn5-i2c", },
> -       {}
> +       { .compatible = "samsung,s3fwrn5-i2c" },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(of, of_s3fwrn5_i2c_match);
> 
> diff --git a/drivers/nfc/s3fwrn5/uart.c b/drivers/nfc/s3fwrn5/uart.c
> index e17c599a2da5..8f142a255101 100644
> --- a/drivers/nfc/s3fwrn5/uart.c
> +++ b/drivers/nfc/s3fwrn5/uart.c
> @@ -85,8 +85,8 @@ static const struct serdev_device_ops s3fwrn82_serdev_ops = {
>  };
> 
>  static const struct of_device_id s3fwrn82_uart_of_match[] = {
> -       { .compatible = "samsung,s3fwrn82", },
> -       {},
> +       { .compatible = "samsung,s3fwrn82" },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(of, s3fwrn82_uart_of_match);
> 
> diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
> index ceb7d7450e47..152c20b6bb01 100644
> --- a/drivers/nfc/st-nci/i2c.c
> +++ b/drivers/nfc/st-nci/i2c.c
> @@ -270,10 +270,10 @@ static const struct acpi_device_id st_nci_i2c_acpi_match[] = {
>  MODULE_DEVICE_TABLE(acpi, st_nci_i2c_acpi_match);
> 
>  static const struct of_device_id of_st_nci_i2c_match[] = {
> -       { .compatible = "st,st21nfcb-i2c", },
> -       { .compatible = "st,st21nfcb_i2c", },
> -       { .compatible = "st,st21nfcc-i2c", },
> -       {}
> +       { .compatible = "st,st21nfcb-i2c" },
> +       { .compatible = "st,st21nfcb_i2c" },
> +       { .compatible = "st,st21nfcc-i2c" },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(of, of_st_nci_i2c_match);
> 
> diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
> index 8632cc0cb305..5e0b94050f90 100644
> --- a/drivers/nfc/st-nci/spi.c
> +++ b/drivers/nfc/st-nci/spi.c
> @@ -284,8 +284,8 @@ static const struct acpi_device_id st_nci_spi_acpi_match[] = {
>  MODULE_DEVICE_TABLE(acpi, st_nci_spi_acpi_match);
> 
>  static const struct of_device_id of_st_nci_spi_match[] = {
> -       { .compatible = "st,st21nfcb-spi", },
> -       {}
> +       { .compatible = "st,st21nfcb-spi" },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(of, of_st_nci_spi_match);
> 
> diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
> index 4e70f591af55..a4c93ff7c5b0 100644
> --- a/drivers/nfc/st21nfca/i2c.c
> +++ b/drivers/nfc/st21nfca/i2c.c
> @@ -584,9 +584,9 @@ static const struct acpi_device_id st21nfca_hci_i2c_acpi_match[] = {
>  MODULE_DEVICE_TABLE(acpi, st21nfca_hci_i2c_acpi_match);
> 
>  static const struct of_device_id of_st21nfca_i2c_match[] = {
> -       { .compatible = "st,st21nfca-i2c", },
> -       { .compatible = "st,st21nfca_i2c", },
> -       {}
> +       { .compatible = "st,st21nfca-i2c" },
> +       { .compatible = "st,st21nfca_i2c" },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(of, of_st21nfca_i2c_match);
> 
> diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
> index 1ecd47c6518e..265ab10bbb61 100644
> --- a/drivers/nfc/st95hf/core.c
> +++ b/drivers/nfc/st95hf/core.c
> @@ -1056,7 +1056,7 @@ MODULE_DEVICE_TABLE(spi, st95hf_id);
> 
>  static const struct of_device_id st95hf_spi_of_match[] = {
>         { .compatible = "st,st95hf" },
> -       {},
> +       { }
>  };
>  MODULE_DEVICE_TABLE(of, st95hf_spi_of_match);
> 
> diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
> index bc01b46f461c..3802081fb8ee 100644
> --- a/drivers/nfc/trf7970a.c
> +++ b/drivers/nfc/trf7970a.c
> @@ -2304,10 +2304,9 @@ static const struct dev_pm_ops trf7970a_pm_ops = {
>  };
> 
>  static const struct of_device_id trf7970a_of_match[] = {
> -       {.compatible = "ti,trf7970a",},
> -       {},
> +       { .compatible = "ti,trf7970a" },
> +       { }
>  };
> -
>  MODULE_DEVICE_TABLE(of, trf7970a_of_match);
> 
>  static const struct spi_device_id trf7970a_id_table[] = {
> --
> 2.55.0.11.g153666a7d9bb
> 
