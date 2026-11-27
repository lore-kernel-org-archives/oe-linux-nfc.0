Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811637;
	b=bHOCldchBYDJ1IqZ1S8i5+p7QaupGqUZe2gteILbL1aMykMgrs1ThhTE+omr/cdZ0ej1
	 NId48OxaHYFQ439/L3PmfbI0ZaoG9tcpWQshS69RsI6f6RKJOsa2dIw6sho66iEWv3J7S
	 AvGM2va5joGposz5UurIwk4CFUk0x/bfKzADIuc0ERU1x/RHCbsiWHOg8volfyUj/+MYn
	 3WA5KB9RHMcYOw0CNo0zzFkUJ8gQhd1XAIKs3UjjeThZMjflIxdasasf3l2dt1S7Qh7gQ
	 3cM9j2GlEmmvU69U1iUtUohnyb0OmT+Q2Dz7lIW4fn+bBOUdDTJOTa8SdbreXkCtzEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811637;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=lP1cgy6AqB+I7ZmeBopot2A6K9z6x9VfrLRp1QcW8bA=;
	b=j7iaHLodoA+uIitTtV/XNFw3zAtaVPK/RaubbiSVB4sb9Mewbhcovc/t1AXKEh4s/uB2
	 JAiul0fGFiALrQTNoFTeQ/3hrikRnFQlfZ6ZmNVgzNjYUQWinFQ23y2sPeTQw4sOHwxtW
	 CQRXPlf/v9rb6Vc6EOT99va6hu9xTH3Xa3TwyAUEmRLFkM5X7q6wVaDWVQnG6aHwTodct
	 Lt2U6/nxU/q5oFjHq03/ZK0odAYGEj/ejA0cJPKmR8LXHYRFygiUBBY7p/6aiWj6fXqvb
	 IRTcsImtdI4bVfzu8klSyEdS0IxhtJWQb57jTe9XRk4MeUqzpSdhwmj7V+xGafkAUew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B36606A32F
	for <oe-linux-nfc@lists.linux.dev>; Fri, 27 Nov 2026 20:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0B36606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-574f8578e48so7250269b6e.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 27 Nov 2026 12:33:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811635; x=1796416435;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lP1cgy6AqB+I7ZmeBopot2A6K9z6x9VfrLRp1QcW8bA=;
        b=YLHd6UzCh8lY6/8U+Qb+JtvORhjoNAr0OuHhsYZLIjcixUM9nZ0/5XQsYi4XCIbfRE
         cDlRbdGlDYyIRIHsMtqX3SIp8kwZQ5+zE90+aoqgbQVm+j4TzMyv8i68OmCHYuPwvWOg
         2aPzxgo6V7cQWsXgCbyMbqNBrtg4frWSdKE/TfD8cqsVgIY5K9jr/ig8Jhj49KKs0zP7
         0qid3dZg4cl3Y+C0urdt+mjpa9Z5bv34FfG5nr1pXgW/El4JcuQpcRSOndgf9KPJKnNn
         dTQ3gj7BzYObWbt3jDAAx8zTX2QoT4ByfoYNmTbSuboLIrHPM5iDVNkvJm3Dgl4p43QN
         ZbAQ==
X-Forwarded-Encrypted: i=1; AL+hErGGM7WNM8OiIm8TpzIW36+ojhP49zogo+OUKe2Mz3TXvx4m+zVD5StC7mQvVp/GProGxyu1JChjsZsopFQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8yhYlk5sLfJftmjAZQNiaRxWujdugOf5XUIc9CHUs925/+sfAY
	MZ8EtnHjtT0poz1vBs0NW+EF4Bi1DBjX23quWL2BLG+1NgxxS+2KeprnZppVmiU5Ddei85FqLr4
	8uMSSLrjYEnKyRm6vn0ccHV2LY1xsPnjuN5ZkbGVxRladxsl3/mWvjL0PmeA=
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f06:b0:53a:9d3c:caad with SMTP id
 5614622812f47-57a0a4079a5mr28198618b6e.25.1795811635750; Fri, 27 Nov 2026
 12:33:55 -0800 (PST)
Date: Fri, 27 Nov 2026 12:33:55 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b09e933.c4dd33ab.25911d.0018.GAE@google.com>
Subject: [syzbot] Monthly nfc report (Nov 2026)
From: syzbot <syzbot+list420bf134b34a29c9910a@syzkaller.appspotmail.com>
To: david@ixit.cz, linux-kernel@vger.kernel.org, oe-linux-nfc@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello nfc maintainers/developers,

This is a 31-day syzbot report for the nfc subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/nfc

During the period, 0 new issues were detected and 0 were fixed.
In total, 11 issues are still open and 36 have already been fixed.
There is also 1 low-priority issue.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 347     Yes   WARNING in port100_send_cmd_async/usb_submit_urb (3)
                  https://syzkaller.appspot.com/bug?extid=89f5f8143d8e62af2b61
<2> 39      Yes   KASAN: slab-out-of-bounds Read in pn533_recv_frame
                  https://syzkaller.appspot.com/bug?extid=93f169a8e7d66864f800
<3> 11      Yes   INFO: task hung in port100_get_command_type_mask (4)
                  https://syzkaller.appspot.com/bug?extid=3decf7252f8521fa80ff
<4> 8       Yes   INFO: task hung in pn533_usb_probe
                  https://syzkaller.appspot.com/bug?extid=8996fbe184c5b84f89d4
<5> 7       Yes   general protection fault in nfcmrvl_bulk_complete
                  https://syzkaller.appspot.com/bug?extid=59d5e6a8ed04e6a000c8

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
