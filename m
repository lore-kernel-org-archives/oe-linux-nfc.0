Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104438;
	b=ZOR8Pc1UD2OiZmDwJm4pR+1ih1AJqVkAHgmzBKdwS/ZC1k9n8XClz4tQRTzikH1CgcUv
	 QfSrl9oQ8bWhtTmCVjlst3vzG9Y+zfCquhttKf0dHspxxWQZUK3ga0iBIj44jTb5AUdv/
	 91ceSkdKb5dk742dhi9O8A02KcjQwLA6F2u5g6z7yh2Lc2EYxUAqeVMMAOuFgTUEsYyEz
	 Rc7vQ9dVxeObEU4zDla6WEw+u8+8DXMrXEcxAnZUB+4cTVtArl6WAHhQj9AYm0m3NRSXI
	 PPYaWq1VPjDfoG9dhJQT+i994S27SXE9BpmCQpaWHdBDyL3l0sck4eNlfsLMCN2tY5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104438;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=/LIwi1HI6or2lffhXmb5nx7x8QsMdBgyQvDtC3Qx7hI=;
	b=rHpCsHAu6UI6lc0WgbDy9qY3T0E14qQmD/SpK2lGWsQLWkpFsIKe++nXj0tS+cvcyvXU
	 8e5ZX1cNQGTk+ALexksV6axrRTfyLErBqNhRL8bWMFQv2IGZuh28T2JibRUDfM9e3yF6Y
	 sF8e/CQAzdYtbg8jKFjmUxEQeYbXw3vlntOh2OpOQJsMefuG7fus4e4ybRXaN/04snMky
	 ZcABrG1Gy3yWvRaPM/8t6/ZyR3fNGI0o6zzuL3GA8vmGsvaoHSlBcPDGEqEzRhU6w3orO
	 1sSJHKSHjZ7WjwiOJy/Xxg5zVeu2s0p1evbI5WnnoFHm1QlWfxUbS55yE2kIUPNK9Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A7C606A31B
	for <oe-linux-nfc@lists.linux.dev>; Tue, 27 Oct 2026 12:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12A7C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b26d8d2498so5835011b6e.2
        for <oe-linux-nfc@lists.linux.dev>; Tue, 27 Oct 2026 05:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104437; x=1793709237;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LIwi1HI6or2lffhXmb5nx7x8QsMdBgyQvDtC3Qx7hI=;
        b=AfVO6mCH9dvrVfQH5GWxBBgrb0XPagkAewgtsk6L9LakMrIXSauGxnxL8REAuiZhOd
         5jI2Ew1fgXB1cYJf0QrzQagsxHRDCcbx+3jOEAjBMujTBHhQsRG4mdZBODkecFWtKVfB
         SYhWqmu6uSFiM8tlbr3E8Jd+O/kczIJQNVxXY5ImqecO5tcqGJSVXqtkMe2sxF3iJLn1
         NtWtYiH0ozBKM4y88Lvj2edEg4e4tGs4bZTHdMrp/zSNNUK3aoiNdukAWh8emiZecdFH
         AtgW+BcGXH0cVcqQIupAlhMC3zeknCh0UhFxVZLb1ZCGuDLspVkql7EBGN7Z9POMgR8L
         cZmw==
X-Forwarded-Encrypted: i=1; AKwUvBx9cfqAvQmD63jJoUCFqF4DM2OlMOj/MuN1kqlr+P5ADhfGuCGoQGtd/lDp2JBGs5kEPKHfENvbvgYBaBo=@lists.linux.dev
X-Gm-Message-State: AFq9FYILi2+bnUSQAz4asyZ0I6+XdNIw3bskUioBEh1W1YHSr+3pI5n1
	GzWu0ujGiCl4DqP+MDGig/FyhgL1jgL5so/pulR8lt2ZJqEb7w9w04BX26Gtsbz1MPfRg0G1g+u
	EQtBHsBmb5ZA45khEpBuwWo83QokN1oeNZtAW+utYATLPVU+sdF5cyX6SBtk=
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:180d:b0:539:4d53:170b with SMTP id
 5614622812f47-55c002412dcmr7087748b6e.17.1793104437009; Tue, 27 Oct 2026
 05:33:57 -0700 (PDT)
Date: Tue, 27 Oct 2026 05:33:56 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae09a34.f0fe5aea.79aa1.0092.GAE@google.com>
Subject: [syzbot] Monthly nfc report (Oct 2026)
From: syzbot <syzbot+liste730699f000a7bb75adf@syzkaller.appspotmail.com>
To: david@ixit.cz, linux-kernel@vger.kernel.org, oe-linux-nfc@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello nfc maintainers/developers,

This is a 31-day syzbot report for the nfc subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/nfc

During the period, 2 new issues were detected and 0 were fixed.
In total, 13 issues are still open and 34 have already been fixed.
There is also 1 low-priority issue.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 347     Yes   WARNING in port100_send_cmd_async/usb_submit_urb (3)
                  https://syzkaller.appspot.com/bug?extid=89f5f8143d8e62af2b61
<2> 9       Yes   INFO: task hung in port100_get_command_type_mask (4)
                  https://syzkaller.appspot.com/bug?extid=3decf7252f8521fa80ff
<3> 6       Yes   INFO: task hung in pn533_usb_probe
                  https://syzkaller.appspot.com/bug?extid=8996fbe184c5b84f89d4

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
