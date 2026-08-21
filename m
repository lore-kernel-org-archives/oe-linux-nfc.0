Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002C82931D3
	for <oe-linux-nfc@lists.linux.dev>; Fri, 21 Aug 2026 14:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321642; cv=none; b=tNhyhjwvd22uv+U172GRVsPgXYNzlvj2HTacavL3ZcDrdENzK9L3SilClR1btV+IOtrD01A/3hwdNuQchWp2cdOOxnXNVtAsOCJcOCl6JtBGaTiN/bPA2wMkOLMDJmn0J4ieDiSK9uiLQCbZMwheAUlOT0G7weX53iK1nU1lDD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321642; c=relaxed/simple;
	bh=hvl49ZGK6HsSSAwstg1wJcjqRJab1dshAkK50S5lixY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=thsSag84GNTpdFuYBg1nqQ2yPd/PR8255k8hFsEyKIz5+7qznchq/PWZF6+mLM1XLtfQk7TSZ1BKVxducrjzfc0QRihBxnG0JtZb/LmRYnuH6H5mevCpSPkgXVsmaaxkvoOzQNM4s+kPIYcIukaxzMj1chs9MieA+H0exDXzawA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edumazet.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e0OFJihL; arc=none smtp.client-ip=209.85.160.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edumazet.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e0OFJihL"
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52dd69b00cfso11851321cf.3
        for <oe-linux-nfc@lists.linux.dev>; Fri, 21 Aug 2026 07:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787321640; x=1787926440; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kj5oXf6SHvBaxi3VxJxxuzo7/3pqWkr7u+zCwQJJkPo=;
        b=e0OFJihLolYuJFaTj87T+4IK8DtcQkklcRy+Dr3kygwWUkJdzkYSwn9gqJbnDllmp/
         IK/qffobjDzQI/3mOwuPRGqy8UQgSb4aSncfwTY6Pl9EB7n6E93Uib6E624U6WtoUFTj
         XVu7KDI1wcxMwRdiYA/505zrbzxUlGSbeeZIPXoOpLZxLAEXTpWlk+/yUV1LYdgvg/TX
         bhjClL6cooE0Ib8kBa6Ps4vYUkMxp01uSXoveeiqYg4ZP2xtWOuymAIUPzPQSAh+eBNA
         +7CEwJboWjLP+qjS8a3UlobG7cPHRVwNzvRJ0XMSgM7omD+7XqIqKvjKXnmuFuqh4Rnn
         adNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321640; x=1787926440;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kj5oXf6SHvBaxi3VxJxxuzo7/3pqWkr7u+zCwQJJkPo=;
        b=TlEcG/fbP5xcw+aZf2/28d614DJpg6ztpHXmaW4fCSr0h5nMu8qXYsmFDHyUtNpJlW
         byRS1faj5jjFjUV9lJt7hfY+xpH/JdvJ9Adq7y7zA18f73c6drPyg2w75qxjUWFy0C+p
         nhC7aa++QabD93ONoVX9Kpds04YSh04q9GsDJ9MEnhNpFtmsxH6bu5EhP20rpAsohEUO
         YlvBAxruGIFFeDl4nmpvJ8nxruC9tKKdKwsf8kpB0fd8tMArgHTQX+wRy4pV52fbyVMq
         gYCVtpgazLohMlrpMOCyvbHUB+QmumDaYHlci7tp2PGUxhVupxKxqXW/Ui488yILTbYK
         DoEg==
X-Forwarded-Encrypted: i=1; AHgh+RohoDYE+8Iy1i12m8eAynwU2d7Wisp0D6RKzhG3rWPaeyaLlkJK+zOsBqq1oVRD4tmME+mliuYRuf6lAw4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXptIUHb9HLlEjnxiybQ6j+yBdWm9Ta9NCRogRFVyiW1Q7trdH
	ECVUo2GolC+wdw8EQhxpjDYRUWn22O0nF0STLyD1SadYuLONIKDqFKJtGXP2q4YjzSXRmjhajZ2
	ml7yNYRBRrfeLwA==
X-Received: from qtxo14.prod.google.com ([2002:a05:622a:44e:b0:520:1230:fda2])
 (user=edumazet job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:6f0c:0:b0:52b:71dd:c92c with SMTP id d75a77b69052e-52df56f9736mr62570081cf.2.1787321639567;
 Fri, 21 Aug 2026 07:13:59 -0700 (PDT)
Date: Fri, 21 Aug 2026 14:13:58 +0000
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.766.g2966f0265a-goog
Message-ID: <20260821141358.3546366-1-edumazet@google.com>
Subject: [PATCH net] nfc: llcp: fix UAF on socket in nfc_llcp_tx_work()
From: Eric Dumazet <edumazet@google.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, eric.dumazet@gmail.com, 
	Eric Dumazet <edumazet@google.com>, Shuangpeng Bai <shuangpeng.kernel@gmail.com>, 
	David Heidelberg <david@ixit.cz>, oe-linux-nfc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Shuangpeng Bai reported a slab-use-after-free in nfc_llcp_tx_work():

  BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave
  Write of size 4 at addr ffff88811da9cb94 by task kworker/0:0/9
  Call Trace:
   _raw_spin_lock_irqsave (kernel/locking/spinlock.c:166)
   skb_queue_tail (net/core/skbuff.c:4114)
   nfc_llcp_tx_work (net/nfc/llcp_core.c:848)

When transmitting an I-frame, nfc_llcp_tx_work() creates a copy via
skb_copy() to keep in tx_pending_queue. If the socket is closed
concurrently, freeing the original skb during nfc_data_exchange()
drops sk_wmem_alloc to 0 and destroys the socket before copy_skb is
queued to llcp_sock->tx_pending_queue.

Call skb_set_owner_w(copy_skb, sk) to keep the socket alive while
copy_skb is queued.

Fixes: be02b6b62400 ("NFC: Queue a copy of the transmitted LLCP skb")
Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Closes: https://lore.kernel.org/netdev/20260819050031.2725592-1-shuangpeng.kernel@gmail.com/
Signed-off-by: Eric Dumazet <edumazet@google.com>
---
Cc: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev
---
 net/nfc/llcp_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index cac1b5487064d0c5b4966bb6a75aa26e67131049..49cb632268c0c2841e3b44dde124c7966267b709 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -786,8 +786,11 @@ static void nfc_llcp_tx_work(struct work_struct *work)
 			print_hex_dump_debug("LLCP Tx: ", DUMP_PREFIX_OFFSET,
 					     16, 1, skb->data, skb->len, true);
 
-			if (ptype == LLCP_PDU_I)
+			if (ptype == LLCP_PDU_I) {
 				copy_skb = skb_copy(skb, GFP_ATOMIC);
+				if (copy_skb)
+					skb_set_owner_w(copy_skb, sk);
+			}
 
 			__net_timestamp(skb);
 
-- 
2.55.0.766.g2966f0265a-goog

