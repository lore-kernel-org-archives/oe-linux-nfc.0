Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6850D377A82
	for <oe-linux-nfc@lists.linux.dev>; Thu, 20 Aug 2026 18:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787248873; cv=none; b=KYtAPlHkKxlzsw1I9qls9uUCFGzbZsWx0ImVnUMi2QTufdlgqyFVkxxNLyUfU3WhJxmgQWP4g2J+sU54Ho3N+aSeP9YndC/H+rdCkUTjk8C93hYWSukZ7yB2yI/BidchPmDl2YXpC4rmo+7ATVzbkYCmmX9+RamepSy+5bBASP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787248873; c=relaxed/simple;
	bh=VEXnQra9k6V+m354UMX/hahQNUSRIlisEfWNAK66TYc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OCpR+s4jlEn3lJr4XXd4h0uDJ7PQaNDxwMTy2l1dK3wRzIYZFZA+oBMZ8Ith+b4FYvuyZ0gQDoe6JShOuHrs7TrRpYW8zRf27vweKRLR4EZOE+YlkDlPFv4dZpfPbNPryWmcaYjRglaQmu5Z6sCjzVnmLbVnde1dzecT81T20CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MREm9E2e; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MREm9E2e"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9087fb771d3so1108156d6.0
        for <oe-linux-nfc@lists.linux.dev>; Thu, 20 Aug 2026 11:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787248871; x=1787853671; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oScT+ENnlXTLQHf3HxenqBsWnHCI1YjhKxNuZRXNgT8=;
        b=MREm9E2epGCGWzJGux09IznT3abpW3lTd3FehzdyZWd1MNIqzRJb1ebv39OacwwFtU
         HUwbqiEZp1dxU7k3oBKs70fgP3+ijBwU8SsCDR4wt9ZRKZjuf+2aXRFQ/XYPNzUdSyrI
         ui5sXAt1MkMGpRJYSLKzmB0JUsgGRe2zlr9deeKhIWt1nqaAR3CReeu2lywo8k6wq9h1
         jTp64e7xyhQ7ICPH9nGTqE1SqPdAQYOaegr1EaAKhAtYgQBmXvNXSoIdpLhOvA7GFYwh
         iqwd5MXj3iZ0+0XogPup466z8DL4TvMg8WR9DqAgEP0nzhemg5ov2cLRxgvWrLQ98CEx
         bcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787248871; x=1787853671;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oScT+ENnlXTLQHf3HxenqBsWnHCI1YjhKxNuZRXNgT8=;
        b=m5nf7GZpZ+Abjej/6ZaTDoj+wtpQJJWXtqvsbaKe5JGVqqQsZqgWxJcso8U/FXcgBB
         oDIkY8qfEMWoXj7dGHGexLhgMQO6a3hpBwEJ/JZJlOHXPYLkvzOiZtPTSjG21QvoTFsM
         08Dc59eKR0ltsqaq3aLXnDROd7MgMuuzGiLWm0r9mDkEtcBVyGe6FuXkKctYMOeDT+0f
         Wc/YzYoIWg7BeSm1IaukUy1XNgJ7CcdVQRe15KIeITGcUI/0ZQbY1u+GCSI5gT2rLg86
         VJRdnVY/6WSpqD9mZxnJ0JXEKtBHIGTXzIGpCG1jVb6UmdX2+FruEOQT9JIv2X29iuAs
         c55A==
X-Forwarded-Encrypted: i=1; AHgh+RqD1tT7odTbg8FpDS2LoVEpvUwisEajNd4R62wNVHKo8JtJ+1dYiol4PvD1qIWofcKsfdGPYVJKmChfcXA=@lists.linux.dev
X-Gm-Message-State: AFuF++l6QOM9Bddc5gnoqKlE4jl/rrzKgp+gT6vb86UK54I18ikndQv+
	obLV1xEq0PamAGoD/h7RD5iEqjgD6WRxwXaI7c5Tn/WO0JiSnX+hpFj2
X-Gm-Gg: AR+sD10Y5BM3FItuufQT/pAwcgszjUtsJs7ldjPqsnnZhKmWpP2xzNBJinvSE8Exb8f
	GEQP/5HWbm4aLeKLnxmjz30rcQiSyMYN2XrVIVYp1eTG06WmkDo6yNj4QrrZTUhlyV8+Ba2RwAM
	7LaH9SbpLtUTK7DWrQNYdNzO+3LNZl4IsQo14iRpiwzlUM9WU1tHo18OuefVzueq/Wv5tJY/ABj
	a49pV2/0W4SsHOyyLEIleDFpu4fKShfOl+xkR9eva/n6vTLaVs8mD+JpcEfeiX+lwAXV7myo69w
	48aSsNcqXgnCp6eT6jFil+dCqi9oahFq0/fk9FCmpqO6HUCUXf6twlEiEM0rONogkMM5FY0f8Tp
	QPKINS+U7nkwhgmSQxXPzzSvfyRIAsSvg2+ckLFCS1dkJszHjHs5Gs0rAlyQlCdk91rawySyvom
	/ePWJdGzIz02iL0mb5K76zqhoINQAZFmz4V7A81ldaDkLzhR64LOFlPHGPAJuKaXlpmIIkRLXE8
	fU+8i4dekeYFhyiPQGRzyv5cPxtgAI=
X-Received: by 2002:a05:6214:2a49:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-90c80942e22mr127546d6.4.1787248870845;
        Thu, 20 Aug 2026 11:01:10 -0700 (PDT)
Received: from smtpclient.apple ([165.85.199.100])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2b4ad5sm43810486d6.42.2026.08.20.11.01.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2026 11:01:10 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [BUG] nfc: KASAN: slab-use-after-free in nfc_llcp_rx_skb
From: Shuangpeng <shuangpeng.kernel@gmail.com>
In-Reply-To: <CANn89iL2_QhxnZvng7LJ-Rx8KSX5pvymYf_mBgP8aFSeVkPY=g@mail.gmail.com>
Date: Thu, 20 Aug 2026 14:00:37 -0400
Cc: David Heidelberg <david@ixit.cz>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <7E2F7328-DA5E-428D-8A2B-37479B1435EE@gmail.com>
References: <20260819002050.3476701-1-shuangpeng.kernel@gmail.com>
 <CANn89iL2_QhxnZvng7LJ-Rx8KSX5pvymYf_mBgP8aFSeVkPY=g@mail.gmail.com>
To: Eric Dumazet <edumazet@google.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)



> On Aug 19, 2026, at 03:55, Eric Dumazet <edumazet@google.com> wrote:
>=20
> On Wed, Aug 19, 2026 at 2:21=E2=80=AFAM Shuangpeng Bai
> <shuangpeng.kernel@gmail.com> wrote:
>>=20
>> Hi Kernel Maintainers,
>>=20
>> I hit the following report while testing current upstream kernel:
>>=20
>> KASAN: slab-use-after-free in nfc_llcp_rx_skb
>>=20
>> on commit: 3609fa95fb0f2c1b099e69e56634edb8fc03f87c (2026-01-04)
>=20
> Are you sure this was not already fixed by 2b5dd4632966
> ("nfc: llcp: add missing return after LLCP_CLOSED checks") ?
>=20

You're right. I overlooked commit 2b5dd4632966. I confirmed that this =
issue
has already been fixed by it.
Sorry for the noise, and thanks for pointing it out.

>>=20
>> The reproducer and .config files are here.
>> =
https://gist.github.com/shuangpengbai/70e3bdc241dbd675970fe89f30f0b84e
>>=20
>> I'm happy to test debug patches or provide additional information.
>>=20
>> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
>>=20
>> Decoded source path:
>>=20
>> use: net/nfc/llcp_core.c:1185 in nfc_llcp_recv_disc(), reading =
sk->sk_state
>>     after nfc_llcp_sock_put() at line 1182; DISC dispatch is called =
from
>>     net/nfc/llcp_core.c:1483 in nfc_llcp_rx_skb().
>> free: concurrent socket release drops the final reference through
>>      net/nfc/llcp_sock.c:646 sock_put(), then sk_free() releases the =
same
>>      struct nfc_llcp_sock allocation.
>>=20
>> [   81.172360][  T830] BUG: KASAN: slab-use-after-free in =
nfc_llcp_rx_skb (net/nfc/llcp_core.c:? net/nfc/llcp_core.c:1483)
>> [   81.173044][  T830] Read of size 1 at addr ffff888119369812 by =
task kworker/1:2/830
>> [   81.173940][  T830] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN
>> [   81.173941][  T830] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX =
+ PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>> [   81.173943][  T830] Workqueue: events nfc_llcp_rx_work
>> [   81.173946][  T830] Call Trace:
>> [   81.173947][  T830]  <TASK>
>> [   81.173952][  T830]  print_report (mm/kasan/report.c:379 =
mm/kasan/report.c:482)
>> [   81.173959][  T830]  kasan_report (mm/kasan/report.c:597)
>> [   81.173965][  T830]  nfc_llcp_rx_skb (net/nfc/llcp_core.c:? =
net/nfc/llcp_core.c:1483)
>> [   81.173973][  T830]  nfc_llcp_rx_work (net/nfc/llcp_core.c:1533)
>> [   81.173976][  T830]  process_scheduled_works =
(kernel/workqueue.c:3262 kernel/workqueue.c:3340)
>> [   81.173980][  T830]  worker_thread (./include/linux/list.h:381 =
kernel/workqueue.c:946 kernel/workqueue.c:3422)
>> [   81.173984][  T830]  kthread (kernel/kthread.c:465)
>> [   81.174000][  T830]  ret_from_fork (archkernel/process.c:164)
>> [   81.174011][  T830]  ret_from_fork_asm =
(arch/x86/entry/entry_64.S:256)
>> [   81.174014][  T830]  </TASK>
>> [   81.187221][  T830] Allocated by task 4409 on cpu 1 at 75.384100s:
>> [   81.188593][  T830]  __kmalloc_noprof (mm/slub.c:5658 =
mm/slub.c:5669)
>> [   81.189018][  T830]  sk_prot_alloc (./include/linux/slab.h:961 =
net/core/sock.c:2245)
>> [   81.189420][  T830]  sk_alloc (net/core/sock.c:2301)
>> [   81.189779][  T830]  nfc_llcp_sock_alloc (net/nfc/llcp_sock.c:979)
>> [   81.190222][  T830]  nfc_llcp_rx_skb (net/nfc/llcp_core.c:971 =
net/nfc/llcp_core.c:1478)
>> [   81.190656][  T830]  nfc_llcp_rx_work (net/nfc/llcp_core.c:1533)
>> [   81.193365][  T830] Freed by task 31 on cpu 196609 at 78.490492s:
>> [   81.195183][  T830]  kfree (mm/slub.c:6670 mm/slub.c:6878)
>> [   81.195531][  T830]  __sk_destruct (net/core/sock.c:2285 =
net/core/sock.c:2384)
>> [   81.195937][  T830]  nfc_llcp_rx_skb (.net/sock.h:? =
net/nfc/llcp_core.c:233 net/nfc/llcp_core.c:1194 =
net/nfc/llcp_core.c:1483)
>> [   81.196379][  T830]  nfc_llcp_rx_work (net/nfc/llcp_core.c:1533)
>> [   81.199084][  T830] The buggy address belongs to the object at =
ffff888119369800
>> [   81.199084][  T830]  which belongs to the cache kmalloc-1k of size =
1024
>> [   81.200297][  T830] The buggy address is located 18 bytes inside =
of
>> [   81.200297][  T830]  freed 1024-byte region [ffff888119369800, =
ffff888119369c00)
>>=20
>>=20
>> Best,
>> Shuangpeng

