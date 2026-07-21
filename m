Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5E746D094
	for <oe-linux-nfc@lists.linux.dev>; Tue, 21 Jul 2026 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658744; cv=pass; b=rZa68SVOo9yi7LFuT6NvyoH+MiB7RPPiQqDjTzWGwGjMmM0Xal8lleboRpe24ZpHTNA0Dlf5Y43/zR8gp0VMJ7MTho7zPJpPfX8dGw48vw+GyAX0mDPzva7GeM7/9P63sU1sAiq+T7R6pVL9efiBae08+1k1M2VJ+TLy9drFZyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658744; c=relaxed/simple;
	bh=pXRAohn7fhmA6Dij+Rs6C43N6dNdrN7Dx/qYu5pat3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpRKwzQFJ9ZvfhuVCdJqMaIl9Owi0nWhnAe/ZKRiQK8dt8E459yxASu5Hpi73bmf0ayZJj8gX7vCCoaRJetRfj82LAul6nXJkk6k49hhTkarGHNPF7XmOwvW+E/BJRZ8zQpjo+Qxsvu1lI4P1g6wW8CrnXHG/0aYC/y6Jcjnulc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJc2WBZI; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJc2WBZI"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8f186025973so133161246d6.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 21 Jul 2026 11:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784658741; cv=none;
        d=google.com; s=arc-20260327;
        b=iYUgqXpFbZP3+oNDl2lK/Vpc0JByMD/oAlfD405kzl5T0rKq5ZtbMEHBA33cDi65n3
         by1KpTS4sVWHqp103qAK8T7ytazY+8a9ZCwx5tDPEWyQh8cO9Kn+pllBevVmaSe+NAz7
         5u9yOdBflZFU4iMAczcnBE9dhNzJSHbexloQCBNJSTHWsEHly8CODmP/YKLuMUtybDqI
         89B5ujz50prm2ULBRt2myoX/n4s4ccF2pn1jMrBF7QSgAeuQQ6SaQgzXCDLJ6Goprhzb
         aTD6iEtxYld0Zn8qMNngeMcfXtt8kIsK7RFy5ha36RJv2IDfXdMh6patynL9AAl/DK79
         sLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C1MJtkN0nehJ3yvYgNvq0Vp+/NxQaXb3Gjx9oriv2pk=;
        fh=B4H7MUXxP2SZ1pcvBCYaB7kmCTfPn/4a3qTnqaOMmEw=;
        b=r5LpqamsV17iuiF9qtIBIQGsrnsSadsSvmMzsnrkQQkcgPluRPmBinr92Ee2oFptVr
         FVsLlA3uBqH9fgRgT04fVTqId3jUwspRJW4zgOx1foC8Pgmij2SZe38jiDEIDTdmDCBL
         +K9G1ZgOsSRlWsT7dieN5uGjP9rSqGoSlioO+yjI7kKuSvQuiRyCp2pazQ0mPQ0i9G4n
         614s/LU2ciCh7q1ITFJutwcQB06X3P9XFcnTRl1irljbd+J3QD8WjB7j5MufWmwIZcTu
         /UZZZlnZIjcw20bgbt4q1SWqap2oqT5kmoDhtzHZSw6rn7mJvkuEi6IIiLUxz8RmSdLL
         u8Fw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784658741; x=1785263541; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C1MJtkN0nehJ3yvYgNvq0Vp+/NxQaXb3Gjx9oriv2pk=;
        b=lJc2WBZIfoucZZWKqv+WGaDNhzoDcsdck8+zhovHgXAm/zssYfD/X18HaITWKZmfCF
         80o+L9u4U9JDlBOuQ3hsngNXvdJWrXiO90t82Q6zDjwBdwPxrR91o/5qiIz0/A4kj6I7
         LL2jizDI51F84ZMnbatxShhUVQUYiW9x8qOnaeJPueVciIINMvZAVVIxaXkQPUUo3ho8
         asjapENHzHFIOy6CQlEU/YfGnnB9Dj4ERbZbKDHM2ObE4AYXe+N19PCIt2KREcrIIQKh
         2Yz0MSShq/umdCjB5tK+5cOZZyuAVVV+jaqL/unsU7jWz3XZpdIN9bUIo9KMN53aM04j
         Jyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658741; x=1785263541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C1MJtkN0nehJ3yvYgNvq0Vp+/NxQaXb3Gjx9oriv2pk=;
        b=pdKJVsUOcD/6qVNf+bkOXHxfn7Fay3OuMXO2RdcsgjuBBbBuzpkeIrEFT+yk6tlBo7
         9BizmH8xRs/2agoJz/C9CT7OAfzUGCjFPc8ukxRGrKkMHHV3PWjRjJLNnUcC3IUHlPtl
         9wmOfuN/k1qD3eQyV0Wpb7+8ag3Ay0QS3hG09hB0R5fcs5BbrPLFeQ81KWmJG3q49Al/
         IlkGkxQrbIzg8lboLoooeR6+RNtAaq17W/gMim7T4+e2T2uXcpYJIvNSlM0XiokonPT7
         DzZ6wz/CJJcy28ofkR9emIruaxEJoBVEYo6Q/Whig8bu1hXiAZkFXEA6S83yM3pq77TQ
         tkuw==
X-Forwarded-Encrypted: i=1; AHgh+Rpfi9rHcJYwfhMn1vJdVvMcEZNnFowlbdNUw4A/BvjguVvf4m2u0NXjXyNhg4OHBmhHEPabsyNNwUb3nTw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSY3DzEClZEsRv5dkRF6wMmtq36+bQfuiyYbd61lxR8VwmqjRk
	Ppd4WOgAhUh5gKz5DNffIIMsoa6wR+aavMi/BIa3IftsG8fqyE/REQA05UZzxYCKGLsSCZvvEGG
	3BZcKK6VnSfahnmTUseotQgMyxVRxwng=
X-Gm-Gg: AfdE7cmQwxjjmyVdK7KW0orSTn+Gm8klfgbCGqRdInbUu3Kbs7Ci/0TJsFa3UczcSJO
	AU71dIHCVDq5+RcBeGOgaIiCF4fuj+LSy2XWFx4f8EXkttWZaqE2LItS94aMGKQLLyIW1WnoXs6
	rVjTtWcjLGBmWPQKG38h1RZMAXqfBk8FEzhTaayLNHCWT9mx0ALKYUSfESu2mLmHE48AaqXSrmm
	Rj5f2LLSAEPSeKRLQI8YxQOHPLJ8WBvSsdtHGGdyvmITDe89AHtG4Mqr0DhYX7dj0S3rKPu4sm8
	Q7U+frkG1PlUkibEWFLcCIuyDY0Hiw==
X-Received: by 2002:a05:620a:230d:10b0:92b:6805:91b5 with SMTP id
 af79cd13be357-930b431be08mr1496071185a.61.1784658741250; Tue, 21 Jul 2026
 11:32:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721163632.1570651-1-bestswngs@gmail.com> <7fd2e4f3-ccfe-4e09-8f24-8dcf89b4774d@gmail.com>
In-Reply-To: <7fd2e4f3-ccfe-4e09-8f24-8dcf89b4774d@gmail.com>
From: Weiming Shi <bestswngs@gmail.com>
Date: Wed, 22 Jul 2026 02:31:43 +0800
X-Gm-Features: AUfX_mysdVcTo5mL3CVBmInuSwRquedeczs8l23QWYhaq4WaV5snxVToh2OAxNE
Message-ID: <CANgPUi2kAZUwJ7XMw7VgX3gPrakqaePOqk-Q8RxCq8HBar3cdg@mail.gmail.com>
Subject: Re: [PATCH net-next] nfc: digital: fix use-after-free in nfc_digital_unregister_device()
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiang Mei <xmei5@asu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Daniel Zahka <daniel.zahka@gmail.com> =E4=BA=8E2026=E5=B9=B47=E6=9C=8822=E6=
=97=A5=E5=91=A8=E4=B8=89 02:07=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 7/21/26 12:36 PM, Weiming Shi wrote:
> > nfc_digital_unregister_device() cancels cmd_work and cmd_complete_work
> > once each and then frees the command queue.  The two works re-arm each
> > other: digital_wq_cmd_complete() ends with schedule_work(&ddev->cmd_wor=
k),
> > and digital_wq_cmd() hands a command to the driver whose asynchronous
> > completion schedules cmd_complete_work.  cancel_work_sync() only waits =
for
> > the instance it cancels; it does not stop the work from being queued ag=
ain.
> > A work re-armed after its cancel_work_sync() therefore runs concurrentl=
y
> > with the cmd_queue cleanup and dereferences a digital_cmd the cleanup h=
as
> > already freed.  digital_wq_cmd() widens the window by dropping cmd_lock
> > before using the command it took from the queue, while the cleanup loop
> > frees the commands without holding cmd_lock.
> >
> > It is reproducible with the software NFC simulator (CONFIG_NFC_SIM): st=
art
> > an NFC-DEP exchange between the two nfcsim devices and unload the modul=
e
> > while it is running.
> >
> >   BUG: KASAN: slab-use-after-free in digital_wq_cmd (net/nfc/digital_co=
re.c:174)
> >   Read of size 1 by task kworker/1:5
> >   Workqueue: events digital_wq_cmd
> >    digital_wq_cmd (net/nfc/digital_core.c:174)
> >    process_one_work
> >    worker_thread
> >    kthread
> >
> >   Allocated by task 5124:
> >    digital_send_cmd (net/nfc/digital_core.c:234)
> >    digital_in_send_sdd_req
> >    digital_in_recv_sens_res
> >    digital_wq_cmd_complete (net/nfc/digital_core.c:134)
> >
> >   Freed by task 4994:
> >    kfree
> >    nfc_digital_unregister_device (net/nfc/digital_core.c:859)
> >    nfcsim_device_free [nfcsim]
> >    nfcsim_exit [nfcsim]
> >    __do_sys_delete_module
> >
> > Use disable_work_sync() instead of cancel_work_sync() for the two comma=
nd
> > works.  disable_work_sync() cancels the work and disables it, so any la=
ter
> > schedule_work() -- whether from the sibling work re-arming it or from t=
he
> > driver's completion callback -- becomes a no-op.  Once both works are
> > disabled no work can run, and the cleanup loop frees the queue with no =
work
> > able to reach a freed command.
> >
> > Fixes: 59ee2361c924 ("NFC Digital: Implement driver commands mechanism"=
)
>
> Fix for this commit should target the net tree instead of net-next.
>
> > Reported-by: Xiang Mei <xmei5@asu.edu>
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> > ---
> >   net/nfc/digital_core.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/net/nfc/digital_core.c b/net/nfc/digital_core.c
> > index 7cb1e6aaae90..6def5132a4a6 100644
> > --- a/net/nfc/digital_core.c
> > +++ b/net/nfc/digital_core.c
> > @@ -843,8 +843,8 @@ void nfc_digital_unregister_device(struct nfc_digit=
al_dev *ddev)
> >       mutex_unlock(&ddev->poll_lock);
> >
> >       cancel_delayed_work_sync(&ddev->poll_work);
> > -     cancel_work_sync(&ddev->cmd_work);
> > -     cancel_work_sync(&ddev->cmd_complete_work);
> > +     disable_work_sync(&ddev->cmd_work);
> > +     disable_work_sync(&ddev->cmd_complete_work);
> >
> >       list_for_each_entry_safe(cmd, n, &ddev->cmd_queue, queue) {
> >               list_del(&cmd->queue);
> >
> > base-commit: d4932951a19a5f1ec93200260b85e1a4c080ff77
>

Thanks, will resend as v2 against net.
