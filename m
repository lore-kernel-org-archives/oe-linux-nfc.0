Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E20D426ED3
	for <oe-linux-nfc@lists.linux.dev>; Fri, 24 Jul 2026 10:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888794; cv=none; b=EeUXUFyv9KVrVasqOqLFjLIq2ShF9MS5IUkPCUMifTz0QmmEMVibaHENUYBQXORtv4CZ3M8Q0QrNNt/syIrBI0OyZhk9XoFDjuGHYFYAfYzo042iNDeqlw2lcO8zkZXhxHcXOPCm6tEyKpqRtFP/M3OWT35U2F0DKdhk5zSJ6l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888794; c=relaxed/simple;
	bh=awpLRR+YszJQvQudLBbT/OEOkQj9iMQ1fV+8CLaO95o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nl2aQyDRKo0oBuYxjNmI53a3j2x6RpuA+D31TPcV+JDAV4VBV/rpEy4N8rdJD6nJdL11yO/oAqtZy1TtyFeY33YlYT0ryz2qmOJ/NZFYsQhFpOVpoUhIB/sAT2WgrOf1BGcTZ74qaxD5zotUGjmd4OtWKymHQolUKGb51PTgRGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=FM2lY12K; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="FM2lY12K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1784888775; x=1785147975;
	bh=awpLRR+YszJQvQudLBbT/OEOkQj9iMQ1fV+8CLaO95o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FM2lY12KXKG/nnwY57iqtxg/JxaGdadS+EBaOgpbUerSY9dI/amfdZGwwtq6ceqrc
	 XTGWW7LoiqlZczVYlpmypsSwx6AkuVWePJwUQeKx5knTmJwMbs74A/OGh8XQL5ONfj
	 U2Y8TdhIIOyFbOIf25pIrccbreLvLguVwG6grPxtxnHzwmaMrCdDWA+6ipVZ++YHhm
	 Ly2BRRvuhw6Bq+HAf2/XbFdMAC9g6Wk9JAYflnDLXMhGpW+HR4LGOlPQ+f4gbS4nXL
	 EgJ0kKEyUZgGEehlgvjMiVoYrBDO8MGUjbUNDT+auBXHRi6GM99egyq1AiLxMLpN7I
	 xxivlBa3W/ihA==
Date: Fri, 24 Jul 2026 10:26:10 +0000
To: Doruk Tan Ozturk <doruk@0sec.ai>
From: Bryam Vargas <hexlabsecurity@proton.me>
Cc: David Heidelberg <david@ixit.cz>, Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev
Subject: Re: [PATCH net] nfc: fdp: bound the device-supplied read size in fdp_nci_i2c_read()
Message-ID: <20260724102605.16377-1-hexlabsecurity@proton.me>
In-Reply-To: <20260720132133.69635-1-doruk@0sec.ai>
References: <20260720132133.69635-1-doruk@0sec.ai>
Feedback-ID: 199661219:user:proton
X-Pm-Message-ID: 5b7769c12398a39e35ffae565d668a4eb80ba1a8
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Doruk,

That's generous of you. We landed on the same missing bound;
your patch is a clean fix for the overflow itself. I'll repost my v2 as
v3 rebased on current net so David has something current to pick up -- it
keeps the lower-bound reject (len < FDP_NCI_I2C_MIN_PAYLOAD, the one Simon
flagged) and the skb leak fix in the same loop.

I'll Cc you on the v3.

Thanks,
Bryam

