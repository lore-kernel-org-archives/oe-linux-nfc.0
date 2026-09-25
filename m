Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994CB4302FC
	for <oe-linux-nfc@lists.linux.dev>; Fri, 25 Sep 2026 18:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362157; cv=none; b=XB2+Tj3P7+OrWFz9ZolgxPtK8Hc2yixRQaUXLP3fVKs3/eOSq8zWWO4ZWVoaEDkV6LJ5bEU4CVNnwg7EMQ0kPkm3D/pQp/hEVEOzRQzMRYgvLrzPAnfurMHLhAJT8kxnhR0MDnTPXumnEZSVipwFzkBWDWuwHe5rvLIiNUqKAJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362157; c=relaxed/simple;
	bh=F8eGUcbXM9YJxxiTRFj1694VCKapoa42uE3eAkq3zP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YyidePKokusxwHQpTFoy3z/kKoAZ6r2ihUi9zZw/Qp9z3tW4DFn5alvsh+0LmMueHkJvZrHWWlY1NTtBFBAMAQ0edUADZCcaFnQiTY722Y6YIxmsFeoifSWBBfxtHoV0muzT2Ruem0zt1dbdC+D4xoRYod5Q822DcI3Z06LBLdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3y/AqLy; arc=none smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3y/AqLy"
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986df7ac62dso459429241.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 25 Sep 2026 11:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790362153; x=1790966953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kiKLmngPsfetWszmPVz9vnjkZ6oUGJcFeK7p9i5ASKU=;
        b=e3y/AqLy/YmB3TC5qnNKNOblHp0Bfo1KinJ2XU5Ixgq0P80EuMS/C1gEIjvHKOKY/O
         vlN/+/CAjZ7SNhUBddldnPN18Esu3uZoJ5rueE7/UDpJzeahuAsh2mtoGzGGR1q1j8Ru
         QWHuOblssVON4V/rG11/TM0NaevRxz+IcslP/x8Wdb9RjSfK8IfNULIXK3T3vzadSkQl
         5vZq4s6X+oj3tOqrSCBYa/DCx6I4wvwjb8VQiM5bewMNxNKFMosIIXr+C9ZsWxgQqHee
         XEptkwG9rIZcdR5cRRu3Cj4VLkrDuo7nGnX3K7qIbkBUFCp8qbCNWBOSsH37Wj4XmiJC
         43dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790362153; x=1790966953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kiKLmngPsfetWszmPVz9vnjkZ6oUGJcFeK7p9i5ASKU=;
        b=DkFVx10J8eoOH2iDXrd+XUOkY5YdKuWCNMaBRdZhUE2adQNf0rtGqMd/lBVAKjba+E
         QW7yWKuNmshVXEq6HG5V2YOqbyIEEZndByvwF/okIsiVQ7PTRmkZt/BevUToYsRHi2XH
         7fKBryB/kqkFMMQBchwC3ctbBwHlAD4GgQ4iwkdpldjZyPiz4tt+69duMMZMLU76lBhm
         5IeNY2w2M2Sai5lrttKea53KUooUz2wgfZ5/6hzfveBDaAFMPDPuDAV70FSIFVxBwQfg
         BvhEYmj0suAPwCRDqky4w+mhl2BYQzyOwZIOpMhrLZgzIwwkSx2lX5D4b0H5eXOD8fy/
         R0WA==
X-Forwarded-Encrypted: i=1; AKwUvBx152SvAAF5TyD8tG5unQA6np2OlMSGrgSsltjz+8O+86NkEVqAJDNgdVKboVmkabhhPGpLCKww0IYK4JE=@lists.linux.dev
X-Gm-Message-State: AFuF++k07X1Z+idHLibNUuq7/WzZF5Cd5Whe8wD5mkyNtvTwdr3E+WwV
	bZfUC9ea+epMsJR0dedgz1NQdTpQa7zLvnpbtakdhGsVahc0ndFJVZEd
X-Gm-Gg: AYBFou1E+r6O9n4VG4kRASIK82DqH4vqK9nKOoLVwA0ztf1snvtEmw3L0DjaNJ2WqLO
	F8XuDCsJZ6A0KIPHuDcshnsWqeCXHIZBwqtYaJh2xgw0UCabH4iZ4J7QQXcg3Ob08wbE9iL6FTZ
	IRnMdbFCHJjdnwIkLyW58fFwK3Jfj/mcdk9/K5Fn5sElE1oRI/w2+f4ZaA4m440rIbm1inkVMd6
	SrPt6vwNpyowVvj+Pbq+j6lPrWg64VbyCCcn300egdKSikiASApiYZMhuVv7hQb1dWTj18CUdjC
	0VF6ZPu/n9v+mE0Mjzyxfc6358NdyLeBl9pgigzets16JRaQO0iOVHBfl9Cyc8AJqHHHftTPr4a
	U3B3F4knxrDi+NrXaCUJ4i+ZguO/Cre8Xs+jNZWfbhy5FjjqSy1yq5FcrpJs540g19hfeFDI+AE
	5YVjDf52QNv86yOM3neyGK87zdnwVKQDE5dlhLtzmtQxs1cpoU++cT33hpMsqCBR/vYdocJwbnR
	A==
X-Received: by 2002:a05:6102:10c8:b0:7b2:f790:c020 with SMTP id ada2fe7eead31-7b2f790cd9emr639017137.30.1790362152641;
        Fri, 25 Sep 2026 11:49:12 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9861b029b1dsm3585744241.9.2026.09.25.11.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:49:12 -0700 (PDT)
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
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net v2] nfc: llcp: prevent resource leak on repeated connect after DM
Date: Fri, 25 Sep 2026 15:48:57 -0300
Message-ID: <20260925184857.357926-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A nonblocking connect can return while the socket is still connecting.
If the peer rejects the connection with a DM PDU, nfc_llcp_recv_dm()
changes the socket state to LLCP_CLOSED.  A subsequent connect() on that
socket currently overwrites the previous local, SAP and service name
without releasing them.  Repeated retries therefore leak local references
and SAP allocations until no SAPs remain.

Release any resources left on the socket before obtaining resources for a
new connection.  A closed socket can also retain the device reference held
by an asynchronous connect, so drop that reference as well.  Bound sockets
do not hold the device reference, so release it only when reconnecting from
LLCP_CLOSED.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260923133339.2518641-1-qwe.aldo@gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
v2: fix author name (v1 was sent with an incorrect From: field)

  net/nfc/llcp_sock.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 5558d8a..e76361e 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -690,6 +690,23 @@ static int llcp_sock_connect(struct socket *sock, struct sockaddr_unsized *_addr
 		goto error;
 	}
 
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
+	}
+
 	dev = nfc_get_device(addr->dev_idx);
 	if (dev == NULL) {
 		ret = -ENODEV;
-- 
2.43.0
