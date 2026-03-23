Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05E3395253
	for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Mar 2026 11:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265724; cv=none; b=ftvwRancA1gj0Jgil9MyTYNGWZ/J5Embtz3/GAN91vZHfjRhhPIb7pXLhbbZM6arUQhbRPPkAIjM1C6jK+kGlNsu3mztdSp1lWU3DbSgagpgtbB85aHScsEsvFXuDcUpF21AxPhqswaNPWyEBlAoxeRaZ4YNpY8H10YrI9ZcggE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265724; c=relaxed/simple;
	bh=xDPmlMDXeL3lxfgUwJ6Kd1KI98MjSx2OU5F2knJ/FuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ua7RVq+EoEUx5mfOOg5ob/tEsHfIvYN+0mnf4FAxCQkYdV8Ta+yR6aAutsPoQpog3PNpmAiLY7j80rqUCxbydbg4zhkB+iMO1yRXyk+RB8+RrDa1TqLTiNXERRWT/hVBuswTddSwP1pjHNCpkqvn/iuffd/gWXm6BWFm6ATSE64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7f0gmCt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARS675gm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7f0gmCt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARS675gm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NADwed3539916
	for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Mar 2026 11:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6wS5LtayeZTbWa+/jowDNFAN2aTZHLtBtVNHTSu7Goc=; b=o7f0gmCtH/CDJQer
	Uzu1ls1dWrprV1Eu0TfZoj0LGizNlvHpmGL0pRDGcQwqsNyBYPd9xJ89ATQPBBHJ
	jtu8gKZiU6IPqagOAWGFeoW/wir9KtD4c+pFqm/tm5BRRATdmp/93fkrRo+P96oE
	CyBAGXQ0hvZvMztGGqvEPyuniL1CEItyEnPQ7mlTddDvlcsM6cA5NxeH4ZfYbrf6
	NAVIc/ytCcc/ZyXr1p5o9d3RhrGesFi/DOsG8+WYBeqewTRLccaK1WAhjdSRpmkf
	Oh16AGtTQ1iUI48UuOS0WuUdCseAoYGKcN2pUN4ckpZqmpBSWhf/qzXil/NYdmwn
	1XlOcg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k308xg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Mar 2026 11:35:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093245c2d4so18521321cf.0
        for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Mar 2026 04:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774265721; x=1774870521; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6wS5LtayeZTbWa+/jowDNFAN2aTZHLtBtVNHTSu7Goc=;
        b=ARS675gmUi3TYzvSf6U/UZo98pcBKYfzK2GzPB/TUH9kDYOQJGiFkoJhpvMdCYVJ1e
         ZuvHu3GaIOtEO9ZsOaIFhiYLAcAuyY4PWseZU0aF1LzAlrCjhjfr8ESEn7XKoxibegjP
         d8zCJwXwH42D1vrwd//VzHg9aCEb9/xd4IsgmnbghGxCcNaYJkpEQ3Gc2xXKEDOM9s5L
         arTZ+qQKc1ylQkN8HtzSojrncJ0Obq9uPsSQA1b+PgSQV48v17Z/5eiYuuOyadnXacUt
         iukLnfUUrzgF+ymADwOAvmK+geqqCTJiM044JnICp2WFdxST8hPKt5xgjWQDNISsnEMV
         VdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774265721; x=1774870521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wS5LtayeZTbWa+/jowDNFAN2aTZHLtBtVNHTSu7Goc=;
        b=kQ/uym40pxJqlK130qNbz9Rc8lfmYEGuozD7CpUJpEdEFY5sD1thpKislI9B+SEpvD
         FC0riD9Ne259v1npqddSDL52Qw5zaoLZEkjtoDavIxw+McG5UtUV0hc5w2QpkM739iO0
         Ubmj7n3025DQWT9r3yPwGOxWe1rCI4vlj2sLO+pHxVdkEobi32Ab52F9WRZg0YaPDrsf
         KV2gbIHovSTxWw/r8SDuXqx4HkSMtPI4apxiBdDdhDeqkUHDH+GMIWCtbA7bf8+PK6A6
         nnLAg0yT2e/GseWPO3XEmUr6dEgA/pxQlYqT46yl0Erpb+pjcf5zPd5B22IOxgTbmAqI
         pa1w==
X-Forwarded-Encrypted: i=1; AJvYcCW/LxVPYKMAdMLHzWooIEdOAKZtp/KCI3sGns/sTXnSYA8vNnt1CNheomPKgr0Ii0dRQ3Ot7amF9IgodpQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcAzkwEkQyaxYFCd4X/OLxpyJmaIHPftWsPhPJx10ZnXzCPyvV
	zvdB4shhmhGUPwPy6Bw7kCCsHEXnihBRfITcofjW8SkykiWqAMDBib+DYgZQdOmjrG7LuzY1Ojj
	R2lmi2WMLFLXv5hDJrrd0WTMmw9eKpEZFGXPfbB7V7K2UnmBruDMC7YSY1ziYfCCRsIc=
X-Gm-Gg: ATEYQzyT1ju+prvdXhD+wNa4I3Og0JzuyMkLJ9jDntsKyjYJQ0wCJaAQcZ+4zezKEXp
	fbjipqeuRlheWtw5ABPbguIEXG1xQC57ZXcFPqm1j+YFr3CJH1ZjIirAmH+zHhR6N8BSoz2s18Y
	AMqJ1F+FJyeYsFFImEKNHJjQSZb0qbnMRrX5xJtJEJuX9K0bTNSUsLxDqFbLQmWmwDw0iDLB1aM
	UAuxV39zHJT4r49tqr4iT6uvFolsSehXLbKVMSKqkY+qNDvww/h7tX4mkGw/cLKfvWVKtJMjZbp
	vBqnmsdaZTbjOdER8UNlP2xuxOyVHjFnXD73VmOFd3ghxWWn8WX09vGKBaHLoop5xA47HgsZopT
	nercsf0lzR8FHOFWbzWnodd9dmgu8vDrf6aJgLLzrnNa3Nd0zydI4Xi3C8ON4U8K/bZCYxnK7Ch
	tEhuo=
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a80 with SMTP id d75a77b69052e-50b6b213658mr3775461cf.1.1774265721242;
        Mon, 23 Mar 2026 04:35:21 -0700 (PDT)
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a80 with SMTP id d75a77b69052e-50b6b213658mr3775111cf.1.1774265720584;
        Mon, 23 Mar 2026 04:35:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6694b45de66sm2208073a12.31.2026.03.23.04.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:35:18 -0700 (PDT)
Message-ID: <75c80dae-1ee5-43c3-8d72-bf239fd51fb8@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:35:16 +0100
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH QUESTION 1/2] arm64: dts: qcom: sdm845-oneplus: Enable NFC
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260322-oneplus-nfc-v1-0-5f22f544f0e2@ixit.cz>
 <20260322-oneplus-nfc-v1-1-5f22f544f0e2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260322-oneplus-nfc-v1-1-5f22f544f0e2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c12579 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=o4zcOJKZs6uzFkhwQ20A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4OSBTYWx0ZWRfXyrQ5bh0KfIh7
 i+G1FHhK65oL76z7IusIRMEtcKnPMuZxM9RYH4ovmIA/g6Pz/qc12kD/AEOjSEZ34UhPLdnP1lz
 xX83es980beNXCajT7rZsqj+MCzta6ncJA9pk9o6jtDu2mfWKv14rxT9RIgrwNjGY2Yi1ZtA9lQ
 o/3/Dr8K2fs1oI5TPtjWIR13MibkHpcYbOl9Tc+GShrPfUSJsbaX6lkoqdGg5BWwYOzgArXHO8U
 Lmj95F1Vyaceud2XEhqhPTkD3ceMESLwjE6y9AXKogZlp6WRFr9V9IRPaDim8JD2+hcShscQ/5o
 wsel9lRN0KWnao2dzSsNxt7rTvjS25rNQ4dB6Ow8zWzqYUhxyPWguY/BSIQYGoAqH0by3FpPBvF
 H1GjeJcAtJKtKRBpKdlChPhdzI2tpxW14RJQmdNXXuBoA31quuv4IbCrLFdKzl55vWwxWKv/erG
 2LTAWsAlac9Rbu931kg==
X-Proofpoint-GUID: MWfvYgWpNoGxMmn5lSZOy0kSA068bg0t
X-Proofpoint-ORIG-GUID: MWfvYgWpNoGxMmn5lSZOy0kSA068bg0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230089

On 3/22/26 3:24 PM, David Heidelberg via B4 Relay wrote:
> From: biemster <l.j.beemster@gmail.com>
> 
> Definition of the NFC.
> 
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 5b121ea5520f5..34f476299b114 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -392,6 +392,26 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/sdm845/OnePlus/enchilada/a630_zap.mbn";
>  };
>  
> +&i2c3 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	nfc@28 {
> +		compatible = "nxp,nxp-nci-i2c";
> +		reg = <0x28>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <63 IRQ_TYPE_EDGE_RISING>;

interrupts-extended, please

Konrad

