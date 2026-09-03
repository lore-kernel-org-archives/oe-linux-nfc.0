Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72A53E717C
	for <oe-linux-nfc@lists.linux.dev>; Thu,  3 Sep 2026 06:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418174; cv=none; b=MHg4gMSV+XLRXadtXOAfP8YHm+Ul7hcZRkG6WVFDQX05vJw19YhR7l/Qy+4RGMy4dS6H/fyTBgC2as4BzuJ007YVNVH5YS1YjNn1LQ46lvB1IAxZe/KxBmv8PPmyjmtnnNr6L7aX88Zp0ZT2F8hNr85Aysq4hoj5krF+Aw4ovBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418174; c=relaxed/simple;
	bh=8VraffC5BKkejHmJdMksu0LpOfb2HU7NmdH6wjOmvrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKw7GCMAMz7irzZUmpO+GLgZcmY9imaed0RZirdmmI215v2c5pz3HHOzZRkCmgm/aTaCWgQ9Vkv6M5VNK7BAiBF4zWw8VVrC7FsraS0d/S4jdXEiUu3lZvAnclWHPm9mm0+o72XJfgPH3R7kQWYkZ7OglCKWpBnwnXLCTJRidDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blP2OOD+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkoNyLHC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blP2OOD+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkoNyLHC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lKLe721298
	for <oe-linux-nfc@lists.linux.dev>; Thu, 3 Sep 2026 06:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFCKmyK8dAOrbMDfK/y9bBG3LydVBne7sXQVgWJrSN0=; b=blP2OOD+OBnEz0KZ
	dil2gbYrbsBizldaMvz9GXwB1tkzZaxB0DmqxJT/NtTsPeEKG5dIFKY7fb34tgEC
	HnE0OOhDZqcTTznCMJAgLRLeb2m0gEmRcMAk0op4ahjKHYil51FYsNVCxQptoN+b
	XeGOJHY8zT/HDynjAQ25IqjviJcnWy4gLrdt0yfKw+JMOJHYqpYhTcBN4DwI1FSY
	hvpZWw3SdEaoc0A0gEz/wecMOEpiXTW96poop/fH/30uE4KBB0RSk7So/l9NrUZy
	eUQtSadHAzZ183T67zM5QYUbxewZoNzeFlzEP9emxAHUpRO394MUhEWwFFyqcZ8n
	hEK4Cg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnkpbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Thu, 03 Sep 2026 06:49:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93821883e26so51480085a.2
        for <oe-linux-nfc@lists.linux.dev>; Wed, 02 Sep 2026 23:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788418172; x=1789022972; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFCKmyK8dAOrbMDfK/y9bBG3LydVBne7sXQVgWJrSN0=;
        b=DkoNyLHCOAcK+gQoS/F6EMvNESjllVFOUzBZvRbdhObtM0rlloVcH5olf6sWTm808G
         sT/55colW+B8V8eVwxYBdsvZ7hWPM5TgoHuNksFfuhvRskr+NfkQUkLPyYE1M6ZEho9r
         OrZNz9U/Yjev5sjyYtwrsedLHPFyPCjfKoUjqw33oowj2tqrrySk1EGkQI87SfPNPghe
         Y6b2EeTNA+0vB9rn0/1DO868fCDLfEX1r3aiJwBwuuwWHnd44P6UNkiAyywiQMUqbMwz
         gNVq2hlqt2v1Vy0REOMgm7YY6tTX7p4hhs2j3Kj+CUgzk/RaTM8u4JWrW+yyH9amn0x1
         PV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418172; x=1789022972;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFCKmyK8dAOrbMDfK/y9bBG3LydVBne7sXQVgWJrSN0=;
        b=TNBwN4SY9X67q6+tX3R1KNqDQgayPWZJxzs6c7we90CYbMdlf5ku5ctCGV6GkQ52Nd
         L2iMuYdkHlGfjh1JnCpwaJr0GtpsCfStoOOWhj60jN4se2rKeFYUKQ+ni00+7UHfgoDb
         n9ktz85SRTKm36lRIlXQaJ1LPB+uthO24AWrWtkqwWAMqoAdejMSyNr381eQsOywsXoB
         ZXqlpATDtWLLdskLR8es2OLG5/sE72b/EtK4s4gbVpsnlNUpAEYZs6xTSwmkRMpFvt3T
         n/0av1iIoVeCo3xkYZvqbsEEyKS/8NVtj2le+++iioOJzmASR8FFSSQyBp1zvX5S7tM3
         cvCA==
X-Forwarded-Encrypted: i=1; AKwUvBzHYM8v2g5RMMIFo/PPgQhLFYWIvwY6w0iJw6Uz8Y9qWeyCcnRdiy/pDZLJEMMNkqpOke7rzt8VQ/t3cZs=@lists.linux.dev
X-Gm-Message-State: AFuF++lbHsruSsE15g+8YjfWWtmWMUNv7xXNIR7oPL8/NJYvl74UlddN
	nA1wioANX6Xkmv0HRfhZP8+vhyBbuKQK9GOjDsi8SL4HYPxuHrCBiHG5M4fgSVDP184Ni6LvzG8
	3QZHj7BzOmt5i2CuFQ3Fm/2Zo1TyGjruG3NOhJTfld5BJxmEahqnLKXFNqwfQkH+/lQg=
X-Gm-Gg: AYBFou15AAIDVgNCy1s1+0ZryVXjvaRRr+xt6V1QZ2haTnuDQR+E9A41ZowQoB/Mcbb
	mvHLbjED8ApWuvgicdPNEjwhTDpC9gj6EpiH+XXdxef/F4OQCqoPv2Y3f5/L383CtRqLFzNecLC
	en2NBj1Wb6xnDB75nBmv94BNqL+X3cGjq77OhP3LOqIlvNhfUGF6tcxSDsfiWwdVHntvaVEEkwl
	lRxXIF73mqawGaRvQRKGwUgP7W2cMgweyvCBQudmg1oaceO3p3HQtQWmNTD03niYmuPqUP+512f
	e2lNLBcO0ZnIBUzT+LGU5L6Dvh93Rp9MaHLFuAHojgaDs8oCwGXNcC69EFPPnlG6xOLo4Cr7Hza
	x2sR2pkgPXeV1b/Fpl2MX1Q==
X-Received: by 2002:a05:620a:370d:b0:931:23a:83ca with SMTP id af79cd13be357-93961007ae2mr777130085a.4.1788418171691;
        Wed, 02 Sep 2026 23:49:31 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:931:23a:83ca with SMTP id af79cd13be357-93961007ae2mr777128585a.4.1788418171248;
        Wed, 02 Sep 2026 23:49:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895e14sm1779131a12.3.2026.09.02.23.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:49:30 -0700 (PDT)
Message-ID: <91e5c863-43cd-4703-842c-7bfaf2de877e@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:49:27 +0200
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add
 ST21NFCD NFC
To: Kristian Brox <isyourbrainfoss@proton.me>,
        David Heidelberg <david@ixit.cz>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
 <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jUkzCX_Lg5c3kl70bDxEpdNR9mORtMxc
X-Proofpoint-ORIG-GUID: jUkzCX_Lg5c3kl70bDxEpdNR9mORtMxc
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a99187c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FWA6L-ytD-VELHUIOsEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1OSBTYWx0ZWRfX9A/swbxwIBWW
 6Ouxk2wFIV7ZrddkZXIEuXNElzlQb9mGuPGgF5SklpCL66dWQ9aL3kc5Kz/YGkCd/5vvZHRgFaq
 Xz4gwhzHMnOYU675LAxhNLDkma7AtG0P6hDM3oFdgT33MZ08cjtWbyQjJS2IfWM4KoO/z8lQyj5
 WVvoRNk6EEe1nlNC2DZmCRkjzj2prNspPgo1WUdA2nXZPX/+SWfX9O4aE4znrKj2NyNIB5UF/0+
 qgeZPlz02zGLrpKtH7+qOoXiAUbfqysF+ojHV/i7OL99ZIgwoa7ZuLNfM0NzolrLyGBXtNQMf5x
 54yUSQcKtjl7l9bq/eGBfS6bLzNZi2llctcngmdRck9n+Nt0z/l9zlo6Jg2BQSfZBauQAhb5P/8
 QvgpllOmuxR/UyjQ3Bt01k+cN9OuBKav3zlpqSEQsQJvJ1clT04TTLVC5DXWXeurtN2yMK+DJll
 I2Hu2Mn0ewaOan4TE7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1OSBTYWx0ZWRfX3oiwB5n26ZZ9
 eJrGzc4IFeSfFZfb/ET9tSzkUO73Z2/ChSsV8c/aVJNfjjv1QXhjyTgoITX0W0kgsixS7/R4k/O
 2qeh/H3aljdgdzQk0QKAzB+9tw3uCnQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030059

On 9/2/26 11:22 PM, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-low. Compatible is st,st21nfcd (raw NCI).
> 
> SYS_CLK is LN_BB_CLK2. VPS_IO is L18B (vreg_l18b). ese-present and
> uicc-present follow the public schematic (NFC_SWP1/SWP2: SWP_SE to
> SIM1, SWP_UICC to SIM2). Reader path is tested; SE/HCE is not.
> 
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
