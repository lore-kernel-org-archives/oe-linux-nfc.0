Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEAA4C0424
	for <oe-linux-nfc@lists.linux.dev>; Fri, 21 Aug 2026 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787322089; cv=none; b=dN22a7fTz9at5Pi/R70XCfA2etjHalyh1sEQGssWezQN09tSg2eQjCLmygj2dQi/tBeQwA0WNvSVRgG62oZFpnGgEjBUjwG6Ama4l9dXP6IcrU2aSGDHoyGV3XPO7HPx4MDJDXXpgR76NCAIPyu0AHwTR9bCiw3wCbR3TWRfbJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787322089; c=relaxed/simple;
	bh=swPCRg0mE4H3SHLdPEqXkupOTDy1ncDa3bxxkpac4lU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=aQToDclO+8XtKhRorxgc4SpBvP32zEYWPdMj62iMnLQD1PnwSbcAuNPU08L4Tn/AjqjWGpF/W4VL4bRjb600hSHLfTwrF7XbhhIIC0bMfx3e2ck7PM7xm6lIgKkHZ1D8brvvG31GYr8rkf8WFVsarLQqwHxaJ4exp9KWRE64mqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSUdDaSA; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSUdDaSA"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c0cea8883so8348361cf.1
        for <oe-linux-nfc@lists.linux.dev>; Fri, 21 Aug 2026 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787322087; x=1787926887; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lTuRd4xQT37Jqul00lElcHcBakjw1tAhFp/7eCwHpYw=;
        b=KSUdDaSAqPnng3W7xvmaXH/6/hZEYmEwLX+24J6rmS0wmI4kpi1PcpQ9mWuoFT8A78
         kUVPJ4Bkm+z0uGdfYQs9cgoNqDcd8YWdK4xFzdSYJm1LcKFxh718ppJKytk/hksgxqyF
         kSzqjtcFQO3JcBxXDx1K90tFZT7mpmaKkO2E1tFm+731DN1D6lSBzdnKMSZ1H0ETLlUv
         xymqFJNx/n5GWNOqNxqmKIS1bjHuXrQkrrIICn2U/XYvjjSefZwIaCl9MRS8qyzk8Pka
         NdhfQGlkhl1opjwYwYukfEAhu1zOWe5tC/OkM/h7u/U7l6GCu+VUboEEnVlg5N4u7Ft6
         1U1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787322087; x=1787926887;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTuRd4xQT37Jqul00lElcHcBakjw1tAhFp/7eCwHpYw=;
        b=Pn8Dc7P8xIF2dJdlOeSTpPJvBEmQyjOFmIT0W6p3s6eqARI4UtLjLFoQRcQQCcoYOv
         KSdqjs9Mk5Rsr3Ap1C/jBotWAyynnIy+gnPF73lipqkqBXqHKnL4AJXHvrAnssbuIyJB
         0jLdfiiZi7f6TkKVEUv1zMXoWBHqYVVFScvjVm/DMCV/OKKYa4U3w7ELhlersaZC1HZh
         TTG4tlrwEQncq6XtGgEDe7Ug2gvRPfq7+h+suPaWGgNU9JVcDoUDI0jIp4LE2rXEkMsy
         hlzhywpr4dxqz3c4O9At0dhx+6QDpQ18IGroLHGwi7VBsUCNkqhD568fPqOBSrIDDH/x
         QCoQ==
X-Forwarded-Encrypted: i=1; AHgh+RooqCA41s4szIhyNffMcSpkZr+Op/zE+J/Yp9bafITE/gkZgWnoyfwzEYyimq7f/EG/e5M+BJ1OoNkNBL0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxorgt7YTDp2RygoZXgP67culycplSlXhas2xKr3p0sZg9GwFun
	i70qK4v/QN4OFH3g7wJj5Dxky7lMKeuRCirZdNrJ+XEla6retzPqaKjE
X-Gm-Gg: AR+sD12oajh2JfBEK0A0pLeLr4ctfGRpYxN3LXHr2+DLvfex0t6j7VS88+PYt28sDOI
	uNHTMcFVp6yjKNYS8GP+x/lM10ClNr0zo/gygugB6h7lZs7qjksp/7+8320CDzqCN3PyrjgrP/q
	FJrECaCINjU+Biw7fMu8FC920walKyemtGCDdD47rnAaFCXUaJoshpJ5xQyTVzC9rUMtRv8jhbp
	60k6+hsrxosfNnkD87aSLl/DrBstiMaRN9KUaCNbrdEcNimmqAEDQ0oc4U3SFBfWLuTez4URz5S
	HHtMaIcVgUAqRJU/fOYFax0N0mK3TwrPyBiQJMl3MrXX+9Hn2cUmKQWwE3HvaVVcYJnJMWlSSBs
	KWm7kRRSTjV9DGe0kRI3IhKmz4SgpAeLdTCkNbWfrIaiASeqfG3/76bCnIbBshf+h1eRsutwPst
	1Zc7F4/NFGuIjEJPUyFyvSf2OJLEj4iOSQfjo=
X-Received: by 2002:a05:622a:1904:b0:50e:635b:5562 with SMTP id d75a77b69052e-52df676e1a9mr48704461cf.22.1787322087254;
        Fri, 21 Aug 2026 07:21:27 -0700 (PDT)
Received: from smtpclient.apple ([165.85.199.100])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52dd857b6b1sm51365781cf.3.2026.08.21.07.21.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Aug 2026 07:21:26 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH net] nfc: llcp: fix UAF on socket in nfc_llcp_tx_work()
From: Shuangpeng <shuangpeng.kernel@gmail.com>
In-Reply-To: <20260821141358.3546366-1-edumazet@google.com>
Date: Fri, 21 Aug 2026 10:20:53 -0400
Cc: "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org,
 eric.dumazet@gmail.com,
 David Heidelberg <david@ixit.cz>,
 oe-linux-nfc@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <CBC379D4-4F31-422D-A81A-0E88EED9CC23@gmail.com>
References: <20260821141358.3546366-1-edumazet@google.com>
To: Eric Dumazet <edumazet@google.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)

Thanks for your patch!

Tested-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

On Aug 21, 2026, at 10:13, Eric Dumazet <edumazet@google.com> wrote:
>=20
> Shuangpeng Bai reported a slab-use-after-free in nfc_llcp_tx_work():
>=20
>  BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave
>  Write of size 4 at addr ffff88811da9cb94 by task kworker/0:0/9
>  Call Trace:
>   _raw_spin_lock_irqsave (kernel/locking/spinlock.c:166)
>   skb_queue_tail (net/core/skbuff.c:4114)
>   nfc_llcp_tx_work (net/nfc/llcp_core.c:848)
>=20
> When transmitting an I-frame, nfc_llcp_tx_work() creates a copy via
> skb_copy() to keep in tx_pending_queue. If the socket is closed
> concurrently, freeing the original skb during nfc_data_exchange()
> drops sk_wmem_alloc to 0 and destroys the socket before copy_skb is
> queued to llcp_sock->tx_pending_queue.
>=20
> Call skb_set_owner_w(copy_skb, sk) to keep the socket alive while
> copy_skb is queued.
>=20
> Fixes: be02b6b62400 ("NFC: Queue a copy of the transmitted LLCP skb")
> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> Closes: =
https://lore.kernel.org/netdev/20260819050031.2725592-1-shuangpeng.kernel@=
gmail.com/
> Signed-off-by: Eric Dumazet <edumazet@google.com>
> ---
> Cc: David Heidelberg <david@ixit.cz>
> Cc: oe-linux-nfc@lists.linux.dev
> ---
> net/nfc/llcp_core.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
> index =
cac1b5487064d0c5b4966bb6a75aa26e67131049..49cb632268c0c2841e3b44dde124c796=
6267b709 100644
> --- a/net/nfc/llcp_core.c
> +++ b/net/nfc/llcp_core.c
> @@ -786,8 +786,11 @@ static void nfc_llcp_tx_work(struct work_struct =
*work)
> print_hex_dump_debug("LLCP Tx: ", DUMP_PREFIX_OFFSET,
>     16, 1, skb->data, skb->len, true);
>=20
> - if (ptype =3D=3D LLCP_PDU_I)
> + if (ptype =3D=3D LLCP_PDU_I) {
> copy_skb =3D skb_copy(skb, GFP_ATOMIC);
> + if (copy_skb)
> + skb_set_owner_w(copy_skb, sk);
> + }
>=20
> __net_timestamp(skb);
>=20
> --=20
> 2.55.0.766.g2966f0265a-goog
>=20

