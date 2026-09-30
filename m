Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71FE435504
	for <oe-linux-nfc@lists.linux.dev>; Wed, 30 Sep 2026 22:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790806158; cv=none; b=ZErqbBfZSvl+uUclWkRh/JUAUHwRtqSFcPRka2NmyhLGWPXMPs3ExMQioP+FstN1c/rn02yAutAgKxeLoYdTOHQ0o5aZvnkCtO64A0VtjGBWcp6K2aDy4QBK1doKQOiYskM7N4MNK4AqDiLsmtZjeot4c9fSRC+fDeToJf4ZZ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790806158; c=relaxed/simple;
	bh=2Vc91vVa95l1BF9P5E+Hu4oArbEH6p9nMPl42D5ahBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QjgH9HhMaQ/0jFY8YlOXsAkGsG4Hid+/Qvq+UoVS3RIEY1CHD6VRM3TEvUhmMCS5ZBR2mDkxbsU4mNrQ1Ci0Y4tt2n2DC5viZSQN5cNzZdKP7cQxVtFe5zTq5kkiv4csYlAuX7Gf9O+QNJ6Vi9hKq5qDp8n2JVRtQ26cePInNEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7XTbLeG; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7XTbLeG"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso42833025e9.2
        for <oe-linux-nfc@lists.linux.dev>; Wed, 30 Sep 2026 15:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790806155; x=1791410955; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmeV4rEVAtHMh/0SUOgOEDlH2GalZPirUpnG/q/WPZk=;
        b=X7XTbLeG2oOYkS/VrC89JRTNcxQyO5hSZKRCzh3eijc405yWlTgWP7yuj7aYGHvF8F
         CNUjEPism0lrpreOXDJrnVlrbsu+vqZhRammQV/rozwP4topbnNUwyiPBX+WcaMtiaNS
         wlPh9JMlarBIP15/BoQ6jKFvyjEctT6jZFElcZCzj2Rx6E+Dc9pLKm3/6VP2tmX2yLrM
         AV5cZtVGUcPVIpoM/yCohW3WRVotNBSsNtO9Z884l3uJPdyPNyq8h/vJUe0qFhdnkni7
         ysyCTVkhZ6SFigeElPx/Io6i+hz7n2qMM2QmmrF9pZT1Q0MMS37D3MqwTxIOSP03bhYI
         Ce4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790806155; x=1791410955;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GmeV4rEVAtHMh/0SUOgOEDlH2GalZPirUpnG/q/WPZk=;
        b=1ra8EJTFPmhNpRva+ozlypA7kY6moqxWJ4tkZYhgvmj3F7j5M7++38oMAFfsDGA+va
         zUA63iDFBaTms/TWR4MCK4xEMzF6UNLFYekPJXywFuu9Fq69VahWcxOk/GLotgg4/dwp
         XvfgnyvbGb+5k/GICZ4WzqPXJVQMASPzjyV/CFjuVWMJNdKgWKl0auF2Z0T67CJKoBPl
         vTDTDD8f2VhVaw7+UWtCTvf2jGefgBqOskMIadA3UHjg9v+bSVQosuHTb4BKjNpuqWDz
         bLTb1c2B/f2pfOVAHx4grVkmO5R408tiZ0r0wkatUduL/4O6G4vjf1yISzmJY7eBUYpF
         7GLQ==
X-Gm-Message-State: AFuF++mA1QponvROC4S+SKJ7isIV3tzFgBAB6gyMgDafiyfhyMvaeqsC
	lkpRGqWaJhWtssdOBYXlcePMM+WCguFUs7zx8n8Gqn4kG9vHd3C0305JBiqzKMo//Ws=
X-Gm-Gg: AYBFou05sMQfLI0m0NFJowUyshIfBrSRzIlvIX29kaBcOqdZ6JptNoDx40EC5w4zWvZ
	DKkl0Ndyc+Zyjkzk3QhXJz+ni8vc5SmpFLhT/YNHpL/JwprYdt5y4gRfPKhbngDrxvMcv74q7EX
	vwSpQXxYSnaNH+N8emrZykqEUYDeuatCQ2VotJBKsjhXAj3LPZ3De0H2VjVhuO/pI90uYxvhcN1
	wlJedGG/hvIv+gF7y8e3FqJYiP1LK49BYw/eDoYr42V6ug2yJi/gkpSeA4nF+rgMeKq8fe9X+AG
	WLue282ppDNy3p65lx0ZVzATGgCXH5YRivGVj4hP0lhUGi2gS2U5Ww/+Jz4egPUpojIgpNMBuQy
	b04HSR4DEt/TO5R8FYtL9YGcKFJT/ssar9QWSIQ5YL2FIiBbJ/3KNeQVZp5TXcwf+P/XQ8qBa5G
	Co/ZpDEaL4QvS5nBbs27ZQAQr2DZYdZLxm7DEeIJdOWgCNU15tYGrD54wH+SiQOdQIdo517lX6i
	hnnb+Y=
X-Received: by 2002:a05:600c:19cb:b0:4a0:1c17:4fb2 with SMTP id 5b1f17b1804b1-4a01c175025mr37282775e9.31.1790806154525;
        Wed, 30 Sep 2026 15:09:14 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f98f72fsm12679655e9.11.2026.09.30.15.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 15:09:13 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net] nfc: digital: fix read of resp->data[0] before length check in sens_req
Date: Thu,  1 Oct 2026 01:02:06 +0300
Message-ID: <20260930220857.721985-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

digital_tg_recv_sens_req() reads resp->data[0] into sens_req before
checking !resp->len, so a zero-length response causes a out-of-bounds
read before the guard that was meant to prevent it.

Fix by checking resp->len first and returning -EINVAL early, then
reading resp->data[0] only when the buffer is known non-empty.

Fixes: bf30a67c947e ("NFC: digital: Add tg_listen_md and tg_get_rf_tech driver hooks")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 net/nfc/digital_technology.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/nfc/digital_technology.c b/net/nfc/digital_technology.c
index ae6487c10..b27d45e05 100644
--- a/net/nfc/digital_technology.c
+++ b/net/nfc/digital_technology.c
@@ -1097,10 +1097,15 @@ void digital_tg_recv_sens_req(struct nfc_digital_dev *ddev, void *arg,
 		goto exit;
 	}

+	if (!resp->len) {
+		rc = -EINVAL;
+		goto exit;
+	}
+
 	sens_req = resp->data[0];

-	if (!resp->len || (sens_req != DIGITAL_CMD_SENS_REQ &&
-	    sens_req != DIGITAL_CMD_ALL_REQ)) {
+	if (sens_req != DIGITAL_CMD_SENS_REQ &&
+	    sens_req != DIGITAL_CMD_ALL_REQ) {
 		rc = -EINVAL;
 		goto exit;
 	}
--
2.55.0

