Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989630;
	b=bZf17xJbQ86A9lGrxhw6EhejlkUhoE8mYaj2S5PE8PvtP0RBKWBPgkilfGgV36Oc68e5
	 5n89JjTOA09B5KXY/JT7gcWyL5Kvj5d2RT6Adq4LdvmPKA1Y4SInIeiy4oGDT39mLEGhn
	 +JgmRonwiDmN76pf4mDVpmDredmfeLQfK1v9QZQARL/z+BxjKaQjeRY3YSrJbx4dW7aCo
	 XCHjna//6CzaSd50Lt8+97utSDW3YZnS87Bt2LesfFeSII6m9JzvyuXvYT/5CnW1hVXpY
	 dx4c6Ui2zGPKdkgyArOwRq5U70Q4GK9UgKOtYNjb4JrggmORbfCUkyWFbproc2ARPDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=t4Ktyk770oXAGuQam8qgSxAjxXyC+FyRLT8hbvMUFqo=;
	b=d7WR6EGvS6/A6aeRU9aSfYKDkCw99hNqXCoQ5fLiCnyWbe5qijKjpPQd6FSIZdIKhOJE
	 J7Zqq/W/58F22VlCnfPrhutSiwBKDvU8ESBvOYR/Gv1GyWqrVVS84xLNMPHAwJ82nH4uJ
	 9WkQcWteOBnhKZFmDFzv0Gr0v5hvb7gYtkAly9lfDCKL7t5MUHBdyB+TUDC9g0vfG7q5V
	 zvoiE9LN14LlFoSHnRpmkV23g+LmbwFRmxEXVJyC4od5nwpegpsnolns3A4Y5qASwC+1S
	 URtO9NAZor/X90//PJBS7AP/xrQGt9uDXp1Dsn+JbP+udIcONQPq4YCJvQVh/G+tsow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UZ64VZfE;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A06606A33B
	for <oe-linux-nfc@lists.linux.dev>; Wed, 18 Nov 2026 08:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48A06606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UZ64VZfE
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so312145b3a.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 18 Nov 2026 00:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989629; x=1795594429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4Ktyk770oXAGuQam8qgSxAjxXyC+FyRLT8hbvMUFqo=;
        b=UZ64VZfE+NeY4LXU9HopmRr03keCrd0KcgartdAAcHuJQx8Vdfbu1Fs1hxch/3s8s8
         50Fqz+Tj5bFbwNdxHyTmmrKK92tRlOdRnsEr79vL5DoVPqmxX1tTVfg3Hcrc5uDe/h6H
         5MYPfNbVG6j9KaEV4ZiDQKWq03E2vjhbVOZFapDUDlGTSzw0nB80qQLkaIyCv544LmS2
         e+0C38KvbbK1VQ4JYtnSTG7cYVzz4aEWjKdOWwAanm/6cEyKzSxlLmUHfLpfmkxJSJ01
         w8Uv9vOPRqvlYYeHmheDMj12X/vLZt1ubihxaBOmWeoh4HJqUWo0DPtJWh0tmO9u5LO/
         gkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989629; x=1795594429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4Ktyk770oXAGuQam8qgSxAjxXyC+FyRLT8hbvMUFqo=;
        b=1yIYRO9Eh0rGZT5q0Al51vTtIR5hk2Qd+e8bD0rgrHUoUGxpVTK05bTVUwz84n0lyl
         86+cRfL9XDFsAB5CLbpCrfFDU/IDkcP81qsTck1JxDerD8dnvHs6qYyOB39BQ/GbLDT2
         o8i9QVgWLgqiArc9uyEl7KdNpNaB6r+Ve4lQOfKgwCDO3KIwQPGKNGyYN4AeyzrP/65b
         hP4mI5hwHRTZTh9RattGOlhNTb5aKfp1FQPHK9W8xtR6qXcu+saIc5C2LA++hWf9Zcnr
         kELiM08eD1AorkyMQHK/Q/MFmBIU1bY4/rc0eNsnIV19nMspYrpbTKMmBoETfuwwuo6N
         HIcQ==
X-Gm-Message-State: APuU4Z+5H37KJedlRW4EKtprf0uRJ/TbGnkfH5fD93a740SmimDIF+k4
	1Ia0eS0b7TBi/sjmAW5vNFwo7+6+guwKiuw7tREEGofZmjJ3RttSncBVBmCj6A1LlzsEjQ==
X-Gm-Gg: AYBFou0AxtiZG8biK2+mcUOvnvaiHqqe0T5+A9h675qtA7XrEBUL1s6h2sICZ9vGAZz
	aRaZJK5cb5ryTjaG104vvithtHSW0d4hi0n+YnNawsboSt7WanOwMlkqmkCt2r5E5mdOu2s5Cjs
	rf7MxlWLR9yLt3HKLhOCRrm7adqBlVVyTE5ujzxbiOWnEuJD8XhmaSIrUZsvH6wVKmTPmNYfBYa
	jbpK/2osWtGve1bzfsKPH8DSNTxn6dpuL6idiJSwA6BsxtvaoIeK9y6/j7QXXnX0O+311/ehRvV
	N1oc8+C9IQtifDLY5YbJT3ybOUxY4XLefgU5c55Fu6fDxvCLTHVCDcKSWM19zrYGf06nXLZrsnV
	ZV3X1jRA/HF4bsw++8JIkusiazNes0vZHuoCVVsI/nY522WaLyOjr4EDzEE1hwbt+iHouxJK7bn
	IA3rreGa7OVCZ6Hb39lbqq6eYnv6MGXDK2MFS5MmvhcTgVnpeXLhLGGS48hFQ7cibYnFRjA0NLN
	gOwXeE7B93RV8iBHGegStbMRBj4fAGPw2vOlj4O6A5qUZQZAy83d2X7H3XndEbjCAeBYpfoLVIi
	rsUqx/mGU9GZ3zuhjG8MeEUHWGiLY0fdWIA6QxZDcgyqv80kvRXoSiCp3c4k2d2FK0tEM00yEyQ
	rr+zVLzptspVV2p2Gf0HQMpVCSGPW3vLh9k8htucOhA3wXZ6Cr/ovpOiHdytZB0Yqz+VAwBzl1f
	04xHgHj/Y3qMpqTunPvTM=
X-Received: by 2002:a05:6a00:a28:b0:8b5:9654:d340 with SMTP id d2e1a72fcca58-8c5d42eff9amr1473706b3a.33.1794989629507;
        Wed, 18 Nov 2026 00:13:49 -0800 (PST)
Received: from LAPTOP-3B99V33A ([218.194.44.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cac8fe3csm763993b3a.21.2026.11.18.00.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:13:48 -0800 (PST)
From: Bin Luo <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david+nfc@ixit.cz,
	netdev@vger.kernel.org,
	Bin Luo <luob87709@gmail.com>
Subject: [PATCH] net/nfc: fix skb ownership on data exchange errors
Date: Wed, 18 Nov 2026 16:13:41 +0800
Message-ID: <20261118081341.1514-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

NFC data exchange callbacks may receive a non-NULL response skb together
with an error. The ownership of the skb is not documented, causing the
rawsock and LLCP error paths to return without freeing it. Digital DEP
also frees the response after invoking the callback, which conflicts
with callback ownership.

Document that the callback takes ownership of a non-NULL skb regardless
of err. Free it on the rawsock and LLCP error paths, clear the Digital
DEP response pointer after the callback, and release the skb when the
NCI loopback connection lookup fails.

Signed-off-by: Bin Luo <luob87709@gmail.com>
---
 include/net/nfc/nfc.h | 2 ++
 net/nfc/digital_dep.c | 1 +
 net/nfc/llcp_core.c   | 2 ++
 net/nfc/nci/core.c    | 1 +
 net/nfc/rawsock.c     | 5 ++++-
 5 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/net/nfc/nfc.h b/include/net/nfc/nfc.h
index bcafab5c5..d3c2d6735 100644
--- a/include/net/nfc/nfc.h
+++ b/include/net/nfc/nfc.h
@@ -37,6 +37,8 @@ struct nfc_dev;
  *
  * When a rx or tx package is lost or corrupted or the target gets out
  * of the operating field, err is -EIO.
+ * If skb is non-NULL, ownership is transferred to the callback regardless
+ * of err. Providers must not access or free skb after invoking the callback.
  */
 typedef void (*data_exchange_cb_t)(void *context, struct sk_buff *skb,
 								int err);
diff --git a/net/nfc/digital_dep.c b/net/nfc/digital_dep.c
index 968547c30..c7f5378cd 100644
--- a/net/nfc/digital_dep.c
+++ b/net/nfc/digital_dep.c
@@ -882,6 +882,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 
 exit:
 	data_exch->cb(data_exch->cb_context, resp, rc);
+	resp = NULL;
 
 error:
 	kfree(data_exch);
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf81700..3619e12b3 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1638,6 +1638,8 @@ void nfc_llcp_recv(void *data, struct sk_buff *skb, int err)
 
 	if (err < 0) {
 		pr_err("LLCP PDU receive err %d\n", err);
+		if (skb)
+			kfree_skb(skb);
 		return;
 	}
 
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 73e3a9647..678f744a2 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -413,6 +413,7 @@ static void nci_nfcc_loopback_cb(void *context, struct sk_buff *skb, int err)
 
 	conn_info = nci_get_conn_info_by_conn_id(ndev, ndev->cur_conn_id);
 	if (!conn_info) {
+		kfree_skb(skb);
 		nci_req_complete(ndev, NCI_STATUS_REJECTED);
 		return;
 	}
diff --git a/net/nfc/rawsock.c b/net/nfc/rawsock.c
index f7d7a599f..3bf65b1fb 100644
--- a/net/nfc/rawsock.c
+++ b/net/nfc/rawsock.c
@@ -156,8 +156,11 @@ static void rawsock_data_exchange_complete(void *context, struct sk_buff *skb,
 
 	pr_debug("sk=%p err=%d\n", sk, err);
 
-	if (err)
+	if (err) {
+		if (skb)
+			kfree_skb(skb);
 		goto error;
+	}
 
 	err = rawsock_add_header(skb);
 	if (err)
