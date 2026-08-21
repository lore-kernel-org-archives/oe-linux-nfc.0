Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C4B456280
	for <oe-linux-nfc@lists.linux.dev>; Fri, 21 Aug 2026 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787304520; cv=none; b=S42I7HhH5RvBI00yGUmf0TOwOyorYpwJyy2By36MWs54FO23kqPMqORSm3hOe9dyJcl1cK5F1NW0hmXgV1tSOkIPuTjBakfADUfq4Y/h5Vcv2otMcUZ0A15zKcqSbxZqHjwWJYFMROqEUSYnv7vZ8/Zd5J9WBAABzAfePP2hxTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787304520; c=relaxed/simple;
	bh=WAufh72lblmlbrc/jJjjNeihtv2Y1ow86BPrCYh8M/o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mtqDmq+Mb4Lr00zbjoJ/qsLX46pVE54B4ztMpCuyeTZwjV3v6jLB7cvJgglD8hb9mD9JzxbnQYvvJuM7dXFd/hmjCTt5N1MmApEY2T/C5qj0sOZsCKSs31CVPCiLyVQI0Vq1Esp6ST31UMDICh8txcrvk+KpILlAgec69QilkvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zbGETz9Y; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zbGETz9Y"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c20ce3c118aso144494766b.0
        for <oe-linux-nfc@lists.linux.dev>; Fri, 21 Aug 2026 02:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787304504; x=1787909304; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q5vpbeop/A9Sj3kOt1ydYSMTNnRoxXgWkRv8uWD/3es=;
        b=zbGETz9YY0xl9KeIcGhMu++4QMBYKH/D/AaAEHCKBFyCK8YabUGzCipwz48kGMjpXB
         ySOfcZMK8el7J6dZW7eOnxTHjjmbhR0Ht6hd2fGTz55AJS+Wvyny94ipJzDC8BjdnbIP
         tvXMLvKAdFTk1UNEqZCtBTtG3GqI4xI6auivPPTedjMZoxA0oAFuXjYdKhZg/Te27+Ld
         48hlITgABAxBlkie0jIhVmksKO7AVtfjV7odlI7V6TViWFhht0jIXz2qaNQbqqPketTA
         ktaGJYN3aQ8AJyRVmxLcjT9cwC3nBmOvNVt9RQ8Yqxo/cNILwZ8cQopfqIxFeW9ykYEJ
         yDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787304504; x=1787909304;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5vpbeop/A9Sj3kOt1ydYSMTNnRoxXgWkRv8uWD/3es=;
        b=AUwjhI4fd/P6IZFg8PteY9fd18F6EqW5KegL85k+FckO7PdAcSVMe9JtxXxnUTrtid
         PnbsBwnRJ59UF8eqFbQZfMyZAV7kT/rRDfGowd11WSSg+2hBX5QqK4MNpGq/rVK+0HFd
         h15jk/X9WLHPHaVSQsjrCM5PbX/HAR83H/D88d3NvuARVwijuiPTBt8hWdR2mjOtec50
         9yDjIqGk1BsEE0m2Z3aiIfkHe4vn8GwD0EbKdNgYSXvr6lOLPLuTBhXMeDEyTeIPAdNr
         gLllwADXDB50wwlztgyBggwlUca8A88W1Vr6NMRp+piN3AN2X3juV8TqODgi5Bj58ss9
         DFqg==
X-Forwarded-Encrypted: i=1; AHgh+RqL9ZpDK83DRG4UvRHYp0vLWDcWMh+iyBEkqLuR8ymSERUN+VBhNkRdDVDysnqMyYXRrAwL5U7H9MP0BY8=@lists.linux.dev
X-Gm-Message-State: AFuF++mSO5PsI6dNXn+fouHRH/u2NNW6E+Z5FtnEgqD8pUb/Cnh66WwG
	92qMUxV4D2IhzAfz/dcMAwaiPasSesA/Hem5dfZfvFjOjDrJnZuhIqSQkTNfNlb5bgs=
X-Gm-Gg: AR+sD11k2F2x8c/4R7p8wqCw91kbfuNpFD9XIRgLmDomCmbJrxNp5PhscJcuBaDQMLE
	SFBvHpP72/rft70duDHEzSUY4pPOqjBCi0a4tO0J892429Fmw5taLEzvVhPQS0QbO0pBBGh2ZBx
	Mztl1TgzwS0uwLWfW9huZg7D/h1jlACMNW9/SIAMzjjq+FNtZhLxoSHLH8A9Pyfnqqi5Sp9e/8r
	yPSH0wZikmZ1JJuv9c2+Bc8ro5n7EvC0b0ynPTiG5gseG+jIJT1wUKG8zhXFDz9paSRBxqJjcNI
	UniaJ2PSllxwW/l2gmWMJtd+rcenOFhbwJ2bPYWN3m99JjyY1FmTaX5NNg3I2jUOcKci2APnp4q
	BanpWdBkB8JS56B/bXlR8qDwI6tEDYHZIqnNjPAFvtWHFSt4H+9PCLczJxOgwPlXLPjKi1wNZ34
	RVbZMItFvmoMvWBO904Q/+6s8Fl0evFNt609xtdBjm0Rwp3fh1eXmwV+8R0heW0GqA/W83oMTpT
	blLh87AlJs5AXVQK6rsCLrOYMxOr2fbVA==
X-Received: by 2002:a17:906:fe0e:b0:c15:c323:36e5 with SMTP id a640c23a62f3a-c244d7194bfmr930680866b.10.1787304503694;
        Fri, 21 Aug 2026 02:28:23 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b096d9sm442131366b.20.2026.08.21.02.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 02:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Aug 2026 11:28:22 +0200
Message-Id: <DKUIKHDS44LA.10CHEGZHLQSNS@fairphone.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, <oe-linux-nfc@lists.linux.dev>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] nfc: st-nci: Fairphone 5 NFC bring-up (ST21NFCD)
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Kristian Brox" <isyourbrainfoss@proton.me>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260820-fp5-st21nfcd-v3-v3-0-5ee0a7f44d04@proton.me>
In-Reply-To: <20260820-fp5-st21nfcd-v3-v3-0-5ee0a7f44d04@proton.me>

Hi Kristian,

On Thu Aug 20, 2026 at 10:56 PM CEST, Kristian Brox wrote:
> This adds NFC on the Fairphone 5 (qcm6490). The board uses an ST21NFCD
> on I2C. That part speaks raw NCI; the current st-nci driver always
> wraps NDLC, so using st,st21nfcb-i2c leaves the adapter unusable.
>
> The series adds a st,st21nfcd compatible for the raw-NCI path and the
> Fairphone 5 DT node. Boards that already use st21nfcb / st21nfcc keep
> the NDLC path.
>
> Patches are against linux-nfc/for-next (v7.2-rc7). Hardware test was on
> a Fairphone 5 running postmarketOS, with these changes as modules on a
> 7.1.2 sc7280 kernel:
>
> - nfctool: Powered: Yes
> - initiator poll / neard: NTAG 215, NDEF URI read OK
>
> ese-present and uicc-present follow the public schematic (NFC_SWP1/SWP2:
> SWP_SE to SIM1, SWP_UICC to SIM2). SE/HCE is not tested.
>
> CLK_REQ (GPIO 39) is omitted, as on Fairphone 6 NFC. VBAT and VDD_TX sit
> on VPH_PWR and are not modelled. VCC_UICC_IN (L4C) is not modelled;
> UICC SWP is untested.

Thanks for working on NFC!

Unfortunately it doesn't really seem to work for me, based on v7.2
kernel.

When running "sudo nfctool -d nfc0 -1 -p", the dmesg gets a bunch of
spam:

[   29.097978] ndlc: 00000000: 20 00 01 01
[   29.100953] ndlc: 00000000: 60 00 1f 01 01 20 02 1a 04 04 01 20 92 80 02=
 03
[   29.100969] ndlc: 00000010: 01 59 c0 cf fd 59 c0 89 7f 00 00 00 01 00 00=
 6d
[   29.100974] ndlc: 00000020: 3b 02
[   29.103348] ndlc: 00000000: 6f 02 0c 11 20 00 07 07 02 cf fd 00 00 01 03
[   29.103470] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   29.104136] ndlc: 00000000: 40 00 01 00
[   29.104308] ndlc: 00000000: 20 01 02 00 00
[   29.107831] ndlc: 00000000: 60 00 1f 02 01 20 02 1a 04 04 01 20 92 80 02=
 03
[   29.107866] ndlc: 00000010: 01 59 c0 cf fd 59 c0 89 7f 00 00 00 01 00 00=
 6d
[   29.107871] ndlc: 00000020: 3b 02
[   29.110353] ndlc: 00000000: 6f 02 0c 11 20 00 07 07 02 cf fd 00 00 4b 6b
[   29.110474] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   29.113292] ndlc: 00000000: 40 01 18 00 1a 7e 06 00 02 00 02 ff ff 00 0c=
 01
[   29.113307] ndlc: 00000010: 05 01 00 02 00 03 00 00 00 90 00
[   29.113471] ndlc: 00000000: 21 00 01 00
[   29.114311] ndlc: 00000000: 60 06 03 01 01 01
[   29.115856] ndlc: 00000000: 41 00 01 00
[   29.115937] ndlc: 00000000: 22 00 01 01
[   29.117507] ndlc: 00000000: 42 00 02 00 02
[   29.117599] ndlc: 00000000: 20 02 14 01 29 11 46 66 6d 01 01 11 04 01 96=
 03
[   29.117603] ndlc: 00000010: 02 00 01 02 02 07 ff
[   29.118976] ndlc: 00000000: 62 00 08 81 01 00 01 03 01 02 00
[   29.122709] ndlc: 00000000: 62 00 08 83 01 00 01 03 01 02 00
[   29.123604] ndlc: 00000000: 40 02 02 00 00
[   29.124294] ndlc: 00000000: 20 02 14 01 61 11 46 66 6d 01 01 11 04 01 96=
 03
[   29.124305] ndlc: 00000010: 02 00 01 02 02 07 ff
[   29.127697] ndlc: 00000000: 40 02 02 00 00
[   29.128139] ndlc: 00000000: 21 03 09 04 00 01 01 01 02 01 06 01
[   29.130378] ndlc: 00000000: 41 03 01 00
[   29.133173] ndlc: 00000000: 6f 02 09 11 20 00 16 04 00 00 63 6b
[   29.133247] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   29.143965] ndlc: 00000000: 6f 02 13 11 20 00 12 04 00 00 65 5b 0a 08 01=
 00
[   29.143989] ndlc: 00000010: 01 52 00 00 6a 6d
[   29.144936] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   29.153545] ndlc: 00000000: 6f 02 0f 11 20 00 0a 0a 07 00 03 05 00 08 00=
 00
[   29.153634] ndlc: 00000010: 70 74
[   29.154439] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   29.182777] ndlc: 00000000: 6f 02 11 11 20 00 0a 0c 19 00 05 00 ff ff 00=
 03
[   29.182801] ndlc: 00000010: 00 00 8f 10
[   29.182868] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   29.196213] ndlc: 00000000: 6f 02 0a 11 20 00 0a 05 0a 00 00 9b 4b
[   29.196414] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   29.206067] ndlc: 00000000: 6f 02 09 11 20 00 13 04 00 00 9d 47
[   29.206740] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   29.586059] dw9719 17-000e: Error writing reg 0x0002: -6
[   30.100584] ndlc: 00000000: 6f 02 09 11 20 00 12 04 00 03 a7 f5
[   30.100662] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   30.110815] ndlc: 00000000: 6f 02 0d 11 20 00 0a 08 01 00 01 52 00 03 ad=
 07
[   30.111019] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   30.120807] ndlc: 00000000: 6f 02 0f 11 20 00 0a 0a 07 00 03 05 00 08 00=
 03
[   30.120828] ndlc: 00000010: b3 0d
[   30.120899] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   30.149554] ndlc: 00000000: 6f 02 11 11 20 00 0a 0c 19 00 05 00 ff ff 00=
 03
[   30.149574] ndlc: 00000010: 00 03 d1 a8
[   30.149649] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   30.163030] ndlc: 00000000: 6f 02 0a 11 20 00 0a 05 0a 00 03 dd e2
[   30.163100] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   30.172938] ndlc: 00000000: 6f 02 09 11 20 00 13 04 00 03 df df
[   30.172998] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   31.065969] ndlc: 00000000: 6f 02 09 11 20 00 12 04 00 06 e9 b2
[   31.066050] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   31.076104] ndlc: 00000000: 6f 02 0d 11 20 00 0a 08 01 00 01 52 00 06 ee=
 c4
[   31.076513] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   31.086223] ndlc: 00000000: 6f 02 0f 11 20 00 0a 0a 07 00 03 05 00 08 00=
 06
[   31.086273] ndlc: 00000010: f4 cb
[   31.086933] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   31.114930] ndlc: 00000000: 6f 02 11 11 20 00 0a 0c 19 00 05 00 ff ff 00=
 03
[   31.114962] ndlc: 00000010: 00 07 13 69
[   31.115044] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   31.128340] ndlc: 00000000: 6f 02 0a 11 20 00 0a 05 0a 00 07 1f a4
[   31.128410] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   31.138209] ndlc: 00000000: 6f 02 09 11 20 00 13 04 00 07 21 a0
[   31.138278] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   32.031735] ndlc: 00000000: 6f 02 09 11 20 00 12 04 00 0a 2a cf
[   32.032139] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   32.041357] ndlc: 00000000: 6f 02 0d 11 20 00 0a 08 01 00 01 52 00 0a 2f=
 e1
[   32.041713] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   32.051198] ndlc: 00000000: 6f 02 0f 11 20 00 0a 0a 07 00 03 05 00 08 00=
 0a
[   32.051227] ndlc: 00000010: 35 e7
[   32.051575] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   32.080201] ndlc: 00000000: 6f 02 11 11 20 00 0a 0c 19 00 05 00 ff ff 00=
 03
[   32.080221] ndlc: 00000010: 00 0a 54 88
[   32.080603] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   32.093508] ndlc: 00000000: 6f 02 0a 11 20 00 0a 05 0a 00 0a 60 c4
[   32.093893] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   32.103180] ndlc: 00000000: 6f 02 09 11 20 00 13 04 00 0a 62 c0
[   32.103507] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   32.995129] ndlc: 00000000: 6f 02 09 11 20 00 12 04 00 0d 6b f2
[   32.995544] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   33.005468] ndlc: 00000000: 6f 02 0d 11 20 00 0a 08 01 00 01 52 00 0d 71=
 04
[   33.005574] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   33.015571] ndlc: 00000000: 6f 02 0f 11 20 00 0a 0a 07 00 03 05 00 08 00=
 0d
[   33.015591] ndlc: 00000010: 77 0a
[   33.015684] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   33.044216] ndlc: 00000000: 6f 02 11 11 20 00 0a 0c 19 00 05 00 ff ff 00=
 03
[   33.044237] ndlc: 00000010: 00 0d 95 ac
[   33.044606] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   33.057961] ndlc: 00000000: 6f 02 0a 11 20 00 0a 05 0a 00 0d a1 e8
[   33.058351] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   33.067653] ndlc: 00000000: 6f 02 09 11 20 00 13 04 00 0d a3 e4
[   33.068030] nci: nci_ntf_packet: unsupported ntf opcode 0xf02
[   33.476119] ndlc: 00000000: 21 06 01 00
[   33.479380] ndlc: 00000000: 41 06 01 00
[   33.481131] ndlc: 00000000: 6f 02 09 11 20 00 17 04 00 0f 0e e1
[   33.481217] nci: nci_ntf_packet: unsupported ntf opcode 0xf02

Sometimes my simple NFC tag seems to be detected, but it sometimes takes
quite a while. And starting and stopping (Ctrl-C) the nfctool process
doesn't make it any better, it quickly gets into an error state.

Can you please confirm how you tested this on your side, and if I'm
maybe missing some parts?

Regards
Luca

> To/Cc from scripts/get_maintainer.pl via b4 prep --auto-to-cc on this tre=
e.
>
> Changes in v3:
> - Binding: new compatible is a different ST part (not a driver-sharing no=
te)
> - Binding: drop NDLC/raw-NCI description on compatible
> - Binding example uses interrupts-extended
> - DTS: one nfc_default pinctrl group, pins sorted, no output-high
> - No In-Reply-To; To/Cc from get_maintainer.pl on linux-nfc/for-next
>
> Changes in v2:
> - Compatible is st,st21nfcd (no -i2c suffix)
> - Sent without PGP/MIME
> - DTS: interrupts-extended and pinctrl for IRQ/reset
> - DTS: ese-present / uicc-present (schematic)
> - DTS: SYS_CLK from LN_BB_CLK2, VPS_IO from L18B
> - Binding: optional clocks and vdd-io-supply
> - Driver: optional clk / vdd-io enable
>
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---
> Kristian Brox (3):
>       dt-bindings: net: nfc: add st,st21nfcd
>       nfc: st-nci: add raw NCI path for ST21NFCD
>       arm64: dts: qcom: qcm6490-fairphone-fp5: add ST21NFCD NFC
>
>  .../devicetree/bindings/net/nfc/st,st-nci.yaml     | 31 ++++++++
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 34 ++++++++-
>  drivers/nfc/st-nci/core.c                          |  5 ++
>  drivers/nfc/st-nci/i2c.c                           | 87 ++++++++++++++++=
+++---
>  drivers/nfc/st-nci/ndlc.c                          | 23 ++++--
>  drivers/nfc/st-nci/ndlc.h                          |  2 +
>  drivers/nfc/st-nci/se.c                            |  3 +
>  7 files changed, 166 insertions(+), 19 deletions(-)
> ---
> base-commit: 9f69d05b5a85c417c73fa2d5c7a2d507ac81cf4b
> change-id: 20260820-fp5-st21nfcd-v3-bde6c248beed
>
> Best regards,
> -- =20
> Kristian Brox <isyourbrainfoss@proton.me>

