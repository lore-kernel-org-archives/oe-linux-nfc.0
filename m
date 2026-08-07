Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B073DD86A
	for <oe-linux-nfc@lists.linux.dev>; Fri,  7 Aug 2026 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786098821; cv=pass; b=BTt7yNNfb5UzV8YHTS+X9EcdBYOsIe93zHn31HQpf1tJbypAvaEB3xDkL2lhvmRj7im8ZX0M4LWo6BXV2CBtGqGM4gHDTDJ5P/ccJgwjuDlN72vKbB87d1PKQBTK5S7qXLjwh5GXBjSmS6Ldpq/A9b+r0OfmxolCcKlZcsxv2Qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786098821; c=relaxed/simple;
	bh=eHP9/h5HZv36WVqsTDbs/G6E8bf/t6DtLUutuATqj4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzwokE+8OGAwe7Pcg63GekKoRbrbhdeNwUpc454y4G23tl+ZqXh97M0yYfJdWkdxGsyVEBnQVc2v+sWhnZrgUrqLcXGhG8A74X0lZbxb92rCwYeqttGIxr7t55gGiZyaGa+7qmreRAw0xJ7Eq81TjOKRGGYzahZJbi9iF9mFJDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdTK9wtE; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdTK9wtE"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6688acd1a51so4523179d50.3
        for <oe-linux-nfc@lists.linux.dev>; Fri, 07 Aug 2026 03:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786098819; cv=none;
        d=google.com; s=arc-20260327;
        b=Xkaalp5r+Pa4tlzjfT/KMlav0lU+IcbwrSZPKTWwHp0AFdonxwEDZN5c9Zpyar5P4O
         6xR9XyA+ikfndO+M1YlqkUQz+THSltD5zQnH7v/DqbTuUv+sb7Rr9aVcTO0eKDSGQrGU
         JT2wyrkn2mzMzROC0+i7fEUk2kJscOHVje/vkpLqIEndGUCG+zLRLiXmutbkmCgy5i2K
         It236cW52CvYDJiP/tmQ54mJhsfAWA0v1JA/0AsV2MDQGkbvXAgdKKf0EQj/qnVr+qXF
         +04JgXz1vwJmQva1I0Y8NHW125fysyUn3IxsEf0bmEJCAv83f54Wm0Kef/gu81nOZKSR
         nupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RJIxJB1wYVjtyjEcFQPOb48Sdmm9fJmPFHW/9ub+pi8=;
        fh=5kGSCZhycxpETL0w9h8J8A8WJoA3hizH5AiZAJtr58M=;
        b=neADCv6ZEwi0FXhWbqREBOZtuwCic+fHh1yw09O9Bb0bXhbyw2MLP7cgfYkIvt6AgL
         oHIlcBiDUBJCSHutmUfPURkiysZOlLKNa75vnEhNNB/IkW9zWaHOZGsee0t+NdcZQGBg
         344sEsaKy/Trd2DH3QsVELfwbaU4Tg93DQ99H6vIvadLCDLijmWxT3LRtJdgC/5lDwnd
         P9vdGuPA9uqB481tKc8kvNprankAevqhF2x/H2lr+kkpeMB66fkdwMw0GvJbzV8s6JuK
         EJHBuxLAsIRWYZW4snGVqBbIZiZArHvAzu/xobLKFdyyHKTMLVkuy6PVo7b/gGxrgB6a
         6avA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786098819; x=1786703619; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJIxJB1wYVjtyjEcFQPOb48Sdmm9fJmPFHW/9ub+pi8=;
        b=cdTK9wtEIubK9/YQ6zkzYRmFbrWsnch+iIByWlnO0DIj4fOWsdt9qaqmi3OnDM61YO
         IrBTPyGwQAoEsVca2q3zjTZV3xpTv8KrMwxb+QUipYVhfBitO31HofYB47HZ4g0LhQd6
         GGpFPiRzcOLU9osZHYgFjjnmGTXv23ZOWHlsLwAwReRnt1oQjPLsfqtdvq9rKZXSSSR5
         qJkKWZAx/X1rSY37lcbTTg8XrZqwHQ9sBFqZtl9nkJB3E8C09BfKotCKnz084QU4ZNvS
         URCB1KrXyEFcieA5/SoDzOZEHLEw0Lf4BhzWaMat8PVLu9nU4eAJ5vcoNf0AYZO/oTnm
         paJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786098819; x=1786703619;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RJIxJB1wYVjtyjEcFQPOb48Sdmm9fJmPFHW/9ub+pi8=;
        b=BnjUFtltEpxpndzUmCASsJnO5RTTDrVXkTNfm8fH0y/pirteJELtm9uTevsuIcL7MV
         hd3/NlxHvSE0WRB1qHAJsGtgkuyT+QgCRldnUJYdTKq124fwxEzxVkBXdK3qp3rprFSZ
         nPM4dp+ozHMkI4YGTz69c5c6ZOZOluqQzUANSMX+gOsxG4MPda2Xd56mP5afJ6IUA3ib
         y7gbencUWUjcF5nOPm8m79qEIJx/m+rkK6B0hTIoFm9OW6y9He885rQXxNs5gsEGPtc9
         lAuMKx6pxQngbpcpeKASFH+vhjlX+GngsK+fEpTG5RmsbtuFNJFuu0vJOlUuCyXplQB8
         3rnQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro91Mg0Yk6uraelN/rKSrkUWwd7OjABwhxSVbCBE0E0CBaEkkPcdAw3DfAcwVMryFBCfiDPN3xt8mT9wp4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVAXW6VSwUNSk749J2xmwc/cJPkTuwfstq5fn2eJ9XqaODZ54E
	6jpx6zfstzCrxoNia9nRZWGDYIQ8paPONTCVdVcPoDm6ZMYE5/IZ1J4+xvupWnLJwueXmpcM/X8
	bArveaSleZrGvJzx+m+Y1SV5u0lpQfi4=
X-Gm-Gg: AR+sD1033T4oO/d6MWSrLNQNA00w7d8FrIu9zr0mmX5E5GAW9Ce5Q4/vAuRAH760KOL
	RMJ8+yoGuzGHbPbFjdS+3Z3JHqqq1FIGpxhl8VFz13AO8LqjnVDr7dnOdV5Pv+x2gkAmTKlkgFB
	N9o5nO6652qxeegAyQ3QKwtmYP37skTlsWNJ0MopwiATm65DSUPb81tU6j0KQroJJ3cDvaMdQc5
	Ure2LzYmIh4xjE8IXTNxns0wOSdeapKTGs5Vy62XoV1z+fe3syzWahjR0dAdIvqeeb6SIXcN5XH
	+aZjDW9R78r1fSsulE8OkB1Qt7liGD696MYSZ8P5YQHfS+vYQ77S1PHLIafZXBB+BHyY8nmYAdf
	PSORhHtwNKkWO20VQDU0=
X-Received: by 2002:a05:690e:4149:b0:667:e855:ec8a with SMTP id
 956f58d0204a3-6699aad3ff8mr13607496d50.14.1786098819185; Fri, 07 Aug 2026
 03:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGBKPgMC98c5039=bQOjHZ9srMKfkL0HSrHwehJJEtwpRSfAqw@mail.gmail.com>
In-Reply-To: <CAGBKPgMC98c5039=bQOjHZ9srMKfkL0HSrHwehJJEtwpRSfAqw@mail.gmail.com>
From: vova tokarev <vladimirelitokarev@gmail.com>
Date: Fri, 7 Aug 2026 13:33:27 +0300
X-Gm-Features: AUfX_mz5RWyrIa1Szf0lg-Tq9a48F4SdOj5D3LKPV0WkO3ze701U_-WKDpkrNVM
Message-ID: <CAGBKPgP8BO11+_wCJEGLWkQ279q2WHOumfoWugFehrV-Cu0_Bg@mail.gmail.com>
Subject: Fwd: NFC SENSF_RES stack buffer overflow leading to kernel code execution
To: david@ixit.cz
Cc: security@kernel.org, oe-linux-nfc@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000a7008b0658728937"

--000000000000a7008b0658728937
Content-Type: multipart/alternative; boundary="000000000000a7008a0658728935"

--000000000000a7008a0658728935
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

It's been almost two months since I reported this, and I haven't heard
back. Reaching out to you directly as the NFC maintainer.

The bug: digital_in_recv_sensf_res() in net/nfc/digital_technology.c
copies resp->len bytes into the 18-byte target.sensf_res buffer with
no upper bound check:

    memcpy(target.sensf_res, sensf_res, resp->len);

An oversized SENSF_RES overwrites the stack including the saved return
address (confirmed on aarch64 -- crash at attacker-controlled address
0xdeadbeefbadc0ffe).

I noticed commit 1bec5698b55a fixed a similar bounds issue in
digital_in_recv_sdd_res but this one was missed. One-line fix:

-   memcpy(target.sensf_res, sensf_res, resp->len);
+   memcpy(target.sensf_res, sensf_res,
+          min_t(int, resp->len, NFC_SENSF_RES_MAXSIZE));

Full PoC (kernel module) in the original report.

Thanks,
Vladimir
---------- Forwarded message ---------
From: vova tokarev <vladimirelitokarev@gmail.com>
Date: Fri, Jul 3, 2026 at 4:34=E2=80=AFPM
Subject: NFC SENSF_RES stack buffer overflow leading to kernel code
execution
To: <security@kernel.org>


Hi,

I found a stack buffer overflow in the NFC digital protocol layer that
leads to kernel code execution via return address overwrite.

The function digital_in_recv_sensf_res() in net/nfc/digital_technology.c
copies resp->len bytes into the 18-byte target.sensf_res buffer without
checking that resp->len does not exceed the buffer size. A rogue NFC-F
tag returning a SENSF_RES longer than 18 bytes overflows the stack and
overwrites the caller's saved return address with attacker-controlled data.

The overflow is deterministic (no race, no heap spray) and triggers
automatically during NFC-F polling from ~4cm proximity.

Affected versions: Linux 3.13+ (since NFC digital layer)
Confirmed on: 7.1.0 (aarch64) with KASAN

Attached ZIP contains:
  - nfc_sensf_overflow_report.md    Detailed writeup with root cause, KASAN
output, and suggested fix
  - poc_nfc_sensf_overflow.c        Kernel module PoC (overwrites saved LR
with 0xdeadbeefbadc0ffe)
  - kasan_output.txt                KASAN stack-out-of-bounds report

Suggested fix: check resp->len before the memcpy:
  memcpy(target.sensf_res, sensf_res,
         min_t(int, resp->len, NFC_SENSF_RES_MAXSIZE));

Thank you,
Vladimir Tokarev

--000000000000a7008a0658728935
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Hi,<br><br>It&#39;s been almost two months since I rep=
orted this, and I haven&#39;t heard<br>back. Reaching out to you directly a=
s the NFC maintainer.<br><br>The bug: digital_in_recv_sensf_res() in net/nf=
c/digital_technology.c<br>copies resp-&gt;len bytes into the 18-byte target=
.sensf_res buffer with<br>no upper bound check:<br><br>=C2=A0 =C2=A0 memcpy=
(target.sensf_res, sensf_res, resp-&gt;len);<br><br>An oversized SENSF_RES =
overwrites the stack including the saved return<br>address (confirmed on aa=
rch64 -- crash at attacker-controlled address<br>0xdeadbeefbadc0ffe).<br><b=
r>I noticed commit 1bec5698b55a fixed a similar bounds issue in<br>digital_=
in_recv_sdd_res but this one was missed. One-line fix:<br><br>- =C2=A0 memc=
py(target.sensf_res, sensf_res, resp-&gt;len);<br>+ =C2=A0 memcpy(target.se=
nsf_res, sensf_res,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0min_t(int, resp-=
&gt;len, NFC_SENSF_RES_MAXSIZE));<br><br>Full PoC (kernel module) in the or=
iginal report.<br><br>Thanks,<br>Vladimir<br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">---------- Forward=
ed message ---------<br>From: <strong class=3D"gmail_sendername" dir=3D"aut=
o">vova tokarev</strong> <span dir=3D"auto">&lt;<a href=3D"mailto:vladimire=
litokarev@gmail.com">vladimirelitokarev@gmail.com</a>&gt;</span><br>Date: F=
ri, Jul 3, 2026 at 4:34=E2=80=AFPM<br>Subject: NFC SENSF_RES stack buffer o=
verflow leading to kernel code execution<br>To:  &lt;<a href=3D"mailto:secu=
rity@kernel.org">security@kernel.org</a>&gt;<br></div><br><br><div dir=3D"l=
tr">Hi,<br><br>I found a stack buffer overflow in the NFC digital protocol =
layer that<br>leads to kernel code execution via return address overwrite.<=
br><br>The function digital_in_recv_sensf_res() in net/nfc/digital_technolo=
gy.c<br>copies resp-&gt;len bytes into the 18-byte target.sensf_res buffer =
without<br>checking that resp-&gt;len does not exceed the buffer size. A ro=
gue NFC-F<br>tag returning a SENSF_RES longer than 18 bytes overflows the s=
tack and<br>overwrites the caller&#39;s saved return address with attacker-=
controlled data.<br><br>The overflow is deterministic (no race, no heap spr=
ay) and triggers<br>automatically during NFC-F polling from ~4cm proximity.=
<br><br>Affected versions: Linux 3.13+ (since NFC digital layer)<br>Confirm=
ed on: 7.1.0 (aarch64) with KASAN<br><br>Attached ZIP contains:<br>=C2=A0 -=
 nfc_sensf_overflow_report.md =C2=A0 =C2=A0Detailed writeup with root cause=
, KASAN output, and suggested fix<br>=C2=A0 - poc_nfc_sensf_overflow.c =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Kernel module PoC (overwrites saved LR with 0xdeadb=
eefbadc0ffe)<br>=C2=A0 - kasan_output.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0KASAN stack-out-of-bounds report<br><br>Suggested f=
ix: check resp-&gt;len before the memcpy:<br>=C2=A0 memcpy(target.sensf_res=
, sensf_res,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0min_t(int, resp-&gt;len, =
NFC_SENSF_RES_MAXSIZE));<br><br>Thank you,<br>Vladimir Tokarev<br></div>
</div></div>

--000000000000a7008a0658728935--
--000000000000a7008b0658728937
Content-Type: application/zip; name="nfc_sensf_overflow_submission.zip"
Content-Disposition: attachment; 
	filename="nfc_sensf_overflow_submission.zip"
Content-Transfer-Encoding: base64
Content-ID: <f_mr4z5bj00>
X-Attachment-Id: f_mr4z5bj00

UEsDBBQAAAAIAKKD41xmELOrjAkAAIEVAAAcABwAbmZjX3NlbnNmX292ZXJmbG93X3JlcG9ydC5t
ZFVUCQADH7lHaiC5R2p1eAsAAQT2AQAABBQAAACVWGtv20YW/c5fcYEUiKTo6diNo24KKIqdGIkf
kWxnscWuOCJH0tQkRyWHsrWL7W/fc2dIinLtbirAtizO3Pc991y9oIvTMU1PLqans8nJlKZGBHf0
Pl8sZEqXG5kuIn1PnQ59lmkiIxrrUNLJgwxyo3RCGyVoIk2eJjQKw1Rmmb10nyojPe/FC5rmcSzS
reeNKLOi5060LkVv8iiRqZirSJktyQeVmYxUQmYl6YtK8ge6s5pfZtbSUC2VEZG3TrXRgY5IxetI
xjIxwhpkVsJQJEWYkdHUarnLFLDZsjS71bKGp9ZwTxSG69LwLl1D+SJPAivSL3TOVDJLZbCZZTLJ
FnibNZo+TPX8RJpesgh65UEjg1WiI73cdgMfutdKZuTjwrrzcyQTn+Zbg08WqY5J7ILv8QmdZBJC
YTxHYHDc4bPkG5EupelWqv0ykPfKrHRuKFjJ4E4lSxsBr64s1NCVaAP/AylDK7e4nKl/S2r4COys
smJ2Pvr79OwfJ/QO2v1ml1OX6mUuOf6dU2qcykgFoklGLK12JAvZeFAxJ7Dx+2EQNykQSRHePQf5
eC0Q9DOraON0nrHp4pkasUmt0pN57EEgokimqIpMbOBUqazIZePLhJA6IdJg9eNh02VUGJYOwYs8
irZeoBOT6iizAal0hcIIEklYfco6jUweaWiTTMQ8gtXIWqhQF7ZW9KIo112xcR0iGiKdK5OiFUoJ
bJPKqlr1Wq3dkeeqlu1qtSIN5xFztVGRXOJEhv9FqSvV2rRaSNvOZYKeUBqZxipBf6mAGgkOikC2
URi0kmJN2ToV22Ybbv6Wwx2uGE/kCEKC81Z424UlVculTDPCQx0LfohgUpinnEFu0bWOOC5dQsvj
byQ9o/NgxbERu0qy5QO7MuRaBQpquhYwRkh9YJDRWyiB1szzOgUQvO4OXr+iBoQGsg4GFIktsqo4
nWFuE9HEpVEUEecfJRMgdXBJlLIb89wqR+kuJeAHEanL47izhLFOFiqNcQGhdTa86Q66fWqUhbVv
8gcEN1Vzmy3YfYLq2Rb3wtojcm0wvrw4Pfs44+b7cPbx7Hr0xXdFJcMhm5+EqVYhErdRAYy3l9jK
LF+vdWqqsGTbzMi4diBFSXGGXFNxHZeOVahpI2aNn6BcaIwGBF6fAez+FMva34mKQ8/zfT/wMkbl
gDbWj2fPIzLIGkHrrDwEp6kV4nfbXUZvLNsefd+rkJfdzRhIqMV40/T+49WesS4HqeT+/OTZx70e
7dAp0DHi7pobJW7hmqPpcBD1C/QpIbu8faEJ6ZFpZ65zdItFZZrLhU6lvRvLOFhvh/a4e994DO1t
qr2trGn+VKrg178evfYDUH1cvzI4LsZO40m4bxIhtZGI1zJsV1DZKUASNen9l3PqYKU+XjYiQkdr
wIJKRDXWHsdpxzAWqYglYC9ZmpXHFrXpfqWAD+hHC8xPKbcAjhAqxiVWqcLdvK9NO/rbO3rSPZ8a
g+NmPRMYy1sHOVeAzAXDE/o9kGvjfLzSY3QQo0YJxzHQJZJuGqVyiY62OEiMqjG6qw4hrms9gFWc
Mzbb6VYfowhL0wKqqyDHV0qzv7pmxtjgCcRTOvQql6zRYFZGrmkwBFdTUWglRVq4scWmO2NtH85F
tvJelAeXQiVZWfaFa14s7iR1xtSL1Lznrma9Hxp5wrnqpM3e3F4+f/fD1bcPhWwg3Av6UuosgtOo
5kNBDX4foJyRyLDpQS9OYT4EM+4/V+Xl4O3e6V19OWFDb9AFu9wFesFW/jHKBZ7WgHT2YXI7G4+u
prOzi9l4Mva9A4wjDKwOECk12WMqU4wsDAhooqN+P8681136hum3h5+OnsDwcFfRX9u7FLqs0Y8F
a9sRn0PHQCqW4YgMHb4tenItkBK/6vtfBsf/9FmuwPgqMLwkPNzTjvOA4zT2WQkqCkRpsciQ2aO3
tTo5GNLlPJPppqj9lEvChrqkGvxJMWUcens3dhZxWa5QXVF1dC2WbBMTBQmroXGjUpMjPCX7CjGA
5lIu5iIM+hiOu8SWJ/z+w+NDPjc3G+cAZR2BnoQsnT+rHHbOtZn/b8rIVLxuj9HtR6Zoms+j6eiC
LnOzBmVu2HTZjzrF4C18bLoIvL/5OHTPhy71HTDtjl44cLf04dmp9qr/MBgEvf7DwcGx943TzQhj
Cfebt+wWG0YLvI77/f7x0fHRm+AgRDmgM7M7urvXKWzp9YeD3qDved/wL+KdyyHJDchSVmm+/20W
xOEMwwqLELauMeoELA3Rw5SZzUQmkpmbNDDp6BAWib73nXY/pwSHgj7ODA4Cj0kF+Ek204mcsdV4
eCBZD/rII+fHzKyYlfCjIxZ+eNzngmDIt+NgJTIakJ7/ilELs395fdCmwQEA+6XDqZeuhJDBs3gt
AsOksNWy/Cxkhip4e2y1huWaus+cC1rl5kvBl0gEbLWVc5YYuUwLCaOqmgC/ACK1wERKKk5u9wPH
IsAp7fXRRqio2GDrNnBLUeODnjYxHmk3zB5Z53nj2+mU2e0Qwo67xyD6jdHtcNQbjYdfeleT4UXv
5gy/psOb3nj4qXeGn9HwE4r0QhsUBJ/FjfBX5DwxdCENB52HHS9WstYjO3ZviXq5tXl2a6P1apsx
nacg0qgHxpNyQEp7MbPbF3x+gru+2/rspf8uxqgtuwmhL2hsm2IOooznErQudNSVOTYbUjvOthaj
qRihHboq7frDmllsyUWNOK8EkpkkAvdObdTroR7S1WhMjSuNXQEZHu3tN02Kc+DZHMECVCKQuD7f
ApkzTF/3XQYmW8ZE/1Q9IGtMlgqoKfZ2x2qe4nuOD3f+Mud79T03cKp4gYrMTAPe1aS0n2ZETUgv
m+qagfwkAY7rhL9Lce3l6pgrem/34cVtg/dNV/y1DYuPFpsR6nFyzgsSn7k95ydfT85vqscWej/d
nto2xFwrNszDj+9pMjrHGxpf3WS7Ll+yhKeqrl1+anH6HUoDsbfbrlsEeWsAZUTe7a47vR6NP19N
Lq9PxteXE3dYPqwjrdwXSG6jm8h1tUraAYqqBxdxDKpkWPussOJVuwIuuBWoxyOWNCT//3Eh3/IP
ocyOQBHbylt3h+mKrX3HtZhdlNO9Ps7LKfPcwPWOoKIagdXuCRh2svy/OvNcMZ2qqECJZ7wL/NoX
ikX4ENA/53pIowOEtotBQeQK5vaYg1W0ubZ4PP4WifZo1dPfIzlm+UTsuuzfnR2u2rKJrnkw1q9T
njEuoqnkRX23EAXV9wmGGy7Nk673P1BLAwQUAAAACAAqfONc+vj94rkIAACmFwAAGAAcAHBvY19u
ZmNfc2Vuc2Zfb3ZlcmZsb3cuY1VUCQADEKxHahKsR2p1eAsAAQT2AQAABBQAAADNWG1z2kgS/mx+
xay3khWOwGAnvsQ+p4qAcFHGQAFO9m4vNTVII5i1kFhphO3dzf72654ZCQHCqf1wVedKYJjpl6df
prul01MyGXV+rvWFy8OE13oeD6XwBY8vyc2oXzurNyqnJxVyQgbdNpk4g0mXjp0JmUjmPpBPqe/z
mAzXPPaD6JGMojaxxp9rX85rjeZZFdiQ83MahDxmMxEI+XxJQi5PQ9899cRcSBZQyd1FGAXR/Lnu
2iTbFSGNubumCcDyYZlYKI4QsuRLd/VsSRbPuaznxzYpLOFjVfsY8NDw5Ee/gBU0t4LetX6e9P7t
fCUiIc33ZPYskXuWyo0EPEpDN2DLFffqWlyLxNE85eiSWpdINgdymcahCOeEFZwUROEc3CMXLMzF
E5elCXwxg0z5cab9GBk/2mr1GAuJEuWCA1MQ8PinhCRszT2jjjDPA5xJ3fh5FIslsKz5JWlHoYwj
4NmlzSVzEsEmi93FxVtiPQq5iMDsUatdNUYOfT/hkvhxtCz4r/GVyCgP0uNv1F161I2Wq4BLnuPr
j8k1efdBW2zkTRfgSUyQHEGiTMs5EANpPHmceTPO/Rnz3Aa4BfWtYmAirjYqM9d5WnFXKguTNJCX
Ws19yGaBYgKve7B64HHIA7Jic3RmzH9LeSIJk2QtYpmyIPfMrmKjpgVLVHNJ+iJMn8h5vXn+hliJ
CF2VAZkzSMCeIYYCMXqpK0Wks28ai/kcr5POFqvLA+GyKllBeFTCzJkIEZFJKkwn66+37hKtfsKI
Pis5veWKufKS3Gp73MjjhD9xN0VNOkyIJmfSQSXj4Yi4C1CR3UYVhyVABN8kYpkGDCPB9lJ6LZiK
z7Z5rVFPxXMQgQsxd2FPQQGhIvxVB6RW00kbs2SRu7c3UZuAL/IJ/NuJ5qdUBOBjBhmaylrk12TM
8+AZuJmr9N03h8omCOklAQAJUIJnXQoFxpSO7FLVHyKdIerPUuDAcHSSCMlfTUhygOQhApbKqIbx
IVIHT2dqJgk9eVr5ERIgSMHyfwaYF6caY33xce9E4yw7eYziB8jHtJQtecCyUHbicQjG9kFWVOF/
+YEJIx5WfvS4L0K+qVS0fdcxjmk8NZolBJ/uuxRLJYFClh+3W/2+M6b9MR12uxNnivzvPuTHw8/O
uNsffqGd1rRF+84Aji/+sRF++4lOh9NW3xypsOzzvCHN6gbyXWt8Cypbnc44C2VJzbjv9ysVKK1S
uFBhY7iNBBMiK1seX5MTDz6vkEodY86sYrEmf1SOXubIjlUQuEcxhlBWVsGzWh4gwJSimFIZUVF6
sYZSSdwZnK8j4ZETd0Yh168q36527ckBn+Dn5ljxaTi6AMaW4UDF1KxP8Ee1sjG2IA5KN95NuGo8
ppFvIam9q9auHOEfKVheVzI39icPFBOYnEAiw276HjzIJAOoR8In1g/QX91ZFeToDoX7QAnaodeB
Flhb2ynyhpyf2eSmO6KQAgOnj7qUJCCtYuCOlEgLPjFUNlE/0YE2ccZjOpqOrZozGN45d1Xk1eSg
cAD5clUAcvRNY8GOx+M1t2Btk+YFMqEJwIKnq1Tqky2YSAQzCvROC2ltSM+3zX2aytHpyeZ+XapW
SRogGWaOuVzYeqOpgrFcQiRtMz+c1T7AJqSP8M6wDilE2JeviZW+r27pMXh/aeLp1m3PTs7wBO78
WbZxrje6joE4zOeFvFFD74z0cAAtfm8+qFeOoMxmoKAtaFcFwU9gQhJtzxLXJMPHfKlGJegQQKuF
TOEX6EuCSKIg0KupIRN2S8/XuvKFGQ5fH6azyWsrvXhb/aNQSb7Z5L0KySqGudOPrOOtFnKJmD3s
1a+8mgrLZsQ7hrQ5trLOAAQmSisGfWpj6ivva/U/4THemq0A2SVFslZSdhXj3i6m2kHI+9ECcNns
JWGwNfPWqyB4MtB2nWUXy6120MELhnfwqrJzpb5tl6VNEfw7pUlVSqy/2QKSBr5qH81vrAIhTOxu
VlnMfu1jtEoAKV/TdKXrQ+zqq7N3nPGosoAyYhcrE3qXx/GeczUT8ZkIcDB85aEDAUFV1Y6jXIOh
u4Y5IuUIrwQAOCiWyisZCBunMDoaD6dD2nX6vXYLHlQmt1BJsoqn0R0AtxFYDpAHCdfcpYmjGJUM
7tn5zENYvOQopVqMKvod2eFhDVqGL+ZpzOni0TrYQW3FIp9XXK9WLGZLFWzzmNI4IB5vIPbJl0SX
9B3VpmBESJsXRIolh9nSJi+2Xlun6gkktcKFIXzwYRZVDSnLcuiA+g5gMuYbKvNV985+493AjoY9
/ChxFxxnRFqcDKzXmnbTR20CzcNNKNyVX4UPj+KJ9U71q5dcJOf/0wiA+P+vCBiw2M6nk/vR6ADo
QCRQ6l6CXMSloP4tbC/BUJSIg80iuJAvuk4Jcxk8UgbfyY7S+5dALXcXNPZfsnQWRQHBh9IDsYb8
wZ61LwDKlNKC39dYR+s79x12S6qArQmzvFGj+vXufUaiPE5mnr/ejp4hKVG4s2sISxQWdpEoD8iW
wnwXSXKPbpHku3ZxIscoUDBKZNVKSAuDrzy9aU1qvL4mD7+r+dZKxO8cpms1vldLx1p1ko+lxIyu
KKo36E1px+m3/uV06Jfh+Lasimw9BKDQg1zbDyf2fp9Wvd+Uu2JmKEuYxIq2Fi4HeTpN9NNBaRcj
fxa6G646zki3t5yn07vp4XzUGX+m7dZoQnsD2h63yZ+HKaY3SKFFNAqN8gcErXu/KiGW8ulViVPV
zL9pz8bAmM8xB+PMQM/MCKYJK8FFelWmdmgPaMakUEoPNeIgYp5+mfIooCWbtymyMLLtjGcvN5jd
IO83mUbjYJtRtYxS/mRyHBebHC8pXDR5Dt1y1dWdp980POTl78ndqorfjcNWGMA0/cJGX9fs3sKJ
2VYWZqbC9t2wc993KOQxjOGOdXwz6h9vtjvOpD3ujaa94cA63n5Trt/wRsVX5LXiO9Dvvf9ELf8F
UEsDBBQAAAAIAFOB41zjwLqyKwIAACkFAAAQABwAa2FzYW5fb3V0cHV0LnR4dFVUCQADzbRHas+0
R2p1eAsAAQT2AQAABBQAAAClU11P2zAUfc+vuNIeoBoFO7RrFmkPrKBtQqBqA/EwaZZj37RZE7vY
Tj/263fdVu2GGAJmWUrkc+859/Pj7accLs++nV3n4INU065tQ9eW3cK2RnuoDOhqXAVZi8oIh2ou
PBpf0q9/y5acqxO2TNMsuXNVQLAl+OoXwuA9yABSawclnYwxlvWz/kClGooVBOmnMF1YN0V3wnJ+
wlmSDEe3OTC4/XIeP6P44QyGtmnyP23h2gYiqExADYNjfszgTa8Ho68XF1ejm+SzdHohHYKRDeZQ
V6ZdHum2aVbdeeUCHJ7fdJI7YrtvsSUDnKMJfpfk4l6oRgtlm1mNAZOhrGsITirME/ATuxDrKsXU
s5h5Dw6HnQRIYLZBRD2vCX3HCM1YAjNHkVK1ZtaF6DWIBevpLIGp9NLskSJ6lLt3NUEic9KMMbqx
iHJJsBBrvMFGzVYE9XuESFJ6Xp/+lSkZqbVGqmLQVqH3whoUsfIEphh1+oyENr0QYeJQ6gj11znF
bKe7R66iPde9BBwGUTrbiHJDxaNOSh2/mSAU7Xi8Wk8KCUKBtTVjD8FupjEO1GPDAtJoAtwYw9aw
dNTvJ2vAthUg2cpv7SfSAwdb/EQVqMHfT9Mj4GnWgYMN+cFjQZJ3bZWM80frsZGniZMUbP50G3Yh
XGFj3Sr60tJIF3cNwkMhIvtreYqM0WawF90HFIoRRcn391kUrz4/HsrHDMrT/X15Bpq9oggf/vsk
vwFQSwECHgMUAAAACACig+NcZhCzq4wJAACBFQAAHAAYAAAAAAABAAAApIEAAAAAbmZjX3NlbnNm
X292ZXJmbG93X3JlcG9ydC5tZFVUBQADH7lHanV4CwABBPYBAAAEFAAAAFBLAQIeAxQAAAAIACp8
41z6+P3iuQgAAKYXAAAYABgAAAAAAAEAAACkgeIJAABwb2NfbmZjX3NlbnNmX292ZXJmbG93LmNV
VAUAAxCsR2p1eAsAAQT2AQAABBQAAABQSwECHgMUAAAACABTgeNc48C6sisCAAApBQAAEAAYAAAA
AAABAAAApIHtEgAAa2FzYW5fb3V0cHV0LnR4dFVUBQADzbRHanV4CwABBPYBAAAEFAAAAFBLBQYA
AAAAAwADABYBAABiFQAAAAA=
--000000000000a7008b0658728937--
