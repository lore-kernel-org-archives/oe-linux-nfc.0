Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F49374195
	for <oe-linux-nfc@lists.linux.dev>; Fri,  7 Aug 2026 10:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786098781; cv=pass; b=WpKfimOU2lee30kezp21oV7/cbM+X0y0bUCsqL/8HxQHh7CGdXsNCEnbYKojrWWk6Ls4pHbjKT4Ypl1m78LY/H1MpkCZnx61tkzLtFzJYlOBpqZk0w49p7dbkSipFmrbzznhpysp+2NepnQwMCsWyXE3CrdLq3g0RFGPepJ7q6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786098781; c=relaxed/simple;
	bh=jD57XeFlZHLl6b8pzpemvHGm3wwblzjKBKOz98KM5o8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObsieO3T/g74O7CAIgXsJ4p8RU7zPyhmi2ZI7Vsgz/V9wsrLd/DQU/xcaWcv72qTEppnkZd+3jyyoNYKudbFDLjDAUgw7WO7/QX6bofn2qK9MHGF2x/EhY78zM81PaTQcp1e+vnSaqAmagn+z3F3LftecueWNjPSZ9yYYdoSEc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCSjG1SJ; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCSjG1SJ"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6689402c7bfso3672587d50.1
        for <oe-linux-nfc@lists.linux.dev>; Fri, 07 Aug 2026 03:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786098778; cv=none;
        d=google.com; s=arc-20260327;
        b=QRtCdDLoym7uaT/pYuqWSZ/5IvkprxeIdG8r1WyTTMy0S0JXXOcNs0CQ17Csj2pqzR
         2UyquLJSfD6YsL417eswn8u8KN4anSni5AmjTfZuX8+aavXMjcy60XsLFO+dXLPGV0aa
         miAd0nbrwPvTStudjBOw2lPV/R6qff/Nd+TEY4BEMVhwXj73fZqLyp8vXazJwqd0hZHl
         ERhEfDFoduXqapDqeakRkW33fWLQX74ltxkCoWDY4EBpmpeJVfTFmQaDIU6cUIkc5/5V
         Gyr4CRlJ/ouPlbBPRYyu8ChGxxvZHdali7yAmi6v4o4wz86A9Ay6vfNY9KrQsqQ/fH+N
         OE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cl627quQ5xGVisLSBJECnm9N5UVA42mdYE0WQh0ghiU=;
        fh=7hYDIDCjlEgmwf8Ted6qhLxNbTetybYODGUa+9aU4rA=;
        b=ZwVCtrXC2eDiOESOobW1ld8nUjY3SUu3CYwTykzAEOoVvL6lkYpSKO07vdMw3MnJ5U
         vw2MbujwYKq+Mjf7VvsiaQPzAwpPt3VHmKMDIgfN4jhYeU5G00x5zh8vJ0gNPH1yPtM/
         j8BxTBGftKma9F1Xf9Lquww2Xg7ACtrYkDBMc7c9JRY8GkWTP9T0DXLRe9GuqiSvSutN
         GfGTRrFrHh3MTp4Vta+o/FddPcNdSkcUzLvq2BUylPYqMhM0rs1Nf5NUe7YUYW/GInEX
         pzPHVhFkySZkUjVhSW40lN5geEitThBy9j4+rwwFC7svKyW7Sg9fPmWgcAtwe6VQoA57
         W2Aw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786098778; x=1786703578; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cl627quQ5xGVisLSBJECnm9N5UVA42mdYE0WQh0ghiU=;
        b=KCSjG1SJFf5BqfsCgNZFeGXRcPlFSCgkIlmUsc5LXmN4aBNKH/r3cU1rGV2ILBqjFT
         z/CRMvY0GTc1eGkkx8WGAokDsX5zPi/qEKeV+NaQxSyjv8ha/kJeDhkzKJrwjSH+4CJL
         DpIgaynWiqrkHURApiv7LsCgRHslz49Mveo45FQzSMuzjvHI7M/j/SQmPFYHLuKdxwL8
         VwHq9gcYlrOTki26nXhymbjhsr3Wgpz93/gKy5bb+7CSltRnaxta6V2VF21yxdRgEBEa
         E8kZ3Jg/NUciAJezOq5SaQ+pAJD0WiI3Kn8a0fzNOAVtqb0OQFhtVR0L194O1IGiOL2n
         RxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786098778; x=1786703578;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cl627quQ5xGVisLSBJECnm9N5UVA42mdYE0WQh0ghiU=;
        b=EspSUi9kTMgBS3fOquSFsdPlttHhFQ+26c6RZ3mGhSkVjhEi3SnrDQgKFi1PpId04z
         wQ7Yh4x3muD79crH3zm45sm12CuqNPrT5ItRFoKImfr/YAbJ2bnyzPds3irbdc4JR/kQ
         m3VXLb6GYndQsUEiqo25W+Jt3aT68NnlojVgeRLQdcxbILZZVYF1OCSaQn01GguClXlM
         oYTPlUr8XI8O22ke9JmtG55wKE+MAywdpdjhFTBHl5Yse6C+KhzyeaFLIknEzBdj/JVa
         tMDWc0P9s5HyfqunpFqzr3I6e4EYuCFIqiVyLoHiEGSm56YROmPI0Na8WFOFFhsrMSiw
         s92w==
X-Forwarded-Encrypted: i=1; AHgh+Rq2vPg0ocIsn6vFRw14Agk6VKx3gUTLOuk03lMz5SNEQFkCliKtIionVAlTpRUi8s3OmVUZW1mHJ7J1Ick=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ1O5GKUGiZWcnAF3jMZhHNTNStVKD6I+gyPdd0+1iny1Pv/os
	LB/ohMsstyaVNw5ZfjpFCk+c2O81cYI4ZcmE5s55tgVvWA5KwUUPfsH3NTIvZDRcJDydWaDf1IZ
	VmavaM4zn/vHRJfgijO4ilZuQenBLhC8=
X-Gm-Gg: AR+sD11gkGEDI1AxjsNInTbAVbI6zbSFlshf1T68wx/oINmRsz4/0VnwvVvXj5AV4JQ
	K/rZOjguPENSf+UF2f+sK/d9M5nQ9NShCoK+lweNrzSZHckYLKhiEwsOPjhq4xrHn6Sv6WGPFn5
	Kl/ploPaAGlh+WndIQlusMjZTRyftQWsoHMp/hI0TpFhd1zg5Mc+5n+p+kmIedP6zwcWc+AM3RN
	kn7vrn8FJfq//deuTNyWlnSmQCHy1Jr2PnmbBmsU8OqPel/4Eq8G/GSLTgr4YztFNFwXp0gaaB8
	SS8Xbgm0y1b2jM06TEbrljtn6cEr84eyKB61OUMTiE8PfvEV9DHT4YzUuERixW5mfaa2+i5L3td
	rklRPsMSJur3xq6n1NbPXLJpZnF95tw==
X-Received: by 2002:a53:c68f:0:b0:667:ae8a:5207 with SMTP id
 956f58d0204a3-6699aa4a531mr9651956d50.26.1786098778325; Fri, 07 Aug 2026
 03:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGBKPgO6_A75gVMj47d-TpRniaXQsgWfDb6T1VicmytV8GCLdg@mail.gmail.com>
In-Reply-To: <CAGBKPgO6_A75gVMj47d-TpRniaXQsgWfDb6T1VicmytV8GCLdg@mail.gmail.com>
From: vova tokarev <vladimirelitokarev@gmail.com>
Date: Fri, 7 Aug 2026 13:32:46 +0300
X-Gm-Features: AUfX_mxu87k-noIxGiYE3foJsSRjoFQON1x35XvhNBJpqworCYgQqk-TwDw-YAg
Message-ID: <CAGBKPgO1J1+2B-TTv3MX7J+zFeut3NRZG+DzgFu4Fhm588VXLg@mail.gmail.com>
Subject: Fwd: UAF in NFC digital DEP link-up (kernel heap info leak)
To: david@ixit.cz
Cc: security@kernel.org, oe-linux-nfc@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000392cdb065872876b"

--000000000000392cdb065872876b
Content-Type: multipart/alternative; boundary="000000000000392cd90658728769"

--000000000000392cd90658728769
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

It's been almost two months since I reported this, and I haven't heard
back. I recently learned I should reach out to the subsystem maintainer
directly, so forwarding this to you.

The bug: digital_in_send_atr_req() in net/nfc/digital_dep.c stores a
raw struct nfc_target * pointer as cb_context (line 522). A concurrent
poll cycle frees the targets array via nfc_targets_found(), leaving a
dangling pointer. When digital_in_recv_atr_res() fires, it reads freed
kmalloc-96 memory -- leaking a kernel heap pointer to userspace via
NFC_ATTR_TARGET_INDEX netlink multicast.

Triggers reliably within 12-15 seconds using nfcsim (no hardware).
Full PoC attached in the original report.

I'd appreciate any feedback when you get a chance.

Thanks,
Vladimir

---------- Forwarded message ---------
From: vova tokarev <vladimirelitokarev@gmail.com>
Date: Sat, Jul 4, 2026 at 10:14=E2=80=AFPM
Subject: UAF in NFC digital DEP link-up (kernel heap info leak)
To: <security@kernel.org>


Hi,

I found a use-after-free in digital_in_recv_atr_res() in
net/nfc/digital_dep.c. A stale nfc_target pointer freed by
concurrent nfc_targets_found() is read by the ATR completion
callback, leaking 4 bytes from freed kmalloc-96 to userspace
via NFC_ATTR_TARGET_INDEX netlink broadcast.

No hardware needed (nfcsim). Fires in ~12 seconds. The PoC
leaks a kernel struct page * pointer (0xc51a8000), defeating
KASLR. The stale value also corrupts LLCP state.

Affected: Linux 3.13+
Confirmed: 7.1.0 (aarch64) with KASAN

Attached: report, two PoCs (minimal + info leak), KASAN output.

Thank you,
Vladimir Tokarev

--000000000000392cd90658728769
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>It&#39;s been almost two months since I reporte=
d this, and I haven&#39;t heard<br>back. I recently learned I should reach =
out to the subsystem maintainer<br>directly, so forwarding this to you.<br>=
<br>The bug: digital_in_send_atr_req() in net/nfc/digital_dep.c stores a<br=
>raw struct nfc_target * pointer as cb_context (line 522). A concurrent<br>=
poll cycle frees the targets array via nfc_targets_found(), leaving a<br>da=
ngling pointer. When digital_in_recv_atr_res() fires, it reads freed<br>kma=
lloc-96 memory -- leaking a kernel heap pointer to userspace via<br>NFC_ATT=
R_TARGET_INDEX netlink multicast.<br><br>Triggers reliably within 12-15 sec=
onds using nfcsim (no hardware).<br>Full PoC attached in the original repor=
t.<br><br>I&#39;d appreciate any feedback when you get a chance.<br><br>Tha=
nks,<br>Vladimir<br><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded message ---------<=
br>From: <strong class=3D"gmail_sendername" dir=3D"auto">vova tokarev</stro=
ng> <span dir=3D"auto">&lt;<a href=3D"mailto:vladimirelitokarev@gmail.com">=
vladimirelitokarev@gmail.com</a>&gt;</span><br>Date: Sat, Jul 4, 2026 at 10=
:14=E2=80=AFPM<br>Subject: UAF in NFC digital DEP link-up (kernel heap info=
 leak)<br>To:  &lt;<a href=3D"mailto:security@kernel.org">security@kernel.o=
rg</a>&gt;<br></div><br><br><div dir=3D"ltr">Hi,<br><br>I found a use-after=
-free in digital_in_recv_atr_res() in<br>net/nfc/digital_dep.c. A stale nfc=
_target pointer freed by<br>concurrent nfc_targets_found() is read by the A=
TR completion<br>callback, leaking 4 bytes from freed kmalloc-96 to userspa=
ce<br>via NFC_ATTR_TARGET_INDEX netlink broadcast.<br><br>No hardware neede=
d (nfcsim). Fires in ~12 seconds. The PoC<br>leaks a kernel struct page * p=
ointer (0xc51a8000), defeating<br>KASLR. The stale value also corrupts LLCP=
 state.<br><br>Affected: Linux 3.13+<br>Confirmed: 7.1.0 (aarch64) with KAS=
AN<br><br>Attached: report, two PoCs (minimal + info leak), KASAN output.<b=
r><br>Thank you,<br>Vladimir Tokarev<br><br></div>
</div></div>

--000000000000392cd90658728769--
--000000000000392cdb065872876b
Content-Type: application/zip; name="nfc_digital_uaf_submission.zip"
Content-Disposition: attachment; filename="nfc_digital_uaf_submission.zip"
Content-Transfer-Encoding: base64
Content-ID: <f_mr6qrn6f0>
X-Attachment-Id: f_mr6qrn6f0

UEsDBBQAAAAIAAan5Fz1x2ddHQ4AAA0iAAAZABwAbmZjX2RpZ2l0YWxfdWFmX3JlcG9ydC5tZFVU
CQADO0lJaj5JSWp1eAsAAQT2AQAABBQAAAClWm1z2kgS/q5f0bmtugOCMHYcJyGVrWId7FDB2Ift
7NVt7UmDNGAdQtJqJGzu5b/f0zMjEATnLnvUxsZI6unXp59u9gcaX5zTx2geFSKmj4MbGkXJwr3P
6F5Jtz8rZO5e5FLS3YMoKJYiVFSk9FnmiYzpkxQZDZNZSiMpFo7zww90Wy6XIl87Tp9KSBBawowl
rMo4kbmYRnFUrEk+RapQFCVUPEg+tHyihZb6J6V1Co1OTpanRRqkMalCBAvcDT1kIqaxVCSo1TIP
0QOrEkGVfCmKKE1Y10WrxcpCj1xlIpAd5w5nzcok0Hf49ggvSrxcBitPFDneqEbTZ738RBZHySw4
qm4LZdYJfMrZCY5gfWJJviryMigIN3qFyOeyoJZPWRolMJxmeboktj4kf7EUcZwG7rszn5Zymebr
DrwqnVN3ui7gHhGXkmBcOpspSOnijfaNeTyd/l3imIZvDnF/jMInv0mRommeijAQqnDqttIqEuTD
kV7/7m7i3fUnl4M7bzj+OPiLtk4k5ur51UcPYfdGw/Fn7/7Gd+YSUYoCgvUxUoGWZVxELJ7kSiZF
x3F+WpPKcrGOknlNwR37VJwW9BgVD+RnUSa9aTmbydwnkeM5RQ0o5+gr7OuX5M+CpIgbF97t4O5m
eDPwbv/a9JttVlIUHHa4EhFKVzBOHxmnj/jo1QlNo0I5cJTYBCITc8khsHlhI8Guhq84KYyE7GGt
YFZsQ0GxWKdl4TRW+HuJVMrlHDkCHUI5k8go2Gol9m9HE2gWmizkC7Myh8gcOZ3FKVKFswt+4mQz
6kPab2WE1KIk1cn9IPLwUeRSZwDC4VrZPtJIRUsf0cuLEtrhZieUqwgBRSGsolBnfVbmMkYU0lnB
UqpTVJnPOM210GmJ6OTRfM4+w+0RlF07HBNE//jEPX5NCi5NUNA6S7eZUyo2itXcz4UghW/whNPY
GOSf92+8MVKr//FqOPbbSNRCRLo+dQqWSZZHqyiWc+QIn0GJWEp9kGp2NGT0kRtBgctfoAFcpxzH
tYjwqnP86iU1oBD0qqEChwuiENo8DUtdzk081I9jpFjwEBUQWLJ6opLdYH9EGnAqq+rygjSULOE8
TWZRvuSCS6wObzrHnS41BAs+O22atP7cv+2PtfaTFKl+LmCa49QRRckktIjyG2c5KvswovRen5yg
YopU60u5eHS+DSoN/YZjhF8pYEyu3B/NbeqXXwEKQjl+sAzdH4OphwgX8qnw6fFBJvRbKUt+EIXV
v5tQo18gRaYl4GeCgEpVNKsY92CN7wdOHtAH2jcLwhshjm2TWkzb9HF4Obzrj4A0E28yuPUmP9+1
HXru9QzqtsmY0HzPB5vqsWC3NV3/VoftBlzoLuBqGBIcdA03TvqY4P10rQMepFx14xQlAUSSnFdB
WiYF50YhFjJ5b+DBHihVIDKpIcPxTSF6kL5AwII0k8arOnZh1cuEWidB5UbtcTQeB4kVlDkOLOI1
a5rIRxyCfA3WAUoFSBQrXf424MqbQa3QZI6zyRytftB78/YdRzQKHjT6Ko1HucxiLiuthZViXFAF
c8E3N+p+g7frfyLW4/vR6L1zdESdTocWQMOwzBrQttKrzReaJkY/s/V82mOaL7SlNDOo8HxrbVNU
MJjLaGX9ahpp5XGBp3GSb01iwrHT86hRAvdrfbKp8ct5tstWxisG5oBWaRQ+l4ONWt1ta3RFLZPs
+tEWdPlGdtdfVppa6P5HLZyQNZ1/OrVr9Qq3vz8gZvP3RAjBx/74Eo35snKOftKERr/VxamVlZnH
CO1FykO4Qh1Tc2FVFZZ2n4ne+0rQ//T62+b1XY+Z2JmwmEg4/96WtqE7kc6AZMth6GsOw2YAsuOt
kWXmaS6CbHLqsGrbFOrj7M2xX8U9iYWXlYWHtGks1bxNB0lR5SUPTmpW+c9kKMYz3oYENf64UWcm
lhHXspbZ1f9dXtxA8vXV8LxCMTSIDT+mQY0fGC/cpOcVa2BPwB33/Qv2ARMVqlPbUBQCFh13aARX
bYlCo8YUyABUm1lGxTAANDKUYdM56YCbT1UAvJd8wqH+vuV68zwtM/L/oP2s/uA7rzpQ/wFtrjC9
D8AmcsFtSFqiJ8LQW8g1I5amh9Q47b47gxFr1XROcbr+8PXxyWFOaDC9Xr5MEpFH3+aJbbrpX+LN
8K8DatGJue0xBwPg7HjdoQkn0kGqS2IOpgKDNldvkRF33s31aOQ7Zx3awBsHRQNbew+LqhwHfxK7
ZrHmelYBvsQiYkax5cpMjzt0XSP6uy6JlDZ8h9HyT59cFwfZvKioakVxnTeG+XHu4JBNhW2L6xsz
gfO2wyOfLbwqIWIMaZwj6E+ZIVRsxC61xqgXhhHnNEKHeigOqMABKdiZKWVM8lhqUclhYJY9Rxd6
HAeZtxSBBTKEU8cSPYB7elw1Kq5SQN/2D7/toDXmZVZUU8lodH5D+iFzAMOKZgEKVcBkJykMtnBl
efIpeBDJXCeN7sWamv5Q44NmwuWi/uXFixe/0nB8NwDZuWN4Hg36n3uHcQVadp+C18fibbfbtW3D
jCJpilEkjhZ70wzpaWbXxS/2cdPfyvQtiB6Ssj8TVRHTCcvP7E477SpuhxL6QDYf6rk6tY3vDE5c
lwXQ13jup/vLnvm4hxvF1N1bEYBBPdOZX3afXp0FR92n07NT+qXWn391JqhBNldF/5B0yswASITR
Gy+4pxu87b55hx8c+kIooCqTFZkfdXvdo3fgMBV16ZkBV21UePyNiS4Y9DKLJRJo99hz2IwBC9XS
c8jzhBIJmKEIT6HqtAtNg8D5HdY8dzoeCVjq8Umw/wQGQ7A+5aWJ9Ng23HoiT3Hva844Y61XPDBW
8aXX+uC3XZNPGIvma+0xiKCpjNNkrlc8nB526QCX7nvTsexz74FABIwPm3zYxOXd2YHTdBUYps7h
4TIHHmPGxWOOhcp3Z2Y9YjKUftlXpL2nmuw2t513CTAreJpstXQhh4hvJHj/1Gr1yC5e6l22IqG2
DupkBLUL6KpG6g591HsBxek8mnBy5UgfofcBVVWZnYIBZU4Ug+u5tDJ4RsYoAFc98lO6+SLWdkkB
z4XRTM8oG6Q08WAhOG8l8s0KRitvuu5UFo+SodbO/h1t/hBmzXNr+KEm8b8gNB1AYb1M0ljbqAFw
DWM1LwHEUgWxEGOZrpKxNLN7W7N9M9EhZBgNvGr0g27cJaFXtXLbkmHNGeoM03Cc2smY0XLNtxRh
7tGiYYoVzjR+B/2b9n4QpAcQoPmD4WQhrunA2pPbm9UP27LOpIspe6b7iyYER7ZnIV8fAZrIi7wq
JYufap8M6CD1VyKK7YKU43SdcG3b/QY1kjRxNXg2bVyUabaVehyfPedV+RzK2riL4T/gfcWmyYgE
HDDS20bIqLQSU9M3Il4fofknpiAKXcZhuCY7Z6cwLq81hukaQnBGlDB2wfm8CjLmm1KwecI9lfPG
dGfWSsQqrfIWMngSPWTBZmv8VWpB4eKBh+0vt7e8O+rBqW86b1stavS/9EZH/XP8uJngx/2wNz66
7d0fnfc+HQ3xr9/71GSk4PuYZRnmYBZr7e3+Tj1I3jEFDLh897m5W1e3GX2rVRsdWrVpaq4yGUR6
55QY3sSSWCstqTppZ69Gje9Zq/Eeq/eJpT2HbXaradEL9w937rchsfWM3OMjN1Wwk2NcuIjV1+yM
l7W6Djbb+t1K2VYm+9Ecv19oe3mL59Ru0mKOonqN2LrQvgf01tZ0N7nUrlVcmRxo//x6fDG89Ji1
2QXWh7XPqex/WPp7N9wOr2oXqTHDu2r76qYJom3TdnNyNX9xMDhPl9CRncAUQUexsdRgTaIsUpc/
ZTSGm1UaLODWIJeiWmvu7Vi/Sga/TBTOk43z0fV4gDt/vr8dTP61+QuPNv2m/XoGWiquvYvoyXFu
eXNVzTTeZr3S1N9/1LeHPCdZnlXobva4BUPOALgBSZvGq9rQPouS0GYJE/kyQTRpd4lmC9mSHB6L
mXxPUXPV9O7S795Aus/vJv77DvIl8ZqpZeYMS2gaTGXSWYM/bZpp//NgMh6M9P0A0MYLvkL/JL1o
86BaA/+a7y2AkjsYX18Nrt7Tv3F/qz7D6HmSpfxua1/+DmvNrqOaLRId9ec3d9uQ/LflFW6xCxT3
/9hRbUPgZUVeiTaf7oyB1S180aw47QdaiNXk5fdp4tUU0Q7qx0j2RDD08ZQb5oK/RUMzyBAhxqzt
VwnmSxLSXzFWR4XpY6J3mo71FI/W1cp2ab5YQ33eoThpkKyiPE34U0NezdetTAkOfiWh7/lyxdf/
PLi6J/u52ct8+nKh+1Vs4bZNp5c/0aR/hTd0fnOvtvR4zhIOwOKyTXtYuP1EI6x3ORgPJsPzD2st
bFxbP9l+FrJos7PafpH19epKma9UZA3SbwuZKb34+qmM4rAHjmPMc2P2hTtPSnceBORen5Brd7xu
ZsYdcsFm04D/efWdbilmHrfBTuDzXkxv1GogjTPwDjoAnjd7Ng3I/A3eLOjSS/513OSt2KRMcH/n
CGf4vOb6+WDbT8FK85Xm0ORWI7D/fTOwbx7mnWGqh2pI+P5dxF/sSy/HDk0CwmwS3Fcn7jQq9jYR
ZjVQXwx09GJKx+0CfMT01m84nPu8XolqHgJjzIpO6f/5gEvFLbNqM8fNnb8jKTa0kFdxbTPpKKpp
YUaB7eDZ3m6sjH0QtWcJ9ykO+lfLz84zFljlr6IkwjlmU2u14piAnxub7MlNLWehFwMmXp2CW6lr
439wAwJASPPCeNmWC5KuqIniI/blXZRwkhH6ckcHmyhULXzYoTWnmYnRLqA7zn8AUEsDBBQAAAAI
AKCm5Fxgs7zWBAwAAHosAAAVABwAcG9jX25mY19kaWdpdGFsX3VhZi5jVVQJAAN8SElqf0hJanV4
CwABBPYBAAAEFAAAAO1ae3PbNhL/X58C50xTyqYcyXlMasWZUSTa5UQPnyQnvUk9HJqEJDYUyfLh
xFf7u98uwAcAUnbS5nJzN+dJJGoXWOwudn8LAniy3yL7JAodK1g5luutvdT2rcxeHTqkQy4S2rFX
KY07q5hS4gVkejokeSsyMs6J7wUfO1lEIjvdgCQUNrcdmmBDazgZWdDIGpvTt9bFObHXthckaclb
LAfzpXU+G49JGpI09tZrGhMbhWTyyGFAkjTOnJSgmqkdr2mK6hQKe4EVU+fastMYHhKtfZgrs9zQ
Ut8ktZ2P8BlCC2KTKzumorgo9AIYkGjOleWE8Pg5bZNPGxqgnN8zmnnBmtgBGSznJKZASNJDYq5I
CkPkInwPrPMSgjq70NaFhrbvh46dUhfFXHs2jAzSnSyOaYCD+j5xbhyfkiu6As2YOBzCCbeRT1MP
TF95oLGOHJTxKYw/ojqUOCD7Cm2CUdxi1C3dhvEN0bhKndee+5nYKQlXqwQ07JaemYMJKPeYDGfT
U/PMglnRhWdrZJ6Zy8FYoi3MCdHAZ4m3baOQN5nnu8fEtmNn8+JZB6Ih+9xZB1ln7UD8zI5IB5ye
evAcpRvUknRCjLbmiAOJT1qtRy5deQEl1tn0wlrMLuZDo/XICxw/cyl5laSuFx5uXssk37tSaTFM
l0zLApgeV6blaimdb5InSeh8pGmd7oVO6svklROoJBrHgaqltw5sv6Y5xJxCczZU0Sf1tlSmMEc/
WdOAppiBTUyBBbxVAF4lg1OcxdLD/Cd5+lPrEQ1cb1Uy2FTPhm/P57PlzBqPh+ek15K4SLMmg1+s
hTF/Zw4NazqYGOTF01Yrz1P0n+26MZtl33ci8keLwF9iWyt76/k3Vlo99xkLEix9egR0l15bELYK
lQd0AwNHiOIwDZ3Qr1gvUVBiRzIlKSnOxo5JQuNrz6FWYG/ph512XfIeifdPiiKEPpZPg37rri87
58yYjrlD9kC3vTrvnTFfmLMpOpUG2ZZZAPm+BcRIcj8VGHkxXZwbQ12inRlLwFVUT6YDDWC2ThvN
3k9VaonKOxj1PhVaq/TZeQMZlYQe8KUzB5WG2mkai1YOlst5zUxG5DZa5nRk/NLMQicrHBazw9l4
odC5Lo3CctbCmC6subGj48IY72bCb3PU2y32zX1yp4vTBvZwNplYk9lItW9+2kTN/XE+e2/MjZHC
NCe7vSKx1EDm+c+KAdT657t5kDKLt0TrkVev6sy21I/ZNRguzXcG6UocsMycmktzsJzNgVWi1vxi
ujQnBniqgi6BRl50C/xq5dXmOvTh28cVS0riLAiwdJ+QXr/WIAsQl6Fs+iE0gcIcUCeFXMyg4wnp
PtQBEdYNPwVf1yOLxPZFB9Q18K2VC+ROpSojQ9rkqOkpbBU0ZZnXIbSH4TeALD6NNRQGP9vkD6Ih
rw0/+oKHun1yV0J44G+TtXWVrQroFsgbN4aHTV9kQDkqWPi4EXCW5fyH572jS46Wim3YHNdtoX9N
c0O5ei1pZP7jXlUeVEfqjWrhV8Vi2rJq0HuRw/4drvb4I6ytYBGlPQaCTro6qwjhSoOf7TZvAY+H
MNYh9x1UB3DqdDxZnFljY3q2/Flj+P/zaA4/yQGwBtWPl40y0puIghDWzxxZw+V83NRs5dvrhA9m
IZz8/cJYLJsaJvR3ngoFiznn0NliYKH0Ar1PBxNz/A+13TWNE1yTSiLAhfi/tFcwCnwNVE0qi22g
N/TOLWU6MHDiGrAupf+d6EZjnWCOdLna6s2DgVcfmJrB2DybavlkKqGFusqcKq7awCwjR/1DL3DB
iocKfbwV0RLALY0lvU54VNW0hEBrk1fwUY4U0zSLAwYCVYZBmn541v2pCFrMLG4ivhcVQ0CjMmjh
uY2y+6Uy2B4Hqg2gZts+KAiSVVeR/TYI7ctdWIrtB7bUnhPbmsZU32/zaRgNlgPQdIMuF9KkXVkU
0y28QXKoQm07+QTm0dYRu+W6f9ogBmtVz9ekSx4/JgiF7cDuvC7i9jVaXiEMOqRg88BsiExzJHbB
PxWp9zUE6N4LAGjBXnCHmPvtviQjd3+3ot5VaoEXbJ/VEyHbeJwJ1ggSK8s7J2LXqsUDk8OUFTrm
su9aSize1WAdo9sCYNGK1Tc860rFggr/WYH5qu7Atwy8QBCBF36W6Q3PEpTBZ19hVNilrsTVQM+j
1m/0DApkBY3LB3oVRSr6cT0Lk9tKjxzxGhe8EuKVc+HLkQOoUXpRr41WIg0GDSpcDxlfipnSX19R
wkrB7X5D99xCKS2a2t1TvuSGefnqdmFoNsViGEpwymKlZgyHvHqsujSycG1mZZFWj1C96TW0CNsS
f4+eF/CbxyvD264Eue2/jKnCumafxbXQTeSpqJoPzLp0XvMkaXgf7IutHswYHpcRqpCHKFfpoAGK
vyy7ov+CrEIZETl4KJO+m4Xiu+2XWljF8b/PxBL3w+3W2oZuobTwDvhVvnj5sCvK1+Yv9UOpm66O
9K29EK9EH4hvu9/aCfkewZe6IFfsLzlgg7SqYESwGCuBS+DurgdCo3uKgdCKV4Kjbnd3DWD4K+v2
IP7j63xDBSjAPh9FWt40b54JfRsXR5CAqYX7//eM9j9QWqptw/9Xlu9UWcp48rZ8YzzJla7v2X1z
l4h7jV/qklLN7+CS9Pu7ZPknXJJ+G5f8p1D56TdAZUC5LLLyYyxpO7DYJeVndBoeYxlLBF6d4KmV
NR+810lOQmgx5uZQ2Ofg3e/b6agOr3yC3/JLKFJE7MXfxazg8yEOwNwIOlbKVQpceZUzNGVICId8
AEn6/TtAQlFq2kqVXMu2hPeLnW5+/KlxIqwICxfjBKRsB4NtlGi4d90GPjeCz0bqubvcVpz54YdV
92BJFt1YEgtfloTD8qAwd+jpUG1R7X5Lh4dVg2q5y3fIZa54hNgEDLXhEhsr07OyegaYz4LCwhmh
TvZgco5hiOMkgH802tN3n6HWbVeOGzHu+TZnTWxb2fPi2/rSrhZMq5o6eOzP0maxnBuDid5w+its
J2H8Ftkjb31liU9ppD3vwp+yo4XXKbwgo+KOVvnIjs81zIVT8MTydKwT8Pts+mYMOogjsw1APDTJ
g1fblT9CeO2KrSqKQWS/UqYyAhBZwwzYx80GsZvjhwmFsQWSZSU3AWAnTZ2NZcOqEIbSHkunSTrp
NW2cTS9wXaRmZ3mstCs9ueosH1uC2kfdbu79B+Igb/9Umav6Qrj7oJXyERg3Ux2n1zCOsP4VWV/W
o1fvca8tWaR1q83u+40pTucemjGMR9xalUpTFAN5pe2dnDAUIezuRB4IT9hlKfQViW0Hd5RPfg32
inKed3wHDcOY9I7Zxr3lbrEOJiT5iOanlHzy0k2YpcSHeLcw6HeKODrOsxzKgU/thIIQL0oKbSAi
LM5P2L2lupw5OMHb0mPygwtKQDc3+TWAZrp4+lq+dLDrLdrCPBuM5xNdOHTMpVYNzs1zAyDHPLNg
4VLUTd+Ot1qDXH5KIq4E2ir4RDSOw1jbyxvwhcOeMNeFQR/+dklObcgJF++b5UWSTRPepIkh/QoR
vNocVj4RxeCzESRZTIWrUSc37L4XvxtF4HU6g9TzQ9ulriImj6OeGFulhgeXhT5+rgTxXJwB5ndp
gVau8ppfRdlVkDLkJYAoFqz3dezt6Fj1rOevmLvSIPXEFYuFJHZHykqiyw6q26D2e3j5sHvQYzfr
KBSI4pYiySLcq6bbKKVuPdg/7F+SBeqJJyUsPTn2JsfkWZEyeGxZHvmzVCgV4Y3x/QLvDgYfnl3q
8Iht+TArSEh2+u7xU3YPgvgZfB0cVKu6QogDnynVHueiPBCFoKMTedGmk7wu5Kszr7CoJgbVKGQo
pYWTHy4Y+XQ1JdXyslDs5Ac/Kwcof2QRPmL8SmsCQohSINVKIoJxicQcioULC1/t3t9CwGzFt4rr
8iaV39SA+zVAgJ/TJPMBPhuB/E/45Ov80aDQWxoH1AfYWcs6JTcJBL62525psia3ZB1TeBX0DPLj
Rzuxg9ssoYfstu1tGEbJ7VW2Pr59P5hPzenZLSTlLS6ffoR+KYAn6Tztqrbi2MZ0VA3Kd3DYQom9
55Q3G4qTzbvWvwBQSwMEFAAAAAgAoKbkXErDfCdsEgAA20IAABoAHABwb2NfbmZjX2RpZ2l0YWxf
dWFmX2xlYWsuY1VUCQADfEhJan5ISWp1eAsAAQT2AQAABBQAAADVPP9y2zbS//spEHfikjalSHaS
S+3YN6okuxrLkivJ6fVcD4ciKYlnilT5w7G/1jPfQ9wT3pPcLgCSAEjaSdpe7zRtLQGLxf7CYrEL
9NXuFtklm9A2g4VtOt7SSyzfTK2F6bvWbdMmDTI67ZIe6yC9/iUZesFt42pDrjqnZBAsQjIESMCC
iPr3Gz/0kphYJI3dhrVI3KixiFyXeAHJsHuBGbn2nWklEXyJNZ0kIcHpyK0bBa6PiFautSGOlVhE
i5MotROysZYuJdULAKlOFlG4JojaIbdry/dDu/HNW7J212H0AAgRCZAQxRvLdsmdZyEfZmc2m5iz
zuSsPzMHo17/byRwEx8YIvMotBzbipMmZ+VD6gduZM0930seDhHuFYjoVcaE426atlHPE6IgZAp9
LuEcoIQTK1q6ScEH9IURsADisddO48Sem3YIHfcJ+eglqzBNGKLIXbiRGwArdpgGiRcsm+SUMj9/
gKbATiPoFueIzQVAOiDdxgnDcYvS0hz3rnHCQfQmma0AJYhvbtm3MIvlxIR1Nk48555o6cG+QcLF
IgaqW5yrJ0VvBU4hzJh4CRU+F3NTthMr8cLgkCFtN8l0E1kPZONtXHOeLoBhYkXQAkgCsBBhKm1h
B4lPTs1pf3Y5uOyb079z0vabZIIKR2V3L3omGKw5HIzOzatLYi0tL4iTvG8KhjAzL8fDISNxYcfe
mqE5yKTL9RX7YQLSsX3LWzOZC1Qe5fIhx0SyVobsdZMuERh3Z/kpinuTpKh0KsenzdK9A61yoY1C
uhZXVuR8tCIX6Pk59RBPo4GmHnMOiHbnRUkKqxWhQd2e7eqZ4CdsTHxIuuPR6eDMxOl7g7PBrDM0
xLbp4AJ+dy7NEdDU6V0MRji8A/zaiescohdI70FO7YM9ooFiQFX2ykugF1iLqTa6YbDwojVC/6XZ
brYADoHevtaR4vPOtDMCwVrzhuIq9qgzAL5a9/abtvWu1Wpx6r9NPR+wLW3wS+N90ojRguD7Jlmh
6ZJGiK7sCXdGRZAGh6CVdehsonDuZlLb2SHNVzASQF5tfeW4Cy9wiXk2ujKn46tJt7/1lRfYfuq4
5H2cOF7YXJ3ITb43V9siXKdSWxp4ACq3ceqVwQ/xqzi0b91EbqeWLze5URSo5HjLwPJLJMI6UqYO
fQXKR72+ypZrRdfSrexEeu+tJImqxty6D7ZKNWXwIUbfgx3QswhA6qRzivaXa4D9JAffbH3lBo63
2Mp70ErP+qOhOepc9Enx2QaFbpehPvQn08F4lEG1t7bcIF1Th2mH6zW4rZj8soVdmX+4Gk0v+10j
/42rs9f/MOj2DcG/fADXIv/ujX8YGRImwQsZ5UYKX+GVZBzT2fiSNUsEMa9hbD0eFfygGkRmqHsR
uaENjBXmb8rNKFRDxnA5Gc/G3fFwalQ7rXLztD+ampP+VEGU9w5pZ6kDfg967Wp03z6FbzQ9VTB2
xxcX5sW41xfaJqesRUbC+b4c/9Cf9HsC+OCimnOxGcUvmRztYs4VQib2eVMPYV50pueEaG3y/n25
V5cGUpY63dngQ2H1LQkCGByMBrNBZzaeFBA5yORqNBtcwKbZ7xLx87bAMr2cdH40cWudSiBv2vs5
zPdXnUkHMI365nn/xwLudeubt1tb3DXfhT789TH+gw00DQLwiLBLto9KAGmATgu8vh8CSASbuElD
HYBuPQdNd8lPB8e94NOhaZzmxhhz0V0kZoOyUcgYhG7mwoH2RsEYtrt3SWU7LtKFtfb8B9Or6V5j
+GQuow3vFvtp7LFw4mtBTTfX+zdHKlBs2rCzwH4tk3wXwqzA4gqcnu9GGoLDT538ArED9Onw40jQ
VuuIPG5tvdol//rn/8M/ZMSDk5XrbyDC5s3/Df/g3r2Vhdv+Ol5iiMY9odi8ciIC31ZHYg/sbFkf
fuWdNsRb0hqg3vUaVgLI+1FWDJhJ6N+5mW5BvEyPVMILR9+SKGE/nibtWfKk4UgaNsC3orfEQGCt
3et3NwziEcNI9hUCeIhitR1oMEjLAJP4PzdcaPBT1xkEfG3CzE0m2uRh4xIwD7q9DnpmdzYZVsEt
fGuJi2Y0vDDRP39/1Z/OqgBj92dCmHfIOimnTVhfnPZjgrNku99p52Iw/FGFvgObhHOFigqEgv9y
snNU1JkzRHTTKw/w3YDPPRp2zO96k2F/BEEqSB16NCkM0aG9nUvT3jxoFBEI3JDjFaN6eKWc2fxU
ftMzszMcnI00rhvFcGD6XO3ljzymMCf96WHINJtUEQon1lvAGR1iM23hGIQZT4l+sCedvMf/RC4c
EALm0nLrhEV6jdsGt0lcLcj0MR657ihegMgNEr7riLCYHoErsasLaxeoArSq3MiuDkiP5CF0Me0G
lgTPGnVNo3Tv6kwnvc6sowFqVD9VJjMSvWAnctdw+GTuFAAbJ4VqG1yx3LAaIgbOxscVbktageQE
aAK0umoGSJ6OR5nAwimY7QJwJZwueCCk0WIyL/QtINELf4ICz3roWjquWEmDni6ZlLrj7WopTNl+
ayaiNEHYe8Ii++RJL7qd6cw8m4yvLqciVxX6ZDtqvULrScjEBBhMJilRyA1hkDyGKy8b9qzqAPDz
dCcRp+pQxKYwUyGdOJ0/KR2U3hPiyagANFxEEjP1MqKeIMTkDJtoiS4T+bgaDo8ImsrBPpjK0uOR
jDqWyzib91kZA+CXyTjnUJWziLFCKnTcghRgmRG3dZIxmwkZlbD3pKhqse3rXEZsfVGhCepTMdcQ
+pwVMDRxPaeZHhrHFKoM9Fg2G2CHCQLVk0T2esN+G2Sbhvfxto4cgpNXw2PguDzDc+ucWfKymods
rQL9yxL9Be3Ft2d2CepULHmuwpnDLFY+yyMPAOg+pslu84S0qG+X+D9BkfwVeg7ptve4pZ4kcG82
IYKiFvHOpKcVo1hTjntneoHj3ivRaRE+w185QIQGMUCEn1ngAl+FkO0Yp1I7sujsuJSaqd5//UrR
Ij4aiLNB0F6sZzVQe63AsMVSnQiRYrdcfb68KUCYk0vNIK8F3uuCNhh0NvtOE3Z2jpBvtAL5eiW6
LNaWDKIK8IlgWwbMg+1WC2jJFcUtjwZ07FgL3FKFl/hjMdhjkVjo9Hrm1cG+tjEI0mtgvlsnTgjn
yp+qdGtWr5qNfsThTUGrJaXmvVyfGv7NhyoqNEsazB2k/ouGdD5STfLRQAPZE927KYZCcGiiG47W
0mXe3/1HWG8/w/puvtIFF6QIQMdRSOPnc6z6F8cFZ+kFt2a60USvIviYZJlk3iWP9/ffQLifuRQa
3rekCF8/Knmjz4vghfPy7lIYIrar8TtDsGycMPdVkb89wt7nfBiT+UbY05fyyYCBCeulJisLYtTr
YeXkKwpZgH0ngSp5UCGHWD8my5OWcop65lClc8wx2UCEh1oQe7iFVvgtAajaaYkQ6K0gvGm16r0U
tSGZptxDqVtiYkWJicUPyWL/p220qBv8N5loOXlezns/ZeGfPvw/b40HX2qNRSaVVrwPpZK3Wuv+
o3KkQiYYiTBpvpilf/kyoJltMX+MjYswomcr4rHEsEfei9UCaNjbkxILENcjai1PWns3PBU0B9y3
8hGfVjdF0OvWjSHV+Q1aXyC7eNShWOQzmu2HsasgUAL8Mki7BBLiFYvULVofJTI/Rl6iooBzyt+2
DTzP/SlkcUXt7YnHCLUGwL8xkE0Ealxo29d7N8wOAeSl8wnXL34KgE+OSnKv1JqwhG+uLH9RYVFV
xiPRiE179BhbyO8Z2T0ht8dK2oCNLyRNtuzfQleVclrVvsG9X1lpnPD7Ej+nVmShFbh/YNVF9BBe
4ONktBIWP8Sm5TjmrfugidkaFvGKLY4b28YTOeXMnGEAVczuxnrwQ8thuyvsxhvqL1EfMBleo8j0
lPladnNAM83RJKMpC73p5CTHyFBlaORwQOaNXVPQeEXPUOqAVrTcf4oKNtpgQymwdDg67//YnWHB
+8P4vE8OxHYTK/O4s3X70ykWUyeD0Rlp7MvGyw3BLExAMmAqeM709dvXN8I2jwK5Pti/kU7xuXy+
/v7rPKjhjRjYyD5i94b02fyYsSjZIt5VQ+cBMoibzSb1EEp9WK/fPxTI0kqLA04H0yynFX/o4HV/
funAbJ6w9Ki6bmkeTDTZbbwPuF2yD4X1Z822TmFKtvqWJWzkNLhgZZI9GEiu7B0E7/x9IWhuBBjZ
OWHggqDVkKKPyTLie3HiBuDC+c2oP7kgW1jxLqvVZ/SZjD6N9cGqycyZ2TY0CHaslImyq3YQxi9g
36KF9l9Ik/5llXeDNFnuEFowMh6MyKNSUmFFbrUUAusbI0g8IOxsEE/bIG9aLUXFCPWepiTLOzP2
v9BgbDPiJOxwEnQRvLBx7viEulfGQ7n2Rc8D49Hsh85gptBES2EKTcUkn39QyfAq4fV7uWgll70q
xFF13mGTV55uslmXdFo86LyoPI1Xcmma8UMAAb6b2CtagwcHoO0Id0QwShPgae0rSaKsqvM55bmS
ZD+pakhZryoVCpaZU/S71/pylSr1tMq8QlURJD8z4w3hulrD04W0ej0Vl3MUNYmk48TgXO9P4VNX
pqlGX7rNw2apQpC74BcvXtyQwWjWn8BBELfmYb9zflhzcxfW3v3L1rt7ugcCnc8gZ79mKy+GbSu8
hf96txiSfATffbBP5niZPlwQi9+Nz+6Nv2CeX8X6SFw/dmsEkvOD5N88Qz7RXqZ6xkMdI3IZR/71
GRVl/HxBBQU/+SqRiigFNVI5hVYT5d2SXhbneyQNYlC6y4iG5PRc/IfsnOVdkd53+8S9MI19191o
7Rb96M9uaFIRqOb2qbi1cfxvBOT4UQ92Yp+SVKvHVjOgXR7Qbinzi2kKdW4xB92Sual2A8X9Qnn9
C9S2pHis3oQuLC/40+KrLzU+XJ1Yf5SOEHAsuIONH1ahE6YgGGTWIOZgPPr2tBCqAOVGURWUFMAe
/4ZP4eQKdyk+R+rMJvQZUuOEnDP3+B2+G8pfJZHLsFuFY0ZfdRw+8SJJSMDhBLguqxBV5O+U90pW
UryeqcLQZY9B6nYT4e0MWac+OAwrTsp4fpuQGT6mXPpwQJsOzjrDyYUh3BLNtJ8DYELOIPDFBM/O
ey3fitaacME4w5vfkGVvGjS81t+foQMCFOPuuTnp/ACmxJowXd2fDLrCDS8+nqXWyAYML4y0bY4M
OnXgIFuj7SO+ZrkmEAoWfWQGPoktdkgIfJ4Ahp8FLXg6yGace0I2V1NQwY60E1t5VB5beintl9GY
4ZEpFDwLO0nUXBxlBJSQL7jiszW4fd24IacW7AAOPqbj6OhaYSibZJC/D8Jjruv8VY4gqigTz6AF
KjLoHcJZ3yjskSyjMN1gIwYM4v4sJdoN+eZCZhr5JekvNA0+vto0oPPTTWP/s2wjO55V28a+YBz7
z1hHiUjFOsB7IPJwk+STTsfDQkqZbLCCctG/+LY/mX43uKxMZOxIKshplBVTS21BSB25UlI5ncd2
5M2ZTaIB8ZOw4siYFZSzW1lXTfzCHt5kuxLfuPdbws795MB2zUBmHhWxRk2MI0Vj4sTl6EYMLkTQ
muilFOdVrUn2vg9z9F7iWT6o0xGkyp+WYQneBNMx4A9GPkdSJ0tBazschO3nlWka1qnXDUfU2Xgh
oJVHCRlFGnzvFbmqPR5ys2ExoSJEfgSO6sNcLlzBp+VzzW4oPfHxSz/lRki/0gMg/SYcC/G36seo
hxRCRimZIJ5YS8fLPIhkUaTwpkIS4j/gWKeJEtQr+3MFZeJQKhpq8PVT8HuHX3AEvhrOpr93CKJi
o6ZhP9g+PlUVPlw3gjKUgeKDX6bpQ2mgoDllpBR3Ud3JIws1KwMHhc7FcTiQ3rFJYXnmyQp2pK6w
ktzbl98bnSjeOFfu9fSqiynomyz8zV6V09f0dvb+VkkWFMr8IBOHr9Crw1DYpcBhJ24dIiEAbtLA
V46CdfLRimkQzd48J6taTMUjayEEx+fXzWIEz3KwdGf+lKteSpedyWzQGd7QUD6JvOXSxWfT8zTh
DseBA3dQvPBG+tQ5ZSpnEUT9XoCuL5ZeyxnEcv6B5brEW4MCDRJGgD225uC0aNWkzEYlyaedwbDf
u8E33/J5gGkse0JeTyBwgGsEDnkPlLW5S1ZeQm0UuQMhrPB/MRA44UeRpAr3kdmWHy6JRnnAi7jC
mo0fwH+vtW1n7cZL8itEg+6GNLw++frWiq3g1zR2m/R5969huIl/nafLw68BLIFwlTTabyocCemP
esUc7ABBy6k8HD4SmlhEpEs3MWgp9d9QSwMEFAAAAAgAoKbkXKt86asNAwAAaQkAABAAHABrYXNh
bl9vdXRwdXQudHh0VVQJAAN8SElqfEhJanV4CwABBPYBAAAEFAAAAK1Wa0/bMBT9Pmn/4Ur7AhoF
O0mdh7RJDNhDEwgx0D6gLnIcp82axMVxW7pfv+vwWB0YbCpW1LTOucfnHt/r9BIAqLfLAhayeAR5
OS4Nr5K7L2lruDbpTFU4tw/4YywNlC3wSkuer4ALUy7k61eXtzzDIQnICN5tPFxKNoIPF58S+Lr/
bf8kgbbi2WDeygEvjNSDQksJZXMvumxSLcUi5Ubjl/YtufaZ2CPXAQvgsilEegscOYsMwxGcYVKg
CmjLXxIC4AZ4nmsocBAcgvrSzwiBbIVetFOYLpWeSr1HEn8vil06tNOZYHQEB6cXCRC4+HJob6f2
FsVwoOo6WeeCE2VwgbIxModwl+6SgRZDeONTOD07Ojo+Pe9RByP4zHW+5FpCw2uZQFU28+udfF7X
q8Gi1Aa2Ds+33SA09TsueTWXcwyQC9mY9t7D5VUq6jwVqp5V0sgnfAttXryqwGguZOI8i4YjgHai
lraQxBR3gka4EV4AWweumtgiUe7sBplWiwrRjCA6Ii4yQuRMozm4uTOljWUNu/3No3UkJagMprzl
zR9kZhkLF0dxqyBNO2CleB7c4YRwcJ5nNW5SZNRjaxQ9j5FC2FWpJ55g8EmXvhKybVPVyNSWDYZ6
MsDYISEu2pp1U1ipmdietdBhJ9T1lQadW/cgKiwfzQMX5CNIS5MWWtVpcbM0taq9Hhtzy7+b2K8q
Jbgt6rsGigKnYDybnTuBqj5if6+FxG4Ii3ohIXKcTyRk8/F41TUwWgWZrFQzbsEoMPhQZT+lMLbD
+839gAuWk1JM+gSCC/yc1tzmNIjZ/bERM4chpo+pwSP0zgp7mhiJU01b5iiseBAORWdAzAYWifaP
S9XAZV/4Ti8VRrZdKr9nVBz8g1GzyaotBa9gxsdud/ukt8fdxLGslV4BdjFK5VrNm7zjcRbp8YQ2
x3XtnJAECvFfl0sZPaCMNqSkWArv+54jJYcie+56gvKR8cMF0X4qmU0F30J/u55Pxe9TCvIClC/6
1mdRFG7+hyT0Q8+ePJvyRDRkfrABz29QSwMEFAAAAAgAOKjkXMiwuI9RAwAApggAABUAHABrYXNh
bl9sZWFrX291dHB1dC50eHRVVAkAA4tKSWqLSklqdXgLAAEE9gEAAAQUAAAApVVtb9s2EP7uX3FA
vyRtnVAvtiUBK+A6aVp0zYzMwQYEHkFRlK3qhSpF2fF+/Y7ykphaDWMIIUii9NzDu+fuyAcAcPyL
STBxRqMlfLy/ieDr9PfpbQRNweJh24ghS7VQw1QJAVkFSbbKNCtoVlEl+IYyrfCleUcevTG/JI/+
2IeHKuX0X+By8PCyxjhcwp1gCcgUmuxvAT4wDSxJFKQ4CA4ekEmIN4h3oFmTQ76VKhfqkkTkMjwk
mzhLsObeEmbz+wgI3H+5Mo+5eYQwk2UZHfLAgmWVFkkEN/Ayfnt6mVw4FwTe+AHM766vv80X1iqT
JXxmKtkyJaBipYigyKr28X3SluVuuMmUhrOrxbllg2H/gav/aEWLeLERlW6eldz+oLxMKJdlXQgt
jqsX+BggKwrQinERHf4KUQto1nJLG814jtlwAkyG68PZ7NAVlxAEoqv1HkiLTYHgMUFwQCygi8Ba
oU6Y3loqbTgnXYaTwAKiV5CzhlUvwNjwpRbMwewApR2ukCzxn2CcW7CR8e8VNeY64QFDT1tk4GZN
x+XHCdx95JKLpqGyEtQUDlq6wkfTEbFk8oye+8qieq2wtg1y1HlpC+oZ2vwZ43DD5iS+hTFaKqFp
qmRJ0/26jvHYtbnGVum7HhbltCgkZ1jVz50THpaIG3i2jZl/wqY+gvecwMJ388VaQNyuVruuZ1Ef
iEUhq1UDWoLGnzL+Lrg2Td3v5z4VbNcZX/ftOeN4z0tmghmG4+eNIhwfErjkZ75kDTxJYLYPLfBT
1WQJupX2rSHtQg/HQwNEzVeZrOCh7/X7XhyCnFtMrq2RmZ/UqF7vmoyzAmq2srrYM+k3H7sGNYkR
nOEOHO3bK4IYd07GTV1CgtXMMVLLfGR7Y+bfRCnVDrDZMUqmZFslnROWh1Hfyo46DkgEKf9fl8U4
6TNygoyEnL6OMWIBfejnCn1kkManruOMPxl/HWJ80o8jORHHKWV85z+Mr4zDMP7y6jEYzOUMm7HW
rcI63GQMbj/NoBIaz7ocyrbQWMENnnT4mU4Xizu6mN7dXC/ol9ur6z/PowHAr4LlxpYV5szDjXfk
sADDhLNCboUCz4U4w2PQdLhWLe4aXem/BbP3QZ3VgsZtmgp1PvgHUEsBAh4DFAAAAAgABqfkXPXH
Z10dDgAADSIAABkAGAAAAAAAAQAAAKSBAAAAAG5mY19kaWdpdGFsX3VhZl9yZXBvcnQubWRVVAUA
AztJSWp1eAsAAQT2AQAABBQAAABQSwECHgMUAAAACACgpuRcYLO81gQMAAB6LAAAFQAYAAAAAAAB
AAAApIFwDgAAcG9jX25mY19kaWdpdGFsX3VhZi5jVVQFAAN8SElqdXgLAAEE9gEAAAQUAAAAUEsB
Ah4DFAAAAAgAoKbkXErDfCdsEgAA20IAABoAGAAAAAAAAQAAAKSBwxoAAHBvY19uZmNfZGlnaXRh
bF91YWZfbGVhay5jVVQFAAN8SElqdXgLAAEE9gEAAAQUAAAAUEsBAh4DFAAAAAgAoKbkXKt86asN
AwAAaQkAABAAGAAAAAAAAQAAAKSBgy0AAGthc2FuX291dHB1dC50eHRVVAUAA3xISWp1eAsAAQT2
AQAABBQAAABQSwECHgMUAAAACAA4qORcyLC4j1EDAACmCAAAFQAYAAAAAAABAAAApIHaMAAAa2Fz
YW5fbGVha19vdXRwdXQudHh0VVQFAAOLSklqdXgLAAEE9gEAAAQUAAAAUEsFBgAAAAAFAAUAywEA
AHo0AAAAAA==
--000000000000392cdb065872876b--
