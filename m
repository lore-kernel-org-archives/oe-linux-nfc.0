Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577203CB911
	for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 08:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787129906; cv=none; b=srNBHo3VBbsfiUAmcnxt+aBiklSGQWvCx8t79Xy575QM9VzkZCrp5Uxbvd3O8r5D/kVP/Sfrtosfb+u4V6py0ZeaJipSezYxyWxkxHlUcXoSyLIDaippbMMF+xx6FLCGp4Wcq5QRMx14lGJdwrmKDlb4XIyLGqagOUjiT9htcRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787129906; c=relaxed/simple;
	bh=xy5f4yB2DW6sWV4q3Tyz6Upe2KQdZq5pgbZ5gJyoZlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JsOrxN+s4yarB2W5RVkqbNG0pUAt+cMb5IOVr6Qd6td9JXJcENzeD4oTVfUBBHO9Odx6uDaxs4GrABA+RRU2TykT/pSgqYWMqTeC03LOgATwfTE1lU5/CLc62ps4exMabUmMQFqg0ITphwKIjrX1rE84uk92GVKgH87Ki25qfmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DDgWCAs1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDj/SNDR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DDgWCAs1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDj/SNDR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZLaV2457014
	for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 08:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgXMRBypRqfhAj6RjPVVVARbvuqQB5nTNT5Y33zDvrU=; b=DDgWCAs1cohMV1jJ
	pwSqRKw5KZm/gUwJoCefJTZDevQ1N5XCRJegEGTlwo9Vd5QIknVO6XZbtyE5k7Tz
	Wo8G9hVoptm2wRqAeX4XWnJ30qsqeU5EAsF8syg38ExzmBTuaddkFLWfZMuINn7c
	iAykdsZSYodye76A+yWPrVtIQHvciknQonhYg22zz3WG+aX46Y1FKTWhq7PdD56T
	Xjw1GzE5aq39A7M61iP1LsoTwslQmB+Rz4rc0RKrXgZqfdQrdnOarehO87whRzJV
	p41BCvHaRlXS9CMgEoy/llo0DWrX+60olp0ITDmK9G+aV5AQpH1t9Q0SScjnMsQp
	ywpTdQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkaata-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 08:58:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9058a836724so3060216d6.2
        for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 01:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787129901; x=1787734701; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgXMRBypRqfhAj6RjPVVVARbvuqQB5nTNT5Y33zDvrU=;
        b=SDj/SNDRmfVq6HFbrYbSkZk9cspY51oJ/mtiF96EjXrBQMhqRyJtddgTVCdflSfMVG
         pPnoeu5lyV0dATB9DaLYgdoQ94Vp83VnDZjNxAFzvjJCnAr7V+13HPvTrm7EEgBQx4/T
         ig/OhQ2dktPc5cmgDckc74xTmRLF5GdfkoaVaivM6A7LFHbwj/oVvsOGW9MYyBymHkBH
         9wThgO3aYjgJRPpF5q/D6AIKrXLqbTSR79JEd/C308uuKu7XfJXrn0GT2+lUuIk7dlV4
         LDGu8c9HUhj6r5KADVPWY4tJaVe21vI6bsuRZaXUaXi170DDmHCbV7ZOsRrjcxGvwUYD
         HNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787129901; x=1787734701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgXMRBypRqfhAj6RjPVVVARbvuqQB5nTNT5Y33zDvrU=;
        b=Lljj9j42wNRsw3z6LCPvSpSO1Gf/FttRDA9OiOSDYfjbCHbdvAo4jEuV7E6qD41i4y
         pvpNcwsY9gn+/1ptI0MPoWW8NiM++QbjZq+w1niAT1LcJNOtaRSW1RCFDgd25dbFLsMc
         mbIX3N1HJMeuaHnXp75oV21QazLxTJg7Vln9k8rEon2a/su7F9i/ry0MCG+AxZDyxIkF
         GHY2m2i8/3vN7xFyFO3UaF8vCyOCm+odLKn6q845HzaLYwkg3GUhVZa7+qRrdEOCfhQD
         7VZk4VkVNox/7cv5Qb9JUjFDoZul9HjIfQlwiCKYx4hs4zJinFu8pizKqkGO4c1G+M09
         DReg==
X-Forwarded-Encrypted: i=1; AHgh+RrHsTf28USFJl6DvxDSfHwyEMMxH7K2YFVmDbH7W8Hzaf2SNZRIcYmW3yjRGKjNKmRQOdAaTD/amCVUNNw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzH/r0MqlFk5iFnlW+qLqMge7WnnAbxaI/gMg+kX1X7I1vGLngD
	H4p/1I4/t9WHciLDn6t2+YQSAnszURAeGZqDySvEYIii1zH7vKuUI8nBKWWeIatClqSEPzB0H57
	PZ+hZGH1eOkG3iJw1q4zjxllD84WF0Oh51VV2jXLA8W1sexL1HTjPpPYOZM/iW03KDM8=
X-Gm-Gg: AR+sD10khTbN4060C+rbzHVHVBQRq7DcYxo9QtX8pPLpgVDK/KYK0tUwk+/8uN/Wfl3
	ndaRvjO3hnb3KjyyeJ+zqOh5JUP1zqHUMogOgRNAn9w3HsHx41wEMT4eFF+2wPZpcBhfNGkvI8I
	KFCmaruAcSaChJcBrhyAS0sj1Hky2q2uFAukzJ/5HhZDLpXU3y+uy3RDHglp6sxOsOsaiEdu+0r
	+Ghe5KVvTp2cjfum9UDiCiXrzOq2WbmEmjZcTfC0dyfgdZqRDOLRc0xkzaeNDZGRALBQAdjZtjx
	yFstP3iafuPAz7g47UPg9xu/ZRUI/YhKj67lcHW4Rqrs18/PytLkTxTk+nmFhtKNeTUDyHS+xnB
	yb9p6CXUOyndglaypYfmeAGtH
X-Received: by 2002:a05:620a:6508:b0:936:5a34:7a6a with SMTP id af79cd13be357-9371e703370mr216687785a.3.1787129900894;
        Wed, 19 Aug 2026 01:58:20 -0700 (PDT)
X-Received: by 2002:a05:620a:6508:b0:936:5a34:7a6a with SMTP id af79cd13be357-9371e703370mr216686285a.3.1787129900331;
        Wed, 19 Aug 2026 01:58:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff16c16bsm634126a12.20.2026.08.19.01.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 01:58:19 -0700 (PDT)
Message-ID: <03ae6ad6-de5d-4f14-904d-bca58c07ee00@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 10:58:17 +0200
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add ST21NFCD
 NFC
To: Kristian Brox <isyourbrainfoss@proton.me>, oe-linux-nfc@lists.linux.dev
Cc: david+nfc@ixit.cz, krzysztof.kozlowski@linaro.org,
        luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
 <20260818205940.1973944-4-isyourbrainfoss@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260818205940.1973944-4-isyourbrainfoss@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a85702d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=wLTDt5XO8WXoAWZpawcA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA2NyBTYWx0ZWRfX03gtoXd4WVn5
 Hx74Hjwm6diNQiIk1EYAC5LFQYOPmqTTJh09MYH5UyCBzF50HGImXZdrx9xC195dFPepdoObYFI
 cwK2ptQJrhYRqBtt8gMNilbgvwQC3I8LDYFUpFhZiE3rh31xhLKqMXvy4QrdFS17aT4zJSGFPQq
 6nXEfHCDe0KcMWpTgTkPDYCDhXomW6mf4B4mWR3FOA18ashzaGniMeFYo/Ki/ndIihF1PVII38G
 HSC7XQuVfTsg27pz3lDUeJIDLN9CFLrnlgAg1leUjL7BSO+x7QA8OYYDk26KWQkR6wC3qmp/tBx
 ledmfmlMNgQUCpbAF5COMg3X8XXd++Xa1Dc3wHoigA8LX3FFgu90JDbhUKithoeO82vqFdN1MRz
 AaJvxpHJ4udD87NM+pWH9E4iscjSvk2AmVa3a/qj6GCj5GFMnbt0h/qMoExoZNdPtWyVRwnLntf
 /r24Cv0Y6DH0xYXVeUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA2NyBTYWx0ZWRfX12XCxLxzT5VF
 dBSJyQQyxHLhJQKoUtJmMsjT8FGZyWw7iyOwKDkGzPLp6uhB6u+EsXq1nQqeRcx6YdRzTG+0UkS
 PX0xCrVtzH1TXNdfhxDJDzUeJ9oRp8s=
X-Proofpoint-GUID: zKhiaPJe4Ud0mjrASxEo85FT34mAz42b
X-Proofpoint-ORIG-GUID: zKhiaPJe4Ud0mjrASxEo85FT34mAz42b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190067

On 8/18/26 11:00 PM, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-high. Compatible is st,st21nfcd-i2c (raw NCI). ese-present and
> uicc-present are unset; those links are unproven on this board.
> 
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index d48cf38b7..a485edd24 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -1006,7 +1006,14 @@ redriver_ss_in: endpoint {
>  &i2c9 {
>  	status = "okay";
>  
> -	/* ST21NFC NFC @ 28 */
> +	nfc@8 {
> +		compatible = "st,st21nfcd-i2c";
> +		reg = <0x08>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;

interrupts-extended = <&tlmm 41 IRQ..>

> +		reset-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;

You should also add a pinctrl entry for both these pins, to make
sure the appropriate bias/pull settings are applied

Konrad
