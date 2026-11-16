Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810346;
	b=HvjbT015J4vfLACbURoi6VWS7B/jhtUKyvAe5JjYnTgA2jlJGvr4Y+/J+6CNCXsLIKvp
	 x6YmQSeZ+ex/lBwrWM/yfWLekq8RV14kh1+BtBm2fTZNnHtuPsx2+jstd04haJwTLI2If
	 bPSw6qoRcvLXM/IlmEE9Z2XR72d/5XjxYArWvO/R4nVNjpc5JRCtOrMjglKmYXvi0WUH6
	 0jxzcgQRT0whS8NWHT4Gt8z6tvQMVuDVEmXVfzDzfGS/nVzX1Pl67zKSDfAt89bLXWmpS
	 DLAXcmiw4s4TkQxwTZtuH0oUW9e/l1Ti5HGRHYZr6axUmrnXQrrqd/0PqfbsLbaI6oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hh+R9vrulIDsL2yY8DhJUoEG2kjxAgVjOVJwnKc/m0g=;
	b=hadQgWofKWW0F9CY4LnpVRgDM5XTJwU6NFSiB2mShhV9uZe4gKjCXFVIpnv02znLOewJ
	 C2jQ49bNVDVhw9Yb6t30fw9JgHzwwPh10W/WKp+dMhXxxUUYb5Pjga7jYiJ3xaybYHm0C
	 24bLxMTp517mapNnlkq4dofpB467lz9q1iPircrasV/bdRAbzwTYqMcH4fkyyv8YLNi9L
	 IW3F6EC8utfM1VitHeEHBxCSygU8y8ewHpHZdnaTZyC2Z5ZPKoTnATNtbQvRbWQVopggP
	 0olYsvD9yxxoU7m9+mX4iNGOEpdZZMMs/hz13ZzzYzH2u/2Ma+KtOmyBDnX/pydv8Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J0Fr1Xtd;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8454D606A31C
	for <oe-linux-nfc@lists.linux.dev>; Mon, 16 Nov 2026 06:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8454D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J0Fr1Xtd
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1366027f8f.0
        for <oe-linux-nfc@lists.linux.dev>; Sun, 15 Nov 2026 22:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810345; x=1795415145; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hh+R9vrulIDsL2yY8DhJUoEG2kjxAgVjOVJwnKc/m0g=;
        b=J0Fr1XtdR3/Mn/GvVeORZ9TFfQYJXD9kznwW13avEBzg4FTT6QXlGvwfT8sSmGck8/
         1Q4YOkgewXCWV27+EDuJppmmUV3X21NVC+dytl3YVc2XzuINug00jAa6KM1H3hTxC2jz
         6fyHytXmHuQhsWl2PXTbs6B7OEX3/mZGQg8nkSVmOq+f9hFodq3XDj2vfM+dgiw/XRJP
         XprQv6NQB3KP3ovukadsKxL8ScpDNEwaGfcfmbT34Xx6dYEG708Oz0BXtJ8RSmEti8U8
         Bm+ImxycYw68cGmnGJGxYUe+evIzBcqKQpZ/41xYU0jpvBV+fe/Y0JE6EK41Z3AdgQ0Q
         LCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810345; x=1795415145;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hh+R9vrulIDsL2yY8DhJUoEG2kjxAgVjOVJwnKc/m0g=;
        b=RbFNHW0d56+PIoZMzxLtNOPlvucmm6HOJbV91ig6TU1y+rJeuhd2yWYOg/+AMaJaOZ
         PKSlWgnYpzBg21tBMXpbXjiBK7G/khoEX+dFb7VeRfs/5irM205P1qWHBMco+Fyj3blP
         MfWq452D+XMmT/Wn5OdkBMbHUTivikQD4Vhei8wSdzh8zH5uY35I41rhtrsJqPeXpget
         Y3/IrIPkaas/k0D/Q6w+lPzQjIgb87QNo8BULCHpm8ziTtGLbjysDdp5MV5VgmUDn//s
         3D/OCXRBDerooTzURDWMbC0o4TCDPfPZyZAKmMcgYCJG3aRnpFWTqzkdZ6KoaOxUDnCo
         fvnQ==
X-Forwarded-Encrypted: i=1; AL+hErEo4wv6Ltdgo7qXXwsvmRE7jKCYD0wbc8ZvD4qTfvnBBIhh5KTRI9WUopFJ8XSgxFrc1ilM6MtUYRtuesw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+OozoNt5aBg+65nG5YymxTRpCXLtObt3ztLUwstluT4OJxpo5u
	ze6B1yQsEQILhOJAxTGckoD8YOX9sQqCf9vpwQVikcW8RrRNClhlm7yw
X-Gm-Gg: AYBFou2E29YKKNt0K5cGLlxZpyNhFeNvxHJc9LJx7VgM3WVtwsjxowWiJR5E5L2aMT/
	b18QEewKMYKyTtYuFn1zxiCrhPWj/EXWmJ3Jk01V3Ng3tSMqf++sW9Dt3TB50mjvOuVBmWAmp3r
	HicxNzmrwO5ZbFozc0r4BtLcu58ZXIY2qvCdvaUQawDwpt3yIn6do43IEP2ZjQVTEH+ExZQWNo2
	MBUzWRcfbVjZtceM34JlX0SgQWfM9Jt9+JHw7cRcgx6Mm39p2qXfyoOFJUesn0/IeNyM4+UiYCb
	4uXNoCP8Y8bA8wwymw1kPjczQnxtgo9QU+nVCMAh/nKK7iLvEyW46T7/mO4q7vJZfOuoQBzmBHG
	jMckUcTMNHzhwktRuSlKMQewxTxh5sMpK6RJQ8SsTlV9LAsKdtCH/xQaG9JKiN/rSfu7bpLdUZR
	c/NgaBy1U7dxfHdrSCIYvscwBZDw8bLrAIK4AVRSxhIuD/oBaDgSmIrhUAWDqA4gLw/1QHDKpcm
	HXg86vILK/T4yacCCNr2OiiVvE1O9pzUYbKaX4bFz9LmwmIhZkjSm23hS2kJ5nSp/AwoXJVWPmn
	SEddC4bk1RFYMRUS
X-Received: by 2002:a5d:5d04:0:b0:492:7f3b:8cc3 with SMTP id ffacd0b85a97d-49c725e555bmr17386069f8f.29.1794810344684;
        Sun, 15 Nov 2026 22:25:44 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm21676892f8f.45.2026.11.15.22.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:25:44 -0800 (PST)
From: Adil Tepe <tadilhusrev@gmail.com>
X-Google-Original-From: Adil Tepe <adil.tepe@basarsoft.com.tr>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] nfc: s3fwrn5: support the S3NRN4V variant
Date: Mon, 16 Nov 2026 09:25:40 +0300
Message-ID: <20261116062542.275485-1-adil.tepe@basarsoft.com.tr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811220135.472380-6-jorijnvdgraaf@catcrafts.net>
References: <20260811220135.472380-1-jorijnvdgraaf@catcrafts.net> <20260811220135.472380-6-jorijnvdgraaf@catcrafts.net>
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Adil Hüsrev Tepe <tadilhusrev@gmail.com>

Hi Jorijn,

I tested this series on a Samsung Galaxy XCover5 (Exynos850), which has
an S3NRN4V wired to the same lines, so I could exercise the new variant
path with real hardware and a tag. Patches 1-4 are fine here (separate
mail). On this patch I hit a hardware-dependent problem with the fixed
clock-speed byte.

> +/* S3NRN4V single-byte FW_CFG payload; 0x11 selects the 19.2 MHz reference. */
> +#define NCI_PROP_FW_CFG_CLK_SPEED	0x11
[...]
> +int s3fwrn5_nci_clk_cfg(struct s3fwrn5_info *info)
> +{
> +	u8 clk_speed = NCI_PROP_FW_CFG_CLK_SPEED;
> +
> +	return nci_prop_cmd(info->ndev, NCI_PROP_FW_CFG, 1, &clk_speed);
> +}

The XCover5 feeds the S3NRN4V a 26 MHz reference (PMU CLKOUT0 -> TCXO),
not 19.2 MHz. With the byte hardcoded to 0x11 the chip ACKs FW_CFG with
status 0 -- there is no "failed to configure the reference clock" error --
but the RF front end is then off-frequency and the reader never sees a
tag. The failure is completely invisible to host-side polling; only a
physical tag exposes it.

A/B on the XCover5, same tag held on the antenna, 12 s initiator poll per
run (NFC_EVENT_TARGETS_FOUND over the netlink 'events' group):

  FW_CFG 0x11 (19.2 MHz, this patch as posted) : no target in 12 s
  FW_CFG 0x12 (26 MHz, only that byte changed)  : TARGETS_FOUND in ~0.1 s,
                                                  ISO14443-A, proto 0x10

So the single byte is purely board-dependent: 0x11 is correct for a
19.2 MHz part like the FP6, 0x12 for a 26 MHz board like this one, and a
hardcoded value breaks whichever board it does not match.

The driver already holds the reference clock (phy->clk, "failed to get
clock" in this same patch), so the byte can be derived instead of fixed.
Something like:

	unsigned long rate = info->phy ? clk_get_rate(phy->clk) : 0;
	u8 clk_speed;

	switch (rate) {
	case 19200000: clk_speed = 0x11; break;
	case 26000000: clk_speed = 0x12; break;
	default:
		/* keep the posted default when the rate is unknown */
		clk_speed = 0x11;
		break;
	}

(exact plumbing of the clk handle into s3fwrn5_nci_clk_cfg() is yours to
decide; the point is the value must follow clk_get_rate(), not a #define).

With that change the XCover5 reads tags reliably, so I'm happy to give a
Tested-by on a v6 that derives the byte from the clock rate. I did not
Tested-by this patch as posted because it does not bring up NFC on a
26 MHz board.

Two smaller observations on this board, neither a blocker:
 - A prop notification 6F-3F arrives during polling and logs
   "nci_ntf_packet: unsupported ntf opcode 0xf3f" on every poll. A no-op
   handler would silence it.
 - RF calibration blobs: the driver looks for samsung/s3nrn4v/{hwreg,
   swreg}.bin; the stock XCover5 firmware ships them as
   sec_s3nrn4v_{hwreg,swreg}.bin. Just a note for linux-firmware naming;
   NFC works without them here ("RF calibration data update failed: -2"
   is non-fatal).

This was tested on 7.4-rc1 (s3fwrn5 sources at
7.4.0-rc1-00023-gdcb8b91fb779) with patches 1-5 applied, built as
out-of-tree modules and bound to the S3NRN4V via a runtime DT overlay
(compatible = "samsung,s3nrn4v", en/wake GPIOs, pvdd 1.8 V, 26 MHz clk).

The clock-rate finding was located with the help of an AI coding
assistant (Claude Code, Anthropic) during XCover5 mainline bring-up; I
reviewed, reproduced and verified it on hardware myself.

Thanks for doing this series -- it is most of the way to working on a
second board.

Assisted-by: LLM
-- Adil Hüsrev Tepe
