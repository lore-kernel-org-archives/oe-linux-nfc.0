Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958789;
	b=ewO9KIEzEhXPcZV+yQqHTZhP8K3PhjItV0Wz3rJErb7aC2h90oQrGbTdpAqn5r0FU9he
	 IbstWyX5pp2dlD4+VCvnFhaP8zPklPriBYfHPln5e47QL4a8R6Y8R6lyXkpFCQ2A0XCmt
	 riqCZqQV6zS5YXRv+tok5YmHQixoP2pj4YgOAqr2lJfHVxofYj9DSHWcOZWo9FJu+W/YI
	 aLYQBHu9Cz8vq0E2Q7deB1ebTUF2NW0KEhCO1wq8TYtz9Anjgu7L8GrSR7fB5BXw+f3WT
	 8r5ilki1gYxxiz/bQqghENxKQbU1/9gA5cGNRQrjEd7J/DMJ3KE9bFKultedZ9JmoKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KWd33QHj1KyW14bW4rGiw3FQ3MhReLvouK1usu+yNIs=;
	b=ng8o+X7DeipB/rHbaSN82nYgLLy2JvThJOB0hVhwQO+pvgfSNAxwjrZkLkQIW0r0TEY7
	 Sp/kA1XTU0Yd4CCtOBPaXB17zm3UTquXe6YzwW1V+0mQB1oWb0VWkh9HgHstTMVkaTUqM
	 Jj/DSK6orBWE8JYx6P6sDxtGvPrQ3XTt2+pmeJXlRS1mojNgf4yA2NKhYSwzsDclcMrv+
	 Yx2fcddL206A2CDLaWlTAOM9StRLrs6WFkYxw3rNsQONH3jRNp/h027pgkI3gbOv9oPTc
	 nXBhRjfaAVakEWvkJnGtlde3+qWuXeKV7ju2R36JLsX/So+NRNW5yiLRuJggXdtCpng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHoa2EEX;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD240606A326
	for <oe-linux-nfc@lists.linux.dev>; Fri,  6 Nov 2026 09:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD240606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHoa2EEX
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-886e61fa30fso147801b3a.1
        for <oe-linux-nfc@lists.linux.dev>; Fri, 06 Nov 2026 01:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958788; x=1794563588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KWd33QHj1KyW14bW4rGiw3FQ3MhReLvouK1usu+yNIs=;
        b=pHoa2EEXM7p6EkBCUw1Jq+OBQOy9s8Jpj8RPVflE8lC7+hC5kDiIyD2rW8MIBShB2I
         VEVWauLyVRh5x/qiNneFKBcuql0qjfOxPLd0JLb5lwJQ/um/mZ5K19r0Xu76brF7mlNn
         681FarVQL4oY/oc5PMtqfaBvIjF6zEaifGWAZi1PSLHsfH3ZuMEg5CfT2t5HeF6wFdLu
         m8+85H6HM+td5GVyZashPtGth9iP9yg/cNCBwgMlc7UxnrBXBsu2DObvZ2ii31g98Rj1
         k1csqH2N3cOixFtyeCmwORWjDl//YULiTz1wBhEqVEuev4772tR+f+YXIJ+G3WX0dknC
         5EbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958788; x=1794563588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWd33QHj1KyW14bW4rGiw3FQ3MhReLvouK1usu+yNIs=;
        b=QQtPfebBXwk4mEMjzGSOJzRgSPjD04ho2IYMdTashkPi5K7Z+Hcz8p7LMhddDRy1Gc
         U0tkEPFRZrQFPJ40BWNIOLRUnWTIbX7sbX+wKPgS0DX06icG5P/s9/YyE3B/4tK1Djy0
         QaI2nM5ReA1OjKU74klD85knrUald0mjFM8ESifRyJRAoD5K7Jzus4TjhnYX0uFemdPa
         NvwJoYr1FccyEdwS+fUdUaJt47h/2HhE/TJfcaFvpKPVe7k0IVqDl6TakHTHTCcg9VJS
         lL/9d0D3FgPPN7gnWd/NFjiwdV88SPwONf2cDMvpWubhobm2/m5NcX7gJvTbaH8x4DiC
         uOYw==
X-Gm-Message-State: APuU4Z/Zltm5K70BbiveiDpvtAjP3etFZUjmtBEMAIEMP+TlSlkb2Rbz
	gXsa6tCnQIHMDSNBwpZxy1dZornN8b/0LKpAxY+nkwtfH0VUwvG4CEq1
X-Gm-Gg: AYBFou3JEGgKaILQkoSVFI4JUc/BP6eUl/SOEz3Wgw4BTsLUWrpmxGZdQcQReMuz8pj
	qs7PdeuIoZGD659+nsCJJUFiDqf3tyWEG+6Kiz6fgYZGJJvH8cim6NwMyKQQXRC+lB1N4N2kfOU
	vcG6LGgkvg6RIhGQPsam/na6cYgcfvjl6q2LsV9JwQkieleNUFLarrZEkJyY+kQ3ufk5BTFBPDV
	OeHusa2Hqeo/Pn8Me32hZk9ZsteKMSHfqIMOeGk2Sn60igc6PQEBScnaRzRh2/PV1zs+XIYlCQf
	u+D46DkCtVC47P/imKN3yDJjkzX1p6NEdTpWsHreLgX6qQ0QViF7KCA7MNE9kc75IOPjdDUZ/3j
	fmpLWnEgdEeYJyBlsi6PLbCzg5tdIHBDWvp+1hCVHWFoPqDQw72TRY1mseCUx0Sqj9Xjq2L/4KL
	Sil+a6iSwfs/+sZfkdN9r+zMfLlC1XiRXdm30iN+9GkFolPZoB7REyyj1IBz3sbum2fkTohNbMM
	bBc1Xn07AmOO+pBAXCqAyFU8yBMkjudGZNBx7e3BVG2Bvsl2Ejw6tyoxe1lcdN6xC54dUwsLiG9
	puA4pDDvH+VddhldfPm2ngMyms9Y1Tqt2VjwZ+nowbK5gxfu
X-Received: by 2002:a05:6a00:f95:b0:878:34d7:69b2 with SMTP id d2e1a72fcca58-8b37cc0a6bamr1752697b3a.57.1793958788061;
        Fri, 06 Nov 2026 01:53:08 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b35aa98162sm468581b3a.56.2026.11.06.01.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:53:07 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] nfc: port100: drain cmd_complete_work before freeing the device on disconnect
Date: Fri,  6 Nov 2026 18:52:57 +0900
Message-ID: <20261106095257.2407520-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

port100_disconnect() tears the device down in an order that lets
cmd_complete_work run against freed memory:

	nfc_digital_unregister_device(dev->nfc_digital_dev);
	nfc_digital_free_device(dev->nfc_digital_dev);   /* ddev freed */

	usb_kill_urb(dev->in_urb);                       /* -> schedule_work() */
	usb_kill_urb(dev->out_urb);

	usb_free_urb(dev->in_urb);
	usb_free_urb(dev->out_urb);

	kfree(dev->cmd);                                 /* cmd freed */

nfc_digital_unregister_device() does not abort a transport command that
is already in flight, so an IN URB can still be pending here. The URB
completion handlers port100_recv_response() / port100_recv_ack() schedule
cmd_complete_work whenever the IN URB completes with an error status,
including the -ECONNRESET that usb_kill_urb(dev->in_urb) produces
synchronously for the in-flight command. The work handler
port100_wq_cmd_complete() then runs port100_send_async_complete():

	static void port100_send_async_complete(struct port100 *dev)
	{
		struct port100_cmd *cmd = dev->cmd;
		int status = cmd->status;		/* UAF read   */
		...
		cmd->complete_cb(dev->nfc_digital_dev, ...);	/* freed ddev */
		...
		kfree(cmd);				/* double free */
	}

Nothing drains the work, so a command in flight at disconnect leaves
cmd_complete_work queued (or running) and it dereferences dev->cmd (freed
by kfree(dev->cmd)), dev->nfc_digital_dev (freed by
nfc_digital_free_device()) and ultimately dev itself (devres-freed after
disconnect returns) -> a use-after-free plus double-free.

Kill the URBs and cancel_work_sync() the work *before*
nfc_digital_free_device(), so the completion that usb_kill_urb() forces
cannot re-queue the work and the handler cannot run (or is waited out)
while dev->nfc_digital_dev and dev are still valid. Placing the drain
after nfc_digital_free_device() would be insufficient: on SMP/PREEMPT a
worker that already started executing would be waited on by
cancel_work_sync() while dereferencing the already-freed ddev.

Found by code review and reproduced on 7.3-rc3 with KASAN and
DEBUG_OBJECTS, using dummy_hcd + raw_gadget to emulate the device and
race an in-flight command against USB disconnect: debugobjects reports a
free-active work_struct for port100_wq_cmd_complete, freed from
devres_release_all() via kfree() while still queued.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/nfc/port100.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -1619,13 +1619,15 @@ static void port100_disconnect(struct usb_interface *interface)
 	dev = usb_get_intfdata(interface);
 	usb_set_intfdata(interface, NULL);

 	nfc_digital_unregister_device(dev->nfc_digital_dev);
-	nfc_digital_free_device(dev->nfc_digital_dev);

 	usb_kill_urb(dev->in_urb);
 	usb_kill_urb(dev->out_urb);
+	cancel_work_sync(&dev->cmd_complete_work);
+
+	nfc_digital_free_device(dev->nfc_digital_dev);

 	usb_free_urb(dev->in_urb);
 	usb_free_urb(dev->out_urb);

 	kfree(dev->cmd);
