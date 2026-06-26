Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584553E958C
	for <oe-linux-nfc@lists.linux.dev>; Fri, 26 Jun 2026 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782464613; cv=none; b=t1BFZ2F6wyljunEenldU6CuXTnKZB3zXr+sDmkBlcqvGtO5b+POCFtkpC4jhnRujUHdzxXhgdwp2SdSxzp21ZK99Ye9d/oBFLMxhes5MNMshPmJxWLrC/iFSWR2Hv3J5ZjCU9XGt6ykxZTCkIs8gfjABbzL4rDFSajyp//os2Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782464613; c=relaxed/simple;
	bh=0M0mxNXpHFTkb8lNX2bKAWdZx27Ftz5ouO/m70GPZoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F/MyxFrdq0nKEQ2+xZXb5KWJmOavze+cmLhIJZMsDbBb1FXQuTA2o2Jqph/ohIPFfv17VjNDeafgYHc4R2mo7plZ6BBEhAsxYg5ZuMDDLQ5gbLI/pDMimnPmr93iHB2FN8Ym2m4ntcB7SprxRy6HVX2SQ5zq1NpuR+yDxNBY2mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=TlvVd0Z7; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="TlvVd0Z7"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bebb72b845aso119365766b.3
        for <oe-linux-nfc@lists.linux.dev>; Fri, 26 Jun 2026 02:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1782464606; x=1783069406; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/NKt0Mt/SHh0nM9NlYpItPXQZdY1JVeNAiPrcQ3UdMg=;
        b=TlvVd0Z7aFUvoU522vYR/b0osTCr3Zi8Z9rcEVP1dsGR5N5bekZwFTvJ4q6/YW7EgK
         F/+u7aXg6IbhKxJO4G8jYujd6FQA2+c40gzVr8AsG8V9huj6nm80O5nJosSIq5PTUdzM
         SJBmpGlWXyE5EIkTKbQ+KaOqsCLE4FAqoMaKtlm9CS2ufPHtAB1V/Fx5H/gDuvWckOAe
         DRL7nnS4MrMkfgJEqHuwP+JeK7quYp0bvG8fMvsRVR8TlmJUrmYNlkdbap6vjb5+WeT9
         mu2Iix/ncQIBhqxr+0VwNgIsm/MTGlGCfz8iKKU1of3Jn1BH5dL3XHLnrY3d+V9GsHFr
         DZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782464606; x=1783069406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NKt0Mt/SHh0nM9NlYpItPXQZdY1JVeNAiPrcQ3UdMg=;
        b=EnN7c/2iV13qwvUK7lxz/ZKaeQcttRcCxwEa0kUCBdLa4IV1vhUGGSPwUKEVufYmGp
         Fuv7E4AWa6PSxTHKNJX7yq4WlQo3AFK7e+GAjRm5v0Mq5aIZTeEgEKMiHkh4VZjXrQJ3
         zUsIBRE6VxaCOZsnCyu0dx4Lde1Vh37EO4p+E5997TEBJ2FLVCjHIPooiUu3p2myINe4
         o4DWZQABjMmfmn6jMY67VHGuf4Afl0b9HmDH/d3vyb1aEsTxuZOLlWs10Vw81tz57ViV
         hZbRg7uPwmCYSeGZYLoTfQL3oLw+6QTR22SBZzRWvnh3AMgfyZJiFuwycvEI0NUP/8L4
         SQbw==
X-Forwarded-Encrypted: i=1; AHgh+RqxfruiNAPFwxfOMYXtBAvQHQiH91cfVvuwqXSDXUsGtNm3I+ZXPhv9YkCED4+KidgMMNbM/eQV6mCQ/wE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKytvhlOX0DrhzNxnJKFbuWNEXikWStEIcDKL/Q4is0RHT43WI
	KmiQm1HI9aztMzyltbzTFqbNzG5MsbOO1kOsdbT/1hoeyDh5ZWpWzJB6GKLf81nq3JuY
X-Gm-Gg: AfdE7cnG6mbFTLMZuQ8PD9EhxrHGz9ccmMh1rGbqWko7pRz5mLi5Aq9EedloxHzK32G
	Vr3apnEBgtrdkmjXIgN3PZDm3ADWPAoV3d2twsbKaqLZi8fRn+rqSB6+eHUWM7JU4I7/kbsThon
	UjCdrQF7jQbvq0Hg9u81tpu1jRPVR9nQJEGuh3Odnf5iX07nbOY2arUi3qJBZ7FaHkTFgagBE5/
	F02sCyJWaRu6+vY0PdyaaGeIn6BrDRIlhPyq02LonYjp+8vKIyJ+SJ2Fm0iqougTQ3C73uTJl6A
	E1zBha6vY9JbsrLzqhFTkSIRkajhmkKQiF70uIGf3ue3ClPYQ496etIA8HmU91ofXZ5vDRRzzPo
	JXPgUVxmx1krmVDuyS5rSAYhyex4VQPZviBP5qNPqn49EBvlUqRZygG/qwRXaXvRq/IKMMmkOOP
	xq
X-Received: by 2002:a17:907:26c4:b0:c12:15b5:8773 with SMTP id a640c23a62f3a-c1215b5a71amr250832366b.6.1782464605602;
        Fri, 26 Jun 2026 02:03:25 -0700 (PDT)
Received: from localhost ([2a06:61c2:d427:0:b321:1c7a:b072:326e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05b6dsm317589066b.37.2026.06.26.02.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:03:25 -0700 (PDT)
From: Samuel Page <sam@bynar.io>
To: David Heidelberg <david@ixit.cz>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v2] nfc: nci: fix uninit-value in the RF discover/activated NTF handlers
Date: Fri, 26 Jun 2026 10:03:01 +0100
Message-ID: <20260626090301.2139500-1-sam@bynar.io>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nci_rf_discover_ntf_packet() and nci_rf_intf_activated_ntf_packet() each
parse a notification into an on-stack struct (nci_rf_discover_ntf /
nci_rf_intf_activated_ntf) that is not initialised. The RF
technology-specific parameters are only extracted when
rf_tech_specific_params_len is non-zero, so a notification that reports a
zero length leaves the rf_tech_specific_params union uninitialised - and
both handlers then pass it to nci_add_new_protocol(), which reads it:

 - discover:  nci_add_new_target() -> nci_add_new_protocol();
 - activated: nci_target_auto_activated() -> nci_add_new_protocol().

nci_add_new_protocol() uses nfca_poll->nfcid1_len as both a branch
condition and a memcpy() length and copies nfcid1/sens_res/sel_res into
ndev->targets, which is later exposed to user space via NFC_CMD_GET_TARGET.

  BUG: KMSAN: uninit-value in nci_add_new_protocol+0x624/0x6c0
   nci_add_new_protocol+0x624/0x6c0
   nci_ntf_packet+0x25b2/0x3c30
   nci_rx_work+0x318/0x5d0
   process_scheduled_works+0x84b/0x17a0
   worker_thread+0xc10/0x11b0
   kthread+0x376/0x500
  Local variable ntf.i created at:
   nci_ntf_packet+0xbc2/0x3c30

Zero-initialise both on-stack notifications so the union reads back as
zero when no technology-specific parameters are present.

Fixes: 019c4fbaa790 ("NFC: Add NCI multiple targets support")
Fixes: e8c0dacd9836 ("NFC: Update names and structs to NCI spec 1.0 d18")
Link: https://lore.kernel.org/netdev/20260623172109.1105965-2-horms@kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: Bynario AI
Signed-off-by: Samuel Page <sam@bynar.io>
---
v2: Drop the inaccurate activation_params / NFC_ATTR_TARGET_ATS scenario
    from the commit message. No code change; the ntf = {} fix is unchanged.

 net/nfc/nci/ntf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index c96512bb8653..274d9a4202c9 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -440,7 +440,7 @@ void nci_clear_target_list(struct nci_dev *ndev)
 static int nci_rf_discover_ntf_packet(struct nci_dev *ndev,
 				      const struct sk_buff *skb)
 {
-	struct nci_rf_discover_ntf ntf;
+	struct nci_rf_discover_ntf ntf = {};
 	const __u8 *data;
 	bool add_target = true;
 
@@ -688,7 +688,7 @@ static int nci_rf_intf_activated_ntf_packet(struct nci_dev *ndev,
 					    const struct sk_buff *skb)
 {
 	struct nci_conn_info *conn_info;
-	struct nci_rf_intf_activated_ntf ntf;
+	struct nci_rf_intf_activated_ntf ntf = {};
 	const __u8 *data;
 	int err = NCI_STATUS_OK;
 

base-commit: 02f144fbb4c86c360495d33debe307cb46a57f95
-- 
2.54.0

