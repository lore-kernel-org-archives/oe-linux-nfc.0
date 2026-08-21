Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9A30DEB2
	for <oe-linux-nfc@lists.linux.dev>; Fri, 21 Aug 2026 13:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787318267; cv=none; b=PWiZ1sKti5NztaDnAGAosFNpz8+BxAp+ZEfzoKsZF//BGKdqwmGm+bPRAVggk1DI48zSVZ+LbSiInpLZ2ywayCc0KMddUw4rg9iXyr3uiHs61cylSNBYIiRsfFk8gFxCxbVbgRolCjuO3882bZS0juNH+H7tvkHhY6dpyDe6IpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787318267; c=relaxed/simple;
	bh=Coa+AggbCFxMPrhay90dyvE8KIF8DPbctIHdy2dJGKU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=H0mSsiTphj+YkzMqOg7t3wFp2gANf5fi8uVirj8vUGw2/BWipbjOPHpQ+7gxZEVntrQf1EuNcmxBnZa534WAlsIyBp9095NPBFA3uUCn1/45D0/S2no+QEfaDKBMk1IyHrc8w2xL4kpOiNy2fKNPv9TlwFM2Xbv0FpePs+Pl1Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-49ab6a82cd5so1760345b6e.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 21 Aug 2026 06:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787318258; x=1787923058;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XxpQL7ZqxphFD59MO5gYLKuUdQ9IZLxncf0Ban1Yl0k=;
        b=X9R25JOnmTFHD/Pcx3oj7PyElOI7dM2ZetP4eLsmzryBKXR9QBbvKh1QMpnMbcnGbw
         yzj+IuNWkOElrfx95qIgQ0Bp+prohMPnpMiuH6xSdEYIh4qhtsixqgou7nTKw0z+WbbN
         xEjqMXXoDf/WJ0V/tm09E+6DTeC7mhvk0DzIWW+t6YWu9D9jubs1zqCO0qvxQwqxWSo4
         MjmkvwBAxJelGMjskXg7tm0G8dgV0K+rHgH6Zjt/LBYl+KTW3dEoXvUKiyWd5WObFsMX
         SX9pr+zePj/yRfJAK8JTP9UsiBuLcSHLG6GwhVTG+sNEJzhRwwYv283u0VgVHGLl40Jq
         mqUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0Vj9TZXr+PeM2OcR778UZjZaF7s6wQeQZX2Rd4q01wdSAMTGgBhLOrFshhntXw5W4cYmn7kOvnvjirLI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFt7owIqz5j57XRURJpYNdEJfRY3BzCLy0kuwVV1L+RRyigjcc
	ezL4eUrwwezOeVJIzO6WfpWFvWT09yYu4SXg8OKXsI94Vi2sMInzld/g9xCS9ynBSzubY4yu+41
	ZPcC1keRSH//JAEuTmUiyUMaqOYO38W9xaetvmaYk4LCYZXRHed84dLxQI3Q=
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:150b:b0:6a1:3e91:dcac with SMTP id
 006d021491bc7-6b159433d65mr6777750eaf.31.1787318258485; Fri, 21 Aug 2026
 06:17:38 -0700 (PDT)
Date: Fri, 21 Aug 2026 06:17:38 -0700
In-Reply-To: <6a853da3.ae6ddae5.3da009.0006.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a884ff2.ae6ddae5.3da009.0037.GAE@google.com>
Subject: Re: [syzbot] [net?] [nfc?] KASAN: slab-out-of-bounds Read in __dynamic_pr_debug
From: syzbot <syzbot+1e3df0852e82c21ca418@syzkaller.appspotmail.com>
To: davem@davemloft.net, david@ixit.cz, edumazet@google.com, horms@kernel.org, 
	krzk@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, oe-linux-nfc@lists.linux.dev, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    21d6ac051080 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=17d30179580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d1128bc53f2ef7f3
dashboard link: https://syzkaller.appspot.com/bug?extid=1e3df0852e82c21ca418
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13d43e79580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1746fa25580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/88380e2ddcb9/disk-21d6ac05.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5dba5c2896b7/vmlinux-21d6ac05.xz
kernel image: https://storage.googleapis.com/syzbot-assets/52ac739e37e0/Image-21d6ac05.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1e3df0852e82c21ca418@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in string_nocheck+0xd8/0x140 lib/vsprintf.c:648
Read of size 1 at addr ffff0000d0cf899c by task syz.0.17/4947

CPU: 1 UID: 0 PID: 4947 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/07/2026
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 print_address_description+0xb0/0x238 mm/kasan/report.c:378
 print_report+0x68/0x84 mm/kasan/report.c:482
 kasan_report+0x8c/0xc4 mm/kasan/report.c:595
 __asan_report_load1_noabort+0x20/0x2c mm/kasan/report_generic.c:378
 string_nocheck+0xd8/0x140 lib/vsprintf.c:648
 string+0x8c/0xc8 lib/vsprintf.c:730
 vsnprintf+0x880/0xd10 lib/vsprintf.c:2945
 va_format lib/vsprintf.c:1725 [inline]
 pointer+0x5e8/0x6b4 lib/vsprintf.c:2573
 vsnprintf+0x618/0xd10 lib/vsprintf.c:2949
 vprintk_store+0x344/0xb94 kernel/printk/printk.c:2307
 vprintk_emit+0x1bc/0x514 kernel/printk/printk.c:2455
 vprintk_default+0x54/0x80 kernel/printk/printk.c:2494
 vprintk+0x9c/0x114 kernel/printk/printk_safe.c:82
 _printk+0xe0/0x130 kernel/printk/printk.c:2504
 __dynamic_pr_debug+0x148/0x1e4 lib/dynamic_debug.c:879
 nfc_llcp_wks_sap net/nfc/llcp_core.c:344 [inline]
 nfc_llcp_get_sdp_ssap+0x350/0x3fc net/nfc/llcp_core.c:420
 llcp_sock_bind+0x2e0/0x58c net/nfc/llcp_sock.c:114
 __sys_bind_socket net/socket.c:1920 [inline]
 __sys_bind+0x1c4/0x268 net/socket.c:1951
 __do_sys_bind net/socket.c:1956 [inline]
 __se_sys_bind net/socket.c:1954 [inline]
 __arm64_sys_bind+0x84/0x9c net/socket.c:1954
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590

Allocated by task 4947:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:78
 kasan_save_alloc_info+0x40/0x50 mm/kasan/generic.c:570
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x9c/0xb4 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_node_track_caller_noprof+0x434/0x6d4 mm/slub.c:5471
 kmemdup_noprof+0x44/0x8c mm/util.c:138
 kmemdup_noprof include/linux/fortify-string.h:715 [inline]
 llcp_sock_bind+0x2b0/0x58c net/nfc/llcp_sock.c:107
 __sys_bind_socket net/socket.c:1920 [inline]
 __sys_bind+0x1c4/0x268 net/socket.c:1951
 __do_sys_bind net/socket.c:1956 [inline]
 __se_sys_bind net/socket.c:1954 [inline]
 __arm64_sys_bind+0x84/0x9c net/socket.c:1954
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590

The buggy address belongs to the object at ffff0000d0cf8980
 which belongs to the cache kmalloc-32 of size 32
The buggy address is located 0 bytes to the right of
 allocated 28-byte region [ffff0000d0cf8980, ffff0000d0cf899c)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x110cf8
flags: 0x5ffc00000000000(node=0|zone=2|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 05ffc00000000000 ffff0000c0001780 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800400040 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff0000d0cf8880: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
 ffff0000d0cf8900: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>ffff0000d0cf8980: 00 00 00 04 fc fc fc fc 00 00 00 fc fc fc fc fc
                            ^
 ffff0000d0cf8a00: 00 00 00 00 fc fc fc fc 00 00 00 00 fc fc fc fc
 ffff0000d0cf8a80: fa fb fb fb fc fc fc fc 00 00 00 fc fc fc fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
