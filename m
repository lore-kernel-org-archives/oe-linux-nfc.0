Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793475880;
	b=Mb1o5gCWs+uVVKL2R+PawKOUG8VpA1d7Qj8SsllFPGiJBrsFdvt3/405qV+AO31hjH7g
	 a2VgF9ggXHcZsmydu6orpwocW8bvSzcf7xmEcAhixqQgPhmtgx+sPWG3TjUlSESQhWyXY
	 D60MpUn6o3c4BcoJl+hGvLGu4LoUUQXLpEO0NesIA+82XISLzvogt9pmcOaH3IvMBPXn5
	 4OW+J2bWREjoB3C35LO6Cv9d+S5GR0d0y8dNX2NpHA7hToheXSxzyNPPyLY4XCgqgsr51
	 WRsUhdEV+8HPYUrf2lvVqYV8EcDx8abpBrDx9bbhDKQzQui4cWnOnVUxG9CWA5OV79w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793475880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qUontYmEH2HkYdY4QrR0ZkisJx/DKWqA4/3BYHd78Hc=;
	b=L1pfZv7+XzSF6qsNYKX5rTBVpoSi9G3/k0lrTVEH7beEZeeQCMZs8o4lbMyQslyEVRPS
	 ovr+pJBmpTW6hyTcPoFfsYy/LMvbLeXb5jMMeMaBEOz2ih48t4cF3lSg8edFLYeP6wh13
	 e0E8NrU/uJmdUHkZDZe7PHfdq23xKG044dLsYiGs66MsBGrDWpjMUb3bE5P5pI7/eTv3F
	 NKiG7r+ONo2k455WEACJiFgmoigJiC5BwS4VbPkY4QLay1LxWmNxGIEcb5Skz+V/CDwgP
	 oBYKowdM9MCszArqzXl1zYgNM8if45B243GDSATOELbzwXbONjLZrt1reKljtYBZbcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPGrx8mb;
	arc=fail smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6BF606A31A
	for <oe-linux-nfc@lists.linux.dev>; Sat, 31 Oct 2026 19:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F6BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPGrx8mb
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3535a54bed9so2724921eec.1
        for <oe-linux-nfc@lists.linux.dev>; Sat, 31 Oct 2026 12:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793475879; cv=none;
        d=google.com; s=arc-20260327;
        b=LArm2Db/dX4o+8JhCn6igQW4H4KvPwr6EnVrPOmvR6Sn+AUpQ96lJnsa/6ppwJzoXM
         ldDDDqGHQwA2sjmkxf4KiNeSaRDy5IsM+B17vV23IBJ1NLTw2Cys327CszoZTlj3uEPp
         EOmQmwzPJrlM1k0iXHVsRXONf5vozc8koURiGN/pgUDbN4ns+UVP/GPKVsavtqd2yDTP
         Ip+aFWOoPh3+w7q2t/gbfTqKvh+y9w7jcdv7aeKZ4WyCAIDA0tQwzuR/R++t4y73perQ
         y13fFjP5DnfI3kvucvnVDD003F9gMq5cYd84jNCquOKK/TpcJPIILWHOOyK6dqsQvYU6
         WLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qUontYmEH2HkYdY4QrR0ZkisJx/DKWqA4/3BYHd78Hc=;
        fh=mdWc8scJrcSl2ZPhBso2gjG5VY2kPj2gLm3DE+n4Kqc=;
        b=r1YZxMEi3AB1ijb/QZNdMtEhp+BvgNLU0L63bi5OYalSrIPZsFNFRPRqaHPfgA1IE1
         T6fE0T+lvXziX9tJbl8Kg4ItrAu1B0eSFtUv3WXRtCy9SIpK2sd8rNI00sPqC5xuIQwh
         Y3sA7sxBzXY59vDe2ReKxj1srczqh+D4j47TreyoqZEXIbb7RyYNUHhPMx7MTyWLjDQS
         yN7MAiXRqJVUxlvBdGPhOcpyb9325jXHJFbP82L5cnBaiuv26br7N/dFryCzcNu8Yu1c
         MbUPACUwTEXQJu/NzRbmZey/uaiJ22C1dGELli9Ygfz8Ixto+thqyNDOZ4Pzo3nuEV/h
         LLwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793475879; x=1794080679; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qUontYmEH2HkYdY4QrR0ZkisJx/DKWqA4/3BYHd78Hc=;
        b=WPGrx8mbKf37cnkKROC73goykULN6YAzaVGC4Kvf7FpAoOsYPPh3tspsNsObjf1XB5
         /sWjRY3nLJS5fYKC9CZiNr6xq3oUtNexMsRrhEHs0BAqlj8ZbFHH6P2RPHqLh7wSy0pd
         dQYk8FhLfxRv4hTdXHlBMQZoP7WFDH2z2ZM/9vucvH4406EULhenU7PtXtnYrpf+TP+X
         vm7WC/DgShO/zRbsd7y0da2Tlxo8vQGpY/u9BT6TdIDizssWYYQIjkZJa8DmbXF871uk
         GsBFX+kqxcVywe2vKlvuT0+evXfq/ClP4uovP0FqDvgEj3XLU8Fv7hNB3mTDz/M3sP+e
         M5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793475879; x=1794080679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qUontYmEH2HkYdY4QrR0ZkisJx/DKWqA4/3BYHd78Hc=;
        b=CSHwQnKcIH7KvHsBIVkkHyf0fuVwCAh6zMrupQODg2GvUsbSg6txyw+cdyywqlJEVo
         XJ1/2J9uDVcxDf6jPcanUwLTmP41TJAB90Xb0AyVMtLB/2GqLm0UIs0HbUTvEZxPfARF
         GWJF2p0/aGw6XL6yuvcShg5t5qsqy+OEm23mao3DnUl8jLvtpuZWbMQZijnYu9L1CsQS
         HX6Qup1ZQrDmVffrBoxSP/dZ5+jLwapPqgfGnb56IVlxEVv6pDaFtlGxjp986n2Kg4po
         gb8xGt2O7u34eojE+OGZE0h7kwWaUwIiT/QoP1p3y2rChcFeGIKdGDqqsJUuMI9bUbG2
         TZpA==
X-Forwarded-Encrypted: i=1; AKwUvBwHemAMRG/gEZFJDrhDd3uOO1Ufja/XByGufNYoMXUgB2awAloliPXmkPTAY30Lk/K4Z7jUULzQrlbMWns=@lists.linux.dev
X-Gm-Message-State: AFq9FYJtG+8cL2tu1KUOuYEkrZrTulSHfkLkTfzGXzeA2pV5JuUqv+9c
	U6s7oD4F9sgQlAFjkSiqH8zWjp5xX0j+4jbaqbaYeGJFh41wL0HOYS2Rz9oh/GZT6jdS00Wx/w/
	uWpLc/LLIftqF3zueQLAqmO382f9jwXOuVtmaLmM=
X-Gm-Gg: AYBFou0Y0YrMzi/woqbRaHXVrBeW/TOuemXxKHqQcRMiYAGrJg1vL8vF8xoIRDsJl+V
	IYzTQm5yT/4QLsRkHcK+a17vnXk+09G7AG5yz+Ilur6gTApH1Jk37ZFZUkTXzJRN54Yw+Cdfm/f
	hnQ8lS81qAJU1XwrfdRlXAWpglcdaRy2M9d1bi+8V/wrc3IORi9REOyx6z2wFha0xsEF7EOKSl3
	Upom64o3LYiTxCnetZji2u4EHAMB7vYhDoDhfDJGRn5oy2+LBuYZZByUV9M21zudi41GGXfuEVr
	eAeBDKCnyjp0Pc2xBRKdGp3zluuALxBjzHUCCbWd3sXPjkY06kKWdHXFqBNeRRH/1+AZgtoBc6g
	NpCfahMqhkEaGNKrhZ9VGdD29DtSUHX/WgPPl4XSBmbiCEBa06VAb3iRpudLjcqFyqcBiY8Gqsf
	r3SgY5GdQqp/1ftKQzd4FigYv7NA==
X-Received: by 2002:a05:7301:78ce:b0:34b:5ab2:e200 with SMTP id
 5a478bee46e88-36a4242b0e7mr8813452eec.14.1793475879351; Sat, 31 Oct 2026
 12:44:39 -0700 (PDT)
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <179332800288.52644.8728400883396719965@gmail.com> <20261031182504.GW257209@horms.kernel.org>
In-Reply-To: <20261031182504.GW257209@horms.kernel.org>
From: Joas Antonio <joasantonio108@gmail.com>
Date: Sat, 31 Oct 2026 16:44:28 -0300
X-Gm-Features: AclHuK_Fu75K3pHZyCLZnNrGfVI3B-Q92FTwNO4d_lhymgzg_U-H8wZBqLodiJQ
Message-ID: <CAOCBhwGBrPxLPukgH7UAoy--sOXyoWL5XsC6CmUroy0T2xujXA@mail.gmail.com>
Subject: Re: [PATCH net] nfc: st21nfca: complete a pending SE APDU request
 only once
To: Simon Horman <horms@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Fan Wu <fanwu01@zju.edu.cn>, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

Thanks, you're right.

The two completion paths are serialised against each other:
st21nfca_apdu_reader_event_received() does timer_delete_sync() and
cancel_work_sync() before it looks at bwi_active, and the timer is only
re-armed from the same HCI rx work (EVT_WTX_REQUEST). But
st21nfca_hci_se_io() runs from the netlink path under device_lock()
only (nfc_se_io() in net/nfc/netlink.c), which neither the rx work nor
the timeout work takes. So:

- bwi_active, cb and cb_context are plain fields written by
  st21nfca_hci_se_io() while the rx work or the timeout work may be
  reading them;
- a second SE_IO issued while one is pending overwrites cb and
  cb_context, so a completion running at the same time can pair one
  request's callback with the other's context, and the first context is
  never completed. That is not new with this patch, but the bwi_active
  check does not cover it either;
- st21nfca_hci_se_io() sets bwi_active only after mod_timer().

For v2 I plan to add a spinlock to se_info that covers bwi_active, cb
and cb_context: st21nfca_hci_se_io() fails with -EBUSY (freeing
cb_context, as on the existing error path) if a request is already
pending, otherwise records it and sets bwi_active before arming the
timer; the timeout work and the EVT_TRANSMIT_DATA handler take the
pending request out under the lock (test and clear bwi_active, copy cb
and cb_context) and call the callback after dropping it, so exactly one
of them completes it.

Does that sound reasonable? I'll rerun the emulator tests on it before
sending.

Thanks,
Joas

Em s=C3=A1b., 31 de out. de 2026 =C3=A0s 15:25, Simon Horman <horms@kernel.=
org> escreveu:
>
> On Thu, Oct 29, 2026 at 11:40:02PM -0300, Joas Antonio dos Santos wrote:
> > st21nfca_hci_se_io() stores the netlink callback and its context in
> > info->se_info and arms the BWI timer.  The request is then completed
> > either by st21nfca_se_wt_work(), when the timer expires, or by an
> > EVT_TRANSMIT_DATA event on the APDU reader gate.  Neither checks that a
> > request is still pending, and the callback, se_io_cb(), frees its
> > context every time it is called.
> >
> > So when the secure element answers after the timeout, the response
> > calls se_io_cb() again on the context the timeout already freed, and
> > frees it a second time.  The same happens if the controller sends two
> > EVT_TRANSMIT_DATA events for one request.  An EVT_TRANSMIT_DATA, or a
> > timer armed by EVT_WTX_REQUEST, with no request pending calls the
> > callback on the context of an earlier, already completed request, or
> > calls a NULL callback if there never was one.
> >
> > With st21nfca on a virtual phy and an emulated controller answering an
> > NFC_CMD_SE_IO request 4 s after it was sent (the default timeout is
> > 3.2 s):
> >
> >   BUG: KASAN: slab-use-after-free in se_io_cb+0x2ec/0x334
> >   Read of size 4 at addr fff00000c5277da0 by task kworker/3:1/59
> >   Workqueue: events nfc_hci_msg_rx_work
> >   Call trace:
> >    se_io_cb+0x2ec/0x334
> >    st21nfca_apdu_reader_event_received+0x1ec/0x248
> >    st21nfca_hci_event_received+0xb0/0x300
> >    nfc_hci_event_received+0xb8/0x30c
> >    ...
> >   Freed by task 59:
> >    kfree+0x214/0x498
> >    se_io_cb+0x2bc/0x334
> >    st21nfca_se_wt_work+0x14c/0x1d4
> >
> > and for an EVT_TRANSMIT_DATA without a request:
> >
> >   Unable to handle kernel NULL pointer dereference at virtual address 0=
000000000000000
> >   pc : 0x0
> >   lr : st21nfca_apdu_reader_event_received+0x1ec/0x248
> >
> > Use bwi_active, which st21nfca_hci_se_io() sets, to tell whether a
> > request is pending, and clear it in whichever of the two paths
> > completes the request first.  The event handler already stops the timer
> > and waits for the timeout work before looking at it.  Also complete the
> > request with the error if sending EVT_SE_END_OF_APDU_TRANSFER fails
> > rather than never calling the callback, which leaked the context.
> >
> > Fixes: 2130fb97fecf ("NFC: st21nfca: Adding support for secure element"=
)
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
> > Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
> > ---
> > Tested on arm64 QEMU with KASAN, with a test-only module that registers
> > st21nfca through st21nfca_hci_probe() on a virtual phy (LLC nop) and a
> > userspace controller emulator (DEV_UP, ENABLE_SE, SE_IO over netlink).
> > Without the patch: slab-use-after-free in se_io_cb() for a late and for
> > a duplicated EVT_TRANSMIT_DATA, NULL pointer call for an unsolicited on=
e.
> > With it all three are quiet and a normal SE_IO exchange still works.
> > Not tested on hardware.
> >
> > st-nci has the same pattern; Fan Wu's pending "nfc: st-nci: drain SE
> > timers before NCI teardown" v2 already makes bwi_active an ownership
> > token there, so this only touches st21nfca.
> >
> >  drivers/nfc/st21nfca/se.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/nfc/st21nfca/se.c b/drivers/nfc/st21nfca/se.c
> > index 7154bc1d6..4261ed1d9 100644
> > --- a/drivers/nfc/st21nfca/se.c
> > +++ b/drivers/nfc/st21nfca/se.c
> > @@ -264,6 +264,12 @@ static void st21nfca_se_wt_work(struct work_struct=
 *work)
> >                                               struct st21nfca_hci_info,
> >                                               se_info.timeout_work);
> >
> > +     /* The timer can also be armed by EVT_WTX_REQUEST while no
> > +      * st21nfca_hci_se_io() is pending.
> > +      */
> > +     if (!info->se_info.bwi_active)
> > +             return;
> > +
> >       info->se_info.bwi_active =3D false;
>
> Hi Joas,
>
> I'm unsure if it effects the correctness of this fix.
> But I am concerned that the use of bwi_active is racy.
>
> >
> >       if (!info->se_info.xch_error) {
> > @@ -383,11 +389,20 @@ int st21nfca_apdu_reader_event_received(struct nf=
c_hci_dev *hdev,
> >       case ST21NFCA_EVT_TRANSMIT_DATA:
> >               timer_delete_sync(&info->se_info.bwi_timer);
> >               cancel_work_sync(&info->se_info.timeout_work);
> > +             /* Only complete a pending st21nfca_hci_se_io(), and only=
 once:
> > +              * the timeout work may already have completed it, and th=
e
> > +              * callback frees its context.
> > +              */
> > +             if (!info->se_info.bwi_active)
> > +                     break;
> > +
> >               info->se_info.bwi_active =3D false;
> >               r =3D nfc_hci_send_event(hdev, ST21NFCA_DEVICE_MGNT_GATE,
> >                               ST21NFCA_EVT_SE_END_OF_APDU_TRANSFER, NUL=
L, 0);
> > -             if (r < 0)
> > +             if (r < 0) {
> > +                     info->se_info.cb(info->se_info.cb_context, NULL, =
0, r);
> >                       goto exit;
> > +             }
> >
> >               info->se_info.cb(info->se_info.cb_context,
> >                       skb->data, skb->len, 0);
> > --
> > 2.43.0
> >



--=20
Joas Antonio dos Santos
Cyber Security Specialist and Ethical Hacker
joasantonio108@gmail.com
LinkedIn
