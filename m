Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0259336402D
	for <oe-linux-nfc@lists.linux.dev>; Mon,  3 Aug 2026 12:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758838; cv=fail; b=AFzaFjPnATfeCOhQKX3uSrUrT5ykEnXlurWKGWl3194cXHOzM2g4wGmbeglvowjB7xt9qNddEu+38LYapYDBJaYLHkkb13K2MUXqMpA0z+U817oR5HLai6ZjpeXERL3YD7LYurg2l/TqQKS/qsojmLhGvM4WKarnAjgNEjLDCkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758838; c=relaxed/simple;
	bh=G5ia+R9RQrvH3t4Qln6SsZeuUZsWaSkkM/jyEOGOVuw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BCp0Lc8PMIjx8+g6MXQD25LGGY4aP95zNCFgHp90EIGCLWJ+tS6khP+qKn0T/BdzvXx4XvLj0vspTvyrxode8MEXge6LxFgOzgw5tMn0/QqqDjPDHRJbLUQwcVrd70Gl01UhcUckFzCACwadtmrQFUpiRurmFN+n2WqO24Ezyus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fAK7hjxS; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAK7hjxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785758836; x=1817294836;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G5ia+R9RQrvH3t4Qln6SsZeuUZsWaSkkM/jyEOGOVuw=;
  b=fAK7hjxSL2/6XsKh/gNgSqmUcc8zHdDgn7mLswik2AxqFSIX4bQh1C7E
   oejhpjJmSsOUYPEr11XIg/xElstpx7j13t52/sNcUHGINmlBDkvMADwSA
   nRzgHlVyBJ7edV2tRS9ir0azD1EL5GHsQ7BYWhDX7Vk1WzA/HU/PDiBLb
   S1p35xL/2AF4g/muEpaPqW83G35me3qX2slJERXcHr7OpYa/mfy0DdSy6
   LLKVseB7Ik6F/PsDK75u0gt/eG8L4+y0hMoU491zV+OF2IhjXInnj1ghQ
   RcifMtA040Tao9xjN7z3i0pwkV+Tk9Yx1/H/mWFLEXUKdlJDmuzoxbzdT
   w==;
X-CSE-ConnectionGUID: ph2VeIsjS0Gsz3cFlXdEpg==
X-CSE-MsgGUID: jhws0DSIRqeIJ5xB6sKKBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="85419981"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="85419981"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 05:07:13 -0700
X-CSE-ConnectionGUID: hS0wvoZhTx234WiNiVZYFg==
X-CSE-MsgGUID: ilmsOGi4RgepafVFx+OOew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="284585290"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 05:06:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 05:06:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 05:06:51 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 05:06:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5z3oTi9h7sbnuFGmb97iPKHWCkPGVh3ZyQCv8V0jtRxFAtqB9s98as/LIXxeHswB0Ucd+P3fNcyfLiwTJI+EZwf+M30PZ6TkwqbIuLepIOOGvmgKxmqOkb0oleqo91vSYOB6YcjlMcnWOrJESKdQZ72THwR0+xDucSzxA6fwY5f6ZqwwN8G+Mzd/Xz8DQTdgJA1zdQ9K8uSp0pgQeEH3waiZ2s5FOneEQDFF3+5QfJA/hZtq9bht3x72gWnxhdo096IehSV3vJCdiaXJS9cZGvHA+cciAVkfb4P2hOqpgvQ6qR5KA0cO1wN9olQRj6AmIpacNsrgKOmhlYPP82v9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTxnNRBlrl4InLtJwXS7Ekl9CS97uQsBx6sdVVUKU+g=;
 b=YKsj8dH8H5q3AJ6h7siSHFXa3Hzer5TtX4/ARdZ8aeqKuJiCPeOiTpQ7Q4IE5fNhDJSCA4iGvAjphh9JH2pP0KwhUv6ml5Rh0DVpW260Yv+yMPg07Ql5mqVBTyaQ+Z9KCY1F2l7u+iAv1XK+90OSkjMmjvS5PHCHUhF6zNelLroJk9a0gbmVqW4kligIqpEnS9e8M4jaL6le7L0iCFj+2XnFdosulI2tFFzcNmheDlhLmVa6CMdNl+a813u+gOKzUmRb/ZWtOWeJwKSljFk2LMSHHllpZrzFgqfZoPho2aBGjdWTkS2J1a/P7z2QYqJc9lxuzM+B90/RkQ5WzfEJGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 12:06:48 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 12:06:47 +0000
Message-ID: <34ceb4bb-f076-4f32-812b-917fc3dbd0b5@intel.com>
Date: Mon, 3 Aug 2026 14:08:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nfc: st95hf: switch to using sleeping variants of
 gpiod API
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, David Heidelberg
	<david@ixit.cz>
CC: <oe-linux-nfc@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>
References: <amPsnh9wDIG2CeSi@google.com>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <amPsnh9wDIG2CeSi@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL0P290CA0009.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::6)
 To CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|SJ0PR11MB5039:EE_
X-MS-Office365-Filtering-Correlation-Id: 977489c0-a13b-48c1-88d4-08def157b10b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|3023799007|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: uqpJixPr2AvQo2zKrbLL1jzmKYeC3f8/NiceQG75fFYMVsT62naY6KAv5gvwUlpPF7bUur4S4hGlGxOCgl/Y1TZ4Jbm62BbgqNxBQy5UC2XbJD6h2BvZOzOfTkNgHBdACG8/1Td5AE1LNJu1cJeiRce7UrRweCwqiWwp3qeFoQT0T85bXbcnZ9TVuOOJBNAbVV9eovCBmbrlLnF20nk+OOGBYo+Igxr930q5dwWHtfEX11fzmmjqxHzOSAn4+LftHiPT76OqoHEZSmDxyvmLRP8YPhM992zdoMHpyLyQBLvtcEUgQmNA8/pC/Ti/f2/IjV/US+xai/yuaAMxYzuj8n0FHtl/VvSYvVN+9SL7KyMvR4jyTMftvsysk4AUJdCrK2c7SRPYGcIvmYBT9kTq4X5uZA+/9qSmh35gyVl1j12zmycd22LfvT61pR3goxW6+z3KA0ih51EkE9qLoRaPu9cbozUaf1hjpeeeBLMi19Cw4T/ELEGfYybGdGdLwYDnabsBs6xfRjDVwrZgrrVcqY8pHRS0UyMoZlq8zfvHiUsVc5WqWDus5r0oKdZfDhRaubzVnUmY/f6jThvjSqKg7J8P8pAl6Vx3VtZWdacfYPCKVLolOZEvcVXIHWYyBDGjaOIDlPiWjNVadI/9kqjDCzCPWvrbZaEB1SDz7qAVY9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(3023799007)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGlWKzRYWExTYUNmdkd5RkVScUcrOHZzai9Pdm9oUDczODBWZmFlbGdmcERr?=
 =?utf-8?B?cXZFeVRHb2V1aUVia1BaOW1HZGlObDkrTXloeWpKditPWjYrL21QdEdyUkZB?=
 =?utf-8?B?MTVLQW1WdDRUYmxQaHZhNWx1eXFpVEkzSEt2Rmp2S0hheDVvWTZmQ1VhUWFD?=
 =?utf-8?B?N1FlaDhvL29sdlB5czZEcVpCdWhTNk5mMFNHWVJMQ091RmIwMjUyZ0NiZEpV?=
 =?utf-8?B?d0ZkdUlGRDhwVFF1Rit0MVAvT0VBYTZSTGpQbVAwb3VabFE3OE00M2xxVUFT?=
 =?utf-8?B?ZFlDRGxEUzRjZEZBRnVUNWpWWlVoMzFMNUVWYW9SeDdyRC85UFpTQkJTSTJy?=
 =?utf-8?B?ZnA3ckpNQkFhZGl6VWxCL0gvTzBtNFExa09VNDFoa1p0TTMzNnloU25pcGdB?=
 =?utf-8?B?RjlRdzJpcTFJVHd6MzJBTnB4MEJoMTZNVUg0ZkNHYU50NEZTSTFMbmVtZlBH?=
 =?utf-8?B?UXVSaEhtRlFXQjdYL2c1TVlGWmdIL0tDT1RWeHJONHYySExqQ1lkT05nWUFj?=
 =?utf-8?B?aUpRVlRpcW1aUXNCR0VoVys0VVdmTldFTXoyYS9EcFJKaWowQjd6a1VPVGZw?=
 =?utf-8?B?bjRVSEYvb3p0L0FsMzZBUTR1N1NPcHU4N0sxb2NpdkNhQkhpanFPRlNHZzBp?=
 =?utf-8?B?VHlCNmVoM0hOSTFZTkJnS01uNEp6MXdxcGpsN0E5K3BZcW42WklEd0dhTkNo?=
 =?utf-8?B?dC9CMWpvWnJLQjN6NStQbERkTExWOW54Q2gzalA2U3paQ2NEZFVtbC9PZEdG?=
 =?utf-8?B?OGV3S1NjNFBMVC9md0U1V3lTMGJtQUFIVE4reWdMcWYzaVJtY2JSRThrMm9k?=
 =?utf-8?B?RzNNNnR6TW81VHpIKzBVekhhZW50WUZEa3YxandvMGxkKy9kVUZmM1NXdVBj?=
 =?utf-8?B?MnZITDBWMWc5K0J2R0NDMjNjZ1JLOG1jOTBCS055UVFuY0U1WTg0Qi8vNWNS?=
 =?utf-8?B?S2gyWTJDakFsWU9DOExrNDZwdkx3WkI1VHo1OW5JTE10dW1MeHlWdHdkZGdR?=
 =?utf-8?B?NEl5UE91aDAwdEh5VnlrTXFxeVY0cjlZYzhXVXJKc2NYTHd1VVFqb2dQekxs?=
 =?utf-8?B?TlNFT3N2WG9xVUJYZUN0ZGUvMWgxaHM2WXBvbjR1TG9Dc1MvMnFpOFdxbXgy?=
 =?utf-8?B?U1BnSDlnR0dNc1BHZitYYVVmQlhtUms1djU4OFN5bjA4YmorVFNBb3Z1ZVlh?=
 =?utf-8?B?d1hweG1ZY09GWlVmQWllcFZqWXVWL2V1WFhVek5xS1VwVHFYcjNJbWF3RUhi?=
 =?utf-8?B?UW1YYVF3Yjh0WnhheFp5czh4dzZBRENLSXV3dENIbStyZ1JvZVJOZFFyVmhB?=
 =?utf-8?B?OUZiODNGQVhZeWY3Qk1HVEFqWnc4N3JZazZTdVI5SWNJaURkbHN4R3NzalhF?=
 =?utf-8?B?dGtiRVBHTFkwTWNHQk1tQzduWDZHMWxQSzdzV3pKMDRnOW9GWXV0bEx4ZW1q?=
 =?utf-8?B?c2pXU3VYbFAvRUJsTURHdEQrNmM0SHhyemVQRld6d3hhcGhmaDdaTFVmQzJO?=
 =?utf-8?B?ODIrRjB5c2xNVmIxbEdYaTZXSnQ2Um9PUGk4cEptYjZoNmExc3Bzem9YSHQy?=
 =?utf-8?B?NHltSXFUUGVJeFVSbERCdDJValk2eHMwNDlCblF2cm11bUlXMzkxTkxVdVZ4?=
 =?utf-8?B?OEU1OGI3QnJQV1p3dkE5cDQ1emRKcnFmNmhqM1lTOTZWTjN0emtLNU1ZdWpv?=
 =?utf-8?B?dW1wM0U1Q1BNT0xWRVk3Y0pWSTRyYU5qajM0S1JRUWhramorSm9lVVF4cFNU?=
 =?utf-8?B?dHRaY3JEWVlnTUpDR1p5MHJpYkFXbmgyV0xWbG5jWktaSDc1TGh6N0FIVlo4?=
 =?utf-8?B?QUtFVlJzYVRDNjAwa0MxRHB3ZDBOa1hxbFVESnZ6YkxnVi82YzRZYWNPcyto?=
 =?utf-8?B?b3FqaU1JRlBJdkRuQWFRTG8wcDZUTmRieDNicnAwbkhTU2pWMUJ0QTRmSFhz?=
 =?utf-8?B?ZE54VVBPdjJBUXdiNDN4UTJDc29QWmNtM3AreVhmWFpKVGcrYUVyUFB3S3M3?=
 =?utf-8?B?Um5hdEhXTnNpRXVNbm9TdkZVNjVTN1d6NWNzRktjeFlFR29CUjdRY1N4cm45?=
 =?utf-8?B?M0M1Q0VFbHpUcU9Ea1ZMcERJSHF3cmFsODNGdFFKUUplTjMrSEh6ZnpaK2ti?=
 =?utf-8?B?QUhkV1ZMVC8xVnJzK1EzMGd3WUdENk5UNHVpci9sN0dXTXo5MzIyNFRqRkZn?=
 =?utf-8?B?VWFBZEtyZGdWVGloK3hyVS90MXRaeWdiNjRUSjhGUUZXUHB2eHc3UnI1Z0hi?=
 =?utf-8?B?UlAwNnplK2xCZm5pQWVyNzVDV3hRcHBkYmI0TlUzT3M2TjBQbGxqd2RTeG9Y?=
 =?utf-8?B?R0pMMlQxSERGUU0rQXBiNWRVZDdZNGxPVFpxbVhVOFRrSGVObE9XRDJrcnNj?=
 =?utf-8?Q?9YzccBRc7k74aJig=3D?=
X-Exchange-RoutingPolicyChecked: IXIQQqdRX5Q0rbSpS4ySSHOGyD5hyvlPA/3tY/HOORJTzVZd9SFhYKtNG4ijbQgWl4IMSWZKxgmMIm4XtqNunWtykOJx4AD9+BpbjhaIXJ9t5Q36IhB1JTkCoqK82Sy2YvMTiP1kHHHSbkAybHNKwTaETQyRdbR5u1VteN8+JVWjTT6ne++0HKjXfb+g/4Ybpr061wXxr1ocoSYh1GK4yDu/IcqVhw7dIxjejVsCq09lOLX1lhex9ngqRoEbKkqflhuGp26NBuRJyDY2IOnPKGS21+YOe/477M7i+cMu2TR4wGoampqP3u6ceB5omy8YT2dIRSlABNsN2DvA7crZEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 977489c0-a13b-48c1-88d4-08def157b10b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 12:06:47.5641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orAoHBO3F39FWjnik5V0+ndhNspZFjjX2HBDm5MHJvLJ3CF/5S1WtoW7xpZhCwiHRXUwUza8OX1oXKr8BVdPUn+j/Kli03CxbgeV7QTbss0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5039
X-OriginatorOrg: intel.com

On 7/25/26 01:00, Dmitry Torokhov wrote:
> The driver does not use gpiod API calls in an atomic context. Switch
> to gpiod_set_value_cansleep() calls to allow using the driver with GPIO
> controllers that might need process context to operate.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>

> ---
> 
> v2: - dropped extra "not" from commit description (Przemek Kitszel)
>      - link to v1: https://lore.kernel.org/r/9b77e25c-8942-42f7-b82e-42b492b437d8@intel.com
> 
> FTR I am not using this driver but I'm helping clean up legacy gpio APIs
> and stumbled on this. Using "cansleep" where we can is simply a good
> practice.
> 
>   drivers/nfc/st95hf/core.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
> index 321fbe8aeca8..4d772a308bff 100644
> --- a/drivers/nfc/st95hf/core.c
> +++ b/drivers/nfc/st95hf/core.c
> @@ -450,19 +450,19 @@ static int st95hf_select_protocol(struct st95hf_context *stcontext, int type)
>   static void st95hf_send_st95enable_negativepulse(struct st95hf_context *st95con)
>   {
>   	/* First make irq_in pin high */
> -	gpiod_set_value(st95con->enable_gpiod, HIGH);
> +	gpiod_set_value_cansleep(st95con->enable_gpiod, HIGH);
>   
>   	/* wait for 1 milisecond */
>   	usleep_range(1000, 2000);
>   
>   	/* Make irq_in pin low */
> -	gpiod_set_value(st95con->enable_gpiod, LOW);
> +	gpiod_set_value_cansleep(st95con->enable_gpiod, LOW);
>   
>   	/* wait for minimum interrupt pulse to make st95 active */
>   	usleep_range(1000, 2000);
>   
>   	/* At end make it high */
> -	gpiod_set_value(st95con->enable_gpiod, HIGH);
> +	gpiod_set_value_cansleep(st95con->enable_gpiod, HIGH);
>   }
>   
>   /*

