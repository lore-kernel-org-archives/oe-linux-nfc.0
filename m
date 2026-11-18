Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999914;
	b=2Se9CEIACyi99ANiKsetYzu7ay6uINusVevw7EIpymIXas4kWQtO9tt0OxQkRoGKMf4t
	 5Z95Hg+HyzrjBmAYIq/b4iu3kgsuiAw6atyh1cyfWApiqmkyKl24+Efwy79vH8KqzGmLd
	 PrvlfJCO9wORf9iJBsB9ffhTBAMgB/Qh1yCAFSM4cVCPciqpjqBGmEH5URWjDo2V2v7+i
	 ZMk2rC5SA9ayYIIQVwsF467zfPyv1Nu414Ew1/zhuL+UHMNCUfa43eBhx4G9LdoO1XAAY
	 xa/GUhvSOyPuhtQ+3QLax5Y0aHHvuS9iyU9nGIJihu8BmQmFbl5h4ywlSx2rsHrFA3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999914;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wkNqj/Ri/DMG3jz7yivagroyPuLoigFqxoANJ+MiNn8=;
	b=y2YXXNsOB4g0LqQWSegNiOywCiJF210M8FjQlgx3gFRXesLR5Go+8zTviNnC3RZanWow
	 67zkDoUtxEAuFO/GmO7XjQGEtJwpfar+HlZNkwTdJ1Zzs4U0MfqvJwaL+KRSL+CEPuhzI
	 ClknECgzQkqyI11xLGomd5wcGtrW5O7iLCTLw49wX1fJ+TwPu3ugIgzgb2/pBatqD1tOW
	 +yFgRKjir7i6/SZyBuckgbHidRd4oUnVzLrKC8H37sVUpxBoTIgzLVjBw0Q0DbniVZalk
	 BSVe8oI63Yb+Lr4uV7UmGBu+AdQSxomJmHG/vMOzY+VOt6xnCFsuP9eRzHfF0CVfiWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A/0s5lGD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D30E606A330
	for <oe-linux-nfc@lists.linux.dev>; Wed, 18 Nov 2026 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A/0s5lGD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4104F1F000CB
	for <oe-linux-nfc@lists.linux.dev>; Wed, 18 Nov 2026 11:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794999913;
	bh=wkNqj/Ri/DMG3jz7yivagroyPuLoigFqxoANJ+MiNn8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=A/0s5lGD3drPiYEQ+MclkPga66UkhVReitMXeEUP4eCvJDQvJb5tiOJA9IuXO8ZlE
	 zUWmyaAcuYrt3ZTcId5b3AgG2K4HB6RYJto+HbhBGOubpzVC9guNVB60kg7wnri7et
	 QuRfmWaLmZVovt8gMT82EWCC/nHevSfzB2FU+pgvgRFRa0tyPkTaSKrUbg/pRtQHHC
	 k+BYSR1q0aGPKz2JO86BuiIx820aALcgVCk5q2FgT8kqRRdjZuT72ZfPGSitzsw6WB
	 VpQm8SUjNDI6CheO0nweOT7qUph+tKyL/Wvsqyz0vYxsyuZBkO86iqOCAqty16ftwI
	 nkZJo4E6Ap48Q==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4911df1e196so493994fac.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 18 Nov 2026 03:05:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGhhIxBuO4hxy7XfrqnGqtNldnZX3Apbfsjoh2EY8IRY+eDF6h6MhKK9hL8f2pPnwcpGOx1g0OnKoCp4LU=@lists.linux.dev
X-Gm-Message-State: APuU4Z+PnSm+xcK6uVUYKV+4UtmFF12lpfW3INZE4wnsPDa2rOczkl+D
	rJvWaCH/rrb0KsEb/JXWRqehJs8RhETJAwrzlNiSpA7uarRCCCqV7LnbbVut8clEmt2G2shmZBN
	pGcdozzrSZKocJ5VjzrgNh5C/5tC/CEI=
X-Received: by 2002:a05:6871:a1e3:b0:47b:7709:5568 with SMTP id
 586e51a60fabf-4b75fb23c32mr1749736fac.10.1794999912304; Wed, 18 Nov 2026
 03:05:12 -0800 (PST)
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118083811.1721010-1-bsdhenrymartin@gmail.com>
In-Reply-To: <20261118083811.1721010-1-bsdhenrymartin@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 12:05:01 +0100
X-Gmail-Original-Message-ID: <CAL4Wiir7GS+-0tSH6D49f+xZv6njk+sbc-_E45_qnqgHe6V4TQ@mail.gmail.com>
X-Gm-Features: AclHuK8EU7ooUYtzQK1pnm1__Qtfk6vzERe7RCmUjC-TOgvb6EadwPUWX31HIog
Message-ID: <CAL4Wiir7GS+-0tSH6D49f+xZv6njk+sbc-_E45_qnqgHe6V4TQ@mail.gmail.com>
Subject: Re: [PATCH] nfc: llcp: walk the accept queue under the socket lock
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 09:38, Henry Martin <bsdhenrymartin@gmail.com> =
a =C3=A9crit :
>
> llcp_accept_poll() walks parent->accept_queue and reads each child's
> sk_state without holding the socket lock.  nfc_llcp_accept_dequeue()
> unlinks closed children and drops their creation reference under that
> lock, and the last sock_put() frees the child.
>
> A poll() racing with accept() therefore reads a freed child:
>
>   BUG: KASAN: slab-use-after-free in llcp_sock_poll+0x440/0x4e0
>   Read of size 1 at addr ffff888112387812 by task poc.bin/528
>   Allocated by task 198:
>    nfc_llcp_sock_alloc
>    nfc_llcp_rx_skb
>   Freed by task 529:
>    __sk_destruct
>    nfc_llcp_accept_dequeue
>
> Take the listener lock around the accept queue walk.
>
> This issue was discovered by Tencent CodeBuddy Security.
>
> Fixes: d646960f7986 ("NFC: Initial LLCP support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  net/nfc/llcp_sock.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>

Next time, please specify the target tree in the subject ([PATCH net]).

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Also, make sure to wait a least 24 hours between versions (
Documentation/process/maintainer-netdev.rst )
