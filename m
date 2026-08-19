Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5275533344A
	for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 00:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787098883; cv=none; b=Q+zsofwvdJ4mpSrKpm9VbKdQg+FdpUM7WA3MdbV5WT16CpmKrK7nMNTym+BAHsj9id4JXP9ug0got2nO3Rly7hHkJGLF2JQppT9jIC7csF7YPqqaDREh9bg/ephenzrIeO5KQfTGkt7gjWOKrtR/OZwBqJJwATFQzG0asDMBDhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787098883; c=relaxed/simple;
	bh=7ZGFJi1Tw0QxpKzaA4112Co/fYEKIQvtec5peI9QIT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qTG/Ctx/uikPpuw2rqsHLV8Z7KHWQvB9YeGuLR98Etvp+dDvBgivvWW9WoWYOrH4Mwa/FRjWPVsuasfv8Ttr3bJh/W8pQMlqTCiO2h1MvGXCw3SuqrnR6nPeNgBzoFj+ZPDd06F1CY+plhZY6jFFkJPZOlGkPQ1KgquJZCVsjvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LL/nYF3X; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LL/nYF3X"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e50a650a0so30503785a.1
        for <oe-linux-nfc@lists.linux.dev>; Tue, 18 Aug 2026 17:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787098876; x=1787703676; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=srzljoPEhNJ1BkMUMJRW9e/8iKXpV+6wETzcN3+pJcQ=;
        b=LL/nYF3XikY8TxL+SVfOGDgdDPrHyf6G+rt0pkbXwkj2vCG5mVa8HqJTeKbVGpPpmE
         3/uIgOrx6vLj3wlALHg7I4cuW8AgF7VysQCQ2EbGmdbQQkZYI9amE+mayxtFJ0WJGVMb
         0CjZhYLgqfFeKEZbn0Mec9bFLqsa1/J7oo/GBTRkR5fFLyyH9fTUlX6FD7oe89kdySLE
         t5Zesb0XWFxrGu2pLedLRpUYmYZvNGlD+ZSQYIkffVAEQvusz8Apcy96pKwUQyH37njJ
         GnII5BCYnRdiz2BqCRqPxIFJOvf+wsSLnsHjEzf7h3KPfBFIXO/+X6xVNS32aI++/yeV
         vpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787098876; x=1787703676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srzljoPEhNJ1BkMUMJRW9e/8iKXpV+6wETzcN3+pJcQ=;
        b=Kv0tj0V5Euj4pybas1hunUhth4JDIDaMhxzzXc8CKBLX87RgNjDpDGfLXy0ge3SKEo
         NpyHaVlrYQxEqm/sRTlWKXCHO1w98CtP1JEvEcn8knHKeRhY8G1f1ixhIuk+5RAJ38/2
         Spm2U2arO7wtSLpzkEOsmOQcSHA+Tiw/KkMIX7z7SGHzMkiLrlcWHPC9QrKwE8N1c34B
         h19yPiv9w0sDOApcROz3uU/KP5DOvexSwBXwNogTaM7j17LGu3KoZO20moO8YpwVc9tp
         wdvDNqwSbAf3q1dwgUPf0NmiLj2hhvY9uL/jY1BBw4tAEIX3mIisZLOJnnTr7+Pe+xt9
         GbCg==
X-Forwarded-Encrypted: i=1; AHgh+RohHMvYCzV0n8IVMoiUrFJgyhuWTbU6Cn8uNT0C+h6VKncmcqu8L+KyjPL/cC/t/G9xJGsL65yFDNspA2s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhPmurRMvFtLh0bpVj6yAOoF2CaL+D7efXRGIf4K10a4cagk+2
	KfKHun89H1lyCrPKqlsPzY3XehpoRKHYrBnxbs7KExFYeHmqy3/zzBSZ
X-Gm-Gg: AR+sD12IJHeveXhcdhHFrWvZ97rQ51S8E+qNHku/9+7iQxBiWLUJ8N+TBcsCWkyqZ/0
	8bXhsCuv9AGTmlMFuGAPxP/Ck/egmPdE7ZMxAiRGSKgOaj/xFm2HrKMEbZbvaHFd9btf/VPmyKP
	Gg4DzeD5Ip96MRefIhELzSLbE4qthnQJspevln6IfOiaKJyYmCqFxSlnFINzfSHnxX8/iz5AXJ4
	EFPui2Pfoq3Zt4d20UzY0yu6s4jNN4JB8xcOpjbl4JSGu74Is5A0BV+SJemn6h+KMj4qjeaTsPS
	2d7pEw9IsvbMwNETt5WE8XMHbCd/DaoLid9H1Y5G2sAPAY+x8rkkklPYK/1FUfDriDs9i53RxBC
	PShag7mBjv2hSNS8ZhUytbFKm9qOxzbMvWAA/OLLfZK5t9idQyFwJSimq6LEkuNZ/GHWjCRLH3s
	2Ab2X6ffLtTNSp/GVSsvgjsMXkYzFvnRlE4Gr3qRj+0cYZ0nwEOaCi4ODwynavGN4LkXHpb4qwZ
	RKIAEsxdFXReITimA==
X-Received: by 2002:a05:620a:4708:b0:930:f306:8275 with SMTP id af79cd13be357-9371e20fed9mr109795485a.9.1787098875889;
        Tue, 18 Aug 2026 17:21:15 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93720582980sm15764985a.33.2026.08.18.17.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 17:21:15 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] nfc: KASAN: slab-use-after-free in nfc_llcp_rx_skb
Date: Tue, 18 Aug 2026 20:20:45 -0400
Message-ID: <20260819002050.3476701-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Kernel Maintainers,

I hit the following report while testing current upstream kernel:

KASAN: slab-use-after-free in nfc_llcp_rx_skb

on commit: 3609fa95fb0f2c1b099e69e56634edb8fc03f87c (2026-01-04)

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/70e3bdc241dbd675970fe89f30f0b84e

I'm happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

Decoded source path:

use: net/nfc/llcp_core.c:1185 in nfc_llcp_recv_disc(), reading sk->sk_state
     after nfc_llcp_sock_put() at line 1182; DISC dispatch is called from
     net/nfc/llcp_core.c:1483 in nfc_llcp_rx_skb().
free: concurrent socket release drops the final reference through
      net/nfc/llcp_sock.c:646 sock_put(), then sk_free() releases the same
      struct nfc_llcp_sock allocation.

[   81.172360][  T830] BUG: KASAN: slab-use-after-free in nfc_llcp_rx_skb (net/nfc/llcp_core.c:? net/nfc/llcp_core.c:1483)
[   81.173044][  T830] Read of size 1 at addr ffff888119369812 by task kworker/1:2/830
[   81.173940][  T830] Tainted: [B]=BAD_PAGE, [W]=WARN
[   81.173941][  T830] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   81.173943][  T830] Workqueue: events nfc_llcp_rx_work
[   81.173946][  T830] Call Trace:
[   81.173947][  T830]  <TASK>
[   81.173952][  T830]  print_report (mm/kasan/report.c:379 mm/kasan/report.c:482)
[   81.173959][  T830]  kasan_report (mm/kasan/report.c:597)
[   81.173965][  T830]  nfc_llcp_rx_skb (net/nfc/llcp_core.c:? net/nfc/llcp_core.c:1483)
[   81.173973][  T830]  nfc_llcp_rx_work (net/nfc/llcp_core.c:1533)
[   81.173976][  T830]  process_scheduled_works (kernel/workqueue.c:3262 kernel/workqueue.c:3340)
[   81.173980][  T830]  worker_thread (./include/linux/list.h:381 kernel/workqueue.c:946 kernel/workqueue.c:3422)
[   81.173984][  T830]  kthread (kernel/kthread.c:465)
[   81.174000][  T830]  ret_from_fork (archkernel/process.c:164)
[   81.174011][  T830]  ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
[   81.174014][  T830]  </TASK>
[   81.187221][  T830] Allocated by task 4409 on cpu 1 at 75.384100s:
[   81.188593][  T830]  __kmalloc_noprof (mm/slub.c:5658 mm/slub.c:5669)
[   81.189018][  T830]  sk_prot_alloc (./include/linux/slab.h:961 net/core/sock.c:2245)
[   81.189420][  T830]  sk_alloc (net/core/sock.c:2301)
[   81.189779][  T830]  nfc_llcp_sock_alloc (net/nfc/llcp_sock.c:979)
[   81.190222][  T830]  nfc_llcp_rx_skb (net/nfc/llcp_core.c:971 net/nfc/llcp_core.c:1478)
[   81.190656][  T830]  nfc_llcp_rx_work (net/nfc/llcp_core.c:1533)
[   81.193365][  T830] Freed by task 31 on cpu 196609 at 78.490492s:
[   81.195183][  T830]  kfree (mm/slub.c:6670 mm/slub.c:6878)
[   81.195531][  T830]  __sk_destruct (net/core/sock.c:2285 net/core/sock.c:2384)
[   81.195937][  T830]  nfc_llcp_rx_skb (.net/sock.h:? net/nfc/llcp_core.c:233 net/nfc/llcp_core.c:1194 net/nfc/llcp_core.c:1483)
[   81.196379][  T830]  nfc_llcp_rx_work (net/nfc/llcp_core.c:1533)
[   81.199084][  T830] The buggy address belongs to the object at ffff888119369800
[   81.199084][  T830]  which belongs to the cache kmalloc-1k of size 1024
[   81.200297][  T830] The buggy address is located 18 bytes inside of
[   81.200297][  T830]  freed 1024-byte region [ffff888119369800, ffff888119369c00)


Best,
Shuangpeng
