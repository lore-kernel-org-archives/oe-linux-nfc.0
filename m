Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B562561A7
	for <oe-linux-nfc@lists.linux.dev>; Mon, 13 Jul 2026 01:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783905769; cv=none; b=ugia8d1oqJSzy+M2wNYh1Wecbi3kIKzotCyiqLOA+E6o5vMzfvVCeGqUA/YUFt/oEzslDeVEPXgSSakj0fHdR1qH9J9McaZTaLtqgFRcKlGJS0DdK0tXAQFHAXbg2u9HWOefqubojPBm7xBr5aSdViAeewPZTb1q7S1/HP5kmWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783905769; c=relaxed/simple;
	bh=r68fvNfyB5iq5zgmcYtQh4f4Sqo7v+mUf0FuLyud6fI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y9vhDT9/OR0QoyBmlkIHoWGY9RLftd3nnZyNyIn0ibxIpvd/HqERPqQUROsd7VIcAsoO7vMCgMBI19Of2CYKT3suJKXZgZpeIzj1EOamk6ZuOgAYYSOVywnlVToj88wf1LFfMt7tDdWGMlE5TV/JQBUqlsTQQeq7QHK6AMHXQuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haZpXBwr; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haZpXBwr"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90327237340so14620886d6.1
        for <oe-linux-nfc@lists.linux.dev>; Sun, 12 Jul 2026 18:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783905767; x=1784510567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NTLeZyR0HQahPotCRM69u6fZXEm2pgRfmSKzmsE+130=;
        b=haZpXBwrljmV7e+QzKpUT+82x327HOtBHXa3hP0mz2FELuK6mGUqkPqIvl28B3k86f
         c5LPV1eOxI4NVcHBt+un8S/FEUZDfBc2TqZf13kyAJVKXhkYh2O9xE82EMa0CDqf3wCT
         S85dDhjKDq+9HEGX3nTPD7MdIvYxTgsc8Eki734H40tdkG55oYgjdZ7Fff8aOuu7sIq0
         4Tpuv7UMxDj5ct9UV4Zg4ksUokBGzdLEqilAF14JObjUcDjh89n0FV54Igb0Mpding+Z
         WjMvlxZxp3X9DKi2l29P/l4SrBKEmQZ5TibDsJ2pLinSIpXbkGcwiMwYGqSxNKqkdFZ9
         CFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783905767; x=1784510567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NTLeZyR0HQahPotCRM69u6fZXEm2pgRfmSKzmsE+130=;
        b=ZjRrtDg6qGxI3a8q0hb7jQq8YmLqd6Z2IQwo4mo4X/FAtjnso32+fwOiiuBCxhN9P7
         sEeYocvXCT9gn8+S8DL7HJvTF6/R6CRFdw+dMWQqkQ2zex+wcQ+JkpJ/FsObEH8PGsaP
         ZcPapLwKnFekBbd6yhCQKX86N9xgtJ67j6BVpD5zFYpqKDfTverNOyKDSLuvmkoVYd6G
         uwNytFf8sglv4lA6svVa6gsLLeY21ZidYxWAtp9m5w93pgYKrIAfBt3LCQd4OQXD33YY
         brhbftTRinEGApzyTptH6OVka3nzZmHFTPhUo327mnZ3ryJBrw1gwI1r8KJUhQKVpJ2b
         0rvw==
X-Forwarded-Encrypted: i=1; AHgh+RocmV/X+vrqqHlrZ15L6kPzKvdy2v709sfeQjMHBhQR7IQJ6SXCZai04It6svFlbEgxZBBFJTZiqymehFo=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywex25K2jIAqmjQxO3yfPIR/JB76eFtwlKq0aohVwKgb97hgwYQ
	g7Yfg4WBRwcxKIt0pUJv+mAmNE+eY65O9wnWJVLVn9Avblq2pqgKpCdP
X-Gm-Gg: AfdE7clbTiUnsYuHmxNqmll8ULYiRlHOko+6v06z+9vfi0eplGodLt9ikWKyy1GC3JO
	YJbHQ8RYejtYI+PjmnwTDnqeYV0TH1IrUTXEMuoBoUcqU/AbE3YgKZaMimaBa3dcoX6SYtHwR4f
	bB0WGpyyCKfwBcaaugH/PcznxMpD9QeUf3l0bRV7/stFpN4Pwxh5pU38e7kCEiflU3GKGXqyRkS
	28Z53o9VBq3amReE9mkTggjChBAJN/Iap+9ExRTa6T3Gy6sHifF4YNQDIyHnEYEmTsjO2D4B3PW
	VLA1+8oCei2uoYeExN8SMZGECsStWhpEyR+O5D1kU/dvxf4oFFDkXwms4FwuqXx82wT3752eYa5
	t4Taqy/kHUEdRytwbRPrilqGpl6Dt4Au9H6oEnvm6ZVDPnGfp9bam8zkwXzQsHOjsosPlUZfAZa
	cxwivrskjFFWr3O9uyARS+ip7g2M8Ub2nYpsZ5EOVCSA==
X-Received: by 2002:a0c:f119:0:b0:8e5:8d7b:5188 with SMTP id 6a1803df08f44-902351409fbmr120041846d6.9.1783905766785;
        Sun, 12 Jul 2026 18:22:46 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd87cad3csm117151996d6.48.2026.07.12.18.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:22:46 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Subject: [PATCH net] nfc: llcp: Fix raw socket local ref leak on rebind
Date: Sun, 12 Jul 2026 21:21:11 -0400
Message-ID: <20260713012111.4066423-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Raw LLCP sockets own the reference returned by nfc_llcp_find_local().
When the bound NFC device is unregistered, nfc_llcp_socket_release()
sets raw sockets back to LLCP_CLOSED. It also unlinks them from
local->raw_sockets, but leaves llcp_sock->local pointing at that local.

A subsequent successful bind on the same socket gets a new local reference
and overwrites llcp_sock->local. The old local reference is then lost, and
the final socket release only drops the new local.

Drop any stale local reference after the new target local has been found,
but before overwriting llcp_sock->local. This keeps failed bind attempts
from changing the old reference while preventing a successful rebind from
leaking it.

Fixes: e6a3a4bb856a ("NFC: llcp: Clean raw sockets from nfc_llcp_socket_release")
Cc: stable@vger.kernel.org
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 net/nfc/llcp_sock.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index feab29fc6..0c00cdaab 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -152,6 +152,7 @@ static int llcp_raw_sock_bind(struct socket *sock, struct sockaddr_unsized *addr
 	struct sock *sk = sock->sk;
 	struct nfc_llcp_sock *llcp_sock = nfc_llcp_sock(sk);
 	struct nfc_llcp_local *local;
+	struct nfc_llcp_local *old_local;
 	struct nfc_dev *dev;
 	struct sockaddr_nfc_llcp llcp_addr;
 	int len, ret = 0;
@@ -185,6 +186,11 @@ static int llcp_raw_sock_bind(struct socket *sock, struct sockaddr_unsized *addr
 		goto put_dev;
 	}
 
+	old_local = llcp_sock->local;
+	llcp_sock->local = NULL;
+	llcp_sock->dev = NULL;
+	nfc_llcp_local_put(old_local);
+
 	llcp_sock->dev = dev;
 	llcp_sock->local = local;
 	llcp_sock->nfc_protocol = llcp_addr.nfc_protocol;
-- 
2.43.0

