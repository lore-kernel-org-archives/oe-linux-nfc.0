Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB80337B012
	for <oe-linux-nfc@lists.linux.dev>; Sat, 11 Jul 2026 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783777343; cv=pass; b=Kwy2mC+XLxkkiPT6MJjE04GDWbqRD+7AXRwAa7VgJXr02HFgvc+kpjbzstlyV4mq9dVTh4nlKdTeiAJmlmcwbaHKyA+PsfVCuJshwJlR8xnP1RR+B3L+P9NyuQHzIbtSutu956+0ckn82VH+80Yihg63IsTuQzGeCuR5PJsEjBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783777343; c=relaxed/simple;
	bh=D8wtMsoIg+Dp3XnmklabhldJVDQN33qVcW05TkIASqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajLiFbel4+yXxpZVGnCYP6G7v2ZHd/vrtqCt2lJ8Y7rILZkMpzLIGKMnEOZdLc4y+eKQSMgjVLkfr6xN/uOQrSYNB+3xFUiTcCGw8p70I+Kd0qWm849DyHOLdAUZTDk0u2KRwi1GO0Kx6NGLuzJHR8XZs68eeywmvaXNEiPpKDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=fOqEYdU0; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="fOqEYdU0"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-842338c18e0so1414175b3a.1
        for <oe-linux-nfc@lists.linux.dev>; Sat, 11 Jul 2026 06:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783777341; cv=none;
        d=google.com; s=arc-20260327;
        b=AUqWjOXFoS3sq4fex3o6TffWTclyduc7B7RLyksgOrEm/M00rT5IQAghUA5SdEu5Ce
         Zs0fmGjv/Aiw0Zp7v+RFbmfW6ztrAN7Sbh0CJwE2CWEbAgqfdqFxcLTRbE/BhnA+PUWs
         OTgl6Re41ziGGsQx8OSg62apebErndVTmTLvRgBRUcI+8FvvPczfS8caLjfi6ppVUo1M
         pFgZK0tlcT2ycJBWZUOVAT34jAUGXWYof1cnLE0pKqxnuT0DpU419zAu5jR2qdq6VdfD
         uDkiX68mPqqpGyAH1AHyTXC8o0iFL3fthTtq6M0NAKsvW6Xw9zZOY9uyNTPtoR2iHEjU
         W3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LWfZi4peGV1QTAPmyJSmgBVDR8o+afiQrclwaHx7TKI=;
        fh=lEXZ+fRQZQWWVWp3ZgUOjVt/T3WL9+RZIe2oYWXRjFQ=;
        b=IadfIPSxpsByXwBSc9bmoNdHPQhHw6xBq81BbXW0MZ0ZglIW5d1Sk7kzyMPhagcvpO
         mi1q/iO4lKZE7zMBi2DhWQVsp+yrjr9wLyAdCvcFv6BUyO86UxyJ0SUWs3jAM5XrzJbZ
         kurz0EzgontDeOf2DIftf94LUJ+dKQ4dMbqDeS4gd2bBCVwD4EQWr2vPoIgC5K8poF/v
         HvLqM2Y7nUA4LxiAnvjJM4ARja+ynFEcNR7kyQSWgbpGmznA8fQ834KuYeOx11qQ0v2N
         3L/SW0BG+TcWko3Z6jt7eJdUw/W6eWp2gFrIof85bdqlxMJjaXCueIIh6NwCHoEAUHVO
         SsBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1783777341; x=1784382141; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWfZi4peGV1QTAPmyJSmgBVDR8o+afiQrclwaHx7TKI=;
        b=fOqEYdU0pUDfdKENh0xPsQixDsg5p/AzQe2tNw4xTGmP3VjKJgv/AnBoqpGCUxPOFO
         WwVluuB6S7PEQpJx8a/2XwclaJQ0OaTv4KAVoxKcZA3pxWXe5+fWVHXJN3RGzZpL8sAZ
         RRuoWwmnFlMJTDKc+CKRS/Nn46v8pvi22j4210Lxs5zW3gBsKoObfchY9KSe6TyRIKqd
         +GJ6q8zZEt1az47ISzSySZoNk6Mbf96sFQXzz7nv1La0h8O14Q70hvncL/z29+GGJPSn
         SjkSHw2ODRGN8pqiAOrUCcQomYHg4c5mNdf/KJsmxTmz6FRzqcRb8sRnyXcaPJIZqMxy
         J2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783777341; x=1784382141;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LWfZi4peGV1QTAPmyJSmgBVDR8o+afiQrclwaHx7TKI=;
        b=NN7gZogVpnXGcmEyWfWC7SXfk/ogH1UU5v8XCySp1FigAn9eUw+jkkC6doCcoDFY7b
         rtLal9AGsJZRBJGHcc7QPTkF9n2yX2HjNBKvCa1s7dKsIN05CizDp1s8jXo3o/gYUkql
         WPFSh7i6Dfsr3r/k77toy3uWpqpWMvvcNdpM4A9IU5lRkznoIY7Nnv8+9KWn9s9+CP0b
         Ds0kv/dKjq/XqYXT7+3k0i9ADg2dKd/z8V4rHzyLMWE3FNqbLP03fyICwWFvaJKkDYxy
         DCAmIh/sDXlHtjj2wPgqYQsfTdH/kCUh4TO0qFSNXUczZ7SNGUz9i2xXDClp3qouRAP2
         JPtg==
X-Forwarded-Encrypted: i=1; AHgh+RrYgN32PFURcxI9wQkYpL/jhOHHJNrlN3FL1d72CVAg5qAHFwbKJFCeodNF4Uja8b1qHMPH07MkTvEqVn4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv3fgDVlptLNjU/zsgw+JvHzrXyiKp0APZloLQLSU/mf7gXEAy
	bWaNM6EUYkrQToX3Dcx+Slp2lmMTYKx1m00VeC4MiOeW5lVCKD7wlmxzh2prLuJkU3U1xtuxu5X
	aUboHJmQy2j3ePo5RSjmxbdMXY2OsFSKDnleqqW/3JxU=
X-Gm-Gg: AfdE7cnuEK0mVmDxlre+LFpu2M49M83/sEdUFHG/5dojXaccIEfKNpterqRDPlZGkLT
	7zrTGWO95jBZud6+qmLHRnHe96ejMlsqTzCmZ5yr8ICJPfwB+XyxYXvMNdlOfycy6rtf1Axdbi3
	0Z73gZZARu9/ZvN130SCDf15x74k5UQAmMn3ZGv1tXFPg03LN0nuxlZKysHfYgDtbm2hMSHPDvd
	V3bcnBlB8fpJurfXfStE3HuPHMnDvpl07216YnqeSY/oXpwys06kArnd1qlui0iGZgJT9fosItm
	skIlbdATNwJOWwDSJqD1zClB5phrXnh0hpcaUJY1dOvtiKGZhdQFjQpwgGot
X-Received: by 2002:a05:6a00:1a8c:b0:848:75a1:a0fe with SMTP id
 d2e1a72fcca58-8488964a85fmr2402916b3a.18.1783777340938; Sat, 11 Jul 2026
 06:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260705115607.60844-1-doruk@0sec.ai> <20260710134850.1615092-1-horms@kernel.org>
In-Reply-To: <20260710134850.1615092-1-horms@kernel.org>
From: "Doruk (0sec)" <doruk@0sec.ai>
Date: Sat, 11 Jul 2026 15:42:10 +0200
X-Gm-Features: AVVi8CdLqlNEskOPt8zOhB7HA2eUmFLDg9kfoZTO41kedGPfeu27wPJbVjh2bA0
Message-ID: <CAPdMp1omRz=vFN=CQsiXDbf+5W3SF-F8BGm3HuNeLpp1uS4UUw@mail.gmail.com>
Subject: Re: [PATCH net] nfc: llcp: bound the remaining LLCP TLV parsers to
 their buffers
To: horms@kernel.org
Cc: david@ixit.cz, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"

> Would it make sense to either guard skb->len >= LLCP_HEADER_SIZE
> before the two call sites, or take the same skb_tail_pointer() based
> approach used in nfc_llcp_connect_sn()?

Thanks for the review Simon! I went with the first option in a separate patch,
since I believe the missing minimum-length check affects every PDU type the
dispatcher hands off, not just CONNECT/CC:

[PATCH net] nfc: llcp: guard against short PDUs in nfc_llcp_rx_skb()

It adds "if (skb->len < LLCP_HEADER_SIZE) return;" at the top of
nfc_llcp_rx_skb(), so no handler can see a sub-header PDU and the
"skb->len - LLCP_HEADER_SIZE" subtraction can no longer wrap. With that
in place the connection-TLV parser's bound is safe. Happy to respin
either patch if you'd prefer both changes squashed into one.

Best,
Doruk

On Fri, Jul 10, 2026 03:49 PM, Simon Horman <horms@kernel.org> wrote:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://netdev-ai.bots.linux.dev/sashiko/
> ---
> nfc: llcp: bound the remaining LLCP TLV parsers to their buffers
>
> The commit adds pointer-based bounds to nfc_llcp_parse_gb_tlv(),
> nfc_llcp_parse_connection_tlv() and nfc_llcp_connect_sn(), replacing
> the previous u8 offset walk which could wrap and produce an unbounded
> TLV loop. It cites the size_t underflow of "skb->len - LLCP_HEADER_SIZE"
> as one of the failure modes it wants to close.
>
> > diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
> > index 291f26facbf3..1a0a2f4aca70 100644
> > --- a/net/nfc/llcp_commands.c
> > +++ b/net/nfc/llcp_commands.c
>
> [ ... ]
>
> > @@ -243,17 +246,21 @@ int nfc_llcp_parse_connection_tlv(struct nfc_llcp_sock *sock,
> >                                 const u8 *tlv_array, u16 tlv_array_len)
> >  {
> >       const u8 *tlv = tlv_array;
> > -     u8 type, length, offset = 0;
> > +     const u8 *tlv_end = tlv_array + tlv_array_len;
> > +     u8 type, length;
> >
> >       pr_debug("TLV array length %d\n", tlv_array_len);
> >
> >       if (sock == NULL)
> >               return -ENOTCONN;
> >
> > -     while (offset < tlv_array_len) {
> > +     while (tlv + 2 < tlv_end) {
> >               type = tlv[0];
> >               length = tlv[1];
> >
> > +             if (tlv + 2 + length > tlv_end)
> > +                     break;
> > +
>
> [High]
> Is the size_t underflow the commit message mentions actually addressed
> for nfc_llcp_parse_connection_tlv()?
>
> The two callers, nfc_llcp_recv_connect() and nfc_llcp_recv_cc() in
> net/nfc/llcp_core.c, still compute the length at the call site as
> skb->len - LLCP_HEADER_SIZE and hand it to the parser:
>
>     nfc_llcp_parse_connection_tlv(new_sock, &skb->data[LLCP_HEADER_SIZE],
>                                   skb->len - LLCP_HEADER_SIZE);
>
> and
>
>     nfc_llcp_parse_connection_tlv(llcp_sock, &skb->data[LLCP_HEADER_SIZE],
>                                   skb->len - LLCP_HEADER_SIZE);
>
> If skb->len is 0 or 1, that subtraction (size_t at the call site,
> truncated to the u16 tlv_array_len parameter) becomes 0xFFFE or 0xFFFF.
>
> Inside the parser, that value now feeds:
>
>     const u8 *tlv_end = tlv_array + tlv_array_len;
>
>     while (tlv + 2 < tlv_end) {
>             ...
>             if (tlv + 2 + length > tlv_end)
>                     break;
>
> so tlv_end points roughly 64 KiB past &skb->data[LLCP_HEADER_SIZE] and
> neither the loop condition nor the per-TLV check catches the walk
> leaving the skb.
>
> The commit message calls this out as one of the motivations:
>
>     "Dropping the u8 offset also removes the wrap, and for very short
>     connect frames this avoids the size_t underflow of
>     'skb->len - LLCP_HEADER_SIZE'."
>
> That mitigation is applied inside nfc_llcp_connect_sn() by using
> skb_tail_pointer(skb) directly, but the equivalent change is not made
> for the connection TLV path. nfc_llcp_rx_skb() has no minimum-length
> guard, so a received CONNECT or CC PDU with skb->len < LLCP_HEADER_SIZE
> still reaches these callers.
>
> Would it make sense to either guard skb->len >= LLCP_HEADER_SIZE
> before the two call sites, or take the same skb_tail_pointer() based
> approach used in nfc_llcp_connect_sn() so the parser derives its bound
> from the skb rather than from an untrusted subtraction?
>
> > diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
> > index dc65c719f35f..5e1881199238 100644
> > --- a/net/nfc/llcp_core.c
> > +++ b/net/nfc/llcp_core.c
> > @@ -849,13 +849,16 @@ static struct nfc_llcp_sock *nfc_llcp_sock_get_sn(struct nfc_llcp_local *local,
> >  static const u8 *nfc_llcp_connect_sn(const struct sk_buff *skb, size_t *sn_len)
> >  {
> >       u8 type, length;
> > -     const u8 *tlv = &skb->data[2];
> > -     size_t tlv_array_len = skb->len - LLCP_HEADER_SIZE, offset = 0;
> > +     const u8 *tlv = &skb->data[LLCP_HEADER_SIZE];
> > +     const u8 *tlv_end = skb_tail_pointer(skb);
> >
> > -     while (offset < tlv_array_len) {
> > +     while (tlv + 2 < tlv_end) {
