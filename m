Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731372253EB
	for <oe-linux-nfc@lists.linux.dev>; Mon, 13 Jul 2026 21:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783977362; cv=none; b=RTqLubTS6L6iZOvmUeS0FwKrenmd1dk9p4SMvje40C9zveRwDCbDaISDoIiNuyQ5IdRWVL9000DxlS4HRLEiHhGLz1IQDGDrvM20telSH9nS6CPQZeoPQ/jBl55GraKicW0Og0rR6u7szZ5DxIjSvtz7sVrunIUsfb4fI3YeNKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783977362; c=relaxed/simple;
	bh=OjupI1J8Uf6ZmRz+nFaqT/63B4bo16S2X+GqHuBV27E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b2uR5o+05PGPLBcyxMS+AFGDD9NM/Jm8GGAvHM0+cWgeTGMvu0yB48jpDULfcNyAA9NRzWAI3rlqriRCt3nY4Snnr7AmrcKK8JUNcous9GWPsyKxrHqi9yWp++GsyMpCki1IYtYyrAlJswb6RzOhnoh8IBFnvDiudaSvejtWSBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rkt2UflC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rkt2UflC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c733f15aso33647035e9.0
        for <oe-linux-nfc@lists.linux.dev>; Mon, 13 Jul 2026 14:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783977359; x=1784582159; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2wQJEgASjgsy4yDd4CAOFiJYx60jS5AQH+okUrcyglg=;
        b=rkt2UflC81uA2+aNxqCzc5nok6oTad4O2C9eNOTB3C+rzygrp03yIOW3RaSsA/tuEj
         BqqP58Z4lg7hU2Glm0AXQJVo6L7sMHjcvmrEBr6bl5u9rq4VnSBI/QwBXRAB+tjlPuN7
         NMcKuuIb8Qe3FEUlmP2RgcuN+LjEKR+sBoc9StS9lsKpD8C/pVHb/oI7TP7NlHPVxrR2
         IoC7yIVFEmuGqaEjzq2tfTSsu0DB5ub/57RFpbRt/c/FUcWGF00M4iPlrWSNhf4m9gXg
         fpdA+lZqbnhFU1wN+utLnbwjjCEqc0AkFwOYMINDMOKPET2qozCZ2hcCNTdDuWNDHK8s
         KOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783977359; x=1784582159;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2wQJEgASjgsy4yDd4CAOFiJYx60jS5AQH+okUrcyglg=;
        b=MRXR74qi9s0ADGJWdkCM9wf9SEwcid4F6IrC585AnQOGqKTJuEx4ZxLvGIzuwWJX5y
         IDkSthjE98O/rbKjUMc5RpK6jSEdw/0leAlE7tn2n7TGhGDb/bD+4Tx01ZYiihK079No
         FPQZiRNaJ5QJAT5sdxg8zopmTGBECWO4FBtt8sOscRX3Fj2OCy+Dx64sYo5grd5tUqao
         tFgwaEl5WpjVvUNOIx7AayR38wKzz4NNDSTbzVfzO0ry4sCpXUdYMduKcgQEz2urRPIV
         YkkMZXXKOe38b/mAoC8itNlkCilUVA0jq1BQUoYh04lkiRUTcb838MNNQa7fwy3bRR1K
         ghWA==
X-Forwarded-Encrypted: i=1; AHgh+Rrizy5ezzcshaCqNGs2/e8w63m1nmLjLFSFW6vJW06eSTwQCJcUma0oG9wb2k0uoOjzHfdoHQSK+oIn+mw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5Lo/WDKC4jWAgK8aiIUyVgZWQjSiwUDJlPIwtBMUD+ulsUDmw
	IS+cGnxtiHk7c/eJIxKVRCr0QiXjB1bx7TBW8VecNXxXQow6Ik5NEjgF
X-Gm-Gg: AfdE7clFt79CykRsK1zfdqp6vJc48LVVc+LD5AbUHtkNdgIyamvYBmSVC/04wIVC61g
	rchY00CoQr047jpzJJO6Mg+vLQw2q83RNjimXgWcI3DFV+valTR00enl9oT+8pS43VBv60vKrNZ
	8kfAsNDBNP9zd617nkx1V7KvrZ5LfF97KiR895GW8x6WdrnDHVqCQPR4Il7oyJ+9LOwUQBk25oP
	NidQbJhaEf9Lw7kybHbgUfSmDvemfiHxhLfR58s5uyLJDhZu2p9ovc/B7xnuhuAcj4iw+SECRLD
	iumOmoaJpM8jWbJxc3D1u4LpYX9qnK8SmbTO5Sb1n4rEXLFFoky0nE7SI8DSPzzyCKYHuVqOYmE
	Bo4wqWrhq7oGXhLypB2cXkHExtRQBkuHWFHTsZM2bf7oa04E0Kiae5yHkyHuP528IaHAdwXIycq
	SrBrunepl/KQn5ubeyqjrFMCo6r2oZoi4Ze8aOklULt5myRDnmecGTT1+9sr+n
X-Received: by 2002:a05:600c:464a:b0:492:7083:e5a with SMTP id 5b1f17b1804b1-493f882b117mr72487425e9.31.1783977358718;
        Mon, 13 Jul 2026 14:15:58 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f462e0cb2sm2500839f8f.0.2026.07.13.14.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 14:15:58 -0700 (PDT)
Date: Mon, 13 Jul 2026 22:15:56 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: david@ixit.cz, vadim.fedorenko@linux.dev, horms@kernel.org,
 oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v2] nfc: llcp: reject PDUs shorter than the LLCP
 header
Message-ID: <20260713221556.13a830b8@pumpkin>
In-Reply-To: <20260713155848.55530-1-doruk@0sec.ai>
References: <20260713155848.55530-1-doruk@0sec.ai>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Jul 2026 17:58:48 +0200
Doruk Tan Ozturk <doruk@0sec.ai> wrote:

> Every LLCP PDU begins with a two-byte header (DSAP/SSAP + PTYPE), but the
> receive path never checked that a frame is at least LLCP_HEADER_SIZE bytes
> before parsing it.

Is there a similar problem with non-linear skb?
Maybe they can't get into this code, but who knows what can happen
with unusual configs.

	David


> A peer LLCP PDU travels: NFC-DEP frame -> nfc_tm_data_received() (target /
> NCI path) or nfc_llcp_recv() (initiator data-exchange callback) ->
> __nfc_llcp_recv() -> rx_work -> nfc_llcp_rx_skb() ->
> nfc_llcp_recv_connect(). For a CONNECT (or CC) PDU nfc_llcp_recv_connect()
> computes
> 
> 	tlv_array_len = skb->len - LLCP_HEADER_SIZE;
> 
> as a size_t and hands it to the TLV walk. When skb->len is 0 or 1 the
> subtraction wraps to a huge value and the walk runs far past the skb,
> causing an out-of-bounds read; nfc_llcp_ptype()/nfc_llcp_ssap() likewise
> read pdu->data[1] for such a short frame.
> 
> A nearby NFC device can reach this without authentication; LLCP link
> activation happens automatically after NFC-DEP.
> 
> Reject PDUs shorter than the LLCP header in __nfc_llcp_recv(), the common
> choke point shared by both the target (nfc_llcp_data_received()) and
> initiator (nfc_llcp_recv()) receive paths, so a short skb is freed before
> the rx_work worker is scheduled.
> 
> Reproduced with a KFENCE out-of-bounds read via /dev/virtual_nci on
> linux-next.
> 
> Found by 0sec (https://0sec.ai) using automated source analysis.
> 
> Fixes: d646960f7986 ("NFC: Initial LLCP support")
> Cc: stable@vger.kernel.org
> Assisted-by: 0sec:claude-opus-4-8
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
> ---
> v2: move the check into __nfc_llcp_recv() so a short skb is dropped
>     before the rx_work worker is scheduled (Vadim Fedorenko), which also
>     covers the initiator nfc_llcp_recv() path. Reword the commit message
>     (drop the "same guard as AGF" wording) and add a KFENCE reproduction
>     note.
> 
>  net/nfc/llcp_core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
> index aed5fe1afef0..72b6e707ad0c 100644
> --- a/net/nfc/llcp_core.c
> +++ b/net/nfc/llcp_core.c
> @@ -1565,6 +1565,11 @@ static void nfc_llcp_rx_work(struct work_struct *work)
>  
>  static void __nfc_llcp_recv(struct nfc_llcp_local *local, struct sk_buff *skb)
>  {
> +	if (skb->len < LLCP_HEADER_SIZE) {
> +		kfree_skb(skb);
> +		return;
> +	}
> +
>  	local->rx_pending = skb;
>  	timer_delete(&local->link_timer);
>  	schedule_work(&local->rx_work);

