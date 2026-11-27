Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786848;
	b=gxQKh6dN+rDC2jy0AJ1Ah2zx/0SrzcHoIQGw1nXCrxHVkcbYMJUXZIAPx0JYxSgUsnMw
	 HOQJ1r6TPssj8kT/7EtJM2TeyE22VRVdWwLCc93Gcd3uTSr7W4dAld2Ig67Z0teJhA7nn
	 2C8rP06Gdox6nK4cWZn+RQ9utYYPSRLFiTcy4U7ZuQqBcZa+bOGMXhf3If/CMmd8Qbwzc
	 loW01ORLDGhapDcGovFq3pJt5dUk8e5L231l5594W8Dd1KwohTUa2/vh7e7W7AP3LkuYt
	 2Z7n2xJjHbdknB5KIVd7ZOXcGagBo2OJEgRppt+sN3EKlHxtZ9YszpJD1xl/8/BHWCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Sua3zmSI3nL9OitX0T3+r5SPaTOlATxaZ+LIkj+VHWQ=;
	b=mbk+NB4XJHFuSFKg7vrWPfUI4mZ9811wO3eMQ5QoCqyjbQhGtl+I+k8EyC/D9dw8jRNU
	 3HRbdRh1o1QUiyu2AHlWTz2igRjzV1uchWKWP3GPOZ6E0lNHNUrelw3bNStSMsy6NOUnj
	 9BOWtOfcQNf2/EnvGtlt810Edest4eNQLHAyWVOTuDuMgPlzg8C8dDF1pPqnJdZK3LXxx
	 EblEprxsNCxD2gxiSXZ+jZqZYcV8H8cIwECc8lGmzJbPBaNNSaicu6wZgt7MEX+fTtF/8
	 v8RUAR0zqcCPutpCO60iqsAixzX31BmMZlDHB3PxRDHmbqIMSi6d3rhFqPNaBVzuVaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UdDE+9H1;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DD6606A321
	for <oe-linux-nfc@lists.linux.dev>; Fri, 27 Nov 2026 13:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DD6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UdDE+9H1
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8c4cc85a315so5317226b3a.0
        for <oe-linux-nfc@lists.linux.dev>; Fri, 27 Nov 2026 05:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786848; x=1796391648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sua3zmSI3nL9OitX0T3+r5SPaTOlATxaZ+LIkj+VHWQ=;
        b=UdDE+9H1GsLp6p8Z277EmJ5DUUrGxV23wb11m5xcPyxjK68yURZqSghXdzp4Vhqku0
         PdYkW+aaExLkbqrjKN0pvdLN3XRiCiBznE+o1SXmx7QtZ4N+trAAZqvTuOEdTXJnY5lC
         ppU9PRB1BpCMz9MpGRwrcHKdxQuLuI4AzQ59slLkU33nOpEqWmlem34338/VRhyO0al+
         xjpaZdhiZnr3ZFuBedNkLKtMAw9R3rTulaPvuJW0K3mtPvm6gr6kQPN4vRat4ZuLZEGL
         r4z9DDYctdXU87ON36aBVYwu7PcD6CF/suVbDkwhoH1ydJzX/BdvHAB+AFp80J+eYomp
         E8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786848; x=1796391648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sua3zmSI3nL9OitX0T3+r5SPaTOlATxaZ+LIkj+VHWQ=;
        b=zLy9f04fkDpO4p3UzEvXJA9InKvwJ94puX+Dta5a5tga2bv51D2JznEBBDzNJaZy5N
         Oc5IinAdm3XMYi+m1/XitbmIdllf7AIhh5bY/5SdvsZGYPyCO7XFJ02Oi9eHjywCFNDY
         xFC3i1UKK64RS9QuSNFbpUx+Uiif6Kl/N3BqFQYHClHniQfOeWoLBBnI+CnZrkxsVphF
         m5eneuBYBesFVodA+xuAXryi2xZTgtYWeYq8xlSFkfwr3Q28qspayeS67N9yAQQWwcHi
         qLhyoArWO1BdcEVQPHuyTcIHB12Y+76B2008EzNgtQ7WIkxFNfaR8oDN2dEzjTtDeki/
         mAoA==
X-Gm-Message-State: APuU4Z+/JuaRrtxuNo5wluKohMuYwCGNGDLNfKaYRS/tS/3izNEIbJVC
	IUhcQw2F1zK5jjya17nw4clrvDqAi+tTCWh71wMi6pHns7cd0ebfFMgr8ABhffSCjdIywxR0
X-Gm-Gg: AZFdTZeBZoYzmixfk0Q2DGHy7b9kL21OsgfCw/3h2Kz75COxZ723e97Udb12X3neOgV
	sWk/JccPx3rw7j75ibUOBMeIlm5V183phGfl0+Ro5Rzc6De7dNibYISwcJsEhHW6Bq58iwr6McT
	ZzwqB0dyWp6LCl9rsRCou/39OebjROCrGamPWLsoefoyOcpIJyEely+EqfLbqJ92RemcXNJiRYq
	aghkPIGErbBSpJw7a8/ip0lMBOqoGKutQPfFilvIsdonmpl1kbPRKZqbrR4o5TINtUrn2mV1AvS
	6sm1OJdn1rnX8saxaf9dc66ffrpXjVq2SJGHMNGIB82KwgXtCMu1IeCB95dbdfBR4Lso1vxt7k/
	azUnpDQd9m1+NuvQqMTAi4ZZNDSo8k0LPqRLRwdslnLvXAwv5pBfcnCfn/nWCk+6j/VpSPdHbEc
	OB9srUkEfKx120QCgNyN9MK1/KpfB6IoIFp+8h2hDWLd1N/+ejEgxA/IVfRUxyF1KnwNnft7kdl
	JUNPgKKltLw+eroN52zJs6xvj/W8EPKyNGUdm/nu4ZXnrD/CaKU5+XgjcfWBBpaVJj+Da9WZq9E
	ZqdGLuW3khUnz1c8PkQDQnoeuHXtnF8VnFXqDqL5DpEj3+TMi/ZwAiUaAnYaKQ8XZ5UKKYC7qIH
	fT+DYDZX2gOvnsaEC1pV6yLvuinP5c7ZDHjlFnQEbudPF/Sy4cLeOjQuDcGeuw30tA6jjRTrIw3
	kVEg32Sso1agQhoXGNge81+aTvQgNDTwCzSulRtcE=
X-Received: by 2002:a05:6a00:13a4:b0:886:3827:c4a2 with SMTP id d2e1a72fcca58-8c8792b5df2mr22233457b3a.3.1795786847901;
        Fri, 27 Nov 2026 05:40:47 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285b60csm12705838b3a.9.2026.11.27.05.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:40:47 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 3/5] nfc: digital: complete DEP data exchange on terminal errors
Date: Fri, 27 Nov 2026 21:40:27 +0800
Message-ID: <20261127134029.1813-4-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261127134029.1813-1-luob87709@gmail.com>
References: <20261127134029.1813-1-luob87709@gmail.com>
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In digital_in_recv_dep_res(), terminal error branches jumped to the
error label, bypassing data_exch->cb(). For callers such as AF_NFC raw
sockets, missing the completion callback leaves the exchange hung,
leaks the socket reference, and leaves tx_work_scheduled set.

Route terminal errors through the exit label so data_exch->cb() is
always invoked, and drop the redundant kfree_skb(resp) because the
callback owns any non-NULL resp skb under the data_exchange_cb_t
contract.

Found by static call-chain audit and code inspection.

Fixes: 7d0911c02fa2 ("NFC Digital: Add initiator NFC-DEP support")
Cc: stable@vger.kernel.org
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
 net/nfc/digital_dep.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/net/nfc/digital_dep.c b/net/nfc/digital_dep.c
index 968547c..cd6eff0 100644
--- a/net/nfc/digital_dep.c
+++ b/net/nfc/digital_dep.c
@@ -703,7 +703,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 
 			rc = digital_in_send_nack(ddev, data_exch);
 			if (rc)
-				goto error;
+				goto exit;
 
 			return;
 		} else if ((rc == -ETIMEDOUT) &&
@@ -712,7 +712,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 
 			rc = digital_in_send_atn(ddev, data_exch);
 			if (rc)
-				goto error;
+				goto exit;
 
 			return;
 		}
@@ -734,7 +734,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 
 			rc = digital_in_send_nack(ddev, data_exch);
 			if (rc)
-				goto error;
+				goto exit;
 
 			kfree_skb(resp);
 
@@ -742,7 +742,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 		}
 
 		PROTOCOL_ERR("14.4.1.6");
-		goto error;
+		goto exit;
 	}
 
 	ddev->atn_count = 0;
@@ -759,7 +759,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 	if (resp->len < size || dep_res->dir != DIGITAL_NFC_DEP_FRAME_DIR_IN ||
 	    dep_res->cmd != DIGITAL_CMD_DEP_RES) {
 		rc = -EIO;
-		goto error;
+		goto exit;
 	}
 
 	pfb = dep_res->pfb;
@@ -767,7 +767,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 	if (DIGITAL_NFC_DEP_DID_BIT_SET(pfb)) {
 		PROTOCOL_ERR("14.8.2.1");
 		rc = -EIO;
-		goto error;
+		goto exit;
 	}
 
 	if (DIGITAL_NFC_DEP_NAD_BIT_SET(pfb)) {
@@ -777,7 +777,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 
 	if (size > resp->len) {
 		rc = -EIO;
-		goto error;
+		goto exit;
 	}
 
 	skb_pull(resp, size);
@@ -787,7 +787,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 		if (DIGITAL_NFC_DEP_PFB_PNI(pfb) != ddev->curr_nfc_dep_pni) {
 			PROTOCOL_ERR("14.12.3.3");
 			rc = -EIO;
-			goto error;
+			goto exit;
 		}
 
 		ddev->curr_nfc_dep_pni =
@@ -802,7 +802,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 		if (IS_ERR(resp)) {
 			rc = PTR_ERR(resp);
 			resp = NULL;
-			goto error;
+			goto exit;
 		}
 
 		/* If resp is NULL then we're still chaining so return and
@@ -847,7 +847,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 					     ddev->chaining_skb,
 					     ddev->data_exch);
 		if (rc)
-			goto error;
+			goto exit;
 
 		goto free_resp;
 
@@ -855,7 +855,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 		if (!DIGITAL_NFC_DEP_PFB_IS_TIMEOUT(pfb)) { /* ATN */
 			rc = digital_in_send_saved_skb(ddev, data_exch);
 			if (rc)
-				goto error;
+				goto exit;
 
 			goto free_resp;
 		}
@@ -863,19 +863,19 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 		if (ddev->atn_count || ddev->nack_count) {
 			PROTOCOL_ERR("14.12.4.4");
 			rc = -EIO;
-			goto error;
+			goto exit;
 		}
 
 		rtox = DIGITAL_NFC_DEP_RTOX_VALUE(resp->data[0]);
 		if (!rtox || rtox > DIGITAL_NFC_DEP_RTOX_MAX) {
 			PROTOCOL_ERR("14.8.4.1");
 			rc = -EIO;
-			goto error;
+			goto exit;
 		}
 
 		rc = digital_in_send_rtox(ddev, data_exch, rtox);
 		if (rc)
-			goto error;
+			goto exit;
 
 		goto free_resp;
 	}
@@ -883,7 +883,6 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 exit:
 	data_exch->cb(data_exch->cb_context, resp, rc);
 
-error:
 	kfree(data_exch);
 
 	kfree_skb(ddev->chaining_skb);
@@ -892,9 +891,6 @@ error:
 	kfree_skb(ddev->saved_skb);
 	ddev->saved_skb = NULL;
 
-	if (rc)
-		kfree_skb(resp);
-
 	return;
 
 free_resp:
-- 
2.51.0.windows.1

