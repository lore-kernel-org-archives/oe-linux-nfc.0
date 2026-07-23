Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AB847D477
	for <oe-linux-nfc@lists.linux.dev>; Thu, 23 Jul 2026 17:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828735; cv=none; b=VmwLW03PyaKm4iCOLJNwerKweP2ZoVPPg/Nsa0fUmgpeE/i1caZzug1e6Dev5YxzRtB6HxfLH0h3ou96OFnA7uQsXjyCGVNkmQoK0iqKU6+xCy0+bJNRNvSabKa0LXxR1ZxY4Y7XkPNCLnisvDHUY2QGsNBOULtG19oT4lxOU9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828735; c=relaxed/simple;
	bh=GpzhhMRYN/iYCunxpNPlT1YqMOQKr247+Sq6sjGne+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DBy7QG7r8K8hc/gofTJHwKB8rKS9cCS8NI8TXMLF3RbXB/9tsAAp37q5uYxkJv01i2qyfm/lcWdxFBafXtK42KWC65pyyxXEEebpYSEgc9bGWoNAQ3H+eZMbYMNA/ntD2Byzt3CIgmxMWwuPbPsZl7t3HFHKkbMU3HLUIZv32kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhQ3fhQz; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhQ3fhQz"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so984141a91.3
        for <oe-linux-nfc@lists.linux.dev>; Thu, 23 Jul 2026 10:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828723; x=1785433523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RgqjbyFDcZMHfHX0tAra4Pr08m1zwCx9sNwlnEiHric=;
        b=BhQ3fhQzbO2Z017oUNVVFpXDANdJn2GGTyPizsTVuRLeUwyFLmA3jwC5TzMb6A5x7b
         os6+RKxvoEWOUJ+v07idYvfY33Waz5ZTnnzm3Vb0WLKjg0JbV9OcZKVpVyCxL4F2nmGS
         YtXGb5x+PrABrnEdC4W5PevU4NreNQf1bPCSA+bmZ6Lf7soGhhP0VDeYZWKm+SeuMz/g
         HIEhgDcO+/lYg1TgrbtaMJBbB/4h4UogjsnE2W0JN09Ez2yylBw4AH1uD9HuaiOxAxBU
         t0B4zEJsKHrPrR3NhB5z8kFkgnbVK+fneF2tC2LYLvyj2ZqcI5mZVzZnz4alXGJnrp/6
         +igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828723; x=1785433523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RgqjbyFDcZMHfHX0tAra4Pr08m1zwCx9sNwlnEiHric=;
        b=C3NbVzA8LbvneQPbtCv+NklpJLCXZt3F/yOfRQBa0LVLb5XqaaWm6OlDXPwVku1XuI
         /7f2KN/YBl9rWbMVvmykHAFiNT+yA9gKrnPVuwc1YD6vo6taPALOk3Fl8PjjXg7SUcrO
         U5JOqcglo5WXUYbBizRSrvGEDyyAQ/d/mJpO+OIQGS/v9TrVkzwoCRH/H5bbYta/0iII
         Jhsw1VHYG4vs7YhP2qn167fIoS+mD3IfKcURETNJeei8vBsHxlasAQkeYPUTWe+mcfyd
         siq2a6rTBhJyd3iYzpnAFp7o7ZuZniIExnEvn4Rvkq+k/t+wYGT2XE01hC44PLKh3tHW
         mkLA==
X-Gm-Message-State: AOJu0Yzwu0D/vaUxE90NIZtEsbX5jKgYRLBSziepOh77VEcc1S/MCdG5
	zwLPmKL50b/V7t9bk5zZ+Df1IPNkiLYaZu19FnPAYXNcudlMCxKtbhPK
X-Gm-Gg: AR+sD10ou+8CHZ0QpKQE81+Qu0j6nwFsPBtlsmaBVMGloJea476rBlUGbbUP8a1CTXA
	GsAh9d78L0w/mEBjc3bub/hmh5V/vJum3oOZxBOdKZOHqJ3Zol5AGRxg+uxE576QqLEXOJaNUBQ
	GY4EQLyppsDSCU5r4HmCgo7AwfJtBMHO7f7A4E63MH7QyKWs9dojCaJIdSgGwKsgWY4OVALbxnu
	TBkJw/KBghubmj4ug3sluQK/b5CE6pRsjBx7fmxrV7Tr08f9IHJ9QdwAFagEz3ntJuOMxUN1FXC
	Tr7NR98NTWmuINq0EGTsLF8iKsSpU1hwjMB/HukkuUnrJwHzSnnuMCPkD6oFRVSZZo26zNpBwcB
	aIleSeanMHZLWrhvp0RO16muShD5mQ03lNmH6tXKB9W1kkY5J6dCtrkR6QFBq4I1rpcHjg57Wo7
	Zx+sNd+OD6vuxsR4scJu5G1YnZcS13i+G1L5veWGSfvbu5bl4=
X-Received: by 2002:a17:90b:52d0:b0:38e:9e9e:ec57 with SMTP id 98e67ed59e1d1-38ec667a731mr4035830a91.43.1784828723369;
        Thu, 23 Jul 2026 10:45:23 -0700 (PDT)
Received: from fx.tailc0aff1.ts.net ([206.206.192.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13002f39sm18210216c88.1.2026.07.23.10.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:45:22 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH net v2] nfc: digital: fix use-after-free in nfc_digital_unregister_device()
Date: Thu, 23 Jul 2026 10:44:51 -0700
Message-ID: <20260723174450.1015153-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfc_digital_unregister_device() cancels cmd_work and cmd_complete_work
once each and then frees the command queue.  The two works re-arm each
other: digital_wq_cmd_complete() ends with schedule_work(&ddev->cmd_work),
and digital_wq_cmd() hands a command to the driver whose asynchronous
completion schedules cmd_complete_work.  cancel_work_sync() only waits for
the instance it cancels; it does not stop the work from being queued again.
A work re-armed after its cancel_work_sync() therefore runs concurrently
with the cmd_queue cleanup and dereferences a digital_cmd the cleanup has
already freed.  digital_wq_cmd() widens the window by dropping cmd_lock
before using the command it took from the queue, while the cleanup loop
frees the commands without holding cmd_lock.

It is reproducible with the software NFC simulator (CONFIG_NFC_SIM): start
an NFC-DEP exchange between the two nfcsim devices and unload the module
while it is running.

 BUG: KASAN: slab-use-after-free in digital_wq_cmd (net/nfc/digital_core.c:174)
 Read of size 1 by task kworker/1:5
 Workqueue: events digital_wq_cmd
  digital_wq_cmd (net/nfc/digital_core.c:174)
  process_one_work
  worker_thread
  kthread

 Allocated by task 5124:
  digital_send_cmd (net/nfc/digital_core.c:234)
  digital_in_send_sdd_req
  digital_in_recv_sens_res
  digital_wq_cmd_complete (net/nfc/digital_core.c:134)

 Freed by task 4994:
  kfree
  nfc_digital_unregister_device (net/nfc/digital_core.c:859)
  nfcsim_device_free [nfcsim]
  nfcsim_exit [nfcsim]
  __do_sys_delete_module

Use disable_work_sync() instead of cancel_work_sync() for the two command
works.  disable_work_sync() cancels the work and disables it, so any later
schedule_work() -- whether from the sibling work re-arming it or from the
driver's completion callback -- becomes a no-op.  Once both works are
disabled no work can run, and the cleanup loop frees the queue with no work
able to reach a freed command.

Fixes: 59ee2361c924 ("NFC Digital: Implement driver commands mechanism")
Reported-by: Xiang Mei <xmei5@asu.edu>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
v2: retarget net-next -> net (Daniel Zahka); no code change.

disable_work_sync() is v6.10+, so this is not Cc: stable; a backportable
shutting_down-flag variant can follow for -stable if wanted.

 net/nfc/digital_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/nfc/digital_core.c b/net/nfc/digital_core.c
index 7cb1e6aaae90..6def5132a4a6 100644
--- a/net/nfc/digital_core.c
+++ b/net/nfc/digital_core.c
@@ -843,8 +843,8 @@ void nfc_digital_unregister_device(struct nfc_digital_dev *ddev)
 	mutex_unlock(&ddev->poll_lock);
 
 	cancel_delayed_work_sync(&ddev->poll_work);
-	cancel_work_sync(&ddev->cmd_work);
-	cancel_work_sync(&ddev->cmd_complete_work);
+	disable_work_sync(&ddev->cmd_work);
+	disable_work_sync(&ddev->cmd_complete_work);
 
 	list_for_each_entry_safe(cmd, n, &ddev->cmd_queue, queue) {
 		list_del(&cmd->queue);

base-commit: b2ff91b752b0d85e8815e7f44fd85205c4268094
-- 
2.43.0

