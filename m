Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794683009;
	b=WnyyXtkATjVLF/+Z9+v1frgmaqzaIUaaN0MPbtfI9kjofiigwaEpKqmVda1YBhjuR6RG
	 pKO+G+hzxraGRPt16AuR+8u7mhjhpAhCZQmsl0gn1vebfhsP2n4BMvIDQwMdVw1agjYab
	 TbVD22tOh5aR1oiUzlDwvkIbj5hO9W8f+PnHF68eEx6/sV+tbLcXMpCxHiLxiiW1ArAYi
	 hx4ubMsQ1YjhL8SPMNVdgqWbLSMDWaJZOtiJSaoXbF5Nftdjsj6pcKiQrazPwB3zj1Fjr
	 UhKWATx3Om5UjONbAAeOBzlOUe7AaWfFk4fYPVgv+eBc8sZJwwUClY6lFhp7mAbEAXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794683009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
	b=RJVn5JUV7flhwlieomJeVDMtKefQ4W4XagV08wtv6hb2CbSmq9q1kVTi4T5zqQDNNWLs
	 e3t3uQPcibvjTUSo4IzSpD4KlahTV8t2U9kmzsG6sFJqdNz1cDKohavyOsr+cIqoQo7L3
	 LNlblBmS08EY+SQbzrIjWnMoZ6/NHvJ4HieWRscwww8TVLkiSAkvHQVfI+8PjHllhGaSQ
	 gEmeXx4mpCy7RJqZc7vGfoTGoM8zQBbarCRLI6L+KwzNy6ZtJ7gismdFxa69YIGdc47qt
	 SMA36IsByO6z5c6SYR3SOtwDs4iQyYQIL24msUWucXAu8A5NaffqkCxYPMrrGz/94kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AFuOJ60/";
	arc=fail smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9127606A330
	for <oe-linux-nfc@lists.linux.dev>; Sat, 14 Nov 2026 19:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9127606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AFuOJ60/
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ee1b65fdbcso5799705ad.1
        for <oe-linux-nfc@lists.linux.dev>; Sat, 14 Nov 2026 11:03:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794683008; cv=none;
        d=google.com; s=arc-20260327;
        b=qYuBzJUwhKpFo1sfu4sDbmhMZTsY3gI8XqaYx5CbALF1KTRiwoRwbjEwiEjUZDYKim
         Lo4EkKYkDkbnHloZ3GWifONMlzE27isFg4j7DBcEAuEujC8zLyvcgTzRfyWDcshwR6Ju
         2KNLXLM2tqUvf234JKWKrNYbM2EodXkIIw1n4PqNjcJJX9LnPrRc/1a77eioC7y3+yrq
         trYxKA1E2YqPydMbLCiwJqownKQp7pkc1W92bEfgDRm/3cpRd/76s/ZX6ri0zzgx8+nk
         nt7quB44PycRL3XIf9+DQYWD0mzJsJR1PgppZIvz0nAAj8oWgLcp4RBtzqVPonQ2VWOC
         jT2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
        fh=rZYS7EZYi25JH+75cSUo/pTlWAxJSWdgCFijYBgQ2bg=;
        b=IAYbSgNkA3Y2uUS4j0i55EbktZT+O73D9d3tK12I7mhlYjW9XSfJMXxO2q4bpo273S
         RNUEDxFa4xn4RmWpDt1/SspCnQyBUvd2/SiqdTrnSIE0o/nQhJB5dvSBKYOD4ZFy38Or
         06FrxH3HBNX3iKiXJcdG5R1RryCPkoTCz0zPP2goUZKCHKkWb1j5vzHdoCmBgKNdR943
         huy4J6PvFQIIyQGecAO/i9EIiWABomCtyWNJS+TkHnZrPyX32hFJhg1KR0xcQ67kSASF
         IkzFRNmtS8ziRcGgWjNFjfEPt4YNy3Ca8V5pLzOJC+Kk2u55sSRMLxtw861jtTVMqs/U
         W0tQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794683008; x=1795287808; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
        b=AFuOJ60/OMG0Y8YQsfMwtHVzs2pGyUjh4hNKYcNZiDIb909Uirlztimu9TW4yCJiVM
         WnGREyu1otaGO6rbCrw2wI7oHbyPoG7dflHpLUF3JNBRX/Jcvj4ct83zpe+oZj/w22AF
         n00za+/TG1yxLcvFmXfTGQajKzCjB9YymDeCCYTxfBzyfertzKYjvgUqmBmYbG76Nq/O
         1+U+NqkU/RHVUTlPkQJYpb8jQUsPoRz9kzXuWWxXWH/NprQDjX05O9T7AzDevZnNfhAW
         a7UWLXasbcYSfNsaixfYQ48V6xuF6nYSJscMiR/vSvKCe5EYjmMxQASzu86Ut9OS56YH
         bRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794683008; x=1795287808;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
        b=Vki/xaK9eO8xAG04SWXJhMNZOm75tIgT0HkWA28tJAIhgneSkATJY+1DphjVfsY6mH
         X/kOsecx8uBW/825Suyxu7NTi+kXeQAO4gQMJGe88jzjLr2bFq/2+NgWObDiYpy7TGEo
         jjOcgfPMNYoe4KpVy1hZSclJmxd8Hmv76oBEV3iqleipt1xqJQeGdqoGz61J+8IB4mum
         J/CNyy1zJc+zC95aXb2i/OO59g7DmLgmjW0u4m8dx2zin6T0foShb8mm8ElPVzGfApHT
         l2eDj6gZmsy441up3gtDQith9tBDdRVeVONypiYcq2t2qnzOnQd5r5ckjgDWFztkIVza
         KWcg==
X-Forwarded-Encrypted: i=1; AL+hErEtgSuSE8T+m7FX5VhkOTfQNNEYHrX2cSGMlf2YPlo8wmmXcwX4WWMEJRadB3QCpurrOj6LhnX0KF8Iapw=@lists.linux.dev
X-Gm-Message-State: APuU4Z9dGkUY3li0+fiD+rLmrIHGmZIKPD6nmgcR2MKZ65Pb+jSKZ7g2
	6AEzEl/F+iy1hlHc/AB7JFQV8051/bu/squj9dUTpiYg/3IXGhiMNPmvR8mO53daTYKWRmzlt7X
	f2L8eTru6uo60BQ0g7YQmu8yksJrMfOk9xt0X+g==
X-Gm-Gg: AYBFou2+xRICUfWP4qbFDC1YPlRwXoVeUQP8ERo3XN2rZyLI0cOLaEx9U7++K5ZDCyE
	y2e779+LCZN+sbnrGKTjnDhG709Kd3K3ufbm91JuJyZogagcANSUv7nF27yish9OM/MoUHJTNl6
	Fy10ZifZffmQ3ft7brftu3PDGyhK8YeAFElWzYqVJgTCfcQO0KkJW7ZFElhEh3VCPe3ajoJZOIi
	itGJiNY49yJm0odJhxJBhSPug3BWKFvx8QwPiiMUphemTKb/a88tAc65Aq2+brEizvQkEhpsakN
	Ib6V30V93AXFkReV/vpzPzRIE7JVmgSETcPnVspnic3HruEgQyPJN2N0Q9FxbXnukuTRMnwE2ew
	8RedetoZX/QZQ1qVFQGGUgORcgxbU/xgljPzO
X-Received: by 2002:a17:902:fd85:b0:2e9:734c:5025 with SMTP id
 d9443c01a7336-2ee0da98dfdmr60035435ad.21.1794683008249; Sat, 14 Nov 2026
 11:03:28 -0800 (PST)
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112-m52xq-nfc-netdev-v3-0-725a61ce4148@gmail.com>
 <20261112-m52xq-nfc-netdev-v3-2-725a61ce4148@gmail.com> <5b31dcc8-8fc4-40ad-8c09-aad8d77965f0@ixit.cz>
In-Reply-To: <5b31dcc8-8fc4-40ad-8c09-aad8d77965f0@ixit.cz>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Sat, 14 Nov 2026 21:03:16 +0200
X-Gm-Features: AclHuK_Q0fCYoqErL7BMlQPVGQL9gfpYv5yw5VBHiZrfm9MfbMBI5fajd-Czxx4
Message-ID: <CAARotke1QDxr1XAHZhDBtq8nSqXzrbZk8pmdyy7ceK9ObBHNWw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] nfc: s3fwrn5: i2c: Enable the pvdd supply
To: David Heidelberg <david@ixit.cz>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

thanks for looking into this and for the schematics pointer.

I don't have schematics for the Galaxy M52 5G, so I can only go by the
vendor kernel's device tree. Its NFC node describes a single switchable
supply: PVDD, a GPIO-controlled fixed regulator that the vendor driver
turns on before enabling the chip. None of VBAT, AVDD, DVDD, PLLVDD or
TVDD are referenced or controlled there, so on this board they are
presumably fed from always-on rails that the OS never touches.

With only pvdd-supply wired up, the chip probes and reads tags fine on
the M52.

I'd rather not add bindings for supplies I can't verify on real
hardware and that no board would use yet. If a board turns up where
e.g. AVDD/DVDD are switchable, they could be added then as further
optional supplies next to pvdd-supply.

Does that sound OK to you?

Thanks,
Asdlerto
