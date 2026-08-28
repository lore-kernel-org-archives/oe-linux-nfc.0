Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5D33CA49C
	for <oe-linux-nfc@lists.linux.dev>; Fri, 28 Aug 2026 07:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787901968; cv=none; b=IdCIROi1KkeoJkQssOMQ1GO3Zc5+H4N+V946mOLyWADfv/dcKVXDljVP8wmsNWKPf2VjUh2GhuFiTbhIZpIIpX7fZos4fsMpC7uoVJvS7WJRAndsI8M2vax9bWs4MyGb1uylsFh4niH4S3hm19B5yjyVJTxGIbXoyqRBeXE2SXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787901968; c=relaxed/simple;
	bh=pjp4l55TcSvtQ0qk1M8HaIkpbfVrhCBR046DcCeU/U4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=W7ax24N8IamZJDbr3xCndeiM6ejmJbuodlTvSCTpUwUQs8Bn4Tx82rYEFmOqfbvrFAHWlUXi6ghoHW9Z/Mg9mxeaQVQs1L0lPCAg8sQfCOEi5L1DLO/U9AUdWaCTHX9IfBJJvuwbqMizPT/7zqJLfcINRMRIc9p0rYiWeUG91YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tKaI6Edq; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tKaI6Edq"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2074710751so79700966b.1
        for <oe-linux-nfc@lists.linux.dev>; Fri, 28 Aug 2026 00:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787901964; x=1788506764; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/zT7X/XiN8cWELBs01ki64OmNK2wItsswFcyj5x5QOQ=;
        b=tKaI6Edq4IX/trx/DQSdhZbFZJr6TszoIDdHc9J7qMG6RkDAtS9FxS/oHfWJYePtPm
         7Uz4H3rkOVSqtWyHjNeUGqGFYv5peorUNU6yn02rKtAQm2uq7dOkDG14klrTi4y+DLQ5
         wUiYij8tn/dA8cwxDZb6oLTRVWdQGSBK9oOr5a+NGTQGkzBuECzEo2mrz8p3Vw84I14O
         A0i3mNBDMhX1wmIwFqxUEoZn5x79Cjib964KD5XAlFo6LjOF7rBHINSQ9i5zISNoOhyS
         ODfQGcMGeYNWdwlKjywosBYhTNMv4nsuqPzCw3NVK/aopDd7jp+K/v3YPe7ii9YtQ130
         md8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787901964; x=1788506764;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/zT7X/XiN8cWELBs01ki64OmNK2wItsswFcyj5x5QOQ=;
        b=HH9Tr4fn8kJ27dTI8G4BDYDjeKg8otZ7CyM53XQiQ7mvZ8VL/l43Jwn2wwdITpRAUm
         TPvzVjfL8v7I6soE7360w7QUcXvjV+ZPVn+AYW5Twlp16P10xmceaHnjpCSyn9/RpnOj
         Jm76Tu7HWIKHtDqnk54oIXjDMWaMxOBqmG6l9njWcbBVTNTG5iiCPzFLw8+rBdLKW3G0
         LwF22iwY/XcXoBCXRc5SGUukoS1FnGVvCOeeIV5JEVBIt74DORtPJ9eZOrD6VoD9HDUp
         kvjPSgQ4Nxq1bSAPfkZ+2TCPVA0Xs97wpWqq9wX9NDfO48QJJ+0xP+Nuy9iesKFo8CGs
         RlKA==
X-Forwarded-Encrypted: i=1; AHgh+RozAI08qO2Rh0YmIH66SlvbS/54uCu97FfRjuO+WFKBYdCuro6tkc1KF0TjxU2MBLPQunSn41M4NDczIoU=@lists.linux.dev
X-Gm-Message-State: AFuF++nJpvHuB0xiNU+QtT9PneATDZmFDv//qo6M0c4fh+WQJqkpNMuH
	GG7V+kca9nxPo05tl0p/A8qAIwIoB7uhOMyKDOpwTLXoyIBD7tqcmSwieFzaD6rB1XM=
X-Gm-Gg: AR+sD12rMzHPJXCRFtzNET3l2s/8qn5KKfB+CO4MlxvqRoXGxuKCSUjJFdWIWtKQIp0
	5bzCEt5tUqK1ZPUzr262Hgys6LV8yUrHcrlTUIM6tBRLkKSQ/2O4uwwDUIOI9C7hkS0UYV7o1ex
	GuYeQ9uHWlKdUCBbUwmErYnB0fzonsnnjbPF60foN2y2bC6fo+s0Nc9iMGnUxw4vC4eDTdKi10V
	l46nmunzAqYs5qEVBHosXsj+1srNvWcKcXZmJdDCHkEPPrqHDl9Rs/w2hcXC8iGIpGyKJibgpTS
	hfA+TV2/wxzbk4FBny6SpDus0PT+1ko0YFaJVeLBeBD23ClInqfyws+gw/pAY3zyyx8S93edOhr
	IaKRVx0tYHCd5cIlgCwvrJOLAAuKa/xc03NCwjji3U6ExmK/c8MWOGUK0CSlBG9T3tWEtFai+Bu
	c/4S1vM5mbjcBPPAkKAqRKYDl61IQERYd7WmoivYgMr+2UqGJqHjTPzycpqd5fx6CTXfYhspKFm
	Z2y4oIf/YapNR5VtOI+rFfW4y1EJlZOnw==
X-Received: by 2002:a17:907:c08c:b0:c1c:3b06:ed03 with SMTP id a640c23a62f3a-c2557423bfemr308843566b.23.1787901964423;
        Fri, 28 Aug 2026 00:26:04 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09f4dsm50367266b.6.2026.08.28.00.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 00:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 09:26:03 +0200
Message-Id: <DL0ECN3CA1GR.3P0BIK580UYDV@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Kristian Brox" <isyourbrainfoss@proton.me>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "David Heidelberg" <david@ixit.cz>,
 <oe-linux-nfc@lists.linux.dev>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] nfc: st-nci: Fairphone 5 NFC bring-up (ST21NFCD)
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260820-fp5-st21nfcd-v3-v3-0-5ee0a7f44d04@proton.me>
 <DKUIKHDS44LA.10CHEGZHLQSNS@fairphone.com>
 <20260823194152.501107-1-isyourbrainfoss@proton.me>
In-Reply-To: <20260823194152.501107-1-isyourbrainfoss@proton.me>

Hi Kristian,

On Sun Aug 23, 2026 at 9:42 PM CEST, Kristian Brox wrote:
> Hi Luca,
>
> On Fri, Aug 21, 2026 at 11:28:22 +0200, Luca Weiss wrote:
>> Can you please confirm how you tested this on your side, and if I'm
>> maybe missing some parts?
>
> Cover letter tests were postmarketOS, these changes as modules on
> 7.1.2: nfctool -d nfc0 -1 -p on an NTAG 215, then neard for NDEF.
> No extra firmware or userspace on top of the three patches.
>
> That 7.1.2 dmesg already had
>
>   nci_ntf_packet: unsupported ntf opcode 0xf02
>
> I treated a found tag as enough and did not mention it. I have a
> driver change so that NTF is handled; I'll send it in v4. The ndlc:
> dumps are debug prints.
>
> I also ran nfctool -d nfc0 -1 -p on a locally built 7.2.0 kernel
> (sc7280-mainline, with that handler): no 0xf02 line, a Type 2 tag
> in about 0.13 s, and Ctrl-C with no tag still left Powered: Yes.
>
> I have not reproduced an error after Ctrl-C with nfctool on that
> kernel. If you have the nfctool and dmesg lines from the second
> start, that would help.

I tried again a bit more yesterday and saw the same behavior. For a few
tag scans it appears fine (apart from the bunch of errors in dmesg), but
after playing around more, I again got the NFC stack into a state where
no further tag scans were possible.

I've scanned both a standard r/w NFC tag (ISO 14443-3A, NXP - NTAG216),
and sometimes my Android phone, which also got recognized as tag.

Looking forward to testing v4.

Regards
Luca

>
> Regards
> Kristian

