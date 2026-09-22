Received: from mail-ed2-f18.google.com (mail-ed2-f18.google.com [74.125.228.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA565326B2
	for <oe-linux-nfc@lists.linux.dev>; Tue, 22 Sep 2026 10:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072302; cv=pass; b=iExdF3JXhuSYBkKvgvh1s1FA276hQhE4riVmILfPXgAis3WevjGTh/kCwVO0Gjhh0wXR1h0gwkOSeK7U4+Ept2PvH3Ec8NaoznakIu9u+tXa2+8zdy4VuOiS3FT0c/V2YugcI8BKr/21SUp53mHIfMmtAcI1GIy8XUYCkX48Img=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072302; c=relaxed/simple;
	bh=7msoXiz8ZhQY0jm8uy/r22rhQVLWIg6ZBrWtGTnCYpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OyjEY2j3H+dIGhttL47Q0DEBHPlyQSBgK8l4aWKncWKUF4ZTkt0+HXxbp9yF/ueCtx/cB1o8C/Of3xaMf8qC4Yx4JTsJtTC95E8inEdYGvFC045REUz9YTYTCWDxdxiosRB0Y6QeRy8UI13C6UKtKhaVWxWDqezadeXNWa1OJKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmhghNVZ; arc=pass smtp.client-ip=74.125.228.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmhghNVZ"
Received: by mail-ed2-f18.google.com with SMTP id 4fb4d7f45d1cf-6a9adea43b6so5140127a12.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 22 Sep 2026 03:18:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790072299; cv=none;
        d=google.com; s=arc-20260327;
        b=X9umbt2StWHlSxy12fI4SGCXaLlZi3+AfliXU53v0b5iwY5sKl8QuEHT2Ew4ZkV4wV
         VZMDOo4x6DMeZaU7/3MFIMuWxkXGpHbDqItV+PE17mA+1RnifIF7qzvMx0NEw9xrqxlm
         JI8mZPjtszlpGnrbzcATDIMX6qApcqyzWnIUKDe02eiYwhjOQwwpCA8f4jKkEvkQaH8V
         +WisAfhsYfyZg66S9RhyrKx+R6Afc9Kg1wQo4PacjCow4RwzE/wDgmZYKX12eysJGPh1
         D4mrTD8oCDkzELAfLSifmJKP5KUZJqLQoL/jNuq+i8sTN+N64GnOyz8d/Tn12RZ8m3YK
         Gzcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R3Amu3+PQPJ43Ed9YGF8q4KOUPYdD7wbwNF4u+yNpeI=;
        fh=JSQfA6g4YCRYsLJ0pLUForR2tPvrwU8TO5p4f4WlwXg=;
        b=oFoSZagcKWdbJeh2UkJn6g+kZP6AFo21VspTUzx1yzAzoSip4r4MXK6H5I85bzkg3g
         pSH+4MQp3xqaiJyGgQe9q1eQ2An8h3LSuucTxBl8VVYc/ntbc1MaWuLQmqcgXZM9s7Fq
         3lgKpdXdWsYRrjBkwr/N0Sxw2fWrlTxC2JGABGj1ft8OWzv+i9CJto2ZsA30KB8spUdu
         MEAgfLzPpj90TQuuQbKNHROytYfU0L63pRfMvE6I+ZINo52Me8qFVPvFzm/Du65MPuBj
         XQpj8m94jLDZi7EdcmBAc6c5e6TnG53Vx72uh96/1CQsVhkJaPuzIcERQYa2E/YPVYYa
         r+eg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790072299; x=1790677099; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R3Amu3+PQPJ43Ed9YGF8q4KOUPYdD7wbwNF4u+yNpeI=;
        b=XmhghNVZYyhA6Dd8rktRSltYbJazVJpW651M1TE0UrYqIdEJT+01x+KCPUMA8WtD3X
         ZwYm5u2/GP8WbdsSPG8RybVaIsmfAgko6+oNaAoXw5EOVC2kn4ZxebYT0nYwbMsNfOx9
         O7VThMlcDeU/1L0jjPeKe4uWAal8GFT65rhVetFCto7BiS19sbQXqNdmMJnT0BcYxz1K
         BilIYG3LW8lyvH8/N6S51FE/6hM8HU+xDwLJhDvEmo7CZ4k3OQXFslhokZ+XJodWwb84
         FPpNZVWQszVW1i6x7Dq1boyONX4v4wT7+rkSzkQHUPGnwtHaDkqcVi1AX+Y5Sm4nVMCP
         ymRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072299; x=1790677099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3Amu3+PQPJ43Ed9YGF8q4KOUPYdD7wbwNF4u+yNpeI=;
        b=V9xpeOF6k3g3UcpKfiV4VKF1JRiKsjhrRyaNQTBdl+oCIYa84zzGooQXpCKaSYbQ2W
         EU2fR6Qfeo9yzmJv5rVR5ZMP28EkgdLPqKOhcWnTCOdoqosyvMhV7fRmShiamEaeweu9
         GEQzJ6lEDV7bCfZh7UYD2VfWUs4npddzrkkRdFjBdLYwdvCl4J7caIoC5KZmf5UBYue2
         AXLE/4YSgbNdnYDX+6e19mA0HW7Nh4JahvTEthuXyrsGO2c5kvFCWBfo7PcOaRWWg7rG
         eI79WBeg0GuEyg2ZycWkl1tgbAeJuI/CBkjhyAwygvzz8mzZqSHUAB6qFbF5sH63JjLd
         Mdiw==
X-Forwarded-Encrypted: i=1; AKwUvBx6mCPyfd+Pwdt5rv273EVne1DgxwkmA1F0z66sOpd5UcOIZ1CrVPqfOv1Pl+n3tyBhKnOv17Z1OQIU/+M=@lists.linux.dev
X-Gm-Message-State: AFuF++mXD3tsq1vUsm4U4pBOrh9MpAfMwigetAu6wh9r4xL9U04VhesP
	if0ywVNhWnBivrVMYySTQW/IOsTGhxeW0nAuPW/e/gmF2TeGWAH+HPZU9co45h/FlMTCz2TT9zN
	jm0Dqh0mzNrkljozEmzxw2kHIP2jrtl0=
X-Gm-Gg: AYBFou3Ur+RmK0NXaZWI2MVzpMZEB0XmrPONQeBemXZLGbEiNV/tzWkthHSiAtwV43U
	tF2mOyRKERrqoOz+QKzoAJP5lRZx5Bkzmd8ccZK/fhVTV5sLLsewvgUhB7h+3FxP6vzPuPXveso
	wYN946ow0sp+rb1zPuXWgFQYz3uMdkcRLK32c8XyCB/nF4ARhRv/lv00m9Tk0wxP+jOfqTknwNh
	wiOwCpQ/7dvfEgsMYm7pmEwPF79qZf8cLMjy/MXcaCE0lLatUYRbNDlqqneehBeqd6ixJcxx5OK
	1ie2JZhfiWrdZmyPTIjwsV5Kzo+KcKOTpi22cLPbBJH6oJnZS76PDnF5
X-Received: by 2002:a17:907:7244:b0:c29:4490:50d6 with SMTP id
 a640c23a62f3a-c2a15cc7b3dmr1214184366b.47.1790072298525; Tue, 22 Sep 2026
 03:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921125805.224979-1-horms@kernel.org> <20260922080750.35929-1-ndaugoing@gmail.com>
 <049e03e2-3648-4a8a-8959-d88a56545f4d@ixit.cz>
In-Reply-To: <049e03e2-3648-4a8a-8959-d88a56545f4d@ixit.cz>
From: Yuchao Zhang <ndaugoing@gmail.com>
Date: Tue, 22 Sep 2026 18:18:06 +0800
X-Gm-Features: AcwNN1U4xZeDysD8F_-uIUOnyy4axDXfoxw1BjtNX_Q8SmqiH5PTE1y2i5vEhBo
Message-ID: <CAC2BP3+s=vGTxUrTALO3Fq+kUJODCpCdbujwkFK5txL9GFk2uw@mail.gmail.com>
Subject: Re: [PATCH v2] nfc: nci: ignore unexpected CORE_RESET_NTF and CORE_RESET_RSP
To: David Heidelberg <david@ixit.cz>
Cc: Simon Horman <horms@kernel.org>, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, oe-linux-nfc@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

Thanks a lot for the pointer and explanation! I apologize for the
threading confusion =E2=80=94 I mistakenly chained the v2 patch under the
previous review message using --in-reply-to.

I'll re-send the v2 patch as a clean, standalone thread right away so
that patchwork can track it properly, and I'll definitely adopt b4 for
future submissions.

Thanks again for keeping me on the right track!

Best regards,
Yuchao

David Heidelberg <david@ixit.cz> =E4=BA=8E2026=E5=B9=B49=E6=9C=8822=E6=97=
=A5=E5=91=A8=E4=BA=8C 18:05=E5=86=99=E9=81=93=EF=BC=9A
>
> On 22/09/2026 10:07, Yuchao Zhang wrote:
> > Commit bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
> > added handling of CORE_RESET_NTF in nci_core_reset_ntf_packet(). When
> > received, it updates ndev->nci_ver, ndev->manufact_id, and
> > ndev->manufact_specific_info, and calls nci_req_complete(ndev,
> > NCI_STATUS_OK) to finish the pending reset request.
> >
> > However, unlike other notification handlers in ntf.c (which validate
> > ndev->state before completing requests), nci_core_reset_ntf_packet()
> > does not check whether a core reset request is actually pending.
> > If an unsolicited or delayed CORE_RESET_NTF arrives (e.g. after a reset
> > command times out or from a misbehaving NFCC), it unconditionally:
> > 1. Completes whatever request is currently in-flight (such as CORE_INIT=
,
> >     RF_DISCOVER, or CONN_CREATE) with NCI_STATUS_OK, leading to kernel
> >     state desynchronization.
> > 2. Overwrites ndev->nci_ver and manufacturer info. Because
> >     ndev->nci_ver is used as a selector for subsequent packet formats
> >     and parsers (e.g., in nci_open_device() and nci_core_init_rsp_packe=
t()),
> >     unexpectedly modifying it can cause protocol format confusion.
> >
> > A similar issue exists in nci_core_reset_rsp_packet(): an unexpected or
> > delayed response packet can prematurely complete an unrelated in-flight
> > request.
> >
> > Fix this by ensuring CORE_RESET_NTF and CORE_RESET_RSP are only process=
ed
> > by the core layer when a reset command is actively awaiting them:
> > - Set NCI_RESET_PENDING in nci_reset_req() when sending CORE_RESET_CMD.
> > - In nci_core_reset_rsp_packet(), ignore the response if NCI_RESET_PEND=
ING
> >    is not set. If set, clear the flag and complete the request on failu=
re
> >    or for NCI 1.x (checking skb->len >=3D sizeof(*rsp)).
> > - In __nci_request(), ensure NCI_RESET_PENDING is cleared upon request
> >    completion, cancellation, or timeout.
> > - In nci_core_reset_ntf_packet(), skip power-on notifications (trigger
> >    0x01, identical in NCI 1.0 and 2.0), then check and clear
> >    NCI_RESET_PENDING before updating device fields and completing the
> >    request. The CORE_RESET_CMD trigger value is revision-dependent
> >    (0x00 in NCI 1.0, 0x02 in NCI 2.0), so both are accepted and gated
> >    on NCI_RESET_PENDING alone. If unexpected, log a warning and return
> >    0 so driver-specific handlers (such as fdp firmware patch handling)
> >    still receive the notification.
> >
> > Fixes: bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
> > ---
> > v2:
> >   - Do not abort the notification pipeline on unexpected CORE_RESET_NTF=
 (return 0
> >     instead of -EINVAL), preserving driver-level hooks (e.g. fdp firmwa=
re
> >     patching) per Simon Horman.
> >   - Skip power-on notifications (trigger 0x01, identical in NCI 1.0 and=
 2.0)
> >     while gating both NCI 1.0 (0x00) and NCI 2.0 (0x02) command-trigger=
ed resets
> >     on NCI_RESET_PENDING alone.
> >   - Check NCI_RESET_PENDING in nci_core_reset_rsp_packet() to avoid com=
pleting
> >     unrelated requests on unexpected responses.
> >   - Explicitly check skb->len >=3D sizeof(*rsp) in nci_core_reset_rsp_p=
acket()
> >     for NCI 1.x handling.
> Hello Yuchao,
>
> please never send follow-ups as part of the thread. Always send them as a
> separate message (otherwise they may get lost and we already have patchwo=
rk wich
> can track the submissions.
>
> Even better, try to use tools such as b4 to submit patches (easier for yo=
u, sent
> in expected format for us).
>
> Thanks
> David
