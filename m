Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA252FBDE0
	for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Mar 2026 11:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438749; cv=none; b=TdLXC4Yx5zJdMzVprlJmpSvtO3DTwd+g1raIhzO8Iqk5fbe/2EhRHYExrqng2O8mpVo03W1JJrEwmW7FIhVK3UeL+A/chSpCDMlSEqyPgdZo7TFz6x0eWnkviHW8L/ZwInHTH9SnoaYEfuvNfKhakVSAM0T+ucRTnV6diuTuZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438749; c=relaxed/simple;
	bh=HwbldYifOI1syh9jQF57vFS6uLXgc2AWeYBYJY+QJuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJedNWo77fHkiDCEp2QDaSkvHCsEsrUVoF30wJLah2Z78C9XJHzJWbvaVwhJa4uyD16J2oh7auWiIQaNPAEXnut3scOlQa103/mlxGRchgINX6PhRZbukuo5zZY5hojsmK1+fzxNQM7fkjtQP851iVsrV2ib+40NhmGEp6/YX/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8h8iA06; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MEO1SLFi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8h8iA06";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MEO1SLFi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGB7M2993870
	for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Mar 2026 11:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dyh2jN87d1AnYPhYLtYyuJ4FRff0TEodHiQjZx3eW/w=; b=P8h8iA06d7Emd6TZ
	jaZbGOSeTprb8l7ZI4vBahVvzjyOWeP5c+QTb3BuD2+7VDhVWLlDMlvBrBaOYUPi
	UgU/WRY/OsW8uiAZB5AnlE3rEtF4jhpoFQ6O8wo4pdhC/rhKVdS9UCg6YknxyqBc
	lwBExw4g6Jcy+pV+C7rsuZ57cYkh/YQbMdzVxXZwCkm2cUvUY4jXBfuAGl9AGaig
	kPtnZJ8E4T+62TdK5yGPiwbON0LAtuCcYKkKJWEWaWRfOLDvsnSSqL5nFOGaDopj
	5DCsJoywmHFk60K1o2hzadprWg2xJxQ+FQjSNznt5C1aPOhcv2tbLESa1WH10Rdr
	yN9vCg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dy4g82y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Mar 2026 11:39:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b2d15c360so45192831cf.2
        for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Mar 2026 04:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438747; x=1775043547; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dyh2jN87d1AnYPhYLtYyuJ4FRff0TEodHiQjZx3eW/w=;
        b=MEO1SLFiq70Jt1KMK1UIzvTtvij3nBJOfhMIPqwRoLBV24TAv5d5Z9cchFgWPQNMV2
         66/ijZ7AG+7QZxaguzJ5Lm/vaNH+pnkh9Wi+G1pBQWqmYQfZlCGwbaJdtNMw66c7SZ12
         6fOpkdfXNrZlRfShmImdf5LvzRRx0mJguZfH/Z3//ynikAfLvvzE/VLc3O6xJSJpN8f4
         Nfg6Lz1JQQId7MYOkTqMtOt71lQ4ejZbSbQcZ3syrehG78JquqiH2e08sNle/PSdPYPc
         gF/nLTLV8eU45ubNaFM/L10b7LNUfp0IdxVQvS33BHZyFijPbC7d7HnhKv5I/AGd6oMo
         0+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438747; x=1775043547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyh2jN87d1AnYPhYLtYyuJ4FRff0TEodHiQjZx3eW/w=;
        b=EF4xMoPYUXLmESBoJMu9CFOJ9DWFud4TvGYRXwXNEeyw7Ui3tfEQGTkIcXKWfF5bqm
         eFdxIPtGegZyp4b33Spt9yhODV6o/gNeCKKetpM0TcdCeGAWvevFlCne979qchS8uo++
         xRCPz+UjGNPAzdM/1WylsqbOEhaPkXuqrmW3+cDtbE7HoQfjc39bzQ//IiPxvAV+CWou
         1RoTEXL2rdwAvzh+UnH2OjPtAtLvDiUA+4QIxlDALOardh197DYxqB0X1QswyPFjmBee
         QFDIrEPo5AyRdar09piKk/akQrSgsjwiDox0BIXQUZgzp85JVcwKcDNPvXvsK9gVs3ps
         k5Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXCgLADvGQT/xzqQJHy57rdGVQJbeOZEbWdNeCCJvuaDfWmcwD4Hi8n/mH4bdhYLV/sEhif9lRtQ0wvXXU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ2ByjerWmuowhnfKiA0mJHLdzg69LhR28BmQdMam27Hp9+vd9
	1Wfi7cECrY7BGLXEvE3gLTgzUUAYaVNzaOrV09+9u3Q+I6FeCafjZzj23fImIFc4ByKYbkHL3wW
	7lOfvWtXVOnJdD4TTOWtg7/DWr9L5R1Vc+am7+obvQkhu3ahLOp/GbAb1F2bI4WVj+jE=
X-Gm-Gg: ATEYQzxBVphXs36YabUirRb6oCLx+hMWJbhQkNdeqLmGjbyTxw63SCPLV7b5QnvjqBj
	1G4N9zxloyhf3GGqcP9wini/pxn5qMLiECEMwGNz02tcRBXZ+ztPbWJIMOQvo3iwBhCxFQOPTxp
	o/+Fh9zNrQ4iWgLPLp+qXsf2rGP7NVLDAt9FWS9XVTIj0uUi43OeZQqbyCqrtxZodmCKrhMH6PK
	+lOmAXjYzfGyhVK97ybUbPYOcu3Ir01tD5Li4W4spSafIW0EzZhXJjZUWE8SOX1EsR15WBqjfqR
	9PNgKrm2QfUVLQCOUqsP/3aPvrSS8Gf0r0NwfFl6Nv2dvUlKYIisQDpMN2EO1IGAWBv9rmWLy7f
	MYLSwLIUvdCGJQV5uS2/FJAjvIxpLEurT17v14Zh77iG4F1CWY27klsWdcx58OmQTaJJs0wKMGn
	srqog=
X-Received: by 2002:a05:622a:4086:b0:509:39b1:d4be with SMTP id d75a77b69052e-50b80e802e3mr33657741cf.5.1774438746769;
        Wed, 25 Mar 2026 04:39:06 -0700 (PDT)
X-Received: by 2002:a05:622a:4086:b0:509:39b1:d4be with SMTP id d75a77b69052e-50b80e802e3mr33657271cf.5.1774438746210;
        Wed, 25 Mar 2026 04:39:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983387103asm779356066b.57.2026.03.25.04.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:39:05 -0700 (PDT)
Message-ID: <39da1661-bad5-47a0-b50a-52678e1766f9@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:39:02 +0100
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
To: Krzysztof Kozlowski <krzk@kernel.org>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konradybcio@kernel.org>,
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
 <a0da2236-27b3-4491-862a-457a03cb4c5e@oss.qualcomm.com>
 <c607e5e9-2e2c-450d-9ca2-5727ba99578c@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c607e5e9-2e2c-450d-9ca2-5727ba99578c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MiBTYWx0ZWRfX+j5w3vjIV7im
 kld4yNa0Yr6C7Yw9CAsZonkVSq2DX8wuOAByvkJXsxDvqngy++OxKQ7UnN4alosHqr2WynIW5cb
 HS6/ZO9wDUsuJ7/pHAX4mCXGmskWMpmk/hIbh25aNQtnLdfKW93e75cRkz6EUjpBEe9avCwLUPO
 xB2cJ9/KAbz3jssiFoU3y1oVmjo/rDJMy9anUClTn9q9YULKrcKeORjx2rhjcUUrVrAyKnPWme5
 5vP4cnjGNPqQvwD1wA9Zgy2ehW17bNXgHPtqkCTL7gc3fipVSGU50Vs+FS+hj5RBCBnXrTuBLtt
 5cYWfnUZEOHBFej+ZK5CKBr/jC/PQR7+NXYrvTMmHYc465tibat70SJV9YB8csDSgb+1E0OZR/d
 PIujerK6HVb8PLCnyL3P89WUIWTu5wbMhiFytSFtsCiREctcIeOjCqGJAnVgYfqj9Sfpla9O4zR
 4FTzUhwpDUxGzMIN7sg==
X-Proofpoint-ORIG-GUID: kNafSslrSqSYMPvKDSHkUTmgQ8CxpyZz
X-Proofpoint-GUID: kNafSslrSqSYMPvKDSHkUTmgQ8CxpyZz
X-Authority-Analysis: v=2.4 cv=eeUwvrEH c=1 sm=1 tr=0 ts=69c3c95b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=nP0QM_pW1fVPP_CoLIUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250082

On 3/25/26 12:31 PM, Krzysztof Kozlowski wrote:
> On 25/03/2026 12:20, Konrad Dybcio wrote:
>>>
>>>>
>>>> FWIW TLMM subnodes are best sorted by pin index (although the file
>>>> currently doesn't really do that) as per dts coding style
>>>
>>> I assume when I group the -pins into -state it doesn't apply anymore? As I don't feel having pins relevant to one device / subsystem all over the place is extra clean.
>>
> 
> 	nfc_int_default: nfc-int-default-state {
> 		pins = "gpio63";
> 	};
> 
> 	nfc_enable_default: nfc-enable-default-state {
> 		pins = "gpio12", "gpio62";
> 	};
> 
>  	sde_dsi_active: sde-dsi-active-state {
>  		pins = "gpio6", "gpio11";
> 	}
> 
> Let's imagine future possible implementation of DTS coding style
> linter/checkpatch. How it would sort the nodes? Either by node name or
> the first value in "pins", this this would be:
> 
>  	sde_dsi_active: sde-dsi-active-state {
>  		pins = "gpio6", "gpio11";
> 	}
> 
> 	nfc_enable_default: nfc-enable-default-state {
> 		pins = "gpio12", "gpio62";
> 	};
> 
> 	nfc_int_default: nfc-int-default-state {
> 		pins = "gpio63";
> 	};
> 
> So that's how you code. Less work for future linter/checkpatch.
> 
> The trouble is that "pins" property sorting can result in nodes being
> spread all over, imagine:
> 
> 	nfc_enable_default: nfc-enable-default-state {
> 		pins = "gpio5", "gpio62";
> 			// ^^^^^ DIFFERENCE!
> 	};
> 
>  	sde_dsi_active: sde-dsi-active-state {
>  		pins = "gpio6", "gpio11";
> 	}
> 
> 	nfc_int_default: nfc-int-default-state {
> 		pins = "gpio63";
> 	};
> 
> That's why I would propose to keep everything sorted by node name, but I
> am fine with both choices. Qualcomm maintainers decide about such
> detailed style they want to impose.

At LPC we agreed that the last sentence should not be the case ;)

I think I'm fine with "children by name" then..

Konrad
