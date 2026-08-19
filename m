Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A2A3F7874
	for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130130; cv=none; b=q4vTlHO+mKhK3r8zelXjQ5M468FJJv0LwissbCvOh2RRXSviJY8ECynJ2RbGNhXPfTtQ1FchFp0qTq4JdxgLVzSaeu5nLdNB/LeQVie524mGxMzv40zXwZ5lZphiNrIK9zJK7OnMBovqlF8tE8trvidpNFSTITnF8LoUG/zjO64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130130; c=relaxed/simple;
	bh=C2ElBitpcH0Y/2m4DlDrMTU8AR4F+16skNXfElZui1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1lxOw+Jvpt9RYKIbGCuODNgTmYS/OwTW5cGqICqisz4wR79FCKA2W12WiY4Da/vPK4HZD+dsPM6/C4UFpXGDe3TWT6we4O2riXxxxDVA97RYS9A4qrwlgkhk1T0m24k/xZy7glhfIUOHlJYu0J/A97EwRncrtYdv0FIpcufXc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VojUUq/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OM74h/aN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VojUUq/c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OM74h/aN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z3NN3670844
	for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 09:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C2ElBitpcH0Y/2m4DlDrMTU8AR4F+16skNXfElZui1o=; b=VojUUq/c3qSYudqI
	7hU6d5ZoiE6pBU2hAlD4TQpLgDcM0NHvl6pnoSvSOcjQPn+4a782scrbdRoIaxRM
	bxBkUrY0SGKwJwr5pIMUlBB7RuWcdJvEckvhnLrNpSX0jxq0odY6ApJqENjbbwvw
	fRGB2igpz8g3j18K5CYZ5czevJZDAP/rXJ6iBa75pzExPa5XErIvICjDf9GuYvpz
	LtKJHlsQz2hROww3fXCr4h7l406jP1ksmluxsCPUf0ROgSYSbr4aby2OJx0QhJCd
	x5QE6QzG4xJUkH3FWdVxkyibinGOCKvtTHSrHMAbQOzY/Jx6g/GBu5JrGMd1eO/h
	5wuSWw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfttbr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 09:02:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9310484c005so12905485a.3
        for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 02:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787130125; x=1787734925; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2ElBitpcH0Y/2m4DlDrMTU8AR4F+16skNXfElZui1o=;
        b=OM74h/aNpFh91cW1FfTe/eCbnreBcTjLqnbYHyT2RP3emHEcmSheRtaVALQNQJTtfl
         YLppi/RFB2XVxuuQ50PAlPoSgbyt4F4UpXIzHqNjBkZ0rWPuv+FQS1ZT8VDm2mtOp8Mv
         YKVbqmkaQKvRzHUV5c7beCcvmBfT1YNO5oDBTnx0Szw9oANc4L3dIw/hjCG38Qx/6aQS
         csmjMlxEs33T7tab++zRo7BKQNpr/Az3aC9ch7jj/kqDEMdEw17Lhh2+EniMQSDhVerD
         iYuvfWfBQbmwC1vV2qYsI6e8gf6wZsuDYw+JcLQ8qlR/nAAqjdUurJq9Hjjx1nonOa/V
         fYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787130125; x=1787734925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2ElBitpcH0Y/2m4DlDrMTU8AR4F+16skNXfElZui1o=;
        b=Oe1bkJYtUcR+whSSvH/Q4POu/jf/eqtc4shkkzG1T6xD0w0Vuesehez9ccGMAlSUYe
         Yd9ZQRMzA/NTpotOrtSHAQmCC1ycaAC32pnhRNqpdVV4/qnX4vc8Ml4517p3ZKZSlYRL
         eGoj0fOI8vTElje5/luuCWcoQZ05Zn2WILCO3IGrgufeDq9pCBZQCEPIej5PpQP2AL01
         IiN7IfHPB4VQzWennscuclyJQgC4U4LJedn9647CGfvOO1glzPXuHgFBEFPLjnhqe+pz
         rrbQ5N/qOVkF4pSiF9TtQSa7HCa2UYNPIeNI9rpwqVdPXIQTV8jI/zJZ4PTdg0fQ3ifD
         el4A==
X-Forwarded-Encrypted: i=1; AHgh+RpmDbDq5Wm3/Vzn52d+uiuC5EIraNDRGruZ7vitixWDeiD+m8rh/p2lC8KxSh/viAJqRGMTJ3iOQQPfEzs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/RnmAA+d1xTY7y4Rho4UbiCsM26j7/4rXFsiBEMd5sO74bFO+
	ganQtrh8qqTOlFTuSOxZnWbwtPGM3f7SzMcY8g1Hn//hUYFm8fYm8jNRamDBGQ/WqSpCabxi4P3
	ZCh+MNM3HgIGovjwnoCSk3hKwD1CkMUfQPgvxqoCtxcl799uPprqlLVLpe40qi4cXCzI=
X-Gm-Gg: AR+sD12i1JZ1aD8tkEiUh9K3o6syuWcruUzi4aO2ixgoLAQPZzL8lW/V2xm4/AM/zcB
	XlnkIzuzA7Z5IrDhcaB8ZquxL9AA66vNez0xJ4QothEk0/97m8zcdms8x+fXdq180qB/I+Nr981
	NCsQVbmesR2yg/PW6VcsX5B2tnEyGrJ46EqfwR9mlvquSlAOXeCscBCNZikNjkD9Br4we9Z0/OY
	c8zh6WmEuglW+fVH3Hy5cjS5EvcKTxT2zuiAMpUZOkaWeiDwfuekRfEloDWYvSbs4nz4OHNVA05
	8duQkieFbMsovARgXuH2t4eQX6kfRgnAI2ixG1u4XQhA/a2ka/pWXdAszdD8Bwtlss6Q1FASCQA
	mo47NVnE+ZX3Ik/c2VaJbPbLH
X-Received: by 2002:a05:620a:4055:b0:92b:7420:bd58 with SMTP id af79cd13be357-9371e1aa1f0mr225177685a.0.1787130124698;
        Wed, 19 Aug 2026 02:02:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4055:b0:92b:7420:bd58 with SMTP id af79cd13be357-9371e1aa1f0mr225172385a.0.1787130124093;
        Wed, 19 Aug 2026 02:02:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c7cf8a7sm46942166b.7.2026.08.19.02.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:02:03 -0700 (PDT)
Message-ID: <1286acb2-91ef-4c3a-a7d6-3161657a2b95@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 11:02:01 +0200
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
X-Authority-Analysis: v=2.4 cv=FIorAeos c=1 sm=1 tr=0 ts=6a85710d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6H0WHjuAAAAA:8 a=vAYhG2c651soA5ayOEcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA2OCBTYWx0ZWRfX/r1uybDY0N4C
 YDGtIh99ybTTVmrK5Hk7FOCDpojIbKBaZ3TkXajpTZUoRUvW2KWRMq7qmxO1ex7ehLyaWOxYq/4
 /yF49opu4s/NLwNlvuGvodyUGH1jkbM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA2OCBTYWx0ZWRfX6KrfaZHGS2sh
 MKixPX9QVwlTbpk9FSdBDD3g2dDQwUcjrxwo09iKdeOQqNaB/6jG0U9Jg6uTQQzJjBNtkjFtmky
 1A045OLGOWfLWPBKmSyYIPAudcMOKZ8578rkfRo42VaV6HUzQE8TJBqvGn9z/oppu+gU5qE62Az
 iQDWL03iTezcBy5Q7s+pGE7i80WqFXTzVmyoq8vOoo69ZIlD01gpz/jMImkQx5hcxpBAfJxJAMH
 mZHeZUhDUUM2HPTj7GfiguuEHgR1aai7BVzT2wx0XqMBhPJDVxNZcZPIiLPEiksMkP4lV5DjoY+
 HTsBYLpV3UMpVkco50cpWpTelj6zm+pCtx5/2KWJyqkZJ9DJUSYGGgggG2FP5wmpvoBZNOGQXW/
 0fCoIuk/Otd4u4C37/C6W94lT54CjFjzsyw8YIcL+CoP6ULk35lTQlyfXmCWcWfRLFJ5cstRho4
 gTIf9BHcj7EFNBHldxw==
X-Proofpoint-GUID: ovpGVBd1uew6LoYSx5wONDDqjRc3Dhn_
X-Proofpoint-ORIG-GUID: ovpGVBd1uew6LoYSx5wONDDqjRc3Dhn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190068

On 8/18/26 11:00 PM, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-high. Compatible is st,st21nfcd-i2c (raw NCI). ese-present and
> uicc-present are unset; those links are unproven on this board.

FP schematics are publicly available:

https://www.fairphone.com/wp-content/uploads/2024/02/Fairphone5_Information-on-how-to-repair-and-recycle-SCH-09-02-2024.pdf

and it seems like both are connected

Konrad
