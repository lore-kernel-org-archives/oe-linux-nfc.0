Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09762BD5B4
	for <oe-linux-nfc@lists.linux.dev>; Sat,  4 Apr 2026 21:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336695; cv=none; b=bL+7rxhE5dT8FwM85SjY07e6HbFmxsAKZvle80vHDWlOb+kzhGU02Hpoj50PPgbZEK1mFJlXzLJk10Nb2ICFA/laBfAaX5EWBp88WaVdkyl2o0u8y0VSLJHAJ1/uKSOO6qZ69pve9r36jFeRWDCSVSWzFZVgr6rMTi4kkDD2zlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336695; c=relaxed/simple;
	bh=gQkxawafjezVKnoesLe0QjCR4a1/sdvaYUZkwHBxPPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4CYjD80Re6y0etvKpkHZqDMkt9+0Gz+KcFhovjgREt5yY3W3AY0GblJyMkoQ4pHrStDf1j0Njzzz6x8OTvAhf2rr6NfS4SoSvg2DPT5oXBzElFJOYKA/z5pUv/qRxH7HT+uhO5rp8AVYoC/jG+zRwMILBx7YfegpmL8eyy45Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8kwAuDX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxMBxID/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8kwAuDX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxMBxID/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634HvkTh2512035
	for <oe-linux-nfc@lists.linux.dev>; Sat, 4 Apr 2026 21:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ssFVauwzazEx25EztfIJnA/7
	6jufTDwP8FuA3yJN8zE=; b=R8kwAuDXYXTUTL5cYv89+XnMMAdOJv+IbOAcWaiN
	gYffeAXc/CWjh5kYizRDTW7Lt8HhemkZWue8llOYkeFTTjwRuEVIz5v9DJRQZ8vZ
	53HKZ8pL4Ara+xjexUD7lI1XExLZXer8Ka9oYKTlsGYsmbpkmUcXVQOKKwYn8WZs
	Xh4YIWftpWZw3F46kWvgYQ6O/0Bet2UcYWdm99VJqduWUa2HHUyX1g4FiMwowup9
	uePYuqCzRjbLEWZDoA/moU7Cvo+4U2LWoPq8ju5Uo+yoDKW1+FH43CFfY1BrLZai
	PdG1mXGkE0hbQF9Idf9f3vkIpNs3eo7WyGz/XBP6Td2pVw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux89d1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Sat, 04 Apr 2026 21:04:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d831e8083so7304801cf.3
        for <oe-linux-nfc@lists.linux.dev>; Sat, 04 Apr 2026 14:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336692; x=1775941492; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ssFVauwzazEx25EztfIJnA/76jufTDwP8FuA3yJN8zE=;
        b=CxMBxID/Ven6GhYBh/K4dK49WAhpOqfjFLuAtZBVNncwB5tAMbzvzXwyjhXqBHXovr
         4AoDRY0WrYTur9Z4qTqsC3xlBE1Ifj9Wmfju2XT7vu40xJyX8wI1I3ByM5WKZlMTNrYv
         b35MoK8QR3zAGNID1FcffjKUTeGiQVHRRCD0eNdhN/iTMqLQASPyhrSS4BczTgAVWWXl
         y3/CgGIgZky7cDxloqH4/6X6L7zPukWOKF0Wvx11K/nzFSyOE5MQQy+9Th1c1dE96QyQ
         mzUfNnVT0sztAwdawphE5RVsab2vzK3SRS2kLHO1bOXNin78x3O/GgB9HFHs6BKUMX6t
         5nHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336692; x=1775941492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssFVauwzazEx25EztfIJnA/76jufTDwP8FuA3yJN8zE=;
        b=NvVroPgWxu2JwMRbTaZWiGmKhFD7uDRRc1tDKOBT941qrYd2BSGD7KMgV5j1N+B9a9
         /dXX+ZWZ/Ru6xwO1/IeIvdrgzkFuz5jukf4YuAm2np/V+w1O0rVLqjYssEj+7hWcw4Dl
         I+PShKvR6uuQF0EO5i0v/nTyR/GRGJ0F92Hmj3Qrdp2IHpI2g4XtJl7P2kZz8xK0mszT
         h5O2aBamJjAHfsJnKDPa/lmJ0gjs2nUlPQHi01IAnXF0x9HL+5FNZWY85XvqSXeaB4ak
         CQUrUNdJlEAnVKwOFhPvpOm7q2TSyhQZ1lg3+IU9GZ+m5fIcT1PObrQbkGoeNiR3XFZG
         K9/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUg2XQz3YgVyOn0CTT5hBP3umEkdaxr+qtpU2Kfd7M0mUOLS2q46DJ4qR8XwaBthnF4/QcQ6soUpOGAa2U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyhAJgn6ZXd26bOrkiyLGp7hypIVaqrnYLlq6hhK166wkfYWfo
	pCmPkfslvMA7CnNGtJobGXaca9JM2f4DRdkHtX9e0uED/ljCA1LY1bNDfC33CZ6KrhL4EaSZoOW
	IdedHF7O1B11fgRk54zPO+a3rQBSsCNI01DbeQ4rhIAe9irF9lUY/LoiMaBRWK6bJKDg=
X-Gm-Gg: AeBDievSh6ApHtKKoKLNGWCLunGR2uh4kdFFcXw2cm/Bqea5PGRWwEHw0sphKCG1ZQI
	0joKj6pflvjPAnDwx//GKBwuv6GuZyPVDs2VS1HIajP7mCpEq3LwM7KQPVxoHGw0r0mBgoNwwxN
	GzJuf3nu7a3OTBijvhZ53+L4Hi+vnQsg1sH35lLR2vULvMUpLnKco48erED1VGAppqB79GEa++8
	1Ol9Ba1B/kiwB5J9gnhJloNom3KD+etQR6TGIb7CR/yqtpNW7q3ycWgNPx5dEpS4G6YF0EPoYgK
	XDQDYwR1GscOsSqQCoChUFP4w5Q6OJ0rVvQuQGxj1E8FhXw5oxp5PqK8Nn/Mr2U4LKdxj8THfcS
	1pSVxurl32ZBw7xnWtAMqtV/lgverp6P0C+KwH585syPEU420mtVa85cAoizPnob6eg9UcYCSmm
	F03eXezJ8adCmLiSPljeyGacdKPB2qPopsW38=
X-Received: by 2002:ac8:7d15:0:b0:50b:4d3d:496e with SMTP id d75a77b69052e-50d62cf7c6amr116122351cf.46.1775336692293;
        Sat, 04 Apr 2026 14:04:52 -0700 (PDT)
X-Received: by 2002:ac8:7d15:0:b0:50b:4d3d:496e with SMTP id d75a77b69052e-50d62cf7c6amr116121971cf.46.1775336691875;
        Sat, 04 Apr 2026 14:04:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd8491sm2317998e87.83.2026.04.04.14.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:04:50 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:04:47 +0300
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
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
Message-ID: <mall6aengyapawa5gpkel4wuswhq3c32wf2v3sdp7m2msh3zxt@2tpezkny3my2>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
 <20260403-oneplus-nfc-v3-4-fbdce57d63c1@ixit.cz>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-oneplus-nfc-v3-4-fbdce57d63c1@ixit.cz>
X-Proofpoint-ORIG-GUID: JnrFN6Y-ulfugxziZc4Kle8zhwnoB2ZB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX6ISBNE9InsCy
 ZJoJyN2cQwLQHPFiAK0UgeyGNHCn1NcT2GHsgIYGFpS+hpMA/q13TI22BoOHTWeB1cHC8iiJULS
 SZjzJlipqYqvqHIrubAcSb+VF5AHIM+6SIQh+vpTOH/XDq6V3MkNavuhbymU/HiPgrjvqNl4YU8
 C+6GKY6fRi9kDKWOUJPSCEv5HbojS1zYtjsQDu3WEOmkQwRqnZcU37LSTu1sCZtynZ5YopDJ/NX
 MAicxePZVvwKnocgPwM/+NBspTCYjNp/038a20NKQHebPVM0oy7QhxOcRvKz40cqAeKUJqH8cr+
 bmHDQoGvRAsmkSn0NIIuesdRW9RkD1JaV3MXvQ0lg5wvKBdQAuUSUaP8h8uiEhyNYAEWdkSsVcA
 qFZiL34IpQNMEbvN6HQwyhyUUE/Aix7eauf3pLhXsfF/eHZvUXATxNigsxGQjjv/Lyq/qWNfWkX
 btUnxhX9Wzrw39E3W8w==
X-Proofpoint-GUID: JnrFN6Y-ulfugxziZc4Kle8zhwnoB2ZB
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d17cf5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=jzbMb8GUTuS7xUAGJTsA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1011 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040200

On Fri, Apr 03, 2026 at 03:58:49PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable NFC controller NXP PN553.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 52 +++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
