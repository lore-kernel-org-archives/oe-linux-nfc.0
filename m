Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62263DA5AE
	for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 07:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125714; cv=pass; b=LbGwqtf1YBHdjoJeiLOI0BtWncPcFwNdxzFhhY3CnuTSZk0di/QlzWSIRh1qo3aRHeL9489iu78WWsNKoPmCf4SelSHxYVI8pHgsXAG371O8LsXWO0Rib5oxP1GEzJuuPQRUCs6lWR+dhZvG+D0Ih+ienJENdbm0y8R2hLtCquo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125714; c=relaxed/simple;
	bh=2BAe7W6OpUvj4ptW1kz/B6OcD4IsQZBqUZaj8aMteWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWK1bYCFRTyR3Pa2DivXmgHyFPuSVG8aSH0bv8OaIUL5ED3DocwCldlb82g6SBZ17123Kc4t6Cieyir6jPYE24nMD30PDS6aMdCzOxT71Fjp9CFqPKh1kOHog/FdtFC/fLVp3k5GWiewdyzoSM3RZxd8yhzHZUh2cxmBLo+GqWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LdTSnk8t; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LdTSnk8t"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c2a449c57so4271691cf.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 19 Aug 2026 00:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787125711; cv=none;
        d=google.com; s=arc-20260327;
        b=rIq+6KwumrTXdoEGU2iE4K6BG9p+m6ye8Of4SFN/QX9R/YUqD2WU0PvHKQrxxUdbKN
         UQ4JxYhVo5I4KicWKUBQJJLIxYOU7dlSBFZgiHKj1jhKHrMHLLGXuLPJ2Pt6C09lUN1a
         Xog1XjHQWP3mBQrhAx9qPYqRAqa3eh9Vm1FQ8RuQ4M0YJ03JBYbIgWcd0JK7YDftx6tI
         5keTM5whBYOe0QmehyalrNFPHT44jdwqY5XacPlqtoWLMHY0DJLE2wYLC7cyaL7x434G
         Pg6dkrTTO8xcRgdFXHR9GnZImlL64uvRyssuahqCpANi+vHgp4R5IltC200QlCXIyXaR
         sKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X0AAFuTc80Uwaikl2Snr7zZKN7yn52mjvtgyxxbS9MI=;
        fh=OYyoqCOTDoVKjNJxoFrTkGrKGKSGBH9HEnpMIPCf2vI=;
        b=QfWi25QPoo1P58fUogxzfMCHFO0OYFxILoHP/zJ/9Rc8a9UIdRqdAtnWnWmV/jBlA7
         Z/68pRxIMlq4UfHZPehP+xMwC+E4TEFo61CWTAqIvlCPjrLRdb6w4kxsGRCbQkvlgb5W
         dvHTAJcEHqsFSPA87RSRjMaFu/DXwZ0pY8F11ox9ufbp4jq9XVYByaqs00NR6Q1xGjvj
         n0zhD3gdCJtxvCD5MU6ZCallu4/fBvjEpK3IMRwvMiGi8aCeMTAgt/g/rVemmUOeuXLS
         WL21Mb1qJ9ASKlIrRH2aPf6HkSWx3s+/KEIJtdHYHDIzpRa5HTbTav+Wac6Kvn4ejsW4
         5AJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787125711; x=1787730511; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X0AAFuTc80Uwaikl2Snr7zZKN7yn52mjvtgyxxbS9MI=;
        b=LdTSnk8tzbmRixMutGZBLSu5jYpOB5KmdoYQ7A99x74S62+wD6b3z0lgnQf7cIhZw2
         Ezfog/gXEtTu+cIte5yyyViFiPK6Ym4elkeQT9Y1vHj4ITlWPwo/mpuR8/pCE09/Dx9Q
         70gKDYVSvdENt66mkuEQ8uCYuEqmQLcl1FT5yyPXybhNXxl2wvo5dnVTbm4J+xwUrfAh
         2Hpgrun9IKhuQALh+GqWmdN6RALK+MRF4vmrRkuQbYqojLmy7drGDCYdjmBn/uL1dtCE
         /Xl5pl6yCklzGzU9kel0y/rqTvI8VMeViRjfOM7P5dJe9bOHV8pbB1t5HgqEqxXwvnq1
         JYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787125711; x=1787730511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0AAFuTc80Uwaikl2Snr7zZKN7yn52mjvtgyxxbS9MI=;
        b=VVMR9Pt8HVgy3RiddkXZF0usG5gthftWVgFvn3U8aiBUinXw2gbWqCynPNpxzy4jqr
         jyBKlDCNR242E57SC0PNtlzWSKXxuvXjEW5aak/IjJGLV3FfmHyQF1JMiQwECciRTw4r
         Si/Ra0xlv154BLBg/Obwt+u3AgA4iRduhEkXt7kwoKsvcwm++5+cbqPy9i/I64VwZr30
         TXBE0bj4Z1myv486VkR7X/FNr6oFEk1TUb3svjWGqkoRpRHVTURyw/TAZYiFrEFhHbh9
         XfiC4A3dcyOeod05tNKTUKNzBG0OdNMHrItwhmhmbuoZ+2Nog57NrP4maZB2NJc/VZsc
         WX0g==
X-Forwarded-Encrypted: i=1; AHgh+Rrkhvzt+g7sfzzHsvNbFPnfoCoF2D+9BVMzi3XTG+24oNbam+tRzrfRm42wxioRa0/CSXgZzD0hiHj1lv0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9A8EypCl6kDepOj3DqrnyokikxUzS4ZDcgJ8dgOBG1bbVgdgA
	Jj/tVxsJoSN2CWGfN40eV8yvB/ijuzKH5cSHwY9levyXgqtzz8VtvjcYx2oUCeRYU9Ux14sE3nF
	q40XLrwd5wN9n9nY9kzXjJdUezEQYMFYsEJJj/GuP
X-Gm-Gg: AR+sD13mFJKrKSUgtwQzCid2Xb6h8hIkk1jIh13InrgfTu7RT1QaD8BkUEohGUOMsS+
	bMt++/i0Y+RmOF2THJwI3No2t29XJDArmyyjtLQOR6V4ngrwGrZ+MhLK4WeT+JBobajJ7Kxu9EO
	8/ioNBgoAES9zVxHBInDyCuUpNkrJDJngUUflTSgkl3PRBw31sFAm5tMg/TIBvyFfhszPHdcFWX
	I2iVMOZwJI9oEzlLKw+xbdB7M9Tm9l9q8N6ZmkSbUUp/SuJrBevdERzNlRY2Qil5uWEjunKsbBi
	Tm7DXMTrbyOA5nLCS80G7tzADmToWmM1ylL+kZ98jz7sWbLXGLtEKlpvZt7WTqGwH9WCaiGfivq
	V9IEkq+FFP750n2vJDRqnhvlRAdZezLGD0L1Az6glZr4UzSYU0jp9IsrbXC/SN8x43z3ZLGOOVT
	CgWkdaxzyPiRji5kw=
X-Received: by 2002:a05:622a:481a:b0:528:162e:29d3 with SMTP id
 d75a77b69052e-52dd5cdd931mr22514351cf.32.1787125710173; Wed, 19 Aug 2026
 00:48:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819050031.2725592-1-shuangpeng.kernel@gmail.com>
In-Reply-To: <20260819050031.2725592-1-shuangpeng.kernel@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 19 Aug 2026 09:48:19 +0200
X-Gm-Features: AcwNN1Vpw90qqb3J8EoBm6ha5_Or8qEMqxARLr7SDwaxYI9pi-np6kKRz7lTCFg
Message-ID: <CANn89iJbOs54esoGSukvMiYnXQkHadnC7NgQanbAXOeiHXOsjg@mail.gmail.com>
Subject: Re: [BUG] NFC: slab-use-after-free in _raw_spin_lock_irqsave
To: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 7:00=E2=80=AFAM Shuangpeng Bai
<shuangpeng.kernel@gmail.com> wrote:
>
> Hi Kernel Maintainers,
>
> I hit the following report while testing current upstream kernel:
>
> KASAN: slab-use-after-free in _raw_spin_lock_irqsave
>
> on commit: 3aa1dcaa4f6f5ae08936491e08bd456f331f2d40 (2026-08-13)
>
> To help trigger the bug more reliably, we applied a minimal diagnostic pa=
tch
> that only adds delays and print statements.
>
> The reproducer and .config files are here.
> https://gist.github.com/shuangpengbai/f7dab4725e2a2d57b1d302714c93c549
>
> I'm happy to test debug patches or provide additional information.

Thanks for the report, could you test adding one skb_set_owner_w()
after the skb_copy() in nfc_llcp_tx_work() ?

Something like this (untested, not compiled) patch.

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index cac1b5487064d0c5b4966bb6a75aa26e67131049..49cb632268c0c2841e3b44dde12=
4c7966267b709
100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -786,8 +786,11 @@ static void nfc_llcp_tx_work(struct work_struct *work)
                        print_hex_dump_debug("LLCP Tx: ", DUMP_PREFIX_OFFSE=
T,
                                             16, 1, skb->data, skb->len, tr=
ue);

-                       if (ptype =3D=3D LLCP_PDU_I)
+                       if (ptype =3D=3D LLCP_PDU_I) {
                                copy_skb =3D skb_copy(skb, GFP_ATOMIC);
+                               if (copy_skb)
+                                       skb_set_owner_w(copy_skb, sk);
+                       }

                        __net_timestamp(skb);
