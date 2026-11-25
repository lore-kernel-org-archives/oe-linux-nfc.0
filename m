Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575461;
	b=BmilVdS1MSRJEssfcoZ6u/CUqcL90B44QkElSvLiSx/q98zGTWkj7pe2vyv9jowkD2p4
	 Qmr1S20PJX6bjFBUw9NI14JMrS8jorlYStTwJtN1VXa/9/4GXZMR1j/kcuePmkBjweoum
	 adOyq4LvnDGaLl1rPNXPV+tgkr2rXH1INNCpDZxV7HtZb2XC6pzeWaoITbucrHyBgBcHK
	 4OBaJpOhvJXGRDiJk+NL9v3w6Tfx6s0ljXFYlhfyYtRmEAHS7txRLmwrFWDrZgIhLhiLt
	 DiZ6X1wKFBSJaSNG6EAQjYHPnXgxsWokcJJREUE9yL21n2iimkpMAJyKstoZm764DTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=SwOZibvAccnxBelZH8y949wCLqVF2LXLaAyvhlz6UsE=;
	b=Uq5bqIMgkTPcoMiMverI18aAgdamQ3dVDauAu+WadxrtIMbA/FPwn3yA8cLm0iY15Ltd
	 Os7u88vYIVQO/ONwFAEVHfvn/5G00n4eHTRXTpCSi+2HK/H6iqvEKkybOdIYjZZGFuX35
	 KqtWTXttQCb3xI/OWRgmvGuOqFRpuTh/ceBCccqzqEpxTAfojiMriXDYUyQhB/9kuUZzk
	 nrEBYFB56ps11Tk8Yz5atRpbOikvTeSHkohePtD1jOuEoZBD7W7rLkdQ4YDrE+L+iiHOo
	 wJhiCtCmCF5nvfcBMJjza7sznqJpF4E6yTzHY4OdYR1iATF/DbJb0HEsZHRUDKcuNeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUWIvr1d;
	arc=none smtp.remote-ip=209.85.210.68
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518CB606A323
	for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Nov 2026 02:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 518CB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUWIvr1d
Received: by mail-ot1-f68.google.com with SMTP id 46e09a7af769-862df509d48so4108004a34.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 24 Nov 2026 18:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575460; x=1796180260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SwOZibvAccnxBelZH8y949wCLqVF2LXLaAyvhlz6UsE=;
        b=PUWIvr1dnsCTxxhKowmlDog5rVNAc9EcYqtie4Uh4bvvo+DrPjPns7rg+wa838En7y
         lwOWPFqvH0Uh5GFLImHssVereu9qehcqDQlQBo39WzsqE+y5qSgNSvDIBTm1wrMua2Iq
         rX/UyGEw4/O62URMo3Zjj3wLWm5mXuVM/gxkImp7++ct+mQo8OJnVUFpDj248h/493Gz
         BWMWKbvphO+YiYD6s5cSoi++ePQVr1aQi4enGITyjzwfoCD5iq/+4qD85UO04plHE31M
         bwT2meQ1FEahKGwbYoYrl3Wg68j3Cv8+7xJde4slEqkfKbPlZDXuTy9DjPQAtcvN9ixK
         HZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575460; x=1796180260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwOZibvAccnxBelZH8y949wCLqVF2LXLaAyvhlz6UsE=;
        b=cp6hc7ePFCl9u8OZeKNoIhkWmXntQYKWLpUplm3LenDJiKb1q9hDVlTESOEvDGFCM6
         EkBXTiD+4DJl3igzK2kuS0l7C7ifflYxkjCBPGxV/hkf52X3mrL4Oi4xkxV1nHHW1Cew
         7r3Ypx+K/hN1VBOpnVmx/RKyrUIoTEBZOcJciAW6OcjTcli/EPTVJb6YpubFjI1DSb2b
         MY0RaE/iIuEBs4aP1TWI8FFA+7cq3i8p0zyCr8EAARZGEZ1YmJVm8CTFI/TQBUDUtCOk
         Q73znJFRn8/zENVhDASy0+9uYXWJGt91CuIATY+PIVK8l6ucR9jENsNA7Q08oH1UV0cl
         Kfiw==
X-Gm-Message-State: APuU4Z+JmxQG3PmILli2yT4dTTKX1CfBAzAaqGIlLt8HJe4VsQ1pEbOG
	SIaHO9IMCT0DlVF1ed7c7mXkAb0fGiRn3E2yehwPVWNZ4HDIs1XB8AUh
X-Gm-Gg: AZFdTZevuSr4ILHrsbupT/bHqwUaSCwkA/44f5kB3Q8Addq5HnPT3+c7SeaB6EHIYT5
	K3MU/PrB7Bd+88btTQfx6IQUeqSrxScP2gkzfzs9fUOJWcaMJVAqjWyZzwxBgimAbUZylMOb9k9
	CcJPJPH26NiEiXHfSsvQszEEC3ABoS4ujaYls7gz3wRroGAlz8OJTCVtRQTUQjGLboYxVPmnl+B
	UvD4s7Z2cV+IL00g/0ZpPCtSWFNbmvmfm6rBTbnKdeohvU5ZIeFYFNBY+xlicvEq5lt/3K1KhyS
	lKBGGMejZX6GOmHWPrqaAfnrEeRLQmxPnfp9SaQD4+6Gfi8IFVMRA/SNqi0oJNI+kpAujn81usX
	2kfOB+alHyo0ZcWh5NaUPDIexw3qWKyjbT0l2S6IAnKbNUkoNZz1Ey0qo3YzxO0EBnkWMl2TeeJ
	/u/ZgZzo8AfdKt9eeyQ/Com3HD0e8t/m4cO14djHhIptP1sVyHH6Zw9XfpSEadvEcPFyBaynSwk
	o9pjEQVjN9xWxJOm9ugSgHWQpbKlbpMa94CN871rjv1MFF1NSTEIUUghpWrRE1w/64IhTgYEc0R
	eoom/xnHArFV3gRL+COTxysQOUvSJuNt5dRiAADlJeH7hCk/6IP5PbOvYhETIN5lRuVo
X-Received: by 2002:a05:6830:640d:b0:862:c21e:4f75 with SMTP id 46e09a7af769-863091e1e95mr13456344a34.15.1795575460166;
        Tue, 24 Nov 2026 18:57:40 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86322db2d1asm10701384a34.4.2026.11.24.18.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:57:38 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: david@ixit.cz
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	edumazet@kernel.org,
	horms@kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH nfc v2] nfc: llcp: walk the accept queue under the socket lock
Date: Wed, 25 Nov 2026 10:57:30 +0800
Message-ID: <20261125025730.383142-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

llcp_accept_poll() walks parent->accept_queue and reads each child's
sk_state without holding the socket lock.  nfc_llcp_accept_dequeue()
unlinks closed children and drops their creation reference under that
lock, and the last sock_put() frees the child.

A poll() racing with accept() therefore reads a freed child:

  BUG: KASAN: slab-use-after-free in llcp_sock_poll+0x440/0x4e0
  Read of size 1 at addr ffff888112387812 by task poc.bin/528
  Allocated by task 198:
   nfc_llcp_sock_alloc
   nfc_llcp_rx_skb
  Freed by task 529:
   __sk_destruct
   nfc_llcp_accept_dequeue

Take the listener lock around the accept queue walk.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
v1 was posted to netdev without a target prefix; netdev does not take
nfc patches, so repost to the nfc tree as [PATCH nfc].  No code change.

v1: https://lore.kernel.org/netdev/20261118083811.1721010-1-bsdhenrymartin@gmail.com/

 net/nfc/llcp_sock.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 1e5ee4bcde68..3503f1a7a7cc 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -584,8 +584,16 @@ static __poll_t llcp_sock_poll(struct file *file, struct socket *sock,
 
 	sock_poll_wait(file, sock, wait);
 
-	if (sk->sk_state == LLCP_LISTEN)
-		return llcp_accept_poll(sk);
+	if (sk->sk_state == LLCP_LISTEN) {
+		/* nfc_llcp_accept_dequeue() unlinks and frees closed children
+		 * under the listener lock, so the queue can only be walked
+		 * with that lock held.
+		 */
+		lock_sock(sk);
+		mask = llcp_accept_poll(sk);
+		release_sock(sk);
+		return mask;
+	}
 
 	if (sk->sk_err || !skb_queue_empty_lockless(&sk->sk_error_queue))
 		mask |= EPOLLERR |
-- 
2.43.7

