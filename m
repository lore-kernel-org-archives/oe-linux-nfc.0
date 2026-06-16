Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C9037880B
	for <oe-linux-nfc@lists.linux.dev>; Tue, 16 Jun 2026 07:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781594216; cv=none; b=n+kmiDiXioGkqY8R9fzzokt5QNt99qFQ72W6a6MTBS47XudltdKArw01cckRVfnT+Zki4zch1C++3bmR7zCuwZH8QtzJWH0+nd4/q4wM2KqAhxdYMMkNA8qosb5cbvoeTcAZuRdmHqFgV3OwGiwmNl7HZv714o6iBcZeZq0uTYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781594216; c=relaxed/simple;
	bh=vaZ/0Ewnu98FAmvpL2lOvY7+wIaJKmUfWYSM+IWun98=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kZoOehTGI/erirG0GCcJbXKCaPQH5GeDliy0mqkwPbHTCLev4YEIQbS931YKnb9Gf77DeaqO6c4QMqwxY4+zlHaq8e0aUA86avpmrPhBNkjzuRQhX5egiQwlm8oXGRCnrsh66g/v1mLTLkLvSAVwwUX2xmaOi693++kRU3OQ8Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCeX7ybV; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCeX7ybV"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36bdda53d99so1566460a91.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 16 Jun 2026 00:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781594214; x=1782199014; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BYX4P/K/DjUBCFGIDzHrUic46/bz81v6Ai5JIWtpoEg=;
        b=kCeX7ybVWosPvA7/t4gTA8d16KDC+hCQXU1cUGuwJpV8bEDQMgqqaj3E4CXdQzDtQz
         JOfFhdNnnTb7Q4UrOkt6XjfCgT5XIK07rRjmpVACg/n4qOKPWOLLtGLQvsky20k41Shv
         uV6f7740r2E5QYQE/wCJZF41KOPMTZavLm4QvrLBLQthQwr2aY5plWSyo7taH7p+Tx/y
         agj/szSgBn73XJW5acBPVVU6LC2WzbX7dBwB4ccilL/1rMzWT9+Pgzx2nVOqZQaki4Gz
         n0+E7wPYm5W3U8r1aEUGYlKGkxJ4OW2HIRqo1pg5ogFnbnhwvjgll/xAAa97pQ9kee4A
         9PBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594214; x=1782199014;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYX4P/K/DjUBCFGIDzHrUic46/bz81v6Ai5JIWtpoEg=;
        b=mxsNHxcUwS8rJZh3/+sCU/Quyd7E48MPFoWMEvdU2y8ToYEQkAC3ruST3n8Ft2m0Fr
         L6mhbA+zfgFUXvpXOhrverxwW3QuFNw2gdoBHqKUslAAzp29HD8DuIK0vsDlDS+HzFta
         +Sw/AWdccofX+4SL6Apc5wDdCbitCa+amp9EOxA2CWtV28rgZRKeM0GhB2UW6UFn5b7b
         kuq+5dT9uyuD84wSiWeOb/nMkbNMNUWjTaiMmWGky2TMJYaIGQxG2F1VWFF0NSma/+oi
         ZJa3W8cHMOmhXntpi9npluvVQHTnY6INHlIujHXK5E6v2hxt1fDI8iv3l0VzyErUnaY1
         syXA==
X-Forwarded-Encrypted: i=1; AFNElJ8K96UA6yPfs4Rne9yfyEvkR+mHWGmd/VlybimFoZsDkSlt2ujBDz+rL4/fJKbXb1PZ0TXYU2u5l/lRuls=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAo2l0eGkecbnYhljAoimpGV1j77jw6RYZgZsv9DdU70B1kLLJ
	VvCs+/+b4w1Cab57Xl2j4LFAnCfn1gsZt7VrvcwquPThEDF4HfzCRjYZ
X-Gm-Gg: Acq92OEwiQnXNnaOlQ+ntHGdhGmYzUBwaGa0fqZmDSEqxMD9TyUhzXm07WsSSpxG812
	YiWRkIEJeCSb8KniLDEmPZ5ZzAa7fsyAAPLtOAEQbu5FoDAcgXFvb/U/UutTl34ovX1+G0aHwwS
	FGZ5RFanDIMWNn0HF8DKQtJLwAnL44BXHf6PB2z7rhnKm7cSuCvoNDssSwPT2Opw5pSwc36Q6eH
	j8JpZiwuAir3qF+ozCCpjDnZX2P3uWrw+yxC98sAecIG6WcTsVfL/JpzhkQyex6vRn6AuKZu02c
	KyT04XqRFFTUm+PN7JPV3b30DJltdsrZIFI+JUyZOeaWjKH/fZyOUtA67qNk4RTwon+CdQAgDbK
	Nu+81/JpcKYsr9rSg+wdyB2f2OlbfsMfANnK5yeiaMPrkT5I5frNVI1v0bSDYsih7iadwU53Ehv
	t3KSsBsd+0WpylIQEub/tfSrUqql+WFYEUdpCGqsU3U8pO/53b
X-Received: by 2002:a17:90b:1a85:b0:369:c5f4:9681 with SMTP id 98e67ed59e1d1-37c5241e920mr2843981a91.22.1781594214226;
        Tue, 16 Jun 2026 00:16:54 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c522136cesm1840343a91.14.2026.06.16.00.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:16:53 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: David Heidelberg <david+nfc@ixit.cz>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, oe-linux-nfc@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 port100: use after free of dev->cmd if disconnect races cmd_complete_work
Date: Tue, 16 Jun 2026 15:16:50 +0800
Message-ID: <178159421085.2162671.16527372544343524090@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi all,

I was looking at the port100 driver after the earlier port100_send_complete()
use after free fix, and I think port100_disconnect() can still leave a use af=
ter
free because it never cancels dev->cmd_complete_work. I am not completely sur=
e,
so I would appreciate it if you could let me know whether you see this as a r=
eal
problem.

The command completion work is scheduled from the two URB completion handlers,
port100_recv_response() and port100_recv_ack(), and both of them call
schedule_work(&dev->cmd_complete_work). The worker, port100_send_async_comple=
te(),
then dereferences dev->cmd.

  static void port100_send_async_complete(struct port100 *dev)
  {
	struct port100_cmd *cmd =3D dev->cmd;
	int status =3D cmd->status;
	...
	cmd->complete_cb(dev, cmd->complete_cb_context, resp);
	kfree(cmd);
  }

Here is what port100_disconnect() does.

  usb_kill_urb(dev->in_urb);
  usb_kill_urb(dev->out_urb);
  usb_free_urb(dev->in_urb);
  usb_free_urb(dev->out_urb);
  kfree(dev->cmd);

usb_kill_urb() waits for a completion handler that is already running to retu=
rn,
but a cmd_complete_work that the handler already scheduled stays queued, and
nothing cancels it. dev is allocated with devm, so once disconnect() returns =
dev
is freed as well. The worker then runs port100_send_async_complete() and reads
dev->cmd and cmd->status out of freed memory.

I do not have a port100 adapter, so I reproduced just the ordering between the
work and the free on 7.1-rc7 under KASAN. A small harness sets up a struct
port100 with a dev->cmd, calls schedule_work(&dev->cmd_complete_work), then f=
rees
dev->cmd the way disconnect() does and lets the worker run. KASAN reports thi=
s.

  BUG: KASAN: slab-use-after-free in port100_poc_work+0x7c/0x90
  Read of size 4 at addr ffff888106322004 by task kworker/1:2/77
  Workqueue: events port100_poc_work
  ...
  Freed by task 286:
   kfree+0x137/0x3c0
   ...                                  <- the kfree(dev->cmd) from disconnect
  The buggy address is located 4 bytes inside of freed 64-byte region

The read is cmd->status (offset 4 in struct port100_cmd), done by the worker
after dev->cmd was freed.

The fix I tried is to cancel the work after killing the URBs, so no completion
can schedule it again, and before freeing dev->cmd.

  	usb_kill_urb(dev->in_urb);
  	usb_kill_urb(dev->out_urb);

  +	cancel_work_sync(&dev->cmd_complete_work);
  +
  	usb_free_urb(dev->in_urb);
  	usb_free_urb(dev->out_urb);

  	kfree(dev->cmd);

With that change the same harness either runs the work on a command that is s=
till
valid or cancels it, and the KASAN report is gone. The earlier fix (f80cfe2f2=
658)
only added usb_kill_urb() to the probe error path, so this disconnect path lo=
oks
unaddressed. It has been there since the async command mechanism went in
(0347a6ab300a), so it would be a stable candidate.

Would you agree this is a real use after free, and is cancel_work_sync() in
port100_disconnect() the right fix? I am happy to send a proper patch with the
reproducer once you confirm.

Thanks,
Maoyi
https://maoyixie.com/
