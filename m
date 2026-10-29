Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315882;
	b=rvjvywtblyA6QoEgClZrs38CD17/dN7nO61qOA2Te8/iH4bfnWxuo7pfL2QlM+BGCd84
	 ECghwiuZYomRXCge47/BEofNHrcKsuNPYMsgiMg2B86KCIbbsDslzQLKi6aH+y5pBQ2UU
	 /37BWr+k3KFMRcLGZvZHu+Fyg/rClX3k1yv7PpO/9BJtM6RLvsfEWw7FAwxFyZyDP66rb
	 MT8nabXnI0/eMm5XxQp76Q3tkLhGiIAl/wwyRIO3jR57GGvtmJPInhfjwyMETYXv8l+Vw
	 bBpTUQWjEtQH6wLtNwDmkgWpRzvDQVhrn3W9OuCI7rOC6k/6m1zSXquR1bHE9qy42Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=VJEBWDMH7v0YauO8jc1aAjeLrd7K02JqUE8+SRgJoGA=;
	b=hyViZdYUNNaQhn6RKq70yMAlfrbQKGFg7kIp2U2eYqyokncceNrUNO4pNuKdSG+pzN9f
	 OY6oNeaNHWNV4Q5+o+qb69TaQ7foPI/0offPkAVxZ39bH688Thd7etQkf6NSCcd6Fvz10
	 CKRcLxhou0UsCTt2Rojtm8KxB7EXCEqpmseFdgDkEDnXmyW7/POPHMtPYiOz3OuUWPe4Y
	 tXpVFbXWwFZqWN47fqkHgQkHq2UmP2utH2JO1v4Pi+nSFL1C3AqAkbD03N4LqI5uy5YMx
	 PfywWhUKQJ6Sy1IAcjQFMjJsARyQP6hX74vbOs/+J1PIF7OT7UFWzqYmmQdQqjIEqaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="U+Dn/enL";
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01217606A31A
	for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 23:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01217606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U+Dn/enL
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so87907241.0
        for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 16:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315881; x=1793920681; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VJEBWDMH7v0YauO8jc1aAjeLrd7K02JqUE8+SRgJoGA=;
        b=U+Dn/enLX/ZyWUmjB8Dyi8A4fN2ZCCrMsBs0CiKO16jo7Cx3L7REHrIimWN7uDaTP9
         G7rSkDsGTRr0sXgeCpOubRJHmJNEEYgZiK8+nmV6G6GlAg6Wu6f1PvTv+4NDuYODBaoP
         v6liHSCatNtxHeCk8tR5zrQEguatZ1kUdjLhRQOwqdb6TI0PBK0OCiw97/FhqWc/3x5P
         60Sr2L9ctZ6jwbW65Ovzs7BqQWO++5y6a0VpOyD+T4r76Sb4qrRILkaec2wDM38DAPmX
         ILWVKV7Dd4OdtXuWpRrmit1Kv+9ZV4ooM9ZDdY8rVhPJ0ODnvE3QCcUc0OsU+vFQckOg
         gN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315881; x=1793920681;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJEBWDMH7v0YauO8jc1aAjeLrd7K02JqUE8+SRgJoGA=;
        b=1sYRn4iUNt+KmdEPTy1AabL7j7E5eWt3RM40RBzhPoX37tDr3Gx/mtFcVl5ZqYa4RT
         kK/fk+9gdeQLHP6L7GkO8NEHchnAUCTMsaQBsdFu/9QwSGuwQROymOzL4UKN8izKldR4
         3a7xK3IKGigka5fBJJl0aJZNlcPhNiA74Nj7EKTDbmZsoi69nw5hpNCrZDWJ5TsC/NCh
         sAGr2TlavC/2jeWZuB7peKBwfFGFsKmoOcEmr/bXVwLDpzhb981KTya/Z0n0BqFp9VU3
         Rlg9t01f5ZGJoWKQpc8FwLYon45pzr5caTCavpdNd3dj9sKOB+HXaGeD0XviyxeIfn1R
         oGJw==
X-Forwarded-Encrypted: i=1; AKwUvBxJ19gJEu0XKzCm6P8pL9krnlTXHp/R4AjHEAcjX1n1j7QoJ3ahotGtfvGzh7wpSBwhJL8TGhyNyuURXJo=@lists.linux.dev
X-Gm-Message-State: AFq9FYLsEY/RIeXegiqeR5pUTskpkIMbvZLs7h0Qi5x7TMkY0V44/vMf
	7CqU4u7KBGd+gmX7Hp6qBgMPycpEn0nWIx6NLjPi4wy0BARHXcfYSkdT
X-Gm-Gg: AYBFou3jSGpzsJj2KesV2pn8/jGWE7N9TUkrp/fwTp/1XxmNewGzIf2npcjfUASayH4
	Eb9JFZAXcQQlLyccMr5rkanwWBBjYnjPnEi4juILWkHQMd1XGdZ5Lr1vWRRzSx9w4FNzmpqRMeB
	fuWS8ieVbJ2UXLUkS99ecDJM3M4djTtKQeZHgkxBLltLWe+6+gaecbCxyu67THBdCeBsHQKZny8
	ZTCMiW/0l8kBXIulKnYI64o9XnuuBJbQu/tOiGllRnEihaLMptrlZCBsQoJUFaqKEAHTS2yc0n5
	IeG8tB0oCHs3ea6Qewg55pLi5dKW3OMhUuJ0wfaNId0nXfW0EPbeAAslqUYm6XSQdsZ6oEfKgEV
	fLPf1XFPY192NULEZGZyfXbOK9dGEEkB+q9wt+8X2G3ojxL5OpvC0P315cUEjBolB25gBEX0yq1
	7aZzc4CNfVxJm4pNBdjJomcne89j2s8VGtEig9JnLAqXzY2FT2sUv3BvPC1Fb+zC+sd9G1dVBJk
	bKdY7lAx2pVeD9VOXcRRlWSY7bUgDaQ9lcmQpleKVCBq1o3WhDoF6NDrqbqYLKMNP9xPIYhywtu
	FZ7TDntQZjOy55iYaEi4eZ0/VyJ3fpvGjFI1NzYCZM9Qyc5Imvxg3JbmQ8uV3D4xH1vZTd86iQr
	LQYjO5VcCsRZn
X-Received: by 2002:a05:6102:e09:b0:7cc:2946:7f80 with SMTP id ada2fe7eead31-7d07279aec4mr470867137.35.1793315880853;
        Thu, 29 Oct 2026 16:18:00 -0700 (PDT)
Received: from [192.168.15.16] ([2804:1b3:a2c1:77a1:5cd:8fee:f3c:4da7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4e7453sm319509241.11.2026.10.29.16.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:17:59 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Zhenghang Xiao <kipreyyy@gmail.com>,
 Sanghyun Park <sanghyun.park.cnu@gmail.com>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 2/5] nfc: nci: hci: consume the HCP response exactly once
Date: Thu, 29 Oct 2026 20:17:35 -0300
Message-ID: <179331585573.30322.10620513309471785412@gmail.com>
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

nci_hci_resp_received() stores the HCP response in conn_info->rx_skb
and completes the pending request.  nci_hci_send_cmd(),
nci_hci_set_param() and nci_hci_get_param() then parse conn_info->rx_skb
and hand it to the caller, which frees it, but the pointer is never
cleared.  nci_hci_open_pipe() does not look at the response at all, so
that skb is left in conn_info.

A request is not only completed by a response, though:
nci_hci_hcp_message_rx() also calls nci_req_complete(ndev,
NCI_STATUS_OK) for an HCP command or event received on the connection,
and so does any NCI response with a zero status.  When that happens
while a command is pending, the code above reads, skb_pull()s and
returns whatever conn_info->rx_skb points to: the skb of the previous
response, which the previous caller already freed, or NULL if no
response was stored yet.  The skb is then freed again by the new
caller, e.g. st_nci_hci_load_session() frees every skb it gets from
nci_hci_send_cmd().

With an emulated NFCC on virtual_ncidev answering an
ANY_GET_PARAMETER command with an HCP event instead of a response:

  BUG: KASAN: slab-use-after-free in nci_hci_get_param+0x314/0x34c
  Read of size 8 at addr fff00000c0b31248 by task nfcc_emu/109
  ...
  Freed by task 109:
   kfree_skbmem+0x140/0x1a4
   sk_skb_reason_drop+0xc4/0x398
   ...
  The buggy address belongs to the object at fff00000c0b31180
   which belongs to the cache skbuff_head_cache of size 224

(the free being the previous caller's kfree_skb() of the response it
got), and when no response was stored yet:

  KASAN: null-ptr-deref in range [0x00000000000000c8-0x00000000000000cf]
  pc : nci_hci_get_param+0x1a0/0x34c

Add a helper that detaches the stored response from conn_info, parses
it, and either hands it to the caller or frees it, and return -EPROTO
when the request was completed without a response.  Use it for
nci_hci_open_pipe() as well, like nfc_hci_open_pipe() in the HCI core
does, so that its response is not left behind.

Fixes: 11f54f228643 ("NFC: nci: Add HCI over NCI protocol support")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 net/nfc/nci/hci.c | 83 ++++++++++++++++++++++++++++-------------------
 1 file changed, 49 insertions(+), 34 deletions(-)

diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index c03e8a0bd..bdfe9eee6 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -107,6 +107,38 @@ static int nci_hci_result_to_errno(u8 result)
 	}
 }
 
+/* Take the HCP response stored by nci_hci_resp_received().
+ *
+ * The response skb is detached from conn_info so that it is consumed
+ * exactly once.  A request can also be completed without a response
+ * being stored (an HCP command or event received while the request is
+ * pending, or an unrelated NCI response), so a missing response is an
+ * error rather than a reason to reuse whatever skb was stored last.
+ */
+static int nci_hci_take_resp(struct nci_conn_info *conn_info,
+			     struct sk_buff **skb)
+{
+	const struct nci_hcp_message *message;
+	struct sk_buff *rx_skb;
+	int r;
+
+	rx_skb = conn_info->rx_skb;
+	conn_info->rx_skb = NULL;
+	if (!rx_skb)
+		return -EPROTO;
+
+	message = (struct nci_hcp_message *)rx_skb->data;
+	r = nci_hci_result_to_errno(NCI_HCP_MSG_GET_CMD(message->header));
+	skb_pull(rx_skb, NCI_HCI_HCP_MESSAGE_HEADER_LEN);
+
+	if (!r && skb)
+		*skb = rx_skb;
+	else
+		kfree_skb(rx_skb);
+
+	return r;
+}
+
 /* HCI core */
 static void nci_hci_reset_pipes(struct nci_hci_dev *hdev)
 {
@@ -222,8 +254,7 @@ int nci_hci_send_cmd(struct nci_dev *ndev, u8 gate, u8 cmd,
 		     const u8 *param, size_t param_len,
 		     struct sk_buff **skb)
 {
-	const struct nci_hcp_message *message;
-	const struct nci_conn_info *conn_info;
+	struct nci_conn_info *conn_info;
 	struct nci_data data;
 	int r;
 	u8 pipe = ndev->hci_dev->gate2pipe[gate];
@@ -243,15 +274,8 @@ int nci_hci_send_cmd(struct nci_dev *ndev, u8 gate, u8 cmd,
 
 	r = nci_request(ndev, nci_hci_send_data_req, &data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
-	if (r == NCI_STATUS_OK) {
-		message = (struct nci_hcp_message *)conn_info->rx_skb->data;
-		r = nci_hci_result_to_errno(
-			NCI_HCP_MSG_GET_CMD(message->header));
-		skb_pull(conn_info->rx_skb, NCI_HCI_HCP_MESSAGE_HEADER_LEN);
-
-		if (!r && skb)
-			*skb = conn_info->rx_skb;
-	}
+	if (r == NCI_STATUS_OK)
+		r = nci_hci_take_resp(conn_info, skb);
 
 	return r;
 }
@@ -508,7 +532,8 @@ void nci_hci_data_received_cb(void *context,
 int nci_hci_open_pipe(struct nci_dev *ndev, u8 pipe)
 {
 	struct nci_data data;
-	const struct nci_conn_info *conn_info;
+	struct nci_conn_info *conn_info;
+	int r;
 
 	conn_info = ndev->hci_dev->conn_info;
 	if (!conn_info)
@@ -521,8 +546,12 @@ int nci_hci_open_pipe(struct nci_dev *ndev, u8 pipe)
 	data.data = NULL;
 	data.data_len = 0;
 
-	return nci_request(ndev, nci_hci_send_data_req, &data,
-			   msecs_to_jiffies(NCI_DATA_TIMEOUT));
+	r = nci_request(ndev, nci_hci_send_data_req, &data,
+			msecs_to_jiffies(NCI_DATA_TIMEOUT));
+	if (r == NCI_STATUS_OK)
+		r = nci_hci_take_resp(conn_info, NULL);
+
+	return r;
 }
 EXPORT_SYMBOL(nci_hci_open_pipe);
 
@@ -566,8 +595,7 @@ static int nci_hci_delete_pipe(struct nci_dev *ndev, u8 pipe)
 int nci_hci_set_param(struct nci_dev *ndev, u8 gate, u8 idx,
 		      const u8 *param, size_t param_len)
 {
-	const struct nci_hcp_message *message;
-	const struct nci_conn_info *conn_info;
+	struct nci_conn_info *conn_info;
 	struct nci_data data;
 	int r;
 	u8 *tmp;
@@ -598,12 +626,8 @@ int nci_hci_set_param(struct nci_dev *ndev, u8 gate, u8 idx,
 
 	r = nci_request(ndev, nci_hci_send_data_req, &data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
-	if (r == NCI_STATUS_OK) {
-		message = (struct nci_hcp_message *)conn_info->rx_skb->data;
-		r = nci_hci_result_to_errno(
-			NCI_HCP_MSG_GET_CMD(message->header));
-		skb_pull(conn_info->rx_skb, NCI_HCI_HCP_MESSAGE_HEADER_LEN);
-	}
+	if (r == NCI_STATUS_OK)
+		r = nci_hci_take_resp(conn_info, NULL);
 
 	kfree(tmp);
 	return r;
@@ -613,8 +637,7 @@ EXPORT_SYMBOL(nci_hci_set_param);
 int nci_hci_get_param(struct nci_dev *ndev, u8 gate, u8 idx,
 		      struct sk_buff **skb)
 {
-	const struct nci_hcp_message *message;
-	const struct nci_conn_info *conn_info;
+	struct nci_conn_info *conn_info;
 	struct nci_data data;
 	int r;
 	u8 pipe = ndev->hci_dev->gate2pipe[gate];
@@ -637,16 +660,8 @@ int nci_hci_get_param(struct nci_dev *ndev, u8 gate, u8 idx,
 
 	r = nci_request(ndev, nci_hci_send_data_req, &data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
-
-	if (r == NCI_STATUS_OK) {
-		message = (struct nci_hcp_message *)conn_info->rx_skb->data;
-		r = nci_hci_result_to_errno(
-			NCI_HCP_MSG_GET_CMD(message->header));
-		skb_pull(conn_info->rx_skb, NCI_HCI_HCP_MESSAGE_HEADER_LEN);
-
-		if (!r && skb)
-			*skb = conn_info->rx_skb;
-	}
+	if (r == NCI_STATUS_OK)
+		r = nci_hci_take_resp(conn_info, skb);
 
 	return r;
 }
-- 
2.43.0

