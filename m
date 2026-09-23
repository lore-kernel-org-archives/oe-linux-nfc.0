Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F7B489FB0
	for <oe-linux-nfc@lists.linux.dev>; Wed, 23 Sep 2026 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170434; cv=none; b=oKiQ/gBDc1BsOeMMD+R1xxssRqASewOXjLJk9BwZ6LQk3JZycp/1yyuTFCihhilWdqJVtCyr+vlO1k36SayrcjNjNvZXa3ZKQY1IqFVvZUT6zI6+ugiC3wnuUkGedKl8mumXhVuLp704rE8H5UHG5g7+3liDoqlWSs3Zgha12jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170434; c=relaxed/simple;
	bh=w1fQS1nTWrUrIlI4ihs1ABgazTfXJca/Tdv4wLIV7Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rQeIZp78wEKZ6EXjnYf6C9HYQFuWZCJaMiU/yG+1vy5Q1xCDz0YRhBepoiy11WIsUQAaMx/nyYHuew555L0uSbr7tcVYLXVxFuC7e6TalLtXtXhG8TL77PBmugJkU0y1wqs0T0mIM5gEWRepMQH7aWYknNBC6iM4aW1NKJvo89s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAgncVQ2; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAgncVQ2"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9832c759198so448026241.3
        for <oe-linux-nfc@lists.linux.dev>; Wed, 23 Sep 2026 06:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790170431; x=1790775231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VigpCgJFGr19aE1C6suxBlVqAbaMUssmLz2MA/9FLTI=;
        b=fAgncVQ2EqB2ad/Uba9akeI9HtlHziwsErrJ8Ai3TO6p5Qn/lhl4d6PJRXDWSo+OCq
         iL+BLhPsFxn3GdLaqKauOQYGx0zV/+CBpLwReNmwko1TTt4AC5nMuV+RRrYsND7rXRQu
         GXI5gJJmaFVBchj9ZET6QnCZ9qQt5nEJj1VEMYG2J0fx+dT5C/4FAgOBywY8B4IssPvG
         drTDaCr9ikG+mu0DCqYgppeKgQ9UtgF9GMFxbncTHXXk1ko3AioGE4l8xZ+yBXl2yhc1
         EofNI3y24OYCS86lTYsgnOc9Kbk+gT7uJxyIHasn5ZtaX0bRTog0pBrgHI4pNNXmQPIX
         UejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170431; x=1790775231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VigpCgJFGr19aE1C6suxBlVqAbaMUssmLz2MA/9FLTI=;
        b=a2Z4U1MnmWa7CBPjQ93FGDDWRx5ELhU0CN8kFUgDjpdcKrFPJLycUzR9I96c71U845
         ls9aBEL1hw0MJ+Ui1wTDCE06MeEvxwFVDWZ4+lGdNjI5jDlVg3kt9rs6Vr2J0WPddwbG
         2xn6aJsHRMzLNtzRev3nv1gDpriacFFNzlnMFOFbQGkxw4qRkyUgba5wR/34n1eqBXys
         rX52kc+GHBzLzWWzNcwHDJvzTK8OuvIprZHhj2B1WgyQCX0i+8PvarWQ+vfFh1wUNYl/
         mGiAQZ6aeHLtTSEZyFbWsD8l9dWSWMqhyqkGan2WA/tBRL1IQqwwW46st4s8YCY3ycqY
         tVTA==
X-Forwarded-Encrypted: i=1; AKwUvBx5JYCAi+gShunXrTi0mh+6OCAHhvu3xespxwzjwCnejSbkr40qc6slPVOspIkQwMYk6RlX+pQ0++B5Yj4=@lists.linux.dev
X-Gm-Message-State: AFuF++kPdHfuF9atKnb7Azo/WRxkCme86n8sm1+7Yl+4OYw1wuzkwHS+
	wCC8Z0s8YRLHU8b10WZrWbsAw4l5sHkeRcUBg4iVOrQWtm7Xc3TgX9qc
X-Gm-Gg: AYBFou0zyJwTQvIy9br23l9Xd1/9qvKFBeO0y9131FZQit/cVrMzi4cG7yEynmoM9I2
	VsmKVbP81DFKRkgf8fKBHfMYMhRgDqxW3zcCX3BAmR3U0mMw8KTW/kX7vRrpn6hbSJWRM7hK3XQ
	WkHKk90kj90DdfIW6h7AeAD9z3i+D2a+ks3kom6IOJ+Wtk653TfHyR6XGpGcZ2/n++GrTqWR22Y
	OQDZQ7MRtMIrdDEK3ScnxDwJzjd4bjF3Leho3euFkWwQApJBo8VQMe94JGIdCZUmJxX/h5zDJOb
	DsRzc7k7IRdorQ+VZ+zE42D9x+Voia8pKk0nzFB0qUC0s15anHiWh/fd44NuM/CH9kQBuqGj5n+
	OHb7MxMYkdjhbI/AUOt67UqG+t9jecnpLO9d0pjNHE3hA5Aaifr7LF0v6QJzXpXbWus22Z3+BC1
	9wnQJ6a6vQstzd2yX2kROdqzsn7oyyCmN8TiXPiUtlYAU2d48Ecd0lVOG72kb31rY=
X-Received: by 2002:a05:6102:38c7:b0:7a7:198b:674c with SMTP id ada2fe7eead31-7ac1e251385mr2374231137.33.1790170431324;
        Wed, 23 Sep 2026 06:33:51 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf61931c3sm3480402137.11.2026.09.23.06.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:33:50 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH net RESEND] nfc: llcp: Fix list corruption / refcount desync in nfc_llcp_recv_dm()
Date: Wed, 23 Sep 2026 10:33:39 -0300
Message-ID: <20260923133339.2518641-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfc_llcp_recv_dm() handles DM(NOBOUND)/DM(REJ) for a socket that is still
linked on local->connecting_sockets: it looks the socket up with
nfc_llcp_connecting_sock_get(), sets sk->sk_state = LLCP_CLOSED and
returns, without taking the socket lock and without unlinking the socket
from the connecting_sockets list.

llcp_sock_release() selects the list to unlink from by sk_state: a socket
in LLCP_CONNECTING is unlinked from connecting_sockets, otherwise from the
sockets list.  Because recv_dm left the socket physically on
connecting_sockets but in the LLCP_CLOSED state, release() takes the else
branch and calls nfc_llcp_sock_unlink(&local->sockets, sk).  That runs
sk_del_node_init() while holding sockets.lock, i.e. it removes the socket
from the connecting_sockets hlist under the wrong lock.  A concurrent
connect() linking another socket onto connecting_sockets under
connecting_sockets.lock then mutates the same hlist unserialized, which
corrupts the list and desyncs the sk_add_node()/sk_del_node_init()
sock_hold()/__sock_put() pairing.  An unprivileged local process holding
LLCP sockets, with the DM supplied by the remote peer over an established
LLCP link, can drive this to leak kernel sockets without bound (the
mis-decrement goes through the non-freeing __sock_put() path, so the
object is never released), leading to memory exhaustion / DoS.

This is the same class of bug that was fixed in the sibling handler
nfc_llcp_recv_cc() by commit b493ea2765cc ("nfc: llcp: Fix use-after-free
race in nfc_llcp_recv_cc()"); recv_dm did not receive the equivalent fix.

Fix it the same way: take lock_sock(), re-check that the socket is still
hashed (release() may have won the race), and for the NOBOUND/REJ case
unlink it from connecting_sockets before moving it to LLCP_CLOSED.  The
unlink drops the connecting_sockets membership reference via
sk_del_node_init(), leaving the socket unhashed, so the later
nfc_llcp_sock_unlink() in llcp_sock_release() becomes a no-op and no
double put occurs.

Fixes: a69f32af86e3 ("NFC: Socket linked list")
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 net/nfc/llcp_core.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index cac1b5487..bd6361e2e 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1251,6 +1251,7 @@ static void nfc_llcp_recv_dm(struct nfc_llcp_local *local,
 	struct nfc_llcp_sock *llcp_sock;
 	struct sock *sk;
 	u8 dsap, ssap, reason;
+	bool connecting = false;
 
 	dsap = nfc_llcp_dsap(skb);
 	ssap = nfc_llcp_ssap(skb);
@@ -1262,6 +1263,7 @@ static void nfc_llcp_recv_dm(struct nfc_llcp_local *local,
 	case LLCP_DM_NOBOUND:
 	case LLCP_DM_REJ:
 		llcp_sock = nfc_llcp_connecting_sock_get(local, dsap);
+		connecting = true;
 		break;
 
 	default:
@@ -1276,10 +1278,33 @@ static void nfc_llcp_recv_dm(struct nfc_llcp_local *local,
 
 	sk = &llcp_sock->sk;
 
+	lock_sock(sk);
+
+	/* Check if socket was destroyed whilst waiting for the lock */
+	if (!sk_hashed(sk)) {
+		release_sock(sk);
+		nfc_llcp_sock_put(llcp_sock);
+		return;
+	}
+
+	/*
+	 * For DM(NOBOUND)/DM(REJ) the socket is still linked on the
+	 * connecting_sockets list.  Unlink it here, under the socket lock,
+	 * before moving it to LLCP_CLOSED: llcp_sock_release() selects the
+	 * list to unlink from by sk_state, so leaving a connecting socket
+	 * in the CLOSED state would make it unlink from the wrong list and
+	 * corrupt the connecting_sockets list / desync the socket refcount.
+	 * This mirrors nfc_llcp_recv_cc().
+	 */
+	if (connecting)
+		nfc_llcp_sock_unlink(&local->connecting_sockets, sk);
+
 	sk->sk_err = ENXIO;
 	sk->sk_state = LLCP_CLOSED;
 	sk->sk_state_change(sk);
 
+	release_sock(sk);
+
 	nfc_llcp_sock_put(llcp_sock);
 }
 
-- 
2.43.0

