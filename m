Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401329;
	b=eS9sW2XiHa97ZOtDIVV+Plu6KrCUMaIkicwxrFkTPdMKZZ2k2pmBBMGuB2kz7ZEHGTSy
	 SctFsdvdQ8fuI2WWQLVZM4kK2eNjkSEvaDl4B5cr9+h7vyNRa9KvdXYPVZXKSFDf2ztUM
	 UJxVpwPaxFis8jYW94GQ3Vt8i7yvYCNWyR+RUL2VvemaK5Ww/JSSSJzViYDGCMqaaAFd4
	 Yu8Ee7bXXs0XvEYJpNzFv2lMtlr0GT9iVLe22etL51NMVIcl+iM8h5Xx3J1E2ODEzT1bl
	 W6Z8yjjG+B2+/CNgYj6tZYMIMttrIY+P5NCVcn8YftRUnP07YZslyN588S/9/itNTuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+EPn2+dOiCjCMUGOzXUCg9W8kUFJdJYMWemu9cFlc1Q=;
	b=PDoQXqWg4H4DXgXS8kwb4DnlCWH1shi9rtm4ZyUoQO8qExyY6uSNk7aMJL6jh/2/xklj
	 qnamgaAuuAvRqqBbtbpetdAqhJOhMZ7nAxczZXupBtYRpnKFw233n77Ual/kEXINIbguM
	 AuLMFytepw7mRcVwA0WFP983Xb8hfcolgwjjY7M9P4NF6U1UElzX0wYQJuyKwwaVV4kle
	 IQI2DEoqra3FNDLzkHHOSx6CDZvwfVYAYubNzcio9m8xL9iOtgdOvRk115xM8qVc3PKb4
	 F3H/8P6fBKqBuzG/cq8lQby2WH972fuz2U6FASTZdWGwUhJMZsHiFNWE18OWBs8coUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=FUn7QrHv;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25249606A320
	for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Nov 2026 02:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25249606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=FUn7QrHv
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9ae391a05so18133185ad.1
        for <oe-linux-nfc@lists.linux.dev>; Sun, 22 Nov 2026 18:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795401325; x=1796006125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+EPn2+dOiCjCMUGOzXUCg9W8kUFJdJYMWemu9cFlc1Q=;
        b=FUn7QrHvJA2kXr9r0HdpK2fnbj15/dk8pB2qjVt+MR4RUgetFK3PyrUXxwjLWi3qaN
         GKsYfJ4JR+82Rc8BRlYmMuB6dBeZrm/6ygjsmc+nHsmyXY8f+qK9/eKJpNP/c2RWuV5F
         6VbInfy2sBu5AEgOnHWzw2mFniefseIvGEy4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401325; x=1796006125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+EPn2+dOiCjCMUGOzXUCg9W8kUFJdJYMWemu9cFlc1Q=;
        b=anenL8baX9ugAhMEw/XK3/U3X6b1Xb0MDza8wY/6xDPTjK060bD19rb41MPM0OcM5A
         e9+Wvi2WwKH8hhd+2UpKgiGfRP3iJv7Uxm7Rm8NRzXqVFe5irOfCVF1fFhFItIcYdKUn
         cTmUClTmlWEI1Umm4K9UMRdndwmerBOB68QZB0fZof6oyw+tjV7riFpz4yZn6oUqdFYc
         VMCiuUi68F0PdU+6uOY9O2FroV4RCJpcyORncBkEzrLdgONtSEzjYoTrF4DTzo0UMGw5
         HqiM7pWkuVFpIF2PMJB1sWSlySC+2sA5c6tNcdXmPM3yXCeL8ccyfegOa7TGFHHYfD4+
         Rb/Q==
X-Gm-Message-State: APuU4Z+bRoFXHE68DgEY3egJKWj2wz/WSaz2baf9Reqo/GmSuKdB7rT5
	wsIxxBSgTOlakuMxiYUGj47gW5wt7FT154KXUuR2vJODqB/iziz3IQAOiSiPOnELX1qpD1t86an
	NkaSpymk=
X-Gm-Gg: AZFdTZfamyc658Qay0MMRNihiickFm1V1fjoWzcB+m0/ERxSZuHDoILVALUzGTKEeKF
	U0VatRicBNjyjK3KppGUn55eHARHlblJgmwX6VD52q116AALIYgCcbgTjbjqFgSB6LqvIMfFAvW
	NxohqsSWBqxhoekJ/N+e102X/RSHqinkZRBTCWBKTW7uqcvLoZ7f96PlH8Kg1Paz0SaKtjArM2d
	2kJyNhheXQ7adQmu6PdnrE2bO6+EmQMtGdwkIVmGm0+9+zxn+QmhMedvrmle7EVo+i8Edzvuyrr
	BN5QlUaLCzXTzmvNcwnshuBn9cWcmY6cN6VMXD1HnWva5Fhr9uUYCStvyrl6Af1TIyF0LFhUISm
	i0omZPc5JJj561hYhins3uGbxKSHYN4nY/Lv6c0Yccg8wr2R0L1GmQp5zMtP18eYIGZ8BCZstyS
	bdmpNRblD8yb6WmNxrq38Y9zcKJlZ6a9mYJhfRhNLQvUlOTU9LIu/CsHklzJAqn3XDIWJXw3DSv
	/3BfUcL1/WkcPbY2ohlCS3662Qz27Fp0a7V7GIXMqA5ZFb7FhMM56h1h784VVbMeOdrIfQ94FeY
	CUv/2h/biVsEHRt8zwavEXXQLtEXcs7uLpu+6my5F4mQM4oK86Y6LNPS6Fbi9u5sfKqQLitq5xZ
	HXI7Z6TQgc41nfeo0ZLT2hOJiAv+5jfDFQnr7ai1/u0TlbHpiiWkaKHtba7TN+g7u
X-Received: by 2002:a17:902:e88b:b0:2e9:569a:214d with SMTP id d9443c01a7336-2f03f2533abmr67096005ad.43.1795401325369;
        Sun, 22 Nov 2026 18:35:25 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm44320685ad.63.2026.11.22.18.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:35:24 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [BUG] net/nfc: LLCP takes the skb reference after queueing it to the socket, so a concurrent recvmsg() frees it first
Date: Mon, 23 Nov 2026 08:05:18 +0530
Message-Id: <20261123023519.3350997-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

Hello,

nfc_llcp_recv_ui() and nfc_llcp_recv_hdlc() queue a received frame to an
LLCP socket and only then call skb_get() on it.  Between those two steps the
skb is on sk_receive_queue at refcount one and a concurrent recvmsg() can
dequeue and free it, so the skb_get() increments freed memory.

Reproduced on net.git main at af6737b90668 ("net: af_key: fix use-after-free
in dump_sp()"), 7.4.0-rc3-01164, with KASAN, at both sites.  A patch is in
the next mail of this thread.


1. Root cause

net/nfc/llcp_core.c, nfc_llcp_recv_ui() (and the same shape in
nfc_llcp_recv_hdlc()):

	/* There is no sequence with UI frames */
	skb_pull(skb, LLCP_HEADER_SIZE);
	if (!sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
		/*
		 * UI frames will be freed from the socket layer, so we
		 * need to keep them alive until someone receives them.
		 */
		skb_get(skb);
	} else {
		pr_err("Receive queue is full\n");
	}

sock_queue_rcv_skb() does not take a reference of its own: __sock_queue_rcv_skb()
calls skb_set_owner_r() and skb_queue_tail(), taking over the reference the
caller holds.  The moment it returns, the skb is visible on the receive
queue and whoever reads the socket owns it.  A reader that gets there first
dequeues and frees it, and the skb_get() that was meant to keep it alive
then operates on a freed object:

	refcount_t: addition on 0; use-after-free.

The comment above the call describes the intent correctly - the socket layer
will free it, so a reference is needed - but the reference has to exist
before the skb is published, not after.

The intended final state is unchanged by taking it earlier: the caller
(nfc_llcp_rx_skb(), via nfc_llcp_rx_work() or nfc_llcp_recv_agf()) drops its
own reference with kfree_skb() when the dispatch returns, leaving the socket
queue holding the last one.


2. Both sites, and why the aggregated-frame path finds it so easily

	nfc_llcp_recv_ui()    net/nfc/llcp_core.c:930   (SOCK_DGRAM, UI frames)
	nfc_llcp_recv_hdlc()  net/nfc/llcp_core.c:1144  (SOCK_STREAM, I frames)

Both are reached from nfc_llcp_rx_skb().  nfc_llcp_recv_agf() splits an
aggregated frame and dispatches each sub-PDU through nfc_llcp_rx_skb() in a
loop, freeing each one immediately afterwards:

		new_skb = nfc_alloc_recv_skb(pdu_len, GFP_KERNEL);
		...
		skb_put_data(new_skb, skb->data, pdu_len);

		nfc_llcp_rx_skb(local, new_skb);

		kfree_skb(new_skb);

so one AGF PDU delivers many frames to the socket back to back, which is
what makes the window easy to hit from userspace.

The same file already uses the correct ownership rule for the raw-socket
copy a few hundred lines above:

	if (sock_queue_rcv_skb(sk, nskb))
		kfree_skb(nskb);


3. KASAN reports

net.git main, 7.4.0-rc3-01164-gaf6737b90668, KASAN.

The I-frame site (kasan-nfc-llcp-hdlc-skb-uaf-mainline-7.4-rc3.txt):

  BUG: KASAN: slab-use-after-free in nfc_llcp_rx_skb+0x17b3/0x34a0
  Write of size 4 at addr ffff888055abe5e4 by task kworker/1:2/56
   kasan_check_range
   nfc_llcp_rx_skb            <-- __refcount_inc, skb_get, nfc_llcp_recv_hdlc
   nfc_llcp_rx_skb            <-- the AGF loop's inner dispatch
   process_scheduled_works

  (rx_skb+0x17b3 resolves to skb_get at include/linux/skbuff.h:2004,
   inlined by nfc_llcp_recv_hdlc at net/nfc/llcp_core.c:1144.)

The UI-frame site (kasan-nfc-llcp-ui-skb-uaf-mainline-7.4-rc3.txt):

  BUG: KASAN: slab-use-after-free in nfc_llcp_rx_skb+0x3a5/0x34a0
  Write of size 4 at addr ffff888055973724 by task kworker/1:3/2203

  (rx_skb+0x3a5 resolves to skb_get at include/linux/skbuff.h:2004,
   inlined by nfc_llcp_recv_ui at net/nfc/llcp_core.c:930.)

On 7.3.1, where net/ is built without inlining, the same two reproducers
name the refcount helpers directly - once on the increment and once on the
matching decrement, depending on which side of the race loses:

  refcount_t: addition on 0; use-after-free.
   __refcount_add
   skb_get
   nfc_llcp_recv_hdlc
   nfc_llcp_rx_skb
   nfc_llcp_recv_agf
   nfc_llcp_rx_skb
   nfc_llcp_rx_work

  BUG: KASAN: slab-use-after-free in __refcount_sub_and_test

(kasan-nfc-llcp-{hdlc,ui}-skb-uaf-7.3.1.txt.)


4. Impact

A four-byte increment on freed slab memory, with the value and the timing
controlled by an unprivileged reader of the LLCP socket: it is the same
primitive as any refcount-on-freed-object bug, and the freed skb can be
reallocated between the free and the increment.  The decrement side can also
land on a reallocated object, which is what the __refcount_sub_and_test
report above shows.

Reachable by whoever can deliver LLCP frames to the device (an NFC peer, or
a local process owning an NFC device) together with any local process able
to read the corresponding LLCP socket.


5. Reproducers

nfc_llcp_hdlc_skb_uaf.c and nfc_llcp_ui_skb_uaf.c in this directory (sent
off-list on request).  Each brings up a virtual NCI device, binds an LLCP
socket, and then races frame delivery against recvmsg().  Both fault within
a few seconds on both trees.


6. Suggested fix

Take the reference before the skb is published, and drop it again if the
queueing fails - sock_queue_rcv_skb() frees nothing on any of its failure
paths, so the extra kfree_skb() balances exactly the reference taken here:

	+	skb_get(skb);
	+	if (sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
	+		pr_err("Receive queue is full\n");
	+		kfree_skb(skb);
	+	}

at both sites.  The patch follows in this thread.  Checkpatch is clean.


7. What was and was not checked

Checked: both sites fault on net.git main under KASAN; the patched kernel is
clean on both reproducers; the refcount accounting with the patch applied
ends in the same state as the original intent (socket queue holds the last
reference, the dispatcher's kfree_skb() drops its own); ordinary LLCP
datagram and stream traffic still delivers with the patch applied;
net/nfc/llcp_core.c is byte-identical between 7.3.1 and af6737b90668.

Not checked: real hardware; an over-the-air peer.

No Fixes: tag is given: both sites date from the original LLCP receive
implementation and our clone of net.git does not reach that commit.  Happy
to add exact tags if you would like them.

This was found by AI-driven fuzzing built on top of syzkaller; its analysis
was then checked by hand against the code and every claim above was
reproduced.

Kapil Vaswani
Piyus Kedia
