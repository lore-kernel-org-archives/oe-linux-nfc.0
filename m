Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421A042BC28
	for <oe-linux-nfc@lists.linux.dev>; Tue, 14 Jul 2026 20:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784062387; cv=none; b=eEguY6OgeE9AMRAa2003facBXvoFJ2dIIdJ/mAQAJmzS2CjM0nK5tW4hE03hNoT47hz2eCIqSnXcAKUigmxdbVSvOG6EtfzVn8W1zJ6kK4mSPVDJVjzHRrzzujWVHFuk0osmPyKs45mBNaDciAp6oQvAi9wln5nvJASgjzK6Pws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784062387; c=relaxed/simple;
	bh=JYol08YXW91ovkNpZaJIz1Ed+fcIPymArOeW437uj6E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BDoRJSA8PzkkfEL8eggHDIgEzJeSxxYiMoKGbI/ChVzK7cK3rtKbwJ+Fp29hyJq+uZ/F+eSo0byeMZ8tnZQj65Z926NL79XLvMmjFS7gnD/KtW+Sca+CFEuTTqj/YAHAMo49/GIRGIw0fxKKUMMNlRLJ+4vmkJNYcmXH8ysbHEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5F6HOJ0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5F6HOJ0"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4720d22c94aso1404054f8f.1
        for <oe-linux-nfc@lists.linux.dev>; Tue, 14 Jul 2026 13:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784062384; x=1784667184; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hPy+9VG/Wk31EHh/SoTTpkYEXwE1ur2uoLWA6FIrzb4=;
        b=m5F6HOJ0VHsQL8mf2mETpo+P4ODwKRpEv8XRghw8waYPGTa/khK1DuDQh+ozn4cdM2
         v989/Y01WRhAip7tAQG2+xK28kbso5AOcbkLfF5O/K0gqXRNyPbR0VEEZMzE6jYGl2x+
         aj7WahhxQOta+q9qQftmcVZAJinadgDVskvNAwUrDThRLICcbE0i3cF9JIrW0mxIRD9y
         9NFpgv54n7CM1uQZEG7XsaS5wyiHYbQWm3yr4Q2O7NlZV8r6DDUQKqA1nyu3DJ34KMyu
         eIiMRiiX0Efi6o4VYgXIpqRoSizOD1nyexVhWJjPpfVRcIdQd6+rk8qRhVwU0Qq5m0Tm
         e9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784062384; x=1784667184;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPy+9VG/Wk31EHh/SoTTpkYEXwE1ur2uoLWA6FIrzb4=;
        b=sqlQSf3dzokuak6Ejk5/v7wOdgPSU0PADnVgDRnDR9zYGiJ4rTQOTVD9m3xRIfVoxi
         6GVLoHe/3Ftm6xT7yoCdL4U+il+tZkUmp3mHGlymwxR3V2iXtXpdE2QfK0FZI4Xr9b5X
         u8CGxp+fiejQyoSD0t/SuhOnj9RLJtu/7JD5q2d0tXcBXoUYprUXobvEIjSk4ddPII3/
         zygB56EyTQfdEb7YlilB9GJ/i+QS1VWlhp2eYrRreyf8R+uuo1KB4idX1+UwvlitraYf
         +MArhkmEN3UAma0DKKT4h4YKkVbSy+KNG0/gJayBv3RmzBXTCq04M8+AZFwtrE4dC26N
         Ngtw==
X-Forwarded-Encrypted: i=1; AHgh+RrWiQw5INoyrNcYXUhxU4ZMqklVcn7OKmETxv2p+8zwDwq+a32gNY3oh/qPrFTVVKeHej6D1e1TjyaxjIs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeSyUHoAvbF5dNXLnP5CIh2V9fS3ZmSU/pmqAW+mIPRzLRo7Dc
	VquN03zovUUm9705nwzgPwVf1UcEV1wQpAl+dLMSECgrjLogM4LBqyVC
X-Gm-Gg: AfdE7cniz6X1ncDy46PScIwzSbWCnbjyJZWLngCaHTEXIESl8TaGdcDeoqjpUW5BDIu
	0/4H3wt7il7Lnv/kSxdjoU3zf/QwPmPzH/puSLTL1gjJG0zTAYyrOzGKxDS7XZeuo2JmSuQT35a
	58zp3Qakq33CnFSoGfgT5ogr6RxES33NGU4NLeBYxC14jyGiWx0sBgUjrRMwiUC3w4dyUr7XxI6
	A9lSN3LMxUIwApqKAmKuO+/j2YTyHDiIpYaHY57l7BBe67UuzsqtYqazOnuqPy5/8FbS5vB43W5
	xuPVhJlZSHQm9I6JDlaBaIZWYHYkFs0+XlP4IFs3H6wqMnxjJfx3g2/+MQlUIsdFENChvGZ2jr1
	AmKTrHUmVnJyszaxnLUOzwd+pv2CipuuBPdKJ21NjWxCHHzns0m3tpVkIlTtS6aP8nQ7b2YtP6Z
	CrgBocy7Pmc74CR1VvL3FfZM5VsE1xnRQOhksDZ40QcAVCs9bSVg==
X-Received: by 2002:a05:6000:1866:b0:475:f0d1:eb56 with SMTP id ffacd0b85a97d-47f2dd0d63fmr18015724f8f.49.1784062384331;
        Tue, 14 Jul 2026 13:53:04 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634debesm10998794f8f.8.2026.07.14.13.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:53:04 -0700 (PDT)
Date: Tue, 14 Jul 2026 21:53:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: david@ixit.cz, vadim.fedorenko@linux.dev, horms@kernel.org,
 oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v2] nfc: llcp: reject PDUs shorter than the LLCP
 header
Message-ID: <20260714215302.75d8bf72@pumpkin>
In-Reply-To: <20260714164629.75051-1-doruk@0sec.ai>
References: <20260713221556.13a830b8@pumpkin>
	<20260714164629.75051-1-doruk@0sec.ai>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Jul 2026 18:46:29 +0200
Doruk Tan Ozturk <doruk@0sec.ai> wrote:

> > Is there a similar problem with non-linear skb?
> > Maybe they can't get into this code, but who knows what can happen
> > with unusual configs.  
> 
> Good question. Today every skb that reaches __nfc_llcp_recv() is
> linear: the target path (nci_rx_data_packet -> nci_add_rx_data_frag ->
> nfc_tm_data_received) and the initiator path (nfc_data_exchange ->
> nfc_llcp_recv) both build the frame with alloc_skb()/nci_skb_alloc()
> plus skb_put()/skb_put_data(), and NCI reassembly uses skb_cow_head()
> and skb_push() into the linear area. Nothing on the NFC receive side
> attaches page frags or a frag_list, so skb->len == skb_headlen() and the
> v2 skb->len test was in fact sufficient for the in-tree drivers.
> 
> But relying on that is fragile: the parser reads the header out of the
> linear area (pdu->data[0]/data[1]) while skb->len is the total length,
> so a non-linear skb with a short linear head would slip past a skb->len
> test and still over-read the linear buffer. pskb_may_pull() is the
> right guard here -- it also covers the non-linear case, and it matches
> how the sibling NCI and HCI receive paths already validate their
> headers.
> 
> I will send a v3 that uses:
> 
> 	if (!pskb_may_pull(skb, LLCP_HEADER_SIZE)) {
> 		kfree_skb(skb);
> 		return;
> 	}
> 
> That is strictly stronger than the v2 check and does not reject any
> valid frame -- pskb_may_pull() pulls the two header bytes into the
> linear area when needed.

Does that help any code further down the rx path?
It might be better to drop non-linear packets with a comment that
they aren't expected to happen.

	David


> 
> Thanks,
> Doruk

