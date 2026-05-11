Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBD228C854
	for <oe-linux-nfc@lists.linux.dev>; Mon, 11 May 2026 08:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487989; cv=none; b=SIVirdWjWmuzGNpVRZ96EFqDIbwW1S145VOCqieRj9WA+6pUM6cNpFaawsrLcqI3TXoa/LaB87JFhCCgN1rDHuo4+Sn8YWrX1MbTr/Obofq9zR6B50h+tupDGrDP60Hj5YCGBxt04N0LEGDUQL1UgjxPVq/GcMPXCwNa+2S9EM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487989; c=relaxed/simple;
	bh=PZd1rOdk1doX7S37IoF3Qx4tSAyYcCh1+fi+JfEvjUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UlNmMpqhRnY57HbO6/wr8RY8wfGyxjmw5w5ouOC2l+jzAo+d6qwxr16DgQIPCMeFvXofp16Bgtrxa+S1TyrgUbv1k8CbY9hZ7pToTXYne5biey3kY8osxi0uQfcUCSyer4/fXaOWBIO4HwMb+tFF8FIMc1ESYJaMbjTwL1P/m68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPbIws78; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YTXZnzya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPbIws78";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YTXZnzya"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6Bf012236722
	for <oe-linux-nfc@lists.linux.dev>; Mon, 11 May 2026 08:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s50l1Fr0E/xgiAzqjNMO/C5poeW9+LNooqy
	NsR41WQI=; b=dPbIws789bBPh8fkjmlKbNpXe/uU9Xh9AGh6udKON2TaR7DuDeJ
	ERMuxYgZwviO/4z9CrxXQufuAtJF0h7pf8YlgNwSVBSLRsMYhBaaxYmoFKI+sSxy
	X5PDeMALsLw0IVxvTjop2ivC639Y9fRh/525ggogstLdrwDbcNImy5DvbUY3Uo2h
	k8kWY9MAzsk8NktHPJcw4d0JTUpfcfgQiw4jsnjE4/NlzIEUrI+8ObjyFZSo9GMG
	D9hkTVOzodXeiAGiAC2Ihe+0AW5jD9eZbm4cSKfnkE2VPyqVKJZVrre0o/PUOccX
	Pau3ax1KV3TnaAfNYtJQ/WimPryFsk01/Gw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1x79n125-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-linux-nfc@lists.linux.dev>; Mon, 11 May 2026 08:26:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb3403e99so69525641cf.2
        for <oe-linux-nfc@lists.linux.dev>; Mon, 11 May 2026 01:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778487977; x=1779092777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s50l1Fr0E/xgiAzqjNMO/C5poeW9+LNooqyNsR41WQI=;
        b=YTXZnzyaA86NAyEWBD3NBZowto/FLms0Xny3G8uRm+8Upmzz0Vi7Sa2DEQT3YPDJ6z
         bcDYkSfeRETbKGPVUFrfQyOeVFBSf9BZEBErtjbNcf0jrquwFjdR4Zmf/LeWyD4xtIfG
         jnBEc5DFQDBJX4VNGxzeUhO/2zPcx0OlmhEwYJH24Ezo2l5EfZiZ1r+O22ILJK7TgtKu
         3XHwwg5++N0r1QhMchi9LaeS+yxgtpd3/2BNp6yMsZVhgXDn4gfhHdWbSCr189JYaR3y
         KrKZcAWJqukx1kyzyd1tZcXwzvZoab7Z6s/ooqhjtmkykFs4exdLMmUOjXow+PMe0JHk
         pTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778487977; x=1779092777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s50l1Fr0E/xgiAzqjNMO/C5poeW9+LNooqyNsR41WQI=;
        b=BJLGWIQpzUhOSzzWjuf/0Mr349w1bjqNMPbrMCb/iuI9NPds/HciKQQTjkQq+sOj3/
         VuhtxJuj1AFMqFwUz7dowcyYjJYM6ppyJajOC4jy6SmgXRPZQnuu/fBnTha6Aic1W2uY
         f0/Sr0hnRQ4bgZ9NOXEjC4XMIBJaRvAjfF8SwYicGiLLhUqv6d/M2ERBlaXyuQz4YIGv
         1jQEQGIXToxfWmYC9wYN28o/36c+0g/RLJCdnct8wwOL/Mfk3F7vRATXTZBNEzy5Ii+E
         vwQlC4TzkDHR4WkTcfHBAjDoYQEXnQv3XzLh+r7x23fz4W/udj60lTRjTHD0QCaYESNn
         at/A==
X-Gm-Message-State: AOJu0YyeKIyinkVcbHCjZ8emS/nLatS8kkimvRiF+MrmG3IcO3tIMBJ5
	I27qUWlVoI8wnjwmstdeiaKhlatem+Dg4nZn2+AlcYB6RwrhuiIRVPRfzlz7rssvJpoxnX2lYtS
	w5KeEr+8Zx72EqZDZJOB0X7yYprW2xUsqicQ/TPjO03abrn86cwFLdcSEaREvVNUxq74=
X-Gm-Gg: Acq92OGTf+nM6PkmatEfec1ZKNsVPT8k4bZGQRWgyqI0Awv9VkKQEQI2lmoX+EP45Xv
	Ben4Vb3AYakWuN6H9rOvTWw3DV6qetBJK7/DHjV+rqhveaePnoxxw/RZawtdPwqlk+NITDARLWB
	kwFIhYkFnVQUM/2kgV0hYEQk2Vjv/tufk8caLNd0U0bvmYobn3RlWTW4StpypTwKpZAiz12EBaY
	aXgNTDl7XoyyhpcZm/8q4GWkxA0Yp/0XzhRv/nQGG2Fm6Yj4t9er6q9tfpuVXTVsrAyk7Gz7xKR
	Kq+/tLxCgTFNnq/Vjhz6xUe6CrQqp1qseICUVViVdZhnCQC8WEen41EAnDyfrCJA6jv2gCP1cFa
	qarOFwkI8c0EbKghZa9yE3UrS2jlt1JI8ggtaAbrVd0XXW6z/EQ==
X-Received: by 2002:a05:622a:4a8e:b0:50f:dd9f:1223 with SMTP id d75a77b69052e-514621e0040mr348676221cf.44.1778487977000;
        Mon, 11 May 2026 01:26:17 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8e:b0:50f:dd9f:1223 with SMTP id d75a77b69052e-514621e0040mr348675991cf.44.1778487976592;
        Mon, 11 May 2026 01:26:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e80ca2666sm88767225e9.10.2026.05.11.01.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:26:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: David Heidelberg <david+nfc@ixit.cz>, Jakub Kicinski <kuba@kernel.org>,
        Ian Ray <ian.ray@gehealthcare.com>, Carl Lee <carl.lee@amd.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sasha Levin <sashal@kernel.org>, brgl@kernel.org
Cc: oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH] Revert "nfc: nxp-nci: remove interrupt trigger type"
Date: Mon, 11 May 2026 10:26:11 +0200
Message-ID: <20260511082611.12721-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: f9mjalLE6HSKngm6zce2gHDq5kUVRocL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA5MiBTYWx0ZWRfX5uG2em+tqpC9
 P6TtJBG0vfEVbKvOpYNhDrvaMKd3z+EHQSYERdZpxow1Fruu8MhWRftkTAkuJDFtE30KSS3LDcG
 8lSEeSL5hlIjjaNsYOFZMs0XZ4rgIxzl29Tcsb5IeP7Rf8J2eVIBwk8/C9aQvn3iwRGHfPWeea9
 NDVYqGpmq2QKi/5z0edqgwnaN2YuUIxG3lp/a9SFoizfrAqoEO7oKFHCanAvH+zv6MifVGAdde5
 XK5c8Uj8RTKx9MdZixuN+eizZw2sKOeKi5JfPCHdTlPYb9Oj/0IJnhiwfLGHck85fR+HDg5Iygr
 iFUc2fgxwPdFAZZx11wPTRQDqR+4VpiOmIrEIVA7hlSOtWRTi7ZbQbedkaokzCTiTb3wJWA0ySP
 j9CLVzBRiMv+Ls/Vfvi7Ioo+RjYU/PvxR/fFwOolEDNFmHIkK0blVYBE0icQbP2Q+XjsHv/dbA4
 1OSqbPMBZ+8jIcUkGpQ==
X-Proofpoint-GUID: f9mjalLE6HSKngm6zce2gHDq5kUVRocL
X-Authority-Analysis: v=2.4 cv=Yvo/gYYX c=1 sm=1 tr=0 ts=6a0192a9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8
 a=hc3HNdYz4iiQibQtTDAA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110092

This commit causes an infinite interrupt storm on Lenovo T14s (at least
the AMD Ryzen 7 variant) which requires blacklisting of this driver.
Neither firmware updates nor the proposed solution[1] seem to help. This
reverts the change due to an unfixed regression. The problem is present
since v6.19.6 stable kernel.

[1] https://lore.kernel.org/all/20260311-nfc-nxp-nci-i2c-restore-irq-trigger-fallback-v1-1-9e20714411d7@amd.com/

Cc: stable@vger.kernel.org # v6.19, v7.0
Fixes: 941270962861 ("nfc: nxp-nci: remove interrupt trigger type")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/nfc/nxp-nci/i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
index b3d34433bd14..e99e1f381028 100644
--- a/drivers/nfc/nxp-nci/i2c.c
+++ b/drivers/nfc/nxp-nci/i2c.c
@@ -305,7 +305,7 @@ static int nxp_nci_i2c_probe(struct i2c_client *client)
 
 	r = request_threaded_irq(client->irq, NULL,
 				 nxp_nci_i2c_irq_thread_fn,
-				 IRQF_ONESHOT,
+				 IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 				 NXP_NCI_I2C_DRIVER_NAME, phy);
 	if (r < 0)
 		nfc_err(&client->dev, "Unable to register IRQ handler\n");
-- 
2.47.3

