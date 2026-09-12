Received: from out28-98.mail.aliyun.com (out28-98.mail.aliyun.com [115.124.28.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156D447CA85
	for <oe-linux-nfc@lists.linux.dev>; Sat, 12 Sep 2026 13:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219153; cv=none; b=GhRkYzh9gBY5F/6c4BxDD8dlx7m7TC4wrq3A4FkU5wQKnr8PKUxq6Lr7sSk59mfgzqRCaWKTbXQ4HUtBqQ2wrPQYiYKs/32yeifIFaZpQ0f1rh9wbmm+e4cIAUIn6Tv3XvbAgT/4RtK/RjjMtEYSpitiHrHGXqolIpg+Gehorcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219153; c=relaxed/simple;
	bh=EeRUEGaUI/l+gIttlzTmjXNyzT67+Kcox7nrq949sM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlVq5mer6v4fwlE/HCTKPNun8LXYjtW9x6Za9PNUzvDYgRdalbeNtuecamgyNSDJtklLmP6DuY7+PdPJJYZdzZVa42pBL8Uavyk2uq3xvfoEnbYUgGqcNe9DYBrK4jYrFCWJtSCmxh84q5Q1cMVpQVqEmeVTvtpoHnwapyP4NWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=MjuCeLq/; arc=none smtp.client-ip=115.124.28.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="MjuCeLq/"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1789219142; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=e42qm3Szy1dc4vy+qruNQCu8MyY8IeIWrKOr0rQ95CQ=;
	b=MjuCeLq/u9lDgAr2cQxhFNYk/a05DGzMxic/drLxS0SAMzeF59ncEuxlxEcxYF0ACm/qIDJKKQvAnXKF3o8FIxem+TiEY3kfBkJcoUIS5iFlnxEw7nZXtgmIlwY9DXvSSCfzcHDGULoLYgzMHUw2hagRHtLnAXaabsqXgtxYDf0=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08329333|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00867436-0.00152383-0.989802;FP=10302340803894709571|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037032089;MF=liuc63@xiaopeng.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.jC..lBP_1789219139;
Received: from localhost(mailfrom:liuc63@xiaopeng.com fp:SMTPD_---.jC..lBP_1789219139 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sat, 12 Sep 2026 21:19:01 +0800
From: Liu Chao <liuc63@xiaopeng.com>
To: David Heidelberg <david@ixit.cz>
Cc: Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Chao <liuc63@xiaopeng.com>,
	stable@vger.kernel.org
Subject: [PATCH net 2/2] nfc: digital: check resp length in digital_tg_send_atr_res_complete()
Date: Sat, 12 Sep 2026 21:18:52 +0800
Message-ID: <20260912131852.1651462-3-liuc63@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260912131852.1651462-1-liuc63@xiaopeng.com>
References: <20260912131852.1651462-1-liuc63@xiaopeng.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

digital_tg_send_atr_res_complete() reads resp->data[0] and
resp->data[offset] (offset 2 or 3) without checking resp->len.
The resp skb comes from the remote NFC peer, which controls its
length.  A short frame causes reads past the end of the received
data.

The downstream handlers (digital_tg_recv_psl_req, digital_tg_recv_dep_req)
each have their own length checks, so the consequence is a misdirected
dispatch on stale data rather than memory corruption.  Add the missing
check as hardening.

Fixes: 1c7a4c24fbfd ("NFC Digital: Add target NFC-DEP support")
Cc: stable@vger.kernel.org
Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
---
 net/nfc/digital_dep.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/net/nfc/digital_dep.c b/net/nfc/digital_dep.c
index 6d8e662a3..5093b7b81 100644
--- a/net/nfc/digital_dep.c
+++ b/net/nfc/digital_dep.c
@@ -1467,16 +1467,19 @@ static void digital_tg_recv_psl_req(struct nfc_digital_dev *ddev, void *arg,
 static void digital_tg_send_atr_res_complete(struct nfc_digital_dev *ddev,
 					     void *arg, struct sk_buff *resp)
 {
-	int offset;
+	unsigned int offset;
 
 	if (IS_ERR(resp)) {
 		digital_poll_next_tech(ddev);
 		return;
 	}
 
-	offset = 2;
-	if (resp->data[0] == DIGITAL_NFC_DEP_NFCA_SOD_SB)
-		offset++;
+	if (!resp->len)
+		goto bad_frame;
+
+	offset = (resp->data[0] == DIGITAL_NFC_DEP_NFCA_SOD_SB) ? 3 : 2;
+	if (resp->len <= offset)
+		goto bad_frame;
 
 	ddev->atn_count = 0;
 
@@ -1484,6 +1487,12 @@ static void digital_tg_send_atr_res_complete(struct nfc_digital_dev *ddev,
 		digital_tg_recv_psl_req(ddev, arg, resp);
 	else
 		digital_tg_recv_dep_req(ddev, arg, resp);
+
+	return;
+
+bad_frame:
+	kfree_skb(resp);
+	digital_poll_next_tech(ddev);
 }
 
 static int digital_tg_send_atr_res(struct nfc_digital_dev *ddev,
-- 
2.50.1

