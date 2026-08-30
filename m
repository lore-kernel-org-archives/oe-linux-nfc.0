Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41613BED7F
	for <oe-linux-nfc@lists.linux.dev>; Sun, 30 Aug 2026 17:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788109805; cv=none; b=rq5UravAjQvNZWQCGcqWgIvXNYcP40OJiCTWpkghBOu56DFxTqHaz/r4Lioil/64eFYZIwAKLcxNnrGqvoJSsdiy1M+j4jLf3bPYxinSm52Idx/qTaMuj03vvegptky5S7kMFBT7PqtdUiNJagFNnl8I772POdDZnEcEl8uZZNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788109805; c=relaxed/simple;
	bh=8tYTZVigH+IKsJ6R7MXBMSyCGu+Bip0+FdZw/et+q0A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Nsohy4VCzJ2BREYSVL08eEIo90Wep1GysQDbhxt9YdAST9WwAbZUh+5GO52S0CZLpZ63HqmvhI1ju03Ut5cSr09fZysNEvkQFEmOYaKY6MKu1coAIkzsHzpb2nMNYNP6gnFag8R//fz6nt8s9hlveTxJfapJG212Poa77cj40+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b37733badcso4834633b6e.1
        for <oe-linux-nfc@lists.linux.dev>; Sun, 30 Aug 2026 10:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788109802; x=1788714602;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FQe/FqEO+AeJSc0FYnCV3mBpcPBh5PcEEwWnwiwVIJQ=;
        b=hN/hiGi0zfzrKVjHd37kYhXjwILThSUa+0vpByULX88f3+UtAlR7qbkDux6fKGMzdQ
         ZdUrxZNkXlLqqjTRrdKcsv2KGvNSTwNMfFPas6Pp5gSI58g7tmATAXiSugVHNP5Rryce
         dpTE/V9FfPFJBn3BR1DH62rUEIyGufMe93BQTMto7vZLYSIHL2ig16AeClljxnVji5cT
         8+LcfY04lwPrezYRmfNaUY0cBE2CqOHRWoSZMhtxMfSVrcWLTD/x592SKNRTL3xzs0mZ
         1bkRpQKBKhGDw2zUsdE4MevUfeqEFZxOnT1cly297TEFa48A1AQFGdkCSXP1sfUiv10k
         3SZA==
X-Forwarded-Encrypted: i=1; AHgh+RrBs+SO9QFc12gIMU46HxzGvx9iuh9UwsHxyZuXb6FLZLb9QHcDFsMXFvU5Q4P/pEpLNrYk5hg2wYOgm+c=@lists.linux.dev
X-Gm-Message-State: AFuF++mts3iUElo9SJJURpzDvb+uJKJbisQuxU3IPOPjLZE10oJckela
	P8hIKYkHkEmGALvn+pS29YU0X+qpRlV+DiKJq3B4+L78xrQdW8zQIgpQYogA2Ixnh8qepUFBjPS
	17nGqeIHs+AObKy1VJl1qGJuvP+ZjBCbChx67Q0JFJ9LFGNCyBCkBwJxwQd4=
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:190f:b0:4b3:74d0:6ef7 with SMTP id
 5614622812f47-4b398037cdamr19722620b6e.4.1788109802772; Sun, 30 Aug 2026
 10:10:02 -0700 (PDT)
Date: Sun, 30 Aug 2026 10:10:02 -0700
In-Reply-To: <apRZM5ZkGw7KQq4-@user>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9463ea.1d9ded08.62e62.011f.GAE@google.com>
Subject: Re: [syzbot] [usb?] [nfc?] [net?] memory leak in nci_send_cmd
From: syzbot <syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com>
To: davem@davemloft.net, david@ixit.cz, edumazet@google.com, horms@kernel.org, 
	krzk@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	oe-linux-nfc@lists.linux.dev, pabeni@redhat.com, pavankumaryalagada@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com
Tested-by: syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com

Tested on:

commit:         73ae59e9 Merge tag 'erofs-for-7.3-rc1-2' of git://git...
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13247379580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=563582168294b9d9
dashboard link: https://syzkaller.appspot.com/bug?extid=b197a0fb4e741cc5030e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14287379580000

Note: testing is done by a robot and is best-effort only.
