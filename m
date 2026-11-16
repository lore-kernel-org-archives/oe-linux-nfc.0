Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823072;
	b=tDZ9l2OAGJBXEkDhXPAuhr4bOp3wTjZFHcvW1BcT3P68zKMGuySUPvzttslYZyqLA+Q/
	 3a83ScsORv2WrqjU6PoJwHZ/BbksgXeWr5LoCvp1pHc6nVRJG57RsJb6eNAHtIXoKSD/I
	 V6E4WF5mqqSTctSNevZPaIM6JqXV6FBvGPdPYKiORdc0VVDAuUQHFzpJkF+G81nL5PpQ4
	 JK+HDVVj5MlKrlkiHsP+yUphudNC/boLxCEwgIMrJQLtj6A4HtYKmAYu1wibS6fPmorYC
	 hLfvS84JOqisWnZBdCmcxaaxFPV31lOT56/fPqQ9QS7ftwEKW8B552Yu2LDAERVj1rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=MWv3RsE66Q/ysLjuk87PE8PT3esdU32Mz6gnhtaxttw=;
	b=KdlURnJXUSO6LFd8ruZWFQG5YoFd8CaGlisM7ZI0jotag4K4dMN4PSiRxE4r+Lull/wZ
	 xFh/9RnTUZkVf9jjdqWZd2Rxrwa6X3kbqjS6UkvbLBkjYPGUpY8B2BNoDKWTtqbKCW/qQ
	 u7bDOZrDOZOUiCSbaMqOmZpOlqb+RFcVajs7Bn7TBLMSmnDnhoSDMzdHbFODoj/PPAP/T
	 GFnXiB9lxBG7n1x6LmTtczm88OO3zUWwf7+QZtXJ9CiEU+YEsDUlpkUaL3ZFHzXglzopn
	 dwuORwOqmLbK5J1N7IJiCAf+JFhTay9xUJUlAmkaffTLwSEChUWXm+ot0FMF9/n31ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=PwylboIJ;
	arc=none smtp.remote-ip=74.125.228.134
Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3F6606A323
	for <oe-linux-nfc@lists.linux.dev>; Mon, 16 Nov 2026 09:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F3F6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=PwylboIJ
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c50515c3ba6so191040066b.0
        for <oe-linux-nfc@lists.linux.dev>; Mon, 16 Nov 2026 01:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794823069; x=1795427869; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MWv3RsE66Q/ysLjuk87PE8PT3esdU32Mz6gnhtaxttw=;
        b=PwylboIJQGztEnYQYGDzjJZZs7uhVdQ15IyFikDQ7lALhA5s9NWBxnEGrGrcPAuxpm
         Rxc9YyFUWDpqQurBgzIFJvBwY/5/J/YBwr8j/Bn8dEC4yaTqtdndlVeVpWtVVWgsJU3u
         PKHQcjlFFCZAL6PCvHADbZplgx5APLsq9cgptUsYjl9eQHYugXd+U00RiQ7SesE7bE6F
         gVcHcolIWn+I8KNp25cAoDF/fI+86URIKAkYFdn+v/GlqiXh21Bvm/EYnW11VSSO0Yrv
         O9g+79CLRqHYVZcz/+ojnmB3kKdTOgKVAXZC3o2lSmskFvooGe2Z1jkSP24o3XPTP5F6
         gy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823069; x=1795427869;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWv3RsE66Q/ysLjuk87PE8PT3esdU32Mz6gnhtaxttw=;
        b=vX73cvdMfGnzGX5jrOU0wQDiuyZBFfK7eCzlLDqh/SVPuzaVMeZ0AzgL1hbGdBbJH9
         esg1JUjtJFzK9mpzi7zn8xbJJuXY0uX5VEHjVOPasUpkg0bk5ABwDLD7VK3ZAu1U4Vhb
         2XX8sVw1LXhSAYmC9b6oidflVO0+W8VKFhsyEzl9MGqXhz/3kbkHNuXro7J1lZ24l8Eq
         EI4ycIRTPDYak7zttv4q/ZvGHnRj7JAlKAcFWp7S9lLBKQ02sGYHvR51iVf5gYAFTAiE
         nY8lOWGbjb9ubhKUYEfy9ZWo32LS2W5oOz7VMnQq9D2haQQmGDgpbs9Iv5gkSUG1aIgR
         /nrQ==
X-Forwarded-Encrypted: i=1; AL+hErEQqUumBYksdLbcJW2NOOx3aYejj8aGq1qnjhggePns8vxnvE+4G1qg1UKT094RVFd9XWCzpmhEGmIKJSs=@lists.linux.dev
X-Gm-Message-State: APuU4Z9e6G7XRz/JIq0Ohh6QewKOzyULLfan/0FeA/JKpcMcvXBACy5n
	dutJl59vRH2xxYG45zJmQdqSRXmycyWH8tZaoQnHqrv5DF/2ic+iPzZ6BfR/f+LUD9Q=
X-Gm-Gg: AYBFou1RLuQrnflxR0EtWxj0PuUEMYu5uQOFQhhjPr997RlH1wyfZ5cYIFib0cC7NUg
	LScVGy6Y/ntnn1LXrZC05LnwBL04OvOENqzbNc3vjYiqR8v0tOvtAHN15sr0ghk7NO0IrkTYGyA
	5wHayuwAFH6YUX1OthtpyKkmEGLW1H9bb27mjbhA5GVC3iPESKhurq/L1U47UCiNeFbAmT2mgCB
	/GBsPwXlwGyn5Nf0TFkzNpTa03Ust1aHf+BAYHY4sFBNnP/LzOYyzA+clSWsTkUgXGGScAQtvjF
	ZydE4V684xStAgCZe+rBjwbretUa+UxDuFWyEURkotfMLxG8eRXvCdm6/F0NhcL84DSADi3KkG5
	P1skE01vpvIHIphgNXPmxl9HQerNP47N3AjI3SbV1QOtpyyQlM9i2bLaGMsbNZefL6/MYNClWXC
	ntrXCVknvc1cT1li3rlH/YjJZjvBs2yiHzWKdcxoJ8hntK8HqHhYEzUEv6sQpOndOIuNnmLq2xf
	/arY1055tkXx/S9bV9Dnx/z5rh6iwjoq6GznqVnbiWYsvYIdhFiRgCPLRIco7xqCfmp5VWjETbn
	w/x58BnvqLwzG9vihRfm0cJ8twkeGLqYn+LJtLdFnPXpgDtbzumncs4VIwM=
X-Received: by 2002:a17:907:2d0b:b0:c24:4128:c19f with SMTP id a640c23a62f3a-c5096327391mr838159866b.11.1794823069529;
        Mon, 16 Nov 2026 01:57:49 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5a78csm392751766b.4.2026.11.16.01.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:57:49 -0800 (PST)
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 10:57:48 +0100
Message-Id: <DMWJOF3M99U0.3G5IY77AS4CWQ@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, "Robert Dolca" <robert.dolca@intel.com>,
 <netdev@vger.kernel.org>, <oe-linux-nfc@lists.linux.dev>, "Samuel Ortiz"
 <sameo@linux.intel.com>, "Kang Chen" <void0red@gmail.com>
Subject: Re: [PATCH] nfc: fdp: reject an oversized device-reported packet
 length
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <hexlabsecurity@proton.me>, "David Heidelberg" <david@ixit.cz>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260615-b4-disp-f42dce2d-v1-1-186ff3dcbf37@proton.me>
In-Reply-To: <20260615-b4-disp-f42dce2d-v1-1-186ff3dcbf37@proton.me>

On Mon Jun 15, 2026 at 10:04 AM CEST, Bryam Vargas via B4 Relay wrote:
> From: Bryam Vargas <hexlabsecurity@proton.me>
>
> fdp_nci_i2c_read() reads the length of the next packet from the device
> into phy->next_read_size and uses it as the i2c_master_recv() byte count
> into a fixed on-stack buffer:
>
> 	u8 tmp[FDP_NCI_I2C_MAX_PAYLOAD];		/* 261 bytes */
> 	...
> 	len =3D phy->next_read_size;
> 	r =3D i2c_master_recv(client, tmp, len);
>
> When a "length packet" arrives (tmp[0] =3D=3D 0 && tmp[1] =3D=3D 0), the =
next
> length is taken verbatim from two device-supplied bytes:
>
> 	phy->next_read_size =3D (tmp[2] << 8) + tmp[3] + 3;
>
> next_read_size is a u16, so this can be driven as high as 65535 - far
> larger than the 261-byte tmp[] buffer - and it is never bounded before
> the next iteration's i2c_master_recv(). A malfunctioning, malicious or
> counterfeit FDP NFC controller (or an attacker tampering with the I2C
> bus) that sends such a length packet makes i2c_master_recv() write up to
> about 64 KB into the 261-byte on-stack buffer: a stack out-of-bounds
> write that clobbers the stack canary, saved registers and the return
> address.
>
> Reject a next_read_size larger than the receive buffer the same way a
> corrupted packet is already handled - drop it and force resynchronization
> - so a device can never drive an over-length read.
>
> Fixes: a06347c04c13 ("NFC: Add Intel Fields Peak NFC solution driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
> ---
> I reproduced the out-of-bounds write with an in-kernel test that drives
> the fdp_nci_i2c_read() buffer geometry verbatim under KASAN
> (CONFIG_KASAN_STACK=3Dy), modelling i2c_master_recv() delivering
> next_read_size device bytes into the 261-byte tmp[] buffer:
>
>   next_read_size =3D 281, no bound:
>     BUG: KASAN: stack-out-of-bounds in i2c_master_recv...
>     Write of size 281 ... [48, 309) 'tmp'   (the 261-byte buffer)
>   with the device length bounded to <=3D FDP_NCI_I2C_MAX_PAYLOAD (what th=
is
>     patch enforces): no KASAN report.
>   a well-formed packet (length <=3D 261) is unaffected, no KASAN report.
>
> The full device range - next_read_size =3D 65535 (tmp[2] =3D 0xff,
> tmp[3] =3D 0xfc; the u16 field truncates the + 3), a 65535-byte write =3D
> 65274 bytes past the buffer, smashing the stack canary and the return
> address - reproduces the same way under userspace AddressSanitizer on
> both -m32 and -m64.
> ---
>  drivers/nfc/fdp/i2c.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
> index c1896a1d978c..0392bb49bb4b 100644
> --- a/drivers/nfc/fdp/i2c.c
> +++ b/drivers/nfc/fdp/i2c.c
> @@ -166,6 +166,20 @@ static int fdp_nci_i2c_read(struct fdp_i2c_phy *phy,=
 struct sk_buff **skb)
>  		/* Packet that contains a length */
>  		if (tmp[0] =3D=3D 0 && tmp[1] =3D=3D 0) {
>  			phy->next_read_size =3D (tmp[2] << 8) + tmp[3] + 3;
> +
> +			/*
> +			 * next_read_size is taken from the device and is used
> +			 * as the i2c_master_recv() count on the next iteration.
> +			 * A value larger than the receive buffer would overflow
> +			 * tmp[]; treat it like a corrupted packet and force
> +			 * resynchronization.
> +			 */
> +			if (phy->next_read_size > FDP_NCI_I2C_MAX_PAYLOAD) {
> +				dev_dbg(&client->dev, "%s: corrupted packet\n",
> +					__func__);
> +				phy->next_read_size =3D FDP_NCI_I2C_MIN_PAYLOAD;
> +				goto flush;
> +			}

Hi Bryam,

Just sharing because I find it curious, this issue has already been
addressed 9 years ago (August 2017) in Google's Android kernel:
https://android-review.googlesource.com/c/kernel/common/+/461836

Would've been nice if they would have shared it back then...

Regards
Luca

>  		} else {
>  			phy->next_read_size =3D FDP_NCI_I2C_MIN_PAYLOAD;
> =20
>
> ---
> base-commit: 8e65320d91cdc3b241d4b94855c88459b91abf66
> change-id: 20260615-b4-disp-f42dce2d-055035ea37ba
>
> Best regards,


