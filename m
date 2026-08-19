Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A47A370D47
	for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 07:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787126119; cv=pass; b=nszM41lp23IjB+7xHPvj+aX+FFdi3gCsLg3q1nl8o0LMqfXWattHYf3c73ayHCNh2YXbmd1rfHCDdo2wfCaho7KeYLEIPupLshL6iIxhH9bncq5HbfaKBdO6wPfFWtjFIHk66iJx8HVrLvqe3hEKvFrVaOWoykqXmLhWxyWCid4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787126119; c=relaxed/simple;
	bh=DhtrX2h5AwpSmXYAz2ilrcLD4hNqnstbiVM2oGQHPe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0JavEi1/b9ndY+Jg9FHwzeqk/IJYUvuaLGc07d+Iee9PbBllDPA1okrhylIVRP6Jep02KPID9eNra+ikiXkzzq1pcb3gx/zHz0JqVr1/pEJLO1dOhiTVqccYI+qQzI6IPO4/ATCVTqayzUHNgY8N8K1PT2KeUD6EL7B+YuC6EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dQ4Mv84h; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dQ4Mv84h"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52d8748cde5so3623021cf.0
        for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 00:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787126117; cv=none;
        d=google.com; s=arc-20260327;
        b=bixObTVbJZguV0CEZ04azIoYOhl3idha9XfDO2q/GP6pzJw5erCyNnFGgLBrnUQDR3
         MFC6zlZXYsI5om4y043yx/M8lhF79xTWQvzaFkxkMmgJwMdbdudktBeS5+KJdsioA+3b
         z9KDVdV3jrpViy4lxRQA1otwr2G4n6E94b7LTtylK0LZzqs5zJeiGzXAl42NHdZVgXXs
         OBdcK+/EgrFXXyXCSEmQ+oKot0summl8ju6eLJtr4rUM6DCQMUEItOSdThuNdMaPtwpr
         rUDwL23bfErq/4WQvmpyyWn8bzbh6/Hw4VzOkTrXDlfExY34ga2dXDOjrjAR+9pnllZr
         bBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z0jE3gzT9/KW+Ch7bTrTGuJUus0VXch6kYVBXgjVeNE=;
        fh=D7QLMuwFGon8u58n6urRRunYS267iOWds7u3P2HGFZ4=;
        b=QzOWxQoHNPOxRHLU4FK0K7aB/EGZI3Qd/Sf49Xm0MkPwMg6AqPS2COhT8sYSzLdm8X
         Bc/qgZHlWzQlKakbfB0MUPfQDaT/e3kNmy7oJeEZxZEXcZmwNQKGcEh0Fe1xfMt6fgjb
         y2T1xGWRbjRj+1mfCNfarvMkvXbXGEsxoUImxnyzZgvc9VOPZgIWW2MRh/uBMaN1Gl1l
         NevIagcOFTL6KPYCsGqqmwPz46UPvILr0yB1iywZUoIY+fLWhWXbg5z7C3ce7FQ5hFvy
         ZQYnKGzsZlKhA8JfrekEYQ1gPed39NPDvgL0Gqbzo35j7kUFnnAqFt9g0G34Mfz1BBjy
         NFtg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787126117; x=1787730917; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z0jE3gzT9/KW+Ch7bTrTGuJUus0VXch6kYVBXgjVeNE=;
        b=dQ4Mv84husFW1oDCAic5sb7R0fu7ikudW8t9fyB89SttdfllAT6O9gDS2Lo5n1udmU
         d1b7JPXZioAjyIt7zcAKXl/YbFF2moJ86t6Q8eqX6hGB5lFJuUjWaKHFhLKLVN4QHYaF
         KUTQt7MRz6Zujhp1zPevgfL4ZbyJ817ohfsP6dvpTVWQ+HNJNAcs6SrgsmdC82+CjMf8
         nUh7kDAY+Ei2sMKbrvVV2feM67KHwrz1jj7CKlhAfAWru4o+hNCIhr+Udqxm942+WeJN
         iqRjWvE+b4qES/ycCs87P+4wkpi+IQzeOuumUAVi5D6uikZv24NxkebS8cixHbwr+Bh2
         0AwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787126117; x=1787730917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0jE3gzT9/KW+Ch7bTrTGuJUus0VXch6kYVBXgjVeNE=;
        b=aUowG7sJAgM5PHUKwcoej1fJuO696p79Cvz5VAmuECvg7o0bYoD0oY+ZHalLzrlF9T
         xd0TtIhnb5Bule3IFeo5tRSEyWNqbIGPk9DS1xnVnUKkBuwTZOT+upOfXBhUpgeOsKUC
         /KZ7Smomy7xeFv3CyZGdFdvrtYxYhRlh2eB6yWhp44/xBSkYebQyxHseHW4C17YIe4j4
         O5e06F7ijGHRSVXyz6L+/8nUsgXrpJJF1Q2cHVY8i8/nI2j64CKkyTnylTbdoWBIXR9k
         2NRA/mJv2exA2z4SMH4aMEn9H2LaFv+iQJj4YJxhRms6BY19/wGtSIvSaRU8RavZd9Da
         KMhA==
X-Forwarded-Encrypted: i=1; AHgh+RoqbtnLG0OU/9T22qpXiU9jbwDYdQvqjMZwg/5Nf3I0TL/dIxzrZfrXwRjf00Q6unoy6E4noYpavwNhJ2g=@lists.linux.dev
X-Gm-Message-State: AOJu0YyccKBx+Vt0K1B9Pnwakl6Us64AoTdzdIC0dc8qd/ICzZjO94mu
	slMk9ttGaXfx+qA1G1arQS68dRFfv8eTyFa123hjRam4Ubv8t2g4mN0Dtgks7/QUQHHrEmdp0LF
	v16WIJ+EDAXvIPoBME3a/WJ9Sp20xuqrSpNpup7l2
X-Gm-Gg: AR+sD12VWTTNQOzM6KjrnejACd3ZOCw+TTBDgHjFzaCx7s1klyREx12I757fAAQX4/j
	C0brlacIm5TBqpYxtkS35xS+aGfxqA62JcPcmwzAYHolkP8a8VeyJJ3Y/3yraqKWK28n+J336XV
	3fVi30iF5uZHD+bv+Wkih+RbUJXc9TUJ2h8nx+KYRRG6rv17KQmoq3wtEn0xW6CM0gVBHtx4nAC
	KVL/EtDdYgI1VCYXJgzrO6JNr/v+nPhLWwn6FdrxDofR8q8xKZkxXt4iT6ced4/sfwIabCiA0fA
	IXd6psI8HIA1H3q49W6+hHzK9SRIs+Lj+E2h7p/uzjoRABj3M1Pxb2ZN2zaOtjt5hCeZWlalZob
	6ku0l/UbB0xWbyOC9iiyhzvdt67a4AcLJ0Jum0okE9Y3PYRSBVePTuFbjvSzFl3m9BnEZmnCkJA
	ulLv4f7AQeU7jZH9s=
X-Received: by 2002:ac8:5f87:0:b0:51a:bec0:1040 with SMTP id
 d75a77b69052e-52dd57d7a99mr21982071cf.12.1787126116158; Wed, 19 Aug 2026
 00:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819002050.3476701-1-shuangpeng.kernel@gmail.com>
In-Reply-To: <20260819002050.3476701-1-shuangpeng.kernel@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 19 Aug 2026 09:55:01 +0200
X-Gm-Features: AcwNN1VsS45iVRLEmH9P5MrxlMzat4vRZ5QZUA9pnoNCEpr9m6epGfzcraRAdno
Message-ID: <CANn89iL2_QhxnZvng7LJ-Rx8KSX5pvymYf_mBgP8aFSeVkPY=g@mail.gmail.com>
Subject: Re: [BUG] nfc: KASAN: slab-use-after-free in nfc_llcp_rx_skb
To: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 2:21=E2=80=AFAM Shuangpeng Bai
<shuangpeng.kernel@gmail.com> wrote:
>
> Hi Kernel Maintainers,
>
> I hit the following report while testing current upstream kernel:
>
> KASAN: slab-use-after-free in nfc_llcp_rx_skb
>
> on commit: 3609fa95fb0f2c1b099e69e56634edb8fc03f87c (2026-01-04)

Are you sure this was not already fixed by 2b5dd4632966
("nfc: llcp: add missing return after LLCP_CLOSED checks") ?

>
> The reproducer and .config files are here.
> https://gist.github.com/shuangpengbai/70e3bdc241dbd675970fe89f30f0b84e
>
> I'm happy to test debug patches or provide additional information.
>
> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
>
> Decoded source path:
>
> use: net/nfc/llcp_core.c:1185 in nfc_llcp_recv_disc(), reading sk->sk_sta=
te
>      after nfc_llcp_sock_put() at line 1182; DISC dispatch is called from
>      net/nfc/llcp_core.c:1483 in nfc_llcp_rx_skb().
> free: concurrent socket release drops the final reference through
>       net/nfc/llcp_sock.c:646 sock_put(), then sk_free() releases the sam=
e
>       struct nfc_llcp_sock allocation.
>
> [   81.172360][  T830] BUG: KASAN: slab-use-after-free in nfc_llcp_rx_skb=
 (net/nfc/llcp_core.c:? net/nfc/llcp_core.c:1483)
> [   81.173044][  T830] Read of size 1 at addr ffff888119369812 by task kw=
orker/1:2/830
> [   81.173940][  T830] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN
> [   81.173941][  T830] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + P=
IIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [   81.173943][  T830] Workqueue: events nfc_llcp_rx_work
> [   81.173946][  T830] Call Trace:
> [   81.173947][  T830]  <TASK>
> [   81.173952][  T830]  print_report (mm/kasan/report.c:379 mm/kasan/repo=
rt.c:482)
> [   81.173959][  T830]  kasan_report (mm/kasan/report.c:597)
> [   81.173965][  T830]  nfc_llcp_rx_skb (net/nfc/llcp_core.c:? net/nfc/ll=
cp_core.c:1483)
> [   81.173973][  T830]  nfc_llcp_rx_work (net/nfc/llcp_core.c:1533)
> [   81.173976][  T830]  process_scheduled_works (kernel/workqueue.c:3262 =
kernel/workqueue.c:3340)
> [   81.173980][  T830]  worker_thread (./include/linux/list.h:381 kernel/=
workqueue.c:946 kernel/workqueue.c:3422)
> [   81.173984][  T830]  kthread (kernel/kthread.c:465)
> [   81.174000][  T830]  ret_from_fork (archkernel/process.c:164)
> [   81.174011][  T830]  ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> [   81.174014][  T830]  </TASK>
> [   81.187221][  T830] Allocated by task 4409 on cpu 1 at 75.384100s:
> [   81.188593][  T830]  __kmalloc_noprof (mm/slub.c:5658 mm/slub.c:5669)
> [   81.189018][  T830]  sk_prot_alloc (./include/linux/slab.h:961 net/cor=
e/sock.c:2245)
> [   81.189420][  T830]  sk_alloc (net/core/sock.c:2301)
> [   81.189779][  T830]  nfc_llcp_sock_alloc (net/nfc/llcp_sock.c:979)
> [   81.190222][  T830]  nfc_llcp_rx_skb (net/nfc/llcp_core.c:971 net/nfc/=
llcp_core.c:1478)
> [   81.190656][  T830]  nfc_llcp_rx_work (net/nfc/llcp_core.c:1533)
> [   81.193365][  T830] Freed by task 31 on cpu 196609 at 78.490492s:
> [   81.195183][  T830]  kfree (mm/slub.c:6670 mm/slub.c:6878)
> [   81.195531][  T830]  __sk_destruct (net/core/sock.c:2285 net/core/sock=
.c:2384)
> [   81.195937][  T830]  nfc_llcp_rx_skb (.net/sock.h:? net/nfc/llcp_core.=
c:233 net/nfc/llcp_core.c:1194 net/nfc/llcp_core.c:1483)
> [   81.196379][  T830]  nfc_llcp_rx_work (net/nfc/llcp_core.c:1533)
> [   81.199084][  T830] The buggy address belongs to the object at ffff888=
119369800
> [   81.199084][  T830]  which belongs to the cache kmalloc-1k of size 102=
4
> [   81.200297][  T830] The buggy address is located 18 bytes inside of
> [   81.200297][  T830]  freed 1024-byte region [ffff888119369800, ffff888=
119369c00)
>
>
> Best,
> Shuangpeng
