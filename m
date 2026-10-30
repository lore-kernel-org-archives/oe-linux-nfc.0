Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793328010;
	b=Fzgwgx0XWmx8r5aN0yE4FJ1PHgEt3Nzfs1I/uTSE8HACYS8PMIp0/ehFHVVvDySIzucj
	 5ArcaB2rG0juQ0JwsYgbohxejknPkqXvUCxXw9vX/3Mxfv3TBqgp7SmEGY/SbBB6j5Ouf
	 IHXeJ+bj72SQaEoh/JclT+PaNHuVMifii1+4tDuPyZEXp/SncUmZuaMfs6xTeLsVnvzUD
	 8EDzInNjIjXMUX9eo/uZfFU3/Xqcg0cYeJIUVBnICYXo3rcR7mfa37JF1scDh4kcW35zI
	 a+enLyb8vzjf6cGbXjv8zf8VUyFYC9Ly+sj9QNRNfae6lBuixiEU0uS6mYn31pPbz9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793328010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=YSAh+y1tZ3U19Rc97yZ2/Ifnxo6JWkQYI8MOkedjj2I=;
	b=gybiCPG5KuGW1H822RxiRDcszvEyMVLALtO2not5oVnuxFkg5Og3/evFms1lc+HrEuGs
	 o+LQfPOkdb04xThlTLVNz+N7Cbl+yqMq/X+HnyyC3fAhxxKayGQzDg4zJNSqC8xdjJjGI
	 1qhkMqbks2BvUvX9jL6Nc813aW80FnJUrtoIME7oHB2zOZplBnYJxc9AVzkvNQ80kTb5t
	 kpwcCEHtYY8rfc9vZn33sRpj4nQSNJJYDDSvmqzSWgMevRxEzX5t2de6gfbiXHQPNeYKO
	 KA2+FfBU4SVaYBUTe3m4wks+FZ8cNQDDrp/+4IPcdBS6FnEVoKIKU/0JHg8BoLXr8Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yNaRXnyV;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C033606A31C
	for <oe-linux-nfc@lists.linux.dev>; Fri, 30 Oct 2026 02:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C033606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yNaRXnyV
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eadf48fb2dso110155e0c.1
        for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 19:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793328009; x=1793932809; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YSAh+y1tZ3U19Rc97yZ2/Ifnxo6JWkQYI8MOkedjj2I=;
        b=yNaRXnyVKhvX5AupnjrKHVDwM+hYctS7LEg4E5W2ifzBcrMV3HF/DHboiJoi2VNVCm
         6z/iYpjH1u7YMTJcbagsyzaCuwAh43Q1wLGMUBmj5iUbdNgQZJgWKCNnxtvJ50qrTce/
         L4Q4jaxGOenm6gvFxn+ajYmAq6nEbd6qie1lxx0ggtx0KsBZ54ifVGSRZVj4khClBm7v
         N/8pfffszjE803qH7EYCLUQGGtaGs7ca5QuakYpz/IdiYwBATGwbkSLu5CrEEOixTkk+
         06RTXGhpBUoZeLvDhyj9nBpWyxcXdnjEjrpCnzRocVsfl9yxtz+KPTvAP7ymIkEgyz7f
         Re1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793328009; x=1793932809;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YSAh+y1tZ3U19Rc97yZ2/Ifnxo6JWkQYI8MOkedjj2I=;
        b=OX1UHMSq8ETr6VQh49czxQ8eAagUdNwA3zztKvBi2z/zgTn/jP0gH673RyObGPNgF0
         tw+ViU/JHloZ/SiT30xvFwzWSw2ln07JMvN9wvceTejtusiUuCZJSzU2yf/XPr7WcIp5
         PXy497yqOhZ6N8RfqxvKjp61AVItjau0e/NWpZwadxdrm0LFSCO+mTKtAFRjHXkSedYp
         a+Z+ANfY0tIDGQVTdmq9TK9rYY6tYEpbgjRWJuxN6qftCCFLZXD/m9EJVI6DmitmkNsR
         pzIYNu5RmOvN2/zR3PYoMJHNLn0Fcd9waCuWOobyUo/UloEexgBPdC/YrhDUvPFJbCgW
         4MvA==
X-Forwarded-Encrypted: i=1; AKwUvBzONWlZPZl0xfgHOHpTH+z01R2S25MsUhQ/xT2kyhQStunILXxBlgnToEaGK3pUcdJw3eVh7xwe2uWHjPM=@lists.linux.dev
X-Gm-Message-State: AFq9FYLwGoKgzCxVGBzb9RZLUyXmLuEitR80s4iK5Vw3fqKZlz2s2lVc
	GZ/CFlwXSXQPLZTS1g34SyrJdNISUC14sjMLURGh8ePflKuYz5qwf3YG
X-Gm-Gg: AYBFou1l1XGD/Fo228XORvbrSznBY8SCk8tcfz3ZpgLg3pvC8OdD68nlZDr9Nasshvp
	08ZdA8NMecrEf7JLd0bPc//wmRpt9fHp5LZ08EJKqgWElHAlDajIMX5ZuPkDiDUlL3FyK2q8Anl
	22CzD3jJaATUv6oGlgKz6bKK4Ip9srNtKwaxDdxS68/rePTJbrnANBuTObVzD55KnfPkkoftVRG
	cY9KKxJnTn0ZkCEyy0F4LSADRaVfHy5W8CEMxp3tHVIBj6Zw7PuTck0CcZYuzI3Vo4KkPb3MMVt
	9ygKYFv6hnt7cIwK/A7R8zihOl2LvQ9r8QpuZ8cu89wFHWyq2HjjF2uS44/V8NPCi79bnZylRw8
	65cKLSg3UyBtWh5+NQ4JLxLCpZYFDArY3lDV9ywCsATfnfNqeZXa6lLN2NeIlJJCaF/abSLY27y
	MfB+RCzY0pzjVO4pNGQMu7fyCO5mf2AfD2wWti0MIFMzji82Dy4bpMvwJ6AwEZty4xEkVoGy/j7
	KldcSv/y6gGkgbLRVqEhkRIxpLCgn5LMbwUK1LzGnsgyLIqYJJQW91fvikElIfbzqKCsuNDJNhK
	vd5/X33hLExS3slfaDXR2w5WQhgqZDBduLpYb6HRDEzHUY4sZfmFzkOzlNhdiPegA03YZfu/6zu
	ErL7v2D8tSoKV9NWSLVX6VqkiQR3X
X-Received: by 2002:a05:6122:1b0c:b0:5c9:a60b:e5c8 with SMTP id 71dfb90a1353d-5ec6893b14cmr559247e0c.11.1793328009288;
        Thu, 29 Oct 2026 19:40:09 -0700 (PDT)
Received: from macbook-pro-de-joas.local ([2804:7f0:b101:c5e8:ccdf:2b09:f69e:4902])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69c5d183sm963735e0c.13.2026.10.29.19.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 19:40:08 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>,
 oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 [PATCH net] nfc: st21nfca: complete a pending SE APDU request only once
Date: Thu, 29 Oct 2026 23:40:02 -0300
Message-ID: <179332800288.52644.8728400883396719965@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

st21nfca_hci_se_io() stores the netlink callback and its context in
info->se_info and arms the BWI timer.  The request is then completed
either by st21nfca_se_wt_work(), when the timer expires, or by an
EVT_TRANSMIT_DATA event on the APDU reader gate.  Neither checks that a
request is still pending, and the callback, se_io_cb(), frees its
context every time it is called.

So when the secure element answers after the timeout, the response
calls se_io_cb() again on the context the timeout already freed, and
frees it a second time.  The same happens if the controller sends two
EVT_TRANSMIT_DATA events for one request.  An EVT_TRANSMIT_DATA, or a
timer armed by EVT_WTX_REQUEST, with no request pending calls the
callback on the context of an earlier, already completed request, or
calls a NULL callback if there never was one.

With st21nfca on a virtual phy and an emulated controller answering an
NFC_CMD_SE_IO request 4 s after it was sent (the default timeout is
3.2 s):

  BUG: KASAN: slab-use-after-free in se_io_cb+0x2ec/0x334
  Read of size 4 at addr fff00000c5277da0 by task kworker/3:1/59
  Workqueue: events nfc_hci_msg_rx_work
  Call trace:
   se_io_cb+0x2ec/0x334
   st21nfca_apdu_reader_event_received+0x1ec/0x248
   st21nfca_hci_event_received+0xb0/0x300
   nfc_hci_event_received+0xb8/0x30c
   ...
  Freed by task 59:
   kfree+0x214/0x498
   se_io_cb+0x2bc/0x334
   st21nfca_se_wt_work+0x14c/0x1d4

and for an EVT_TRANSMIT_DATA without a request:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  pc : 0x0
  lr : st21nfca_apdu_reader_event_received+0x1ec/0x248

Use bwi_active, which st21nfca_hci_se_io() sets, to tell whether a
request is pending, and clear it in whichever of the two paths
completes the request first.  The event handler already stops the timer
and waits for the timeout work before looking at it.  Also complete the
request with the error if sending EVT_SE_END_OF_APDU_TRANSFER fails
rather than never calling the callback, which leaked the context.

Fixes: 2130fb97fecf ("NFC: st21nfca: Adding support for secure element")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
Tested on arm64 QEMU with KASAN, with a test-only module that registers
st21nfca through st21nfca_hci_probe() on a virtual phy (LLC nop) and a
userspace controller emulator (DEV_UP, ENABLE_SE, SE_IO over netlink).
Without the patch: slab-use-after-free in se_io_cb() for a late and for
a duplicated EVT_TRANSMIT_DATA, NULL pointer call for an unsolicited one.
With it all three are quiet and a normal SE_IO exchange still works.
Not tested on hardware.

st-nci has the same pattern; Fan Wu's pending "nfc: st-nci: drain SE
timers before NCI teardown" v2 already makes bwi_active an ownership
token there, so this only touches st21nfca.

 drivers/nfc/st21nfca/se.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/st21nfca/se.c b/drivers/nfc/st21nfca/se.c
index 7154bc1d6..4261ed1d9 100644
--- a/drivers/nfc/st21nfca/se.c
+++ b/drivers/nfc/st21nfca/se.c
@@ -264,6 +264,12 @@ static void st21nfca_se_wt_work(struct work_struct *work)
 						struct st21nfca_hci_info,
 						se_info.timeout_work);
 
+	/* The timer can also be armed by EVT_WTX_REQUEST while no
+	 * st21nfca_hci_se_io() is pending.
+	 */
+	if (!info->se_info.bwi_active)
+		return;
+
 	info->se_info.bwi_active = false;
 
 	if (!info->se_info.xch_error) {
@@ -383,11 +389,20 @@ int st21nfca_apdu_reader_event_received(struct nfc_hci_dev *hdev,
 	case ST21NFCA_EVT_TRANSMIT_DATA:
 		timer_delete_sync(&info->se_info.bwi_timer);
 		cancel_work_sync(&info->se_info.timeout_work);
+		/* Only complete a pending st21nfca_hci_se_io(), and only once:
+		 * the timeout work may already have completed it, and the
+		 * callback frees its context.
+		 */
+		if (!info->se_info.bwi_active)
+			break;
+
 		info->se_info.bwi_active = false;
 		r = nfc_hci_send_event(hdev, ST21NFCA_DEVICE_MGNT_GATE,
 				ST21NFCA_EVT_SE_END_OF_APDU_TRANSFER, NULL, 0);
-		if (r < 0)
+		if (r < 0) {
+			info->se_info.cb(info->se_info.cb_context, NULL, 0, r);
 			goto exit;
+		}
 
 		info->se_info.cb(info->se_info.cb_context,
 			skb->data, skb->len, 0);
-- 
2.43.0

