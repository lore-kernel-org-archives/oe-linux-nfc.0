Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E7D2773DE
	for <oe-linux-nfc@lists.linux.dev>; Sat, 30 May 2026 18:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165581; cv=none; b=DKUfua0xEe3dKl7uB7B7AAqZuldFIR0IUtRq2x5ujeYo0lhJqUD/A/qOnOOP2x9haYS8mcRyXzfKL7AsMLRMf/ZePwBCPa6Tupw7k7v9EPZynjRWIZrWxV2CTmrLJ3h1rnC6I/FVzp/900pyrFRBkpBMXWc0nBfzps2JLIffeTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165581; c=relaxed/simple;
	bh=aUtFp0L0Qs77rAxqrlsG/L0Ka5rgfU2HsbpxrJxfUNc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BZbduAJat0Ckr1RTtOm4WCUPlDzLmb3NBFyvrjcC3QGKhv+KA7J0wIot3r+WqWdlsePGSlgw/pmsdfyhlZHqHSttMsQnWkV8bvOOXdVRZSAcz6r0eYhcekx7iG20KqGV4pSjPoG7/pyyhBD36eVnhf4q+84QRZbXMIq/O7gNGig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=FrstgC/p; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="FrstgC/p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1780165570; x=1780424770;
	bh=aUtFp0L0Qs77rAxqrlsG/L0Ka5rgfU2HsbpxrJxfUNc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FrstgC/p4rqYvT345FyO30sNVKqAdbzMjkuciJgcadr4DZJ14uVTQBpGIXKfUSvbU
	 xvgIDdiQ3lTXb8xyyDKl30cRy6KyetaHvQI4Fka3wP9+5/jKZgNPCHTqkq44rm4fBv
	 inqfIEfsgbm2B24bSrQhgqIbJpOvJk4HDrCK5xOUqFIlwRiSeiZq4J/RWjEj6ABJOA
	 7gKdrofj8cQMSCl9srPU29U5KDXeCuqnyh+m2zgg7fT/NM+i186nLT+qCmPMo+bmKb
	 BXdc7RJuonu6aCq6ckUW9lCSEpnBbOfKiJ0rnh1JBo1LJ43yF3h+tM5upDdqAKAzQH
	 O3dal/hVjE0eQ==
Date: Sat, 30 May 2026 18:26:07 +0000
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
From: Cyber_black <Cyberblackk@proton.me>
Cc: "security@kernel.org" <security@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "david+nfc@ixit.cz" <david+nfc@ixit.cz>, "oe-linux-nfc@lists.linux.dev" <oe-linux-nfc@lists.linux.dev>, "davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, "w@1wt.eu" <w@1wt.eu>
Subject: [SECURITY] net/nfc/llcp_sock.c: unsafe userspace sockaddr handling
Message-ID: <PYXMRVOSKGaZwZAeXC2PScmTBrZhHXwgdSapPlE030ObXXtRedDcbPD2lx6-3lzLWqr3aB2Kf9eAbDig3HuXn2gw3cSaZhqUA5U9HrSVhC8=@proton.me>
Feedback-ID: 117998405:user:proton
X-Pm-Message-ID: fc392576e843686a1536da83690ac91251953ec2
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



Greg, please disregard my previous report.

After testing with a POC (which returned -EFAULT, no crash) and reviewing t=
he
call chain (__sys_bind =E2=86=92 move_addr_to_kernel), I confirm that the s=
ockaddr
pointer passed to llcp_sock_bind() already points to kernel memory.

Thus there is no security issue. My apologies for the noise.

Signed-off-by: Eneshan Erdogan Karaca <cyberblackk@proton.me>
