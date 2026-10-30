Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358660;
	b=Pz9daNq4B+CB0Sz+48kOuO+13AvoWSd8oKh387t+9Z8y9mRwQOJtJT52S799gtAGfQIB
	 MTc2FU2XiLeheHJ2BALQ0al7gFPSJjI9fwWGo72mK5omR9A9LpvkKcznsN35xC9lFZ1r8
	 yQZ3iSawURdA3pYrJVydj6+p5SPBxgQ1ooDLPhQwQiS7gXGTi9sJr3BqaJBrt9tUSEGmo
	 4oc7ZhkLW14eRIzBoyoqEu0snqEemHiDbn9C+0QkNKWARS0xtf/OA2A7veUToJopWGMuY
	 mU8Rq1Q8xFFDPRv+m0d5G6x6xYeIowQ//2OYI5NeuKSgJwnFKwWiGeJqixSuL5zxdBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=46Vjwa9uE7FzNJRa2W9YmO/vasAer+dAOb58elbr7/s=;
	b=MH6WBpfKRZRAXsTiUXfeeonK+XbtV956c5ZU2dmkJJBEeIAdnT/CfaN0HnVI7YJ5BFOt
	 c7iklRl6CpYElfiBeG/hpVrihpFvNcUqnTgksOJMryeHkAb6uFjsr6Vlb2oNmgdgFZtvZ
	 qlmZ6yqKDGs4V+2dLjAzCJfIladMAfXS1R3Ldd3mSsXROMM0v2xa1SKHKKvP3Bz8k4wdw
	 /qzWZbScSK2q8Xny2mPpoQI46ZzBXDFJMux/NEBl0mjLf9Jp3FG1f00MldLdM/ytCjslp
	 VyIRzOLb/QOu8m8wymqq0629+yA70ILpmbWiIN15CzykOjJe1YujrgeWM5/8lUKldwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H8jRw1BA;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CC8606A31E
	for <oe-linux-nfc@lists.linux.dev>; Fri, 30 Oct 2026 11:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42CC8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H8jRw1BA
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-990703f817fso315035241.1
        for <oe-linux-nfc@lists.linux.dev>; Fri, 30 Oct 2026 04:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793358659; x=1793963459; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=46Vjwa9uE7FzNJRa2W9YmO/vasAer+dAOb58elbr7/s=;
        b=H8jRw1BAN4CATVRnyQb18N8IUpE7tG7Dcj38CCeU5S831FBaUDNg/PCJGL9GF5ENn6
         06O1bfrDpPvQ0FW2lnPUQroJcN0Tk9fXssUc+nFysZZaG3S/5LOWTM3evRy/ClENi49J
         G9Me8hlLV9/8R9vgeJmbDtAFPnKNv+coXvOKXVafZBrvYeEnjX8FQKB2P8G3iZmHcwIb
         CO2DeQyfvT9GTLTMZNDhJQTifgd4Hi//dLLtaQ0i8HzY7GuR99CeAQdBKoF7OWzpqfFf
         5N3O44NtZOuzAjdLOWnj7T7NdzWU6V0L5SOVvLiuBE2HCvaYwbnXJnIue4+gQEcw2fb9
         X3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358659; x=1793963459;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46Vjwa9uE7FzNJRa2W9YmO/vasAer+dAOb58elbr7/s=;
        b=lZFKlGBcOeAmNlFLHSxnKy9GBEDEoqk4yxMqszAP67fSnM0Xe/Lu4zqukdL9qcyCQB
         4wR4MSzhGFFkPMf4ekXViNi1SFElMJ5A4ZKnZRQoGL1tixHPXiUNDBPimdeHxfzBz7lq
         GjNhuxKVBP1ySb5lO9fc1A7jcziS/iAE9F1ga+KurqFrDWkLjMT2mSKl8c6Mdwixlh0F
         sdDNgRXFsm+TT5jUv4AQ9Czw2TR63T/7Ly8AsqvvfGbk8OdOrqI2WPn+y4/31N+J+dSs
         gvlAahGPPNabbwATxizpQcEY6a5d3JAKrsP3r/7hk7y5o3CAMBvrLkCju0MI5nvOp+7c
         Z+JQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1ZsvQs/6rte08zQNUwebRqYvkUoMh8ockwF8SdzJNQCwJ6RU2hwWdY4zVtAief1oueM03mPe9Ri5OTl4=@lists.linux.dev
X-Gm-Message-State: AFq9FYI6utojj4WRw1rXdrG3hkYVllsyVYK/xJVwuYrO6MaO8mR5z5a5
	xsOe2oCNB7RP2qkvXELokFS0vlmrFMaemtgKZwq1/7DRlvLnNEpfbFIK
X-Gm-Gg: AYBFou0kAfW5uk8Aea0o+gsWnPuA5iha6DPRo9+8kOHK8pVPRzAXjqaP1voSIBBSin4
	AIUDR9U+UqqrsNFlpcItsFR11SZ7QVaK/xqraP7URBCl0Ihuf7yUsFemugamv1JH37pG2plquXL
	xrHIqBexE2prCq3SGX6kMNy0JWDjVytQtTJ/rLwTxHmmgTHb8X7yScPGvbz0PgpKUEdT54KVvV1
	FfAjTOiF55zPN9W6JTKDh/6ObGFpMUgs8TLiXSjvoBdDu+vUZ0DBvJCZhUlqoWYSNzE1vh5OsZ8
	YwyA2NaYSqEz3mtAphrJFSuySOOMjre/+0EANZHB7rLKczJg20rA85NbOlgPh8hDh7Dj4pgZtXJ
	wtcrnt8Kjiek8IqjWbQmfLQ4SbbK1urZAncYoLWf2VYaJdzDutnWbarBcweBM5UbVs2QG0aYR4H
	Xk8cxKzanRureNyG5HvxkICXXSvinl/B892f0SXDpDvpTH3+yjXbXwrjo2Li9uglKojsCcmg3d2
	N4oGvTu4wgZjgA66jwbUjh61hhKYAixH1AwLn9AKS5cqBLFVAMvxwuC4d14oEELG7RnkQZprii5
	IOhf8n9AkC+wcw4rXCNLcavEok2f+09JMLbgQO4hQlapH0mMNujmKHzFuviRK2q4I36SicY11XX
	IcgY94y3LjtGejt+LiZ9KzfJ2xj3OixpZlbGlwpKn
X-Received: by 2002:a05:6102:604b:b0:7cc:25bc:3b27 with SMTP id ada2fe7eead31-7d07226d973mr786120137.5.1793358658951;
        Fri, 30 Oct 2026 04:10:58 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([191.34.116.20])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1b4sm1841044137.4.2026.10.30.04.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:10:58 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 1/3] nfc: hci: free the skb sent through LLC nop
Date: Fri, 30 Oct 2026 08:10:42 -0300
Message-ID: <179335864272.64596.14178706469641120758@gmail.com>
In-Reply-To: <179335864271.64596.805818095553030218@gmail.com>
References: <179335864271.64596.805818095553030218@gmail.com>
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

nfc_hci_msg_tx_work() hands each frame to nfc_llc_xmit_from_hci() and
only frees it if that fails: on success the LLC engine owns it.  SHDLC
queues the frame and frees it once it is acked, but LLC nop passes it
straight to the driver's xmit, and the phy write operations of its
users (the MEI phy of pn544 and microread) copy the data out and leave
the skb alone, so every frame sent to the controller is leaked.

This was found by LLM-assisted code review and confirmed with a
test-only module that registers st21nfca with LLC nop on a virtual phy
and a userspace controller emulator: 20 device up/down cycles leaked
598 skbuff_head_cache objects, and none with this patch.

Free the frame in llc_nop_xmit_from_hci() once the driver has sent it.

Fixes: 8af00d48dc92 ("NFC: Add a nop (passthrough) llc module to llc core")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 net/nfc/hci/llc_nop.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/net/nfc/hci/llc_nop.c b/net/nfc/hci/llc_nop.c
index f9c826a13..1603e435b 100644
--- a/net/nfc/hci/llc_nop.c
+++ b/net/nfc/hci/llc_nop.c
@@ -67,8 +67,17 @@ static void llc_nop_rcv_from_drv(struct nfc_llc *llc, struct sk_buff *skb)
 static int llc_nop_xmit_from_hci(struct nfc_llc *llc, struct sk_buff *skb)
 {
 	struct llc_nop *llc_nop = nfc_llc_get_data(llc);
+	int r;
 
-	return llc_nop->xmit_to_drv(llc_nop->hdev, skb);
+	/* The driver does not take ownership of the frame (the phy write
+	 * operations copy it out), and nfc_hci_msg_tx_work() only frees it
+	 * on error, so it is ours to free once it has been sent.
+	 */
+	r = llc_nop->xmit_to_drv(llc_nop->hdev, skb);
+	if (r == 0)
+		consume_skb(skb);
+
+	return r;
 }
 
 static const struct nfc_llc_ops llc_nop_ops = {
-- 
2.43.0

