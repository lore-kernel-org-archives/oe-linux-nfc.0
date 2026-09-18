Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A92A4ABBAA
	for <oe-linux-nfc@lists.linux.dev>; Fri, 18 Sep 2026 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718905; cv=none; b=WynmoBfiFYC7k6lKk2NQS20xrZCctkPnbbsv80NkzWQShXQEpBzy9tSvYrNEBmi1BWguHbbz9VixdOrU3TolcSSl8H912X5YDuA8Eyc6GBa922vOjTAP/LQFShNTPEbWN+mRJk5zMjscOy06+HSIzh1PKIF253zafHIwQ4Fiq6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718905; c=relaxed/simple;
	bh=szW65OGngIrVZHSZp2aEQxc71UJrXouv/4OEN7SWrbc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YR+v7iobQ3HJefZ2TnktreFYm68B6oYmeAuVHd6YW70tVJGVo7QUU5kygEk1rK7d5WtWbnvdBxYynRHI9Khd2sZNoWrlpqDKgDodEEHincPVDHyuXsy19Tehg81XOfdC/VVUOnHUK94F4/I+bzH+ivsY0S23Qh2g8RoohH+a/uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NYJxJ3z3; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NYJxJ3z3"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f560398so65253266b.1
        for <oe-linux-nfc@lists.linux.dev>; Fri, 18 Sep 2026 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789718901; x=1790323701; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zunp2CFFOV00BN1XGKfmZnDU8vHJVhqp2O/gTm8fQpA=;
        b=NYJxJ3z3fYiFhL7V6bHohyb58ixC2R5isksdNqL+EmSQIgb/u94FBqv++0kH5bshCl
         D5BmS4nTr3w5MAXHIydgulTEaG9ZnYm5FYg0YUY9QoeOMxrdbTR1WzbWWJ/DXEegRX6Y
         Ppd5Ha4dfh5gIcXGNV2Eggqrplowfk4B9I6qPdxHt2d2LzAKy3ZcCNZtlWPrK8QA0t4D
         YJ/iQpHGHdnjEnSZC5yr+PF/CREhEynI4xDS2nqNVMfX6mPWB1ZVr2C/jR+kh8Vz9gjA
         XUPLyvjAJzAgn7OW9aXtsDrdMFkhe+9GKPj3J2rT4LAW8l0r5Sr0ntERvP1kjP/Pnn7l
         3Glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718901; x=1790323701;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zunp2CFFOV00BN1XGKfmZnDU8vHJVhqp2O/gTm8fQpA=;
        b=opOaKY5RicT5sEbMJqj9XTE5PpBZsQ8ao204WGzZmrMzF+Nz8libs7PqvmST7dVdwX
         PL68h3o8o1B1D4ZqEqKLbWVM2eqTiiV0ZnIIoHLPTY+JdG9YGP5gYmvUkli8OWvd0MKH
         5ldPPiM3adpxO1c2rGj0Oc2QRJ38EbT29ESXpOfNLtHv9+SRFETCNLjfejkv4sZHF02I
         6jQP6BixP/bxUgj7NBsrVon30OoXZjmFhlZsrbPZItw1O8A2jqutnHX4WBMOmqgoJG3j
         Ps+at+NRhCiBClA09IU67O0xBZPOKE7wtZRPjXD3EJZr8fAIVsSiHYCnNFes3ETMGvJ6
         +lXw==
X-Forwarded-Encrypted: i=1; AKwUvBxJfdlJUD71DGHsWbHDtKfo1zMexe2g5on8X/6T7bxuoKHsJxcuJDZG5AJiQ2LUs5MHvMBfG3ewkTZkFnU=@lists.linux.dev
X-Gm-Message-State: AFuF++nMuQivySliwUUG5ODQVTRyOBmcd6onx54aSRJgPjosg7/LHQgZ
	vnXRvKE73BZz5G/V21igUhisYD4OTI7VVXY+GHHLLHzTDaHSHp7AnB//RY4VdGoygQg=
X-Gm-Gg: AYBFou0xcHFyw0cdUqB0v7UOJfv2MPoMivniwuzzzJ8dZFoYlob6G58P9HVhdZ5g753
	B8cNikPnjW5jrd+5ChGnlPvSr8gHizqRughmYoeWR+CE4ssgRFk5YXB94uqmJJqvFqqXmPBn2oB
	4ir0nAp+ktqRXg75iDAbVUhOopljGqthiRIgHJlQRBjGGaWyhn8HslfQTyHj35gvr8ap1hXAUld
	NjOGRXZsC8H0bWwb29vU5/aOGRjR96PL0W7PCAbjeNnpXkb0ilnrLy+FwKdKRWNtqo1grLCLCPv
	qp9RisYXhrvEbr9msYBWTLr1xL/HPAuPx9VwPpsFKiDRXVfOEI/3rwWVJshhO8GXxlkKKmRTC2R
	T9rHXKSwp28/roHzraexby4hL+xBCG1A6QkEQMwGrCn1gfQkI8beE7HR1VrlX1GnQF0X33BtkQO
	dfY+byLT13vl0j3it5dlBIkC6ABHs/6rIyJYlqS7aKegbcg3n48vbycZk+sCqrrtwcoJ1tw1nyT
	Kp/RH+XHK52LlECihGXNdIwVw5b6HWUNIwHA9Ykectv
X-Received: by 2002:a17:906:9fcd:b0:c1c:2007:298e with SMTP id a640c23a62f3a-c2a15b33c9dmr191756766b.24.1789718901566;
        Fri, 18 Sep 2026 01:08:21 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb06bcbsm31932566b.12.2026.09.18.01.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 10:08:20 +0200
Message-Id: <DLIAEGGE6ON6.TF50P7IWGBZO@fairphone.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <oe-linux-nfc@lists.linux.dev>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v4 0/3] nfc: st-nci: Fairphone 5 NFC bring-up (ST21NFCD)
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Kristian Brox" <isyourbrainfoss@proton.me>, "David Heidelberg"
 <david@ixit.cz>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
In-Reply-To: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>

Hi Kristian!

On Wed Sep 2, 2026 at 11:22 PM CEST, Kristian Brox wrote:
> This adds NFC on the Fairphone 5 (qcm6490). The board uses an ST21NFCD
> on I2C. That part speaks raw NCI; the current st-nci driver always
> wraps NDLC, so using st,st21nfcb-i2c leaves the adapter unusable.
>
> The series adds a st,st21nfcd compatible for the raw-NCI path and the
> Fairphone 5 DT node. Boards that already use st21nfcb / st21nfcc keep
> the NDLC path.
>
> Patches are against linux-nfc/for-next (Linux 7.3-rc1). Hardware test
> was on a Fairphone 5 running postmarketOS:
>
> - 7.1.2 sc7280, earlier raw-NCI modules: nfctool Powered: Yes;
>   initiator poll / neard: NTAG 215, NDEF URI read OK
> - 7.2.0-nfc-test+ (sc7280-mainline), this v4 st-nci as modules:
>   10x initiator poll finds Type 2 in 0.13-0.14 s, no
>   "unsupported ntf opcode 0xf02". Repeat poll with a Type 2 tag
>   in the field stays Powered: Yes. Empty-field poll SIGINT
>   (nfctool -p, no tag) also stays Powered: Yes.
>
> The ndlc: hexdumps are pr_debug. SIGINT during CORE_RESET (nfctool -0
> then Ctrl-C during -1) wedges stock nci core; that is not this series.
>
> ese-present and uicc-present follow the public schematic (NFC_SWP1/SWP2:
> SWP_SE to SIM1, SWP_UICC to SIM2). SE/HCE is not tested.
>
> CLK_REQ (GPIO 39) is omitted, as on Fairphone 6 NFC. VBAT and VDD_TX sit
> on VPH_PWR and are not modelled. VCC_UICC_IN (L4C) is not modelled;
> UICC SWP is untested.

Thanks for sending this revision!

Unfortunately I can still fairly easily reproduce to break scanning:

[  211.682211] nci: __nci_request: wait_for_completion_interruptible_timeou=
t failed 0
[  211.682246] nci: nci_start_poll: failed to set local general bytes
[  224.483009] nci: __nci_request: wait_for_completion_interruptible_timeou=
t failed 0
[  224.483033] nci: nci_start_poll: failed to set local general bytes

I enabled polling with neard, scanned the tag a bunch of time. Then
disable polling, and afterwards the errors above appeared and starting
polling again does not work anymore - until I reboot.

In fact, I can reproduce this just be enabling polling, disabling
polling and enabling polling again. No need to scan a tag inbetween.

Can you please share how you've been testing these patches?

Regards
Luca

>
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---
> Link to v3:
> https://lore.kernel.org/oe-linux-nfc/20260820-fp5-st21nfcd-v3-v3-0-5ee0a7=
f44d04@proton.me/
>
> Changes in v4:
> - Driver: consume ST proprietary RF NTF 0xf02 (Luca)
> - Driver: set raw_nci before nci_register_device (Sashiko / David)
> - Driver: enable vdd-io and SYS_CLK before driving reset
> - Driver: keep named i2c/acpi id initializers; do not add trailing
>   commas on existing of_match entries (David)
> - Driver: reset pulse uses gpiod_is_active_low so new DT can be
>   GPIO_ACTIVE_LOW without breaking old nfcb DTS (Krzysztof)
> - Binding: ST21NFCD is not I2C-only (data brief lists SPI); do not
>   put st,st21nfcd in the I2C-only spi-max-frequency:false enum
> - Binding: SPI $ref only in the non-I2C else (not a global allOf item)
> - Binding: clocks/vdd-io-supply on the existing I2C example; drop the
>   extra example (Krzysztof)
> - DTS: reset-gpios GPIO_ACTIVE_LOW (Krzysztof). Physical GPIO 38 HIGH
>   is the run level. Konrad R-b not carried (polarity changed).
>
> Changes in v3:
> - Binding: new compatible is a different ST part (not a driver-sharing no=
te)
> - Binding: drop NDLC/raw-NCI description on compatible
> - Binding example uses interrupts-extended
> - DTS: one nfc_default pinctrl group, pins sorted, no output-high
> - Fresh series (not a reply to v1/v2)
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
> ---
> Kristian Brox (3):
>       dt-bindings: net: nfc: add st,st21nfcd
>       nfc: st-nci: add raw NCI path for ST21NFCD
>       arm64: dts: qcom: qcm6490-fairphone-fp5: add ST21NFCD NFC
>
>  .../devicetree/bindings/net/nfc/st,st-nci.yaml     | 49 +++++++++----
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 34 ++++++++-
>  drivers/nfc/st-nci/core.c                          | 22 ++++++
>  drivers/nfc/st-nci/i2c.c                           | 82 ++++++++++++++++=
++++--
>  drivers/nfc/st-nci/ndlc.c                          | 27 +++++--
>  drivers/nfc/st-nci/ndlc.h                          |  5 +-
>  drivers/nfc/st-nci/se.c                            |  3 +
>  drivers/nfc/st-nci/spi.c                           |  2 +-
>  drivers/nfc/st-nci/st-nci.h                        |  2 +
>  9 files changed, 197 insertions(+), 29 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260902-fp5-st21nfcd-v4-1685be1d7c52
>
> Best regards,
> -- =20
> Kristian Brox <isyourbrainfoss@proton.me>


