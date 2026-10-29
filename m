Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315889;
	b=sRi7x1viuaF6dAS7N9RvrsNJ6cmJ/o7af9Ro2zudhtAoxiZ/7z+bwEr7kA5uQfawnGbD
	 UDGRILuMxPHQhVapd2SmU1EmwhW4BVpbDYC048af2C7ixb4HRAhNHBHB5e9/ATdWesogp
	 UC8glj79OUojraK0pDEdh2UGAk0ujRQkO12Yg6qsYHpqiZFLP9rx5YPzGGp50uD8RnKuE
	 K3o6n7WTLFDRfE3Hv2ZTnbB/98s9HPKS68YfQopOfcnnC3E/s1u3dUbYXKnpgcQaJngfR
	 IZdK+1tIruIJ7KYM2vON/BP9/zCnf2MTDQUd8xDeE2Q5mHrl2dz+/9Dt5QoIFoyBsnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Xpiy1fahTzksVX2ucGYHJCrX4DFe6BxdxTQ9XfdjhmY=;
	b=sdfG2fOL15BDAoOSsIf9wEWrjMsJkUlaf00QY3Gl/7u3v2XSxfsNHbzyeaE8GTixneaY
	 ayJVyMbDWzPn2zpkYsIxGjXyvIklnhH3xseSANKYCSgHP7LtvHzW74JB4OecuFsly1Bql
	 94Ffvzj1v8RbdI2Ov6oiGa6pObsBpCX6tq9ccHKh61QeX3B9cKBIurds2HyBUXt7y3UuR
	 fSEhsPHDPbWXoiT0PDmGhq2HvNim5XaS7tg4hslKBw39MAbvfrTMIJOEJgqoKLwEWjidu
	 PhyfPPIvTZHGcWq5hTP6yV9698mZ15PEWCSxTMt5DDU3m32FJVK00i5bZlnR0JekKVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lx8hqgcZ;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC819606A31F
	for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 23:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC819606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lx8hqgcZ
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so74402241.3
        for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 16:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315888; x=1793920688; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xpiy1fahTzksVX2ucGYHJCrX4DFe6BxdxTQ9XfdjhmY=;
        b=Lx8hqgcZC0afmCevTwr9n0DTotGnjHN2RgaBqceTZKIAzTojjuqZAFgBt+XOvsBLwl
         Xj9unExwhqB0mLdYWm2wtPF9UJ5PYNnv3LNTutg/g2Oo3BxqpAZwiDjAPVfRSvRVBnvm
         ofDQC0ZEWpHGd3CoJGQWPiRwF/6C1rPjEmyXdc6nMdafyNnnW9IpH9rNj5qmwSAmkDHE
         z5y1Amemcb4He+ZdbiI6vMagcR4nBFG3+LtdTvjsLdb6riAkI0MxxP5LUM5n9Rl56rXP
         yOtWhWQQnGoF7h6CMGLQm+rXg2Djh9ykLXtnqoYcROqtCU/VfyXdcQTfzd5L/FMA6Atn
         j87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315888; x=1793920688;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xpiy1fahTzksVX2ucGYHJCrX4DFe6BxdxTQ9XfdjhmY=;
        b=ACKkE1utZuOqU61+Yi0J05au66AMHe8eyMafbYagAljNtgcAHASK10R6QsR5t10FTV
         cv5PoRaTE4Uil8Ha2+3PkvbsQvC7lxBiJF4ETDSeWSiOf8QMvr/+pRfO/vHloFjUnb3I
         glsH2c8STAYugptG5QKwbSPU2nldgDPdU7mdxqrSGmbdCma7gFWf6Je5Hg4jilF7h6gR
         4oX4gIaturH8YTwD1SLqi75LxzUwNFAzD4r2ajatZ4TnQa1EUJOhmNN33Ut9/mnle2Le
         hRKaKzgQjM4QN/oqScVLKPqqy0G8aEC3SiP+7YNC0aLySNWComGMIOOwE4scEa7Ppy4h
         BSPA==
X-Forwarded-Encrypted: i=1; AKwUvBzSkq3VyMwnxR+up1PMVkUCedlcDmRU8Pfi+QU2gPoJr621DW3fhMsoCnVd+vcFrG3W6+uxI0aAwbAEkN4=@lists.linux.dev
X-Gm-Message-State: AFq9FYKO++r7vQKpiJj3Usfa6m7FtLn5PAYswpZx2M5XCC8L7xDQ0FXC
	Fa7PxnAgWFwXa9wfkS4dBdCSVj2pNfn2m3/ivH92iA6YIQ8QZpmQ0b6e
X-Gm-Gg: AYBFou0uUEkyBMOmNe8o8EmIDdcMwT+6p3uW8yy2graoBOHw9ce9J7SGIpBJLvwV12x
	wox93Y29RZM5selZ+TX0rVREvDfxY8FfJd0RUfWi7fcxiOtjd253N83MOQ6kcVj/KIcYRCrCWXw
	9ZavqnFYH86MlYceJbIM0s78h3gEfUgGy99Sxa9kYbXycLMUcr0iQCNNL6whSfUdBEzavhCCJub
	WU9FUnXrNrm9MhcLxrFk9pRTotO7GtEYVbChfH7nMsBRHFyjaf2Y583FbBW+EThdRMNXF+q18FL
	NKpINBcRG6lFYBKcKMZXHqR300k5+gB0AMKRJFdURPvFnFnh1CG2AGFPD1Q6BsKxMjXBr61RV5t
	7lZL4y53GEGc4VJUArr1UcckW4TJifDBhCVP9pjRDzQlPCNascoOIkwmBDovRViIe9tqTL/Z7Fb
	gLlwRmW754ytDI4qCAgPPFyMA2qmJawhilFgdoXBULnyDk5lsAv84YgzUV9kIxueRjKOHJ7kSE5
	2McrHpmLdwv8iYbSzE4E8EVyOeIZ2kIM+hwe1iKQVI/L0GfVVRU1Z96n/UZCR6yIfJlH9ZSC0Nr
	OlnNkV/r7S85RAwEYdQ66u/ysCdUjWD2j8NgBzrkftOb1HsfCIkdo4BpSXjHNLf9uWzVmw55TfC
	n/z5tT2vVcJ90RsYROVPwCuokFrr+gk7KFA==
X-Received: by 2002:a67:e112:0:b0:79e:2b00:b4da with SMTP id ada2fe7eead31-7d07262b7c0mr332764137.6.1793315887662;
        Thu, 29 Oct 2026 16:18:07 -0700 (PDT)
Received: from [192.168.15.16] ([2804:1b3:a2c1:77a1:5cd:8fee:f3c:4da7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4e7453sm319509241.11.2026.10.29.16.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:18:07 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Zhenghang Xiao <kipreyyy@gmail.com>,
 Sanghyun Park <sanghyun.park.cnu@gmail.com>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 3/5] nfc: nci: consume the loopback response exactly once
Date: Thu, 29 Oct 2026 20:17:35 -0300
Message-ID: <179331585573.30322.5511229003943288914@gmail.com>
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

nci_nfcc_loopback_cb() stores the received data packet in
conn_info->rx_skb and completes the request, and nci_nfcc_loopback()
returns conn_info->rx_skb to the caller, which frees it.  The pointer
is never cleared.

Any NCI response with a zero status also completes the request, as
nci_req_complete() only checks NCI_REQ_PEND.  If the NFCC sends one
instead of the data packet, nci_nfcc_loopback() returns the skb of the
previous loopback, which was already freed, or NULL.  st_nci_loopback()
then copies skb->data into its vendor command reply and frees the skb
again.

With an emulated NFCC on virtual_ncidev answering the second loopback
with an unsolicited CORE_SET_CONFIG_RSP, nci_nfcc_loopback() returns 0
and the skb of the first loopback, and KASAN reports a
slab-use-after-free as soon as the caller reads it.

Detach the skb from conn_info when consuming it, free it when the
caller does not want it, and return -EPROTO when the request was
completed without a data packet.

Fixes: 1c53855f6be2 ("nfc: nci: Add nci_nfcc_loopback to the nci core")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 net/nfc/nci/core.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 73e3a9647..8e2a755ce 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -428,7 +428,7 @@ int nci_nfcc_loopback(struct nci_dev *ndev, const void *data, size_t data_len,
 	int r;
 	struct nci_loopback_data loopback_data;
 	struct nci_conn_info *conn_info;
-	struct sk_buff *skb;
+	struct sk_buff *skb, *rx_skb;
 	int conn_id = nci_get_conn_info_by_dest_type_params(ndev,
 					NCI_DESTINATION_NFCC_LOOPBACK, NULL);
 
@@ -464,8 +464,20 @@ int nci_nfcc_loopback(struct nci_dev *ndev, const void *data, size_t data_len,
 	ndev->cur_conn_id = conn_id;
 	r = nci_request(ndev, nci_send_data_req, &loopback_data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
-	if (r == NCI_STATUS_OK && resp)
-		*resp = conn_info->rx_skb;
+	if (r == NCI_STATUS_OK) {
+		/* Consume the stored data packet exactly once, see
+		 * nci_nfcc_loopback_cb().
+		 */
+		rx_skb = conn_info->rx_skb;
+		conn_info->rx_skb = NULL;
+		if (!rx_skb)
+			return -EPROTO;
+
+		if (resp)
+			*resp = rx_skb;
+		else
+			kfree_skb(rx_skb);
+	}
 
 	return r;
 }
-- 
2.43.0

