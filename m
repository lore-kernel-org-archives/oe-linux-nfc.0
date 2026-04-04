Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583E8137923
	for <oe-linux-nfc@lists.linux.dev>; Sat,  4 Apr 2026 21:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336539; cv=none; b=lBOsgFLjG+6gRmnjpQZ9pyaJklMQ4dt040e16fd+2iM7qX2bh0yZHadGC3ZQc9dZR+EFrIXwwnGW4brHSUEZ+P8PcTcm2Dv0uHlDPJVR6FtLxQXalBeyGn9lRc28iygxHOXxJOf2YvC7zjqi1UHyTcIAJH6qzvf+/Yv5i4vivI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336539; c=relaxed/simple;
	bh=M+11Bqne1ZEbBP552q16E4pebXsWAs4LLI08kLq/vLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZAfL9xHHb4rfLbHqq+Yqt9VBL/scaVXvi8mlQZUbLgk28TeRdogYylImUtqiNfEB7HisaKUIKu8aGOsU2wk3cg0oiIWYTru6In8uxR3g6S2AaEBxkBwxTHcPS82jxipN8Qy5F7iQSPGUiinpi9EUfZidTC7Gvn7f9nEs5jKW6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cb6lh1Wb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYCjpxgF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cb6lh1Wb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYCjpxgF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634JDpke1810160
	for <oe-linux-nfc@lists.linux.dev>; Sat, 4 Apr 2026 21:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fPHbHTmrz5b69W2HbX81pMl0
	Mb3P+N1Jkbf+3Ti3CC4=; b=Cb6lh1WbqZF67viqKoBgkYUQW/wTrwHq3kSFBBW1
	fLrfpE5IJIPXqYdcrnR2/Z/Mb2+iGyq1zUtmwVWr4LMegpAfW/FgB5tEOZlPlPWq
	9roAlVL3QAFwv9ZSWgRCoakovk0mDIhY+yf/HLZBpy1C3JhQ4igu6ONHtueBo5de
	SBYNL8lvfg1/SmNiiBrGPRQx4PUsJ3kfEBwcikMArm1KG3P52ZKBzqnkbO4BCKzt
	AO/k9Zyt4iw/Y3cj/qKbA5Yi5KzP6UqQo4e9Z1t8xRKxubcffTt6C0ZW9XScq6IR
	w7kJVOO7BDaUodxyEXMcZnUK0kfVVl0pDvUsyi8ncAY3Ew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfhjm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Sat, 04 Apr 2026 21:02:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so82200961cf.3
        for <oe-linux-nfc@lists.linux.dev>; Sat, 04 Apr 2026 14:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336536; x=1775941336; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fPHbHTmrz5b69W2HbX81pMl0Mb3P+N1Jkbf+3Ti3CC4=;
        b=CYCjpxgFot7ygL3rkqfIqEjczyu/zpPYLcyAVpjm3S/HjcaCNa1heK2G9xZLZD1YXU
         4yUPAw0Qkid0AIJ3MHQL0Cs68GUSvjQZUzYY2SwrcsZ7Rv3F1DVKdERjMCXlks2KLIgp
         GYY+126J5odiSmSxlFwxip7dJVMfUypt6xfAp/TrNPN5de7+fy8Mg8t/6ISO/4qXdala
         dN7tziJ58tnKiySyCroxYtdyP1o0Umw47ZZmvlIMo8AIrO55AksFCsZYlwcrb3NsTGP9
         3m51Fyces9IvIKRVuRUzDIUb3KCabEu0DZFQVioktJxoFQxqAZ/D58xo3Ng8E+PPfinG
         RkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336536; x=1775941336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPHbHTmrz5b69W2HbX81pMl0Mb3P+N1Jkbf+3Ti3CC4=;
        b=BXpG4vkUtY/2AmZsHJo1m/Kokfy2Cnveqry9spxAhtFKNM2kWjisgr1Ubmqa/5ZJTf
         tMiKHzwSRvMZJR+cPPBlHxMIJlGaeMyXN/nlt5yMsps0lNgmJR27Wg5QDb/5wQ1ikyD6
         Zs4Gv5WD6EeVW2vbmSoyQFS7+29xLxDDDKC1RAPUhMLR/Ng2aYQSxYcre4rt82zP+e8m
         P27NAUbztNkD+ItPpNknDQ5UlU29804YwcTtgHTslFBADuu651iM/+CscP6ywP6wRl94
         4cqw9sGlTDDkLlf/FC4v2PVISwkHdZDL01MaShp+8dfegrpyS6iA4EkN60CDuTyAi2YB
         lLYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyJGcP7V/m3n8baW7b/667vzC1UKj7SfMzUbqOMuDYlgzFH/MMuzZZRbKtShDXPt+EoaNgRbZhCEvl94I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeJ8bOmycAoAEJdSVuFKjY3HVQfukzVr4rWvU2UaXzPg/EEegk
	yZCtTtJQDJE5V0I6N3pmIQVBQxInwGGMV5zHBhKfqsdfl2P59cerS1u577X/59MbXG4zKu/rpF3
	f5bq9PoeNCjYsT2Mn44gy2rqRLu4qvO6X8TqzBKBl0zHoS/xDjikJ4VWq+spXTdyx1us=
X-Gm-Gg: AeBDiesFKfC9t9Y2wcwFPUCU3fagBUsrQD8gDSkqgudR7mmpde9AnIKHyIzx5N0Ycxq
	LxSzBEcwIFtwA20PzMMMwLq8BCBf7XC4NXIn4CAUTnieFZQeTcdXIagBmrpeHAG8mX2qoWPSqKk
	pGSUxzfWl/p1aDwWbp3ghRL08s/rFxj6lzYNMYQZLnJdrC93UDk0av1vG5/nSHkISmQQ/hDQZEl
	AC5iB6i69Ln1uMHIT90ZdGW4+RrtaL5UuthQ+Goa0+VX4v61Jnz4ZvSP8wa/WW/CyPNxn7zyHr0
	f/qaa3+ZC4dVBFG1q0iwninxQUw6/sx/TjSEJ2y4JEdYgXbsJlHD7OcJqKaBxyIOXYWy++xgmt+
	zxvDYYB2i7IMj64H0OPFWGByNy/pD/RLcj06IqxdDByg+PgYF28tQhKpyzFCAxnRLaSv1d4FsS3
	wE7zdu/pJGw1POKMFynW6Ey2tejkkYVmSMyX0=
X-Received: by 2002:a05:622a:4246:b0:509:44c3:5ffa with SMTP id d75a77b69052e-50d62b0a6d9mr116276261cf.52.1775336535667;
        Sat, 04 Apr 2026 14:02:15 -0700 (PDT)
X-Received: by 2002:a05:622a:4246:b0:509:44c3:5ffa with SMTP id d75a77b69052e-50d62b0a6d9mr116275831cf.52.1775336535152;
        Sat, 04 Apr 2026 14:02:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c95149sm2319838e87.5.2026.04.04.14.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:02:12 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:02:09 +0300
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
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: sdm845-shift-axolotl: Correct
 touchscreen sleep state
Message-ID: <ehzmqowdrvzafwahiakegphhvdoewq7eag3obpozxr6xf336rr@skgsull5vtd6>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
 <20260403-oneplus-nfc-v3-3-fbdce57d63c1@ixit.cz>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-oneplus-nfc-v3-3-fbdce57d63c1@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX/LimC2UutWAt
 oGsTAjgIAyzhOVpPG2OJQ/R/met6J82Tkqvz8bJFz9DvdqnVSw0131v6P5c7llASAohahf1V2n4
 Kl8nZj4VUVPWEUK5J85xHytwbnaT61eGt53mLFjS3sZWRSMzdFufae/xjKx8XL0dB928o+EG4Iz
 KuNEblOCHotApJ20tZIMvf8axK5z4Of28T5DCcxwJJ04x8dnr12Q+5MJUSbKfnni1WP4DD1aMUK
 IpwCz6Se30l13B+jxz2T6FuE56ivPHznKGouJfrvNk5ZaiLn2TBL/SxTFI/7IfxwliMW5XtvG9D
 RTx7CGta/NYGipQyQFADpaBC8l7whw6hqxnwnhKFOW+Tm2t3zG1OrJdwFMYksY4aQXwXD/mHV48
 lKF3hP+m63R+nREY2CEtrZnAsyrjkzgV6zzhvXOWwPdMt35DrdIDZBBy2e3tkf7UHAplrLU/9HR
 9zGyGMPhLo2jVSh0dIA==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d17c58 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=_gdz5gggCwxQTVruBwIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sQDd5lDNSHx5QIO7aM5wLdWr1_eVwBEg
X-Proofpoint-GUID: sQDd5lDNSHx5QIO7aM5wLdWr1_eVwBEg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1011 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200

On Fri, Apr 03, 2026 at 03:58:48PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> There is no suspend state in the mainline kernel, use the sleep state
> intended for this purpose.
> 
> Fixes: 45882459159d ("arm64: dts: qcom: sdm845: add device tree for SHIFT6mq")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
