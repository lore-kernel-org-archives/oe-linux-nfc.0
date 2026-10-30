Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380969;
	b=QyyVypxjoZimbcaGWdjw5fAla+/7AzhEPMwm+Ys3Dh0kj6IRa8wqIOJx/zXSJ1hnsFcM
	 M5UstKyV9CxkbcUkSWf/ndTswvCBkBbUOccOw0Ec/gbFm5bo2CBHy/d038fx/QNLlwxCh
	 c24n/2dKk6Y0KdBrnJv0hbfQ0HQasWbLdMpIgXG8d/9MMlBRKAUZllGwf7YHFhkgvggJT
	 IDZ6S8u1igbhRHZIZqXs4S9MrbcwkgG8U2tb9+1tePD5Nz6qYyaVQsc7tF8BON/KUj3NK
	 ixIswCwRB63eX4/Tqsd0WMFkq1dz9Ad+0mDmuyBWD6iGDO+LtrnKo0ThpFwKLdhEp3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=uJzytUwk23ovgU9TbV1PYDO56P/aKAkqKpMgUmlpTZI=;
	b=4aeKglHmNwinbvkEJsKu2xFnijf7g6LLZ8alzSF8iuacdWjRBSYZEBNVU0IN6enaPuRW
	 bvpk7Mv2O3GNcFmNL2fQwFUVL0sHt5tGv/zd3NJq6tzVnJu9pjzOQr3IECZ3wgd9x5chv
	 Jgez1bauL7jZPfDjOYTkTNtnQwWI5R8PXmlcY0maN8GdGMjrcfSbhY/djmty0aerIA6MN
	 VQk0nmZ5LZJ7IAa6Rz3ukNFYWiBVfDtrDrreBl7OwrOIxKLzepTnAzAlgniHhV7hCPwQd
	 OMUg3EIOQdVWBuWPJert80a6u+PoaCJjJJ5j7DCGnB5E7LyCU7rRRpXfwIX2OLQddag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ekEcweb7;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6D7606A31D
	for <oe-linux-nfc@lists.linux.dev>; Fri, 30 Oct 2026 17:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B6D7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ekEcweb7
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so933664e0c.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 30 Oct 2026 10:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793380963; x=1793985763; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uJzytUwk23ovgU9TbV1PYDO56P/aKAkqKpMgUmlpTZI=;
        b=ekEcweb7NjHtUm1JLuezcLfY0It90TJkci/AxqyRll4Uh1zr9Dqm1Zsr87CwyrgMCk
         /wqQCLV6xdqMy8PctTbN97YNJg8tykfn83iyNZ0xNGb2G83lshjRWJfVck9XrWcZW+l2
         QQIYBBx0jHNIttW2bytdAbmIRqB5gFpv98CIAQ9F5gF27LYccAEQrekwhZS+2TgnrD0H
         +JV7TPaBTRIAL9D/EGDsQFe9dGAp/PwnwqwKsnYBjfVqigg7hX6o1jHT0ZPfVuuo1Je5
         VA7GUmVGXuqTtE7m+oH4xIIf6F0TjRaBbHx47xzpE/HxKj4WjQhm+kxZrCF1uCh/ekam
         yWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380963; x=1793985763;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJzytUwk23ovgU9TbV1PYDO56P/aKAkqKpMgUmlpTZI=;
        b=V9vvGs9iBGK0K25CqEYp0rG/DOU/i7bulwKeinJbh0kKK/Bg0MwS2aSWv6AVwmUmIh
         qxpG4DPXMdlex9vdwsGkZQyLRvcRsQkZQEg20GP9WFL34ZzDVpZjQu60AJEUjyv7PPg7
         J+AXOTV8GVdhqq4DoOjfTJ5a9nDG0SPBsFVAAF49sKZ2bR3xcJ3O/blxvXdfyK4chw8K
         c3V4JF4d7XdXPsoxgAg9aVzOWSXu7azsJ6bcyiWHpSDgCH4543NH63THXDVLS+mFhOpy
         tPk+t9+fKZqL72Jxo7bpQUOwOIXdWzBzAwbelnk6uBlx+AWrg/Ic9bwuc+QAukWZz8N4
         ZQCw==
X-Forwarded-Encrypted: i=1; AKwUvBxbH0VskUbVLK9YrbEyz/ecIY2uKjYDtONlW0J3UwP4ozG3c6b9NBZ5n+r0Dvplp7udXrsynCJOn5NW5oQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYIJNN5ohZRwYBmQABxO1TQ4SZ/cYAZ9+F/FWtpAiRYWtqe3cmi8
	Zw3QZd+GNsoGRp+7olxC8+jDV8R/cdPH5SCmbkd9Eacyom+tkLf0zj1K
X-Gm-Gg: AYBFou2YOVEfA7BKJFa5XkDMNZL6kOH5lWWzm70muAhBG4LM40Uq8BuAgtaeFEdEGBu
	ThcaogwZiR/0JTyHOKRx3kq+5YWiSgO2Flf9Kv5DEYTji1eoQVBKXhV4ALzGEXN6M9jlfM5UqM1
	0wCHsenq8FLPhKvdphEGM5oV2yJ0JBYAraFhDQ9KLB4gcSRhn+Spa8Scs2dDjoiK/zbgNsvjql5
	rJT8JDk5nBif8Ucffh+syvCpv9ISukeMIoqxJ7+wAC0ET0tY2iQH1tvaNVJzf3x0Sxaq4zjGu6c
	5q4f1HwQhj+FlSrl88GY8mkRacVERqAukte7FlVQ4f5eJJczuULWpBB3CIR9miGHHqL6rvBexzy
	iyJgAX8/ovqJwSvUiWRr1XvkUqbawwjqO3+3x6J92iz0FLob63gn8BcLFO3ILl5Ky9rzgWsRj0a
	gv/bYYIzaq37EVd9iK9DBP53irXVxM4IESBxn62tJNbB1UjrjNYZg8lYF0dmll/Im58/2kCmrJy
	XwliqmgUpK91wiHjdaAXcd7fBHc2kS1E9lM6Md1/PeBpFNFfBDhGEyuBWAqdbUJ8Uyndjukfksq
	wCmR47qrwbLIKqKqhmPKSnayB4EzpRCPS2oDGFMEkTCjK7zr4xZxUVoWv1CRN+lhPkNOGk20Ip/
	AS3KDzLcdR6K5GsE8yUebpggFAUVRF/KwrANubrqCX+XWxo04CAp/aq8NCnRwf9QeqVGq28HtzH
	zYNZjNUMkNOeEm1AbI3g==
X-Received: by 2002:a05:6122:1d53:b0:5ce:b65d:22c4 with SMTP id 71dfb90a1353d-5ec6896b8b6mr1733742e0c.16.1793380962808;
        Fri, 30 Oct 2026 10:22:42 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2804:18:15f:b9ba:756b:b70a:a34a:8232])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69c99e3csm3005317e0c.15.2026.10.30.10.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:22:42 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: David Heidelberg <david@ixit.cz>, Krzysztof Kozlowski <krzk@kernel.org>,
 David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] nfc: s3fwrn5: validate the firmware image size
 against the firmware file
Date: Fri, 30 Oct 2026 14:22:26 -0300
Message-ID: <179338094618.65825.9271330213423582924@gmail.com>
In-Reply-To: <179332821053.3327.2621510890857714130@kernel.org>
References: <179332800288.52644.4206885352837613064@gmail.com>
 <179332821053.3327.2621510890857714130@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

This was found by LLM-assisted code review, as part of an audit of the
NFC drivers that are only reachable with real hardware (and so are not
exercised by syzbot).  It was then confirmed with KASAN on arm64 QEMU,
using a test-only module that registers s3fwrn5 through s3fwrn5_probe()
on a virtual phy and a userspace emulator of the controller's NCI and
bootloader protocols, as described below the --- of the patch.  It was
not hit in production or on hardware.
