Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA963EBF09
	for <oe-linux-nfc@lists.linux.dev>; Thu, 26 Mar 2026 11:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774525206; cv=none; b=pBB6uBGyQ+U5gI3b+9LZnTWvfvRiwCjptKws/wkPQc4QhviPvB6idIQUZ9ELD6Wwd54BvZcTMxZuoGMBSyQACDO0o+E226pUwr9HoshRHZnUTpiorF859d3IgF5/DRqgL3TJav92bldKT8K859HuAauisUZIszS25WiQAJdOrr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774525206; c=relaxed/simple;
	bh=65eoDA5aXZKiN86gCHpFmmdUEmkkKaAXVNwubjRij5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJGGq2OHCZwpUjWYlikMPp3PLCF8ViG2ix92FoikKbOPXVST0Brjg3b5PuQD/LvKe2T8u8tNRvj1R3IidlXBOov6QAkAQ2JOy2Ia1Q81cqXsatbetZyUJ6Mz6GlbPV7rgUqL/tqezx3TxABBmX7AmUYCPf6mFdV8mFKPujELDJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nY5PlCsU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMN7eW71; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nY5PlCsU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bMN7eW71"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8NMF03959048
	for <oe-linux-nfc@lists.linux.dev>; Thu, 26 Mar 2026 11:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3sX8nCJoTG/mn6XePX6oysvzTyZ/0eyadLiabjS3doA=; b=nY5PlCsU7Q4oc7Gr
	o6E4xjYB6CqSMJRRVArxY34+zAlEXSBJFsXMXE7DweGbtEoRMFuLsznxS1Kfj1m3
	tUlRmhF3jj3tr8xw48rHKRxnnAA6mhtRviSHEy0yM170OR4v5M//S8+Y6LA2L3yA
	vouAnDsWAc/LZCYJFr5dGDFZiyY8ZOHgu1bscUcszZbFvRqFrfOlygePLKPX3z9Z
	q4MMNdtlnnEaNS8O609DPVVRokQH3fnnM0P60gYt+ynPXiJbDo1YaynGeO/9HrZ7
	GUGpvXVyC4TbY9aIRugD6p7RQpBZhcp2u+sIbXfNlU6jd+A3jYu0dHMJbiG2JS8B
	cqDaZA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tjaj01a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Thu, 26 Mar 2026 11:39:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2a1f123fso2679791cf.0
        for <oe-linux-nfc@lists.linux.dev>; Thu, 26 Mar 2026 04:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774525196; x=1775129996; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3sX8nCJoTG/mn6XePX6oysvzTyZ/0eyadLiabjS3doA=;
        b=bMN7eW71fSgZi4CCbV/7019i0Iqb3PAOfMXPMBGqXzJ++/Lf+YEVBuO5pv5rIJrzl1
         4nRQVu5PwS/QYt0US+8DsV5amz9w5vq0LiJ998V6YBl8qT5t4IFfQPi6uTQY2o+0yU3o
         QEyiPX1fuqxG7tmhn1rhu2QnCaEAfkHp0UeUJ6TWCOMm7sMBfhZSvd2MuPhM+BAuysH0
         jVg3BsecmWIZWAsOmdDmy/WmB+6xhQ+giDT8WqWhyR7QWjyOc/+F1OzL0i1gWT5gRsL3
         6g7+IJzgsIs3UnfF7TpstZPpDWNQz5gjZfeqddCYFH6jYKlaG+9/BYlCq8FilZGEvSNh
         zc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774525196; x=1775129996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sX8nCJoTG/mn6XePX6oysvzTyZ/0eyadLiabjS3doA=;
        b=NJmcjK3piVVnQD5ZG29KXCsn1MfnWymoxIzEa+i8H+zX8D2oGq015qGNAgFEM8PNbm
         GLzJrhuixW4bILMBxWjgpuZq9Zudl2AlEFDdyCBgiJ4GknVnRD5gLPfe1xlwGJ5jSHwg
         Bas5PHE9FMsr4OAlbIdu+8bv0VhyFUBdoToRoyT8su87xFjR/hS6JGGCyZSpehTvyolg
         i4BYKNIW1A28Nzc8kSAO3w/sVPHCZyfuttYEgJc0CxhytO2v/bMgHvxpd9AULU1aHX3R
         fk1X0XNbKbBvC7+aGKDR6q6hVdIR1OJs9WCtmTyIjsuLyTqe+sHnm3DltiplFGmVC5jq
         lnCg==
X-Forwarded-Encrypted: i=1; AJvYcCXCrb8r17qjmooyetYZk/UviyOyaNNvta1vEfwzpNInYFJX0nS4wBm7uh9eCAWNmYiXcxFQSxg1THx35cc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxwr9S/vbj2wDvHgnrUVwLEePMXCxmtXT0ucnnHQFFsQWVwWg1+
	abKrNwXC4bxX+RcWUqenfXE49HINxPoVVDGEcu4/a8ccu+IhoxJbRFnlUoFlceBoAWMRs6rqJrH
	v4MvtkFXkewgzNUVGwqQrpkwobKnAL1+nUS9D8Vw3quD7p7Bk8M7CVS/T1v+kqWi7OAw=
X-Gm-Gg: ATEYQzx85Z6992XWXH+y9TAAGOySEx+O9XrScjM/mjVdSHLyXrjurRK7wsVAHyTviN+
	bGJzmouUL3l/b9MGXhKnrYLIuZ7ZVmth3NZRDiP8H6Le6YfY+tB/oWNiQfpitqjer+bKvqG/SGW
	fuobnpDqvCy41IIjkyziu8oR28fQJJddjgOB4+kzhM9QfdascTJnaigRUV0GAk2z+XB5Ee0MBGw
	wemMPaiS+rbFl/yTji1yCFYhi6rZnpeLsYJs+qYIJAHTjTV6otdDGG7acL+HX4MYF32njLQyXEC
	cRsM6ErP3VyTbVyPs9wns+ULmJwZ/tZJQw5HiO4zk7Qv4NuJSX7rkYfKaVU1nXA2o7Z+tNhvdpX
	2Zoue71ZsT1MVB8Aew5kXensN3p5Of5V4TVvExki8dLJRyZn2fnNPeApOzGwNzFfgs4W95Zrcp5
	/g5gg=
X-Received: by 2002:a05:622a:4486:b0:509:882:9e7b with SMTP id d75a77b69052e-50b80f10b80mr46080021cf.8.1774525195987;
        Thu, 26 Mar 2026 04:39:55 -0700 (PDT)
X-Received: by 2002:a05:622a:4486:b0:509:882:9e7b with SMTP id d75a77b69052e-50b80f10b80mr46079731cf.8.1774525195353;
        Thu, 26 Mar 2026 04:39:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203c2231sm108580566b.38.2026.03.26.04.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 04:39:54 -0700 (PDT)
Message-ID: <e79139f5-b737-49e5-91d4-c9269be41a47@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 12:39:52 +0100
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
To: David Heidelberg <david@ixit.cz>, Konrad Dybcio <konradybcio@kernel.org>,
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
 <6638c874-8472-4383-bf83-21c5b632e73e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6638c874-8472-4383-bf83-21c5b632e73e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Uv-E3vJD4s0oZo8RsoiSXd5BxTyUXOF5
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69c51b0c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=-PauhVP_RH9yc3VFBwAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Uv-E3vJD4s0oZo8RsoiSXd5BxTyUXOF5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA4MCBTYWx0ZWRfX637xF57ttvgK
 4Z71SJkb2ELEspC43UWtSs5LVe0RwbhqXittPvXb18sy1vZNTIEly+HLJspFVXFA83NdX9rBIO4
 t8IDDiTcDPG6wDh+Tr/RHtmhWJb+1ScTRUMuwKCnlmmT36FHJVRqyjcqlwq2/NBbha/1uf5CpK9
 wL5A57xea/VisPk53fqJ0zMzQcl6tryOQJpTQbuTRc4X6W1786x+cp7pbzV9+/is5NA91pZV21e
 QvdCz0UfkLmnvs/OVLRM4/gkg85y5WyhswFsYT7ryLOrOZgNTycwBAL/6soauBZPSR7ReT4ADDv
 pLyxDX7k/leu/HJN5mGnCxwiQidhr9WugNMrfca8ZVNA+dtzcaoKeuw4L3rBsWExqESGI621bww
 QqpFRPgBI211ie9SPo7AWxg5/qzpxAzss12s91li0sMksI/r5H68mo/A9/CAdwNX2ncuBYWRRmw
 kyQlgpi6TmSDSNv1EtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260080

On 3/25/26 9:17 PM, David Heidelberg wrote:
> On 25/03/2026 12:20, Konrad Dybcio wrote:
>> On 3/24/26 7:08 PM, David Heidelberg wrote:
>>>
>>>
>>> On 24/03/2026 14:12, Konrad Dybcio wrote:
>>>> On 3/24/26 12:20 AM, David Heidelberg via B4 Relay wrote:
>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>
>>>>> Definition of the NFC.
>>>>
>>>> "meh" commit message
>>>>
>>>> [...]
>>>>
>>>>> +    nfc_enable_default: nfc-enable-default-state {
>>>>> +        pins = "gpio12", "gpio62";
>>>>> +        function = "gpio";
>>>>> +        drive-strength = <2>;
>>>>> +        bias-pull-up;
> 
>               bias-disable;
>>>>
>>>> Are you sure about pulling up an active-high pin?
>>>
>>> I'm not sure, but downstream does it (and "works for me"). Maybe Alexander would know more details here.
>>
>> Would changing it to bias-disable also "work for you"?
> 
> Yeah, works for me. Should OnePlus 6 do the same?
> 
> Looking at OP6 datasheet, there is no pull-up/down on 12,62,nor IRQ 63.

Generally the internal bias would be used to counteract random noise posing
as signal, to ensure the line is kept in the "inactive" state when not
actively driven

I can see that the driver initially requests both to LOW and then sets it to
high based on the desired mode in nxp_nci_i2c_set_mode(), so pulling up is
perhaps never really desired.

Konrad
