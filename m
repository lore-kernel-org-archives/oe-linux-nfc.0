Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565EA31327A
	for <oe-linux-nfc@lists.linux.dev>; Tue, 18 Aug 2026 23:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787094475; cv=none; b=tSPIP4PCwJ2e7ycZ2W8HWEAVno19qeCjuNdtjjWJ7fCa684p4Lv9il/eOoIIzBn8in+AJAYAKymfufPqxX1ChB2aOJub+agL+gVGSRRxh/tm6/wbn8jNOgSJTZJvSRP617/X1sHqQRyFOVG/fbSRC0720GK51vVMBQWiBVvGWl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787094475; c=relaxed/simple;
	bh=sCcVrnoH3hv7vhxeNYX3jXxDbZO+Fqq8DDR0TUdFeKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=einygawMIag6pYLwEoFOybby5jJhDT8W4nhbCmBAKlTZMhZLqfdWCJUOOfEK/gGEZPSTBshOS5UdZUCkzwDOIfR0xMIrHIB8CW/KCcFsNLfIhoYNmN34Dy5UmM0mJFnxXwwkn1lNY1h6cRpbcixPjubf6PmuZaRTBKzTvYvazxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nwGqZC9A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S9i3QJRj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nwGqZC9A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S9i3QJRj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ILdXe31293773
	for <oe-linux-nfc@lists.linux.dev>; Tue, 18 Aug 2026 23:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EnZ5GRyuc5JsCaRheFHmyJk8
	ikA2pyS+nnM/VpnIbsc=; b=nwGqZC9AMzECgdZoq5NVCiTHycEoBKLUN//HySnf
	sa0Add5FNG1BrTYFQSMT4AEZCjfND/JI9jF7DNEgBOCEYbtJuVuI2fSrqapb18zr
	aT6YCg3vQfOa1WKSS04R4oCaBUi9InfXTHtlCdNkttR7QpXXQuf+YsD9DrMYK54B
	Viqej3Xrw67f9ByYUBnzfMPdjNLeu+fbDKe60K2iTSYtIRv4tb1npYQIm9BB0Ml3
	IwdXyH38Ij57jQkguNJ9x+Ahd6alWche94ZcP0InikLnnkCRiEAb7DYhPcsNWfY7
	k5tD/uRvFp0SmscNgxH067FVHxis3CLPgbf8ziPd80Phug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfk8a7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Tue, 18 Aug 2026 23:07:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930edb4362dso46786985a.3
        for <oe-linux-nfc@lists.linux.dev>; Tue, 18 Aug 2026 16:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787094471; x=1787699271; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EnZ5GRyuc5JsCaRheFHmyJk8ikA2pyS+nnM/VpnIbsc=;
        b=S9i3QJRj7MafJDX6uHwcW/AbMA/TjONiCII1zS1wkMgicJv1RyGUrqsfIgVQLelhmw
         W6xT9tT5cTApOpm6GNfgOuQlASbQp1taG0JesvoQf05TORJ0zCIQx1EgbGMSc/JjpkhQ
         xtuFgl/r0kW79chfLlhxHX4indSxkxZ+GcFw5+zSbVMCHn9yXi/eFbxXWazVzWGuNucD
         ckypSi3UFrGR7XeaN1BvJF+qHkFUysh0nI9ILqfznmkJ91PzCWF0YD+kIOh5jIWmhthk
         2sC8lym8zGHVDieoWe969ahI6pNn3u7YMPA3ox4yeqfmWsIq+HzD2EoKj82nx+RCdqay
         0HUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787094471; x=1787699271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnZ5GRyuc5JsCaRheFHmyJk8ikA2pyS+nnM/VpnIbsc=;
        b=J6U5XgnuF7dHLclxGrVidDRC041CW9OSd4R/vj9H94QwaEN5QNHCs0LeiLS4Ur/xwY
         vmcVGnFMcNgxcqx73sxcfsUH/jQM3p1SfDkBzt9dvTIoEZm6XlSBJFcH8FyBJ6ipf06c
         z1QEhmQ6CFh9qPt3BulczuNjpf9PYBX6nMq+bEjyzf1xL3NEEdpsx45aSjxgIqun6Fbg
         qq49eBYhsZzRQlELdK3bAZbnEu9OZBgqS9EbEsx3gGJl7UqkkgaI4uvXCX0Mukn3HCr0
         o6YneoBORXN4UiMcczWNgbNoFX3eMxe8G77uFJOId3Tj7sYouUMsWEgY6ck/n0ILf/dz
         qBiQ==
X-Gm-Message-State: AOJu0Yx8W7BTe+6b4FTGr5KUq0krP4YqJqhyNl3dMzxOXSG+wFQSwXCt
	Yku3O71t5CSH2q/rPz2VtC2j3gd5FLvu3YvEWI9DhBtvQ2e/bqez3EV+nJJuyNcz7MWkZ/WVQ3q
	IgY9vukpp7Klf3yCzjG99ewH1FjnlMUVwbjhO2958CdbOHxTjlEoKP4jOJkVjqMPq/pk=
X-Gm-Gg: AR+sD12lho1xqmuduqEHKNHl1eqVcWoRVMw2cfjufTaaTqPJT/iFeRSis1OYFevc7A7
	lYelTw6z7XnzPIZIWHogTjt0Cr7EhX0mEAnPcpU9sMYQsW9RQE2M145WAPYqMi0p5OiTHNkobfp
	pPubrVbXxZnUgg0Uu2yLWQ9rLgFCq5OwQvGNDsyvohqVKZCPX0j153Io2XN9x1NWhRjMnQn+F68
	1fcygIt0aikek+ZefXCE3BrRDjcEfQ/34kGuKyQ51p1kGjDZr4dBw7s8xXFZl3NQJ+GCoph7mKN
	oorCYKcdF+Vlwk3n/Iu2JohLTn7CvvFlMjs248sRQXShhEwLJz1Df6HL+qZrAkGju5RUMBtMyP4
	ZoT2X3wQNeruVdznnQ87UXjKk7Hk/2gU04EHawKlaCr01Sq9biOh+BA+h5glHVdCss1Ow1wH1p9
	heQmfvFGuOllG5
X-Received: by 2002:a05:620a:178b:b0:92e:d7c7:7de9 with SMTP id af79cd13be357-9371e1e26edmr95062585a.8.1787094471333;
        Tue, 18 Aug 2026 16:07:51 -0700 (PDT)
X-Received: by 2002:a05:620a:178b:b0:92e:d7c7:7de9 with SMTP id af79cd13be357-9371e1e26edmr95058885a.8.1787094470881;
        Tue, 18 Aug 2026 16:07:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4788f58a6sm42251e87.72.2026.08.18.16.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:07:49 -0700 (PDT)
Date: Wed, 19 Aug 2026 02:07:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kristian Brox <isyourbrainfoss@proton.me>
Cc: oe-linux-nfc@lists.linux.dev, david+nfc@ixit.cz,
        krzysztof.kozlowski@linaro.org, luca.weiss@fairphone.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: net: nfc: add st,st21nfcd-i2c
Message-ID: <np7x2fgerwo4timehrkgfb5esaia6aowxufbyqapfcn3ubteqh@7um7soe3k4zt>
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
 <20260818205940.1973944-2-isyourbrainfoss@proton.me>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818205940.1973944-2-isyourbrainfoss@proton.me>
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a84e5c7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=AMhAXE7b00SPKp7YA6cA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE3MCBTYWx0ZWRfXy8k4grnX3zPB
 2XakVBknoLwEelmxhacj2/6LAZFxOoxKV+MJzU0YmxNag/iSlfaz3jTdPDh2kqgX9KfaYrexjlz
 xIuuco8ARTL2KhS4B8RzkToSVi5Z0OkZnwlxX++WPWJ0rxq2XdGi2uN5Ow2nkxXlqm6Xe7UdwaD
 SeRie4Odvy0cdgqY/oMtKS4BbWZ9xpNryZOVMosyYYxF4RnDUqJdgpFPEPWood2eMzQ4/uE6i4v
 kosfc50jl32NBb2JYMRvsvgKJoeTZ8l+EUSQ1dr0hhXBkSPqwCViZPXNWwv4RL95OqLvsdpWsmu
 nCrGEys7u2RtBsoq79Z7kT/s+jRRXfg7O+4YiqcWURCS+EbCkJq/XxG1UoD2ESSgQdVsRMeI6EC
 vy0tsOh2pJ98ZjViJm8HcG219vFbau6ejfWqe0aFHIvonp7b6cYJEX39wo4r0KdgyD/fCKtL+4r
 Vwd0jEvTF4e3CNfMw7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE3MCBTYWx0ZWRfX3U8cDqbqYMu/
 iM+doG4eGOqhJnaJbwQio/Woh45LiTBNxGfrR07No4uyJLMG8IPX7l6giFpsVnjOClOgu8Q9rej
 v+JikaEPuAIm6mcLX3JRCxIewBEt9qE=
X-Proofpoint-GUID: _XM_zaDIpxUTpjM2G866EWMkGY8UidFt
X-Proofpoint-ORIG-GUID: _XM_zaDIpxUTpjM2G866EWMkGY8UidFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180170

On Tue, Aug 18, 2026 at 08:59:56PM +0000, Kristian Brox wrote:
> The ST21NFCD (e.g. Fairphone 5) speaks raw NCI on I2C. Existing
> st,st21nfcb-* and st,st21nfcc-i2c compatibles stay NDLC. Add a
> separate compatible so those boards are not switched to the wrong
> framing.
> 
> Also document the difference and add an I2C example without
> ese-present / uicc-present.
> 
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---
> diff --git a/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml b/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
> index 1dcbddbc5..3523a8df0 100644
> --- a/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
> +++ b/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
> @@ -11,10 +11,14 @@ maintainers:

Please don't use PGP signatures when sending patches.

-- 
With best wishes
Dmitry
