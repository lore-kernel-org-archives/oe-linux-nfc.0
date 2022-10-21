Received: from je.b8.nz (je.b8.nz [85.119.82.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D681628E7
	for <oe-linux-nfc@lists.linux.dev>; Fri, 21 Oct 2022 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=je.b8.nz;
	 s=li; h=Date:Subject:To:From:mime-version:in-reply-to:references;
	bh=bmfy7zLA4Nh+JuB0ATMLTc6Fn1FoECAmVYX6iZcS8jE=; b=F8lAVPVXmDN00/0cMpZqU7gwF3
	Pz+IPn3RU254IReOrO4G2KYq0Ewd30uIFW3krvWrUmRBzcnMkIPEfTyk21v/b+JpvAOHYu+kO0TFx
	uuGeVAXfkia1ISLWDaO8hlyDaajh/V4ExWeWCa20htWY04Ny9rek/7Yu9jP0tuOIy01iMIDa1XvPk
	XZklFvW/CN1nLMDYeht4E9UnzsrbpAsnq7ABjNdXhBaqm1XivcVnrnvf53OlZ3FtIEBbpfCcWW3fQ
	mXYniTivhZRn2CI/6VsnQsN0o5ugQeVTyMVeNHueTY2g9J5HlBh7/c5rEp/jtfGqbem06lypKtDqE
	wAnDFjfw==;
Received: from root by je.b8.nz with local (Exim 4.93)
	(envelope-from <testignore@je.b8.nz>)
	id 1olspf-000IER-9m
	for oe-linux-nfc@lists.linux.dev; Fri, 21 Oct 2022 10:17:07 -0400
From: testignore@je.b8.nz
To: oe-linux-nfc@lists.linux.dev
Subject: test post. ignore
Message-Id: <E1olspf-000IER-9m@je.b8.nz>
Date: Fri, 21 Oct 2022 10:17:07 -0400
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>

If you see this, the test worked.
