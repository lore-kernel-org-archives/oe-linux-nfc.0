Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C9F32A3FE
	for <oe-linux-nfc@lists.linux.dev>; Tue, 21 Jul 2026 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651907; cv=none; b=b4AcgyFKe6xKaUTwl3hTynKiKGeZOl/SHRNIrwkUOyQL002sxxXdNvg1BRM4TktwuylqYNBBIKXKhxWtt+U/Egm5E+8uYpE/XljYARGtgLQ6XYitU7CVpCRElKpzyzd9LpEAZslIcVGtydAys2XvqVFg7LdDVheCZfN3TYZfq3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651907; c=relaxed/simple;
	bh=IIsg5LNJf5aQ0cLtyQoPoijCSzNNTN3r5SiNIC4aJic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pyQhmmORZMQlDtYEvAXBlnKBrC/7h2Q/Wi2dMwikzhUPSPZMiEmUXeOIBzo9vICL3tgGdnQHYfNPBO1BcJzFoz6Jslq4COYDF/wsdZ7tZ0yHT83PLsSf1PeHlYKHJBOR1FtliZAg/vcY3f8ng5cdEzj3hSDTP9RflCKv9u4Uu18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrlxNm0E; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrlxNm0E"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc97653887so126293695ad.1
        for <oe-linux-nfc@lists.linux.dev>; Tue, 21 Jul 2026 09:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784651905; x=1785256705; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5KmYNoNui/9hjo/Me1fX33BIrL3ENZ8CEuolPxOI8Y=;
        b=BrlxNm0EYPM5atPWfK58r1Vl8VXZEgBxZF4pLa3QAmtBVtBcXJb31Vly1l3oAmoJV8
         WPCWYN4mybh4apZESPZiRNsWS0Bq4RoYoLrjtz/1xoZFv0zaEOGHV4bmZ6S0v62XS6lf
         7+3e2Ub8O0uRggK3k4DbrjtJ89NS27dFOQGJAZtFsPpSI7EbEM4cE7scz88etyoqMwzZ
         1NsAI+PXhthxAZhPbFnYPLPXAMvgECjKwM0CkdOG5h1w3IVu5QvKow3pKCjQva9PONm0
         apnn+k7fC/F7CwJ/XpNeeKVQ2vwVtPnPIrwsC6n7Iv3iMQjBosJamtXZw6QFmk1pV+Yw
         eGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651905; x=1785256705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d5KmYNoNui/9hjo/Me1fX33BIrL3ENZ8CEuolPxOI8Y=;
        b=ECVuQB1jOUepmm+oy/O9mYQedwxzqldNuiZ8NGY3ZP6ISnpCMeAcEBwOPjnYW53lwI
         6TZk2A/Hg92uJKyQ7hfYCopEIO3O29v+5YQOz+X8ItxfVFuk0XK3LN4tmG4BuqC3fTR0
         vGrVzz/Z+jy9R/Qg6sZ/G0YKcpcap6uTKKsakfEpQVYyx8E3owrAsq5b70Sohuzt6ugs
         QWxN4e2w3lymJZW9Uux0utEFror6FZUrrv8mZ8psvdpZCfhGZ0FZzoZQ8ogup6amzwXx
         Kjdg4OXwMcS78xEKsj/ps0LAVi47uwbt8vVtSehWA6cBg57sJwvIIlg1/4WpbM9ivndJ
         VhYQ==
X-Gm-Message-State: AOJu0YwCD5B+o2iCM1BxhhRODZ7WJ7EF84LCL5kUKrnsqbGmaiT8Vu9f
	e/YCaTwGW3p/mb4Of8MDl8RSSSrUoh2E7fYcMu9Z4eU3tleSaEh6c3dV
X-Gm-Gg: AR+sD13NFQHivPH0Kn+SEHLVD71MaEFDWWbpuhYQ8zpoWKngAX6Se4M9Mf5jrvoyant
	6e7SORWJJ4VOBkG2+asDiowHxr8K5/b/NPrjVoq76NK3vGSTRwmHHWsfbUOZX7tK5g6yfOAtdTv
	02wJ7qO4AmLLIF9yYGTV/P0C8lKG+8r8VwXAJziggTlvcSGxLpNmmP55ju8XV9HrEpgM0f0Lrzv
	F2+q3MasaXMp+bHEe1JSIMo8AMiGjFB2cVKJ65MPl0Zt25hsSiF7Be73vp1Rh2L3WAZfmrciE8w
	vIBFMBaSFzBE3GHZSvYUdCRnMhNrcF+pOjKnLZm+QpSo/foUnBj6wCWz8jJRwh8YQQ96CqBePgd
	qufVpDOV/JhtIrbCKNtOuITht2edfHXUY2KKQJ0+0CFPlaGNFxZoNDTU4zryzJOIdOOgBwjPgab
	Q4l2fWOYRww1HMNeuRrNUiIXeTh1YydL0H3V161n2K28Vq2kfIp8K4IRntfA==
X-Received: by 2002:a17:902:dad0:b0:2c9:97a8:afe5 with SMTP id d9443c01a7336-2cf349eee08mr204790805ad.40.1784651905156;
        Tue, 21 Jul 2026 09:38:25 -0700 (PDT)
Received: from fx.tailc0aff1.ts.net ([206.206.192.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm1053708eec.21.2026.07.21.09.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:38:24 -0700 (PDT)
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
Subject: [PATCH net-next] nfc: digital: fix use-after-free in nfc_digital_unregister_device()
Date: Tue, 21 Jul 2026 09:36:32 -0700
Message-ID: <20260721163632.1570651-1-bestswngs@gmail.com>
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

base-commit: d4932951a19a5f1ec93200260b85e1a4c080ff77
-- 
2.43.0

