Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989739;
	b=F2Ngm9/hUG7qYB36rIfxtG5OAanvrTQzg35kyN+0e5XScsyN3xIBGW9HXK6ey4NACZLo
	 Btn7CXzKh8xV0mXAKYc86MKnvayVzTfUUjp9lmERIWpAJ1DHEicatVe27b5oGJkhv+dRn
	 +7pU/gQzUpCBaxpuJhz7QOYSEHMCTx13o6rlFquX/1gK9N/bXIYidYA5HAWgeJsr+6qV8
	 FO3TBd72qT1xo70eKHPm3d3Tvswd9I8h7UML3lD+KBdOPJA8jQAFss2a9MmJPkycfYK3f
	 YRpIdCw5vj3IWEoE2LpxRSbCxZAL5IinBz0AOqR7NQJZNqnN/2uWk8g1YNLyFUiXZ7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zAfQtk8eiwbEkfy0Jgpn2BwM3DzjkAZf+kJnqwT874Y=;
	b=g4U2AOSz+7r38y5RO1Bx8xX6nwz6WxEGTnsYgNd8+i6ks6pQBXrkuQKO4MJzNhl/j46K
	 BvMfz87UhAIYixiyLjEnsCWqDjstW62W971mq7Nr0iNBR/AihrRlkBaSsuQFxj/INgJK1
	 wkIC5AaHKnWlbZv8Gim14b0ngpQ1g9LlrcEfljOBHLA3H1oV/Ky3SzE7n6fqM8XjzWRK4
	 OqUUsivQC2PRgKHr5Lml6uADfoIx70XrIYmQyd86pot7Eld2id/Js+RZSP643ab/RuLhq
	 g4xhsv75JVuIWG9gB17G+nj/+64ljxsitdi69hjAksD7jR1wqXu7XFhmNUWm9ZRi5RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H8VmrgBW;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C162606A337
	for <oe-linux-nfc@lists.linux.dev>; Wed, 18 Nov 2026 08:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C162606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H8VmrgBW
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b3c9820789so388784a91.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 18 Nov 2026 00:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989739; x=1795594539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zAfQtk8eiwbEkfy0Jgpn2BwM3DzjkAZf+kJnqwT874Y=;
        b=H8VmrgBWmgBvMS9IBmfv5dsazzl+c4cOa3XQZzzh9ww7IlaAiU+UqVjgpDQo4gBYK6
         WK7Y3K2HFH8r3Sp6rrJ4SzLVxxHjW77Yx/Utj2s6AcT/vnBD5S0pvLrqd+MCyJbYWlv4
         ohPz3/254Iz8NM2myNZ0M0Gxc2Xijw+SBzjBUllllus9uWdDRFThUZt0G9stz0LxMOWY
         4Nc/Zq4yX7qPquhl4vRocq0ajL+aiQsPMg3pYo1szdxwjFMuDyE016ENd8RIfzYBR+VH
         shKqqgOsNuMefUHq8P81hE6Z1PedNVEiSip/9WAovYcBW12xvf3ngeuUSWe8fIfjFs8w
         du7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989739; x=1795594539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAfQtk8eiwbEkfy0Jgpn2BwM3DzjkAZf+kJnqwT874Y=;
        b=UzzN/63Vj8unnTJbVgng8sWoVkz5Ft69Ku0yGBcxpulVYz24zlPfwY0GFhANHr2sQF
         DNdJGNiluavEUnxfCVzDw/2IyQvHhlLJG7ua+k8KyUaWDmRJN+u58vU3f7hgRbDcugZ9
         nR9uBxFGoqFVF54RPxDtwhT70yvEehwiwW8It+M7KP3WcfjLQNbvwMU+uOWOVoGmyq9x
         6ERnxg8WYmGeWBmMB5aTZtIx21qN8DsTY6w9VN3StzXES5E5+zT9x+QEFjDsgSOAeYFk
         fYSxtziX9PMckaEtSt7fKlfk1cHjSx7f16HxSEMZevOUzvqJMnDDoS+8G000amPVyMRm
         Ct7w==
X-Gm-Message-State: APuU4Z+stWkcw8sFVVUAUIJTv4eGTMPLdNG3X9AMlDqyEa1rMIIIb2ex
	Puy46v1PYh//edZVkLXgGOCtFBB9VofMXyTyb/Haijy8L88O2GDrD1ZXM0Mdzw==
X-Gm-Gg: AZFdTZeZSYyRU9qH2488WBXSZ78Pzn6HZ3jXG/mB/Tpj3yc5c9VlyJj9Fr/l2f81VzW
	S8ffxF+WgoNoQHwRH5EPgxridI6CN8CEN73SlIEkqLYLPvffxmODolWEra1mXfNC2SJLGbA6XsE
	ID9RHSsAJIw3/a6yzUSr+2HiDf3FdiJp28oAmMrb6JP2Lf41v3JFOPix6ObyksuXil5eb781g9O
	GhoU9bDfSYLR3tv98Q2EJSXIvise9wOjxuAgk1jEvArmL6mFQAWfbN5mIO/ViKMLCqj2/eTKEG3
	gZqKNOp+0PMaXVZ24oq5gP+OXpVcRu+IVyvu0u3dLRExlf+9rNqt+JdhSRCLJlSBGZairYQGfUc
	oJdVldmsv3o8JnfCpAjra9HzML7NOhUy1VtdkjlPGoINGhSL7HnMZR/ZTAyju/1hhaQ32tytxQN
	DyomvMqogebn5UsXO2RAoAz/o5x2HAtJdFWChPjEQQBESvRvfh6T3OXMVN8W5GdyD3u/Qtpi976
	UBxYGvE9xcOhZYXvgmdZVp5s8z65IiZWUyYBwwHrXZRuFEsWuKx+EaYxkcquiashOnKk7QNVtqn
	dAEyzi3PeDFdKNqaU3fDFdoFOsVZrtTkYdAgRB8OoEd9k2aXooMzt0oiGaFmR7Yr5q37NogfnBL
	znqTDz5cetQD17U913ITCnRieGyhkevYcoXIT+aFuKO7GXZXtcPNsvP7qhkxvfMaL1RI=
X-Received: by 2002:a17:90b:1644:b0:3a7:e11c:4e6e with SMTP id 98e67ed59e1d1-3b3d07cafe2mr2003848a91.59.1794989738657;
        Wed, 18 Nov 2026 00:15:38 -0800 (PST)
Received: from LAPTOP-3B99V33A ([240c:c983:10:62b2:fcc9:5a45:8cc1:489d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2550e1sm8033364a91.3.2026.11.18.00.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:15:38 -0800 (PST)
From: Bin Luo <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david+nfc@ixit.cz,
	netdev@vger.kernel.org,
	Bin Luo <luob87709@gmail.com>
Subject: [PATCH v2] net/nfc: fix skb ownership on data exchange errors
Date: Wed, 18 Nov 2026 16:15:30 +0800
Message-ID: <20261118081530.32-1-luob87709@gmail.com>
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
Built on Linux v7.4-rc1 commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
with NFC_VIRTUAL_NCI, KASAN, and kmemleak enabled. A QEMU TCG guest ran
32 NCI 1.0 MIFARE exchanges with a nonzero data status. The root harness
provisioned the virtual controller and polling session; each rawsock
exchange ran with effective UID 65534. The baseline reported 48 kmemleak
suspects; the fixed run reported no unreferenced objects and no KASAN
report.

The runtime test covers NCI-to-rawsock only. It did not trigger the LLCP,
Digital DEP, or NCI loopback connection-lookup failure paths.
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
-- 
2.51.0.windows.1

