Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B8130BB9B
	for <oe-linux-nfc@lists.linux.dev>; Sun, 28 Jun 2026 21:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782680437; cv=none; b=eEVUOCD7eEXAubxqM2KXFwhPoHuHv0VnNuVgiLLVOUnJZxAaX123dtXlPkgc6mIbm6fJKzdEUGHb1OKk9H+uB7b1V+NrW2SXzRwqrQJnA+edAPwl0ahDbgtDzcDjXDqdtpwniUfV0R0W1dlImfQt5G82pE9yz+9PkdjzMk/E8G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782680437; c=relaxed/simple;
	bh=qsF2zEMe9MrdDEhAgXCZ9mk3Y52f0O8tyH/reTQnQAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sZnkA7p/hH5UQCfUHCbxJf1GYB8vNJtjDo2angYauOGrtQTM4FIznmIycDcaUSjreIn9lD4TJUy4cQ3Fb0WSFf6iMgeQeLrbWtsH+KkOwgq/DTMLi6vs4TpcJ/NT74u26FGxQxdU8Ab9LLfA8jlmPR0c2PEnLGD3v0M46Gs/Lgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5wWoMZx; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5wWoMZx"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37ff798fe89so274339a91.1
        for <oe-linux-nfc@lists.linux.dev>; Sun, 28 Jun 2026 14:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782680435; x=1783285235; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ntRF8aySUXd8W8x0gTrlgVfKPreN/+S0UpqzJ9bROBk=;
        b=G5wWoMZxJjt6uyJ/TeJp+n3K6lOD6PZ7QxiHdLalqezthzGGsJ9g4oPE6IN2+UXuVJ
         vkzlm7sAtSBxZ/tt9FoYrVgXkhyv2rUZks9O9LfjS/p4drc67zhnQYCqiad27gsaevO4
         17GD0WAP/nJd5C8U/jaAbJyB4ZXVJMCMCatWGZHqsbpFDgX13GXVBZFbcGvELOThkjhd
         J7DruxaJoEprac/g/kvMMYGdmZkMTqM6RDMdsXk1JSXlv8xG2VgmvXDhNq044R4PX4/4
         MiIOSGeLU+lx/OgZ5iyFS/18rblx5ou7JlnbHJcSWS+hrp5Rn8w0TJ83dPOqXpHgrKm/
         kl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782680435; x=1783285235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntRF8aySUXd8W8x0gTrlgVfKPreN/+S0UpqzJ9bROBk=;
        b=bHfs8x5B9G75TxWeIVIqqdTP9UdKeCsL7VbqOEswbiRmQars9hkXcMDhEmd/jfeimu
         Qa8tzzuiRJgsL/KJkba2KMMRmWfA44HaOsPFmgZDhzjp74vMcFCvr6eDyZvmO4SqvUzz
         vw4Mm7Ayv1pAAkkKodcuE26E8d7Mxaadlhilq5/LbOMcWu7UruDGxoqsN8KU12VPwdXT
         ZV1J8C3Vkn9rQSJuX6KFngn0II2eLTwiFJjGSzaGK4YseUoIF5d0XqCERJSzh3Nznwwu
         rXksl1BsclyMhx3jYWQDw+urw2BsKxE3Tz5LaeUNUbQ5aRK4N5a2xGNd9ozVpObRGxzN
         A+ng==
X-Forwarded-Encrypted: i=1; AHgh+RoqAtirSjk5q11Da2aiDY/AiVb6iQ3csAQ6kvxft7hG3ZCAMWDu21yzw5+14DEifMhoYG8Qg791g/wunR0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWN0EKCFuilXGrbGyuWKBfX4eapaWjMKl9ZG/sJOL65JWpKJdA
	gtOzvggs0oRs8n9NLwx0GM0eebNIOCNX9DCnbmX43UdpeEpCDjJpqi7S
X-Gm-Gg: AfdE7cl9L30ZiyG3sto4rjBsCQSRAmv1w1mCUX7rqz9iKOBrFxbYzvssclE0HBLVU+F
	608XMARhYYxw57AEtSQrTeTMYwvU+zSQFv0nHea1L5vFW5Q6UWU+BH1p5enGHBgCyEz5alravxY
	JXpsc+QEgNqDPWYWyWuApwopP5URccen79TaA59RipsDY+hM9UrEQfAHR20zEVION5hlAixZO5n
	RTOl33AGn5/00uszjtJoGmJ9MYhFnlkQvnLM9DKIU2toAiY3YD1dgN4vnvOtpgSyVOnBV/e6Kvj
	h/mju95QQQRNs1WvSZXSxmXbMe3ZzxL+qEsrmxMVh/dilKIcbofQfyKEMY0wnbfLPxobzAeb2KZ
	4bW8P0o8ltjuQwYAkkeEw4rokMPLNNZ33wtcJIpLjALOPZkWWvdicyUXtPldMRE6QHQMOlbyMiI
	ZdSiUl+vWBIUIXcuRFtqUF7pT9umIkKys1qBH4hkOxhYiEYP3abxXQplaXbjHyWdMmr6x6eKI=
X-Received: by 2002:a17:90b:498c:b0:37f:b966:5f1b with SMTP id 98e67ed59e1d1-37fb9665fdamr5959083a91.4.1782680435345;
        Sun, 28 Jun 2026 14:00:35 -0700 (PDT)
Received: from node ([149.40.62.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37fd2bd0e49sm2390690a91.0.2026.06.28.14.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 14:00:34 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] nfc: nci: fix out-of-bounds read in activation parameter parsing
Date: Mon, 29 Jun 2026 02:00:26 +0500
Message-ID: <20260628210026.129941-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nci_extract_activation_params_iso_dep() and
nci_extract_activation_params_nfc_dep() receive a pointer into the
RF_INTF_ACTIVATED_NTF notification but are not told how many bytes
remain.  Each reads a one-byte length field (rats_res_len,
attrib_res_len, atr_res_len or atr_req_len) and then memcpy()s that many
bytes from the packet.  The length is clamped to the destination size,
but it is never checked against the remaining activation-parameter data,
so a notification whose length field is larger than the data present
reads past the end of the buffer.

The sibling nci_extract_rf_params_*() helpers were recently given a
data_len argument and matching remaining-length checks, but the
activation-parameter helpers were not updated.

Pass the remaining length down and validate each field against it before
copying, as the rf_params helpers do.

Fixes: ac2068384034 ("NFC: Parse NCI NFC-DEP activation params")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 net/nfc/nci/ntf.c | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index c96512bb86531..63aa0a78472b1 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -525,7 +525,7 @@ static int nci_rf_discover_ntf_packet(struct nci_dev *ndev,
 
 static int nci_extract_activation_params_iso_dep(struct nci_dev *ndev,
 						 struct nci_rf_intf_activated_ntf *ntf,
-						 const __u8 *data)
+						 const __u8 *data, ssize_t data_len)
 {
 	struct activation_params_nfca_poll_iso_dep *nfca_poll;
 	struct activation_params_nfcb_poll_iso_dep *nfcb_poll;
@@ -533,9 +533,14 @@ static int nci_extract_activation_params_iso_dep(struct nci_dev *ndev,
 	switch (ntf->activation_rf_tech_and_mode) {
 	case NCI_NFC_A_PASSIVE_POLL_MODE:
 		nfca_poll = &ntf->activation_params.nfca_poll_iso_dep;
+		if (data_len < 1)
+			return NCI_STATUS_RF_PROTOCOL_ERROR;
 		nfca_poll->rats_res_len = min_t(__u8, *data++, NFC_ATS_MAXSIZE);
+		data_len--;
 		pr_debug("rats_res_len %d\n", nfca_poll->rats_res_len);
 		if (nfca_poll->rats_res_len > 0) {
+			if (data_len < nfca_poll->rats_res_len)
+				return NCI_STATUS_RF_PROTOCOL_ERROR;
 			memcpy(nfca_poll->rats_res,
 			       data, nfca_poll->rats_res_len);
 		}
@@ -543,9 +548,14 @@ static int nci_extract_activation_params_iso_dep(struct nci_dev *ndev,
 
 	case NCI_NFC_B_PASSIVE_POLL_MODE:
 		nfcb_poll = &ntf->activation_params.nfcb_poll_iso_dep;
+		if (data_len < 1)
+			return NCI_STATUS_RF_PROTOCOL_ERROR;
 		nfcb_poll->attrib_res_len = min_t(__u8, *data++, 50);
+		data_len--;
 		pr_debug("attrib_res_len %d\n", nfcb_poll->attrib_res_len);
 		if (nfcb_poll->attrib_res_len > 0) {
+			if (data_len < nfcb_poll->attrib_res_len)
+				return NCI_STATUS_RF_PROTOCOL_ERROR;
 			memcpy(nfcb_poll->attrib_res,
 			       data, nfcb_poll->attrib_res_len);
 		}
@@ -562,7 +572,7 @@ static int nci_extract_activation_params_iso_dep(struct nci_dev *ndev,
 
 static int nci_extract_activation_params_nfc_dep(struct nci_dev *ndev,
 						 struct nci_rf_intf_activated_ntf *ntf,
-						 const __u8 *data)
+						 const __u8 *data, ssize_t data_len)
 {
 	struct activation_params_poll_nfc_dep *poll;
 	struct activation_params_listen_nfc_dep *listen;
@@ -571,21 +581,33 @@ static int nci_extract_activation_params_nfc_dep(struct nci_dev *ndev,
 	case NCI_NFC_A_PASSIVE_POLL_MODE:
 	case NCI_NFC_F_PASSIVE_POLL_MODE:
 		poll = &ntf->activation_params.poll_nfc_dep;
+		if (data_len < 1)
+			return NCI_STATUS_RF_PROTOCOL_ERROR;
 		poll->atr_res_len = min_t(__u8, *data++,
 					  NFC_ATR_RES_MAXSIZE - 2);
+		data_len--;
 		pr_debug("atr_res_len %d\n", poll->atr_res_len);
-		if (poll->atr_res_len > 0)
+		if (poll->atr_res_len > 0) {
+			if (data_len < poll->atr_res_len)
+				return NCI_STATUS_RF_PROTOCOL_ERROR;
 			memcpy(poll->atr_res, data, poll->atr_res_len);
+		}
 		break;
 
 	case NCI_NFC_A_PASSIVE_LISTEN_MODE:
 	case NCI_NFC_F_PASSIVE_LISTEN_MODE:
 		listen = &ntf->activation_params.listen_nfc_dep;
+		if (data_len < 1)
+			return NCI_STATUS_RF_PROTOCOL_ERROR;
 		listen->atr_req_len = min_t(__u8, *data++,
 					    NFC_ATR_REQ_MAXSIZE - 2);
+		data_len--;
 		pr_debug("atr_req_len %d\n", listen->atr_req_len);
-		if (listen->atr_req_len > 0)
+		if (listen->atr_req_len > 0) {
+			if (data_len < listen->atr_req_len)
+				return NCI_STATUS_RF_PROTOCOL_ERROR;
 			memcpy(listen->atr_req, data, listen->atr_req_len);
+		}
 		break;
 
 	default:
@@ -806,12 +828,14 @@ static int nci_rf_intf_activated_ntf_packet(struct nci_dev *ndev,
 		switch (ntf.rf_interface) {
 		case NCI_RF_INTERFACE_ISO_DEP:
 			err = nci_extract_activation_params_iso_dep(ndev,
-								    &ntf, data);
+								    &ntf, data,
+								    ntf.activation_params_len);
 			break;
 
 		case NCI_RF_INTERFACE_NFC_DEP:
 			err = nci_extract_activation_params_nfc_dep(ndev,
-								    &ntf, data);
+								    &ntf, data,
+								    ntf.activation_params_len);
 			break;
 
 		case NCI_RF_INTERFACE_FRAME:
-- 
2.54.0

