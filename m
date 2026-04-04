Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDF430C601
	for <oe-linux-nfc@lists.linux.dev>; Sat,  4 Apr 2026 21:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336710; cv=none; b=HW3luSniFCSmwQ7RW1jz3/OZNq1Kelhun6btzkrTMOgkc9VcBjxkpllBt8c/0svkMTaIENVwSVqYj93iXXZVbCUgh29WwBYOltnKQW1zQF6Is4/ZpOQ/lEPn/XffPOoz2k115teiE1v3iYodmEphdIlUVU0hGSfTY2zsuxgMM6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336710; c=relaxed/simple;
	bh=43aB3Yxbi0z90zDEUpqs9121Cxv4GK2culeC3+AvvS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngI7tzSxYtEilFWoV6nayP/FphZAXif6zeQBsyFljt6u+Migc5SNUmEblxWFIi/KDhTbf5McUNN2oeEF498aTvisXj096QnuPLW0opFKuZvbCqxoOltzAfLbxnxoanQXs+GYMD90ji8Sz01zrWJ5ZjA4xgP7FodjFEgp4GQInLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVN9E8hO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RUi1HFNO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVN9E8hO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RUi1HFNO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6344eHhf2973615
	for <oe-linux-nfc@lists.linux.dev>; Sat, 4 Apr 2026 21:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NMHRND1WF2PTszeMkEbK4Rv7
	Is+/ycLti+5TAZCpHVk=; b=iVN9E8hOZa1RpoD7WTkr9/Jv2ORtanHvGTjhxD8F
	tPX57WsNdzxs7dfX1UN8+X1zaDOmNRe0cYihUBRnXEkIcWASaDCx3XbqdxTYkzID
	yvzJMb2c57ipLNLdPxOMuWjt04GmtM2i5zglJNBkdfodKt9Fp0+5ReuhCZoqUnPF
	d7E7JvFXQvPSOBzyt+UOu8cS6TBEnVYqyhwzMK+LUyoue8ylf3W4TgLEN+MwsV3F
	Rf2/4Ey3cHmU5NXClg/n108G9/kIrcVeSaYE/S2HLtvtQ+GbANadnN1ZPWQA+xcR
	Bnl/ded3OHT8neY3MaLHhEtHD+qLh1t6kjqXzNEINS+7Gg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dauth9dd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Sat, 04 Apr 2026 21:05:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so67538091cf.3
        for <oe-linux-nfc@lists.linux.dev>; Sat, 04 Apr 2026 14:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336706; x=1775941506; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NMHRND1WF2PTszeMkEbK4Rv7Is+/ycLti+5TAZCpHVk=;
        b=RUi1HFNOgz+oAuRiNvQwFy7j+7/l3JOxSW2KFUvFZ2rJWwTzi388ssSq3i4jzZBqBK
         UhNqbwFYF6kO9Bogplur9AgYAhJ64XV7t1M9QLxW/Vkytqdmfc7Kt4dutUdQblZfbFRh
         fTWXNPq31d8I+6hd5Ld6ksKojALLHqB3ekDQoQVQV11DIiSOzOdpoOC+EmtQOuw+UUwT
         5G3oUZXZzvPHn4O2iKbvF7mNYAv+Y+9TasSimxXsG5Bk/2rA+z9Xxmj0J4qPGOqSA7lZ
         nZDxYJR0Ei7x9EmZ6O9HmkzCQDYV6R0bRPJcZ9z4mvkMiBq2GOhlYtktZs0k9YaH/NZm
         9yTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336706; x=1775941506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMHRND1WF2PTszeMkEbK4Rv7Is+/ycLti+5TAZCpHVk=;
        b=dgh9ZESBy+IbluCbcwuthZy71xGb83f0Vftj8aPhP4s02XOYEKahnbRUpINiBKpNGV
         u2g0pu5r3Brf6eRLsf+hiv5MZguXU9GSpyIwNq/oNJNZ+z2+4NwtZAuNIPN5CuR0aoKm
         MERFD6Cenwj3IZrmHkoRWVVv970tMmN4Y9yjzqpNG4J4JFg/GzzRBt/+Xod8JLzQHaJA
         B4WZ4KxsN3FOc0jnheI45bQANWwxktICv1hhczDtKvfVu9ueP2D01y8Oc6/7QR4EnD+X
         2KuZC5CRzniESGtAc2L2KpO4QS33ocIxIxXauEvQM2M/JrlhKoNjBXaceBvctsvMVRYl
         E+mg==
X-Forwarded-Encrypted: i=1; AJvYcCXK7ki8Mriy3xA+UAMYYGcR4+v3TQ9X6mH/D1vA7RU3N3ugOKCkC6AKRZOFwN9SIW+rh+0iA5rpHtJl4S4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuHZa9TAEOp2WVj/2Hvle+AjyJIiX+xWN9i2P9gg9sPNUN+Icy
	X42cb0LmBDkOriyoyEKDTx4UydaRB2dgCeR0wsTL27eeezeXT5G6PkqhR6ysAGQLXd2anClPngK
	YO9hQsC7rvxrO4igSIfJPzyo5+ytXbmUpbX+zgGZpIFFvuhrMEiixCzB7ozySHdq/E1Y=
X-Gm-Gg: AeBDieuK23HaOXYlQQwJsSZCWIcwX1sRzU4vouYA9ghgE9Ddwa9q1qmtbfTtrPoRiNx
	g0XYtzGJBw5l1buUZke9opb6UU648/pVCjjBWA6S9vvd0wkSWhSqwMAXosa9kLVILegnRB00Qgx
	st3m27piot9HdShIJE1axEVJomtECR0PossGa6eKLu5/5UQwuOkqCDGL6glooEfYGVzPlt7wRAV
	ZuEdU1BgY5DIyCArCGyBDSxXFXjmIccc3LnmcxGFwuumk+FdaAXoAV74/iD+hxp6Sw7YGHLiLw4
	yaZhduHNiLdZsv8+NCgaCh16HHmynuBNxTeW9Td9uNV+6oaRqUDx/Pgq36flHZsKNmmEvzLtnYI
	9AFUtglCAweKe9orzqDSq5LDUFhm8UByK5pIfCODZ+uVqJVAFxowho9pTSdKgEVVa4UF8N2ZcWH
	g4eyXpxKl55lhAwmiMjRf46vci42c8vK+Zbnc=
X-Received: by 2002:a05:622a:6852:20b0:50b:8689:bd4b with SMTP id d75a77b69052e-50d62c327d0mr91009631cf.39.1775336706544;
        Sat, 04 Apr 2026 14:05:06 -0700 (PDT)
X-Received: by 2002:a05:622a:6852:20b0:50b:8689:bd4b with SMTP id d75a77b69052e-50d62c327d0mr91009181cf.39.1775336706180;
        Sat, 04 Apr 2026 14:05:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c9810044sm2030981e87.26.2026.04.04.14.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:05:03 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:05:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: sdm845-oneplus: Enable NFC
Message-ID: <44qdi3uvm6qcsjnhgepuuxbxukcqu6if2dxeyyar2rqewksgzq@lwha2jpvpic6>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
 <20260403-oneplus-nfc-v3-2-fbdce57d63c1@ixit.cz>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-oneplus-nfc-v3-2-fbdce57d63c1@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfXzzXyFZ4aA6vK
 9DBJFqfF6KvM4dsmPTFC/4ZNODvJo0C0hsYxznvHBpk49HizDPNX+jL3smIugmt7lKulY7BTlQE
 dXRTWYVQ+tCkb1ZqtVwMxPjl9/2G4FYFDzS7Vmh0m6PeP6ScG/mnV1wuIV46fEg2sXojtHc1Ir5
 6ToG8lKnuUXiPD82mdYx3cNrDz+DZMWPhuwQrcWscVdAVWXDuki1G+onrIQ1E2g2Y90GFJbR8t7
 qY8i+h9cuMCaAj8t9Alg2dPbGDiO2eEJAD/ZmbuZn+evMQQorxEmXJBBS9niAhS8H20ZTCsjHvo
 HvN6AlIVgGBJE7/Dr3rJSs6zDYGGd6K0o3IuyDh5EHxi4y2bpdo5IT1VBgXYccQHZ5D2N7D32tb
 Myh/I5Lgr7Wt2Gm/AmFL1JrMIjpEA5n+zs227bQU08G321sOZcVIBAurikHa35RbsdeAJO5lFt7
 vDH0rpR5g/0OpJHUaiQ==
X-Proofpoint-GUID: M_A0D3AMJWN4yYoATuo5fBUNncJRRcnV
X-Authority-Analysis: v=2.4 cv=MIptWcZl c=1 sm=1 tr=0 ts=69d17d03 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=wuwE3jySQvoYGrhSQ40A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: M_A0D3AMJWN4yYoATuo5fBUNncJRRcnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040200

On Fri, Apr 03, 2026 at 03:58:47PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable NFC controller NXP PN553, which is part of the package NXP NQ330
> (NFC + eSE).
> 
> Based on work of biemster <l.j.beemster@gmail.com>.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
