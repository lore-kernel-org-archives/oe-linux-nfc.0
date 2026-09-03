Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CC43803CF
	for <oe-linux-nfc@lists.linux.dev>; Thu,  3 Sep 2026 07:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421791; cv=none; b=Kyj3b3/qLQV7VnONkUW+nkJtUhHAfTGT+FeznUsB6XbCXQSAE9T0NVN3eYaO9htETNl3PC0VNtU2EsYuhCXGHNLNxqAIBswSVNzQXz7PxdWdO9TPztroP9W/BuP9+WKdgjgYTDMSKGBYPOINd0/yIx8JuFg1RXdubeShl1pgSvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421791; c=relaxed/simple;
	bh=ksv/avRnK4UOBJ1PwYrAwimKQy13c+CjYXmlx2M+y08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1nIp1vFEifHB4FoMDJkskJzmWCRmtXdOGBSB8DQff3PdiuOsQEu8E2a4/zuXQ+DvKIkTC7uonFmdAYO4KKk3W0NHNy6j6XNCzztIpBKZCtQAuJUTS9wtZ+EKieUtj6ri6k9+j6yY5DJvOSiB73797z9lHdGmcHy7NaV0jo1pDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1oxQjw/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0ShOyL3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1oxQjw/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0ShOyL3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lU1B3244879
	for <oe-linux-nfc@lists.linux.dev>; Thu, 3 Sep 2026 07:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0GHibo9Blx2AAUlYEMr9nHfq
	J5O/B9F3H0pQUm/H9Ds=; b=Q1oxQjw/FsamPFoT6xhhMx+0cOMRK02mhvy518Zk
	ZrXvctXVLhqBKLXcq4ksiw5hIGxZ+3HNBq1gSumdq+mfme0gCrThrv6fjTC/3szr
	fcUql69XiY38pX/hu1FVCSsB18qPV4I1s/Q7ZW8Vsb1yhRCumW/iw2Mx+vY714OH
	cgWs8379I1YRcESweUqdhoOZMLDum2TutAL2U9Kn8yM8ZGUUna6IUEPmRkuOAu6l
	zPyxT624VozAINaIfXnQWowqOT/DktWhyIzaao3jC09xhf72qZx/7iWtJiHWAWMU
	UoPE5fl5QxqlE0ht3rdJ8qW0HxunKcTeO0+31GiYmClhHQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemcecctn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Thu, 03 Sep 2026 07:49:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so412975785a.1
        for <oe-linux-nfc@lists.linux.dev>; Thu, 03 Sep 2026 00:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421786; x=1789026586; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0GHibo9Blx2AAUlYEMr9nHfqJ5O/B9F3H0pQUm/H9Ds=;
        b=G0ShOyL3dzD27GVMxITtZknEMeRrDboWUI2PjBofQcyYxWiw29j3AtGITyL+aCizs1
         XMi40Tla/H6nFKm8sU0sU9D0H8o14LO6briilC3xtepZfVx2P9BUoinpTpWGo22Oh8Ei
         5vKyg6ETM6QSKn/tvMX+DwmDFIW9ghx7jxHYCbiNuef49MuPhKVJLNid7Wa0blRQcJAi
         Sxp6EmOTW+cWiakIhrMtqNfOE7q8VM7UhGifAMA86NLLSoBrOAnNpVUDNV/AqUYp0E1w
         xaPqpphTsvmgirISa0RCHTOSdlP3Ytwlg9QsRjE+WBsJYgM4jvT1L/HvdP91Z/J+zYKq
         Ke1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421786; x=1789026586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GHibo9Blx2AAUlYEMr9nHfqJ5O/B9F3H0pQUm/H9Ds=;
        b=qs8k8rIduk292CQzZ2jP5yelqpDlyztpxnHSSeMPowmZpQcoutsuvCUNDae6Wxc0TF
         0aZaZT2HHKU8r69hKqSTjjEk9XbHN803e/5wG7mGNMdaF6Ms5IsWi0upjru/5O5YIZWQ
         jZxCQ3Sch2rrHq9TCC8DOlyNhOl/IF0NUIlbBOdJCpq5v/9i3yzRCYP0m381znko+hfs
         7Yb7Gg+HEl1HyTXGzPxvYCTszfEXc6gKFrBuQ/U7Tc8XtkKoRZqPLStJLimLm9EYpd05
         3jmfkO1+lGlfNteuOnaONZBD2nHeqHRL4MxVZpehCYKxy6FX/nzPHXrSe935089I8e7O
         1MNQ==
X-Forwarded-Encrypted: i=1; AKwUvByZwG8kwi3O4lT71FMt52r/co+iZZWz1QqIsBuJajUyqDbQ9Et9opwFdK/GSHmxiXqgVmDOUbeYcsVbNgc=@lists.linux.dev
X-Gm-Message-State: AFuF++lfrLnRpT1f9gbuQHf6zTOxP4zck/8CSt2XKVzoZOUJ84F+0JtJ
	hBDRM9/WKTl4g5MVPNqOq7+OM37ZnBN2gqA8A0/TjFF5VqulFrufgm6Velzvpv9jBg2qlhm0Q1U
	CBonGmDqa+4BQii8lWhrOIwE75hj3KCdyzrUS+Ks2ij3i6L6+ar2Hdm0DC4VY36DIImg=
X-Gm-Gg: AYBFou3qIoPlyek/G7mDYDWpL9XBRsv3+U77CiD0Hw5EufwFcxLjxwf4KYYCXJqnVPj
	5VA5Kav634xU1II7fHk63ldy0zTbpNS6x8qylCokbKYKchr9v5r/S7+Bwr49U0HNTo+KZIWji3w
	V+KOIUaxG2jNr2XIRYrFsLe8I8+h5S0bvXDqhNfPsMmXRVsv4E8EPYSr9gJErwUc2qPe4DUTUMm
	+LG3u/IcenL2U6fEwJXX8O3umIESq9J5Qvkj9lxPZ27TD+OjTcD/httEoKPZdukVH87zcv87XmH
	Dbr64O0vNFyhrgBD9SzGXo9QOXnGTVKB6I+y3JWk5RGDMB9iNAkQfHYMAC735rVIzjDDgrRFS8J
	TtKCEYF7pqqKFbg==
X-Received: by 2002:a05:620a:271a:b0:937:2443:341c with SMTP id af79cd13be357-9396100cb30mr1279825885a.41.1788421786023;
        Thu, 03 Sep 2026 00:49:46 -0700 (PDT)
X-Received: by 2002:a05:620a:271a:b0:937:2443:341c with SMTP id af79cd13be357-9396100cb30mr1279821485a.41.1788421785465;
        Thu, 03 Sep 2026 00:49:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeabbfsm11219681f8f.31.2026.09.03.00.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:49:44 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:49:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kristian Brox <isyourbrainfoss@proton.me>
Cc: David Heidelberg <david@ixit.cz>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add
 ST21NFCD NFC
Message-ID: <oznqr22wo4tuonlcs36uabppl7anwax6hcpdt4j5ppgjpmkzha@q3qmtizrtzam>
References: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
 <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfXwJSrZ+nZ/2lK
 gBSH6y+8KfvlMhHkhm1BraqEm3hrWYMoO2ODpcMky5Y1w3zuy/MXZT7c9yNAWVMHUAznGgcoDws
 vWoUUInV7iDEMa/DDhAyQ56zRk2ZCg0/oKxz2/hqGTV9Dwd4M/tor6GEkDZxUB/NsjicuQNASlf
 tdrrmoetF4svQ39Nk6buEaQVUiSiPDEYfgnTOx3T5g5BQU3t1ipuDZb67/Wm42w2v2kngkIOw33
 DHMXem0086YluB+xSI5y5X2eONyQPDMfVxkbVpmcR1ot7yy1VQMDeq7MtmMkgl1q2UVEY/fbNii
 HYFV/Ea2Cad0qvw/EKP9Y5AtKPpFUm0866WHhapJQWTST/KaFGSAn3HwTeyYcQpjMOWauWkthMB
 69XzpfWIdKglNfRmbf9LB1cDvV8YnAW1ynr9MNRcKjQPlGi17qdIYMMoUhmU/FfVqZDSVudfxVu
 ulznPojGroyjg/oW4RA==
X-Proofpoint-ORIG-GUID: iJzKW086pKNfnNKl2xP00Y05GE2PIJIB
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a99269b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FWA6L-ytD-VELHUIOsEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: iJzKW086pKNfnNKl2xP00Y05GE2PIJIB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfX7q7U0T2lheCN
 /EQP8+O61RjyU7GpKZ1JeDSCfhABfngkuOTITJg+VXZSp6360LT44Yo1/v8Jqj1FAix5Reybjpf
 3tXxUKWiOCsNynGi+9Z2mN3q8ezDrhk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030068

On 26-09-02 21:22:25, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-low. Compatible is st,st21nfcd (raw NCI).
> 
> SYS_CLK is LN_BB_CLK2. VPS_IO is L18B (vreg_l18b). ese-present and
> uicc-present follow the public schematic (NFC_SWP1/SWP2: SWP_SE to
> SIM1, SWP_UICC to SIM2). Reader path is tested; SE/HCE is not.
> 
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
