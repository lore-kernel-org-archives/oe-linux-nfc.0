Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2B722576E
	for <oe-linux-nfc@lists.linux.dev>; Thu, 16 Jul 2026 23:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784244435; cv=none; b=OZYZ6z618BFF00m2/tXv+hBV/dCQrTOOqsk+jmyzqoYJ+c/8J0Gx5y3FPPaBrhhYjrzgDEAkM3Mp/cjAjeekZ33eckRScy6BTpP9efzBbvbnFHj19jmEVliNCcVVS2gIUlxu59m0jeIofFbyoD6c6dWvCnXQSCYEfulHvBGOBBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784244435; c=relaxed/simple;
	bh=lu7YV5CCiyyOEgBNVeSsxlZkRV4pW1Z5+pf0FhhYiGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AJ2Cdacm8DsqJdl4nezkvuNnNQIRsBt03SRVxiLCbhGHh6gl08V0O38TQ7hyAbhXyBTpn5HXwgf4gmJY+rEhLiur2HQrKoivk2uRIXmOrZrtbjwTFJ+0uvxk+TxWWpjhmmtQ2deItoF/kxDhvxIVl6zEoSHInsDjFpwQrTpY7nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKGU05z4; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKGU05z4"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15dd4b9132so1075531266b.1
        for <oe-linux-nfc@lists.linux.dev>; Thu, 16 Jul 2026 16:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784244432; x=1784849232; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WXuUFnyylEezjX3V9l0E0T/Ofv34IDOK/Bhil0kWQpA=;
        b=AKGU05z4Ls/SeWydmpnFcRCb1NfSjNKvEKPDDzNBsVhwyWNTmkK55X7VCwl2F1xo8E
         0spfq4jfUNxcraTSFDZB8DxNA3luLPRR1fFz8a9jsNgN8WBIUfBJHePIZ/fMW14U+cR0
         G1tphmfcigbuo2RR+nDT/xP29SVJvXPU+4qIjLDz7KAoCRiRc2hFDl+c0cogm34ZyLyF
         eaWRaz43PKqUX54GYgCCw9pQwC5w2o5xEdPT/A+LDzSudHAaCOvYKPQtloyrfsmCcuTG
         tIxCEh2n9QcbLz/n8S1VJt7l1jQwllzdtS563H58Vpo/3bNWzLyp2L2Qoz6h/dmPAXXV
         5q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784244432; x=1784849232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WXuUFnyylEezjX3V9l0E0T/Ofv34IDOK/Bhil0kWQpA=;
        b=kUmE9iWAhPbPf0t2pwXIQNMsTWjJRLNjt/dAPv3ETd+RoMu+RADVAr1JClFvSG4X/f
         W6HloNj3Wn/syozlN872jUaju1GPe5TCW2MkCw1OW8eIXrfJwSM9FoK+JobWhYg02Wps
         XFVZJb+/Wz2jARQ/6b6F6z18bDepHQZv4AmWCvA7blav31+HYixSUT6moHBwRGTk4smm
         uapvRalWrADTEDynf3WWN8LbfABCfVYMP/wUhZ8TDn8hrELdycvC+zsir5sg+F5jMzbw
         WoiQV9w3fFTk+WscueUI9HDBHTUtSvbj7dngOnFuDPNcovIiRM26Nhc02FZAkeqb9qTj
         1QKQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0+7VmA9RtQLNwI2fkAGPVsasjDtngmFl1f5GL0/wb7vj2Nss5GmQ1kK4lpAmzU48uyVcaImntPS+qNgA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxG6MPsxlwSCJUUiWO4fMHFaNg+CRm84yG4o9b3dBYc8WvgrnLb
	vdEnsLPoEGPmtYUttQIWV9f+5ZCSku3eAZVEbhpefi4Qgg9XpJ1g9sPC
X-Gm-Gg: AfdE7cnCjPtjyMLKpt8eXXtdThtoR9eio1Xaihxtn7Nk0qg5vUAkVIdWuMkA9guiqu6
	yi06Uut1l5raIJ00DcK1EsE0jI8x0u+ZsvZZRr59BY0vCNNyVQxiUZZ4OT0I59AJYLIjd3a0Yse
	IBnmOskeJkvZA4+EXNkiA92mQ6UjavUSK+K1ktEcfLosfkX966QSnX9oCxa1aVk61vnD2jJ5X7F
	vBDqL0MLEZnYgirOQtrOsRTfqFRyBp8sat9Mm+Ex6J1yNDH35tz4P9/r/5PazUFVDI1cgsUSSjd
	ojHsgdTijnnJ6IqutgHLAXHmA9G6pClRBux67wpfViSMU8M7RNY2Pdfx+5eYTpHTyT8fuoteASK
	T5XAZJQcIkJkV6OMcqcIP7pfjUoWY/V+Bp7GlYZLpmA1hknzgjtB3Y931gZ3vi4a5gRlmug==
X-Received: by 2002:a17:907:6094:b0:c12:a16f:6864 with SMTP id a640c23a62f3a-c16b476b7b3mr599666b.48.1784244431513;
        Thu, 16 Jul 2026 16:27:11 -0700 (PDT)
Received: from beelink.. ([164.5.253.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744966asm295102766b.50.2026.07.16.16.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 16:27:10 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH net] nfc: llcp: Fix list corruption / refcount desync in nfc_llcp_recv_dm()
Date: Thu, 16 Jul 2026 20:26:57 -0300
Message-ID: <20260716232657.203145-1-qwe.aldo@gmail.com>
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
index dc65c719f35f..d8dbb1bb857b 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1249,6 +1249,7 @@ static void nfc_llcp_recv_dm(struct nfc_llcp_local *local,
 	struct nfc_llcp_sock *llcp_sock;
 	struct sock *sk;
 	u8 dsap, ssap, reason;
+	bool connecting = false;
 
 	dsap = nfc_llcp_dsap(skb);
 	ssap = nfc_llcp_ssap(skb);
@@ -1260,6 +1261,7 @@ static void nfc_llcp_recv_dm(struct nfc_llcp_local *local,
 	case LLCP_DM_NOBOUND:
 	case LLCP_DM_REJ:
 		llcp_sock = nfc_llcp_connecting_sock_get(local, dsap);
+		connecting = true;
 		break;
 
 	default:
@@ -1274,10 +1276,33 @@ static void nfc_llcp_recv_dm(struct nfc_llcp_local *local,
 
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
 

base-commit: 3f1f755366687d051174739fb99f7d560202f60b
-- 
2.43.0

