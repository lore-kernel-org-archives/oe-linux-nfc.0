Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2AF364935
	for <oe-linux-nfc@lists.linux.dev>; Mon, 18 May 2026 17:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123878; cv=none; b=Hje9lGu13+ii6bY3O4vjLQm0DSmIZyN7x9sobHt7FM+XxRdEYRZGDLxKRERCYgGCNCKK57Uro/4irTDwZT/lnVVREHTpS3EtiCUKzZNYOXtyILel9xnnFwTZJi4KBjxMrw4q2/QcyYut7eF8AdFp0viPAHYH7iUS6lgMYzA13Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123878; c=relaxed/simple;
	bh=Tjxh8tgkZ/kq80i4yEWYG8FDchFe7nhvjfnMceQgZyQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=JdYByO4Gk1iyaxkxeSKyn5YXmnnvFQleGaHWDbMg5ONmrssPZ8mW3wEpr+/0tMV7+zgrS92Ywm8ynaytey6SK4rLB14sze0SluXM1dkfOMN6YO4u+Fn7RaoZwmde7aDvGlTmboiWrpjjJFfmfKlltGyHIrDxRsRR7K0nJYD+7sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-4793e70895cso4858289b6e.2
        for <oe-linux-nfc@lists.linux.dev>; Mon, 18 May 2026 10:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123876; x=1779728676;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSne5y6tN+SFVy3lbyyNHvUeSKD/gta9pv1dr+rENEs=;
        b=cksJD6FvKSTb+QSfJ00gr9jeXGYLSnlG3l1+fcxp2FeTLY7JIBC3MCtB287MVzZ+zr
         wUmPYQIr02WL8ry7M4qC40PJ9fy6eJ1PhpUA9i3TyTTwP/bJavJf7gN7LzFVd+uVJ1xB
         DodG8cmR4tXU7f63iPTKmW2VarALdXySBpiaR4YqXO+4KzktCNWa/LWm3gIDcJJekAff
         N7zCtmEzKdGjzd9hpMPnuiMzu00oLr4lqgJRxxmQW+0mvibRe9QII1AswSDy61wmh9bJ
         m84xhwfMfPcy3x7lp+wJmsmp0g1X/c7a3ixxU+WdKp2Nj9N3dMhPoMm/dQr/2jx3+T9C
         tzYA==
X-Forwarded-Encrypted: i=1; AFNElJ87V9tOhsDroNdgCQvamp5F8xI+YRkPtPvzdAeEsKFkwSyv+lmRg/b8t/Yczukcg5jaeFDV6FDS7TQdw0Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiYSHJNuWdAfLwyK9/HRHYpc//wCb+5lTM9bQKEe8siJ6nddNk
	Bb8CraW+ZQbDaToV135KwnLxewqweY6OzYcVBqU9Khi6LpNUrs/rDtU8BZ6DpojxxXLAV6xWpHk
	jAmCuab9YtaLP8Dy7F0uaPcMojCrazAmBvnC17f+490IlSf2wMJG1hAqT7wI=
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:164d:b0:479:c81f:8e18 with SMTP id
 5614622812f47-482e55ae39emr10808185b6e.3.1779123876187; Mon, 18 May 2026
 10:04:36 -0700 (PDT)
Date: Mon, 18 May 2026 10:04:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a0b46a4.a70a0220.202581.0006.GAE@google.com>
Subject: [syzbot] [net?] [nfc?] KMSAN: uninit-value in nci_dev_up (3)
From: syzbot <syzbot+46ca2592193f2fb3debc@syzkaller.appspotmail.com>
To: davem@davemloft.net, david+nfc@ixit.cz, edumazet@google.com, 
	horms@kernel.org, krzk@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	oe-linux-nfc@lists.linux.dev, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e1914add2799 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10eee996580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a9f364ffbbe4c1e9
dashboard link: https://syzkaller.appspot.com/bug?extid=46ca2592193f2fb3debc
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/841025ab4e0a/disk-e1914add.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/cf76ff829fea/vmlinux-e1914add.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9e13b4488bea/bzImage-e1914add.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+46ca2592193f2fb3debc@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in nci_init_complete_req net/nfc/nci/core.c:192 [inline]
BUG: KMSAN: uninit-value in __nci_request net/nfc/nci/core.c:108 [inline]
BUG: KMSAN: uninit-value in nci_open_device net/nfc/nci/core.c:529 [inline]
BUG: KMSAN: uninit-value in nci_dev_up+0x1110/0x1bb0 net/nfc/nci/core.c:643
 nci_init_complete_req net/nfc/nci/core.c:192 [inline]
 __nci_request net/nfc/nci/core.c:108 [inline]
 nci_open_device net/nfc/nci/core.c:529 [inline]
 nci_dev_up+0x1110/0x1bb0 net/nfc/nci/core.c:643
 nfc_dev_up+0x204/0x3d0 net/nfc/core.c:118
 nfc_genl_dev_up+0xe9/0x1c0 net/nfc/netlink.c:775
 genl_family_rcv_msg_doit+0x338/0x3f0 net/netlink/genetlink.c:1114
 genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
 genl_rcv_msg+0xac5/0xc00 net/netlink/genetlink.c:1209
 netlink_rcv_skb+0x54d/0x680 net/netlink/af_netlink.c:2550
 genl_rcv+0x41/0x60 net/netlink/genetlink.c:1218
 netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
 netlink_unicast+0xee2/0x1290 net/netlink/af_netlink.c:1344
 netlink_sendmsg+0x10b2/0x1250 net/netlink/af_netlink.c:1894
 sock_sendmsg_nosec net/socket.c:787 [inline]
 __sock_sendmsg net/socket.c:802 [inline]
 ____sys_sendmsg+0xf37/0xfd0 net/socket.c:2698
 ___sys_sendmsg+0x271/0x3b0 net/socket.c:2752
 __sys_sendmsg net/socket.c:2784 [inline]
 __do_sys_sendmsg net/socket.c:2789 [inline]
 __se_sys_sendmsg net/socket.c:2787 [inline]
 __x64_sys_sendmsg+0x211/0x3e0 net/socket.c:2787
 x64_sys_call+0x1e20/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:47
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x134/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 nci_init_complete_req net/nfc/nci/core.c:192 [inline]
 __nci_request net/nfc/nci/core.c:108 [inline]
 nci_open_device net/nfc/nci/core.c:529 [inline]
 nci_dev_up+0x1109/0x1bb0 net/nfc/nci/core.c:643
 nfc_dev_up+0x204/0x3d0 net/nfc/core.c:118
 nfc_genl_dev_up+0xe9/0x1c0 net/nfc/netlink.c:775
 genl_family_rcv_msg_doit+0x338/0x3f0 net/netlink/genetlink.c:1114
 genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
 genl_rcv_msg+0xac5/0xc00 net/netlink/genetlink.c:1209
 netlink_rcv_skb+0x54d/0x680 net/netlink/af_netlink.c:2550
 genl_rcv+0x41/0x60 net/netlink/genetlink.c:1218
 netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
 netlink_unicast+0xee2/0x1290 net/netlink/af_netlink.c:1344
 netlink_sendmsg+0x10b2/0x1250 net/netlink/af_netlink.c:1894
 sock_sendmsg_nosec net/socket.c:787 [inline]
 __sock_sendmsg net/socket.c:802 [inline]
 ____sys_sendmsg+0xf37/0xfd0 net/socket.c:2698
 ___sys_sendmsg+0x271/0x3b0 net/socket.c:2752
 __sys_sendmsg net/socket.c:2784 [inline]
 __do_sys_sendmsg net/socket.c:2789 [inline]
 __se_sys_sendmsg net/socket.c:2787 [inline]
 __x64_sys_sendmsg+0x211/0x3e0 net/socket.c:2787
 x64_sys_call+0x1e20/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:47
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x134/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 nci_core_init_rsp_packet_v2 net/nfc/nci/rsp.c:107 [inline]
 nci_core_init_rsp_packet net/nfc/nci/rsp.c:131 [inline]
 nci_rsp_packet+0x2c3b/0x2d70 net/nfc/nci/rsp.c:376
 nci_rx_work+0x48f/0x850 net/nfc/nci/core.c:1579
 process_one_work kernel/workqueue.c:3302 [inline]
 process_scheduled_works+0xb65/0x1e40 kernel/workqueue.c:3385
 worker_thread+0xee4/0x1590 kernel/workqueue.c:3466
 kthread+0x53f/0x600 kernel/kthread.c:436
 ret_from_fork+0x20f/0x8d0 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4576 [inline]
 slab_alloc_node mm/slub.c:4898 [inline]
 kmem_cache_alloc_node_noprof+0x3cd/0x12c0 mm/slub.c:4950
 kmalloc_reserve net/core/skbuff.c:613 [inline]
 __alloc_skb+0x855/0x1190 net/core/skbuff.c:713
 alloc_skb include/linux/skbuff.h:1383 [inline]
 virtual_ncidev_write+0x6b/0x2a0 drivers/nfc/virtual_ncidev.c:120
 vfs_write+0x48a/0x15c0 fs/read_write.c:686
 ksys_write+0x1d9/0x470 fs/read_write.c:740
 __do_sys_write fs/read_write.c:751 [inline]
 __se_sys_write fs/read_write.c:748 [inline]
 __x64_sys_write+0x97/0xf0 fs/read_write.c:748
 x64_sys_call+0x2ff0/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:2
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x134/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 1 UID: 0 PID: 7976 Comm: syz.2.570 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
