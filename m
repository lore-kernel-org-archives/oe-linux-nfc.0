Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BC7470128
	for <oe-linux-nfc@lists.linux.dev>; Mon, 14 Sep 2026 12:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387898; cv=none; b=msvSTPXC2aGTWxhvhXwhUnF/EicErvC/S5S1QvZYpYDBKJEOZ76BprFKog7m/RM7iYkTVS3us3Cm3fheKWofaO/iFcw6rWfJifLOPlmJkmTNgh9DOriXNsM7RBnlEfoL4mzGVxBxmIavE2zA4wBirpSfTvWFgYSt1JsDwecGQSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387898; c=relaxed/simple;
	bh=1PVRB8TUPBWVirpsxM6OHF6ZhUdGDDcHgqxr8lIBT7w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JzLNP2028FuKS95wU4ujXBHpKDiZYn0wWdilNUbwMmC6sb6YL2Yrw7wLAlGdj6SF1g9xyc9Qp/jCN3v+MNIfO+v9XhiIX6gzDqCnuvxAue/FJ8tjtdQ0uavzI/c1quxwiQm9BbRGkl/mwQaOy4a75d8M6pEbUO52ZwE59tr0PiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huxCr4QM; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huxCr4QM"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25400so1429207b3a.0
        for <oe-linux-nfc@lists.linux.dev>; Mon, 14 Sep 2026 05:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789387896; x=1789992696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rnqfF0881hUPYee8XIZkVKnPceoCWZ6t05x/WRkGDd0=;
        b=huxCr4QMz7uN9HHlWEyZkOyQNxBmHWPKc1OBD890gid+EBim6Y8Z/EI4HFz4xWpxlz
         Hn6CWZILFismk740/Q9BgVLYQaNIPqY5dLHgQoi0XJ5hzKVSW6BlbOXiMdaKGn2MnVsD
         rsJMeLjZkPDPkkH4X80TgexIcWF6SoC9FSutyT3OgtmBKmPorNMVIMW0wDxNJVnauuhM
         LktPb28mHb72iZaewXPDEOH3XGmEaYEH2wNv3Ta60SnrO4DV6eUzDaMNxJe5IUoKIYpS
         YQd1dIt8FkmwIwwEJW3G1+p8aAzYnZ8ycyE62WLKj9ZZ+c6kmtcL1BnFZT4GSxpFPPRt
         qT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387896; x=1789992696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnqfF0881hUPYee8XIZkVKnPceoCWZ6t05x/WRkGDd0=;
        b=Y1p6bZl4j4Qyw4uc/EwSVyCEKOZ6VM04Grvl1bdsubP+QD6BPsQf9qk7+WfEowHtwQ
         IlMCucfDMIRWB0r9Gi3sPCLUemaK6w20H8ISSlxsNCHw824t09U0u4qBJeUpmqc9LwyM
         ZDf1fVX/b9ji2913Q2rYL/qJPAcOm4FSurAx3rryp6Dn5MNYgbZQraGe/KxaCvJkqFXX
         +qwM96MML5LnYxpx4Ms6JlHaB0SsFFcs0EQ7jNfkMN7MUrO52V+Q45Gx+9j8lnnUrwCG
         q153ri8VcFUWd6VjTV9zhVTdGYnc/ftKhusOWj3HRTCbc8slm1FR6qceTuqvwJoN3jnh
         0q7w==
X-Forwarded-Encrypted: i=1; AKwUvBzxZtOwndddyaV1ojgMiwOZdCUn3zZm+qk/CCPl3FSy3hHBSh/ubLjQHRs9iwhz3kidOqqBQX99msor++Q=@lists.linux.dev
X-Gm-Message-State: AFuF++llphQ6fj3VLOnBRt5tgDKpV1jL5m3gbd6769Pfnyx5IxWE7bP7
	FIQBUSvFcOqePdPNq44TtTqAIRR+EAfT9hzArfTP8P7L+xhZP72/8Nas
X-Gm-Gg: AYBFou2OvO0Wrxx+VmfWXHy6jNRpISbG7IwSQnBSusTHZhP+VEdaosI+rDJjjlt56OT
	FnsxmODST+LsYQq8QQXzvXu7btHAtWieKKA3WwlWQijiz4tgPwkx6W1pux/2ILPL3LxUAVJQHTc
	wet7bbh3VPz144IVLgYso1/8WInbIQaUP7J9ri50xBXLmMlpB3OdBhH8Qm59m29y75fxQZjB5Ru
	YSgne9/AwFwoXQovd7ykBAH1y5hMsZjHH/z2W8r8uHkFX33MV5cYw4QfeTd6SlUmVjrs6Vu9Voh
	wLRrbbRMBrwcjyBdOKLPGGy7K+PlFZvyM7JNRP8hCi4/EJJsJuMQKgsX35M0boQwCCz/+CsQEr7
	g8+MAKP49sPzQ0aDiEOsU+xoDaooCTvYmylxOOvtjzQXpro724ytazqjAo+AbwTK5lwvrpAJ57E
	LB/9vUvnGdggGlOhddK1VRMmCBdRtpxqftaGJvTF2okh57E0DEjWlohKo3xGkNdDarZ7SU4s9m1
	wyjOyjMU1MWPs9S
X-Received: by 2002:a05:6a00:368b:b0:84e:e741:174f with SMTP id d2e1a72fcca58-86f83e3afdbmr5040971b3a.7.1789387895990;
        Mon, 14 Sep 2026 05:11:35 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a7c7395sm4430398b3a.61.2026.09.14.05.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:11:35 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nfc: llcp: fix sdreq TLV list leak on parse/alloc/send failure
Date: Mon, 14 Sep 2026 19:11:29 +0700
Message-Id: <20260914121129.2098606-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfc_genl_llc_sdreq() builds a list of TLV nodes while walking nested
netlink attrs, but 3 error paths (nested-attr parse failure, TLV alloc
ENOMEM, nfc_llcp_send_snl_sdreq() failure) all skip freeing what was
already queued.

Route them through a new free_list label, mirroring the SDRES path in
the same file which already does this. Harmless on the success path
too -- send_snl_sdreq() drains the list as it moves nodes, so it's
already empty by the time free_list runs.

Fixes: d9b8d8e19b07 ("NFC: llcp: Service Name Lookup netlink interface")
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 net/nfc/netlink.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index 0c58824cb150..224bdfa2dd0d 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -1181,7 +1181,7 @@ static int nfc_genl_llc_sdreq(struct sk_buff *skb, struct genl_info *info)
 
 		if (rc != 0) {
 			rc = -EINVAL;
-			goto put_local;
+			goto free_list;
 		}
 
 		if (!sdp_attrs[NFC_SDP_ATTR_URI])
@@ -1200,7 +1200,7 @@ static int nfc_genl_llc_sdreq(struct sk_buff *skb, struct genl_info *info)
 		sdreq = nfc_llcp_build_sdreq_tlv(tid, uri, uri_len);
 		if (sdreq == NULL) {
 			rc = -ENOMEM;
-			goto put_local;
+			goto free_list;
 		}
 
 		tlvs_len += sdreq->tlv_len;
@@ -1215,6 +1215,9 @@ static int nfc_genl_llc_sdreq(struct sk_buff *skb, struct genl_info *info)
 
 	rc = nfc_llcp_send_snl_sdreq(local, &sdreq_list, tlvs_len);
 
+free_list:
+	nfc_llcp_free_sdp_tlv_list(&sdreq_list);
+
 put_local:
 	nfc_llcp_local_put(local);
 
-- 
2.25.1

