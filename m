Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D343CE492
	for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Mar 2026 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437653; cv=none; b=PsV4ovWA4RqjTNS9xl3BI0aHIf5AIPODooAoL/J0+OkVEywYv3wlknsH05SRfTpw9HgTlFoOQxjzlrBiN4FUMALc/JlK5so2zSbOMModnWnT8OP+8kdi/pGIthFVLDhsja0YDeuwRb1K+I6G9WZaXnonKXUyWHSDQsoHrMYf2C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437653; c=relaxed/simple;
	bh=MqqPvaCpMUSdpy8bJlGFo4cZtQj3//vtqXYIJw14Cu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2jFMHMkjJ77Fp/RErHoKBnsIPDkV4AmF2/uN/XOzfJu21GZPrGogb1cmBtjRbvY8zXX+MymiNxoLtcF38woe/U+gusl6Rm66kj3yd2jQ1V8Ck8iTS5Y4ci3Ctf955Ny1JZnamHvdpSZcxUYslBER+AVrZO9XCHBg+qFh90WMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NuHgc/e0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vv+WFG6D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NuHgc/e0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vv+WFG6D"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGFos4091316
	for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Mar 2026 11:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bo04PPluhNxDs3dNvQUl61WfLNkmR2AQ12kwe+gKE2I=; b=NuHgc/e0oACN8Kv3
	HaamJVnrePiqyFWpPCM7S/36+EvAJ1V+MLo3P8Y6ftuaOUcKoD90YGH7aOK4m7VB
	PlW560yrTGKGmSfZia1KW4RhFlCOCOfY+mCytKYUVmLGOPQWdjpj6xi/ta6CGGAA
	Phw2ZlCVZ5srV6VngfQ9mtu3Z2MdELY9W7fx8zL+r1XQUqthusks2V23C9bvIK+k
	zkXhG98nUgVWuoLLYFkThTN8V9hXg49em9Y6gQ/7Vk1rXxu6of27JsNVaz2p+Gu4
	SVph1uJsyyU8H/hdoshAK9SpINESeog4xmgsBcTXZDrRL3n6fvkuCtTXQ/505Pdi
	CCsn1g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41412vpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Mar 2026 11:20:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b68af943eso12631741cf.0
        for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Mar 2026 04:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774437650; x=1775042450; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bo04PPluhNxDs3dNvQUl61WfLNkmR2AQ12kwe+gKE2I=;
        b=Vv+WFG6DkROCp8wwZV3QPbImstNNbxgqfTENzopzQCJeA9PLwLgZtmUN+07cZNhA+k
         iWYE3DAxKEdLOcNNrMXgd7vh1pnc10hFv0taUePD8dShz0WqNrNQS6amOnUU7rNIEXP/
         pNIQ2XHn3JI7VXupdD7ayYCXmsZSgkuqGinoNjeD1hoTDeXn4RpFaulxH6hvFiFTd4wd
         iOgOr9IAutpeva5KVXAafpeqioFKNMjgM2S9/9WWdfCwigeiPfDi/DOKQV529Sh1+7Tq
         nR4UA6Yk3ujY2u/QaxCJI+a11tpFmFXfskEBVwUE4swODvfFANyDgVvQGYFfHkfmL/Xz
         rbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437650; x=1775042450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bo04PPluhNxDs3dNvQUl61WfLNkmR2AQ12kwe+gKE2I=;
        b=oe1MixXj+j+ilFF21pASV81T+5qRsoAbOX9EQTDHJvypKV4ZjzTqVGcFnhprK8rwuo
         jIgCLhFLVzbf0a5uHcCJFCPASEopLUDAwT3clXniJUfZA+UbfWVDbiL6S/KV4dDqFfsO
         g8OFN4jmDqBu1dUWWWik/UjL79DeYkEZeE1ndF6e8SUkEDvfR5Jlt0J28Px9oxtCp9HN
         RCD7FydutBQp6B4+vnWy+33NsKVXjwbVgXGh2hYLLWfsx5VhB+MQ9f3/M3sGfJPzZkmD
         9W0q9ZcpXxb1+uEAxH6N3f3B8FDE6MNY0KuGvO+GEXp0Kpnurfa9Icuj6nY5r5UW3S3i
         QKQg==
X-Forwarded-Encrypted: i=1; AJvYcCV/jtZAF3Ib3jQAujIYubg9YjgsBKUsiUTrqXUkx2eJ/W5rBk79QwAse4A6odKMjgDgqiQo74YbZwWeaYs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzadkIemv34osYf1uSmrOUvHEETgcuvO3qBqpMpzymTbGksBVZC
	XvwhpY/6g85IZWHswCWsrgs5UQoCEJdQJg5HXbhxDkrpFyAU722a/AfvajyvEAoHOU3/Rgm26VZ
	8Beh/270VsqNTkh2xVYd83YvUJXMEN7v5tCHWX5H2FILe00To/wgk6yTqvIVH41W0FZs=
X-Gm-Gg: ATEYQzxGRDMLi1aiZdf7D5+mHZMiAj7DKXcj0Ui0pyygGy+MIwWvW6M3o/pGWRs6l6b
	ZVo6E1ZDHo4IijSdsglQykmwHsq1yIFh5fuxJMPZXMb5tdSKtqgBxTNpQjQdZB2jNkiO3zjmKuH
	IODTpAVdTpSjJOQKMmL27wpNpfN95oTJRc94lgIsM6Ju8Abgsm4gNaN1rrc1I1L097VmQ3/YLn4
	g5w0kK7AFN0YK7E8k6GSw9qX3Qkaks3yD89VcoPG0oQ/ha+gVzh9Jz24oeKEchywmB7h1xAGiLx
	FFKdtNCuNr+RWmOsRjuJb0Q7OSd7D0ej8Jp87AvZ2B7wiTCfetCkxhaD7GLUaGpOcP/2mPjZTjJ
	VDPDhUtDiqdO0yK1Y92SGw3v731HWBJrEH/lhXU4Ctzz65PZbRBg8bZZdlX2/oM/2WixwL6yytN
	kQ5XA=
X-Received: by 2002:a05:622a:5287:b0:501:4767:a6f with SMTP id d75a77b69052e-50b80cdd452mr30820881cf.3.1774437650223;
        Wed, 25 Mar 2026 04:20:50 -0700 (PDT)
X-Received: by 2002:a05:622a:5287:b0:501:4767:a6f with SMTP id d75a77b69052e-50b80cdd452mr30820571cf.3.1774437649651;
        Wed, 25 Mar 2026 04:20:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de177sm773644666b.29.2026.03.25.04.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:20:47 -0700 (PDT)
Message-ID: <a0da2236-27b3-4491-862a-457a03cb4c5e@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:20:45 +0100
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
To: David Heidelberg <david@ixit.cz>, Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        oe-linux-nfc@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz>
 <20260324-oneplus-nfc-v2-2-3eef052c9bc6@ixit.cz>
 <9d9ec994-c954-445d-97b2-772614d66f35@oss.qualcomm.com>
 <041766dd-422e-40e1-9e5d-c220580871f5@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <041766dd-422e-40e1-9e5d-c220580871f5@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c3c513 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=uWvuUna9Uad_Tg1iXS4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6aY8CsnHPMYO42jf-G3RtEFc7_boi8J6
X-Proofpoint-ORIG-GUID: 6aY8CsnHPMYO42jf-G3RtEFc7_boi8J6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MCBTYWx0ZWRfX7pt6fVmFeA/Q
 4IyEf+J5n3tenp6V9LcCDrUx2xHgxNPDPPX9S/NovqUdjdGdu025hdRbAqAIOcjhqHchZrCdax6
 8HxiUaHiUppXAM3bJ/y86Y+tI6j0c0PdUPj5fHbOay0+zE4smoqrzi9Zmtc3GAqiMTAWQiZ73pA
 z31adfWxA4BElVWu29GujXbsVBHIIow9bztfWswjNn5nQFGWVDmRbjX2x5ak3tbd5Vmj8rfdXio
 ZuBOO+pO5ic0m/eOBHWpeP8NEaMRQkSePoIfH0PgjFg/MUA3ppPIhABh8KGhxWO5qoFHMTtygeK
 XLW4ZlbQle3a02UUO7vAPoW3QkzeuVv6oNLFRSugQ3hCR9PSGM3vuiUsy9QB9OU4EHrQrFFMXzk
 v0qezCJX0+7mGamdlU5Ebxjf845W2jv0+YfLycNXXQUxz1SehW0VSwFBSaezd67tVwSjbppCMq0
 +HxbBUn8j1sDrZoM+YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250080

On 3/24/26 7:08 PM, David Heidelberg wrote:
> 
> 
> On 24/03/2026 14:12, Konrad Dybcio wrote:
>> On 3/24/26 12:20 AM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Definition of the NFC.
>>
>> "meh" commit message
>>
>> [...]
>>
>>> +    nfc_enable_default: nfc-enable-default-state {
>>> +        pins = "gpio12", "gpio62";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-pull-up;
>>
>> Are you sure about pulling up an active-high pin?
> 
> I'm not sure, but downstream does it (and "works for me"). Maybe Alexander would know more details here.

Would changing it to bias-disable also "work for you"?

> 
> David
> 
>>
>> FWIW TLMM subnodes are best sorted by pin index (although the file
>> currently doesn't really do that) as per dts coding style
> 
> I assume when I group the -pins into -state it doesn't apply anymore? As I don't feel having pins relevant to one device / subsystem all over the place is extra clean.

Krzysztof?

Konrad
