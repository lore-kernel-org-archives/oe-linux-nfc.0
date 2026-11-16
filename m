Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794789080;
	b=on9BfdR0eiOfdnxAeTT+T/u6nzHJqkNZNsMj1QFBbhjVHxI7ahrBvFPgnx5GSii8UkUH
	 DCIOkzbezMV89288Pi7sG/SGtMuxbh04vbOfv2O2fWHq4AGHpDyytV3pLT5GLQkycdVyd
	 mGHOFKSXfTvzED8QOK6NtROMzEZwgJ2MbVgdygbdWtFKUUyHp3wMIp4K66Z3jLZmk1kcT
	 KR5GIKPrDeMLV4W3T5jGEYNRRAIHU/FXyl9+XmxN0yGWUAejMK/hJGi8hkuDVEy77Zr5j
	 bLIipASLnpHteC/VVez54X7UXHkgQOT0fXPFqqLPYQ1DWa3BYBTfV30dB3N2CCt24yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794789080;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bHhnhvINNj6Bh3hfCB0d0sBnW9XQ7ZsU2yDvXj/6pto=;
	b=hPvV3xTLdWDgDKkL9N27X4WGLc6pCfqMMVYYYUErERmINWbFchbUhO79EuhHJXbAlcI7
	 LIRQyYzWUPA3Nc0Vvi+6N0BPogRowKkSb35pWMbBe+LEKqReJGmtcKDIJtalTDvzcp+Xz
	 zQh9PY9ec6uE3ZM0ygkA08CecQ++Zz1U94LB3TzVooRYTyNhE4pVLLk7atc923dB4cYhl
	 Nr7mjQptftYN24LER+OF+hbcq8oZ8e+vylUqz4VGCekS/yXaRDNeTVQXZXfanNnxFh27f
	 KKEuxiU9pRrTBvtq0qC/pnReXkH8wAY8MMl6QD7wxJNrrqLq12JbH/5NDfjhajvKpeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=O69UVlOC;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D908B606A33A
	for <oe-linux-nfc@lists.linux.dev>; Mon, 16 Nov 2026 00:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D908B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=O69UVlOC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=O69UVlOCon86wBY4M9fkikHhMEBrksjRiT6jvv9nWXXfoUN3XodzmlJT+/Aas48FMAunj8HufNytq
	 ANSqobRGAKBA/pMPmuCp0lt75Oq4CMQfUhbyYfQ2qlfV9sqPSE+3LLRmU5xyKjMlQVLsXS5YSx8V1n
	 Dv8K06gGO7GEpAXk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96afa4ed3802-fdebc;
	Mon, 16 Nov 2026 08:31:18 +0800 (CST)
X-RM-TRANSID:2ee96afa4ed3802-fdebc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.90] (unknown[112.23.105.246])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46afa4ed510f-75151;
	Mon, 16 Nov 2026 08:31:18 +0800 (CST)
X-RM-TRANSID:2ee46afa4ed510f-75151
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
    oe-linux-nfc@lists.linux.dev
Subject: Re: [PATCH net-next] NFC: digital: fix target leak after Type 1 Tag discovery
Date: Mon, 16 Nov 2026 00:30:45 +0000
Message-ID: <1794789045128.4536.20054313275013163148.nfc-t1t-v2-reply@cmss.chinamobile.com>
In-Reply-To: <20261113103426.GK18859@horms.kernel.org>
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
Content-Transfer-Encoding: 7bit

Thanks, Simon.

v2 is here, with the release on the exit path and the comment you
suggested:

  https://lore.kernel.org/netdev/1794705795184.22628.49502335540847234602.nfc-t1t-v2@cmss.chinamobile.com/


