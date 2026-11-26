Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675163;
	b=WYLHJCfH53xWuM+q/ewmy6IxPM9w585Odq3oBAhkdrU7UmnGizPr6ZGXvoRpdrPLODxD
	 h/qClP7jB8T463dvgO1XOlSU5jR2LIbFQdXqbd8fDhUJhOovd4jCL4ryu3UD7oDer/Awa
	 O5fPkRef/qD+RM1BzTcssbn/9JRr8LwVzPwmQognrj3iZki0TkiTcxTH0ysoihhUWk751
	 sXNbCnoSkuxRf5PeJroytqQZOCU4vNntPbjwgaVHSWeMcznVHR9DDe7m/LvFa2950a+Rx
	 bQUngjmHfIA5GvHcqrfyMsgDayl8NBgp9rCDlhkB8476I7LYamAmKr+/9aMSmM05mJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rDF4LZ4UOZ2hwh2BmiCUeJUef6OXuhfM4eKgzjZtZJI=;
	b=efywqERiejUBZ8GE03UOTYLgu4FTn9pLdIuk31tIapVOeY8bi4ODLNSb5yJg2EIxxw2d
	 p4MmIrsuiT3b9oc3bVRoW9skHF0Oi7W0zwNVCYqaH6uEutcGyfPLV4HnM0RXHJxWEfETF
	 1eOM+APgACLLp7shDUilSmMUlQtbZOnr3UV8m+6gZ4h1Hi5Ko6qRfql2lG9cjjwwx6mRq
	 th21Ysa+gp5dq1a8HTZbAvZWZoxKWSeWrsXvv4LyE3aDqxViMOlVfUT3cpUn198CeNoMl
	 JxAowhxIi0LEjOUSPPPEZk0VMZCfI+nCZ4UdxxcQKo1/ZSgf0PgIW3qz7UFuOCml6MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hPqtmbdp;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CE0606A31C
	for <oe-linux-nfc@lists.linux.dev>; Thu, 26 Nov 2026 06:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3CE0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hPqtmbdp
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3863db981d4so9383925eec.0
        for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Nov 2026 22:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675162; x=1796279962; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDF4LZ4UOZ2hwh2BmiCUeJUef6OXuhfM4eKgzjZtZJI=;
        b=hPqtmbdppxu/UD4yeIYupoCDT6Jw245mnz/7DetJ/TYya+FhF1LYQx8jpq7AAEQ2Jb
         6C9znETasZHFrSDy/NzvoWgyiWAzC1+AVOxFPVbjCxwe1iSO2QlNXxdx5Z0nI2D4WU2N
         gZMAFN3dHbsEwR5FGVEZFcnC896QYlOzm1liW3d8jBMBAZM+YH8PjW+/x+y71UkQ4Grf
         byAZUqseyI+fb8Cv3xtHlh8Bo2zrN3/A9tBpoLP26LtrNOWLzUTm1UBa4mO6+79p3EBw
         refZfDNpUXtA38SSeTa8OHUUJmpHoObD3v3kAeKEbvkFVNTZlAa/2vivrFANvVdumtvp
         ckvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675162; x=1796279962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rDF4LZ4UOZ2hwh2BmiCUeJUef6OXuhfM4eKgzjZtZJI=;
        b=Of9h3E5p5G01n/toEXwbxIkE6vfCFYkzoEanO/MIvYVyZhONWVcAm55npwrd/UhF3B
         OJsQN/CPUG49MhtJ+nt8yxbF1oDLiOPAJbcmkz6bT03zphM1MOuhfFAWn6XBCgEI8n5M
         I1x1BHeH1J6P3RUxGRVsR/1MmD0ywjj0sJFArm72GpZN6WewfxlpXQqvxzB1fepuzdAr
         2LKocnqPArpZrBmt8YGajsPLzp6BMPkngALaDPbjtOEI40DZRmirZZxw8AGsE8b0pxny
         eDUnztlWrvdrynwc7TMP/iZKjfTy3uLNkQCeSw9SWAC6Z83RBFhClvlVcB3qeuteu/0u
         juHA==
X-Gm-Message-State: APuU4Z9ORN3l3UCngVE9YkCBVi3MR+uScJ7+iEfBULT2nndZv1l9ilwa
	ZAiiacOEL3nPoK1OlLDNHOXR0q0HyBZ3RJCDLqF3Q+gB2ycfxdhYjl4AjDKrFrQl+VvzbInKAPY
	=
X-Gm-Gg: AZFdTZfsJeJKp1ZMJtEiG9knH68zzLqKt7lsh4t24ZiEWqmCfIuVkpganUiHjEAioX5
	k57B0CrPlU27/0ta+Ehs9R8824jEZ3BuYfHn2iCss3xjdTbkV+Wdo1s7qmQJcL0TgcByWKgxGhv
	3VJEzMlXb0T78sCH/hZtgJmdHBT3AM0ZKiNA+9K78A+al7RJ+3HNBVQhDiobqcdVvVivsbeH9HJ
	fV7NvIlqJtPbreWf2HKUCj7fEnig8OO+VEPac+65zG3oxj6v4qxoEcDjghfs85UCFf2U557quwV
	I/Huwo1sItuS3rhzOCqRz8hNroo7i4iRjcjp3rUl2+SlSlOROqlNSqlSjjk1rjF+/G6MnqZNRD4
	mrtGeRDaAE00exWheqC/571Pr5b5qbO2eiF4ByRZix+sKUix6W3wjAvIlh7a2F6A2LGwiKVo4Ws
	vlPv+beNLSbplZ69vyi6BKG8wzKpZBwxIAcYKhg29W225MmJPZyXpFqaMAcFqEq3u+PaiWcKZVm
	DWhsj3lCz3nDb77gceztV0msdFo+LtwmBXyi7LSgEZy7dmMxDIDyILJwE2BQkIO7JxZq+2fAl4d
	ZmMjHvBcG9czm7YLwZtWQe+Ho9Fp7FfyM1Bzh/fFIjkYU6D8pONIMdyWichM7UPQ5JI4wa7fBsF
	BGttE9kejyZ7X0H8nGcJLd5sTxYiPzZYq4WtW/MeucqYXwxNPegJ+Owy8ivbwrvOST9s/QFHt9d
	4fZzuf6b4KOSWP2zPH4P6F6K4kcE6xrYpCaSCYXeLT8Gb7V3WQtZ179QiRvrGliHg=
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr13116225eec.8.1795675161914;
        Wed, 25 Nov 2026 22:39:21 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-3-38-183-164.ap-northeast-2.compute.amazonaws.com. [3.38.183.164])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm55404015eec.13.2026.11.25.22.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:39:21 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4 1/2] net/nfc: fix skb ownership on data exchange errors
Date: Thu, 26 Nov 2026 14:39:10 +0800
Message-ID: <20261126063911.353-2-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261126063911.353-1-luob87709@gmail.com>
References: <20261126063911.353-1-luob87709@gmail.com>
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

NFC data_exchange_cb_t callbacks may receive a non-NULL response skb
together with a nonzero error. Because callback ownership was not
documented, several consumers and wrapper callbacks return on error
without freeing that skb, leaking the response buffer on failed
exchanges (including rawsock, LLCP, HCI wrappers, ST21NFCA, Microread,
PN544, and NCI loopback/HCI callbacks).

Document the data_exchange_cb_t ownership contract so callbacks always
own a non-NULL skb regardless of err, and update affected paths:

- Free non-NULL skbs on error paths in rawsock, LLCP, HCI/NCI-HCI
  wrappers, ST21NFCA, Microread, and PN544.
- Handle nonzero errors in nci_nfcc_loopback_cb() by freeing skb and
  failing the pending NCI request instead of reporting NCI_STATUS_OK.
- Route terminal Digital DEP errors through the registered completion
  callback so callers always receive completion and own resp.
- Drop partial NCI rx_data_reassembly fragments on data-status errors,
  interface errors, and data-exchange timeouts so stale fragments are
  neither leaked nor prepended to later responses.
- Splice queued HCI/NCI-HCI rx_hcp_frags onto a local sk_buff_head
  under rx_hcp_frags.lock before walking/reassembling so concurrent
  error purges cannot race with skb_queue_walk(), and purge partial
  fragments on error.
- Clear resp after queueing it to dev->resp_q in PN533 so subsequent
  error handling cannot free an already queued skb.

Fixes: 98ff416f97c5 ("NFC: nci: Add status byte management in case of error.")
Fixes: 1c53855f6be2 ("nfc: nci: Add nci_nfcc_loopback to the nci core")
Fixes: c4bf98b220cb ("NFC: Add NCI data exchange timer")
Cc: stable@vger.kernel.org
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
 drivers/nfc/microread/microread.c |  3 +--
 drivers/nfc/pn533/pn533.c         |  1 +
 drivers/nfc/pn544/pn544.c         |  3 +--
 drivers/nfc/st21nfca/core.c       |  3 +--
 drivers/nfc/st21nfca/dep.c        | 26 ++++++++++++-------------
 include/net/nfc/nfc.h             |  5 ++++-
 net/nfc/digital_dep.c             | 32 ++++++++++++++-----------------
 net/nfc/hci/core.c                | 25 +++++++++++++++++-------
 net/nfc/llcp_core.c               |  4 +++-
 net/nfc/nci/core.c                | 15 ++++++++++++++-
 net/nfc/nci/data.c                |  2 ++
 net/nfc/nci/hci.c                 | 23 +++++++++++++++++-----
 net/nfc/nci/ntf.c                 |  5 ++++-
 net/nfc/rawsock.c                 |  5 ++++-
 14 files changed, 98 insertions(+), 54 deletions(-)

diff --git a/drivers/nfc/microread/microread.c b/drivers/nfc/microread/microread.c
index 2bfafa9..f221ec7 100644
--- a/drivers/nfc/microread/microread.c
+++ b/drivers/nfc/microread/microread.c
@@ -383,8 +383,7 @@ static void microread_im_transceive_cb(void *context, struct sk_buff *skb,
 		info->async_cb(info->async_cb_context, skb, err);
 		break;
 	default:
-		if (err == 0)
-			kfree_skb(skb);
+		kfree_skb(skb);
 		break;
 	}
 }
diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index b0133e5..f7bdc07 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -2138,6 +2138,7 @@ static int pn533_data_exchange_complete(struct pn533 *dev, void *_arg,
 	}
 
 	skb_queue_tail(&dev->resp_q, resp);
+	resp = NULL;
 
 	if (mi) {
 		dev->cmd_complete_mi_arg = arg;
diff --git a/drivers/nfc/pn544/pn544.c b/drivers/nfc/pn544/pn544.c
index c4fa70e..82f7107 100644
--- a/drivers/nfc/pn544/pn544.c
+++ b/drivers/nfc/pn544/pn544.c
@@ -581,8 +581,7 @@ static void pn544_hci_data_exchange_cb(void *context, struct sk_buff *skb,
 		info->async_cb(info->async_cb_context, skb, err);
 		break;
 	default:
-		if (err == 0)
-			kfree_skb(skb);
+		kfree_skb(skb);
 		break;
 	}
 }
diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index b5c1ca3..68327ca 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -743,8 +743,7 @@ static void st21nfca_hci_data_exchange_cb(void *context, struct sk_buff *skb,
 		info->async_cb(info->async_cb_context, skb, err);
 		break;
 	default:
-		if (err == 0)
-			kfree_skb(skb);
+		kfree_skb(skb);
 		break;
 	}
 }
diff --git a/drivers/nfc/st21nfca/dep.c b/drivers/nfc/st21nfca/dep.c
index a5fab4f..c907b6e 100644
--- a/drivers/nfc/st21nfca/dep.c
+++ b/drivers/nfc/st21nfca/dep.c
@@ -449,11 +449,10 @@ static void st21nfca_im_recv_atr_res_cb(void *context, struct sk_buff *skb,
 	struct st21nfca_atr_res *atr_res;
 	int r;
 
-	if (err != 0)
-		return;
-
 	if (!skb)
 		return;
+	if (err)
+		goto out;
 
 	switch (info->async_cb_type) {
 	case ST21NFCA_CB_TYPE_READER_F:
@@ -463,7 +462,7 @@ static void st21nfca_im_recv_atr_res_cb(void *context, struct sk_buff *skb,
 				atr_res->gbi,
 				skb->len - sizeof(struct st21nfca_atr_res));
 		if (r < 0)
-			return;
+			goto out;
 
 		if (atr_res->to >= 0x0e)
 			info->dep_info.to = 0x0e;
@@ -475,7 +474,7 @@ static void st21nfca_im_recv_atr_res_cb(void *context, struct sk_buff *skb,
 		r = nfc_dep_link_is_up(info->hdev->ndev, info->dep_info.idx,
 					NFC_COMM_PASSIVE, NFC_RF_INITIATOR);
 		if (r < 0)
-			return;
+			goto out;
 
 		info->dep_info.curr_nfc_dep_pni = 0;
 		if (ST21NFCA_PP2LRI(atr_res->ppi) != info->dep_info.lri)
@@ -484,9 +483,11 @@ static void st21nfca_im_recv_atr_res_cb(void *context, struct sk_buff *skb,
 						ST21NFCA_PP2LRI(atr_res->ppi));
 		break;
 	default:
-		kfree_skb(skb);
 		break;
 	}
+
+out:
+	kfree_skb(skb);
 }
 
 int st21nfca_im_send_atr_req(struct nfc_hci_dev *hdev, u8 *gb, size_t gb_len)
@@ -561,11 +562,10 @@ static void st21nfca_im_recv_dep_res_cb(void *context, struct sk_buff *skb,
 
 	int size;
 
-	if (err != 0)
-		return;
-
 	if (!skb)
 		return;
+	if (err)
+		goto exit;
 
 	switch (info->async_cb_type) {
 	case ST21NFCA_CB_TYPE_READER_F:
@@ -596,7 +596,7 @@ static void st21nfca_im_recv_dep_res_cb(void *context, struct sk_buff *skb,
 			size++;
 			skb_pull(skb, size);
 			nfc_tm_data_received(info->hdev->ndev, skb);
-			break;
+			return;
 		case ST21NFCA_NFC_DEP_PFB_SUPERVISOR_PDU:
 			pr_err("Received a SUPERVISOR PDU\n");
 			skb_pull(skb, size);
@@ -606,10 +606,10 @@ static void st21nfca_im_recv_dep_res_cb(void *context, struct sk_buff *skb,
 			*(u8 *)skb_push(skb, 1) = info->dep_info.to | 0x10;
 
 			st21nfca_im_send_pdu(info, skb);
-			break;
+			return;
+		default:
+			goto exit;
 		}
-
-		return;
 	default:
 		break;
 	}
diff --git a/include/net/nfc/nfc.h b/include/net/nfc/nfc.h
index bcafab5..bdf2ac3 100644
--- a/include/net/nfc/nfc.h
+++ b/include/net/nfc/nfc.h
@@ -31,12 +31,15 @@ struct nfc_dev;
  * data_exchange_cb_t - Definition of nfc_data_exchange callback
  *
  * @context: nfc_data_exchange cb_context parameter
- * @skb: response data
+ * @skb: response data, owned by the callback if non-NULL
  * @err: If an error has occurred during data exchange, it is the
  *	error number. Zero means no error.
  *
  * When a rx or tx package is lost or corrupted or the target gets out
  * of the operating field, err is -EIO.
+ * If skb is non-NULL, the callback owns it regardless of err and must free
+ * or otherwise consume it. Providers must not access or free it after the
+ * callback returns.
  */
 typedef void (*data_exchange_cb_t)(void *context, struct sk_buff *skb,
 								int err);
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
diff --git a/net/nfc/hci/core.c b/net/nfc/hci/core.c
index ba6f031..1b43f1e 100644
--- a/net/nfc/hci/core.c
+++ b/net/nfc/hci/core.c
@@ -713,8 +713,7 @@ static void hci_transceive_cb(void *context, struct sk_buff *skb, int err)
 		hdev->async_cb(hdev->async_cb_context, skb, err);
 		break;
 	default:
-		if (err == 0)
-			kfree_skb(skb);
+		kfree_skb(skb);
 		break;
 	}
 }
@@ -833,6 +832,7 @@ static int hci_se_io(struct nfc_dev *nfc_dev, u32 se_idx,
 
 static void nfc_hci_failure(struct nfc_hci_dev *hdev, int err)
 {
+	skb_queue_purge(&hdev->rx_hcp_frags);
 	mutex_lock(&hdev->msg_tx_mutex);
 
 	if (hdev->cmd_pending_msg == NULL) {
@@ -859,9 +859,12 @@ static void nfc_hci_recv_from_llc(struct nfc_hci_dev *hdev, struct sk_buff *skb)
 	struct sk_buff *hcp_skb;
 	u8 pipe;
 	struct sk_buff *frag_skb;
+	struct sk_buff_head frags;
+	unsigned long flags;
 	int msg_len;
 
 	if (!pskb_may_pull(skb, NFC_HCI_HCP_PACKET_HEADER_LEN)) {
+		skb_queue_purge(&hdev->rx_hcp_frags);
 		kfree_skb(skb);
 		return;
 	}
@@ -873,12 +876,19 @@ static void nfc_hci_recv_from_llc(struct nfc_hci_dev *hdev, struct sk_buff *skb)
 	}
 
 	/* it's the last fragment. Does it need re-aggregation? */
-	if (skb_queue_len(&hdev->rx_hcp_frags)) {
+	__skb_queue_head_init(&frags);
+	spin_lock_irqsave(&hdev->rx_hcp_frags.lock, flags);
+	if (!skb_queue_empty(&hdev->rx_hcp_frags)) {
+		__skb_queue_tail(&hdev->rx_hcp_frags, skb);
+		skb_queue_splice_init(&hdev->rx_hcp_frags, &frags);
+	}
+	spin_unlock_irqrestore(&hdev->rx_hcp_frags.lock, flags);
+
+	if (!skb_queue_empty(&frags)) {
 		pipe = packet->header & NFC_HCI_FRAGMENT;
-		skb_queue_tail(&hdev->rx_hcp_frags, skb);
 
 		msg_len = 0;
-		skb_queue_walk(&hdev->rx_hcp_frags, frag_skb) {
+		skb_queue_walk(&frags, frag_skb) {
 			msg_len += (frag_skb->len -
 				    NFC_HCI_HCP_PACKET_HEADER_LEN);
 		}
@@ -886,20 +896,21 @@ static void nfc_hci_recv_from_llc(struct nfc_hci_dev *hdev, struct sk_buff *skb)
 		hcp_skb = nfc_alloc_recv_skb(NFC_HCI_HCP_PACKET_HEADER_LEN +
 					     msg_len, GFP_KERNEL);
 		if (hcp_skb == NULL) {
+			__skb_queue_purge(&frags);
 			nfc_hci_failure(hdev, -ENOMEM);
 			return;
 		}
 
 		skb_put_u8(hcp_skb, pipe);
 
-		skb_queue_walk(&hdev->rx_hcp_frags, frag_skb) {
+		skb_queue_walk(&frags, frag_skb) {
 			msg_len = frag_skb->len - NFC_HCI_HCP_PACKET_HEADER_LEN;
 			skb_put_data(hcp_skb,
 				     frag_skb->data + NFC_HCI_HCP_PACKET_HEADER_LEN,
 				     msg_len);
 		}
 
-		skb_queue_purge(&hdev->rx_hcp_frags);
+		__skb_queue_purge(&frags);
 	} else {
 		packet->header &= NFC_HCI_FRAGMENT;
 		hcp_skb = skb;
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf817..0736a0e 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1636,8 +1636,10 @@ void nfc_llcp_recv(void *data, struct sk_buff *skb, int err)
 {
 	struct nfc_llcp_local *local = (struct nfc_llcp_local *) data;
 
-	if (err < 0) {
+	if (err) {
 		pr_err("LLCP PDU receive err %d\n", err);
+		if (skb)
+			kfree_skb(skb);
 		return;
 	}
 
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 73e3a96..f2b3137 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -411,8 +411,18 @@ static void nci_nfcc_loopback_cb(void *context, struct sk_buff *skb, int err)
 	struct nci_dev *ndev = (struct nci_dev *)context;
 	struct nci_conn_info *conn_info;
 
+	if (err) {
+		kfree_skb(skb);
+		if (err < 0)
+			nci_req_cancel(ndev, -err);
+		else
+			nci_req_complete(ndev, NCI_STATUS_FAILED);
+		return;
+	}
+
 	conn_info = nci_get_conn_info_by_conn_id(ndev, ndev->cur_conn_id);
 	if (!conn_info) {
+		kfree_skb(skb);
 		nci_req_complete(ndev, NCI_STATUS_REJECTED);
 		return;
 	}
@@ -1597,10 +1607,13 @@ static void nci_rx_work(struct work_struct *work)
 	/* check if a data exchange timeout has occurred */
 	if (test_bit(NCI_DATA_EXCHANGE_TO, &ndev->flags)) {
 		/* complete the data exchange transaction, if exists */
-		if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags))
+		if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags)) {
+			kfree_skb(ndev->rx_data_reassembly);
+			ndev->rx_data_reassembly = NULL;
 			nci_data_exchange_complete(ndev, NULL,
 						   ndev->cur_conn_id,
 						   -ETIMEDOUT);
+		}
 
 		clear_bit(NCI_DATA_EXCHANGE_TO, &ndev->flags);
 	}
diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 4253ede..3bbebb9 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -220,6 +220,8 @@ static void nci_add_rx_data_frag(struct nci_dev *ndev,
 
 	if (status) {
 		err = status;
+		kfree_skb(ndev->rx_data_reassembly);
+		ndev->rx_data_reassembly = NULL;
 		goto exit;
 	}
 
diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index c03e8a0..aca05ca 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -432,14 +432,19 @@ void nci_hci_data_received_cb(void *context,
 	u8 pipe, type;
 	struct sk_buff *hcp_skb;
 	struct sk_buff *frag_skb;
+	struct sk_buff_head frags;
+	unsigned long flags;
 	int msg_len;
 
 	if (err) {
+		skb_queue_purge(&ndev->hci_dev->rx_hcp_frags);
+		kfree_skb(skb);
 		nci_req_complete(ndev, err);
 		return;
 	}
 
 	if (!pskb_may_pull(skb, NCI_HCI_HCP_PACKET_HEADER_LEN)) {
+		skb_queue_purge(&ndev->hci_dev->rx_hcp_frags);
 		kfree_skb(skb);
 		return;
 	}
@@ -451,12 +456,19 @@ void nci_hci_data_received_cb(void *context,
 	}
 
 	/* it's the last fragment. Does it need re-aggregation? */
-	if (skb_queue_len(&ndev->hci_dev->rx_hcp_frags)) {
+	__skb_queue_head_init(&frags);
+	spin_lock_irqsave(&ndev->hci_dev->rx_hcp_frags.lock, flags);
+	if (!skb_queue_empty(&ndev->hci_dev->rx_hcp_frags)) {
+		__skb_queue_tail(&ndev->hci_dev->rx_hcp_frags, skb);
+		skb_queue_splice_init(&ndev->hci_dev->rx_hcp_frags, &frags);
+	}
+	spin_unlock_irqrestore(&ndev->hci_dev->rx_hcp_frags.lock, flags);
+
+	if (!skb_queue_empty(&frags)) {
 		pipe = NCI_HCP_MSG_GET_PIPE(packet->header);
-		skb_queue_tail(&ndev->hci_dev->rx_hcp_frags, skb);
 
 		msg_len = 0;
-		skb_queue_walk(&ndev->hci_dev->rx_hcp_frags, frag_skb) {
+		skb_queue_walk(&frags, frag_skb) {
 			msg_len += (frag_skb->len -
 				    NCI_HCI_HCP_PACKET_HEADER_LEN);
 		}
@@ -464,20 +476,21 @@ void nci_hci_data_received_cb(void *context,
 		hcp_skb = nfc_alloc_recv_skb(NCI_HCI_HCP_PACKET_HEADER_LEN +
 					     msg_len, GFP_KERNEL);
 		if (!hcp_skb) {
+			__skb_queue_purge(&frags);
 			nci_req_complete(ndev, -ENOMEM);
 			return;
 		}
 
 		skb_put_u8(hcp_skb, pipe);
 
-		skb_queue_walk(&ndev->hci_dev->rx_hcp_frags, frag_skb) {
+		skb_queue_walk(&frags, frag_skb) {
 			msg_len = frag_skb->len - NCI_HCI_HCP_PACKET_HEADER_LEN;
 			skb_put_data(hcp_skb,
 				     frag_skb->data + NCI_HCI_HCP_PACKET_HEADER_LEN,
 				     msg_len);
 		}
 
-		skb_queue_purge(&ndev->hci_dev->rx_hcp_frags);
+		__skb_queue_purge(&frags);
 	} else {
 		packet->header &= NCI_HCI_FRAGMENT;
 		hcp_skb = skb;
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index f5c9a8a..2149383 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -133,8 +133,11 @@ static int nci_core_conn_intf_error_ntf_packet(struct nci_dev *ndev,
 	pr_debug("status 0x%x, conn_id %d\n", ntf->status, ntf->conn_id);
 
 	/* complete the data exchange transaction, if exists */
-	if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags))
+	if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags)) {
+		kfree_skb(ndev->rx_data_reassembly);
+		ndev->rx_data_reassembly = NULL;
 		nci_data_exchange_complete(ndev, NULL, ntf->conn_id, -EIO);
+	}
 
 	return 0;
 }
diff --git a/net/nfc/rawsock.c b/net/nfc/rawsock.c
index f7d7a59..3bf65b1 100644
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
2.43.0

