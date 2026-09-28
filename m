Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A482277C88
	for <oe-linux-nfc@lists.linux.dev>; Mon, 28 Sep 2026 03:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790567884; cv=none; b=oFi12jcIkeH7WE87ep1H70xHqBdp3Tyubfq4wa/egiWsYb0+Uv3ImA5uH/h+x/3ZhxZqqiq4VVsgwK+d8/jWUpYsIAdCilmJzCqF4EVS9W0hug4ZEJm1SuoOpeGBTYY4kUsMSYDOi0e34K4h1yQcgRYtNbOJH8FbFWFJ/kXbbfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790567884; c=relaxed/simple;
	bh=RCb84R1Ilbqk/brMo0ozsD4weTDX3UUsJYqs8fer/vM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOT50B+VZsg5tiXCdlJ7R1Rjj4Ag9W0vstl5ndjFeTNRtuic0Vcw7mffkGm5yaK1g1tlG9LORaMeADIbssa7/fAT3goFyML+U6ocQ83ku3efR/MMRCxNRyrB9ierAOl58QjSUjsU+iYqxOl+YvEqTkkBSpPe4PoKubdqYB5pb/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jru6reZe; arc=none smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jru6reZe"
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986df7ac62dso1306634241.2
        for <oe-linux-nfc@lists.linux.dev>; Sun, 27 Sep 2026 20:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790567882; x=1791172682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8PRQtLnkGcQLLad/iSnwkqrL/4wKHSNHecCDuETOGrQ=;
        b=jru6reZeRJEkDwn6UwCqB+dqgP8H/NBJUaybCHzFdRjYiZ5rQgSNTnVLyqVbA+p17j
         gVcGC71ADoOsKFusZFIdK5/OxvM7njx9XgRog6Z+yaXXUS1hoMWEfYuzF2ALmgzaM2Rx
         kdXPCuKpZFFg6dT+buHyciUG5nXNj++8QZGU2x+M+wLUxP6t/e/YurHxZDXhahQP+Fwv
         Z0883zYMnYQUgssuCWzo0MswCpNO1JB98FvimWjtdlACmpLpkf8QGLWUdnSczjzXgqPI
         WkYLbxsFpLxLkJT3/xqzjs55sU4pDQw67TDN+sC4fwvkyveBikJGzZ1YQDQmeDfwbxJO
         nrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790567882; x=1791172682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8PRQtLnkGcQLLad/iSnwkqrL/4wKHSNHecCDuETOGrQ=;
        b=iGh86o3YSx/1yf6mX+24kDb2kCpyCWMREEg0R87uKog13Lho/kEzUA8xI2+VKwN2xk
         peV8DG5133b+lTWOSZveURrod9tjUggy05sTnELUfEXdY+2XDWzlcD8B14hiocWFgotr
         8p7H3e8UDuDKM9IYZtgarjXmqMu8Pf0ft1OOyaTSjHBClOvw56P5u9QYm//M+rP4NLEI
         jXytmYB/YF0zWMrbQ/A6zrKmWONPtVtENlvlixC9dUvWf6ETHrympoqqTyTfIrAjTFoq
         oEtvXgmR7Gi21jSsg+szyVefs7mD+AJF8K1UPyN6ejfOaQI5uokq7pOEG02i2ZCSPKBy
         Cy0A==
X-Forwarded-Encrypted: i=1; AKwUvBxbbw6z8AaTcW7wwk/4knvufw2RbV762HWzcu1FcODH2xayBAS5efU3dLabeFPRG3GJagVnRG28y07CHyQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYIdrRL4e5/vUpBC94LQs7+2I0QG7jHl0tDEljlvmN5+N95vutpH
	vVV+p8NuhE6DOlbCRLSN2/EzLoI7Rg116+XQBSqmPvWBaxXNEMMVgY1M
X-Gm-Gg: AYBFou2n+sDuOiITu5Y8BxZHYV1g96HOkG3iV8qo2FUsB4xhlkG/xZFN06O8lO/4kkd
	75/WTl2KDEo5WQXv+VtzB6p8h7AIYmOKtZczHhbMHNOtBccz8Aeu7GW4RteV0Q2EMgpIACA4MFt
	AIV+Ac3u3IblvQfgRvqXILhUQaUvF5ff4+9BO05PtUSzvXmzhS9I7kBEEXhzaZQz8vdICSFBFcU
	zXMS81jqjtHtyK/O+UQM9DQdx0Nq0KSEs5So+TVy5DCrfcSWAAJZh6CaKXOjzdiGGYDjbimYqzA
	6FjIhoWGdlCXqIF9WR8d6F5pofLzGHcidhCkCXWWC7qfc7Hy3ForPhyMkz5CQG2/mdhQ1zrCJgg
	Z0nIlqFOmni7QVwnExGAO4Hls8ayByvdo42aWxGXHHZFl9NQnAY9tjCSClDPAh/eYQJatKdzfa8
	RcyHJtlBKIGC+L+L5Y5b1ThdAiOIlr/mml7yGS6YSYJz3ZmPfDN3d9NWn/S/dVLuE=
X-Received: by 2002:a05:6102:358d:b0:79e:2b00:b4da with SMTP id ada2fe7eead31-7af1c692c06mr4663990137.6.1790567882180;
        Sun, 27 Sep 2026 20:58:02 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b15808esm8107452137.5.2026.09.27.20.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:58:01 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+ci3c472c63e196fe9e@syzkaller.appspotmail.com,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net v3] nfc: llcp: prevent resource leak on repeated connect after DM
Date: Mon, 28 Sep 2026 00:57:49 -0300
Message-ID: <20260928035749.2305913-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925184857.357926-1-qwe.aldo@gmail.com>
References: <20260925184857.357926-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A rejected asynchronous connect leaves a local reference, SAP allocation,
service name and device reference on a closed socket. Release them before
retrying connect.

The device pointer alone does not prove ownership: bind() puts its
temporary device reference while retaining the pointer. When device
teardown closes a bound socket, the retry cleanup would put that device
again. Clear the pointer when a bound or listening socket becomes closed,
and after a connected socket's device reference is put. Do the same when
DM closes a bound or listening socket. A DM rejected connect keeps its
device reference until the retry cleanup, so retain that put there.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://ci.syzbot.org/findings/64002827-5231-4183-bfca-0d91bded8543/syz_repro
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
v3: Clear non-owning or already released device pointers on close, while
    preserving the device put for rejected asynchronous connects.

 net/nfc/llcp_core.c | 12 +++++++++++-
 net/nfc/llcp_sock.c | 17 +++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 199543c47eef..6382aacca69a 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -95,8 +95,14 @@
 
 		nfc_llcp_socket_purge(llcp_sock);
 
-		if (sk->sk_state == LLCP_CONNECTED)
+		if (sk->sk_state == LLCP_CONNECTED) {
 			nfc_put_device(llcp_sock->dev);
+			llcp_sock->dev = NULL;
+		} else if (sk->sk_state == LLCP_BOUND ||
+			   sk->sk_state == LLCP_LISTEN) {
+			/* bind() already dropped its temporary device reference. */
+			llcp_sock->dev = NULL;
+		}
 
 		if (sk->sk_state == LLCP_LISTEN) {
 			struct nfc_llcp_sock *lsk, *n;
@@ -1330,6 +1336,10 @@
 	if (connecting)
 		nfc_llcp_sock_unlink(&local->connecting_sockets, sk);
 
+	/* Bound and listening sockets do not own a device reference. */
+	if (sk->sk_state == LLCP_BOUND || sk->sk_state == LLCP_LISTEN)
+		llcp_sock->dev = NULL;
+
 	sk->sk_err = ENXIO;
 	sk->sk_state = LLCP_CLOSED;
 	sk->sk_state_change(sk);
diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 1e5ee4bcde68..9d76c12aee01 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -713,6 +713,23 @@
 	if (sk->sk_state == LLCP_CONNECTING) {
 		ret = -EINPROGRESS;
 		goto error;
+	}
+
+	if (sk->sk_state == LLCP_CLOSED) {
+		/* Release resources retained by a previous failed connection. */
+		if (llcp_sock->local) {
+			if (llcp_sock->reserved_ssap < LLCP_SAP_MAX)
+				nfc_llcp_put_ssap(llcp_sock->local, llcp_sock->ssap);
+			nfc_llcp_local_put(llcp_sock->local);
+		}
+		if (llcp_sock->dev)
+			nfc_put_device(llcp_sock->dev);
+		kfree(llcp_sock->service_name);
+		llcp_sock->local = NULL;
+		llcp_sock->dev = NULL;
+		llcp_sock->service_name = NULL;
+		llcp_sock->service_name_len = 0;
+		llcp_sock->reserved_ssap = LLCP_SAP_MAX;
 	}
 
 	dev = nfc_get_device(addr->dev_idx);
-- 
2.43.0
