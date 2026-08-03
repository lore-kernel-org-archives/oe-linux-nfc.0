Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5299F3AEF2D
	for <oe-linux-nfc@lists.linux.dev>; Mon,  3 Aug 2026 08:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785744183; cv=none; b=Do9hPUQNtvHdNWA4d9iazKSYg3SY3Jl/FzT8PfD7xnZIDS8N65OdyQlB3uQbZ+Aibz2LZEIagCKvTW07xGHabd3YhNG8MNcuTEhLfpqXZmgplKoEZJeweC3UnK3GYwuxhgCFt1sQJCY8If8Ll7uCK0l6NSiMCEYXbCrcg7AKlmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785744183; c=relaxed/simple;
	bh=e0BG+pJE+hg9ad13uORYq52K3Lc469BDks34Ro3IRB0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=O8zPNonto4Fc0nbXQCrcHLovSr4uSWCxyLEx62m0TRPqJmI0MOH2tSuCyVdRZXDMHvBTHHOTWMXDJ2z6Ay3jAcSNhMi2izhWwMULyQWfeYMP+fD/s525WTfGLqmw0kmjCKvUQEIN+aOZbGk5DsNbk9z4JSTAMYZfzLvwFf3Ykn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QAyuLe/O; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QAyuLe/O"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956242332dso15762315e9.2
        for <oe-linux-nfc@lists.linux.dev>; Mon, 03 Aug 2026 01:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1785744178; x=1786348978; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vc9B/yx3888mzr7CTqfaAlTdFjWQOBw2cbII84IGS9Q=;
        b=QAyuLe/OsGtxBVJecbkpJBp7RA1FA2qPG5I03pE6n0mHs2FIPJKqxYS6kVfutUc9zL
         BCtoL9MMmXT8P1sSDhR8NAIHt3tpUU6zBkEuQqrdj01ZCsY2DkdIK1o3nQvddNw6n6Ju
         5Ns1yhBuajBPBrju1wkyh3Xr9eVr5MCKMKk2Y4afonxX/xTk2TINNQuoQdGGj+uen2/m
         wh3TeDv7TrUufIjaS6qwfrpL6+CWEZXd9NA5OuW/YTDKf8a+y1wMtgkIOCL0rYAbgsS2
         TiTcLAgB90wD8IxLRzXKb24a+6jr9HKKO8++fLNfDJEENKuAEZIIgf5kIMuKL62Qoue5
         78CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785744178; x=1786348978;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vc9B/yx3888mzr7CTqfaAlTdFjWQOBw2cbII84IGS9Q=;
        b=GG0dIIY4weYKWD2v7YLO1sjT9VAihShG/Em3AMDvc0z87HD8kG7oDP0BmBYJOGHFhM
         yMlPcaUiaYUj3VB+kFrymI2VkP31CVyZT8jOwYPjtpoiGCPwxMXPbsLCCkdmJf8fKyGy
         gGi3pM5/uWZnoY9RB1qB9YkSj6PNPxNlvK7uNWeoD/0UOmnqic33fAbrq6GSUmVgMNSd
         cJvadgAOWaMXoeQjMhRtbIg9iXxkkBSYv+TiyeVlScib8HtGMkPAp/TOWIzrTEx92BzQ
         T1SWPuD1282F6084b732puaH9ApQ2/mhghqd2z9d9GBrr9j9QfhIzrkzDiURtozCDEPF
         QnMg==
X-Forwarded-Encrypted: i=1; AHgh+RqbNdMh8F9qCouyUNrOOgClHSrQXbVaL2wMHA4KEKcYrN4wUa1knErzCaPPUryombz9wzetJWoZA7Fn/hE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqrgiayrwkefYaYRNuOzN5kgsdKmTWCdhTN0bv/ATR327+Jqb5
	PQnN3EcHIad66q7u5CpcQEU6VyrvbF+UJlyH/FX3HjWtQb3YTvsvKANpbGpo96dlUJk=
X-Gm-Gg: AR+sD10F7h++Y/Jq8Ljb7ukrOosowtcbFjh2YbgPrUEbd0HHpath7hvFKhqKNvstepT
	dFty5s+ntichPrv+3poHv1XJw37D8hbA+bQL3H8dw0PWl4j7238GMxBgbHU4zRxlVEXodTqwV9H
	dRXB5/xXfBu6Q4DgxaqrBsEx0A86ZABGXPuUr42N84kiqz6yvrUFeAIStJquBTPRW9vu9SVDpFL
	Fo6Efq7L0eYMu+2kb+QgWaMz9i2ihWy+OaiWV76YznG0Hk/kj4LJaDBzRPZyIOgtJDCbouBhNfO
	RLZNe3czOTPB0bIDEfcQL/oTqriX5EZ7UuBc9uCSQht/xgBl/jz6vm70m7XdmcYAzQfIk/M5Dn2
	7byx4UDalBVquupkiZklQ5BfF/skzZKqy0ZgmVje5rDh2IKczzR1umX2t3TROFiQe1awdbzdXEX
	WzZKRlu3gRTEpTwyj7OZJ1RDjea/BfIlPX6VnDg1UL6FQgNSlVGIAQgiUaN4GesoMucg==
X-Received: by 2002:a05:600c:840f:b0:493:c42e:5be0 with SMTP id 5b1f17b1804b1-4980c60705amr179044905e9.0.1785744178527;
        Mon, 03 Aug 2026 01:02:58 -0700 (PDT)
Received: from localhost ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808691014sm211742535e9.11.2026.08.03.01.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 01:02:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 10:02:45 +0200
Message-Id: <DKF5H4I2VHSD.HZXLHCU4TDXV@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>, "David Heidelberg"
 <david@ixit.cz>, "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>,
 <oe-linux-nfc@lists.linux.dev>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: milos-fairphone-fp6: Add NFC
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260726222405.153008-1-jorijnvdgraaf@catcrafts.net>
 <20260726222405.153008-6-jorijnvdgraaf@catcrafts.net>
In-Reply-To: <20260726222405.153008-6-jorijnvdgraaf@catcrafts.net>

Hi Jorijn,

On Mon Jul 27, 2026 at 12:24 AM CEST, Jorijn van der Graaf wrote:
> Add the Samsung S3NRN4V NCI NFC controller on i2c1. Its XI clock is
> provided by the RF_CLK2 PMIC buffer and gated through the controller's
> CLK_REQ line on tlmm GPIO6. PVDD is fed from PM7550 LDO20, the rail the
> downstream driver switches for this chip.
>
> The enable line is routed to the chip's power-down input, which is
> asserted high to turn the chip off (the downstream driver treats VEN as
> active-low on this design) -- hence GPIO_ACTIVE_HIGH, unlike the
> exynos5433-tm2 wiring of the same driver. The pin is pulled up so the
> chip stays off while the line is not driven.
>
> Assisted-by: Claude:claude-opus-4-8
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> ---
>  .../boot/dts/qcom/milos-fairphone-fp6.dts     | 49 ++++++++++++++++++-
>  1 file changed, 47 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm6=
4/boot/dts/qcom/milos-fairphone-fp6.dts
> index ebdca0e2d2f3..a1b86e4092fe 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -601,9 +601,29 @@ &gcc {
>  };
> =20
>  &i2c1 {
> -	/* Samsung NFC @ 0x27 */
> -
>  	status =3D "okay";
> +
> +	/*
> +	 * Samsung S3NRN4V NFC controller. XI is driven by the RF_CLK2 PMIC
> +	 * buffer; the chip has no oscillator of its own and gates the clock
> +	 * via its CLK_REQ line, so the clock must be voted on in response
> +	 * to it.
> +	 */

I don't think this comment deserves to be in the dtsi, having these
details in the commit message is enough imo.

> +	nfc@27 {
> +		compatible =3D "samsung,s3nrn4v";
> +		reg =3D <0x27>;
> +
> +		clk-req-gpios =3D <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +		clocks =3D <&rpmhcc RPMH_RF_CLK2>;

I'm not sure about these, the NFC chip is connected to PMK7635 CLK7_LN
which is part of the LNBB clocks, CLK1_RF - CLK5_RF are the RF clks,
CLK6_LN - CLK9_LN are the LNBB clocks so shouldn't this be <&rpmhcc
RPMH_LN_BB_CLK2>? But I honestly couldn't find anything in the
downstream dts so maybe either these clocks are always on anyways or
something else is going on there?

Regards
Luca

> +		en-gpios =3D <&tlmm 56 GPIO_ACTIVE_HIGH>;
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <31 IRQ_TYPE_EDGE_RISING>;
> +		pinctrl-0 =3D <&nfc_clk_req_default>, <&nfc_irq_default>,
> +			    <&nfc_pd_default>;
> +		pinctrl-names =3D "default";
> +		pvdd-supply =3D <&vreg_l20b>;
> +		wake-gpios =3D <&tlmm 7 GPIO_ACTIVE_HIGH>;
> +	};
>  };
> =20
>  &i2c3 {
> @@ -825,6 +845,31 @@ &tlmm {
>  			       <13 1>, /* NC */
>  			       <63 2>; /* WLAN UART */
> =20
> +	nfc_clk_req_default: nfc-clk-req-default-state {
> +		pins =3D "gpio6";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	nfc_irq_default: nfc-irq-default-state {
> +		pins =3D "gpio31";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	/*
> +	 * Pulled up so the NFC chip stays powered down while the line is
> +	 * not driven (it is the chip's active-high power-down input).
> +	 */
> +	nfc_pd_default: nfc-pd-default-state {
> +		pins =3D "gpio56";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-pull-up;
> +	};
> +
>  	sdc2_card_det_n: sdc2-card-det-state {
>  		pins =3D "gpio65";
>  		function =3D "gpio";

