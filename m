Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14AD30C601
	for <oe-linux-nfc@lists.linux.dev>; Sat,  4 Apr 2026 21:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336730; cv=none; b=f16UrX3f9tuzRBxOMZMC6+yBFtHePY+s/svRNQR9rp8o9nC0xwiCzX5PXIVwxscBbCBP0YxJwJkv2NkH4uLJXWzevWn7xN4AXmjFwl7bgWSgvSV9nOriMJ5vm2ryq2kL7a8gMB89humf/1fvQaZEpH4QMYpEC70jyOhJXUF7zjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336730; c=relaxed/simple;
	bh=HM5G1/JGcqaUtlq8xyprvI73HlG9LDW3DZ6aIrro/U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPgbC34Gv0ByS0F2l5A+AKBjdXPnBx+8bmHlotR+TidA0JVU5N7jRVmISu/E53HWLAE2hkvio6hum9XbwEgx6RJJgJHkptZiBa1VnDwlaBhTxQbHveuKMnS0c3lkGmTzuXd8U56WaPxn6rjLFVAVPM+TykCyp0Pmgh/diDdypIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZ7FaHDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TeOS44TW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZ7FaHDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TeOS44TW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634JnJsv3660818
	for <oe-linux-nfc@lists.linux.dev>; Sat, 4 Apr 2026 21:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cTrkVv7RxA87UYtedNu+KTup
	uZyd1sP6sRCLIISx6CQ=; b=kZ7FaHDmLXN6oTi6I5w9qG25oUao+k+BaNrSKKUW
	uxoHpRmE/Yri3KEKo5BjwBvKhFmmew5GTPrRYRPmlRaaJK3is0cjoJLKAXPkZLiR
	/woeLPIlN/gIHsSDrOReZRXvN5JpEKHccvNU9C1p/fTb6i+u4GO3DekIaF4Im6qi
	nfwaT6/wvaB0uK+WuBWf3Ck2Q/tywv3n8CHka/yfPS5jLJEJvJOXDkxEmkIt8Djn
	KyFNTS/wmHc3FgBLyxpjaILtfXaUHNv5Ui1wL+/o+5QR9SPtLtQFeA0dTUIJZWp8
	uHf7MSsKiMXmLRZSnLF4Syh4gKPs1gV1YP762srdC03hbA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mhq9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Sat, 04 Apr 2026 21:05:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094741c1c1so9075421cf.1
        for <oe-linux-nfc@lists.linux.dev>; Sat, 04 Apr 2026 14:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336727; x=1775941527; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cTrkVv7RxA87UYtedNu+KTupuZyd1sP6sRCLIISx6CQ=;
        b=TeOS44TWQvINUxHr/cLsKRBXlfnHCiwG8yCMUQVugf03Ts1zYiUqZSxvty+77NaH//
         0NzkAME4Vq+N6cWyuXIzAeQEHThk6acjW8Ot64Hs859Ckpi252NtJl3rnYNd905ltNb2
         EyEAVsZIRX7yiEZpeqpJDMnZEUdxAvUWFR9glEE+O/g8uikffLP/E9GV6R0Jo9H6wkHw
         Nx41dwL6W6j7NOj1GRmxqA+L4uz0xjYrLYK2RG9X0WP5TZ5lH1g7BuADUYcdhAX0OPqe
         NhbpmSr7GdUtCra6W8D2fb+rdm9KbNTIO96jr4zghBvKYcrQHk8deoJMc60LTSsZOt+N
         wjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336727; x=1775941527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTrkVv7RxA87UYtedNu+KTupuZyd1sP6sRCLIISx6CQ=;
        b=kQqX9CEcPr2et3HpUJ4UELNC24UnQDCgsKMsNvT0wr+07kA45Gzl51T18hmf+ifKna
         4tPQNaB22j0XfYSfYWYqiRq8YiDGJfztUt0AHZG6/gzYFtVI+hzXqunsZMFs7FGfPOHL
         ewBY/e2GZI5rQ3LXXynLFA8uS/2ZJBs7hSlgB5Cj4SoKN354NmKSWVUAvWcKlqVVVXKf
         WVKqOO3jxeXiQ9wWbDU/cID4VVdxlSdEc4++6sGT8Vyd5TbvlDgBo/BuwRysWwGkDm35
         MzEH+whQ6qgRBZ7BfUMskcVsYGFbFoIr7v1JmNXeLlQQopt4fXw2GSbOiBzJK9W2ofcV
         AfjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhf7WsyUjbBDkpzMeTUMB6ikRyjzIcFjC/x4FVYig15WZhkIFXl28aRncviwggzoWA1pqk7S7YXbeIVS8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXOd2lfAJA7AGtez2ysa7K8m2an6RuYbfUOgO+kikobIF4ge7A
	hXFN798b2nDlGK1TuY2CfugLG5Nn7TUDWc1f11cUzGSubt8dEgNxqp35hvP6QexjCo/7cMDKIGs
	JM2Amo4c9dvzkf2i06EBdkBoSBY9leW8dOO5Uit85Kfp0KGmyLO8v9D8ldZB0mJbFLeQ=
X-Gm-Gg: AeBDies2OdcGjeqT0J+hcToi+77B/1p1VFOTtVIyqGq/T9zxoJ3FSQey2MyZWjAhog4
	B4twdnHA04u5R0rKkrpHTqmqLf7pefcu161vRBxUR0G1hAQlOvAM3G3srTSLNivW/1WIY2zsOxN
	gNFISc0cgqERpjDatYAjEpAvYvlKx2BLdjm/MoHujC1ZvnIt/Yj4TIKfUoBmNiF6FzUILe9odYX
	uVVDgSBj4hulmjx3YiSwWzmQacj1AT1M+6vdmPNgFTCzmMI63zMt20X8uhi2mDlTVxqW2iNVBBz
	HGAgc/jQ0ignclKSQ4cwICeV0YJknY1W2ZVEx/Yfi9a6dxUiNLYUZqSk9E9N5Zazsd4sVBW4+qo
	XXBn6VahyPmXQjIuXGDCG4ca5wdutfWXb0jKm64hiWITW60+/y6lLSB7SDL9l575oHOCJzSabdK
	1mnsX5LFmST+Kh/sJ7fF6CYYEFM+cxGBijB4E=
X-Received: by 2002:a05:622a:124b:b0:50d:83de:4933 with SMTP id d75a77b69052e-50d83de50cfmr22878231cf.20.1775336727060;
        Sat, 04 Apr 2026 14:05:27 -0700 (PDT)
X-Received: by 2002:a05:622a:124b:b0:50d:83de:4933 with SMTP id d75a77b69052e-50d83de50cfmr22877861cf.20.1775336726595;
        Sat, 04 Apr 2026 14:05:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9cb95sm2274374e87.23.2026.04.04.14.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:05:24 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:05:22 +0300
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
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sdm845-google-common: Enable NFC
Message-ID: <3wejnbgrlcyagt7eqhrfqm6ih7tyo3kfgmmmvvwf6nqdr4y4bp@rhuihdfu54qd>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
 <20260403-oneplus-nfc-v3-5-fbdce57d63c1@ixit.cz>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-oneplus-nfc-v3-5-fbdce57d63c1@ixit.cz>
X-Proofpoint-ORIG-GUID: M0T5DFtlIp4r5T79XKIGi26F48eN8wIe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX5QKjwRwcRZef
 HDj/YrM/H15zXe20fLHz5Nzm/GOGeXHQ+BwSDQ7lPLVurOqXPDutsL867sQN78uOs+KSJ0A9QII
 nkz+GmisWNebDNnNXmSuwR0CTqqF/NPJGiC5HE4BajAuJhbCj2Hc0vkKNlLo2HwUyHEEvzJ/o0V
 US3EqlD84DHrIu+sA9yWZye5bz6xmlUPUkS9VHLvQF0shQRVIwrgCVJ+OJSW4RouNEgrXG7qaIl
 4vbjN4KspES4NZsqglHSAgxwojlQXvaqgqsHCkHP7D7AIw2qNp3jwmY3CqN+ZPuE5YwpvIJI0Pq
 wBlFGv3jPxrARAbF80HBbZPizrvc8ihk0BPD9fFsL3eo9BYUfY6qbMFpVDKuP9PpnoS8i+rgd41
 GJKsaYkjEkcgvmufXlAFZReRwxebFsGM+A/cau5i05oQiYTsBN8T/8YUWEvAHXtf3Aa8J8db5kN
 RDQcyjSCyBj2fuJ47SA==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d17d17 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=k9HIGDZ-W5ShfVvnVaQA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: M0T5DFtlIp4r5T79XKIGi26F48eN8wIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200

On Fri, Apr 03, 2026 at 03:58:50PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable NFC controller NXP PN557.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
