Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315902;
	b=GuOwXW7YGkDkFVn26xn4DLtNIv/z86E7aQ8I7/dtjshzEawuBdQh+i674VntJjJ0I6YZ
	 CSWeFgOV34OfVzLF3CC0TOym2cxB6B05biljDZJVmb/PQTLAfuam5hxu34sFWvr9qK4rP
	 6d/oImrQ0O1wJ5Xbwdb/lWQW0SMBYA05vhjo2hT62fMjv5qdOyKbyVs2TSXNsZKWNYDFm
	 7Vwqoe1NEdszISXBJUouQuBby3yyrTMcE0edShJkrR8vwIue33P561hZKXnCf0bIanpSB
	 ZgiDSyyS7a2DB38zJfL0AKDHUbeSTJsH87ssnLPixdcsIaCIq/Dxlw5JZ5DOmOtdmwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=QztNW8xCZa3I237qi38L8jVCSovnxhoFmR6AqIN/+uE=;
	b=FHku9ChbTwyricDe+43doNXs2NWydW06MJhahmSAB0xnHMrijgrGvvtg3fcOCVr+mmgb
	 ABb6H4djRZ47MQP7La2fFPputKcRcSb753w5wltSHLnuLCLVBF86KnOwsd/u8xKRvDmnv
	 A5LMjBT5Y4H9MLuVcLvkf5OubyxVNalJOu95qZsXOu8SKFsaiznb4o2vB8u8Ox7vgu5L8
	 jIIoXLsblANI7NGFEfAjLJpUZ2Cu77NuWpmw6wGSdxbUXV6gUq7x/Fp2upm4sYtwRYiid
	 lCcC2UoHJL8YYgO6BSDYUeOblhWx2QE3t7O/U8jG5RWd/Hmp1sRuLmRDd4pkyzLkaYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OXkAFH9K;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E67606A31A
	for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 23:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E67606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OXkAFH9K
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eae12762c9so82420e0c.1
        for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 16:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315901; x=1793920701; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QztNW8xCZa3I237qi38L8jVCSovnxhoFmR6AqIN/+uE=;
        b=OXkAFH9KLNg334g+eSK1qxiktSpYX8/atwqkbhxuaqfdNTZ9zdyRSv8Qf6TlK0XtTa
         eYv3jwhMsU3OTpPwCiM8Fp2Z8NmATg0kUPsXakAuWY4GLkc2kvoLt3VaVsn87ZWSH6us
         KxEli7MlL97qlH4lxIfCRV9oVhrnjXSPFNquGiaPryRd/yBY25QslaikigvkKxbiGUcO
         2BB9QJs1BuxThF8JNbV4VfxLnqyY2xQbnZQhBtKcWihiz+rD2mX7IeYmChNTWrylsOPa
         WyW7uqs0Xek8vBKCBce7J0kFLrc/5l+8H8Y/7DI3O1eevZn+H7YhsGp/E/q+hxFq2YAt
         QVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315901; x=1793920701;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QztNW8xCZa3I237qi38L8jVCSovnxhoFmR6AqIN/+uE=;
        b=RoQ1qQZNG3VZwC0w1xWQyknUFLLAtx8Mq+Fjda/wOw7P5drhXQ06jIWqWpneUosC8g
         g/jzW0kFOLtKPitgMosTP5Jd+v7vjroAQ+PCcdEvxpvPg7opkvXAYCfmdQjTLWgi4fDd
         aeBquG0+hvDSXQvb58zwyFcf4hg3xutHdquypE0gi1E6hsx8ceL/zLZAudI9qtsnLWLP
         9NfFE7/1Cbz9uYFSGKtSt3OfsqhpbrQnuIRpFdMhotx6ONcPlsQo2yQPQGU8Z+JVSgsD
         Fi9FbncP4RD6vXCZ/ZjIRatMQpMBU+yxh8loGsXP+XpbeIERuvv+Rm/lp32dAQcX/3wp
         qHVg==
X-Forwarded-Encrypted: i=1; AKwUvBx7+AsxrG8Y2/l9OLNNbnqN/tGe0e+8QcvwjFmr13YYV8qq/ILugsv6D01oOEVkXP6L4VUPzhiJQLu2T94=@lists.linux.dev
X-Gm-Message-State: AFq9FYJvPAdC5lhknF4UraqfgO9DlrORJ/LN6CvLbhE1KXiB45P65HWt
	KeP63MW18KuSYDoJ9GmCwKqO9mT3w/6LemZsuSHmpdbmid56npRysN0RlF6acqbPkMc=
X-Gm-Gg: AYBFou3gWhYPPd/KipZ7+JDQ7uo86aA4wEdD0rFNdbLpS4X647X3rWz0jRDb/asEhCJ
	t0SGsgw9UZwuc4H3kbuRrSnvQCj2aPygMDyBkjV0TLFf8JwUI+CqdEXlz1wezjuaiwo4Bt1VMkp
	3xJOZ24VWrqbP/77gQxzVA8+u3PjszVkbhoSYY7EHBoGvNmUsWrF1Os4+hCz4XbUKhWaUhRdyiD
	qUP75q9N9SV03B66NWB0ylUwFighvQ8WYFuqEkMHG5n3YHEjmQUMHind2fBviPZ16nSPX281FNH
	Nga0vvzX4NdiUP0Ko8weDZBKfbvJ96W/9uYR6dWMXWBWJ5ySPjYruWqM1lwnB51BK9TTUFwBJ0Y
	sGTe8OGPdK7uYhXxduNmBPb9gWlVIGxpnkkBYcw9G1ZveaZF11/B03VuIPTby0gkcPAzSBAyKui
	1vY3S/XZ3URoAb3+GdH2R92e9klTCGncJ9SXIzq9TO97pB/CBPWiH4r4umPg2iZB38R8m8K8qEo
	CcaKxjVGO4lcWSVfVldOJ6AaaNhx217Z2HU1o/VuGBsxI6sj58plVzqU+eyKmy3ThS41c12Ec25
	1EFkV2RGhU308v9/rDiD8a5dItyuyhAZSfuTT9j0O0DJRTc3XxkxEJ5p6zPJlAbX5E9SUEWHaiO
	fpqb61y41kI8ZJEMWDcUKOy4J4GUfgoAFaw==
X-Received: by 2002:a05:6102:8099:b0:7c3:472d:be6b with SMTP id ada2fe7eead31-7d072d376admr338758137.33.1793315901228;
        Thu, 29 Oct 2026 16:18:21 -0700 (PDT)
Received: from [192.168.15.16] ([2804:1b3:a2c1:77a1:5cd:8fee:f3c:4da7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4e7453sm319509241.11.2026.10.29.16.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:18:20 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Zhenghang Xiao <kipreyyy@gmail.com>,
 Sanghyun Park <sanghyun.park.cnu@gmail.com>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH net 5/5] nfc: st-nci: validate pipe ids in st_nci_hci_load_session()
Date: Thu, 29 Oct 2026 20:17:35 -0300
Message-ID: <179331585573.30322.9370333985353215726@gmail.com>
In-Reply-To: <179331585573.30322.4049957541187612575@gmail.com>
References: <179331585573.30322.4049957541187612575@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

st_nci_hci_load_session() gets the list of open pipes from the
controller and, for each pipe id in it, asks for the pipe information
and records it in ndev->hci_dev->pipes[].  The pipe id is a byte from
the controller and is used as an index into pipes[], which has
NCI_HCI_MAX_PIPES (128) entries, without any check.  For a pipe id of
128 or more that the controller reports as open on one of the known
gates, the gate id and the controller supplied host id are written past
the end of the array, into gate2pipe[].

The pipe information response is not length checked either, so a
short response is read past its end.

Skip pipe ids that do not fit in pipes[] and responses that are
shorter than struct st_nci_pipe_info.

This was pointed out as a pre-existing issue by the sashiko review of an
nfc_hci_create_pipe() fix.

Link: https://lore.kernel.org/all/178952042575.22033.9676833200303972344@kernel.org/
Fixes: 8ae01f796771 ("NFC: st21nfcb: Add support for secure element")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 drivers/nfc/st-nci/se.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index 607ec768e..909fb1493 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -191,6 +191,9 @@ int st_nci_hci_load_session(struct nci_dev *ndev)
 	/* Complete the existing gate_pipe table */
 	for (i = 0; i < skb_pipe_list->len; i++) {
 		pipe_info[2] = skb_pipe_list->data[i];
+		if (pipe_info[2] >= NCI_HCI_MAX_PIPES)
+			continue;
+
 		r = nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
 					ST_NCI_DM_GETINFO, pipe_info,
 					sizeof(pipe_info), &skb_pipe_info);
@@ -198,6 +201,11 @@ int st_nci_hci_load_session(struct nci_dev *ndev)
 		if (r)
 			continue;
 
+		if (skb_pipe_info->len < sizeof(*dm_pipe_info)) {
+			kfree_skb(skb_pipe_info);
+			continue;
+		}
+
 		/*
 		 * Match pipe ID and gate ID
 		 * Output format from ST21NFC_DM_GETINFO is:
-- 
2.43.0

