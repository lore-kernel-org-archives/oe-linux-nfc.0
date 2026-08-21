Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0CB1AF0BB
	for <oe-linux-nfc@lists.linux.dev>; Fri, 21 Aug 2026 00:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787273664; cv=none; b=r9yI8HI6cVlDUgnnVNKE7PKNHzRlxJEzfjwtniPggQaXgCrobwrjXzmn7jKs4l074UV8HT8arxbkYGtnZsYwYRSIBYXF56hbzUnV/wttXT9q9YFHDPeZAZ9vy6SNN5lcTN5fOsN023QfT4YecRo8gPOBO8rqsyX0Iqb9B2Ddapc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787273664; c=relaxed/simple;
	bh=XqQqpSG58PbJ/r3abGBHnp32YeXgC7IxyFH42Awq7xQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=XOLZdQtTq4xH6x7nHajl6kZ69NLKi/2gHv1/Ca4Q+AhJxFrgHXv7u3X+7wBeRZXyK66yjCfKImASWG5R5OX7F7zz7AiUEr83ew+C0tZpSkjXQmftCRfOGT94BFEPwvApzJnkFfbYlH2VIO0uvme9pnW4Wdzf1JLGKOM0ptmEAAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bck+BxGd; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bck+BxGd"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9087fb771d3so2963816d6.0
        for <oe-linux-nfc@lists.linux.dev>; Thu, 20 Aug 2026 17:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787273661; x=1787878461; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QrF+c9pcp51i+6eXP3FwjKOzeP4Wb3wAE/9LLnA/5VE=;
        b=bck+BxGdZYA2RS8zd8Vk64iJn6OgnH0n0E1tht3jAy2TViereIuLBZVBXOZvS/5U6Y
         cisfWK8f4y83CcJoE7NGVqG1HbjFN6qYKQY22mm5MDUlX30l1P0VEwcCnPN9rC99F9tp
         3VAQPh5N62ABRXt9agnf/v0Htp1k4UKWgqrju7T1YtY5/Gh+4kSKAsruQpp+cwgeBd+W
         8Vm1M/G6F4TjHLnSHxiIkZqrpnLYg50tHRzcrDqjI54ANXc8nSs9IboDAE7SJpa3SRJl
         WX4BVrgUxNHSDRPVe/nemcj1PdBtxeZI5aMCXu55WLqH3yeK6bGYdL27/o16wi+VNqJ5
         /RmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787273661; x=1787878461;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QrF+c9pcp51i+6eXP3FwjKOzeP4Wb3wAE/9LLnA/5VE=;
        b=mrOENyPKuVVjt4LPeEiZtB33qPMTTMkbAyIwkNSEC7U2HpGRISYqgA787fJbAQLoYN
         7OSeUugC2p7AhvL5zoqu0y4tRcMLTmmRxphl906b+Mow2LTou8TIqOqcFJcXi9j0LW7V
         HPeWSwRSpJiJiUSBf52sgfcceb3gbWDc9S9ucfzx4rdIP5hJBVYm6C/8Ra5cjPOGmAm8
         rojDH/NO1f4uMs6wsIYilxklw0tCilVLhe0ZwoRAJmjFRiWIBi0TS6gFx8CHCJ/OCPm7
         KKrDUqjt95lFxIcODwinqH9a4u7NupILCgqwF5xGDltaEyxY0beHMqgQthg60sIBIwY/
         SY6w==
X-Forwarded-Encrypted: i=1; AHgh+Rr9rylEl8SQhf5rL3UHtH/4KWPNfCjBgmV1ji8xB8p7pxWYjE6fKftI+Q1rzEGz1T88gktwCIWAzf0tFGE=@lists.linux.dev
X-Gm-Message-State: AFuF++mjRkRE4+ZEljg6lAOsP94IucevuNrxe844DabfFACMZY6mobxR
	kzzEhjhcjIqyQRBgKMWwQbmmb5czunnm93RKEKGOSfHu3wuOwVBBD8PQ
X-Gm-Gg: AR+sD133xfrzCqAixoERFHop0Pmhsa9yzDv1yPxpGWDAETVaN1yHYG6eSv1wak9jMuj
	iTgc/gBFyqoP4axh67B2dYpQBFBKpm6jSfQEV//nmTfKE09nKyB/gXR+afCWZguWhkaF+IhHkGT
	jKAOCd+vE0L0hn2l0COw2TnY69sWW9liUuhkCJTL5CSqrUVG61E92PR7vwe0sJ9ajxFfFuzLIwX
	2KwhoiOFSJuV47l3xIeCdzEb+tstQR62K0Npvc+8jG0VFr42HYju4J5B1bEyGEyRu5lJwaJ+pyj
	6mdDhanHYhfxdWHnmkquroxmpeSKwNTujnVo6LAsMhFaMX4096sYNo6/0wI5uZ5GW6C6sjGwbcd
	CKNkULi+MrAXWhnTKAAaHtpm5n5CW58b7VKwVGfMILXUrKBgmzJLJslE7CADPuG84YMfX/3ac3o
	79ZlJOksUGEogKXLUxarl/z0Zp3u4o2tSD8QvThaaXpbA2nXgYh8GRZ2CSpsPFJxZTau8l2yXFy
	tu4SwhZIVjJH9Fpni4G
X-Received: by 2002:a05:6214:27c6:b0:90a:7bee:1bf5 with SMTP id 6a1803df08f44-90c809432f1mr23497426d6.2.1787273660820;
        Thu, 20 Aug 2026 17:54:20 -0700 (PDT)
Received: from smtpclient.apple ([165.85.199.100])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2a35basm50032116d6.35.2026.08.20.17.54.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2026 17:54:20 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [BUG] NFC: slab-use-after-free in _raw_spin_lock_irqsave
From: Shuangpeng <shuangpeng.kernel@gmail.com>
In-Reply-To: <CANn89iJbOs54esoGSukvMiYnXQkHadnC7NgQanbAXOeiHXOsjg@mail.gmail.com>
Date: Thu, 20 Aug 2026 20:53:46 -0400
Cc: David Heidelberg <david@ixit.cz>,
 davem@davemloft.net,
 kuba@kernel.org,
 pabeni@redhat.com,
 horms@kernel.org,
 oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F1E58A29-96B2-4BB0-8840-8A168477F48E@gmail.com>
References: <20260819050031.2725592-1-shuangpeng.kernel@gmail.com>
 <CANn89iJbOs54esoGSukvMiYnXQkHadnC7NgQanbAXOeiHXOsjg@mail.gmail.com>
To: Eric Dumazet <edumazet@google.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)



> On Aug 19, 2026, at 03:48, Eric Dumazet <edumazet@google.com> wrote:
>=20
> On Wed, Aug 19, 2026 at 7:00=E2=80=AFAM Shuangpeng Bai
> <shuangpeng.kernel@gmail.com> wrote:
>>=20
>> Hi Kernel Maintainers,
>>=20
>> I hit the following report while testing current upstream kernel:
>>=20
>> KASAN: slab-use-after-free in _raw_spin_lock_irqsave
>>=20
>> on commit: 3aa1dcaa4f6f5ae08936491e08bd456f331f2d40 (2026-08-13)
>>=20
>> To help trigger the bug more reliably, we applied a minimal =
diagnostic patch
>> that only adds delays and print statements.
>>=20
>> The reproducer and .config files are here.
>> =
https://gist.github.com/shuangpengbai/f7dab4725e2a2d57b1d302714c93c549
>>=20
>> I'm happy to test debug patches or provide additional information.
>=20
> Thanks for the report, could you test adding one skb_set_owner_w()
> after the skb_copy() in nfc_llcp_tx_work() ?
>=20
> Something like this (untested, not compiled) patch.

Thanks for your fix!

I tested the patch and reran the reproducer. The bug did not reappear.

>=20
> diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
> index =
cac1b5487064d0c5b4966bb6a75aa26e67131049..49cb632268c0c2841e3b44dde124c796=
6267b709
> 100644
> --- a/net/nfc/llcp_core.c
> +++ b/net/nfc/llcp_core.c
> @@ -786,8 +786,11 @@ static void nfc_llcp_tx_work(struct work_struct =
*work)
>                        print_hex_dump_debug("LLCP Tx: ", =
DUMP_PREFIX_OFFSET,
>                                             16, 1, skb->data, =
skb->len, true);
>=20
> -                       if (ptype =3D=3D LLCP_PDU_I)
> +                       if (ptype =3D=3D LLCP_PDU_I) {
>                                copy_skb =3D skb_copy(skb, GFP_ATOMIC);
> +                               if (copy_skb)
> +                                       skb_set_owner_w(copy_skb, sk);
> +                       }
>=20
>                        __net_timestamp(skb);


