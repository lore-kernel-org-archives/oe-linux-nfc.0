Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B743C65E0
	for <oe-linux-nfc@lists.linux.dev>; Tue, 18 Aug 2026 10:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787048859; cv=none; b=oUYva1FHGp5S2MdCPgggJDtwFGMtBWY/Wb13N6sl5hc+diBqz0J65G3wOjv4Na6b6pQX7Yw+OxHfZj176cwvFL6iJA4qIBzrdK5tTuZKJ4R86KckAA61xn9BjyIdM0ydebQUefG4OSdEvrG08klvuIUPbu7Z01lJD7iQp3Fs+QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787048859; c=relaxed/simple;
	bh=qzVduJq5GdVNzfjCOi6IYK/AGsAYiirXHMuWBR5pY6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TU8g0ocOEz2r+3BZE71mSoED6WOlN34Ui3BsiJpp2/FiCckDMxsnZPhJIJDltt3+gl0lmIJrhvoUX+6Gtl4vI3uBqmXpKpAYF0Y1FQJtqZUN4lM7LZDSPxFlXNDGNawusUAa9pwATVPlWon60Leyl0MMwMeLtnkrEAp6LfvUVaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PchoZbV0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U6hKLWjH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PchoZbV0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U6hKLWjH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABl6S068849
	for <oe-linux-nfc@lists.linux.dev>; Tue, 18 Aug 2026 10:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbAw28JEMDtsVhR/iRFJoE82+XonCmoCsrWXqTH4a6I=; b=PchoZbV0KUbr4cVv
	pqYicGS389HO7wkBfrbAxIwrMP5B0dwDc1c7hzD6zE+C6B89rB8Qit96iKeW5O1x
	89PHNnfolz7ua/md1UbTN71YtmKMDux8bs8djS5N+vKqEf/Yr0iZUVQBWdOV4eUD
	R4p25oPtf0XkJJAIGXROex6rU0auIcuLaax1iFxXyu3Lm1O0by5hJHm/J3x36Ww4
	B3ETSZxK0MP0AKL9Y0qDmRbEOdgPW97Z0UeXDi1+gRPuocIap7+c6EvYwWsWjorp
	idnRcaIc81lxN9ZOABVyvfwpAAnIPo11V/yi4BCRG91IP/Z37jhPyp/4sc5uqkSe
	PrqGug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4f5psqav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Tue, 18 Aug 2026 10:27:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494b1e35cso4972685a.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 18 Aug 2026 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787048856; x=1787653656; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbAw28JEMDtsVhR/iRFJoE82+XonCmoCsrWXqTH4a6I=;
        b=U6hKLWjHxKz1n5EyqWOIX6lxUBIXcMpFzEAwI3Mzj9jotpYlCrepNnAVMq9fO85WgG
         MZdjQoMNuZeeLGf4VAaekRWh3z5kBcmnGcV0oHeYSH/TSbpY+29X01DYT/aU4XOqM7jt
         qnllVWAhdG3xaKmapg7o+mo4hnmc49n3V5A5d8jwRkyXDBKFArLgXuBR4haCsFhBGwD1
         Fs9agT/+bIy3Y5RTZftM9KmaPyBRWGy0uJduYGzE/ed3jeGWrsIF2g+8W7oqHybW0tb7
         dT2+TXGnHV8kj0edqv30bnWR2CPTZC6IWwaEDDkNhdmjc2RGJdiz6btumGzh/AGd7rTH
         bXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787048856; x=1787653656;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbAw28JEMDtsVhR/iRFJoE82+XonCmoCsrWXqTH4a6I=;
        b=Fr254zn9EATHj/pbfBv08ioPXlUngSi8aouOklJ6quuCuQFq37IK8U1HF5DiATtztp
         Komqn3LJMpsDcdHL+Dago9TCRosylGAfL/O8ZrGRLRw9XinH/xsWpsqyX/42RP0ChSpB
         7QY7qqtCJLTPUONz4h4EWuyj9FcIRDSAR3p7LhZAHfvS9dk1zCsvo9P/vfFP07YHdRFU
         L56Zs3x8tmRvJYs/lBp+3JGvxI8mpZl1U6g7V2Cx4sSQE8gIh4ZkOpr8/h0o4WccWtjY
         tpJH+/ZwtcPUQ6YuIQUgQ8vy8KC6GzBd2v/Bgb5dBUynR+fEhwz0LTWUDKY174bPsf9l
         xpmw==
X-Forwarded-Encrypted: i=1; AHgh+RpqUyzV3/J7ymlXfMaAtXTTIbor1XFhVsIcMumnRKLjOjrnuuCKhOIspxml2AZupgpKQrg+NMHAWHhK8T0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7Qr9cnjqKYQdxrKiyiQLetqetbHJlTxGpIBQij9nb8Zqhrt4q
	7SulhPy+y3UST6hxeLxc5pqMxDHBMGN1IBf7HwVwSfjgAXaiE54rAEz2bLj0FSW2J7Is1OPLTCS
	K73xmUWITW7KFXEM12BPHjh3J0/qVnOtb5tQKeUY2honmOlvqH9tnQWDBBR5T245lxN4=
X-Gm-Gg: AR+sD11I0uD8mLhbh8EoIBwglWT+BoOLQkdFw/2U8arZtfTsZWYodAuHVrfA9IfFZ1Z
	I3DEpvXss16oe9AtBQgFi+g1GLzkWnMIcUpsycmPhXLCinnJj9AGxwIULmO8uM/ltqX4V0ZOfXr
	y2/iRMFPUDvk8ov2qpKNMLwvPqYkN7YkmQl4DjqQuDn3cZpLCEYiqbq2Yc1VAcNc9uAJgGUDFq0
	QGcvZ1VhUwduFLXLSOybtBssSD+jBax8EWIsSkuWPpIt8s8NEuwJi7XCYnuzHA2DY5BoWlzmcpV
	V7CciK+uUw+zW1qBHuG7+ZTcTZAYQ+HOI1E3Yk/cbbaxkDCAHjepgXxS7vNrNrZoWcHBPsrzqV4
	DZV8qgVvyujqCNKhRJbz3EGdN
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr252266201cf.3.1787048856544;
        Tue, 18 Aug 2026 03:27:36 -0700 (PDT)
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr252265751cf.3.1787048856096;
        Tue, 18 Aug 2026 03:27:36 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d859b274sm1576957a12.25.2026.08.18.03.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:27:34 -0700 (PDT)
Message-ID: <8c04340d-6d19-4292-a873-7ded67caacca@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:27:31 +0200
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: milos-fairphone-fp6: Add NFC
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        David Heidelberg <david@ixit.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Conor Dooley
 <conor.dooley@microchip.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, oe-linux-nfc@lists.linux.dev
References: <20260811220135.472380-1-jorijnvdgraaf@catcrafts.net>
 <20260811220135.472380-7-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811220135.472380-7-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+/pBosP c=1 sm=1 tr=0 ts=6a843399 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=GYSh3LzNAAAA:8 a=EUspDBNiAAAA:8 a=Dd_GrI0rTSTmvMZCxHUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-GUID: 5XHBkEBa6S3lpLo4Lx-Pm-VQUheWeHpr
X-Proofpoint-ORIG-GUID: 5XHBkEBa6S3lpLo4Lx-Pm-VQUheWeHpr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3NiBTYWx0ZWRfXxJTFwsXDlWxe
 o/SKf5jWWETAMp2N8kwNqWDoRYO4sT175Xqi+0EtmRfoyIPe+FKtpO5lgm5ldOPbcfe0qPEp6JO
 j+64cioGiZ31pa1s0ygbTUabTKRYqpGJM9gCBgLqI8Nn9zUiG+ZdYtU90g0XhtovmM9oRITFjgD
 oMBp8LBTZ1VJZAOQJHoGa9PqKi8XQGWjAHBkwGlTNOpY0gsxzXTxUjCzcnZyNqW7eocbvURQkDj
 4gq6pCcnUWMSfjJNnUv4j1A5WTvI9YeQQroNhqUNNJC73xj0H84zOhtG1qW1plDhZeAij+Tuxs2
 3BLJ/HBvRp1g7d7D9vbJdQHA266nhPLqbWcZUYOG+iErgxMc3uZYS7plE8cUFMO67gs/xWqbk/+
 IymNBmlivt6B+UcB7W1KW7BbplUPIDaD4ndPlNJh4US5RpZmrxjN5t3O40qM072fgEWXplJrCW9
 fM4z7j8JT6axdz3Zb3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3NiBTYWx0ZWRfX+J8v6WH7d1T7
 kpenB9ZFoFaOjYx+l1dL4YGoGkOhALg+9dP5yXbef7u3Y5DNYDCF+LLofi7GbX5p8KFsqYFPED2
 yFbQe8vfSkz3x3bWXSVxDZf38SgN9Jw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180076

On 8/12/26 12:01 AM, Jorijn van der Graaf wrote:
> Add the Samsung S3NRN4V NCI NFC controller on i2c1. Its XI clock comes
> from the PMK7635 CLK7_LN buffer (RPMH_LN_BB_CLK2), and the reference is
> load-bearing: with no clocks reference at all the chip polls but never
> activates a tag, while a held rpmh clock vote lets it read (verified on
> hardware).

hw generally works better when plugged in!

> PVDD is fed from PM7550 LDO20, the rail the downstream driver switches
> for this chip.
> 
> The enable line is routed to the chip's power-down input. The driver
> drives its "en" descriptor to logical 1 to hold the chip powered down,
> and on this board the chip is off while the pin is physically high, so
> the line is GPIO_ACTIVE_HIGH. The pin is pulled up so the chip stays
> off while the line is not driven.
> 
> Assisted-by: Claude:claude-opus-4-8
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
