Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795256273;
	b=xU+TLulb9pnGhVzJ5i8/5Vs2y+LzG9aYmOs1SsJhs6cb2XrZXoX7EHAaj3gOR1PRocHy
	 CQQwhLkKKFmKn0q/K2ODJ03MqJ20ZWFMoxiT7mEU7B7a5OoGxQqpBRfzjFlWNu1fT5XPs
	 RNlRbccSM8PcrnZm8XqCXBpIELUiv1lks+52NQeaP/rG/7alw8O+kPgGHTxCw8cca0Rym
	 DjiSWkJjc+AyWobr50jCGa4jarxTSnUZ/EkMV60P4aB24KpBYSIXgb/HQ0W2lWuyFFQQR
	 /9drDj50otc3vcFi1VXTXOYRZ0mo0fpGNzMGHDQDZ06dYdLUXyzCmJDk4GHb2WMNrxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795256273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=CGM/3+U6P/3Ix3u1vwt+zgurCpv7ig5u/NcOCPf3TrM=;
	b=VXIp6JGMnr7w4DmqGXkKf8EVng4/whlr1H6iAT14Wym5bl3Mazb28fE67NOMjxNrRzPR
	 jE/BjDGT5H5qoyGuDaFoeUBpw3n17dEwGLB0OCIHEtFvNJWkh4ubQQxsiiFiY2Nz9kdxR
	 YEtdbaxiCj+kKoHGtmHyFBMl3O979Usm8VD+4WxJwm2XlpTPzREdEN/lKyczatw/Zd3Xj
	 O1xu2Hy3nWznc0d2S25kemTlOhk1q72Sc79pO26vP6r4Bp1S27o+GYFkq2oaxjaIQB/Y4
	 e4Qlr8O+OEUULovKN4Q/T+2jbpyI1vQLkDMckMDXf6eg0v4X7zoJ0v8dCi8RBnUF3VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GkGCFerq;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BB9606A320
	for <oe-linux-nfc@lists.linux.dev>; Sat, 21 Nov 2026 10:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0BB9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GkGCFerq
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso892198a91.3
        for <oe-linux-nfc@lists.linux.dev>; Sat, 21 Nov 2026 02:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795256272; x=1795861072; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CGM/3+U6P/3Ix3u1vwt+zgurCpv7ig5u/NcOCPf3TrM=;
        b=GkGCFerqTWSyGjaBnZF6DMjGDYS/p67rMTs5jT93m8gZ/9HjvRORG4mvxRoTp9gQpu
         3j16N/XU2VbVULgQNWfkQL77349zS8lUwqIuWXd/3qOjJHSn6fxq1PAWqXbAMxfjsD6U
         ksJQoo0WtUNAj28nn5ilypPcViZIi3x/x6IuJQcK6E7MX16+LtO+QnMR4vogAIE7UAN1
         QqiAv7A2FPXX7Jrj4DU6SymRRFsdAY3HiW2HqtnksAF+oZj7GldDgwHg4Eb0i5qzAQ5p
         M/WjXHPjkGMgQg9IpDcPh/EtVTLbsPq1tuXnoH518bTT6+IxTUk3LeNn04oK7rOB9vk7
         DQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795256272; x=1795861072;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CGM/3+U6P/3Ix3u1vwt+zgurCpv7ig5u/NcOCPf3TrM=;
        b=VwINBzhdbOV2JkZsqr8SRFx5JtvXCmgrTZzpU5l10avC56HtlmMfferAsdweLsI2xd
         DKC6ZvhYtwG5K+xz+shUEPtPS5h3ogxUooE4GdN3qHTX62LEqkqFZsxMgPLl6+F6IKCc
         stKwF9ZydFcvp+J1gTH17sE/50h4333VJeQZgkyVTUp7FS+0bClyKmOGt/hZ87vSijl/
         mSrOc5GczPoLuKfc0fGn7lZCnFMB0wcKXPbbqShrGzll2VxXm0jJda7z5af2XSEWpYiE
         p4EOAlWydAy96hM/xhctqC2xAh2j0f3Dz9lL1aDjFFM4Alt4Ewy8qTHNv14SeDom859F
         8zug==
X-Forwarded-Encrypted: i=1; AL+hErFR8jttfWftc6f2Vzq9yP+LASfP0gkPPrI90bgwf1HcP0TgQ1ljJUJyea6Xw27PNd2+4rbt2HKqlVa/93Y=@lists.linux.dev
X-Gm-Message-State: APuU4Z93YV1y7AQlvNb6C5JDSV6hIAmtCxIAPA2fqYOTDR1YfrV/fDYu
	34DqEZ4n6Pedjax4Y+xj8dazhijgNuehYjL3HTkP4gTROBQDE1RUSTS4
X-Gm-Gg: AZFdTZdYWtXXrgGjh6puQucHF7lzwzG+mCLOT4YJRvYhd3FNWn0UXXOVzvx7se0cHMo
	7Dh3ZRgbEE/whM1q+k8pA5Tq3CCnSXQXqO/gWQavHrOz1+lBDM4v/k4xD9NYKPwrGNzVjowKPD6
	U9/5kjavOXNgvWqkfqEHg4MZd9al2s2OFqyRv69KzgG+fA+8xDc8JTTn8jMpEHICPQkX514yGJB
	7+kjL/EaHzjFLD4+u2qmPcCLP4ESOlyPLiJ9dDuq08wxNTgDvAiyLcR07ZbJVoEAtRMfLN68kb7
	aAp3gzSVCvtd+8X45a9yspO+TtvOM0qc2AUfSLn65CnfnOzzpJB+CPx2gCWiqLvM6UQ12tZ9a+a
	aKlj3HyCbKeTa2LVjNWUu9X69Y2x0WaY8PTjAGafWvlACm1XUh886ac6ry2SKEEFVAZQXqqzren
	/C6geTqI0TmXVhZjPxuqgPk6iC++qIA7Kw6amgjPlBgZ6I0DsCnxOpyMS5rlyHltZQ/sszPuLKU
	PuoUGLO6cJp3xCdwkfnc44hzuNEQQ4cadkDoPK61hUJfOGBL8819rjGNh5em0MtlXdAoPP7p874
	GE/ftRwHr2P7JwAW1ekSvDSYBM5isuJ3KvBPBERVsTCSLV+lZs4LR8l7xnwkz1w2OUoZzAWPR7O
	JFqf35QE=
X-Received: by 2002:a17:90b:4d0a:b0:3b4:1352:6ae with SMTP id 98e67ed59e1d1-3b41c905981mr4992815a91.30.1795256271992;
        Sat, 21 Nov 2026 02:17:51 -0800 (PST)
Received: from reply.eml (awork078078.netvigator.com. [203.198.250.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm11859916a91.8.2026.11.21.02.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 02:17:51 -0800 (PST)
From: Yuqi Xu <xuyuqiabc@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
 David Heidelberg <david@ixit.cz>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, stable@vger.kernel.org,
 Vega <vega@nebusec.ai>, Ren Wei <weir@nebusec.ai>, xuyq21@lenovo.com,
 Mark Greer <mgreer@animalcreek.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?=
 (The Capable Hub) <u.kleine-koenig@baylibre.com>,
 Ian Ray <ian.ray@gehealthcare.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thierry Escande <thierry.escande@linux.intel.com>,
 Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH net v2 1/1] nfc: digital: fix use-after-free in unregister
Date: Sat, 21 Nov 2026 18:17:30 +0800
Message-ID: <20261121181730.58295-reply-xuyuqiabc@gmail.com>
In-Reply-To: <20261112151208.496636-1-horms@kernel.org>
References: <20261107141910.549465-1-xuyuqiabc@gmail.com>
 <20261112151208.496636-1-horms@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Simon,

Thanks for the review.

> [Severity: Low]
>
> The commit message presents this as part of the unregister fix ("handle
> its MD listening state in abort and shutdown"). Does this abort_cmd case
> take effect on the unregister path?

You are right that the unregister path itself reaches abort_cmd() with the
state already at PWR_OFF. The MD state handling is there so an MD listen
cannot outlive the device, and it also changes the normal stop-poll and
suspend paths. v3 describes that explicitly in the commit message so stable b=
ackports
do not treat the normal-path behaviour change as unrelated cleanup.

> [Severity: High]
>
> Can this assignment overwrite an ignore_timeout =3D true that the IRQ
> thread set for a timeout handler that is already running?

Valid. v3 no longer clears an ignore_timeout set by the IRQ path: shutdown
and abort only set it to true when cancel_delayed_work() reports that the
handler is already running. The handler therefore sees the flag and does
not deliver a second completion after the IRQ has completed the command.

> [Severity: High]
>
> Can a timeout handler that is already running still deliver a
> completion into a freed digital_cmd before this point?

Valid as well. v3 marks the command complete before invoking the callback
in trf7970a_send_upstream(), so a timeout handler that is already waiting
for trf->lock cannot complete the same command again. The timeout work is
also cancelled synchronously after shutdown and before unregister, so a
handler that was already running is drained while the command and device
are still alive.

> [Severity: Low]
>
> Do the in-tree implementations follow this new contract?

The contract now allows driver-side removal serialization as an
alternative to doing everything in abort_cmd(): the driver must ensure
that no completion callback can run after the command is freed, either in
abort_cmd() itself or by serializing removal before calling
nfc_digital_unregister_device(). That matches st95hf's rm_lock/nfcdev_free
scheme and trf7970a's shutdown-plus-flush scheme.

v3 has the fixes and the updated documentation, and is now sent as a
new thread.

Thanks,
Yuqi

