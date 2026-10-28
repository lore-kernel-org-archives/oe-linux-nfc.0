Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793206717;
	b=LWw61l4pzVsTnWOiACFdmXnQsbaqVB/pSFzYA2jMzNhORi63xK+VmxxpkGXfVVmTNMDt
	 E1tImwTTkGQuE6c/8/F0Y0akUQry/bne853F36lvK2r4gvbCpGRU+haJ7r9TG+vNw4FFN
	 OY3+Ejwy5iTXkdsxHTvcnmszNFX3RsK5xkUNz4t0gdOQ26u+I+bavqcHbI9/dMxV+twlH
	 sYc4XkzMoSrUity1tw0CPVz+eiDnjgtq8vwvxnha+dB4froShj0TJAW2jSF4x5sN8WGaN
	 g2HrOsqJVjiC8wq/bvAu0tqEyCguGXx1mjOfue2Q8AeoLbkGMkvIpVjKH+FYOvd5EEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ofD1f6oQnTuXn5+ZWN9fgQFsKj7OpffaK+7o/04+4t4=;
	b=AdG4Jte9lXOZ1Ebt+uqFV5e60fNQR1Ejh6+tief9QkZa3ICn594OS91vJxB9S09SESA6
	 RFs7QeGSzv5P/28xUpFq/5/Y0OcxFb0Kg3B2CyfzgyD7JPN8eFwlkg9X4NKG/fh6RMMJJ
	 3H9iEOJQXQxygFO3kf8Fv0aM17nnCXDbye6C4Y9c0LZYt8oIRNHZh7Je8pwhSwmVj/nim
	 9OX7JqeiVaJz6OLyplDFRNhfRL1u2DVaBl9t53oBHtdV2/TKFquCevAxSvLP+SiPDnp0R
	 /O2Q1BCpUYQI9h1V+dC54yA84GOHcRiUdO91cHyiN0D4YQ+xro1iPrlMS2jFWqFBfvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=octane.security;
	spf=pass smtp.mailfrom=octane.security;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15F3606A31D
	for <oe-linux-nfc@lists.linux.dev>; Wed, 28 Oct 2026 16:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D15F3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so11143045e9.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 28 Oct 2026 09:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793206710; cv=none;
        d=google.com; s=arc-20260327;
        b=Tm0Q3eAYwt+SPZGwD/x1AxF+q9u9LmfkNhdVPpgLA3mgjU68b3aakooAv4YamPXelS
         Kz0wxnP7q4/7egf2hjL2t3jH9I5/bxLozXjsSL1MOf7VokHPYfFNt5MXYGY7sVPQ93ig
         eCjSY0m+5S7OPWiAJBcRi/e1/1qPWJp7cGHAX4FfN82GdY6Z7N5egoK/AjOhO4UtP6or
         W9MN/PIGW1zQ4omE2heYUQoweajscw0M/lFbL1nmyy6r2ss8m0MshkObl3awqhi9x/Ak
         6Ew6hjRCZGDi0A0UUvkSrsvHmEkqhSx/ldWhA5rccD1yQkcUGaiJ5++uZMDCULpU47UK
         NEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ofD1f6oQnTuXn5+ZWN9fgQFsKj7OpffaK+7o/04+4t4=;
        fh=LkhRcgi0zNWG4oXoSu8UV2QemPWLYqplhhf/FU0+MXc=;
        b=g1kkGwBFouacaMwcNhTb05at75djvx8v9UvuUXocy/dU4utpSqRma85FnSnP9RDBhS
         Kt7uiB+c4tf2NJy+lI68Rk4OH2eaSZdCPagS8MVWP5dXnHiT0HgvkJmF5pzfsZR2N0Ev
         KrQGhCfI2j398b4Wu3jgoEPMpl8uupUJSxYBIVoBZpmzQtyXYojl+8Fux+T5X9hDU2Dk
         L3tUePtkdUq0k+Iysu2Fk76aaNVRPF1qzN2VUsErgp30JhjDLhiyLy0WwRBGtSz97byp
         /RXyz6VfVR980//DQavU6uUIiz8dbkTnE2RDJkdo6iiOyWGh7LMLdIuGBEKTB9/47bTq
         ERIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1793206710; x=1793811510; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ofD1f6oQnTuXn5+ZWN9fgQFsKj7OpffaK+7o/04+4t4=;
        b=KlahE4wtPb6KJiJ+Fl/A6a2gV7eMzPbMBFsJNQZrWlxLDz7v0cEi3DsdIfDcYJrnoW
         9hUYXGKCwFoo/bfcraLCgIelnfAm3RIcSnYriMNUqkwSSNwT+AChpsxNJ72RF7JyF/RJ
         giqe2r2MpOXE9UJLwyQE3M0O9Y8bnzn+rToHG4E1mZ8KwyhhOyDScJliaOQdQJiFsLvV
         Z5vnSyh9pINjeBiPweqwJJBiOid4AOz4UsxasJvF6SSIa4P9uLWsO2NykyVknjVIVqIP
         yDpHk98DtQesr2luOwb68CCakHgzCdoCKVRTPg7PoPVXS/dv881Uz+WKEXV8gyNUov/E
         /qog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206710; x=1793811510;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofD1f6oQnTuXn5+ZWN9fgQFsKj7OpffaK+7o/04+4t4=;
        b=xk59CO6sKVB/eywhjKZ2OaO96LsY/BR1kcfEWDZkHsfoo0RB2t12nkeSGibGekU1gm
         X0smbZXqHMWK+0JgYsggUtW1hq4isfnYnrmdBcrPoZbnrIdqY73qSys79eSGpb8SMasz
         IM7rn2CIuhMtAgo7GHghV4Lft7f2kncf5kaXEvE/qKg3Z/7PPgflRyp2DPFywmD78Y2S
         US5WFUGHjS/tKvyiBCwYbNB/t6mLpitId23k2YMQsmZSf9nIvpCCoApT8rg8tekUUsNm
         4r3yl+ezEVHlsvc1Y0bX1ErM6+V1vqIWSTtczMD0fkcPpcL8cSe5Yqz8/5jX+PP46X84
         PTXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGickTSxfZ+yN0Wvui7smQ2jrJaELXosEQVymYQywH7WL6eK/JxQLKSw+gCoGNOHNldhJcKRPGQg5mbUs=@lists.linux.dev
X-Gm-Message-State: AFq9FYIb4QXZ1e8BjQyiNntbMFNngkfXqxpdauYHLggn/+2x10OMgO4D
	AOj9PXy7lNDodW/HVvi9+dbn5MrqxJZLAKwofzBUTi5FNlfQW2xA9mb/OrVJGLABAjIpKEZ1DW6
	Nx/QGjgXNqOAi36G1zpg8Inj5LutmDXiDTnVMsPvXVQ==
X-Gm-Gg: AYBFou1VKcEB7oVokBFj9MShEjcrrJrffZJilp5T37fSMwrFAvQFsFTZatxleL97PO3
	PpLwFd3GzwJM6A/j94z8UZiocuqOYbu9epMdosJAoqruqD9Fu+Xnsjtqb5HAStLhezvinvlZWZC
	rqO5u4mXi+k1vjKipXXiroayMEyMohbzcgrDEUIqWwbZP1HbYDK9EHi0yx8ZIOe4biioWeJ+ybb
	0Cphyl2RNBAlYdyb1maC2EFucUb8KBas7iSvc8siw4DsIYOosNkIvj0oQgES9b+Eo2eooSpQg8l
	XMi4VVftThLCwl8uY7oHZBpPwZZ8qg76g41tOChKafBvsjGFwCMYe4L2n5DXuyeZwnV5+8BsSMx
	zHdCeWNHZiNrUUc0gko7K4efRqAvh10s4ufvCjItTbfvROP6x2h7sWUz8lVwGfoFqbK/ZuJTQMT
	vVevaSS5ZKK1uzbKVfCG2LJgbebOPnJAQu7GVwanHp/8uxpw==
X-Received: by 2002:a05:600c:4445:b0:4a2:526b:d40f with SMTP id
 5b1f17b1804b1-4aa83e0adefmr4884485e9.0.1793206710235; Wed, 28 Oct 2026
 09:58:30 -0700 (PDT)
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021032443.44412-4-shubham@octane.security>
 <179290103732.3134.18298634182061634234@kernel.org> <20261028164349.GA257209@horms.kernel.org>
In-Reply-To: <20261028164349.GA257209@horms.kernel.org>
From: Shubham Antil <shubham@octane.security>
Date: Wed, 28 Oct 2026 22:28:19 +0530
X-Gm-Features: AclHuK8HPth5FoQdhYFleU3o7yVQURAnBdI4t3AFjYlVmMJjxx-cf02cRxHSgng
Message-ID: <CAEBzjKGrrBhOJM01D18AURz=0m6uOe+G6fpXZzc11h4ui_MqwQ@mail.gmail.com>
Subject: Re: [PATCH net v6 3/6] nfc: nci: uart: quiesce callbacks during teardown
To: Simon Horman <horms@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, david@ixit.cz, 
	oe-linux-nfc@lists.linux.dev, gio@octane.security, stable@vger.kernel.org, 
	kuba@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

I am still looking into these issues and will keep you updated.

Regards,
Shubham Antil

On Wed, Oct 28, 2026 at 10:13=E2=80=AFPM Simon Horman <horms@kernel.org> wr=
ote:
>
> On Sun, Oct 25, 2026 at 04:03:57AM +0000, netdev-bot+sashiko@kernel.org w=
rote:
> > Thank you for your contribution! Sashiko AI review found 3 potential
> > issue(s) to consider.
> >
> > Critical: 0 =C2=B7 High: 0 (3) =C2=B7 Medium: 2 =C2=B7 Low: 1
> >
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchw=
ork
> > know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> > (one such reply per series is enough).
>
> Hi Shubham,
>
> The text above requests a response to this email, and similar ones sent
> for other patches of this patch-set. And I would appreciate it if you cou=
ld
> provide such responses.
>
> FWIIW, the Medium issue immediately below is of most concern to me.
>
> >
> > - [Medium] When nci_uart_tty_close() tears down an NCI UART whose NCI
> >   device is up, the NFC controller (NFCC) is left running in whatever R=
F=E2=80=A6
> > - [Medium] Baseline decision: fixed later in the series.
> > - [Low] Baseline decision: not a bug in practice.
> >
> > Pre-existing issues:
> > - [High] Pre-existing problem, not introduced by this patch: during a
> >   Marvell firmware download, the UART peer (NFCC) controls a 16-bit=E2=
=80=A6
> > - [High] Pre-existing problem, not introduced by this patch: the Marvel=
l
> >   firmware download copies from the firmware image at a peer-advanced=
=E2=80=A6
> > - [High] Baseline decision: pre-existing and fixed later in the series.
> >
> > --
>
> ...
