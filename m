Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793879658;
	b=NV52ptv51KM7RAcImKfWICb8IETSnFQPy+g+minhpcFtK9p1h4bZOd3oxFuHLy6DGwb6
	 b/IeP5/5+kXuxhQXrGZ85UQtmc+eYwUx2SiVMYAJuOStqD31493Pp4yLcbMQ9gvbmPdS2
	 baMru0TnyOSvhJs9uFjrCq5blUl04y4daJN3aWske9GKsdJRsOTFVMKHzOemJ3xkjzSRP
	 lt29xQ1OkKwZXcLJFQu43P2dfR1n5+kuxQMFnahGuzp9iPNPFQJ3BggbVxYA/i3j+91mm
	 avGnZAGG62priS4u7pf6r/rIgL0wOhkUdJThuK9wxJJty9KWwvJctM8jLYTt2+T0IMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:In-Reply-To:
	 References:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding;
	bh=N+3m3vZOzUEGlHuUM9OVDnQH8LQ3Rban+sBZHH4tE00=;
	b=lecpbQZ1FMs+tdUM8Ggwxcfwt8Muz5mH2o4f84GZck3o5UmarrOZ5aa6S89w6tiSZMbf
	 BwehwJh8MKXYfqBWOXAMrxPt7Sb0IdGLIztLGQ7kh4ATd6LSLPczjWNrzlCpnsk02L2tF
	 xIOw2oKwM+KfQznDBC/9khIZhpvwT3afcf2uJuy/CM1Agc/jLnC+6RANdfbhYYSBHFqeQ
	 UERsqa9wny+Sxv837xIbCCPfCeh9ypUNtNaSj1Brju5pTRUXaF0kywIUOAlUiV21H/pdv
	 tjx41kY73HXdnFJBa7QjL4OD5YPuEL1+pIq/4HO8HH1xUIm2iNXwig/4G5yg29iaRSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=os7a3LLa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0CA606A33F
	for <oe-linux-nfc@lists.linux.dev>; Thu,  5 Nov 2026 11:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD0CA606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=os7a3LLa
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ac99992373so14988201fa.3
        for <oe-linux-nfc@lists.linux.dev>; Thu, 05 Nov 2026 03:54:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793879656; cv=none;
        d=google.com; s=arc-20260327;
        b=U8WZ9o7f4+szjRqBkUM3/iIFBYimkwUAoKBMpXom0ZVjivYnkgrn9tjr4CeSJjT2dI
         XzfiXWIRXvOKyYT6Y8YwEseL4eEjH2M4f5c7UUk/rXO8K51FKM9QdV8664t+S+kcip5Y
         3otv+t5fQkf6YSBcvH1QwYNF0u5wqfUDjjpsEyCsSc+bS94LNI1YomWhtvfiCOA95Vvz
         Wm6A8UKz3eq9IcXlZgaaJZZN6bOGYeRoOinL9vKPortAjQYGmfvEvoemeZawVxnyEZwr
         bV/KSdTinbP16hW/Z+nvInLYyBlWnH79fOHlFUQ3k2T+B9DFi0vpJ9EbLfPoFxMuT4rT
         UHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:dkim-signature;
        bh=N+3m3vZOzUEGlHuUM9OVDnQH8LQ3Rban+sBZHH4tE00=;
        fh=p4H8V/H/uxIefnKjtAGdgFVIvte+I7obBdsLpOSyMOg=;
        b=kRkfNroNklQsOR4F0SsufX8wnkQZHIesj4IdfmzQBhdNuWYX6JfQMxIMcblFy+h7qF
         q6FyA05aUWvy7DSkM0L0KISTL//Tv1sK2Y7EhDdugTNLscXnA80Qje2Y/RDkldPoYEoP
         aL9382uT0HOnhUtKui1Eb7Wv7vX5xaGjLn/2k63FNimJKhvZ7eZs3yWj+G5ByX4IJhvE
         4a8Kc8aN/jceasrVaBw4Fbg4YIrHUbikjgd7cj7YtcYwbymGbp06LwiowS8KSHCuVVVC
         PIlQRB+zMih9/BhrWaw9lLXI4P65V6AgDTa0ZBnQxVkQBFxJHIefldxlq7NYoS/IdU8q
         hPOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793879656; x=1794484456; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N+3m3vZOzUEGlHuUM9OVDnQH8LQ3Rban+sBZHH4tE00=;
        b=os7a3LLaBrU6ZNXFtDTfp6/Ghwa75i3kvxF72SMFzPCc1lt2/rrxSFU8buxqcpi748
         jXF09bhL5niQXTIndarsxtOmgzmISH5gnKv1c3qAe0MDGh7AEoOdMwg60dl+zdsq/K2T
         BKClFARd7lkGwtgzITvg3BVexnY4QYh6B6Iw53rOy0J2V+Ep7fVm3itBWs5ENuMetLig
         uLakWT2GUl9Lwmi48GbO91qXH6ZruLpyq4m1KaWWn7fXkcQ7EQdJmXGnH3B6zIA/1mX3
         /ivHzLcGiQTkBEF+gAnInT38CQPxxtknlx4NwaMURbl71Im7cPPNNZQIQ08SvnBjiGlf
         dIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879656; x=1794484456;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+3m3vZOzUEGlHuUM9OVDnQH8LQ3Rban+sBZHH4tE00=;
        b=gAhr7r7jdwwhAPN2Yquw07k/L6vHAS3Ak+6BTyN4hJV+W3Z8Zm18+bf/1bIq+BimxG
         Ej8RdJlobrVsZwG5zNsXrScpqgaHC+sVlfq3Jj6rGTgsTaYJd6GxLcWQifFfYPQwswoD
         VQ8dMmCIoAq2kODlB5zpP5SZNSjlh/QtYWV3jXUSH5WcbNDQJP2m8Mg9XydHSbb8MA3s
         kmUrsYZdcUMD0kZyzOXYumAEK9nong84cDeKxvvXwj/eM+fLcD1dhfw3R/sbkiPAJvwX
         Ksvjs4Kwx4PJ2RnBvcal9lVWmg0wUrpxleRAyJ7ySdQzUy5kxT4cqvueenUwfWY6mg5f
         eXQQ==
X-Gm-Message-State: APuU4Z95FnK5T89xC9FpioETIpnAF3Fy4i19D1TXtfyCnak3UODKuI+j
	W+2Bfz00YaqAD4Ma6j9zqqVp8/KO7KgnOup5Y/9T4VyBV0nEYBJW2Wk2eDhveS3fcXbb5QdMuST
	+SMsqTFNG6XFIVFVQnfWsz52KXASdf1vditL4
X-Gm-Gg: AYBFou2bBnueJt/9VEgVXEaZ8eU/jWfje9VMW5hCS/89DuyZZMfKlRDVWluHPNY5FsP
	T6EXeW8bNg7LhM1PmGKjszQObkMQ0JysqYpKpmFSR3CRn93OFmPVOrr70qFc1704afV1x1M7MGs
	np07qJBkaOIXDPE029Loa9UAsEsUNaMlVChsFpuBxFTsF40Wo/94AzaLTYEh8+oqsV8af0QFu74
	uAk/a4LH3gYcVa/aiDfg624mcaKZBdk1JCC6bCaD1lS+Vv+nGfOd0yV5c0dpamQPxfDHD2TQqdJ
	bIGTvuG01Jfj/sbVyuU1l/jJYaMR2fdxQWY71h/FENEKdvvQROZ3vV+mLhbatqIJ6XimHoi2UEZ
	v9FTOcmhuAWMkPYgKRnl/r0a7NxvRIMb56AQ24S8oO2Dt6asOEvVMFfHu5qzCwgQjng==
X-Received: by 2002:a2e:a809:0:b0:3ab:4a7c:7a65 with SMTP id
 38308e7fff4ca-3acb7883d20mr40938051fa.0.1793879655702; Thu, 05 Nov 2026
 03:54:15 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 06:54:15 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 06:54:15 -0500
In-Reply-To: <179387271921.488856.11043838083216323158@kernel.org>
References: <179378590950.74297.14503648624087894519@gmail.com> <179387271921.488856.11043838083216323158@kernel.org>
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: zhang san <shunsheng1218@gmail.com>
Date: Thu, 5 Nov 2026 06:54:15 -0500
X-Gm-Features: AclHuK_PjOfwrGU7V8tuY37Lm8UZo8c9leNmigz8_H-PCKcm9vybXrcGuzeOckY
Message-ID: <CAGTEBTZztQcrwJC0pECO=vmn5xZv-cY_OZnSLVBL_9Kt0OzfVQ@mail.gmail.com>
Subject: Re: [PATCH] nfc: rawsock: prevent TX work requeue after socket shutdown
To: netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev-bot+sashiko@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I am resending my response in plain text because my earlier Gmail
reply contained an HTML part and was rejected by the netdev,
linux-kernel, and oe-linux-nfc mailing lists.

The issue was identified during AI-assisted source-code review and
investigated with a KASAN-enabled kernel and a deterministic
timing-injection harness using a virtual NFC device in QEMU. No
physical NFC hardware was used.

The High-severity finding on v1 is valid. rawsock_release() set
SEND_SHUTDOWN without holding sk_write_queue.lock, allowing a delayed
completion to requeue tx_work after cancel_work_sync() had returned.
In v2, release sets SEND_SHUTDOWN under the same lock used by
rawsock_data_exchange_complete() for the shutdown check and
schedule_work().

The Low-severity Fixes-tag finding is also valid. V2 uses Fixes:
d793458c45df ("nfc: rawsock: cancel tx_work before socket teardown").

The timing-injection test produced seven slab-use-after-free reports
with the v1 locking and none with the revised locking under the same
conditions. We do not claim that this patch eliminates all potential
data races involving sk_shutdown.

V2 was already sent as a separate thread:
https://lore.kernel.org/r/20261105113812.969651-1-shunsheng1218@gmail.com/

Best regards,
Yaohan Li

pw-bot: changes-requested

On Thu, 05 Nov 2026 09:58:39 +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The fix is still racy, so the use-after-free it claims to close
> remains reachable.
> - [Low] The patch only works on top of commit d793458c45df2a ("nfc:
> rawsock: cancel tx_work before socket teardown", 2026-03-03), and the=E2=
=80=A6
>
> --
>
> nfc: rawsock: prevent TX work requeue after socket shutdown
>
> The patch makes rawsock_data_exchange_complete() check SEND_SHUTDOWN
> under sk_write_queue.lock before it reschedules tx_work. The goal is to
> stop a delayed data-exchange completion from requeueing the work after
> rawsock_release() has started tearing the socket down.
>
> > diff --git a/net/nfc/rawsock.c b/net/nfc/rawsock.c
> > index f7d7a599fade7..efdbd512d4600 100644
> > --- a/net/nfc/rawsock.c
> > +++ b/net/nfc/rawsock.c
> > @@ -168,7 +168,13 @@ static void rawsock_data_exchange_complete(void *c=
ontext, struct sk_buff *skb,
> > goto error_skb;
> >
> > spin_lock_bh(&sk->sk_write_queue.lock);
> > - if (!skb_queue_empty(&sk->sk_write_queue))
> > + /*
> > + * The release path sets SEND_SHUTDOWN before cancel_work_sync():
> > + * once it is set, do not requeue tx_work - the socket may be freed
> > + * right after the cancel returns.
> > + */
>
> [Severity: Low]
> This comment relies on the SEND_SHUTDOWN / cancel_work_sync() block in
> rawsock_release(). That block was added by commit d793458c45df2a ("nfc:
> rawsock: cancel tx_work before socket teardown"). Before that commit,
> rawsock_release() did not set SEND_SHUTDOWN and did not cancel tx_work.
>
> The patch only carries:
>
> Fixes: 23b7869c0fd08 ("NFC: add the NFC socket raw protocol")
>
> The lines it changes date back to 2011. It would apply cleanly to a
> stable tree that lacks d793458c45df2a, and there the new check would do
> nothing during release.
>
> Should this have a Fixes: tag for d793458c45df ("nfc: rawsock: cancel
> tx_work before socket teardown"), or at least name it as a prerequisite?
>
> > + if (!skb_queue_empty(&sk->sk_write_queue) &&
> > + !(sk->sk_shutdown & SEND_SHUTDOWN))
> > schedule_work(&nfc_rawsock(sk)->tx_work);
>
> [Severity: High]
> Is this check actually serialized with the release path? Only the
> completion side takes sk_write_queue.lock here. rawsock_release() sets
> the flag and cancels the work without holding that lock:
>
> net/nfc/rawsock.c:rawsock_release() {
> ...
> if (sk->sk_state =3D=3D TCP_ESTABLISHED) {
> ...
> sk->sk_shutdown |=3D SEND_SHUTDOWN;
> cancel_work_sync(&nfc_rawsock(sk)->tx_work);
> rawsock_write_queue_purge(sk);
> }
>
> sock_orphan(sk);
> sock_put(sk);
> ...
> }
>
> Release only takes the lock later, inside rawsock_write_queue_purge().
>
> Can the following interleaving still happen? CPU0 holds the reference
> taken by sock_hold() in rawsock_tx_work():
>
> CPU0 (rawsock_data_exchange_complete) CPU1 (rawsock_release)
> spin_lock_bh(&sk->sk_write_queue.lock)
> queue non-empty, sk_shutdown =3D=3D 0
> sk->sk_shutdown |=3D SEND_SHUTDOWN
> cancel_work_sync(&tx_work)
> tx_work idle, returns at once
> schedule_work(&tx_work) succeeds
> spin_unlock_bh()
> sock_put(sk)
> rawsock_write_queue_purge(sk)
> sock_orphan(sk)
> sock_put(sk)
> last ref, socket freed
>
> If tx_work is neither pending nor running, cancel_work_sync() returns
> right away. __cancel_work_sync() also calls enable_work() before it
> returns, so the later schedule_work() can still queue the work.
>
> rawsock_destruct() does not cancel tx_work, and the queued work holds no
> socket reference. When the worker runs, rawsock_tx_work() would read
> freed memory:
>
> struct sock *sk =3D to_rawsock_sk(work);
> struct nfc_dev *dev =3D nfc_rawsock(sk)->dev;
> u32 target_idx =3D nfc_rawsock(sk)->target_idx;
> ...
> if (sk->sk_shutdown & SEND_SHUTDOWN) {
>
> Would it close this window to set SEND_SHUTDOWN under sk_write_queue.lock
> in rawsock_release(), before cancel_work_sync()? Then either the
> completion sees the flag, or its schedule_work() ran before release took
> the lock, and cancel_work_sync() will cancel or wait for that work.
>
> Separately, the unlocked read-modify-write of sk->sk_shutdown in
> rawsock_release() races with the plain read here. It also races with the
> plain store in rawsock_report_error():
>
> sk->sk_shutdown =3D SHUTDOWN_MASK;
>
> KCSAN would likely report this as a data race. The rest of the
> networking stack accesses sk_shutdown with READ_ONCE()/WRITE_ONCE().
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/179378590950.74297.14503648624087894519%40gmail.com
