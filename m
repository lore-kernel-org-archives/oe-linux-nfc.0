Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162445;
	b=xmgzk6i0AYVNwQlXmjfSunf98LzKFR84lVTW2vtPVa6HCG8TUu7hx5HlWl7son4WHQnf
	 vKed3mnP12MOsOwYlha7yjuU8STC+/hddUpsVoZe4+D7rRaCMl4CtvHa6n2X998O18QiK
	 ijI09PVZL+zGjIcE4piGJf8AqASB5Z8zFSl9yr9MGDSSAUs45K+7beTIyAdPaqZh3sNmD
	 Dl8wZhpnZJ2ma8yHWfuBMfTFcyKld5p57b/d42Nr34hhrFI4k4UaDRyM7aER4++3JWxy3
	 LbnI0JtYNVptAGDdo1VN8BiB792o9JITC34ZXmBn12t+bDjM4UFZHJMLAOs3WR+qnOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=T0QMJszuIflUVnI8KlcqSRkClwadTrIU4ZiU7YrghCU=;
	b=X6gkOuxVjuTxeiLJe9YyDlX0+sucMjpy0lkuA8s/nYwOGkwXPQtD6rmPr2uRQsjM8bAR
	 nKW27n+D9jPO//sH//yjEvep9hRLZumpq5C1HnTXIoxY7d4ZCZEQjpPNNKV9SFlV4DRtb
	 q8P6l5Qe12Ser4WLgg5V+cPbFsZScnMKGZgRg+HtG8L59urut0t/WeLIolcFFAJ43vBYL
	 TvvrJIPjPqbc3K8Xuj0ogMSs7pGlc03LnevXmsdJHmT1ARlILLf4aQSkmYeq6Z/f6oVYD
	 aGyQ+fxT6JnvveywQCpYx+eH7Gvs/ZpXn0RyG656xPex2TZbIfNPUBYww9h75DMc3Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBV14LKS;
	arc=none smtp.remote-ip=74.125.231.198
Received: from mail-oi2-f6.google.com (mail-oi2-f6.google.com [74.125.231.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4560C606A33B
	for <oe-linux-nfc@lists.linux.dev>; Fri, 20 Nov 2026 08:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4560C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBV14LKS
Received: by mail-oi2-f6.google.com with SMTP id 5614622812f47-550f311b527so288260b6e.1
        for <oe-linux-nfc@lists.linux.dev>; Fri, 20 Nov 2026 00:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162444; x=1795767244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T0QMJszuIflUVnI8KlcqSRkClwadTrIU4ZiU7YrghCU=;
        b=VBV14LKSgURU53eel3QB9hU9fWqt9/Ld8XHj5nMFv4vVddrzchg9qlPgz0VQY9vRUJ
         vfYY0+cGjzGQV9b4VZG8Db+A0vr+NsdGNeqTdoQbQ58zUAWy5Ks0XMVytPzS9Rr4vivd
         ZjTL6vEmv+BVQwywINJERc1T2M1J4Ba966POG364xInmoPPruztMTShndgFPmBhjtrvp
         KpYUPQMHrbmocY9qLXSWdngDCgNkMAoA9qn48t7J0M6eYLkWAr/MXFrWdy6mslMfIAep
         5uXhshgtv+q9ST6ItfCQvRd84qzS030JB1+gHzokJpRJLuAmIqflTyXjTohHksSCu/Dz
         vPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162444; x=1795767244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0QMJszuIflUVnI8KlcqSRkClwadTrIU4ZiU7YrghCU=;
        b=TWsh7DCoBf4TGaDCqusndTg4jRx3m7s1AusNobzgc2WPF4cabtP354yQ8OM8PZsM8o
         caGYo4VNIa9z85fZGyQ8iVTuGthm2bP4gP/Xb8vlnHx9DvNFkq4rvCP6PQ00I56vXDls
         YvvfCYisxgP9Q0jEns+rGd6FdzfMokJbLZsMBvWOwY4gRZcoosFu2nhoXQyGo8ta+YcN
         H497u6l94skD4zXjwiZrXNwomWUWbxgLYUJl4A5f+OSnyPKwP5iARMZ1AALuh35eZgQa
         iVmnbbhGjXApFkH0QGl3ySpO7kzqWkamdB57cUchX/HyFBPYclILlNAQIyi7EdPBqqzG
         VDag==
X-Gm-Message-State: APuU4Z9Ntx8H9nYzsaU4+Sgp8SPobGkQ/naodoPuD/dFnnTRLxeedhzT
	EC1x6ViCDPANKKs51IiK8sX1M9wYeHbJxu6CD+6utAYosKJn2Qx4zzEX
X-Gm-Gg: AZFdTZd+I4Z6LPy32LT0jPytgxZvJOS1DPqlK/y2bvikhOHfpxvjBN44RUtqzey2q9N
	BmfCxrx1FcmMo1jhVAN7pvZiHEhyNVdUAcoZAUHm38ex/pW6z2nzez9vk6eRj4KcJ2RGVzzy7Zo
	GauxsgpgwcW9pEqRp8T0MhsBApY+SeVfs2m6CdoHSe2oBFVVlfxqnxqDOXV42WUtZEvSo3CfK+r
	zAqIweRnf61RNviZm0abl0e0hlw1K2wp7H4gUR/MWfibl0mZVgUBDpbL1ko/pOkYt3FdvRt1mlp
	D02hjGHbVXrjTRRMMhDTF4a+XJOmAMoTOtC3SAmwLI2TTbmm1uUfqpCcjl3RgzrGsCQlngaG7Gz
	9mc/AWy7wXumaItmQ9TPh+F5nUH0Bx4K8IpGV3LhFeH4h/YFBaLO4OR7+V6AOAVgATZu77v7nGH
	vnIbjc2g28bfqfD3JiveCZdVuIN4eHwpxhy6LaKscbpdMWU7Xvri+I77Egh/Tv5kkwEb3y/tToT
	Us5QwS8udHyosN/NMeMn55L1v97cjx2is+b5Tq8s2xlEg5fIkbWGen8OFzMVaC9GIYwYJO4lcR0
	+jw0WZ0X/OP3q9Mum5LLe0M+Zp8Bsuxo/xlC1PGcXxV9/YIdS/wpNJjzVFeIBd+MSR8=
X-Received: by 2002:a05:6808:1387:b0:4f4:b62c:a3d8 with SMTP id 5614622812f47-57a0a937f43mr3229475b6e.33.1795162444278;
        Fri, 20 Nov 2026 00:14:04 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.164])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a350548ffsm1497559b6e.11.2026.11.20.00.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:14:02 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: david@ixit.cz,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] nfc: llcp: fix double put of nfc_dev on interrupted connect
Date: Fri, 20 Nov 2026 16:13:54 +0800
Message-ID: <20261120081354.4098856-1-bsdhenrymartin@gmail.com>
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

llcp_sock_connect() takes an nfc_dev reference with nfc_get_device()
and always drops it on the error path when sock_wait_state() is
interrupted.

While the socket waits for the peer, nfc_llcp_recv_cc() can already
have claimed it: the CC handler moves the socket from
connecting_sockets to local->sockets and the reference now belongs to
the socket. It is dropped exactly once, by nfc_llcp_recv_disc() or by
llcp_sock_destruct().

If the interrupted error path still unwinds that reference, the
nfc_dev kref is put a second time. Once the refcount underflows, the
device is released while it is still registered and in use:

e.g. on v7.4-rc3 (KASAN build):

  KASAN: slab-use-after-free in klist_next
  Read of size 8
  CPU: 2 UID: 1000
  Read: klist_next <- class_find_device <- nfc_get_device <-
        llcp_sock_connect <- __sys_connect
  Allocated by nfc_allocate_device <- nfcsim_device_new
  Freed by kfree <- device_release <- kobject_put <-
       llcp_sock_connect <- __sys_connect

The freed device is later used by nfc_llcp_tx_work(), which trips a
KASAN use-after-free write in mutex_lock().

Check whether the CC handler already claimed the socket - it is the
only path that links a connecting socket into local->sockets - and
leave the references with the socket in that case.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: ff353d86a92e ("NFC: LLCP connect must wait for a CC frame")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/nfc/llcp_sock.c | 50 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 1e5ee4bcde68..22b2f65e984a 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -683,6 +683,36 @@ static int llcp_sock_release(struct socket *sock)
 	return err;
 }
 
+/**
+ * llcp_sock_on_local_sockets() - check if a socket was claimed by a CC
+ * @local: the LLCP local the socket connected on
+ * @sk: the socket to look up
+ *
+ * nfc_llcp_recv_cc() moves a connecting socket to local->sockets when the
+ * peer answers with a CC frame.  Only that path links a connecting socket
+ * into local->sockets, so membership doubles as "the peer claimed the
+ * socket".  The caller must hold lock_sock().
+ *
+ * Return: true if @sk is linked in local->sockets.
+ */
+static bool llcp_sock_on_local_sockets(struct nfc_llcp_local *local,
+				       struct sock *sk)
+{
+	struct sock *s;
+	bool found = false;
+
+	read_lock(&local->sockets.lock);
+	sk_for_each(s, &local->sockets.head) {
+		if (s == sk) {
+			found = true;
+			break;
+		}
+	}
+	read_unlock(&local->sockets.lock);
+
+	return found;
+}
+
 static int llcp_sock_connect(struct socket *sock, struct sockaddr_unsized *_addr,
 			     int len, int flags)
 {
@@ -781,9 +811,27 @@ static int llcp_sock_connect(struct socket *sock, struct sockaddr_unsized *_addr
 
 	ret = sock_wait_state(sk, LLCP_CONNECTED,
 			      sock_sndtimeo(sk, flags & O_NONBLOCK));
-	if (ret && ret != -EINPROGRESS)
+	if (ret) {
+		if (ret == -EINPROGRESS)
+			goto out;
+
+		/* If the CC frame was processed while we slept, recv_cc()
+		 * moved the socket to local->sockets and the dev/local
+		 * references now belong to the socket.  They are dropped by
+		 * nfc_llcp_recv_disc() or llcp_sock_destruct(); unwinding
+		 * them on this error path would put the nfc_dev reference
+		 * obtained above a second time.
+		 */
+		if (llcp_sock_on_local_sockets(local, sk)) {
+			if (sk->sk_state == LLCP_CONNECTED)
+				ret = 0;
+			goto out;
+		}
+
 		goto sock_unlink;
+	}
 
+out:
 	release_sock(sk);
 
 	return ret;
-- 
2.43.7

