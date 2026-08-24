Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40F43AA4F1
	for <oe-linux-nfc@lists.linux.dev>; Mon, 24 Aug 2026 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561838; cv=none; b=CEl1wur7E6mrgdmOEe2m9+0TGDKxM+3b54huOIRJJv7Owu3JAKhXOOVsnSBSNONYye9ZgshZJodQO9So7aiz6yNx0vpcqjx42XbdRaMgJY95AjW2VNasWQCXnjsFvqXEVPV7ocPEEqF1YHAQ/a1kPhOw1S1e1vY4WIArOpVupyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561838; c=relaxed/simple;
	bh=n/O40m2GZ/yzb5oqxUkC+dBG0QysdnWonyA+OmACEtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jObXOrVArbSeL6rR+m69P/OMaHpUhVujL/OTrEbmrbHgiNn3glIH+EfZxOfDT2dqzT6OAvcwzDFJ19npj9WaV6mvtkCT9tU/Dxhvk7iotMVHhP5fqo0lLm1NMtesJ1ibjWz/dMUE4ELm1BEzpAIvGAoejEeSLLBnyIQ3rQ9Ehaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSTvfiCP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBB9Zx3i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSTvfiCP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBB9Zx3i"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O8UDuh3020070
	for <oe-linux-nfc@lists.linux.dev>; Mon, 24 Aug 2026 08:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FediVK++eWEGtqNNfanEj1qRZ+5vZO6tRsceojvl3NU=; b=gSTvfiCPiy6tBTT8
	H8xD01Dvexde2c9yveBahOyv+6rWc4h6vR4tVDiWFdO7sbDVLYVUnupFrNRGzpE4
	lHBSyHqMcQ3r3fo57LBmJL8xZrrxQZqs9URJCUiYYSHjS4nzhMsBNECoro8hkZ7T
	KwHhkn3dTyYiu2sJvOF6ZpGjr0GcW9EVMN891cxQBZpkkyQylhCzd6XUYim6/Py3
	ishbu7qmKPJKdZHtFCCY6O1XwZpw2gGqc2bdSjP807BzmGlEkRvo+LRWMS5qOraL
	gyZEONUUALUaSbrUfA0SCGOpI+AQaPQ9BbqGskZSlsmgucNXR5Is0ImWUYdlOLfy
	Mbcv/w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk03rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Mon, 24 Aug 2026 08:57:15 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97c4f47fa57so34491241.0
        for <oe-linux-nfc@lists.linux.dev>; Mon, 24 Aug 2026 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561835; x=1788166635; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FediVK++eWEGtqNNfanEj1qRZ+5vZO6tRsceojvl3NU=;
        b=eBB9Zx3i+0AOWtR5cu2AQ82NsRTJxCGbXmtmRBxybx5uZyCjhqiAtF6Ctm/vVUdzjB
         xf8qPWcYKPBjvX1jRXv0rJD2CtFFj/rP94qU54qqpYVP4MkZsMaKZ3+d+rnFw30eTmud
         at8dZqSz9NjfzJdNw1oDwvcrliE8UNpYO3pcL9Fs8TFWki6DQoYz5mkpSubOSTvv9OCo
         aPKgVGox0A3AeBug2dcCrFlN1ebWrfsilZroZT7B2rKFkgG0X5sxSEKNBBwdUYF1PWAK
         PLXOheKhH4Sy+JDLSw/C1Abqe2o9kdx9ZzO6PDf+LT8yDaXq7l1E1EY8LZy1PjSvC5Ag
         s+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561835; x=1788166635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FediVK++eWEGtqNNfanEj1qRZ+5vZO6tRsceojvl3NU=;
        b=CRwhpNNrO+0GeGbCRCkaKNfVPob29JOJJfvEutyfKwLR0pxeTqN6z5saZXk4Jepfc0
         dr+2UvCgXS5CC2tNFk2JwrP6QQUzd1GMuEyDD4h564DV/lP//dHOpTK6TjSWWwx+GdeN
         b+s9mqmoIirrcDxhzxBIQ4dgB4tTqzOHTcm4sJAl0mkdbXhK7dfofGY3gb1L04UJXsGs
         MP6ZCu0yCLmXGEPfCksJG7rFWlbxjE76Kd0QwC4pbBtEXjhAmB94BVRaBqNE685dHukp
         phtckFp3nflAE42QERjdY3+OmuepmRERJYTJmupKepljvd+IbUYqkKrLtPBjD4YBAlgl
         g4UA==
X-Forwarded-Encrypted: i=1; AHgh+RqFig7kYI0BhDhgyK6GCuO0XUQA5V2A0YJ1Q3GoVdvpINjaoayUoSXRtvycPBgUENQamkfzgAotzBJ1nyw=@lists.linux.dev
X-Gm-Message-State: AFuF++nqkUz3Lleo2we05ZrQthaCU7mweW12qZ/flj3jB7xLLsxM5RfW
	ZdqTd9RAbAeKFP/AVxYXqZxauuMXkQL/GIHGjUQ0mkXNYvP8pCYAk/jMdALY17cC5fgz9FywfvH
	S+2nylaTei/ZJ8Q0Qqm+w1G45c98gsV8Lh7KrGko7V0Eqt4UlzAmyAH2AbzM/9yOQKnk=
X-Gm-Gg: AR+sD120tEjTG50uf0P+9XTYQNDSPpXQ/nJp9ue9ZpBfoBF0Ffs5MxvdUkYu/xULWQS
	5eh3S29j2hL7gPHssHaibbsmP/DOwlZpWabWyichBgxze69kLoYpSX968bIQEyJYVc6+YR7wCGf
	MWxpy5jbvNRdDM0NWugzmmukrqamkba+8hgoFiHHcOBJ+3gLrN3wSiv4IHOgLnlv3vOcFJQrul+
	XYIY9kAb11yyqEasdii2N0JLszjoN8kVI1AxN2dz8396GkWcOBjEFdeC/DFnCYVTkxqDm5P+uwO
	eZ8tQQ+2v5atG3lukubxtromVGXYlCjhEl++WaATnwb+aTgO2o/krVPYUKjlRrcuUY8Jn4QR7L3
	j2YuzkuV/KRmykLZt/Gmh4MN9
X-Received: by 2002:a05:6102:6893:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-77a643461f0mr3515313137.1.1787561834948;
        Mon, 24 Aug 2026 01:57:14 -0700 (PDT)
X-Received: by 2002:a05:6102:6893:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-77a643461f0mr3515306137.1.1787561834572;
        Mon, 24 Aug 2026 01:57:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2ddad2sm7355677a12.30.2026.08.24.01.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:57:13 -0700 (PDT)
Message-ID: <0cc4dcb5-cc90-46cd-9174-029416e7f51d@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:57:11 +0200
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add
 ST21NFCD NFC
To: Kristian Brox <isyourbrainfoss@proton.me>, oe-linux-nfc@lists.linux.dev
Cc: david@ixit.cz, krzk+dt@kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, luca.weiss@fairphone.com,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
 <20260819210906.2500789-1-isyourbrainfoss@proton.me>
 <20260819210906.2500789-4-isyourbrainfoss@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819210906.2500789-4-isyourbrainfoss@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AKY2Qpu6Rt_5NWLpu8jeRbHFaWNSTRtQ
X-Proofpoint-GUID: AKY2Qpu6Rt_5NWLpu8jeRbHFaWNSTRtQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfXyqDvHsmjS6cC
 wdZl4FdB64qxNHrSV1tTBHgcVTiwBd8iIJ5WxgdvCumGFSpevnPsRmE7HlvBLLFLCjlnfK9Had4
 C3qD6j6LnwuF9FjfLa2SndY8MEHe3RQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfX4tyO9a5alXJI
 Z3oORwR9wQ880jumaA1UbBdOd/l83ttECC9Jn8jpIyTKpfLrXswn3Clt34WaGvt634Ta8U62L2K
 PZBGMbFOcqYKnW+LOyI6ggWVdf1ITcUim/zikt5ruUjmNfSu3SsOL4Py9KBzRfFmZnYi24tlm2U
 DHYBPWHp+gtB2DdMhgWlUyJ6lizEhvq/K1tidYgDyBPX7mqQDAGh2v2kWm1ZGx3t1g/6/foWPdr
 yH/sWYVkNp6oyvEaEwUlBqg+Rdq3QgX05shGjF3ltkBg2ROgXzyVvza9ruBjE6t5b2x4RIyhaUD
 uxcKRe+oRUhWW+oITejBL9zagB6Sb47KQzi9kzbVBukXWlIPEtGCLTP/lm9tMrIoWX/EBf7iJos
 qH8ny0cFvcqIcgHKHF6S1uuLCsKhk/GzFITF3Mmss+P49YwicV323SXRc2XK8IvwEotoKTbOb12
 jBHmB//56ltTL+t+yPQ==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c076b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FWA6L-ytD-VELHUIOsEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240078

On 8/19/26 11:09 PM, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-high. Compatible is st,st21nfcd (raw NCI).
> 
> SYS_CLK is LN_BB_CLK2. VPS_IO is L18B (vreg_l18b). ese-present and
> uicc-present follow the public schematic (NFC_SWP1/SWP2: SWP_SE to
> SIM1, SWP_UICC to SIM2). Reader path is tested; SE/HCE is not.
> 
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---

[...]

> +	nfc_reset_default: nfc-reset-default-state {
> +		pins = "gpio38";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

This line is unnecessary, the driver should assert the pin

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
