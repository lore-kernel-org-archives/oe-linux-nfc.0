Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBB22459DC
	for <oe-linux-nfc@lists.linux.dev>; Sun, 12 Jul 2026 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783872162; cv=pass; b=e2C/yB+FQ+ddlPnTv3I8VfdeLPuj8b2KL6djAzrR9GZj/RcYizQOFUoAVM/by7Sy3OhLrhJLWXRLbgksnIPQI5WPhcpCXBFWOA4lXOjKP1Hwe5TiwZrwZ90ZJeqUD9EjvUVl5JwPWIqz9Q6L2FRJ5NxJFB/uBj8AXX74OO8tPyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783872162; c=relaxed/simple;
	bh=lEN1RDO1utLqCuN68G05+ujxtG3nu9JpSH8sV9ic7Ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9vWRMHQGTt8qQXa8vEzh0jxbkErVRHmkBcjY09VgfrB01elHM78MB1gEzoegxAX+kHSFszXIs7sSzEX7Ki1ONtUrYKbD62Cn4iL7HFMnnprE3gh6s/imI1sjg+a/6UverQeeESD4EJF4556VuA+PaHZiHf/0A2Zv57p9AggQ4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=FkgI+2cA; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="FkgI+2cA"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c7cfa17fedso33953225ad.3
        for <oe-linux-nfc@lists.linux.dev>; Sun, 12 Jul 2026 09:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783872158; cv=none;
        d=google.com; s=arc-20260327;
        b=aV8Xd/fqLtHH9cYNowU3PU8jh96I7CIA8RHz5q3h78KDqTqAnQkZ7zMb5JLcDUxm9H
         0Yc2/UxWIqtjnaE7hRqHHmkq0LnOw5bmPESdT3n5jhppTYI+ACOT79pIb4QLbZYZ6j0v
         ye38yn7APhACUYCmKJ3dHwtNfH+7DhSqBHf7G89Ru0fgOWL4b8X3Tnad3I+/pdLysO0o
         1yRrL/aZlYCnhc+S+OTymwIGk5FC5e1qoow5TsmbEFmTQJJJXkL240wEBkNbirxzW8+d
         dOTOSjlqm8GMDmnCKWnr9hG6I4joqfqRW2crQ0sHYMIiHlYDnHTdajzN0TjSWYrjIxaZ
         AQpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y8gOd+Q3z89xRep8w0XzdPaSt7VIYP9aT1DEEYw2ULY=;
        fh=z0MhbTxxaOFCnXAWgd5iqMVen6mFdnZBd2mixd7AVtM=;
        b=Wac2RTntkRH9NHhQWKIO2MYJC5XO4gAuq0Az2IKXQS+WiFmrgv2d7bs2UW7bFyhd8z
         j5V1SvzxW+i0Zb2UJOXB8Vb04yYWIeZNTR2gxq865iU8FGhHwxB0FiXwrEQBQSSpgj0R
         gzbMC2ifK4i//PVKRxDBH8C4YKqYsNLZ9dA2V/whv0bWKvhLH+mYwHbthzz3d5H61xvh
         77u8ug/RQhQwYoyI793QxDfUOypSymvUnhEBvAwiCKDDxA0guKBAy95ks6MvMISheXlG
         /7lgTLoHNE8htU6yjLAe4hH5+siSGmxEthrrl12xI/TUQcWipC7ry3c8oRaCOefEzR2C
         PvAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1783872158; x=1784476958; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8gOd+Q3z89xRep8w0XzdPaSt7VIYP9aT1DEEYw2ULY=;
        b=FkgI+2cAZ1kwrYkzWApYLi7Rl6lP3QZqfZz6OrztVXUPSN1on78V7T3UfHS/BFZGRX
         +nUMRnyvy5jZCzQJIUURactMxmdohC283yrbWHzddNyx7VYRnRHkGhTtG+0aLyMax6RB
         AQMBN0tVHQKDjmsL70MGa5Zxb7OXj5WE9wMTzJ8PPMyWM6mgZGotdLyjlxWM1xuFVuhQ
         Gqtv3KZHtTgDDYRUvg8J9JAdzgHHL3SyyLFJMXJTygZCl973tD12Kv0DRGhqyAEowD+C
         mGf8xiLrRteelX6QG9zY0JnNLemUz6Gr2+dERSwOXQMVUsMNxobcuFL60EO5FtLQIw5I
         Nmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783872158; x=1784476958;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y8gOd+Q3z89xRep8w0XzdPaSt7VIYP9aT1DEEYw2ULY=;
        b=ErxOJcXJQwSe3hriAYUVArR6igXr3DoUSw6bqFwBobI9T3WEbpBRSZznCc0ppeG7an
         wo9QJjHSQph81gZ9R7A2N+g7jvUegcaOV2eoTStV+e6t0v1kDGrB3/DvnU6TfsZI9nW2
         DYgZxSUGB8eSUlZ+SeETKww+xOnzyHXVYgbe6Xpz1gptp4I16CpjwBj13JdaqgntceBv
         eRZ//4nZkRUszW4ZMUzNtiJLkeNKeMvK3wySDIiU0a7Iww9md37PQixxfCyWduTTOuPI
         CZ/WgDFy6qwZwwFXiy/sSoGb++DWqMCoO3aZVWhERCoVrg0a56YBOzeDFu+sCgWd6j51
         sjFA==
X-Forwarded-Encrypted: i=1; AHgh+RpDU332Da+TCbP6lx9gzIauChpW5VRKi7la8ZcMq7X81dwXlS4TAojspGgmCq9mZLaniA08JOGKmFIJ+3w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy9lN1ELBXcDc/dzqUha1GW13g0zyw/MAF3BaUuFCAFD6cObqY
	NRrtU8LqBhqRF7bUSlVeNwH3/1B9fMPTycQVjWZxdfemjH2HayD+Z8cHXyb9QrMgJKeBxjZpiNo
	CpDJLvskq9egKLhU2MQyUtGhGXErLABXDfeF8BGPT0vM=
X-Gm-Gg: AfdE7cnnUlxNTLoTJ0DrL5IL/S9TtK2EK7ya/VJkuSzn0GqWSwzXzSm80CDoUSdwYXB
	/H5iM9ETAAQinS+ySM5xlLgXwVj9W9m7DHk3gQvPDfcz6OauXXqFNhsiZvfS3w+ld6nlWBcc09g
	NAxP/34nedKYkunzIymCTmEIveNGPdwMX26842x4ogK3+JswjBGz90OXBjM1AgWoblK9F0GeC3p
	ZjSVJDygQtXy2bV7cpRlIxko9JiNO2u+JDkRfilPi/sWN6/4F/RJGCtWdZJ8kBBYMDvq1ttKlbT
	Rn+rJxJFoaLr2HL9fcOyVVua4pCSqLzlafY+92MkcHgpB5hj7GwVr4XwO3ky
X-Received: by 2002:a17:903:2444:b0:2ca:c4a5:84bb with SMTP id
 d9443c01a7336-2ce9f27e6f1mr63459385ad.38.1783872157981; Sun, 12 Jul 2026
 09:02:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260711072702.70231-1-doruk@0sec.ai> <be1731eb-e6ec-4015-92e4-c09fd88019e6@linux.dev>
In-Reply-To: <be1731eb-e6ec-4015-92e4-c09fd88019e6@linux.dev>
From: "Doruk (0sec)" <doruk@0sec.ai>
Date: Sun, 12 Jul 2026 18:02:26 +0200
X-Gm-Features: AVVi8Cfuvaa8c4Hm1hNjjBfiFUfKj_52zwFcdM42IhGHFkrP4Lc2eV58kzfpMGc
Message-ID: <CAPdMp1p=72WXe-8w5Y9viBuB6YvZWZomNc9xQzXEg-qe1WVN0A@mail.gmail.com>
Subject: Re: [PATCH net] nfc: llcp: reject PDUs shorter than the LLCP header
To: vadim.fedorenko@linux.dev
Cc: david@ixit.cz, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vadim

this was reproduced from userspace on unmodified
linux-next (bee763d5f341) without RF hardware.

It's the peer-RX path, not a local command skb:

virtual_ncidev_write (peer NCI DATA) -> nci_rx_data_packet
-> nfc_tm_data_received -> nfc_llcp_data_received
-> rx_work -> nfc_llcp_rx_skb -> nfc_llcp_recv_connect

Bring the LLCP link up via a normal NFC-DEP activation, then send
one NCI DATA packet with a 1-byte CONNECT PDU. skb->len - 2 wraps
to 0xffffffff and the TLV walk runs off the end:

BUG: KFENCE: out-of-bounds read in nfc_llcp_recv_connect+0x9f6/0xf80
nfc_llcp_recv_connect+0x9f6 -> nfc_llcp_rx_work -> process_one_work
read 4219B past a 704B skbuff_small_head from virtual_ncidev_write
R14: 00000000ffffffff (wrapped tlv_array_len)

With the guard: rx_skb runs for all 600 short PDUs, recv_connect
reached 0 times, 0 reports.

The bound stays "<", not "<=" -- a header-only SYMM/DISC/DM is
exactly 2 bytes and must still dispatch; AGF uses "<=" only
because an AGF frame must also carry a sub-PDU. I'll drop the
"same guard as AGF" line from the commit message.

Instantiating /dev/virtual_nci needs privilege, but that's just
the syzbot transport; the 1-byte CONNECT is what a remote NFC-DEP
peer emits, and the DEP layer imposes no minimum LLCP length.
Impact is a proximity OOB read (DoS).

I can send the full reproducer if you'd like.

best
Doruk

On Sun, Jul 12, 2026 02:01 PM, Vadim Fedorenko
<vadim.fedorenko@linux.dev> wrote:
>
> On 11/07/2026 08:27, Doruk Tan Ozturk wrote:
> > nfc_llcp_rx_skb() reads the two-byte LLCP header (DSAP/SSAP/PTYPE) and
> > dispatches by PDU type; several handlers then derive a TLV-array length as
> > skb->len - LLCP_HEADER_SIZE. Neither nfc_llcp_rx_skb() nor its callers
> > guarantee the frame is at least LLCP_HEADER_SIZE bytes, and a sub-header
>
> that's not correct. there are 2 ways to get to nfc_llcp_rx_skb() - via
> nfc_llcp_recv_agf() or through commands/locally generated skbs. The
> first one checks against LLCP_HEADER_SIZE, while latter one creates skb
> payload with correct LLCP header size. Do you have a reproducer to
> trigger the issue?
>
>
> > PDU does reach it: digital_in_recv_dep_res() and digital_tg_recv_dep_req()
> > strip the DEP header with skb_pull() after only checking the DEP header
> > size, so a DEP I-PDU carrying a 0- or 1-byte LLCP payload is handed up as
> > a sub-2-byte skb.
> >
> > For a CONNECT or CC PDU, nfc_llcp_recv_connect() and nfc_llcp_recv_cc()
> > then pass skb->len - LLCP_HEADER_SIZE to nfc_llcp_parse_connection_tlv().
> > For skb->len < 2 that subtraction underflows: truncated into the u16
> > tlv_array_len parameter it becomes ~0xFFFE, and for a CONNECT to the SDP
> > SAP, nfc_llcp_connect_sn() uses a size_t and underflows to SIZE_MAX. The
> > TLV parsers bound their walk relative to that length, so they read far
> > past the end of the skb.
> >
> > The aggregated-frame path (nfc_llcp_recv_agf()) already drops sub-PDUs
> > shorter than the header. Apply the same guard once, in the dispatcher, so
>
> that not exactly correct, it drops skbs which are shorter or equal to
> the header, the check added in this patch is not correct then.
>
> > every PDU type is covered.
> >
> > Found by 0sec (https://0sec.ai) using automated source analysis; the
> > missing guard is evident from source. Compile-tested.
> >
> > Fixes: d646960f7986 ("NFC: Initial LLCP support")
> > Cc: stable@vger.kernel.org
> > Assisted-by: 0sec:claude-opus-4-8
> > Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
> > ---
> >   net/nfc/llcp_core.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
> > index aed5fe1afef0..e3b3077e0e83 100644
> > --- a/net/nfc/llcp_core.c
> > +++ b/net/nfc/llcp_core.c
> > @@ -1481,6 +1481,9 @@ static void nfc_llcp_rx_skb(struct nfc_llcp_local *local, struct sk_buff *skb)
> >   {
> >       u8 dsap, ssap, ptype;
> >
> > +     if (skb->len < LLCP_HEADER_SIZE)
> > +             return;
> > +
> >       ptype = nfc_llcp_ptype(skb);
> >       dsap = nfc_llcp_dsap(skb);
> >       ssap = nfc_llcp_ssap(skb);
>
