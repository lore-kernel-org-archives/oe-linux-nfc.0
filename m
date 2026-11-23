Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401355;
	b=lS9T7XFuxIIKFdVRcQPvF5ABpxk66uP+62zfq33E1TDjVW1aDSRsKebBI8XUoGUuD7Hy
	 lPETOXqdDcwGs5Xdh5BB8NM8zCOvPmXSOHeTlu5MlO1a1DvoKBvQo3tZcP+0KL3Q1cqKV
	 rjxAcfAzQ32UxO0g4Vi5ZVkjrasHPLBrcknZijuMT6E55ZwN0B/myTEQDrh5TYUUNndKB
	 F7J+FBrk3H8fKo+lHGrNxirIQftDcLbKUkcNyEUC/fTzTLjyDZjkTRkLssDOS8HZle++1
	 qqTbOogSVM94MZb79DMlKM7XSZ1Nwg+5ErVUM6OSFVnT8oZIG/mWG/4XyhdvmtwzJ/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Zta3sFkY9ZZMc3gNgFpjOMOV1WUQyr5rBabD1DfSZCg=;
	b=gJXCFRK9gdXggxA20pHDRYng8DoSXNe0o58nFI3HnQn+sK5zz4TFaL2NJK/+qxV+KpSL
	 MqS8Owtz/Y2ofgkYFHUw7XwQZrw/RqMQ6E/zDZaE+Y8PXBRqeb3B8mf+sDFGCBJB9v1sA
	 lPVcYG2u4eBY7sHL6c24iSNU29UeCcr3vqERp5lqEyoavYY1hsmpNi/o0BXSssYK8ElV+
	 WNHpfiHqODRvTgkQo1ARpHUFsXVFwTjWKgvc3G3x1qmEeNdo5bg6K0iH0fHK0l7Q1r7ld
	 t+Kxd4lP2gHydHUh8R3+x0IY/d1Uo68ZrCBpBlodYVcrtyW7jx6+TfyF5nNi45bmPeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=SObFoyqB;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1548606A320
	for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Nov 2026 02:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1548606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=SObFoyqB
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f05b465cd1so9816755ad.3
        for <oe-linux-nfc@lists.linux.dev>; Sun, 22 Nov 2026 18:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795401354; x=1796006154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zta3sFkY9ZZMc3gNgFpjOMOV1WUQyr5rBabD1DfSZCg=;
        b=SObFoyqBOFcUOJrmITtEAJ2EIXoKLpVdap/XeHZ4ohU+ifcgtBCXwt0ZdPmVaBoUV1
         /NxBkTATTdV8UanYrAPfTR8HOwjvQXn+VOmifcjmuqvT5f3YV2jR1tqcawPUjGN5xkpd
         6t6+3VDEbZuVFK3gqJFrCjFkmdaEVKwz/O+Eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401354; x=1796006154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zta3sFkY9ZZMc3gNgFpjOMOV1WUQyr5rBabD1DfSZCg=;
        b=r/BCvgfdu3zsjISGBaCKgjaRP1kzeD+HWnX5IiTDTXrPhfjhdCkkBGHiGh8PgbdClg
         7Zp09W/cZpIM1KRzQtrNKVkj0lVPo+gGNU8TqZSRnw+4N+mojlHFhukHIVAsWxo9L97H
         1kDXev5W8UueUoTGa/AvpJlMlzmRGpSUwx9TpLxljNb2OnNqPLGimKPe7gHFly0XOmaU
         8XbMIduguMR8ZxuvfWWF2DXOGbGuPNPqiY1T+Aeb4qmEH5+88l9lY7d+BoTe+U57h9tz
         RdWT4nIhZ95SNz/IOdmtKbfMHN8CGHYbd/4gi6g/n0jLHuqcTjJTa3ion0ldyK4jpwhh
         Tzvw==
X-Gm-Message-State: APuU4Z+eqtyvFIHlA9nhdKyQDeOl1VRzf3dxMIoBQ5twt7h8X4hmEzCd
	VbjFnbTtH5anDw6DyKC3aeTBYyyFd69sG/4vn+jbrwx6P5292ZZbsJI9mospmFeWPws=
X-Gm-Gg: AZFdTZdYiP6NjkedebUrbJzTwgs2wQyhVwhlnqzO13xVrgXEIwsLwRu66CtOMEQTF8m
	nlmzxmB2Tug/PnXptQOVwcDmmYK5zXIV5IeNxUlGeGmuwq21QkG4EvBiQJOioh5hVwLj74UR9Gj
	+shLmivLWVyPKGa7ZNjHxYncu2O2PM/9d5Gu8taT25uMpYLGSIa6gCXdPIuyL2t4sxNK69cDnfz
	SABBO4KkF58qwFvQXqYhexPz6hJgoY2YiiVVsgodbeiP+Gs6oj+c2DMQUBIoyBASE/JE9+B9xZe
	5y8wl4Y35GuvgN0fiAsz7Xnr6EwruZubyW7pUjHyT0qKdd6wGqpwMOuEDxFXgQiZA1rdSZ2TgMl
	ldfvJi/QVO7/pYOBl86AiUaCBTSj1j+z3w7Kx8d8AakGfg+HQQ5AijqHKgMCtBWAVwKW6VPe1qW
	kXm7UkQH7DaTsG5jXFdDxhlqInLKL0W3n5qepU3EchDr5teqmLTq9O93E0k0NanMIbPcxLj/1BJ
	1j0tOT3krcJbrmd9SkLaSEOiTpwxti8o9WSfsjg6n9NHaCsFD4429pkqttlyYzuSAn4tdskL/vn
	A9lVSlCba++1nnYkvE6bMhCZNfJSF9CnsUZJ7GT4QWVQkug0LL/MSgYP+upOET8MO3/dgS8MIGf
	RGhbQXoqgxo8teDlI2s6lXTkzIceSfZ/Ka1jZa/wv/A+/UKnVuhU3w7mBN9p6v9pE
X-Received: by 2002:a17:903:32ce:b0:2ef:ed25:514a with SMTP id d9443c01a7336-2f03f16ac68mr91947455ad.44.1795401354275;
        Sun, 22 Nov 2026 18:35:54 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm43609925ad.59.2026.11.22.18.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:35:53 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [BUG] net/nfc: a 16-bit truncation in nfc_llcp_allocate_snl() overruns the SNL response skb and BUGs the kernel
Date: Mon, 23 Nov 2026 08:05:47 +0530
Message-Id: <20261123023548.3351531-1-piyus@iiitd.ac.in>
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

nfc_llcp_allocate_snl() accumulates its allocation size in a u16 while the
length it is given is a size_t.  An SNL PDU carrying enough SDREQ TLVs makes
that sum wrap, the response skb is allocated far too small, and
nfc_llcp_send_snl_sdres() then puts the full TLV list into it: skb_put()
trips skb_over_panic() and the kernel BUGs.

Reproduced on net.git main at af6737b90668 ("net: af_key: fix use-after-free
in dump_sp()"), 7.4.0-rc3-01164, with KASAN.  A patch is in the next mail of
this thread.


1. Root cause

net/nfc/llcp_commands.c, nfc_llcp_allocate_snl():

	struct sk_buff *skb;
	struct nfc_dev *dev;
	u16 size = 0;                           <-- u16
	...
	size += LLCP_HEADER_SIZE;
	size += dev->tx_headroom + dev->tx_tailroom + NFC_HEADER_SIZE;
	size += tlv_length;                     <-- tlv_length is a size_t

	skb = alloc_skb(size, GFP_KERNEL);

The caller is net/nfc/llcp_core.c, nfc_llcp_recv_snl(), which walks the TLVs
of a received SNL PDU and builds one SDRES TLV for every SDREQ it finds:

	case LLCP_TLV_SDREQ:
		...
add_snl:
		sdp = nfc_llcp_build_sdres_tlv(tid, sap);
		if (sdp == NULL)
			goto exit;

		sdres_tlvs_len += sdp->tlv_len;
		hlist_add_head(&sdp->node, &llc_sdres_list);

and at the end passes the accumulated length:

	if (!hlist_empty(&llc_sdres_list))
		nfc_llcp_send_snl_sdres(local, &llc_sdres_list, sdres_tlvs_len);

The accounting on this side is exact - every entry added to the list also
adds its length - so the list and sdres_tlvs_len always agree.  What does
not agree is the u16 inside the allocator.

An inbound SDREQ TLV costs three bytes (type, length, tid, with an empty
service name), and the SDRES it produces is four, so sdres_tlvs_len is four
thirds of the PDU's TLV area.  About 48 KiB of SDREQs therefore pushes it
past 65535.  nfc_llcp_send_snl_sdres() then walks the list regardless:

	hlist_for_each_entry_safe(sdp, n, tlv_list, node) {
		skb_put_data(skb, sdp->tlv, sdp->tlv_len);

		hlist_del(&sdp->node);

		nfc_llcp_free_sdp_tlv(sdp);
	}

With 16400 SDREQs the accumulated length is 65600, which truncates to 64,
and the skb that should have held 64 KiB holds none of it.


2. How the PDU gets large enough

The NCI data path reassembles fragments before the LLCP layer sees them
(net/nfc/nci/data.c, nci_add_rx_data_frag()), so the PDU that reaches
nfc_llcp_recv_snl() is not limited to one NCI packet: a sequence of
PBF_CONT fragments accumulates into one skb, and the final fragment
delivers it.  The reproducer uses 64 KiB fragments.

The LLCP MIU negotiated for I-frames does not bound this path; SNL is
handled directly out of the receive skb by nfc_llcp_rx_skb(), and
nfc_llcp_recv_snl() walks whatever linear area that skb has.


3. KASAN reports

net.git main, 7.4.0-rc3-01164-gaf6737b90668, KASAN (full log attached as
kasan-nfc-snl-skb-over-panic-mainline-7.4-rc3.txt):

  skbuff: skb_over_panic: text:ffffffff87e134e6 len:382 put:4
          head:ffff88801d2016c0 data:ffff88801d2016c4 tail:0
  kernel BUG at net/core/skbuff.c:215!
  Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
  Workqueue: events nfc_llcp_rx_work
  RIP: 0010:skb_over_panic+0xcd/0xd0
   skb_put
   skb_put_data
   nfc_llcp_send_snl_sdres
   nfc_llcp_recv_snl
   nfc_llcp_rx_skb
   nfc_llcp_rx_work
   process_scheduled_works

"put:4" is one SDRES TLV; the skb had no tailroom left for it.

The same reproducer on 7.3.1 gives the identical BUG at the line that
skb_over_panic() occupies in that tree (skbuff.c:214,
kasan-nfc-snl-skb-over-panic-7.3.1.txt).


4. Impact

A kernel BUG() in a workqueue context: the machine panics with
panic_on_oops, and otherwise the worker thread is killed with the LLCP
local's locks still held, which wedges the NFC stack.

The overflow itself never writes past the allocation, because skb_put()
checks before copying - this is a denial of service rather than memory
corruption.  It is reachable by whoever can deliver an SNL PDU to an NFC
device: an NFC peer over the air, or a local process that owns an NFC
device able to inject target-mode data.  No capability check stands between
a peer's PDU and this path.


5. Reproducer

nfc_llcp_snl_sdres_overflow.c in this directory (sent off-list on request;
see the note at the end).  It brings up a virtual NCI device, answers the
kernel's bring-up commands, activates target mode, then delivers an SNL PDU
of 16400 SDREQ TLVs across PBF_CONT fragments.  It BUGs the kernel within a
second on both trees.


6. Suggested fix

Hold the size in a size_t, so the value that reaches alloc_skb() is the one
the caller computed:

	-	u16 size = 0;
	+	size_t size = 0;

A request that large can now fail the allocation instead of wrapping, and
both callers of nfc_llcp_allocate_snl() already handle the IS_ERR() return.

The patch follows in this thread.  Checkpatch is clean.


7. What was and was not checked

Checked: the fault reproduces on net.git main under KASAN; the patched
kernel is clean on the same reproducer; ordinary LLCP traffic (SYMM, CONNECT,
I-frames, an SDREQ/SDRES exchange of a few TLVs) still works with the patch
applied; net/nfc/llcp_commands.c and net/nfc/llcp_core.c are byte-identical
between 7.3.1 and af6737b90668, so nothing in between changes this path.

Not checked: real hardware - all of this is on a virtual NCI device under
QEMU.  We have not tried to drive the path from an over-the-air peer.

No Fixes: tag is given: the u16 has been in nfc_llcp_allocate_snl() since
the SNL support was added, and our clone of net.git does not reach that
commit.  Happy to add the exact tag if you would like one.

This was found by AI-driven fuzzing built on top of syzkaller; its analysis
was then checked by hand against the code and every claim above was
reproduced.

Kapil Vaswani
Piyus Kedia
