Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786846;
	b=bmfh3fQCUwoHfauPMzWtMVA76mFtV14vCAiHOzVYgH/cff19bhMA/k6ZTbsCYzDPIr85
	 nhTGOARmKIcruOQGSIZsPGYDh/oSCSnbeLrSETEasNHU5yRCpgbgi2wNL8ymEmioFD2Ad
	 lM/ancHeg7XfzVO6jFDF1G9tBrnGp8Xdfr1V0kiyC1VYNNDmhhBhsUyWYtNslUK1dYaH/
	 Z1e37Qb1Otb+YqLq/fgkH5mYXAlWziyH0Bp4uWAeB7f1C+g5koLVBvoyC/ItlJR2O5smJ
	 7wp9oYNh63b/ul5vLVVRvGEayfMYMzTVe1dwkQltPntfh6OseW9d6XiYIjkDHpggZlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3LE1BcVVH7zEc6qfRLayg6Uqh5RJSrPQPBJQY4neVbI=;
	b=hw6aSVfvSagiucDyCAa+tR7SDksqUELQz7BF/ytS+Sp5jUNgg1a/p8l+5zZYLG2BYXDO
	 wil4sjM3Jn+whflQEoF4HU6hToEZOSFEmHNG/sTndmI4JmbgO+0vZD6chOE48PAZHwyEm
	 yox/02Hc8Cw/bSS3uVqgg4p5oIVTdNuE0oMnBKd5kQ3MIPj2iHS5HXBBFUy5+v0v/e4D8
	 1ZNbYYzgaNusvxyNz6YAqQMkiRXTU+5yP1LtWNpvk353m9CH+iSsvccqsRxyEMNnZGt+v
	 PfKQRIg+cTfmm9BQZ4LhDWDRpjOzPZDK1aUxQmLZhWpXEUh5gNQbfdnfiNFNWkTZO3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ItbL/TpI";
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EAB606A31C
	for <oe-linux-nfc@lists.linux.dev>; Fri, 27 Nov 2026 13:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27EAB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItbL/TpI
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so3992236b3a.0
        for <oe-linux-nfc@lists.linux.dev>; Fri, 27 Nov 2026 05:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786844; x=1796391644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LE1BcVVH7zEc6qfRLayg6Uqh5RJSrPQPBJQY4neVbI=;
        b=ItbL/TpIl5z5N96oWV5cumglVJdXStXY/EHksZVukoBn8qnPRL3PZfpBDL6xdDlV9c
         ZZSTXIWOn6uk90uOcs2UU5OO/r62EiJ5PkZR5RkXay384zj6tclruvryUTdIq4httcvN
         EeUoB/bScB0nt7pAUWwXsURDuw0VMQh/ZoEmlQYBHJ9YoSvuk48Hs4CLmZfAv8jwVtYv
         WO8rklBSjc0zm0Qut7+VPvtPA6A27LEAfzdL9sGoguyHLLaZojB15cWWbLFTYisJk6SM
         3UFuoqa1QCF2/OZsPleK18e03c1/kcey+kO+3KBKYGcJfSP+VDfQuEZZGJww6vwtsHUn
         X9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786844; x=1796391644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LE1BcVVH7zEc6qfRLayg6Uqh5RJSrPQPBJQY4neVbI=;
        b=GeDrOAYKAQMzp0f8kPoFyN3Jd6z9wjXCf5luPpGAF1V9Xbh+MYboG08exRbmzkGfYw
         lshDwTdYQF0P8g0AiBtCyNRrgyfF1egLLuWN2Js023XBFNLH/KxwS+nHElLYqXeTSzKp
         OHNsHsdpLH6NDS15CYSYOWRpJCAxxgoL1Bei3PPz+x29SKyY9G47nnrAExZunz/r5HbH
         AKfrbvX9tThqMI2ZlfzpWxMxsrzFMdSYD4dChZQgn9+fxr5s0jIZk3hrPvov2qD+6ZCb
         6nMNueJGK2Y4cvWRZ+WfrpaAEb6JNBGl0EuWeiZ6l1hbuB6jNE9lBaowR/G0+3cP7DqJ
         LmBw==
X-Gm-Message-State: APuU4Z9SBsvwaCllNtdLf30yn6yf/BZScIMyAgk+hEf+xkKWeFWEPZ52
	x/FXcThXUfGiDukdrhd0dfgFwnJRHNrc2RIAxA4sMIZUd81hH3wbodww93n8403B8JBfV9Gn
X-Gm-Gg: AZFdTZdyWSXnmRnVXkxg+kWStrS1BIlD0qjPjFAmqObAmt1YMB45V+67ihYOXf626t7
	ymTyz79eIl4w577XLEOJLHHN723qJzEW7HqVZSvp5JpriLbV+3DAYFJSmk3ys45mLLCS1d0iilh
	/wjZgqTrc03FD5KjrEYf9WEq2LhwTJaGIOfKp2lvl5nMTlgqAyhMnZppyGtMlex+zoTXSbJ60Z4
	b737IkpfWeclxW1Mdgjq6eS2YhORPBeH0tGltoFS4pFqx+bf8UUnWYisJpYKyeREoFEJIlwV33K
	1uJHhjhOei+YXm4cjtebS6lcuSFpLIGn34UCUZ9JFdG5EYlBMTJE/XOKEp5ixJsT60U5q2Hybe2
	nwwlU1rlWAdGmuLH96O2xyzp6B2J4Ox4X3tSseqBr5ws2dBVcXn3JqC/yVhOQZwQfpR0hOyVsIF
	dEUMtPPzk6FVCYX+nq444/r4mcSS8iBcv+SshOsz5PL4SntxaRrLN2YOqw7kYTPMyIDAYgS+Zul
	NQA6jx3a71eVVeN0A9DqK/G4YB/LzWYnZ1tUcTpKw5m2o04jMy3lSoBtL/TevCRPboAYDdEyvlr
	6zPSJKXRvUWX7jXTwK/62CXYQz1Dj2a31U6jciUeMWa2J+cFhWHw63FB6QndivlcldJXngLAN+I
	KXcRf5NIQjbogQU/pWNOFs3n2ONfI1RCMqWJyjGZ3siGgm7Sejll1DUcLNQa+ajHBlOniXFM3Oc
	4viruIwb6VDiPlCF46KpMAoFHHneIMwDHz1vrWFJQ=
X-Received: by 2002:a05:6a00:a0b:b0:881:4b47:f30b with SMTP id d2e1a72fcca58-8c87baca629mr21852554b3a.12.1795786844449;
        Fri, 27 Nov 2026 05:40:44 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285b60csm12705838b3a.9.2026.11.27.05.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:40:44 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 2/5] nfc: pn533: clear resp after queueing to avoid double free
Date: Fri, 27 Nov 2026 21:40:26 +0800
Message-ID: <20261127134029.1813-3-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261127134029.1813-1-luob87709@gmail.com>
References: <20261127134029.1813-1-luob87709@gmail.com>
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

In both pn533_data_exchange_complete() and pn533_tm_get_data_complete(),
resp is queued onto dev->resp_q before calling pn533_build_response().
If pn533_build_response() fails to allocate the reassembled skb, it
purges dev->resp_q (freeing resp) and returns NULL, after which the
error label calls dev_kfree_skb(resp) on the already-freed skb.

Clear resp immediately after queueing it to dev->resp_q in both
completion handlers so subsequent error handling cannot double-free it.

Found by static call-chain audit and code inspection.

Fixes: 6ff73fd239ff ("NFC: pn533 Rx chaining support")
Fixes: 3c13b244de96 ("NFC: pn533: Add support for incoming fragmented frame in target mode")
Cc: stable@vger.kernel.org
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
 drivers/nfc/pn533/pn533.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index b0133e5..c42cc33 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1104,6 +1104,7 @@ static int pn533_tm_get_data_complete(struct pn533 *dev, void *arg,
 	}
 
 	skb_queue_tail(&dev->resp_q, resp);
+	resp = NULL;
 
 	if (mi) {
 		queue_work(dev->wq, &dev->mi_tm_rx_work);
@@ -2138,6 +2139,7 @@ static int pn533_data_exchange_complete(struct pn533 *dev, void *_arg,
 	}
 
 	skb_queue_tail(&dev->resp_q, resp);
+	resp = NULL;
 
 	if (mi) {
 		dev->cmd_complete_mi_arg = arg;
-- 
2.51.0.windows.1

