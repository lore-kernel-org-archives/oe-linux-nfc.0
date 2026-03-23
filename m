Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0951C286D5C
	for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Mar 2026 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265668; cv=none; b=liKAtQsVH8tR4Fd/QEvlo/xlIPcxbNrEL5ChSlLi+rPk82BoBmoSxLsypWrTGfBj6/g/0AOVHkJzDb+7PnMXQEdEhtcEUHUd6E8I2/I43wIY42H+yNZLyXgxRbyHZq+jbi19byoMwbNcvqlYl5pFCjwhtJtyU8mQ22yaHuDsNRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265668; c=relaxed/simple;
	bh=5y6Bd03R9I+jDsejN2kyRg3MgRmiMG2aUkV/pbS3EVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZSTJjzR/mezsVwzcFES0Zp1incHB26VhiZrPzKaDRAGCJX8DvZdE93i8ynjLPp5Taz/DOF/BGHTop0s3/yiRjcwcmcb/phpQHpIeTHh9BHcLBpFueFdZattfjEjHu4jR2lFYUnlXMGz1HnATIM+WY2cbwF5jwyaLWFXHsHHhVX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEKOKaLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcXt+Z+F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEKOKaLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcXt+Z+F"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NAlO4u2173767
	for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Mar 2026 11:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yP7BePyV8V69Gp0dwYW6aB+HYb7u/dPAwd2KQHqi9jo=; b=kEKOKaLc7JHXads1
	LiyvnEtYHpnm7QbgsRkuvvdn5iKUn31iiuV9BJoaGZr29co3jC6kI6pStMAiBmcR
	6jgwwFDiUIfP3Xz6UPHNmYvTvu77fvc0/3f2yPaPzuL1lSCpUaV90AououKvT30O
	G+3/JVwcwdGxb7zOb0GFIYmrQ91hdZ+HEuf27XuNJ31Kv3ueDWu+r1bdnSFlSjFW
	8WQX0dIhJTah6TVeJXH/KuQByFuvwfFBRwAECylOs36ZaEM3MWnqreVobcxJz6S4
	PMqMGMbj9ECQGPJ46f0leb96RmQAeSBh5pcCD6wQHyOSf5y4lr7Wt3oc4AH0X/nU
	BpxW+A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8k35j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Mar 2026 11:34:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b68af943eso1464781cf.0
        for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Mar 2026 04:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774265665; x=1774870465; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yP7BePyV8V69Gp0dwYW6aB+HYb7u/dPAwd2KQHqi9jo=;
        b=gcXt+Z+FqZ4UBYXp0KUF5F/mYBQy6qSy3v0UOMJBLKE2nyabxoWrWNHrzZ+77gEiFi
         3FZDnUwpRk3z3//8GywIRRZdvlSFltNChuJL6+Mi3myFXfqhZ72iI/EX3SKLW1Jo9GC2
         d4KDtTkgvAjZ/4xW+HT/nLQATAukCeTmLrmXo9JghPejLKZpiDaSxcVxWW4dLtvlYrbz
         zMh1e1NUWweZbwHJ+nPLxvIksS3m2rYZZ2SkILUd7OmVgyEliaND7+D9CtmsqHiDzwro
         wn4f75DaUa6Rl9JM9TaUHR5+0CZSZE1EgRH7OwurlOibJXC3blQ49PgTzgdibOc/qIuF
         e62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774265665; x=1774870465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yP7BePyV8V69Gp0dwYW6aB+HYb7u/dPAwd2KQHqi9jo=;
        b=lOkSv++9kaqeZ8GPsOAYbzTK4M1VnMEsVTvhUvCz/tWDKFzuA8NlveqtoNT1csxYPl
         rcuS/LlnszrmM6mB5UBp+9WyNkOwdzPzFJAs1SMYX5IL6l4SzV/rGUgPYmxZkvejeGQp
         h5F5ZewKKchNxujQPWqXvwXN2lzMWGWnvxDawYXRN1aT+ZwmqNrZK4P/CNXgF4gINKlV
         wnSTxfk5gDW9LJNRYs7amHv16l28/NH7O2PizNQ/qAM7OIotdZWSRTrWOKVkh7TDYLkA
         SpR6vl5No2zNCuSoZPqYkST+czex4nmiw7wUmmIcnpFuvWWLHhVE32DIj+1zKQOeTdwg
         N0iA==
X-Forwarded-Encrypted: i=1; AJvYcCVOZXEhE955gAwtbV1fE0r6fqLG4pKDVc6ZiwwMHGNdgDv7moMOzg1Upwga/RFhqUw1UrU9D5pC2M8+boM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxO2zxKy/eQzGZ4aWPdnO7rceFqzXcpL/t5tiZeaCVSzztHBr+H
	0MLHSUL+oUQAM8Pu2HEz/GHXzci5kPjcrBTaMRSXeylzVmF+PHlvvZYEzp+8avaFYe8ceczvt/H
	Ecfi88P4qdZPwaonEIqB7CEq8FazlpO9zw4ZilHrQAHjl+EXSc6BpjqaFBxoF0I4vBms=
X-Gm-Gg: ATEYQzyccqA4AvYsgAGASOp0HVARSibKC5wjnSzDTV6/m5IQnd1dt6s3le7h2VkRL3G
	eHwy/564eV0NjT/ilG3RHm5vQ8lWbV0Tx0qlW3aFlYEc4Kmnwj6ViHQDJOcskUyUwUr1Sm0N+FE
	9x/XqsKfX9Yfwo3hXo56I+8/0q0ryKEWIfwNw30+G5ZrqwkHpXuXPCAaFZdRgh55SuyN8UKCWd4
	h9dapMGEIieB5hF+NTCwiXkQJUM5bZVBSCFSEMU3dWF8lEOx46UlvN5h5EBWvbuJx2JaEVF8yec
	69mVoOqSjk7yDxILPWrRNXSsHMD248nVjz5TwmC4sag+tKvX3yIZ+Qq06b1hxd5YcoIXr+Se7uF
	X4Mi/46s/MmKK8iNMUTmw3+55RhQK3iYUgJOna6Z2w2ZBTHwcEISed/xt92V6ricQXh9z0uWMik
	+D9IQ=
X-Received: by 2002:a05:622a:65c7:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b51ebc824mr45722031cf.9.1774265665429;
        Mon, 23 Mar 2026 04:34:25 -0700 (PDT)
X-Received: by 2002:a05:622a:65c7:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b51ebc824mr45721831cf.9.1774265665045;
        Mon, 23 Mar 2026 04:34:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365a166sm489893366b.42.2026.03.23.04.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:34:24 -0700 (PDT)
Message-ID: <b743b408-0b24-4660-9879-3536d8006d7b@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:34:21 +0100
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH QUESTION 0/2] NFC support in Linux (and support for
 Qualcomm SDM845 devices)
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260322-oneplus-nfc-v1-0-5f22f544f0e2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260322-oneplus-nfc-v1-0-5f22f544f0e2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4OSBTYWx0ZWRfX/E0AuCaQ2Mkm
 Fg6gHfVi/x7x/+H70LcxUSKQTiInYnfR/39NPcwuxNtC1+0H5Qjw35i9+D1e8CAOlpV5S8FYlOp
 dQTXAwudLGV2N5VEqwHSQ8EKKq8CDdaEfPnw4JpjAj5qityJgf8S6fbGPmhY7NNqHz0vMHpm728
 W+NPeCfTrcFA1frSChGzsLDHx1C+VC6WuSQYCpmdMTL/ACY7kA8E2ulCzSsZQeMsHZk5GZiHcGl
 16Gl8fPLyZxmxJzzjGMG3QkyEf2n9zQtQ8SeS45e8wVbqFHCfGOC/bYrvm6rFkB7K88fA4Sn60m
 PFqE04f2ttRu7We6pmVAOA0SMp8W93VtXP8dqCCwhMK2jHb97rUviLrCD2dl+GwBBSWfOAj6dcl
 oCspbRN2Xh9j9gh5dbnWHVRq3tEUTGGOTeu29b4VxBaxgGqxCNEwShX2Pn7M+rSLxJ53vmOV0zu
 EmTor1lXapx9x60w6Pg==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c12542 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=XBYjAflyaPWs-M9QSm8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: L_CcdNt5nXW2DLJD2sq6Kl0kbP1kqfwc
X-Proofpoint-GUID: L_CcdNt5nXW2DLJD2sq6Kl0kbP1kqfwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230089

On 3/22/26 3:24 PM, David Heidelberg via B4 Relay wrote:
> There isn't upstream driver.
> 
> I'm openining this as a starter. We need a NFC drivers I assume. I tried
> quick check, but both of NFC drivers register
> 
> nfc: nfc_init: NFC Core ver 0.1
> NET: Registered PF_NFC protocol family
> 
> but efficiently does nothing. In the See section, there are some ways
> how to make NFC work, but rely on patched vendor libs, missing updates
> etc.
> 
> 1. What hardware is present on Snapdragon 845, is there some
>    documentation? It seems that both sdm845 devices has almost identical
>    setup, thus it's NFC solution integrated? @Qualcomm

As far as I'm able to tell, they're clearly external ICs

Konrad
