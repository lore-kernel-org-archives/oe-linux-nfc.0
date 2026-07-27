Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E863F6618
	for <oe-linux-nfc@lists.linux.dev>; Mon, 27 Jul 2026 10:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146851; cv=none; b=C4CcDa5F2qnCftZsoWVdTxe6PTHDs8ZH/DkflosEBDvz9MBgZsalWIr8UlhLL675ctV42xN67yM1sLyIQXDMOyQgPryv6oxj8m65wUkwffdgEQf77XZlzZhajE0hD8OcGkhbGBLZuY3C5Ut3jn7pXl9L/7YJ/xKiS8JCgTftLj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146851; c=relaxed/simple;
	bh=E15XfPG0XLJ/CQ6hsaGL76B/E+9/n45ilK578TAed5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oZKALTNDrcV027oMkzssc3TNXi7tjouJj9v3okDX2DRaVIoCWwoXtnwJZWJ/z8qkPwYe/c/PUNiSIQ/gEpC1fWa2CHAw22dbTXyhrbMaLFkLVBcT/nzWUrJfP8KuBX/UTk8PbfKM0abLjhFOSFl6EnE8MSHl+eM8kRN8pNDHPH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phq/sV4b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UfRDDOZy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phq/sV4b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UfRDDOZy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R9WtjK3316186
	for <oe-linux-nfc@lists.linux.dev>; Mon, 27 Jul 2026 10:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1N2mWIMe9XAYKGa9HXnaqIztknAlWljoYw1v6FDc68=; b=phq/sV4blnifXumr
	8eBPUZfxbQqSY8HaTuCiy+ruRUfE5p306L0K/W7JZe/+3TBS+jTpDDDGOtHgHQ83
	y7qk/FqNvdhNrWUV2Vm2OmEJYYhYa3CWP/Akp3hKLD2cqzww75wg3OWrjA+6r4dN
	n70NxaqUCLTxLUV14KwjOrBAHTinl7P6v+n9UiJRDJVhe9QvmmnUhJZgReh52mfV
	K2nh3N9UyZawn5al6zx0oOWMpCroUV2jw4suvjVofsxtcG5ls1pPORzm9ZnX814O
	w8Pl3d82HHchd/i9dUoWi2DGuiRKqv9/uAywnDJAljGtJVicl1A66olwVpBxdUO1
	ekupzg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs21rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Mon, 27 Jul 2026 10:07:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51e9d892f0dso8336191cf.2
        for <oe-linux-nfc@lists.linux.dev>; Mon, 27 Jul 2026 03:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785146848; x=1785751648; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1N2mWIMe9XAYKGa9HXnaqIztknAlWljoYw1v6FDc68=;
        b=UfRDDOZy8JkoCmiU8jgYhqeGKKzd2W/TNdDrwMPMs+FeP3w4R/w3B5dhyAizuyTUdX
         lA5vMfj54Uw8oXBI/swQvfSZGHrYqnF6tS1vE3FyLqbZ654mO1cNt9qjM5xh5viNKkIG
         ZSmxSG/1WdfYohwthg1vIP3K93bKmlKNikLxu0uraoZGdbMGhCBOuGwEEcd3/o61PXl0
         J59/yCEHtC6WPqTKvA+1Hbj4IXgvFsccmwAwdSbposK7MZvjfb40tECC6zgwIQ2BrNRm
         +kBnS5BsBpyMBsc3FQjB2m0hihbgTJxj5G/AsA/33sVILD7ECRT2EP11N7QnlDN1pUWj
         5y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785146848; x=1785751648;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1N2mWIMe9XAYKGa9HXnaqIztknAlWljoYw1v6FDc68=;
        b=TEGP74WhS47jI0M+KoacqFHVF0Yw7ePumr+mEwZSb3K0R7Xn+7BdeU+dYfdlBQBQ+1
         KHhKECB1xTakFs26pQ/47DWEcjC5eoJyu4xacl4UZZbJJwNHxlQtdSlf8cqjxv2HxAaK
         sbhs0vp+QU7MX/S4tE9nLUQr3k0BKhSm0sdjCblD6V48Yux9UCNsHDWcYQ4SZP+aA9nB
         gyRVYEa8Na3zmYXaNqMuiv5RW3Xu1XABx5wI3wgNBw0bMbzeykGwg6kVTjzI+W34CyLv
         HKVbWmKyUPIs5ZEant/kiYYhiJI2bGTR9cjNQSMMKnd/HVZjnUiAi30JfZwj//0Gg3Pn
         /OXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpdclitq2cdvwCrY5rQduN2V9Tig3vFaKhsIZCXdmv8bdZsIG8br9Pt5lcE/RMflE5yRyy1SLri5cCBTf8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcQkLQTVj53GnXagWR+qninMe7abChYM3Sr+C0ymI2ylfveOYw
	M2aNI8AAV/eouIZRTF4dQ6a0KQOz7SsFXBGL7apShndQCi6zfRnEx2m5T0M0c8pOlm9OGL6qnpX
	uJ9T3WS4pgjsKNCOuhxiDiGIQXzGZB8TN/BozT5eMdLf1iqgfZCITwLodEYzRg8mTmbY=
X-Gm-Gg: AR+sD12UCBhVoLp3yKfJOpJFbGcnUhW3Jabz1q+VNzpT0RVUG/ijKCaEeHeCmiTLuke
	TbuEvNeaEbPkmaX6EEvDJPFEhr8HCUtB/q+nxnWZ8BjQ2vkex8ybxPbv+YFD3L3GI5jIXS5g+Cy
	sXbvBEqK0JV5s+oqF0p5dyAAf7Hxw189WREn9g9iKmRdIyNc9uqJ7gZIUwhJYjHbnZ72fbj2YwG
	h2dylBohnX+d9AZr2tFy3PuboRkFaGrS8rfaWDXelK14QCr2oXNbPPfO2rkYT0V0rBNYbGEekvU
	xrZg2p5boSHPUDHl/Rm5qS2L6aeYe0mshAFCChfeC7Jhx2U2vNnpzlXiPUhK2rx4p00ivzd/7Kq
	0O7rR9oQTahboFw58JvxIztpS
X-Received: by 2002:a05:620a:2728:b0:930:aff2:b1e8 with SMTP id af79cd13be357-932df77da40mr625324885a.8.1785146847613;
        Mon, 27 Jul 2026 03:07:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2728:b0:930:aff2:b1e8 with SMTP id af79cd13be357-932df77da40mr625322285a.8.1785146847138;
        Mon, 27 Jul 2026 03:07:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5746e08sm2376666a12.23.2026.07.27.03.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 03:07:26 -0700 (PDT)
Message-ID: <7ab0655a-52ac-4b15-9223-753c146a9469@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 12:07:22 +0200
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: milos-fairphone-fp6: Add NFC
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        David Heidelberg <david@ixit.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, oe-linux-nfc@lists.linux.dev,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260726222405.153008-1-jorijnvdgraaf@catcrafts.net>
 <20260726222405.153008-6-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260726222405.153008-6-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5OCBTYWx0ZWRfXx+pL4EJU//kJ
 Xq7Ke/bm2QEEznVCWkZAQZ9Ooz9MSfZMO0IRfv65J7qbJ6vyo34y2nCUaVS7h/Xa2+CWN/DWYVK
 K+MGgsU4YMzEDa9RTPWmVqjrSsgyFbxiXgkza22iXbiEOj8cyUJ+71Ee8Me7aSrZwm9GJ+R4LCE
 QYShIibA87NkhkG1wgEF1Cu4rihoH8Z5uF25+va0qVTlFrGe8ndZOJp7CxJsDHmSrKFLc6Rjon8
 AOl5ty/oTuZdNT+9sL5Nwxujb6MDBhxJF9iGGqwBEQVuEuTAbomBOzdfSoYVYhHdu0DWx79jWBG
 302uu2kQ4aBIrwjX6eAQ+MJVk42chhnkWw+VDfbqXnXGeExl+zKD+Z6V/GqEvJ305iwJZ7W3QQs
 di0X8eZsfDUr88oZ1h1YAW/aWxGlQL/Y2zAhdCb0SvMnioJ9rLXbOphqDm8phJYoSiCYrg1LgT8
 wahrlvApDcBPbeMXLbA==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a672de0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=GYSh3LzNAAAA:8 a=yBwHqnpkDyRxZW_GFQcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-ORIG-GUID: vt8pjagHtCLCGugXbIzw93gmVxdLiQM-
X-Proofpoint-GUID: vt8pjagHtCLCGugXbIzw93gmVxdLiQM-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5OCBTYWx0ZWRfX959co4d2jLgP
 YxWKIqzR7Rt108W3FMaxGSseEnBRAyiuFCzZMb+IIYFYFVg6k3bZpkhZJWUBrj+zj1clBcHcYpC
 bVL3ef2firtTiS6ik9+uVpRMD9ZiUwI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270098

On 7/27/26 12:24 AM, Jorijn van der Graaf wrote:
> Add the Samsung S3NRN4V NCI NFC controller on i2c1. Its XI clock is
> provided by the RF_CLK2 PMIC buffer and gated through the controller's
> CLK_REQ line on tlmm GPIO6. PVDD is fed from PM7550 LDO20, the rail the
> downstream driver switches for this chip.
> 
> The enable line is routed to the chip's power-down input, which is
> asserted high to turn the chip off (the downstream driver treats VEN as
> active-low on this design) -- hence GPIO_ACTIVE_HIGH, unlike the
> exynos5433-tm2 wiring of the same driver. The pin is pulled up so the
> chip stays off while the line is not driven.
> 
> Assisted-by: Claude:claude-opus-4-8
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> ---
>  .../boot/dts/qcom/milos-fairphone-fp6.dts     | 49 ++++++++++++++++++-
>  1 file changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index ebdca0e2d2f3..a1b86e4092fe 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -601,9 +601,29 @@ &gcc {
>  };
>  
>  &i2c1 {
> -	/* Samsung NFC @ 0x27 */
> -
>  	status = "okay";
> +
> +	/*
> +	 * Samsung S3NRN4V NFC controller. XI is driven by the RF_CLK2 PMIC
> +	 * buffer; the chip has no oscillator of its own and gates the clock
> +	 * via its CLK_REQ line, so the clock must be voted on in response
> +	 * to it.
> +	 */

This seems like something that's more fitting of the commit message
and/or dt-bindings (either description: or in a YAML comment)
> +	nfc@27 {
> +		compatible = "samsung,s3nrn4v";
> +		reg = <0x27>;
> +
> +		clk-req-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +		clocks = <&rpmhcc RPMH_RF_CLK2>;
> +		en-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <31 IRQ_TYPE_EDGE_RISING>;

interrupts-extended = <&tlmm 31 IRQ..>

> +		pinctrl-0 = <&nfc_clk_req_default>, <&nfc_irq_default>,
> +			    <&nfc_pd_default>;

You can create a group of pins (see below

> +		pinctrl-names = "default";
> +		pvdd-supply = <&vreg_l20b>;
> +		wake-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;

Please group the -gpios properties together

> +	};
>  };
>  
>  &i2c3 {
> @@ -825,6 +845,31 @@ &tlmm {
>  			       <13 1>, /* NC */
>  			       <63 2>; /* WLAN UART */
>  
> +	nfc_clk_req_default: nfc-clk-req-default-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	nfc_irq_default: nfc-irq-default-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	/*
> +	 * Pulled up so the NFC chip stays powered down while the line is
> +	 * not driven (it is the chip's active-high power-down input).
> +	 */
> +	nfc_pd_default: nfc-pd-default-state {
> +		pins = "gpio56";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};

You can group them into something like:

nfc_default_state: nfc-default-state {
	nfc-clk-req-default-pins {
		gpios = ""
		...
	};

	...
};

Konrad
