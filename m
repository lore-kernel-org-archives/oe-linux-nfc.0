Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0483D6673
	for <oe-linux-nfc@lists.linux.dev>; Fri,  9 Oct 2026 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537838; cv=none; b=CZ7hVXc4HzsTXbFktaLdsiH0XOW1jNc7EnVwxh9kY+NL//ulXh5nDbnJAaAJvsbw3Dfd9CbG4D/wL+NZFTaFRb/dWvGuVifheTfmPiHLwuVko2gx1YRz4JNOdImtt/Ls/uEEhaWCCigXLXG6sVFL0eynaiObP/wJeVpcYPttHu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537838; c=relaxed/simple;
	bh=spHWg758MMa6cVLRm5D/eai/nTQN8STeDzA3Yqqr8xE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ntpm1QnGjr8Vgg6BEFxxe3dJKRbfo8cq5P/6qzDmAhKYhEWIBZIxvKax1l+6FvazDMDkHm4WNl5aH7iXyX/anrUJllfmo5MyLcG9QSOYRmoRhMdVOLVS2UrWFuKBiXWYVCWhEYunWd8isJDhBkVdmQ1Heyskrbx+5CRTGkKbUkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ileQgenm; arc=none smtp.client-ip=74.125.231.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ileQgenm"
Received: by mail-oo2-f10.google.com with SMTP id 46e09a7af769-820ff812cd8so1624619a34.1
        for <oe-linux-nfc@lists.linux.dev>; Fri, 09 Oct 2026 02:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791537836; x=1792142636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WNJzvugKvA82beZN1tuIwkN3WC4xZ3L9Ut+DKu7+48=;
        b=ileQgenmiv38fIDP4ipWxuhLcSyD36aJw/re3nI3i4hIOM0lFlyK8vdy3SCQCi/B+A
         X0SVwMgaR/fLBKD9y8Max9sN5zWFPhCeZxf5c8T6UXEXxR5OW4NEBwUs4J5NGD9mgtQg
         lhGaOhYWsUpwWLTX9mzW5PZe7Hsu0ZAjwfjyyop9w6nt+chDi9IViOr/Az2mpw71t0Vy
         1lNwyVi6pGkW+cvmpDJgeSzFby295mwL4u1Vme8fRIPBwjZfF+TuJxaiVrnIJZlIyEJ6
         QOe4X4QEh3EiD6sHOwvKSwE8EqCRhaqLAj3dIXj/qfLhgpboczEkPqJmtKIOBfiq8QlM
         PlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791537836; x=1792142636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WNJzvugKvA82beZN1tuIwkN3WC4xZ3L9Ut+DKu7+48=;
        b=IoDNmPnOr6hrsGKtzdTstP7EY2x/gLMhBBicl7pVhnl0wRVXAGb4P/dBg4uMWmm2d3
         2+PEuj3bl0sb/AV2QBI0kVwYkkr74PFJVY6ImGOLMsHcZBgeDfBmFwcH2mG4JrnuyZl8
         u/oJuLHM+w84+pET5YwFBPi3YDpKGmNbOuh3I8jnQC2cSV1AhK/3fNGIJkrsB5QjQRls
         a/8iT5afsFnsPvRddjoN/l9We10gyNQcw2VJARJRjbQG75DWhuUejod7nwcdy4o8C3FY
         sdMaojRbIYzLAsmeG2hcfmibxiKKJ2HtZewRFAJ9UhqU18Aby5uDYfwSdgXCA66R15gr
         NVYg==
X-Gm-Message-State: AFuF++mfhQsWdiPVO1NQP74fQh+6zidK4OVzY6OiQPWOzkDVYv4i0tgw
	KON8m24oPvsp6j7faoBb3rn82lFI8gJ6zCEuwUM1fYajiYpJh+/7eCef
X-Gm-Gg: AYBFou2A5YF+V8aD+vLAbhnvizwCOboS6hSvtn7MGSwhkjqlzNaRfnvkM74eHo5jhQA
	+/LaEr18ajnqYrvcG8A13DZaZZ8B9KCmGJL9Q8CyGJKvZqUv9s6C66PSaPnWUauHTd5eSHsw2zl
	ZCKnOFzN+ay/WYpoB6fsqei3Fkj9U1E2PBSlh5e4dABqBF7NEs1rFIbjO8D8uOoSrQSG69SX0ck
	tbzkyJ1Az48OUla7ScQVKfVk4D7dWlkngaTGOZGRUOE7Cf2Xlzuv84ixKpZFubPiEoqJCVSZYks
	A1ZOaWfNBD/YhheUMffOKzVQ256eofYIEM4MY9Y+2m7q++whpdBpiR//7GwlgEFEKZRHDbFGWKq
	s5d1oaNjILgLCb3f3WVD36850p0sCQErFXtkMKF6PZ7VA2+Nr2UVsRiSW/MJXgB8Ewe/brT57Kj
	tmtr23IfEcqqjtVwpgbFA/CRxRfPl3C1A8K2jW3oOPmMcj2N+bn3buz7kc6+AhIM+kXlDmK9wiL
	if7hb5c/hchhEzy1H62aZj9B05sm6yxRGhF
X-Received: by 2002:a05:6830:4c16:b0:7f4:eaa0:1d14 with SMTP id 46e09a7af769-8309610ba27mr974839a34.9.1791537835773;
        Fri, 09 Oct 2026 02:23:55 -0700 (PDT)
Received: from localhost.localdomain ([14.22.11.163])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039076dc3sm1446136a34.14.2026.10.09.02.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:23:53 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	Samuel Ortiz <sameo@linux.intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] nfc: llcp: fix socket list self-loop and soft lockup on bound connect
Date: Fri,  9 Oct 2026 17:23:38 +0800
Message-ID: <20261009092338.3146149-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

llcp_sock_connect() rejects LLCP_CONNECTED and LLCP_CONNECTING but
not LLCP_BOUND, so a bind() followed by connect() links the same
sk->sk_node into both local->sockets and local->connecting_sockets.
When the peer answers with CC, nfc_llcp_recv_cc() removes the node
from the connecting list and re-adds it to the sockets list, where the
stale bind-time linkage turns the node into a self-loop; every later
sk_for_each() over local->sockets then spins forever (soft lockup) and
the socket refcount leaks.

Reject connect() in LLCP_BOUND state like the CONNECTED/CONNECTING
cases (a bound socket must be closed or unbound before connecting to
another service).  Failing fast is also the only honest option: by the
time the error path could restore the binding, connect() had already
overwritten the bound service name and the unwind destroys the bound
session regardless.

This vulnerability was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: a69f32af86e3 ("NFC: Socket linked list")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/nfc/llcp_sock.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 1e5ee4bcde684..33afd85f931a1 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -714,6 +714,15 @@
 		ret = -EINPROGRESS;
 		goto error;
 	}
+	/* A bound socket is already linked into local->sockets; letting
+	 * it connect() would link the same sk->sk_node into
+	 * local->connecting_sockets too, and the CC handler's re-add turns
+	 * it into a self-loop.  Reject like CONNECTED/CONNECTING.
+	 */
+	if (sk->sk_state == LLCP_BOUND) {
+		ret = -EISCONN;
+		goto error;
+	}

 	dev = nfc_get_device(addr->dev_idx);
 	if (dev == NULL) {
--
2.43.7
