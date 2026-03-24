Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D473D6479
	for <oe-linux-nfc@lists.linux.dev>; Tue, 24 Mar 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357980; cv=none; b=Dzn15FPSx/DhDS6hoPKiwYmlym3o04nhr30cCXo62ZT2Fyuwb+CDlM4CTD9Zd4hsApzVW99hSl8ZDLuGwPkESO49uwqC4ZGk5z6yuPOqPoZdaX1hJy/2ClEN8LhQbVBm3H6l0qQFLx5XqpWF29Kaa/08IUbVgsNcYr9VJJi0DmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357980; c=relaxed/simple;
	bh=Wv1ee/UdWUibTfcvsLtCfhOHsnrgoqjmx5DCdPOFXKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mqJY7Z2oTaUTr5CMeBgVestaelXy7Mz73NsKajuYfTPCbXtPCn4yto28oWbyBZ+DFsK2YMCwN3zhTZW1k9nZjuecMHB4k2oH5Etr2KEl/wCikOIuRZf5R48VVGR1vem7f6IWbIKJKi8bQU2VVQtyYTQDUaXmPnhogSHzPQWHwVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoLVi22y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RapHDyyg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoLVi22y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RapHDyyg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O8xkLt2322954
	for <oe-linux-nfc@lists.linux.dev>; Tue, 24 Mar 2026 13:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmTdVZdBA+lXMY5CjsSoQzxZqT+oe8b7DJtwkiD+/3o=; b=DoLVi22y7xyAaNOw
	VEmC4YgWZ89U2jWU1jstWFgp6t+dgKIcVRoJ4uww5UbsdiW/Utoxug0gnJfLD5VM
	tJ/YQ9pFIxhUkxL+8TdYY9CfFja4Jw/+FR+cJFb8iZfowegTD9vx9vMIKWWtxQ8l
	9ddkGjs0H8kEfgwl2WRynWTYFrGfmTL/0sCzFTkc2fT0yDmoGK3YGHz6a4Hqusqa
	x6mAFtwbm6J0D7hE2vr334yJWwuRGhmW4BhMVuQIOgTbJWD6+/5vo14CHzWdVqbQ
	J+xU3hsFWu0OlUIcURP52BuUGt0h8wo+FMO2GFBYFN4rJTecB/tEXfpGMW+yAY14
	dp5PDA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkes0d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Tue, 24 Mar 2026 13:12:58 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94ddd9b0f66so603300241.3
        for <oe-linux-nfc@lists.linux.dev>; Tue, 24 Mar 2026 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774357978; x=1774962778; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FmTdVZdBA+lXMY5CjsSoQzxZqT+oe8b7DJtwkiD+/3o=;
        b=RapHDyyg6xohWJk43t+da1qA1NayD3/2rjNyLzZEIKtvf3nOIkSdyjW84UhR+F46Ku
         Y4el6Ov0eowTS1FLurj4zQpRYGxzTNpWxAKbwSneYByUHXZRqWO8GPmamXByV6Bae3pw
         5bGzuIOsA0gBANt2gAmzgrGU9mXnXtzY0/jvqNTvBS0lDxvwVfc8DpSmdoccUuogNYTf
         eIGaPW8goPT7nBQWk7ft4bvkIBoM2wf9VEnINzfQAzPt22Re/ab+2dsQEUoCm8X+KLHM
         ersy8LO/S/wpDA9y+dCBJUhngsbA8yrAf0julzW+dx9wclXimfj/p73+er+HytbdomW6
         TgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357978; x=1774962778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmTdVZdBA+lXMY5CjsSoQzxZqT+oe8b7DJtwkiD+/3o=;
        b=rW3JzgC391HeQi5mxAzF+VRamivWyr08+GZn/qmgwVZwvPEIhbdVGedJYbXE1px0bN
         q9glcV6D7cw9U3LXfcchtKxEaYRXcWpbZq2ujbIIs904kBr97nCrpVo+pAMqQ4TvADCO
         V8MtJ3GxjTn7KVN8HsWGjP5icuxjTTDAsSZux9wY36rx66jsxHiya956XC0AJ/B7thIb
         KZyWrkittOD5J9mFs+aE+oWFCIEKMULG4gyK2lVSesxU00WgWNgT83rjDJyKhKkXvCQK
         K+4tBwEaOBRx/IhDDUtrG0crTnv4c9rMQeFTYcDpdNCpuAfIbMLDhnS/qg9BI2CnMpaG
         Wy8A==
X-Forwarded-Encrypted: i=1; AJvYcCUOhow5jpj0KoaAjOoyhJj7tn7ZRGEBEfR5jOwU0rwTRZ6fVUZNy2xoBgJHIR7Frq7JMd0DJLk6O0crbyU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOcmQcbRdv8bZqYmvHKPJ2dMmzzNUEjWZbjnP+74GefYF65BNo
	UqCK4J4qSKPmkCpElSs/4u3EYqSLbRglD2Ic6Pnl9ChrHmbvjh2FkKde5LNDKTNbz5E5+UlDVbg
	Z8f9cL01wD27wEJA0XIjUGjcaG9sqPdWaWToQ60DiLhJKpDg3rMID0QFo+Vk25YZSIuc=
X-Gm-Gg: ATEYQzxyUXxK9KCA+0U3T0YT3KI/tg3VLhsMPjYR9UQNAKAcY88z5xy1WUNgsNAKBnO
	76j3FrnVG78XGT5Cl5BYG1+oCoO7+oLkeP3kExvSjntDCF0TwkHLMwNlrqpnZz+kSpOx3bt/Wtl
	5NURGpSbPLMhUZJFrJS0o2RFt3Yjsm40WUr0P0wiKgxP70S8IRQOJxp+BZrnWpunr1O2TAdeuEY
	o3Fn3a+LMOfioG/Aa7i6a6DMvxy4fiXHD5XGQcDsq9TB47J5DdNuvTMneJYXcioYESfDmkwRD1x
	gxnaubaE44e2UqycCSauB1Ev8xGdha3oH5b3uvXRFywURNWBCRUB1ihkit62hhn1aQ7/e5ZemRu
	YOcVOhissxFetXMDWE05x/Kw8Y1GXppizggow9R8QHKDP3Gwl8R4+1+LxECI9P0YBguEaYRGBZA
	5VGZ8=
X-Received: by 2002:a05:6122:13c:b0:56d:10ac:2910 with SMTP id 71dfb90a1353d-56d10ac2dcbmr1187699e0c.2.1774357977684;
        Tue, 24 Mar 2026 06:12:57 -0700 (PDT)
X-Received: by 2002:a05:6122:13c:b0:56d:10ac:2910 with SMTP id 71dfb90a1353d-56d10ac2dcbmr1187686e0c.2.1774357977277;
        Tue, 24 Mar 2026 06:12:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8c177sm638398266b.15.2026.03.24.06.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:12:55 -0700 (PDT)
Message-ID: <9d9ec994-c954-445d-97b2-772614d66f35@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 14:12:53 +0100
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz>
 <20260324-oneplus-nfc-v2-2-3eef052c9bc6@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-oneplus-nfc-v2-2-3eef052c9bc6@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A1TJ3BHGB4_GFYCccfg2-gEwoqSjMth7
X-Proofpoint-ORIG-GUID: A1TJ3BHGB4_GFYCccfg2-gEwoqSjMth7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNCBTYWx0ZWRfX6frmqX2/Qvc0
 dSS3+QrhuuBZDtImShWrTnnf4hgcE91wmhLGkqNy2s+z4PxfKJ88ISHuK23f6KNeqMbq+oCvF8Y
 IizlH72Ow97YPWJe0KPW+UCV62v4iY849QcprTj4K3TOz371GNlYE0g6HhjKZ173QtLAzW7ttK6
 c/I9vOdtagzZrUCLgfb+OIDqCK8Z7HkJKDExtFsAWtu3TxicvrZUmq5bVrSZ4D7L96TVGgwDUCA
 gOu6k4n+g4lqpkrqtWsamGKpdyxikwYqOZGLq5hRtCpPHqREx0ghFpEUM/Cu2dn3fqQ0RdMpUYm
 mJ7Io0ne05/swUeutFvyiW51EspVflVGmqgT081OyUX810Uq7QfDq8sBvK3E0e2UqRYS20hra+x
 bm9j2S4IdQ7Ud0rJl7brwbG9ueDpf6hpjvKaAb4iYflPC+ip5DmbHyhPA9FqsEKg/bS+Of/p4tv
 CTcYmC1il5a0nG3pzTw==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c28dda cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=IHWTUvJBEwR_a5bXKskA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240104

On 3/24/26 12:20 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Definition of the NFC.

"meh" commit message

[...]

> +	nfc_enable_default: nfc-enable-default-state {
> +		pins = "gpio12", "gpio62";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;

Are you sure about pulling up an active-high pin?

FWIW TLMM subnodes are best sorted by pin index (although the file
currently doesn't really do that) as per dts coding style

Konrad
