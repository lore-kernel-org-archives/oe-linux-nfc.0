Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1BE2E975E
	for <oe-linux-nfc@lists.linux.dev>; Mon,  5 Oct 2026 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196156; cv=none; b=iIhddNR/x9IklVOSRkedRCp2iPiQyj31rz17nGtZpbr5XbfEVmUCbzvhiJAR78/sZdzsnihWLGgrZ8pVqAao5VOihohCbDDBXUOz9yO7X8o0vw240vDM52ca4dVZ0rxbKXBGqbvphZQo0Re0IR2mDv3xFpNJau5mdiwOTvYFSb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196156; c=relaxed/simple;
	bh=ZqrknraJrh16BFHTcAGNuZS9Sw54k4nkDA1XB6fk0zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I98uMwiZSAzOQ1Nmf4RD19o5VPgQpUg0nyHxHvwn3aizONTjwzh99P+wISTsgZMmNhv+/vv4m30ZIYyU4rcEnDMkdIcTQvj1tSDds60o+ENhKL86Un2jPgJSefTNqedChuOtkGSfrODndqRDRGKoM6PPNZLPgW7SKrmNOVwj4ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2y7Yw/A; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2y7Yw/A"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04be84so1457706c88.3
        for <oe-linux-nfc@lists.linux.dev>; Mon, 05 Oct 2026 03:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196153; x=1791800953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oukphk47V539pkBOqAi5PYDeCD+s84orlhv2/lpFlbo=;
        b=A2y7Yw/A3NOqwSCpHGd3q26oUhBScU03Sl2t08n6VS9zmqTL6GVHTu0/tFj4+O6BCs
         /cXDVLIvKq487wm0+kKebzDDEmwjvIRCvfO3i+xIvpdURRM1j8YbuM7n6r4dpkBOFFIL
         nzUYfQSYOTnJBlJ7bcrM7ks5CYtlw31c8HKn0nZ98rma+SqQkN0Gp1OhoePWPe1Kxjk2
         dUnl1avojkUOT7nUkCBnF8rZQjDgvaB5EhEiSJJBJ+VrB/9lQwYcxJjGfcpskYFI2rfd
         zXgQdybeMhkRXDKJnAwWgD72gF8JMgZmqa7xH58DJgsKyCjirtOyogMi8Y2dlzZGNtBn
         fG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196153; x=1791800953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oukphk47V539pkBOqAi5PYDeCD+s84orlhv2/lpFlbo=;
        b=qKYP8gw7AE6COncIH2Q1HcdwDOYkZ/0tjFgIihLcLq/mrjNL9gi/VVqFyp/jfo+iDA
         eV5wcl+Ea9nRzjjgm4QorNmMvFPm0Fszp6dirjNXGFrNdUpdc005zjdcAQuIhgIK08LS
         8II458WFQTktjTXhz39f241PFgHH0DPe/TyztnTIh2OiUNt0PN1Gv72FVHJNVfwVLUaM
         rlZIPifhNIvVYz1wcwyyfDaDVV5C+E8LdtOT2eagx7heaPt+e4mUIec6/1vkycY/JQnD
         9OwnOMxHsyqT3H5hVpiDoOBTWmbMSeaXR4sTQvGDcC4BC6yCatqLXi/h96aSk1/kUqeG
         vZhw==
X-Forwarded-Encrypted: i=1; AKwUvBxczlSy1T/enbYh+DF512Kn2UXk90anmnDkcMsbB9jQAobB0seG1fqBRsM2aVUlu1w5yDMlemSgEEOoEfw=@lists.linux.dev
X-Gm-Message-State: AFuF++nAy+lDAGJac/i00LJKzsblPAsMD88/fWPryn7GhSf/lOMCu9Wd
	k2SOM8ELrJbnU6BXgchyc/ShlDRf/iPpdjfitUVe409cheZdwT/I7ePk
X-Gm-Gg: AYBFou0qGweyWS9v5Eoix4mMCEGkRg49bhZ9Wcr8u+Tv7OvgGJJbECzV/wcHmrSJs0y
	VUSNTGxpQSS2PoeCj35Wc88L0py2CcBiGqsFf9ppLHWoSdlpAL1KwWP2PZVwl6EFhL0PTl9LeV9
	SXZP1lNNZgWwNG0iHCW/g0u9h+zBzDnoJyAE+JDCySVlHc8QzcRSrIg68SgpZ4S9nzFCGulDL8M
	kfevS/lcEbsPX6qzfd0D3BNdH/Pxe8zwsCFfOR2/M+GE3nwMzQDfbB7k2Vzbknc8EpmQnwjgVRM
	XQ8ig/SizBshBlMqj2dLc1FsOviE1qTlhuSrihRFWRIoI6JFSqlV8Qc7Zm6xVhq2Nwi9GKAwJWU
	zsymagR3JYBOjlV3LiOxxAL3g7A96IdL6iTGJQMHDrXVSv1wtx4tpcnZKU7SeXHcXGg6QhBh1Xw
	+PgllmDZewmeNb8ZQ954m9BP9sI8H3MTtgUgpv6Sox2hkXF8CA2iekz8Vs4m6to+iEx+2CMnOmE
	2WxnZbR7iM3/eUfAQbvnnM=
X-Received: by 2002:a05:701b:21c5:b0:151:2068:e81f with SMTP id a92af1059eb24-1512068e899mr11215456c88.27.1791196153405;
        Mon, 05 Oct 2026 03:29:13 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.132.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272a45a8sm13399093eec.22.2026.10.05.03.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:29:11 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Ian Ray <ian.ray@gehealthcare.com>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+ebbbf06f152da8ea4716@syzkaller.appspotmail.com
Subject: [PATCH] nfc: nci: drain rx_wq before cmd_wq on unregister
Date: Mon,  5 Oct 2026 15:58:48 +0530
Message-ID: <20261005102849.486-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nci_unregister_device() destroys cmd_wq first and rx_wq second. Any
rx_work still running at that point can handle a response and queue
cmd_work from nci_rsp_packet(), which is refused because cmd_wq is
already draining:

  workqueue: cannot queue nci_cmd_work on wq nfc2_nci_cmd_wq
  WARNING: kernel/workqueue.c:2352 at __queue_work+0xdb7/0x1370 kernel/workqueue.c:2351, CPU#3: kworker/u32:0/12
  Workqueue: nfc2_nci_rx_wq nci_rx_work
  Call Trace:
   queue_work_on+0x180/0x1e0 kernel/workqueue.c:2501
   queue_work include/linux/workqueue.h:700 [inline]
   nci_rsp_packet+0x297/0x3420 net/nfc/nci/rsp.c:463
   nci_rx_work+0x29c/0x430 net/nfc/nci/core.c:1579
   process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396

nci_close_device() does not stop rx_work from running again
afterwards: when the device was never brought up it does not flush
rx_wq at all, and the driver can still deliver frames through
nci_recv_frame() until it has stopped calling it.

Destroy the queues in dependency order instead. rx_work queues
cmd_work and tx_work, so rx_wq goes first. The cmd and data timers
queue cmd_work and rx_work, and cmd_work and tx_work re-arm them, so
shut both timers down before any of the queues go away; after
timer_shutdown_sync() the re-arming is a no-op.

Fixes: 6a2968aaf50c ("NFC: basic NCI protocol implementation")
Reported-by: syzbot+ebbbf06f152da8ea4716@syzkaller.appspotmail.com
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
Built with W=1 only. syzbot has no reproducer for this report, so the
fix has not been runtime-tested

 net/nfc/nci/core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 73e3a96470ac..aa417f863f96 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -1329,8 +1329,13 @@ void nci_unregister_device(struct nci_dev *ndev)
 
 	nci_close_device(ndev);
 
-	destroy_workqueue(ndev->cmd_wq);
+	/* cmd_work and tx_work re-arm these, and they queue cmd/rx work */
+	timer_shutdown_sync(&ndev->cmd_timer);
+	timer_shutdown_sync(&ndev->data_timer);
+
+	/* rx_work queues cmd_work and tx_work, so drain rx_wq first */
 	destroy_workqueue(ndev->rx_wq);
+	destroy_workqueue(ndev->cmd_wq);
 	destroy_workqueue(ndev->tx_wq);
 
 	list_for_each_entry_safe(conn_info, n, &ndev->conn_info_list, list) {
-- 
2.55.0.windows.5

