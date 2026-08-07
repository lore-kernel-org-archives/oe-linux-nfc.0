Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45513BCD38
	for <oe-linux-nfc@lists.linux.dev>; Fri,  7 Aug 2026 16:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120160; cv=none; b=cKYWAYyrHUj14NDJUXawyHpMnU/1NckH9R5EBtywnfyj1Kuv/qFg2mRsD3sDZpOP1tRAt8vUkwXcab2J3MgfKAbmqtiOVUrjks/MbIoRnw4XObhTaeIkznQP08FFgq51/IyHZyO3thmZmp9L5o0Ki6/C1RqdYDw14b1Bx8215mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120160; c=relaxed/simple;
	bh=//rpAe3Qqwml6p7iioxSCtRJm4GnWGCuBG+pqN3Xff4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFvpTiermqpr3dxI8w/ugXixCutKp8ymJIsssrWWxmjwJVkOElAUHSOOslzIWlg9RJd0iuo/ryyMUjBLvB+jpmQ+AicKbIpqgXhfCrPWh+bBDTUQiZhq4Zp4kUN8D2oV97Yx/SWFHOQIl/qtF7T2On58Oa1kxSKq8XQ63noQiig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=olU1MzsJ; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="olU1MzsJ"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-38dc4f9462cso1282762a91.0
        for <oe-linux-nfc@lists.linux.dev>; Fri, 07 Aug 2026 09:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1786120158; x=1786724958; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sxt2GxOrc+xCi8Pf5TPqmLwVbPShVG3kpwrPeAQtE40=;
        b=olU1MzsJEAYfqdpP5vhqyCxBOtCQMUdJvUhnrZUApWP8gCOMT9ekb1OX9UU0Ja/MQT
         k+eHGnuqmdKnWXTpEVe9H95vJgKE5Uj8Hv1Ht69bxnXK95Gt/KnVLWKLG5ZPC/59vENV
         J8l8JIxGBhLMYF3t6P56f+5rpkWmPUOZIT84wHrZDPy1S9yWKVTRM7Ygn4SMt5SfZvB4
         lk1WA5dn8q/MufywlbXbf9tUbVDFWvOpeZWfZf2FIjJ0hTUp1IBTp2UzT9NvpqUnIyKB
         SE7p64NJc8PVa6ftgH1LRMSycu1IM6F3zP5GsDYXeDjbeGcI/18Z0JUpa/DL0gFNOFij
         X+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120158; x=1786724958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sxt2GxOrc+xCi8Pf5TPqmLwVbPShVG3kpwrPeAQtE40=;
        b=WZvuHmlnUPvsSE/tW3wwGP/D+Lj0lR3ldVlVEjbu9WOATo4GHMIiDoha7tFkz/GXDl
         4kiSWa+s/xFqb+JgTFS+QjH+dcrPdN/Yug8uDqw+kWFc63yk6zz3WpLbTj/n44Oj7RyK
         p4TAoRh9YEQGjZuZEtnyUESUHOEB6eLu6s2G0steYCanHMLPIMxy+JE+YHneRznD9IB4
         BN8CZm/OZClLgGoQmk6NnINmwP/T0fum34PeifMLynQyHi/BGT/h4/ZA7cmtX+mOYRWC
         nMwv6ba8iwv6nGGYFkgQSOmvfjdOE4BSiE7u8YbNvVeIHsIwvsKTTCeLkgaYBMeyclNT
         ZDCw==
X-Gm-Message-State: AOJu0YzrEc8adtdVsahHD3fymS9V6QJlIZQXVCt73q8qzXP9QW3Mz8WX
	JRNMHJtUCY8HvmUto58eqVQlpCeBPm13JqkpDX/aFFdYY3EXBmV6Rzsr318F29BeC+SJHb4rBe8
	nPe37HEMZdOQ=
X-Gm-Gg: AR+sD13CsD6x9RzrQGPSMSHLRrcV2WgCiEF8i1gWc7wDDzlD8Pw1/4CV076aWh8u8Tq
	oYGyn1CZRlcmOuOoTpgr3z9EvP0eIbdq4ZD2iBniiwYFPwZC7TnqD5D2IWOnyhKSLPPTbULnFOW
	nHZmoYDOKO3fdyxQ1eN0lPzNyM+6hVsJkpc7GAUppkaBBF4mzuAHvsDTrzKA43vpmnDrf0E4M7D
	TggzUpEx1mJoC7aP3jwqWvdjuE1TgH3awfBgKs1+grr1Cw9pxpJnnoXfuBp8z5zVxjvLuIxloMR
	fZfCpJjU9VvZ13G1BXJ9l0Rvk/EssTKsqIUUMICOvu6hLRQc647fFalPBKIRc527CEIIHdSTRrc
	u28s6qYk9wATyWWoKaumnAI1ld6pgu5TNdP6JtfMpUvZ4V0HLraL3zyas8buQXSzg4yD2e5rB+a
	vCU81o7g4XN865c0+O6Z432PY3kUNkwQsh3rz5kA7O7O0KtTjw3q/eVsY=
X-Received: by 2002:a17:90a:ec8e:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-3903c53827bmr26399611a91.2.1786120157909;
        Fri, 07 Aug 2026 09:29:17 -0700 (PDT)
Received: from enjou-Legion-Y7000P-2019 ([165.232.167.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6dfcdsm3179485a91.4.2026.08.07.09.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:29:17 -0700 (PDT)
From: Ren Wei <weir@nebusec.ai>
To: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	pengpeng@iscas.ac.cn,
	kees@kernel.org,
	error27@gmail.com,
	raoxu@uniontech.com,
	dddddd@hust.edu.cn,
	ian.ray@gehealthcare.com,
	joe@dama.to,
	kuniyu@google.com,
	linma@zju.edu.cn,
	vega@nebusec.ai,
	rakukuip@gmail.com,
	weir@nebusec.ai
Subject: [PATCH 1/1] nfc: llcp: Pass caller buffer to nfc_llcp_general_bytes to fix UAF and memory leaks
Date: Sat,  8 Aug 2026 00:28:51 +0800
Message-ID: <006437e618b55acc0df69d94255244a490b11461.1786029423.git.rakukuip@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1786029423.git.rakukuip@gmail.com>
References: <cover.1786029423.git.rakukuip@gmail.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luxiao Xu <rakukuip@gmail.com>

commit 6709d4b7bc2e ("net: nfc: Fix use-after-free caused by nfc_llcp_find_local")
attempted to fix a use-after-free (UAF) issue by
invoking nfc_llcp_local_put(local) after accessing local->gb. However,
if the reference count dropped to zero, local was freed prematurely,
leading to a Use-After-Free when the returned pointer was accessed.
Alternative approaches using dynamic allocation (such as kmemdup) introduced
severe memory leaks and state inconsistency because callers consistently
treated the returned pointer as borrowed memory.

Fix this properly by refactoring nfc_llcp_general_bytes() and
nfc_get_local_general_bytes() to accept a caller-provided output buffer
(out_gb) and its maximum length (gb_max_len). The general bytes are
safely copied into out_gb BEFORE calling nfc_llcp_local_put(local),
ensuring safe lifetime management without ownership transfer complications.

Update all callers across drivers (microread, pn533, pn544, st21nfca,
digital_dep, and nci) to allocate local stack buffers of size
NFC_MAX_GT_LEN and pass them to nfc_get_local_general_bytes().

Fixes: 6709d4b7bc2e ("net: nfc: Fix use-after-free caused by nfc_llcp_find_local")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: Codex:gpt-5.4
Signed-off-by: Luxiao Xu <rakukuip@gmail.com>
Signed-off-by: Ren Wei <weir@nebusec.ai>
---
 drivers/nfc/microread/microread.c |  5 ++---
 drivers/nfc/pn533/pn533.c         | 10 +++++-----
 drivers/nfc/pn533/pn533.h         |  2 +-
 drivers/nfc/pn544/pn544.c         |  7 +++----
 drivers/nfc/st21nfca/core.c       |  5 ++---
 include/net/nfc/hci.h             |  2 +-
 include/net/nfc/nfc.h             |  2 +-
 net/nfc/core.c                    | 10 +++++-----
 net/nfc/digital_dep.c             |  3 ++-
 net/nfc/llcp_core.c               | 18 ++++++++++++------
 net/nfc/nci/core.c                |  3 ++-
 net/nfc/nfc.h                     |  2 +-
 12 files changed, 37 insertions(+), 32 deletions(-)

diff --git a/drivers/nfc/microread/microread.c b/drivers/nfc/microread/microread.c
index 4149c5d735bd..0f0a03da9ff4 100644
--- a/drivers/nfc/microread/microread.c
+++ b/drivers/nfc/microread/microread.c
@@ -251,9 +251,8 @@ static int microread_start_poll(struct nfc_hci_dev *hdev,
 		param[1] |= (1 << 1);
 
 	if ((im_protocols | tm_protocols) & NFC_PROTO_NFC_DEP_MASK) {
-		hdev->gb = nfc_get_local_general_bytes(hdev->ndev,
-						       &hdev->gb_len);
-		if (hdev->gb == NULL || hdev->gb_len == 0) {
+		nfc_get_local_general_bytes(hdev->ndev, hdev->gb, sizeof(hdev->gb), &hdev->gb_len);
+		if (hdev->gb_len == 0) {
 			im_protocols &= ~NFC_PROTO_NFC_DEP_MASK;
 			tm_protocols &= ~NFC_PROTO_NFC_DEP_MASK;
 		}
diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index d7bdbc82e2ba..b3ac3f31518d 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1346,10 +1346,10 @@ static int pn533_poll_dep(struct nfc_dev *nfc_dev)
 	u8 *next, nfcid3[NFC_NFCID3_MAXSIZE];
 	u8 passive_data[PASSIVE_DATA_LEN] = {0x00, 0xff, 0xff, 0x00, 0x3};
 
-	if (!dev->gb) {
-		dev->gb = nfc_get_local_general_bytes(nfc_dev, &dev->gb_len);
+	if (!dev->gb_len) {
+		nfc_get_local_general_bytes(nfc_dev, dev->gb, sizeof(dev->gb), &dev->gb_len);
 
-		if (!dev->gb || !dev->gb_len) {
+		if (!dev->gb_len) {
 			dev->poll_dep = 0;
 			queue_work(dev->wq, &dev->rf_work);
 		}
@@ -1647,8 +1647,8 @@ static int pn533_start_poll(struct nfc_dev *nfc_dev,
 	}
 
 	if (tm_protocols) {
-		dev->gb = nfc_get_local_general_bytes(nfc_dev, &dev->gb_len);
-		if (dev->gb == NULL)
+		nfc_get_local_general_bytes(nfc_dev, dev->gb, sizeof(dev->gb), &dev->gb_len);
+		if (dev->gb_len == 0)
 			tm_protocols = 0;
 	}
 
diff --git a/drivers/nfc/pn533/pn533.h b/drivers/nfc/pn533/pn533.h
index 09e35b8693f5..d3425fcfd557 100644
--- a/drivers/nfc/pn533/pn533.h
+++ b/drivers/nfc/pn533/pn533.h
@@ -166,7 +166,7 @@ struct pn533 {
 	struct timer_list listen_timer;
 	int cancel_listen;
 
-	u8 *gb;
+	u8 gb[NFC_MAX_GT_LEN];
 	size_t gb_len;
 
 	u8 tgt_available_prots;
diff --git a/drivers/nfc/pn544/pn544.c b/drivers/nfc/pn544/pn544.c
index 9d0a16ac465e..098b29d9a68e 100644
--- a/drivers/nfc/pn544/pn544.c
+++ b/drivers/nfc/pn544/pn544.c
@@ -377,10 +377,9 @@ static int pn544_hci_start_poll(struct nfc_hci_dev *hdev,
 		return r;
 
 	if ((im_protocols | tm_protocols) & NFC_PROTO_NFC_DEP_MASK) {
-		hdev->gb = nfc_get_local_general_bytes(hdev->ndev,
-							&hdev->gb_len);
-		pr_debug("generate local bytes %p\n", hdev->gb);
-		if (hdev->gb == NULL || hdev->gb_len == 0) {
+		nfc_get_local_general_bytes(hdev->ndev, hdev->gb, sizeof(hdev->gb), &hdev->gb_len);
+		pr_debug("generate local bytes len %zu\n", hdev->gb_len);
+		if (hdev->gb_len == 0) {
 			im_protocols &= ~NFC_PROTO_NFC_DEP_MASK;
 			tm_protocols &= ~NFC_PROTO_NFC_DEP_MASK;
 		}
diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index fd39a05c9622..0f49bf6af522 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -351,10 +351,9 @@ static int st21nfca_hci_start_poll(struct nfc_hci_dev *hdev,
 			if (r < 0)
 				return r;
 		} else {
-			hdev->gb = nfc_get_local_general_bytes(hdev->ndev,
-							       &hdev->gb_len);
+			nfc_get_local_general_bytes(hdev->ndev, hdev->gb, sizeof(hdev->gb), &hdev->gb_len);
 
-			if (hdev->gb == NULL || hdev->gb_len == 0) {
+			if (hdev->gb_len == 0) {
 				im_protocols &= ~NFC_PROTO_NFC_DEP_MASK;
 				tm_protocols &= ~NFC_PROTO_NFC_DEP_MASK;
 			}
diff --git a/include/net/nfc/hci.h b/include/net/nfc/hci.h
index 756c11084f65..86ed63e5d533 100644
--- a/include/net/nfc/hci.h
+++ b/include/net/nfc/hci.h
@@ -144,7 +144,7 @@ struct nfc_hci_dev {
 	data_exchange_cb_t async_cb;
 	void *async_cb_context;
 
-	u8 *gb;
+	u8 gb[NFC_MAX_GT_LEN];
 	size_t gb_len;
 
 	unsigned long quirks;
diff --git a/include/net/nfc/nfc.h b/include/net/nfc/nfc.h
index c54df042db6b..cfb9111bdf4e 100644
--- a/include/net/nfc/nfc.h
+++ b/include/net/nfc/nfc.h
@@ -273,7 +273,7 @@ struct sk_buff *nfc_alloc_recv_skb(unsigned int size, gfp_t gfp);
 
 int nfc_set_remote_general_bytes(struct nfc_dev *dev,
 				 const u8 *gt, u8 gt_len);
-u8 *nfc_get_local_general_bytes(struct nfc_dev *dev, size_t *gb_len);
+u8 *nfc_get_local_general_bytes(struct nfc_dev *dev, u8 *out_gb, size_t gb_max_len, size_t *gb_len);
 
 int nfc_fw_download_done(struct nfc_dev *dev, const char *firmware_name,
 			 u32 result);
diff --git a/net/nfc/core.c b/net/nfc/core.c
index a92a6566e6a0..af7edf2687ef 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -280,9 +280,9 @@ static struct nfc_target *nfc_find_target(struct nfc_dev *dev, u32 target_idx)
 int nfc_dep_link_up(struct nfc_dev *dev, int target_index, u8 comm_mode)
 {
 	int rc = 0;
-	u8 *gb;
-	size_t gb_len;
 	struct nfc_target *target;
+	u8 gb[NFC_MAX_GT_LEN];
+	size_t gb_len = 0;
 
 	pr_debug("dev_name=%s comm %d\n", dev_name(&dev->dev), comm_mode);
 
@@ -301,7 +301,7 @@ int nfc_dep_link_up(struct nfc_dev *dev, int target_index, u8 comm_mode)
 		goto error;
 	}
 
-	gb = nfc_llcp_general_bytes(dev, &gb_len);
+	nfc_get_local_general_bytes(dev, gb, sizeof(gb), &gb_len);
 	if (gb_len > NFC_MAX_GT_LEN) {
 		rc = -EINVAL;
 		goto error;
@@ -644,11 +644,11 @@ int nfc_set_remote_general_bytes(struct nfc_dev *dev, const u8 *gb, u8 gb_len)
 }
 EXPORT_SYMBOL(nfc_set_remote_general_bytes);
 
-u8 *nfc_get_local_general_bytes(struct nfc_dev *dev, size_t *gb_len)
+u8 *nfc_get_local_general_bytes(struct nfc_dev *dev, u8 *out_gb, size_t gb_max_len, size_t *gb_len)
 {
 	pr_debug("dev_name=%s\n", dev_name(&dev->dev));
 
-	return nfc_llcp_general_bytes(dev, gb_len);
+	return nfc_llcp_general_bytes(dev, out_gb, gb_max_len, gb_len);
 }
 EXPORT_SYMBOL(nfc_get_local_general_bytes);
 
diff --git a/net/nfc/digital_dep.c b/net/nfc/digital_dep.c
index 3982fa084737..a0218497e82d 100644
--- a/net/nfc/digital_dep.c
+++ b/net/nfc/digital_dep.c
@@ -1490,12 +1490,13 @@ static int digital_tg_send_atr_res(struct nfc_digital_dev *ddev,
 				   struct digital_atr_req *atr_req)
 {
 	struct digital_atr_res *atr_res;
+	u8 local_gb[NFC_MAX_GT_LEN];
 	struct sk_buff *skb;
 	u8 *gb, payload_bits;
 	size_t gb_len;
 	int rc;
 
-	gb = nfc_get_local_general_bytes(ddev->nfc_dev, &gb_len);
+	gb = nfc_get_local_general_bytes(ddev->nfc_dev, local_gb, sizeof(local_gb), &gb_len);
 	if (!gb)
 		gb_len = 0;
 
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index dc65c719f35f..1ed0ecde5872 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -635,23 +635,29 @@ static int nfc_llcp_build_gb(struct nfc_llcp_local *local)
 	return ret;
 }
 
-u8 *nfc_llcp_general_bytes(struct nfc_dev *dev, size_t *general_bytes_len)
+u8 *nfc_llcp_general_bytes(struct nfc_dev *dev, u8 *out_gb, size_t gb_max_len, size_t *general_bytes_len)
 {
 	struct nfc_llcp_local *local;
 
+	if (!out_gb || !general_bytes_len)
+		return NULL;
+
+	*general_bytes_len = 0;
+
 	local = nfc_llcp_find_local(dev);
-	if (local == NULL) {
-		*general_bytes_len = 0;
+	if (local == NULL)
 		return NULL;
-	}
 
 	nfc_llcp_build_gb(local);
 
-	*general_bytes_len = local->gb_len;
+	if (local->gb && local->gb_len) {
+		*general_bytes_len = min_t(size_t, local->gb_len, gb_max_len);
+		memcpy(out_gb, local->gb, *general_bytes_len);
+	}
 
 	nfc_llcp_local_put(local);
 
-	return local->gb;
+	return out_gb;
 }
 
 int nfc_llcp_set_remote_gb(struct nfc_dev *dev, const u8 *gb, u8 gb_len)
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 5f46c4b5720f..d27fe4f8456a 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -780,9 +780,10 @@ static int nci_set_local_general_bytes(struct nfc_dev *nfc_dev)
 {
 	struct nci_dev *ndev = nfc_get_drvdata(nfc_dev);
 	struct nci_set_config_param param;
+	u8 local_gb[NFC_MAX_GT_LEN];
 	int rc;
 
-	param.val = nfc_get_local_general_bytes(nfc_dev, &param.len);
+	param.val = nfc_get_local_general_bytes(nfc_dev, local_gb, sizeof(local_gb), &param.len);
 	if ((param.val == NULL) || (param.len == 0))
 		return 0;
 
diff --git a/net/nfc/nfc.h b/net/nfc/nfc.h
index 0b1e6466f4fb..6caec88f7400 100644
--- a/net/nfc/nfc.h
+++ b/net/nfc/nfc.h
@@ -49,7 +49,7 @@ void nfc_llcp_mac_is_up(struct nfc_dev *dev, u32 target_idx,
 int nfc_llcp_register_device(struct nfc_dev *dev);
 void nfc_llcp_unregister_device(struct nfc_dev *dev);
 int nfc_llcp_set_remote_gb(struct nfc_dev *dev, const u8 *gb, u8 gb_len);
-u8 *nfc_llcp_general_bytes(struct nfc_dev *dev, size_t *general_bytes_len);
+u8 *nfc_llcp_general_bytes(struct nfc_dev *dev, u8 *out_gb, size_t gb_max_len, size_t *general_bytes_len);
 int nfc_llcp_data_received(struct nfc_dev *dev, struct sk_buff *skb);
 struct nfc_llcp_local *nfc_llcp_find_local(struct nfc_dev *dev);
 int nfc_llcp_local_put(struct nfc_llcp_local *local);
-- 
2.43.0
